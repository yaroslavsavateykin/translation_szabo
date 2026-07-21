// ============================================================================
// в settings.typ есть правило переноса на другую страницу
#let task-kind = "task"

#let task-counter = counter(
  figure.where(kind: task-kind),
)

#let task-numbering(number) = context {
  let chapter = counter(heading).get().first()

  numbering(
    "1.1",
    chapter,
    number,
  )
}

#let reset-task-counter(heading-body) = [
  #task-counter.update(0)
  #heading-body
]

#let task(
  body,
  breakable: true,
) = figure(
  block(
    width: 100%,
    breakable: breakable,

    inset: (
      left: 1em,
      right: 0.8em,
      top: 0.65em,
      bottom: 0.65em,
    ),

    stroke: (
      left: 2.5pt + rgb("#3d5a80"),
      right: none,
      top: none,
      bottom: none,
    ),

    radius: 0pt,
    fill: rgb("#f6f8fb"),
    above: 0.8em,
    below: 0.8em,
  )[
    #context {
      set align(left)

      set par(
        justify: true,
        first-line-indent: 0pt,
      )

      let number = task-counter.display(
        task-numbering,
      )

      [
        *Задача #number.*

        #body
      ]
    }
  ],

  kind: task-kind,
  supplement: [задача],
  numbering: task-numbering,
  caption: none,
  outlined: false,
)

// ============================================================================

#let placeholder(body) = box(
  fill: rgb(240, 120, 120),
  // stroke: (
  //   left: 3pt + rgb(220, 20, 60),
  // ),
  inset: 3pt,
)[
  #body
]

// ============================================================================
#let theorem-kind = "theorem"

#let theorem(
  body,
  name: none,
  breakable: true,
) = figure(
  block(
    width: 100%,
    breakable: breakable,

    inset: (
      left: 1em,
      right: 0.8em,
      top: 0.65em,
      bottom: 0.65em,
    ),

    stroke: (
      left: 2.5pt + rgb("#ee6c4d"),
      right: none,
      top: none,
      bottom: none,
    ),

    radius: 0pt,
    fill: rgb("#fdf3f0").transparentize(30%),
    above: 0.8em,
    below: 0.8em,
  )[
    #set align(left)

    #set par(
      justify: true,
      first-line-indent: 0pt,
    )

    #body
  ],

  kind: theorem-kind,
  supplement: [теорема],
  numbering: none,
  caption: none,
  outlined: false,
)

// ============================================================================
// Блоки приложений
// На каждый новый appendix создаётся отдельный номер: А, Б, В, ...
// Ссылка:
//
//   #appendix[... ] <appendix:tables>
//
//   См. @appendix:tables.
//
// В тексте получится: «См. приложение А».
// ============================================================================

#let appendix-kind = "appendix"

#let appendix-counter = counter(
  figure.where(kind: appendix-kind),
)

// Русские буквы для нумерации приложений.
// Ё, З, Й, О, Ч, Ь, Ы, Ъ обычно в нумерации приложений не используют.
#let appendix-letters = (
  "А",
  "Б",
  "В",
  "Г",
  "Д",
  "Е",
  "Ж",
  "И",
  "К",
  "Л",
  "М",
  "Н",
  "П",
  "Р",
  "С",
  "Т",
  "У",
  "Ф",
  "Х",
  "Ц",
  "Ш",
  "Щ",
  "Э",
  "Ю",
  "Я",
)

#let appendix-numbering(number) = {
  let index = number - 1

  if index < appendix-letters.len() {
    appendix-letters.at(index)
  } else {
    // Запасной вариант, если приложений больше, чем букв в списке.
    str(number)
  }
}

#let appendix(
  body,
  title: none,
  breakable: true,
) = figure(
  block(
    width: 100%,
    breakable: breakable,

    inset: (
      left: 1em,
      right: 1em,
      top: 0.8em,
      bottom: 0.8em,
    ),

    stroke: (
      left: 2.5pt + rgb("#6b5b95"),
      right: none,
      top: none,
      bottom: none,
    ),

    radius: 0pt,
    fill: rgb("#f8f6fb"),
    above: 1em,
    below: 1em,
  )[
    #context {
      set align(left)

      set par(
        justify: true,
        first-line-indent: 0pt,
      )

      let number = appendix-counter.display(
        appendix-numbering,
      )

      // Заголовок приложения.
      [
        #text(
          weight: "bold",
          fill: rgb("#4f416f"),
        )[
          #text(
            size: 1.3em,
          )[Приложение #number]
        ]

        #if title != none {
          text(
            weight: "semibold",
            size: 1.5em,
            title,
          )
        }

        #body
      ]
    }
  ],

  kind: appendix-kind,
  supplement: [приложение],
  numbering: appendix-numbering,
  caption: none,
  outlined: false,
)
