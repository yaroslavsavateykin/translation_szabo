#import "@preview/cetz:0.5.2"

// Экспортируемая функция с поддержкой масштабирования
#let Probability(scale-factor: 80%) = {
  scale(scale-factor, reflow: true)[
    #cetz.canvas({
      import cetz.draw: *

      // Базовые стили для осей, стрелок и ребер кубов
      let axis-stroke = (thickness: 1.2pt, paint: black)
      let arrow-stroke = (thickness: 1.5pt, paint: black)
      let cube-stroke = (thickness: 1pt, paint: black)
      let mark-style = (end: ">", scale: 0.8)

      // Внутренняя функция для рисования маленького кубика в изометрии
      let draw-cube(origin-x, origin-y, size: 0.8) = {
        let dx = size * 0.3
        let dy = size * 0.3

        // Передняя грань
        rect(
          (x: origin-x, y: origin-y),
          (x: origin-x + size, y: origin-y + size),
          stroke: cube-stroke,
        )
        // Задняя грань
        rect(
          (x: origin-x + dx, y: origin-y + dy),
          (x: origin-x + size + dx, y: origin-y + size + dy),
          stroke: cube-stroke,
        )
        // Соединительные ребра
        line(
          (x: origin-x, y: origin-y),
          (x: origin-x + dx, y: origin-y + dy),
          stroke: cube-stroke,
        )
        line(
          (x: origin-x + size, y: origin-y),
          (x: origin-x + size + dx, y: origin-y + dy),
          stroke: cube-stroke,
        )
        line(
          (x: origin-x, y: origin-y + size),
          (x: origin-x + dx, y: origin-y + size + dy),
          stroke: cube-stroke,
        )
        line(
          (x: origin-x + size, y: origin-y + size),
          (x: origin-x + size + dx, y: origin-y + size + dy),
          stroke: cube-stroke,
        )
      }

      // ==========================================
      // 1. СИСТЕМА КООРДИНАТ (Оси x, y, z)
      // ==========================================

      let ox = 6
      let oy = 5

      // Ось z
      line((x: ox, y: oy), (x: ox, y: oy + 6), stroke: axis-stroke)
      content(
        (x: ox, y: oy + 6.3),
        text(size: 1.65em)[$z$],
        anchor: "south",
      )

      // Ось y
      line((x: ox, y: oy), (x: ox + 5.8, y: oy), stroke: axis-stroke)
      content(
        (x: ox + 6.1, y: oy),
        text(size: 1.65em)[$y$],
        anchor: "west",
      )

      // Ось x
      line(
        (x: ox, y: oy),
        (x: ox - 3.8, y: oy - 3.8),
        stroke: axis-stroke,
      )
      content(
        (x: ox - 4, y: oy - 4),
        text(size: 1.65em)[$x$],
        anchor: "north-east",
      )

      // ==========================================
      // 2. ЛЕВЫЙ ВЕКТОР И КУБИК (r1, dr1)
      // ==========================================

      line(
        (x: ox, y: oy),
        (x: ox - 3.2, y: oy + 2.8),
        stroke: arrow-stroke,
        mark: mark-style,
      )
      content((x: ox - 2.0, y: oy + 1.2), text(
        size: 1.65em,
      )[$bold(r)_1$])

      draw-cube(ox - 4.2, oy + 2.8, size: 0.8)
      content(
        (x: ox - 3.58, y: oy + 4.0),
        text(size: 1.65em)[$d bold(r)_1$],
        anchor: "south",
      )

      // ==========================================
      // 3. ПРАВЫЙ ВЕКТОР И КУБИК (r2, dr2)
      // ==========================================

      line(
        (x: ox, y: oy),
        (x: ox + 3.8, y: oy + 3.2),
        stroke: arrow-stroke,
        mark: mark-style,
      )
      content((x: ox + 1.9, y: oy + 2.5), text(
        size: 1.65em,
      )[$bold(r)_2$])

      draw-cube(ox + 3.67, oy + 3.27, size: 0.8)
      content(
        (x: ox + 4.27, y: oy + 4.48),
        text(size: 1.65em)[$d bold(r)_2$],
        anchor: "south",
      )

      // ==========================================
      // 4. ОБЩАЯ ПОДПИСЬ СНИЗУ
      // ==========================================

      content(
        (x: ox + 3, y: oy - 2),
        text(
          size: 1.65em,
        )[$P(bold(r)_1, bold(r)_2) d bold(r)_1 d bold(r)_2$],
        anchor: "north",
      )
    })
  ]
}
