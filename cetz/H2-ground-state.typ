#import "@preview/cetz:0.5.2"

#let H2-ground-state() = {
  cetz.canvas({
    import cetz.draw: *

    let p(x, y) = (x, y)

    let axis-stroke = (thickness: 1.6pt, paint: black)
    let grid-stroke = (thickness: 0.7pt, paint: luma(180))
    let border-stroke = (thickness: 1.2pt, paint: black)
    let point-stroke = (thickness: 1pt, paint: black)
    let mark-style = (end: ">", scale: 0.75)

    let x0 = 0.0
    let y0 = 0.0
    let cell = 0.9

    let cols = 8
    let rows = 6

    let x-max = x0 + cols * cell
    let y-max = y0 + rows * cell

    // Оси
    line(
      p(x0, y0),
      p(x-max + 0.65, y0),
      stroke: axis-stroke,
      mark: mark-style,
    )

    line(
      p(x0, y0),
      p(x0, y-max + 0.65),
      stroke: axis-stroke,
      mark: mark-style,
    )

    content(
      p(x-max / 2, -0.9),
      align(center)[
        Число электронов $N$
      ],
      anchor: "center",
    )

    content(
      p(-1.45, y-max / 2),
      align(center)[
        Число пространственных\
        базисных функций $K$
      ],
      anchor: "center",
    )

    content(p(x-max + 0.95, y0), [$N$], anchor: "west")
    content(p(x0, y-max + 0.95), [$K$], anchor: "south")

    // Сетка
    for i in range(0, cols + 1) {
      let x = x0 + i * cell

      line(
        p(x, y0),
        p(x, y-max),
        stroke: grid-stroke,
      )
    }

    for j in range(0, rows + 1) {
      let y = y0 + j * cell

      line(
        p(x0, y),
        p(x-max, y),
        stroke: grid-stroke,
      )
    }

    // Рамка
    line(p(x0, y0), p(x-max, y0), stroke: border-stroke)
    line(p(x-max, y0), p(x-max, y-max), stroke: border-stroke)
    line(p(x-max, y-max), p(x0, y-max), stroke: border-stroke)
    line(p(x0, y-max), p(x0, y0), stroke: border-stroke)

    // Подписи по оси N
    for i in range(1, cols + 1) {
      let x = x0 + (i - 0.5) * cell

      content(
        p(x, -0.35),
        text(size: 8pt)[#i],
        anchor: "center",
      )
    }

    // Подписи по оси K
    for j in range(1, rows + 1) {
      let y = y0 + (j - 0.5) * cell

      content(
        p(-0.35, y),
        text(size: 8pt)[#j],
        anchor: "center",
      )
    }

    // Область допустимых детерминантов:
    // N электронов можно разместить по 2K спин-орбиталям,
    // если N <= 2K.
    for j in range(1, rows + 1) {
      let k = j

      for i in range(1, cols + 1) {
        let n = i

        if n <= 2 * k {
          let x = x0 + (i - 0.5) * cell
          let y = y0 + (j - 0.5) * cell

          circle(
            p(x, y),
            radius: 0.09,
            stroke: point-stroke,
            fill: black,
          )
        }
      }
    }

    // Граница N = 2K.
    line(
      p(x0, y0),
      p(cols * cell, cols / 2 * cell),
      stroke: (
        thickness: 1pt,
        paint: black,
        dash: "dashed",
      ),
    )

    content(
      p(cols * cell + 0.25, cols / 2 * cell),
      [$N = 2 K$],
      anchor: "west",
    )

    // Формула
    content(
      p(x-max / 2, y-max + 1.25),
      align(center)[
        Число слейтеровских детерминантов:
        $C(2 K, N)$
      ],
      anchor: "center",
    )

    content(
      p(x-max / 2, y-max + 0.7),
      align(center)[
        где $2 K$ — число спин-орбиталей,\
        а $N$ — число электронов.
      ],
      anchor: "center",
    )
  })
}

#align(center)[
  #H2-ground-state()
]
