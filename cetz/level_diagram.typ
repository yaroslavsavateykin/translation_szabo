#import "@preview/cetz:0.5.2"

// Диаграмма уровней: N независимых двухуровневых систем (уровень 2_i
// сверху, уровень 1_i снизу), с общими энергиями ε_2 (верхний уровень)
// и ε_1 (нижний уровень), воспроизведена по исходному рисунку.
// Стиль (толщина линий, шрифт) согласован с остальными файлами серии.
// Использование после импорта:
//   #import "level_diagram.typ": level-diagram
//   #level-diagram()
#let level-diagram(
  unit: 0.9cm,
  line-width: 1.4pt,
  label-size: 13pt,
  bar-width: 0.9,
) = cetz.canvas(
  length: unit,
  {
    import cetz.draw: *

    let bar-stroke = (
      paint: black,
      thickness: line-width,
      cap: "round",
    )

    let label(body) = [
      #set text(size: label-size, weight: "semibold")
      #body
    ]

    set-style(content: (padding: 0pt))

    // Позиции столбцов: сайты 1, 2, 3, затем "…", затем сайт N.
    let xs = (0.0, 1.3, 2.6, 3.9, 5.2)
    let site-labels = ("1", "2", "3", none, "N")

    let y-upper = 0.6
    let y-lower = -0.6
    let hw = bar-width / 2

    for i in range(0, xs.len()) {
      let x = xs.at(i)
      let idx = site-labels.at(i)

      if idx == none {
        // Многоточие между 3-м и N-м сайтами.
        content((x, y-upper), label($ dots.h $))
        content((x, y-lower), label($ dots.h $))
      } else {
        // Верхний уровень: подпись 2_i над чертой.
        content((x, y-upper + 0.38), label($ 2_#idx $))
        line((x - hw, y-upper), (x + hw, y-upper), stroke: bar-stroke)

        // Нижний уровень: подпись 1_i над чертой.
        content((x, y-lower + 0.38), label($ 1_#idx $))
        line((x - hw, y-lower), (x + hw, y-lower), stroke: bar-stroke)
      }
    }

    // Подписи энергий справа: ε_2 (верхний уровень), ε_1 (нижний уровень).
    let x-eps = xs.at(xs.len() - 1) + 0.9
    content((x-eps, y-upper), label($ epsilon_2 $))
    content((x-eps, y-lower), label($ epsilon_1 $))
  },
)
