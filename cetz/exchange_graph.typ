#import "@preview/cetz:0.5.2": canvas, draw

#let exchange-graph(
  scale: 1,
  stroke: 0.9pt,
  label-size: 12pt,
) = canvas({
  import draw: *

  set-style(
    stroke: stroke,
  )

  let s = scale

  // Вершины шестиугольника
  let L = (-0.70*s, 0.00*s)
  let UL = (-0.35*s, 0.55*s)
  let UR = ( 0.35*s, 0.55*s)
  let R = ( 0.70*s, 0.00*s)
  let DR = ( 0.35*s, -0.55*s)
  let DL = (-0.35*s, -0.55*s)

  // Верхний контур
  line(L, UL)
  line(UL, UR)
  line(UR, R)

  // Нижний контур
  line(R, DR)
  line(DR, DL)
  line(DL, L)

  // Верхняя стрелка
  line(
    (-0.28*s, 0.80*s),
    (-0.28*s, 1.15*s),
    mark: (end: ">"),
  )

  line(
    (-0.28*s, 1.15*s),
    (0.28*s, 1.15*s),
  )

  line(
    (0.28*s, 1.15*s),
    (0.28*s, 0.80*s),
    mark: (end: ">"),
  )

  // Нижняя стрелка
  line(
    (0.28*s,-0.80*s),
    (0.28*s,-1.15*s),
    mark: (end: ">"),
  )

  line(
    (0.28*s,-1.15*s),
    (-0.28*s,-1.15*s),
  )

  line(
    (-0.28*s,-1.15*s),
    (-0.28*s,-0.80*s),
    mark: (end: ">"),
  )

  // Подпись
  content(
    (0,0),
    box(inset: 1pt)[
      #set text(size: label-size)
      $
        angle.l i j "|" k l angle.r
      $
    ],
  )
})