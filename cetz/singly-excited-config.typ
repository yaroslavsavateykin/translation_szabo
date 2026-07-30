#import "@preview/cetz:0.5.2"

// Диаграмма трёх орбитальных уровней с указанным заполнением электронами:
// уровень 1 (снизу) — один электрон со спином вниз,
// уровень 2 (в центре) — два электрона (спин вверх и вниз),
// уровень 3 (сверху) — один электрон со спином вниз.
#let singly-excited-config() = {
  cetz.canvas({
    import cetz.draw: *

    let font-size = 13pt
    let line-stroke = 1.5pt
    let level-length = 1.1

    // Пара электронов (спин вверх + спин вниз), локально линия на y = 1.0.
    let draw_pair(x) = {
      // Спин вверх
      line((x - 0.1, 0.7), (x - 0.1, 1.3), stroke: 1pt)
      line((x - 0.1, 1.3), (x - 0.22, 1.13), stroke: 1pt)
      line((x - 0.1, 1.3), (x + 0.02, 1.13), stroke: 1pt)

      // Спин вниз
      line((x + 0.1, 1.3), (x + 0.1, 0.7), stroke: 1pt)
      line((x + 0.1, 0.7), (x + 0.22, 0.87), stroke: 1pt)
      line((x + 0.1, 0.7), (x - 0.02, 0.87), stroke: 1pt)
    }

    // Одиночный электрон со спином вниз, по центру линии.
    let draw_down(x) = {
      line((x, 0.7), (x, 1.3), stroke: 1pt)
      line((x, 0.7), (x - 0.12, 0.87), stroke: 1pt)
      line((x, 0.7), (x + 0.12, 0.87), stroke: 1pt)
    }

    // Один энергетический уровень: линия, подпись справа, заполнение.
    let level(x-start, y-pos, label, kind: "none") = {
      line(
        (x-start, y-pos),
        (x-start + level-length, y-pos),
        stroke: line-stroke,
      )

      content(
        (x-start + level-length + 0.3, y-pos),
        text(size: font-size)[#label],
        anchor: "west",
      )

      let cx = x-start + level-length / 2
      if kind == "pair" {
        group({
          translate((0, y-pos - 1.0))
          draw_pair(cx)
        })
      } else if kind == "down" {
        group({
          translate((0, y-pos - 1.0))
          draw_down(cx)
        })
      }
    }

    // Уровни снизу вверх.
    level(0.0, 1.1, $1$, kind: "down")
    level(0.0, 2.5, $2$, kind: "pair")
    level(0.0, 4.0, $3$, kind: "down")
  })
}

// Пример использования вместе с обозначением слэтеровского детерминанта:
//
// #grid(
//   columns: 2,
//   align: (right + horizon, left + horizon),
//   column-gutter: 0.5em,
//   $ |overline(psi)_1 psi_2 overline(psi)_2 overline(psi)_3 angle.r med equiv $,
//   singly-excited-config(),
// )
