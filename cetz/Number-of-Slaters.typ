#import "@preview/cetz:0.5.2"

#let Number-of-Slaters() = {
  // Сохраняем обычный Typst rotate до импорта cetz.draw: *
  let text-rotate = rotate

  cetz.canvas({
    import cetz.draw: *

    let p(x, y) = (x, y)

    // Стиль осей, стрелок и меток
    let axis-stroke = (thickness: 1.2pt, paint: black)
    let arrow-stroke = (thickness: 1.5pt, paint: black)
    let tick-stroke = (thickness: 1pt, paint: black)
    let mark-style = (end: ">", scale: 0.8)

    // ==========================================
    // 1. ОСИ КООРДИНАТ И ЗАСЕЧКИ
    // ==========================================

    // Ось Y и ось X
    line(p(2, 1), p(2, 11), stroke: axis-stroke)
    line(p(2, 1), p(13, 1), stroke: axis-stroke)

    // Засечки на оси Y
    let y-positions = (3, 5, 7, 9, 11)
    let y-labels = ("10", "20", "30", "40", "50")

    for (i, y) in y-positions.enumerate() {
      line(p(1.8, y), p(2, y), stroke: tick-stroke)
      content(
        p(1.6, y),
        text(size: 9pt)[#y-labels.at(i)],
        anchor: "east",
      )
    }

    // Засечки на оси X
    let x-positions = (4, 6, 8, 10, 12)
    let x-labels = ("1", "10", "100", "1000", "10000")

    for (i, x) in x-positions.enumerate() {
      line(p(x, 1), p(x, 1.2), stroke: tick-stroke)
      content(
        p(x, 0.6),
        text(size: 9pt)[#x-labels.at(i)],
        anchor: "north",
      )
    }

    // ==========================================
    // 2. НАЗВАНИЯ ОСЕЙ
    // ==========================================

    // Название оси X
    content(
      p(7.5, -0.2),
      [Число детерминантов Слейтера $binom(2 K, N)$],
      anchor: "north",
    )

    // Название оси Y
    content(
      p(-0.5, 6),
      text-rotate(90deg)[
        Число пространственных базисных функций $K$
      ],
      anchor: "center",
    )

    // ==========================================
    // 3. СТРЕЛКИ И ТЕКСТ НА ГРАФИКЕ
    // ==========================================

    // Стрелка «Предел Хартри — Фока»
    line(
      p(4, 6),
      p(4, 11),
      stroke: arrow-stroke,
      mark: mark-style,
    )

    content(
      p(4, 11.3),
      align(center)[
        Предел\
        Хартри—Фока
      ],
      anchor: "south",
    )

    // Стрелка «Полное КВ»
    line(
      p(6, 6.5),
      p(12, 6.5),
      stroke: arrow-stroke,
      mark: mark-style,
    )

    content(
      p(12.2, 6.5),
      [Полное КВ],
      anchor: "west",
    )

    // Стрелка «Точный результат»
    line(
      p(6, 8.0),
      p(10.5, 11.2),
      stroke: arrow-stroke,
      mark: mark-style,
    )

    content(
      p(10.5, 11.4),
      [Точный результат],
      anchor: "south",
    )
  })
}

#align(center)[
  #Number-of-Slaters()
]
