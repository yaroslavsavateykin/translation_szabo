#import "@preview/cetz:0.5.2"

#let potencial-surface = {
  cetz.canvas(
    length: 0.8cm,
    {
      import cetz.draw: *

      let O = (0, 0)

      let x-end = (9.5, 0)
      let y-end = (0, 7.2)

      let axis-stroke = (
        paint: black,
        thickness: 0.75pt,
        cap: "round",
      )
      let curve-stroke = (
        paint: black,
        thickness: 1.1pt,
        cap: "round",
      )
      let dashed-stroke = (
        paint: gray,
        thickness: 0.5pt,
        dash: "dashed",
      )
      let axis-arrow = (
        end: "stealth",
        fill: black,
        stroke: black,
        length: 0.22,
        width: 0.14,
        inset: 0.04,
        transform-shape: false,
      )

      // Оси E_tot и {R_A}.
      line(O, y-end, stroke: axis-stroke, mark: axis-arrow)
      line(O, x-end, stroke: axis-stroke, mark: axis-arrow)

      content((-0.35, 5.3), $ E_"tot" ({R_A}) $, anchor: "east")
      content((9.65, -0.05), $ {R_A} $, anchor: "west")

      let min-pt = (3.1, 1.55)
      let asym-y = 4.15

      // Асимптотический уровень энергии при R_A -> infinity.
      line((0, asym-y + 0.1), (9.3, asym-y + 0.1), stroke: dashed-stroke)

      // Вертикальная пунктирная линия к равновесному расстоянию R_0.
      line((min-pt.at(0), 0), min-pt, stroke: dashed-stroke)

      // Стрелка, показывающая глубину потенциальной ямы D_e.
      line(
        (min-pt.at(0), min-pt.at(1)),
        (min-pt.at(0), asym-y+0.1),
        stroke: (paint: black, thickness: 0.6pt),
        mark: (start: "stealth", end: "stealth", fill: black, length: 0.14, width: 0.09),
      )
      content((min-pt.at(0) + 0.3, (min-pt.at(1) + asym-y) / 2), $ D_e $, anchor: "west")

      // Отметка равновесной точки.
      circle(min-pt, radius: 0.06, fill: black, stroke: none)
      content((min-pt.at(0), -0.5), $ R_0 $, anchor: "north")

      // Кривая поверхности потенциальной энергии.
      hobby(
        (1.0, 8.0),
        (1.35, 4.6),
        (2.05, 2.15),
        (3.1, 1.55),
        (4.15, 2.35),
        (5.5, 3.55),
        (7.2, 4.05),
        (9.3, 4.15),
        stroke: curve-stroke,
      )
    },
  )
}

#potencial-surface