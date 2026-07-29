#import "@preview/cetz:0.5.2"
#let transition-graph(
  unit: 0.86cm,
  line-width: 0.82pt,
  label-size: 11pt,
  arrow-scale: 0.78,
) = cetz.canvas(
  length: unit,
  {
    import cetz.draw: *

    let solid-stroke = (
      paint: black,
      thickness: line-width,
      cap: "round",
      join: "round",
    )

    let dashed-stroke = (
      paint: black,
      thickness: line-width,
      cap: "butt",
      dash: "dashed",
    )

    let label(body) = [
      #set text(size: label-size, weight: "semibold")
      #body
    ]

    set-style(
      stroke: solid-stroke,
      mark: (
        fill: black,
        scale: arrow-scale,
      ),
      content: (padding: 0pt),
    )

    
    content((0.00, 0), label($ i $))
    line((0.42, 0), (1.46, 0), mark: (end: "stealth"))

    content((1.86, 0), label($ j^* $))
    line((2.30, 0), (3.34, 0), mark: (end: "stealth"))

    content((3.76, 0), label($ k^* $))
    line((4.20, 0), (5.24, 0), mark: (end: "stealth"))

    content((5.66, 0), label($ i $))

    line(
      (7.10, 0),
      (8.42, 0),
      mark: (start: "stealth", end: "stealth"),
    )


    
    line((10.28, 0.22), (11.34, 1.39))
    line((11.99, 2.03), (12.90, 3.03))
    line((11.99, 1.39), (12.90, 0.29))

    line((10.28, -0.22), (11.34, -1.39))
    line((11.99, -2.03), (12.90, -3.03))
    line((11.99, -1.39), (12.90, -0.29))

    line((13.52, 3.07), (16.22, 0.29), stroke: dashed-stroke)
    line((13.52, 0.00), (16.18, 0.00), stroke: dashed-stroke)
    line((13.52, -3.07), (16.22, -0.29), stroke: dashed-stroke)


    content((10.10, 0.00), label($ i $))
    content((11.67, 1.72), label($ (i + 1)^* $))
    content((13.22, 3.36), label($ (i + 2)^* $))
    content((13.22, 0.00), label($ i^* $))
    content((11.67, -1.72), label($ (i - 1)^* $))
    content((13.22, -3.36), label($ (i - 2)^* $))
    content((16.52, 0.00), label($ i $))


    // Знаки при рёбрах (с увеличенным отступом от линий).
    content(
    (10.45, 1.18),
    box(fill: white, inset: 1.5pt)[#label($+$)],
)
    content(
  (11.55, 2.70),
  box(fill: white, inset: 1.5pt)[#label($-$)],
)
    content(
  (12.70, 1.08),
  box(fill: white, inset: 1.5pt)[#label($-$)],
)
    content(
  (10.45, -1.18),
  box(fill: white, inset: 1.5pt)[#label($-$)],
)
    content(
  (11.55, -2.70),
  box(fill: white, inset: 1.5pt)[#label($-$)],
)
    content(
  (12.70, -1.08),
  box(fill: white, inset: 1.5pt)[#label($-$)],
)
    content(
  (14.95, 0.42),
  box(fill: white, inset: 1.5pt)[#label($-$)],
)
  },
)