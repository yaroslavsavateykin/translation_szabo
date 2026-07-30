#import "@preview/cetz:0.5.2"

// Схема эквивалентности: i → j* → i  ↔  ромб (i±1)*  ↔  Σ_j ⟨i|v|j*⟩⟨j*|v|i⟩.
// Стиль (толщина линий, шрифт, подложка под подписями) согласован с
// diamond_graph.typ и transition_graph.typ. Ромб в центре крупнее, чем
// последовательность и формула по бокам; подписи верхней/нижней вершин
// вставлены прямо в стык линий, а не подвешены над/под ним.
// Использование после импорта:
//   #import "equivalence_diagram.typ": equivalence-diagram
//   #equivalence-diagram()
#let equivalence-diagram(
  unit: 0.86cm,
  line-width: 1.4pt,
  label-size: 12pt,
  sign-size: 12pt,
  formula-size: 13pt,
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

    let label(body) = box(
      fill: white,
      inset: 3pt,
      radius: 1pt,
    )[
      #set text(size: label-size, weight: "semibold")
      #body
    ]

    let sign(body) = [
      #set text(size: sign-size, weight: "semibold")
      #body
    ]

    let formula(body) = [
      #set text(size: formula-size, weight: "semibold")
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
    // Левая последовательность: i → j* → i
    // ----------------------------------------------------------------------
    content((0.00, 0), label($ i $))
    line((0.42, 0), (1.46, 0), mark: (end: "stealth"))

    content((1.86, 0), label($ j^* $))
    line((2.30, 0), (3.34, 0), mark: (end: "stealth"))

    content((3.76, 0), label($ i $))

    // Двусторонняя стрелка между последовательностью и ромбом.
    line(
      (4.30, 0),
      (6.35, 0),
      mark: (start: "stealth", end: "stealth"),
    )

    // ----------------------------------------------------------------------
    // Ромб: i – (i+1)* – i – (i-1)* – i
    // Крупнее, чем текст слева и справа.
    // ----------------------------------------------------------------------
    let L = (6.80, 0.00)
    let T = (8.60, 1.80)
    let R = (10.40, 0.00)
    let B = (8.60, -1.80)

    let along(a, b, t) = (
      a.at(0) + (b.at(0) - a.at(0)) * t,
      a.at(1) + (b.at(1) - a.at(1)) * t,
    )

    // Зазор у боковых вершин (i) — обычный; у верхней/нижней вершины
    // ((i±1)*) — минимальный, чтобы линии подходили почти вплотную и
    // подпись оказывалась зажатой между ними, а не парила над стыком.
    let gap-side = 0.16
    let gap-tip = 0.05

    line(along(L, T, gap-side), along(T, L, gap-tip))  // i–(i+1)*, +
    line(along(T, R, gap-tip), along(R, T, gap-side))  // (i+1)*–i, +
    line(along(L, B, gap-side), along(B, L, gap-tip))  // i–(i-1)*, -
    line(along(B, R, gap-tip), along(R, B, gap-side))  // (i-1)*–i, -

    content(L, label($ i $))
    content(T, label($ (i+1)^* $))
    content(R, label($ i $))
    content(B, label($ (i-1)^* $))

    content((7.45, 1.15), sign($ + $))
    content((9.75, 1.15), sign($ + $))
    content((7.45, -1.15), sign($ - $))
    content((9.75, -1.15), sign($ - $))

    // Двусторонняя стрелка между ромбом и формулой.
    line(
      (10.75, 0),
      (12.80, 0),
      mark: (start: "stealth", end: "stealth"),
    )

    // ----------------------------------------------------------------------
    // Формула: Σ_j ⟨i|v|j*⟩⟨j*|v|i⟩
    // ----------------------------------------------------------------------
    content(
      (15.60, 0),
      formula($ sum_j chevron.l i|v|j^* chevron.r chevron.l j^*|v|i chevron.r $),
    )
  },
)
