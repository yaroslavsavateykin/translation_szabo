#let book-template(body) = [
  // проверка на используемую версию компилятора.
  // пока ограничимся таким и не будем жестко запариваться над окружением
  #let manifest = toml("/typst.toml")
  #let compiler-components = (
    manifest.package.compiler.split(".").map(int)
  )
  #let required-compiler = version(..compiler-components)
  #assert(
    sys.version == required-compiler,
    message: "Для сборки проекта требуется Typst "
      + manifest.package.compiler
      + " или новее. Установлена версия "
      + str(sys.version)
      + ".",
  )

  #set document(title: "Квантовая химия")


  #set text(
    lang: "ru",
    font: "New Computer Modern",
    size: 12pt,
  )

  #set page(
    paper: "a4",
    margin: (
      left: 2cm,
      right: 2cm,
      top: 2cm,
      bottom: 2cm,
    ),
    numbering: "1",
  )

  #set par(
    justify: true,
    leading: 0.65em,
    first-line-indent: 1.2em,
  )

  #set heading(numbering: "1.1.")

  // Номер уравнения имеет вид:
  // (номер главы.номер уравнения)
  #let equation-numbering = n => context {
    let chapter = counter(heading).get().first()

    numbering(
      "(1.1)",
      chapter,
      n,
    )
  }

  #set math.equation(
    numbering: equation-numbering,
  )

  // При начале главы первого уровня
  // обнуляем счётчик уравнений.
  #show heading.where(level: 1): heading => {
    counter(math.equation).update(0)
    heading
  }

  // Уравнения без меток не нумеруются
  // и не увеличивают счётчик.
  #show math.equation: equation => {
    if (
      equation.block
        and not equation.has("label")
        and equation.numbering != none
    ) {
      counter(math.equation).update(
        number => calc.max(number - 1, 0),
      )

      math.equation(
        equation.body,
        block: true,
        numbering: none,
      )
    } else {
      equation
    }
  }

  // Настройка отображения ссылок.
  #show ref: reference => {
    let element = reference.element

    if (
      element != none and element.func() == math.equation
    ) {
      // Показываем только номер уравнения:
      // (1.1), (1.2), (2.1) и так далее.
      //
      // at: element.location() необходим,
      // чтобы номер главы вычислялся в месте
      // расположения уравнения, а не ссылки.
      link(
        element.location(),
        counter(math.equation).display(
          element.numbering,
          at: element.location(),
        ),
      )
    } else if (
      element != none and element.func() == figure
    ) {
      let number = counter(
        figure.where(kind: element.kind),
      ).display(
        element.numbering,
        at: element.location(),
      )

      // Обычная ссылка:
      // @fig:name → рис. 1
      //
      // Ссылка со склонением:
      // @fig:name[рисунке] → рисунке 1
      let prefix = if reference.supplement == auto {
        if element.kind == "task" {
          element.supplement
        } else if element.kind == table {
          [табл.]
        } else {
          [рис.]
        }
      } else if reference.supplement == none {
        none
      } else if type(reference.supplement) == function {
        reference.supplement(element)
      } else {
        reference.supplement
      }

      if prefix == none {
        link(
          element.location(),
          number,
        )
      } else {
        link(
          element.location(),
          prefix + sym.space.nobreak + number,
        )
      }
    } else {
      reference
    }
  }

  // Весь документ вставляется внутрь области,
  // где действуют расположенные выше правила.
  #body
]
