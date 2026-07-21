#import "@preview/cetz:0.5.2"


#let plot-width = 600
#let plot-height = 560
#let left-x = 82.5
#let right-x = 545.0
#let top-y = 32.5
#let bottom-y = 517.5
#let axis-y = 156.127

// Координаты CeTZ направлены вверх, поэтому экранная координата y инвертируется.
#let cy(y) = plot-height - y

#let map-x(x) = left-x + (x - 0.4) / (4.0 - 0.4) * (right-x - left-x)
#let map-y(y) = cy(
  top-y + (0.065 - y) / (0.065 - (-0.19)) * (bottom-y - top-y),
)

#let generate-smooth-points(data, steps-per-segment: 36) = {
  let n = data.len()
  if n < 2 { return data }

  let pts = ()
  for i in range(0, n - 1) {
    let p0 = data.at(calc.max(0, i - 1))
    let p1 = data.at(i)
    let p2 = data.at(i + 1)
    let p3 = data.at(calc.min(n - 1, i + 2))

    for j in range(0, steps-per-segment) {
      let t = j / steps-per-segment
      let t2 = t * t
      let t3 = t2 * t

      let x = (
        0.5
          * (
            2 * p1.at(0)
              + (-p0.at(0) + p2.at(0)) * t
              + (
                2 * p0.at(0) - 5 * p1.at(0) + 4 * p2.at(0) - p3.at(0)
              )
                * t2
              + (-p0.at(0) + 3 * p1.at(0) - 3 * p2.at(0) + p3.at(0)) * t3
          )
      )
      let y = (
        0.5
          * (
            2 * p1.at(1)
              + (-p0.at(1) + p2.at(1)) * t
              + (
                2 * p0.at(1) - 5 * p1.at(1) + 4 * p2.at(1) - p3.at(1)
              )
                * t2
              + (-p0.at(1) + 3 * p1.at(1) - 3 * p2.at(1) + p3.at(1)) * t3
          )
      )
      pts.push((map-x(x), map-y(y)))
    }
  }

  let last = data.last()
  pts.push((map-x(last.at(0)), map-y(last.at(1))))
  pts
}
#let rhf-data = (
  (0.72, 0.066),
  (0.79, 0.02),
  (0.88, -0.04),
  (1, -0.09),
  (1.14, -0.12),
  (1.3, -0.133),
  (1.42, -0.136),
  (1.57, -0.13),
  (1.76, -0.112),
  (1.98, -0.086),
  (2.18, -0.06),
  (2.34, -0.043),
  (2.48, -0.031),
  (2.62, -0.02),
  (2.78, -0.004),
  (2.96, 0.014),
  (3.18, 0.036),
  (3.43, 0.06),
)

#let uhf-data = (
  (0.72, 0.066),
  (0.79, 0.02),
  (0.88, -0.04),
  (1, -0.09),
  (1.14, -0.12),
  (1.3, -0.133),
  (1.42, -0.136),
  (1.57, -0.13),
  (1.76, -0.112),
  (1.98, -0.086),
  (2.18, -0.06),
  (2.34, -0.043),
  (2.5, -0.034),
  (2.68, -0.027),
  (2.88, -0.021),
  (3.12, -0.015),
  (3.42, -0.009),
  (3.72, -0.005),
  (4, -0.003),
)

#let exact-data = (
  (0.72, 0.06),
  (0.8, 0.01),
  (0.9, -0.065),
  (1, -0.115),
  (1.14, -0.154),
  (1.28, -0.171),
  (1.42, -0.176),
  (1.58, -0.17),
  (1.78, -0.151),
  (2, -0.128),
  (2.22, -0.107),
  (2.48, -0.085),
  (2.76, -0.065),
  (3.02, -0.051),
  (3.38, -0.035),
  (4, -0.019),
)

#let x-ticks = (
  (0.6, "0.6"),
  (1, "1.0"),
  (1.4, "1.4"),
  (1.8, "1.8"),
  (2.2, "2.2"),
  (2.6, "2.6"),
  (3, "3.0"),
  (3.4, "3.4"),
)

#let y-ticks = (
  (0.06, "0.06"),
  (0.04, "0.04"),
  (0.02, "0.02"),
  (0, "0.00"),
  (-0.02, "-0.02"),
  (-0.04, "-0.04"),
  (-0.06, "-0.06"),
  (-0.08, "-0.08"),
  (-0.1, "-0.10"),
  (-0.12, "-0.12"),
  (-0.14, "-0.14"),
  (-0.16, "-0.16"),
  (-0.18, "-0.18"),
)

#let h2-potential-curves-6-31g() = {
  let y-label = rotate(
    -90deg,
    origin: center,
    reflow: false,
    box(width: 260pt, align(center, [$E("H"_2) - 2 E("H")$, а. е.])),
  )

  cetz.canvas(
    padding: (
      left: -300,
    ),
    length: 0.4pt,
    {
      import cetz.draw: *

      // Фиксирует размер холста 600 × 560 pt.
      rect(
        (0, 0),
        (plot-width, plot-height),
        fill: white,
        stroke: none,
      )

      let axis-stroke = 1pt + black
      let tick-stroke = 1pt + black
      let label-stroke = 1pt + black
      let arrow-style = (end: "stealth", scale: 0.72, fill: black)
      let double-arrow-style = (
        start: "stealth",
        end: "stealth",
        scale: 0.58,
        fill: black,
      )

      // Оси.
      line(
        (left-x, cy(top-y)),
        (left-x, cy(bottom-y)),
        stroke: axis-stroke,
      )
      line(
        (left-x, cy(axis-y)),
        (right-x, cy(axis-y)),
        stroke: axis-stroke,
      )

      // Деления и подписи горизонтальной оси.
      for tick in x-ticks {
        let x = map-x(tick.at(0))
        line(
          (x, cy(axis-y)),
          (x, cy(axis-y - 9)),
          stroke: tick-stroke,
        )
        content(
          (x, cy(axis-y - 24)),
          text(size: 12pt)[#tick.at(1)],
          anchor: "center",
        )
      }

      // Деления и подписи вертикальной оси.
      for tick in y-ticks {
        let y = map-y(tick.at(0))
        line((left-x, y), (left-x + 10, y), stroke: tick-stroke)
        content(
          (left-x - 12, y),
          text(size: 12pt)[#tick.at(1)],
          anchor: "east",
        )
      }

      // Подписи осей.
      content(
        (right-x + 2, cy(axis-y - 50)),
        text(size: 12pt)[$R$ (а. е.)],
        anchor: "east",
      )
      content(
        (-20, cy((top-y + bottom-y) / 2)),
        y-label,
        anchor: "center",
      )

      // Кривые. Сначала RHF и точная, затем UHF поверх общего участка RHF/UHF.
      line(
        ..generate-smooth-points(rhf-data),
        stroke: (
          thickness: 1.5pt,
          paint: black,
          dash: (1pt, 5.8pt),
          cap: "round",
          join: "round",
        ),
      )
      line(
        ..generate-smooth-points(exact-data),
        stroke: (
          thickness: 1pt,
          paint: black,
          dash: (8pt, 5pt),
          cap: "round",
          join: "round",
        ),
      )
      line(
        ..generate-smooth-points(uhf-data),
        stroke: (
          thickness: 1.5pt,
          paint: black,
          cap: "round",
          join: "round",
        ),
      )

      // Схема межъядерного расстояния H—H.
      circle(
        (172.542, cy(194.167)),
        radius: 15,
        fill: white,
        stroke: 1.55pt + black,
      )
      circle(
        (254.542, cy(194.167)),
        radius: 15,
        fill: white,
        stroke: 1.55pt + black,
      )
      line(
        (167.542, cy(194.167)),
        (260.542, cy(194.167)),
        stroke: 1.15pt + black,
        mark: double-arrow-style,
      )
      content((213.542, cy(174.167)), [$R$], anchor: "center")

      // Выноски.
      content((280.319, cy(178.951)), [RHF], anchor: "west")
      line(
        (310.167, cy(193.559)),
        (340.417, cy(203.676)),
        stroke: label-stroke,
        mark: arrow-style,
      )

      content((360.681, cy(240.500)), [UHF], anchor: "west")
      line(
        (401.111, cy(220.794)),
        (371.562, cy(213.186)),
        stroke: label-stroke,
        mark: arrow-style,
      )

      content(
        (250.806, cy(500.971)),
        stack(
          dir: ttb,
          spacing: 1.5pt,
          align(center)[Точная кривая\ (Колос—Вольневич)],
        ),
        anchor: "north-west",
      )
      line(
        (400.236, cy(500.265)),
        (400.403, cy(285.049)),
        stroke: label-stroke,
        mark: arrow-style,
      )
    },
  )
}

#h2-potential-curves-6-31g()
