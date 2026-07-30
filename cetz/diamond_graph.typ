#import "@preview/cetz:0.5.2"

// Ромбовидная диаграмма с двумя внутренними "крыльями" (2*/3*) и
// пунктирной перемычкой i*—i в центре, воспроизведённая по исходному рисунку.
// Использование после импорта:
//   #import "diamond_graph.typ": diamond-graph
//   #diamond-graph()
#let diamond-graph(
  unit: 0.8cm,
  line-width: 1.4pt,
  label-size: 12pt,
  sign-size: 12pt,
  gap: 0.24,
  outer-gap: 0.06,
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
      content: (padding: 0pt),
    )

    // ----------------------------------------------------------------------
    // Вершины.
    // ----------------------------------------------------------------------
    let L = (0.00, 0.00) // левая вершина, i
    let T1 = (1.30, 1.30) // внутренняя верхняя, 2*
    let T2 = (2.60, 2.60) // внешняя верхняя, 3*
    let C = (2.60, 0.00) // центральная, i*
    let B1 = (1.30, -1.30) // внутренняя нижняя, 3*
    let B2 = (2.60, -2.60) // внешняя нижняя, 2*
    let R = (5.20, 0.00) // правая вершина, i

    // Точка на отрезке a→b на доле t от a (используется, чтобы оставить
    // небольшой зазор перед вершинами под подписи).
    let along(a, b, t) = (
      a.at(0) + (b.at(0) - a.at(0)) * t,
      a.at(1) + (b.at(1) - a.at(1)) * t,
    )

    // ----------------------------------------------------------------------
    // Рёбра.
    // ----------------------------------------------------------------------
    line(along(L, T1, gap), along(T1, L, gap)) // L–2*,   +
    line(along(T1, T2, gap), along(T2, T1, gap)) // 2*–3*,  -
    line(along(T1, C, gap), along(C, T1, gap)) // 2*–i*,  -
    line(along(L, B1, gap), along(B1, L, gap)) // L–3*,   -
    line(along(B1, C, gap), along(C, B1, gap)) // 3*–i*,  -
    line(along(B1, B2, gap), along(B2, B1, gap)) // 3*–2*,  -
    line(along(T2, R, outer-gap), along(R, T2, outer-gap)) // 3*–R,   -
    line(along(B2, R, outer-gap), along(R, B2, outer-gap)) // 2*–R,   +

    // Пунктирная перемычка в центре.
    line(along(C, R, gap), along(R, C, gap), stroke: dashed-stroke)

    // ----------------------------------------------------------------------
    // Подписи вершин.
    // ----------------------------------------------------------------------
    content(L, label($ i $))
    content(T1, label($ 2^* $))
    content(T2, label($ 3^* $))
    content(C, label($ i^* $))
    content(B1, label($ 3^* $))
    content(B2, label($ 2^* $))
    content(R, label($ i $))

    // ----------------------------------------------------------------------
    // Знаки при рёбрах.
    // ----------------------------------------------------------------------
    content((0.40, 0.90), sign($ + $))
    content((1.70, 2.20), sign($ - $))
    content((2.16, 0.86), sign($ - $))
    content((0.40, -0.90), sign($ - $))
    content((2.16, -0.86), sign($ - $))
    content((1.70, -2.20), sign($ - $))
    content((4.28, 1.32), sign($ - $))
    content((4.28, -1.32), sign($ + $))
  },
)
