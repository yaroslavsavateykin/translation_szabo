#import "@preview/cetz:0.5.2"

// Набор из семи мини-диаграмм (a)-(g), показывающих разные варианты
// заполнения двух орбитальных уровней (1 — нижний, 2 — верхний)
// электронами с разными спинами.
#let two-level-configs(length: 0.5cm) = {
  cetz.canvas(
    length: length,
    {
      import cetz.draw: *

      let font-size = 11pt
      let line-stroke = 0.6pt
      let level-length = 2.3
      let gap = 1.55
      let y-bottom = 1.0
      let y-top = 2.2

      // Базовые стрелки, локально привязанные к линии на y = 1.0.
      let arrow_up(x) = {
        line((x, 0.7), (x, 1.3), stroke: 0.7pt)
        line((x, 1.3), (x - 0.12, 1.13), stroke: 0.7pt)
        line((x, 1.3), (x + 0.12, 1.13), stroke: 0.7pt)
      }
      let arrow_down(x) = {
        line((x, 1.3), (x, 0.7), stroke: 1.2pt)
        line((x, 0.7), (x - 0.12, 0.87), stroke: 0.7pt)
        line((x, 0.7), (x + 0.12, 0.87), stroke: 0.7pt)
      }

      // Заполнение уровня: "up", "down", "pair" или "none".
      let fill(kind, cx) = {
        if kind == "up" {
          arrow_up(cx)
        } else if kind == "down" {
          arrow_down(cx)
        } else if kind == "pair" {
          arrow_up(cx - 0.1)
          arrow_down(cx + 0.1)
        }
      }

      // Одна мини-диаграмма из двух уровней.
      let diagram(
        x-start,
        top-kind,
        bottom-kind,
        letter,
        show-left: false,
        show-right: false,
      ) = {
        let cx = x-start + level-length / 2

        line((x-start, y-top), (x-start + level-length, y-top), stroke: line-stroke)
        line((x-start, y-bottom), (x-start + level-length, y-bottom), stroke: line-stroke)

        group({
          translate((0, y-top - 1.0))
          fill(top-kind, cx)
        })
        group({
          translate((0, y-bottom - 1.0))
          fill(bottom-kind, cx)
        })

        if show-left {
          content((x-start - 0.15, y-top), text(size: font-size)[2], anchor: "east")
          content((x-start - 0.15, y-bottom), text(size: font-size)[1], anchor: "east")
        }
        if show-right {
          content((x-start + level-length + 0.15, y-top), text(size: font-size)[2], anchor: "west")
          content((x-start + level-length + 0.15, y-bottom), text(size: font-size)[1], anchor: "west")
        }

        content((cx, y-bottom - 0.9), text(size: font-size)[#letter], anchor: "north")
      }

      // Раскладка семи диаграмм слева направо.
      let x = 0.5
      diagram(x, "up", "up", "(a)", show-left: true)
      x = x + level-length + gap

      diagram(x, "up", "down", "(b)")
      x = x + level-length + gap

      diagram(x, "none", "pair", "(c)")
      x = x + level-length + gap

      diagram(x, "pair", "none", "(d)")
      x = x + level-length + gap

      diagram(x, "up", "pair", "(e)")
      x = x + level-length + gap

      diagram(x, "pair", "up", "(f)")
      x = x + level-length + gap

      diagram(x, "pair", "pair", "(g)", show-right: true)
    },
  )
}
