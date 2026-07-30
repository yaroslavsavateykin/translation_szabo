#import "@preview/cetz:0.5.2"

// Схема переходов, воспроизведённая по исходному рисунку.
// Стиль (толщина линий, шрифт, подложка под подписями) согласован с diamond_graph.typ.
// Использование после импорта:
//   #import "transition_graph.typ": transition-graph
//   #transition-graph()
#let transition-graph(
  unit: 0.86cm,
  line-width: 1.4pt,
  label-size: 12pt,
  sign-size: 12pt,
  arrow-scale: 1.0,
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

    let label(body) = box(
      fill: white,
      inset: 2pt,
      radius: 1pt,
    )[
      #set text(size: label-size, weight: "semibold")
      #body
    ]

    let sign(body) = [
      #set text(size: sign-size, weight: "semibold")
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

    // ----------------------------------------------------------------------
    // Левая последовательность: i → j* → k* → i
    // ----------------------------------------------------------------------
    content((0.00, 0), label($ i $))
    line((0.42, 0), (1.46, 0), mark: (end: "stealth"))

    content((1.86, 0), label($ j^* $))
    line((2.30, 0), (3.34, 0), mark: (end: "stealth"))

    content((3.76, 0), label($ k^* $))
    line((4.20, 0), (5.24, 0), mark: (end: "stealth"))

    content((5.66, 0), label($ i $))

    // Двусторонняя стрелка между последовательностью и разветвлённой схемой.
    line(
      (7.10, 0),
      (8.42, 0),
      mark: (start: "stealth", end: "stealth"),
    )

    // ----------------------------------------------------------------------
    // Правая разветвлённая схема
    // ----------------------------------------------------------------------

    // Сплошные рёбра верхней ветви и верхней половины ромба.
    line((10.28, 0.22), (11.34, 1.39))
    line((11.99, 2.03), (12.90, 3.03))
    line((11.99, 1.39), (12.90, 0.29))

    // Сплошные рёбра нижней ветви и нижней половины ромба.
    line((10.28, -0.22), (11.34, -1.39))
    line((11.99, -2.03), (12.90, -3.03))
    line((11.99, -1.39), (12.90, -0.29))

    // Пунктирные рёбра, сходящиеся в правой вершине.
    line((13.52, 3.07), (16.22, 0.29), stroke: dashed-stroke)
    line((13.52, 0.00), (16.18, 0.00), stroke: dashed-stroke)
    line((13.52, -3.07), (16.22, -0.29), stroke: dashed-stroke)

    // Вершины.
    content((10.10, 0.00), label($ i $))
    content((11.67, 1.72), label($ (i + 1)^* $))
    content((13.22, 3.36), label($ (i + 2)^* $))
    content((13.22, 0.00), label($ i^* $))
    content((11.67, -1.72), label($ (i - 1)^* $))
    content((13.22, -3.36), label($ (i - 2)^* $))
    content((16.52, 0.00), label($ i $))

    // Знаки при рёбрах.
    content((10.58, 0.95), sign($ + $))
    content((12.77, 2.48), sign($ - $))
    content((12.70, 0.96), sign($ - $))

    content((10.58, -0.95), sign($ - $))
    content((12.77, -2.48), sign($ - $))
    content((12.70, -0.96), sign($ - $))

    content((14.93, 0.28), sign($ - $))
  },
)
