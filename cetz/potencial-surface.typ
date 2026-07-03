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

      // Кривая поверхности потенциальной энергии:
      // резкий спуск от отталкивания на малых расстояниях,
      // минимум (равновесная конфигурация), пологий подъём
      // и выход на асимптотическое плато.
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