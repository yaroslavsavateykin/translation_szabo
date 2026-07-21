#import "@preview/cetz:0.5.2"

#let Slater-ground-state() = {
  cetz.canvas({
    import cetz.draw: *

    // Настройка базовых стилей
    let line-stroke = (thickness: 1.5pt, paint: black)
    let bracket-stroke = (thickness: 1.5pt, paint: black)
    let arrow-stroke = (thickness: 2pt, paint: black)
    let mark-style = (end: ">", scale: 0.7)

    // ==========================================
    // ВЕРХНЯЯ ЧАСТЬ: Виртуальные спин-орбитали
    // ==========================================

    // Уровень chi_2K
    line((x: 6, y: 15), (x: 10, y: 15), stroke: line-stroke)
    content((x: 10.3, y: 15), [$chi_(2K)$], anchor: "west")

    // Троеточие под chi_2K
    content((x: 8, y: 14), text(size: 2em)[$dots.v$])

    // Уровни chi_s и chi_r
    line((x: 6, y: 13), (x: 10, y: 13), stroke: line-stroke)
    content((x: 10.3, y: 13), [$chi_s$], anchor: "west")

    line((x: 6, y: 12), (x: 10, y: 12), stroke: line-stroke)
    content((x: 10.3, y: 12), [$chi_r$], anchor: "west")

    // Троеточие под chi_r
    content((x: 8, y: 11), text(size: 2em)[$dots.v$])

    // Уровень chi_N+1
    line((x: 6, y: 10), (x: 10, y: 10), stroke: line-stroke)
    content((x: 10.3, y: 10), [$chi_(N+1)$], anchor: "west")

    // Левая квадратная скобка для виртуальных орбиталей
    line((x: 4.5, y: 15), (x: 4, y: 15), stroke: bracket-stroke)
    line((x: 4, y: 15), (x: 4, y: 10), stroke: bracket-stroke)
    line((x: 4, y: 10), (x: 4.5, y: 10), stroke: bracket-stroke)

    // Подпись слева от скобки
    content(
      (x: 3.5, y: 14),
      align(center)[виртуальные\ спин-орбитали],
      anchor: "east",
    )

    // РАЗДЕЛИТЕЛЬНАЯ СИНУСОИДА
    // ==========================================
    let start-x = 4.0
    let end-x = 11.0
    let base-y = 9.1
    let amplitude = 0.15 // Высота гребней
    let frequency = 15 // Количество полных волн (гребней)
    let steps = 200 // Гладкость линии

    // Генерируем массив точек для синусоиды
    let wave-points = ()
    for i in range(0, steps + 1) {
      let t = i / steps
      let x = start-x + t * (end-x - start-x)
      let y = (
        base-y + amplitude * calc.sin(2 * calc.pi * frequency * t)
      )
      wave-points.push((x, y))
    }

    // Отрисовываем синусоиду как единую плавную линию
    line(..wave-points, stroke: (thickness: 0.35em, paint: black))

    // ==========================================
    // НИЖНЯЯ ЧАСТЬ: Занятые спин-орбитали
    // ==========================================

    // Уровень chi_N со стрелкой
    line((x: 6, y: 8), (x: 10, y: 8), stroke: line-stroke)
    content((x: 10.3, y: 8), [$chi_N$], anchor: "west")
    line(
      (x: 8, y: 7.55),
      (x: 8, y: 8.55),
      stroke: arrow-stroke,
      mark: mark-style,
    )

    // Троеточие под chi_N
    content((x: 8, y: 7), text(size: 24pt)[$dots.v$])

    // Уровни chi_b и chi_a со стрелками
    line((x: 6, y: 6), (x: 10, y: 6), stroke: line-stroke)
    content((x: 10.3, y: 6), [$chi_b$], anchor: "west")
    line(
      (x: 8, y: 5.6),
      (x: 8, y: 6.5),
      stroke: arrow-stroke,
      mark: mark-style,
    )

    line((x: 6, y: 5), (x: 10, y: 5), stroke: line-stroke)
    content((x: 10.3, y: 5), [$chi_a$], anchor: "west")
    line(
      (x: 8, y: 4.55),
      (x: 8, y: 5.45),
      stroke: arrow-stroke,
      mark: mark-style,
    )

    // Троеточие под chi_a
    content((x: 8, y: 4), text(size: 2em)[$dots.v$])

    // Уровни chi_2 и chi_1 со стрелками
    line((x: 6, y: 3), (x: 10, y: 3), stroke: line-stroke)
    content((x: 10.3, y: 3), [$chi_2$], anchor: "west")
    line(
      (x: 8, y: 2.6),
      (x: 8, y: 3.5),
      stroke: arrow-stroke,
      mark: mark-style,
    )

    line((x: 6, y: 2), (x: 10, y: 2), stroke: line-stroke)
    content((x: 10.3, y: 2), [$chi_1$], anchor: "west")
    line(
      (x: 8, y: 1.55),
      (x: 8, y: 2.45),
      stroke: arrow-stroke,
      mark: mark-style,
    )

    // Левая квадратная скобка для занятых орбиталей
    line((x: 4.5, y: 8), (x: 4, y: 8), stroke: bracket-stroke)
    line((x: 4, y: 8), (x: 4, y: 2), stroke: bracket-stroke)
    line((x: 4, y: 2), (x: 4.5, y: 2), stroke: bracket-stroke)

    // Подпись слева от скобки
    content(
      (x: 3.5, y: 6),
      align(center)[занятые\ спин-орбитали],
      anchor: "east",
    )
  })
}
