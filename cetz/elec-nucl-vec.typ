#import "@preview/cetz:0.5.2"

#let electron-nuclei-vectors = {
  cetz.canvas(
    length: 0.8cm,
    {
      import cetz.draw: *

      // Координаты, подобранные по исходной схеме.
      let O = (0, 0)
      let A = (-2.55, 3.30)
      let B = (-4.10, 1.15)
      let I = (1.92, 4.95)
      let J = (4.95, 3.10)

      let x-end = (-3.70, -3.45)
      let y-end = (6.35, 0)
      let z-end = (0, 6.35)

      let axis-stroke = (
        paint: black,
        thickness: 0.75pt,
        cap: "round",
      )
      let vector-stroke = (
        paint: black,
        thickness: 0.95pt,
        cap: "round",
      )
      let node-stroke = (
        paint: black,
        thickness: 0.9pt,
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
      let vector-arrow = (
        end: "stealth",
        fill: black,
        stroke: black,
        length: 0.24,
        width: 0.16,
        inset: 0.045,
        transform-shape: false,
      )
      let node-radius = 0.3

      let formula-label = (pos, body, anchor: "center") => {
        content(
          pos,
          body,
          anchor: anchor,
          frame: "rect",
          fill: white,
          stroke: none,
          padding: 1.2pt,
        )
      }

      let draw-node = (pos, body) => {
        circle(
          pos,
          radius: node-radius,
          fill: white,
          stroke: node-stroke,
        )
        content(pos, body)
      }

      // Оси x, y, z.
      line(O, x-end, stroke: axis-stroke, mark: axis-arrow)
      line(O, y-end, stroke: axis-stroke, mark: axis-arrow)
      line(O, z-end, stroke: axis-stroke, mark: axis-arrow)

      content((-3.84, -3.58), $x$, anchor: "north-east")
      content((6.48, -0.02), $y$, anchor: "west")
      content((-0.04, 6.48), $z$, anchor: "south")

      // Именованные окружности задают границы, к которым подходят стрелки.
      circle(
        A,
        radius: node-radius,
        fill: white,
        stroke: node-stroke,
        name: "A",
      )
      circle(
        B,
        radius: node-radius,
        fill: white,
        stroke: node-stroke,
        name: "B",
      )
      circle(
        I,
        radius: node-radius,
        fill: white,
        stroke: node-stroke,
        name: "I",
      )
      circle(
        J,
        radius: node-radius,
        fill: white,
        stroke: node-stroke,
        name: "J",
      )

      // Радиус-векторы частиц.
      line(O, "A", stroke: vector-stroke, mark: vector-arrow)
      line(O, "B", stroke: vector-stroke, mark: vector-arrow)
      line(O, "I", stroke: vector-stroke, mark: vector-arrow)
      line(O, "J", stroke: vector-stroke, mark: vector-arrow)

      // Относительные радиус-векторы.
      line("B", "A", stroke: vector-stroke, mark: vector-arrow)
      line("A", "I", stroke: vector-stroke, mark: vector-arrow)
      line("A", "J", stroke: vector-stroke, mark: vector-arrow)
      line("J", "I", stroke: vector-stroke, mark: vector-arrow)

      // Повторно накрываем узлы, чтобы линии не заходили внутрь окружностей.
      draw-node(A, [A])
      draw-node(B, [B])
      draw-node(I, [i])
      draw-node(J, [j])

      // Начало координат.
      circle(O, radius: 0.035, fill: black, stroke: none)
      content((0.3, -0.12), [O], anchor: "north-east")

      // Обозначения радиус-векторов.
      formula-label((-0.9, 2.03), $ bold(R)_A $)
      formula-label((-2.5, 0.28), $ bold(R)_B $)
      formula-label((0.58, 2.42), $ bold(r)_i $)
      formula-label((2.7, 1.2), $ bold(r)_j $)

      // Обозначения относительных векторов.
      formula-label(
        (-7.5, 2.47),
        $ bold(R)_(A B) = bold(R)_A - bold(R)_B $,
        anchor: "west",
      )
      formula-label(
        (-2.58, 4.87),
        $ bold(r)_(i A) = bold(r)_i - bold(R)_A $,
        anchor: "west",
      )
      formula-label(
        (1, 3.6),
        $ bold(r)_(j A) = bold(r)_j - bold(R)_A $,
        anchor: "west",
      )
      formula-label(
        (3.1, 4.58),
        $ bold(r)_(i j) = bold(r)_i - bold(r)_j $,
        anchor: "west",
      )

      // Легенда.
      content(
        (1.00, -1.18),
        [i, j - электроны],
        anchor: "west",
      )
      content(
        (1.00, -1.72),
        [A, B - ядра],
        anchor: "west",
      )
    },
  )
}

#electron-nuclei-vectors
