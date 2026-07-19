#import "@preview/cetz:0.5.2"

// Экспортируемая функция с поддержкой масштабирования
#let Coord-syst-H2(scale-factor: 100%) = {
  scale(scale-factor, reflow: true)[
    #cetz.canvas({
      import cetz.draw: *

      // Базовые стили для осей, стрелок и атомов (сфер)
      let axis-stroke = (thickness: 1.2pt, paint: black)
      let arrow-stroke = (thickness: 1.5pt, paint: black)
      let atom-stroke = (thickness: 1.2pt, paint: black)
      let mark-style = (end: ">", scale: 0.8)
      let axis-mark-style = (end: "stealth", scale: 1.2, fill: black)
      // Начало координат O
      let ox = 5
      let oy = 4

      // Координаты центров атомов (сфер) и общей точки (электрона)
      let s1 = (x: 2.5, y: 6.5) // Левый атом
      let s2 = (x: 7.5, y: 6.5) // Правый атом
      let v = (x: 7.0, y: 10.5) // Вершина (точка r)

      // ==========================================
      // 1. СФЕРЫ (АТОМЫ) — рисуем сначала, чтобы стрелки были поверх
      // ==========================================

      // Левая сфера (с легким серым градиентом/заливкой для объема)
      circle(
        s1,
        radius: 0.6,
        stroke: atom-stroke,
        fill: gray.lighten(60%),
      )

      // Правая сфера
      circle(
        s2,
        radius: 0.6,
        stroke: atom-stroke,
        fill: gray.lighten(60%),
      )

      // ==========================================
      // 2. СИСТЕМА КООРДИНАТ (Оси x, y, z)
      // ==========================================

      // Ось z (вверх)
      line(
        (x: ox, y: oy),
        (x: ox, y: oy + 7),
        stroke: axis-stroke,
        mark: axis-mark-style,
      )
      content(
        (x: ox, y: oy + 7.3),
        text(size: 1.4em)[$z$],
        anchor: "south",
      )

      // Ось y (вправо)
      line(
        (x: ox, y: oy),
        (x: ox + 6, y: oy),
        stroke: axis-stroke,
        mark: axis-mark-style,
      )
      content(
        (x: ox + 6.3, y: oy),
        text(size: 1.4em)[$y$],
        anchor: "west",
      )

      // Ось x (вперед-влево)
      line(
        (x: ox, y: oy),
        (x: ox - 3.3, y: oy - 3.3),
        stroke: axis-stroke,
        mark: axis-mark-style,
      )
      content(
        (x: ox - 3.5, y: oy - 3.5),
        text(size: 1.4em)[$x$],
        anchor: "north-east",
      )

      // ==========================================
      // 3. РАДИУС-ВЕКТОРЫ И ИХ ПОДПИСИ
      // ==========================================

      // Вектор R1 (к левому атому)
      line((x: ox, y: oy), s1, stroke: arrow-stroke, mark: mark-style)
      content(
        (x: 3.52, y: 5.0),
        text(size: 1.4em)[$bold(R)_1$],
        anchor: "north",
      )

      // Вектор R2 (к правому атому)
      line((x: ox, y: oy), s2, stroke: arrow-stroke, mark: mark-style)
      content(
        (x: 6.52, y: 5.0),
        text(size: 1.4em)[$bold(R)_2$],
        anchor: "north",
      )

      // Вектор r (к вершине)
      line((x: ox, y: oy), v, stroke: arrow-stroke, mark: mark-style)
      content(
        (x: 5.95, y: 8.0),
        text(size: 1.4em)[$bold(r)$],
        anchor: "east",
      )

      // Вектор R12 (от правого атома к левому)
      line(s2, s1, stroke: arrow-stroke, mark: mark-style)
      content(
        (x: 4.2, y: 6.7),
        text(size: 1.4em)[$bold(R)_(12)$],
        anchor: "south",
      )

      // Вектор r - R1 (от левого атома к вершине)
      line(s1, v, stroke: arrow-stroke, mark: mark-style)
      content(
        (x: 4.4, y: 8.45),
        text(size: 1.4em)[$bold(r) - bold(R)_1$],
        anchor: "south-east",
        angle: 40deg,
      )

      // Вектор r - R2 (от правого атома к вершине)
      line(s2, v, stroke: arrow-stroke, mark: mark-style)
      content(
        (x: 7.4, y: 8.8),
        text(size: 1.4em)[$bold(r) - bold(R)_2$],
        anchor: "west",
      )
    })
  ]
}
