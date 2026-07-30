#import "@preview/cetz:0.5.2"

// Шестиугольная диаграмма с чередующимися рёбрами:
// сплошные рёбра подписаны β₁, точечные — β₂.
// Использование после импорта:
//   #import "hexagon_graph.typ": hexagon-graph
//   #hexagon-graph()
#let hexagon-graph(
  radius: 3.0,
  unit: 0.7cm,
  line-width: 1.6pt,
  label-size: 12pt,
  label-gap: 0.55,
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

    let dotted-stroke = (
      paint: black,
      thickness: line-width,
      cap: "round",
      dash: "dotted",
    )

    let label(body) = [
      #set text(size: label-size, style: "italic", weight: "semibold")
      #body
    ]

    set-style(content: (padding: 0pt))

    // Вершины правильного шестиугольника (острия сверху и снизу,
    // вертикальные левая и правая стороны — как на исходном рисунке).
    let v1 = (radius * calc.cos(90deg), radius * calc.sin(90deg))
    let v2 = (radius * calc.cos(30deg), radius * calc.sin(30deg))
    let v3 = (radius * calc.cos(-30deg), radius * calc.sin(-30deg))
    let v4 = (radius * calc.cos(-90deg), radius * calc.sin(-90deg))
    let v5 = (radius * calc.cos(-150deg), radius * calc.sin(-150deg))
    let v6 = (radius * calc.cos(150deg), radius * calc.sin(150deg))

    // Рёбра: чередование сплошных (β₁) и точечных (β₂).
    line(v6, v1, stroke: solid-stroke) // верхнее левое,  β₁
    line(v1, v2, stroke: dotted-stroke) // верхнее правое, β₂
    line(v2, v3, stroke: solid-stroke) // правое,         β₁
    line(v3, v4, stroke: dotted-stroke) // нижнее правое,  β₂
    line(v4, v5, stroke: solid-stroke) // нижнее левое,   β₁
    line(v5, v6, stroke: dotted-stroke) // левое,          β₂

    // Подписи рёбер — смещены наружу от середины каждой стороны.
    let mid(a, b) = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
    let out(p, dx, dy) = (p.at(0) + dx, p.at(1) + dy)

    content(out(mid(v6, v1), -label-gap, label-gap), label(
      $ beta_1 $,
    ))
    content(out(mid(v1, v2), label-gap, label-gap), label($ beta_2 $))
    content(out(mid(v2, v3), label-gap, 0), label($ beta_1 $))
    content(out(mid(v3, v4), label-gap, -label-gap), label(
      $ beta_2 $,
    ))
    content(out(mid(v4, v5), -label-gap, -label-gap), label(
      $ beta_1 $,
    ))
    content(out(mid(v5, v6), -label-gap, 0), label($ beta_2 $))
  },
)
