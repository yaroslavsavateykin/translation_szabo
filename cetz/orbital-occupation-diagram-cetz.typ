#import "@preview/cetz:0.5.2"

// Диаграмма занятости α- и β-орбиталей.
// Стрелки построены вручную и проходят через линии уровней.
#let orbital-occupation-diagram(
  length: 0.68cm,
) = {
  cetz.canvas(
    length: length,
    padding: 0.14,
    {
      import cetz.draw: *

      let level-stroke = (
        paint: black,
        thickness: 1.00pt,
        cap: "round",
      )

      let arrow-stroke = (
        paint: black,
        thickness: 0.82pt,
        cap: "round",
        join: "round",
      )

      let alpha-left = 1.00
      let alpha-right = 4.55
      let alpha-center = (alpha-left + alpha-right) / 2

      let beta-left = 7.00
      let beta-right = 10.55
      let beta-center = (beta-left + beta-right) / 2

      let sigma-bottom = 1.15
      let sigma-step = 0.86
      let sigma-levels = range(4).map(
        i => sigma-bottom + sigma-step * i,
      )
      let sigma-top = sigma-levels.last()

      let pi-level = sigma-top + 0.92
      let virtual-level = pi-level + 0.88

      let dot-levels = (
        virtual-level + 0.46,
        virtual-level + 0.76,
        virtual-level + 1.06,
      )

      let draw-level(x-left, x-right, y) = {
        line(
          (x-left, y),
          (x-right, y),
          stroke: level-stroke,
        )
      }

      let spin-up(x, y) = {
        let y-bottom = y - 0.12
        let y-top = y + 0.6
        let head-dx = 0.10
        let head-dy = 0.17

        line(
          (x, y-bottom),
          (x, y-top),
          stroke: arrow-stroke,
        )
        line(
          (x, y-top),
          (x - head-dx, y-top - head-dy),
          stroke: arrow-stroke,
        )
        line(
          (x, y-top),
          (x + head-dx, y-top - head-dy),
          stroke: arrow-stroke,
        )
      }

      let spin-down(x, y) = {
        let y-top = y + 0.6
        let y-bottom = y - 0.12
        let head-dx = 0.10
        let head-dy = 0.17

        line(
          (x, y-top),
          (x, y-bottom),
          stroke: arrow-stroke,
        )
        line(
          (x, y-bottom),
          (x - head-dx, y-bottom + head-dy),
          stroke: arrow-stroke,
        )
        line(
          (x, y-bottom),
          (x + head-dx, y-bottom + head-dy),
          stroke: arrow-stroke,
        )
      }

      // Четыре σ-уровня.
      for y in sigma-levels {
        draw-level(alpha-left, alpha-right, y)
        draw-level(beta-left, beta-right, y)

        spin-up(alpha-center, y - 0.28)
        spin-down(beta-center, y - 0.28)
      }

      // π-уровень: занят только в α-наборе.
      draw-level(alpha-left, alpha-right, pi-level)
      draw-level(beta-left, beta-right, pi-level)
      spin-up(alpha-center, pi-level - 0.28)

      // Первый незанятый уровень.
      draw-level(alpha-left, alpha-right, virtual-level)
      draw-level(beta-left, beta-right, virtual-level)

      // Многоточия продолжения спектра.
      for y in dot-levels {
        circle(
          (alpha-center, y),
          radius: 0.040,
          fill: black,
          stroke: none,
        )
        circle(
          (beta-center, y),
          radius: 0.040,
          fill: black,
          stroke: none,
        )
      }

      // Подпись π.
      content(
        (alpha-left - 0.47, pi-level),
        anchor: "east",
        [#text(
          size: 11pt,
          style: "normal",
        )[$pi$]],
      )

      let sigma-mid = (sigma-bottom + sigma-top) / 2

      // Настоящие математические глифы фигурных скобок.
      content(
        (alpha-left - 0.43, sigma-mid - 0.14),
        anchor: "center",
        [$stretch(brace.l, size: #4.60em)$],
      )

      content(
        (alpha-left - 0.88, sigma-mid),
        anchor: "east",
        [$sigma$],
      )

      content(
        (beta-right + 0.43, sigma-mid - 0.14),
        anchor: "center",
        [$stretch(brace.r, size: #4.60em)$],
      )

      content(
        (beta-right + 0.88, sigma-mid),
        anchor: "west",
        [$sigma$],
      )
    },
  )
}
