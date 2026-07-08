#import "@preview/cetz:0.5.2": canvas, draw

#let two-electrons-Roothan() = {
  canvas({
    // Задаем масштаб для удобства
    draw.scale(2)

    // Константы для координат
    let x_start = 0.5
    let x_end = 4.5
    let y_low = 0.5
    let y_high = 2.0

    // Нижний энергетический уровень eps_1
    draw.line((x_start, y_low), (x_end, y_low), stroke: 2pt)
    draw.content(
      (x_start - 0.1, y_low),
      text(size: 24pt)[$epsilon_1$],
      anchor: "east",
    )
    draw.content(
      (x_end + 0.1, y_low),
      text(size: 24pt)[$psi_1$],
      anchor: "west",
    )

    // Стрелка вверх (спин-вверх)
    draw.line(
      (1.8, y_low - 0.4),
      (1.8, y_low + 0.4),
      mark: (end: ">"),
      stroke: 2.8pt,
    )

    // Стрелка вниз (спин-вниз)
    draw.line(
      (3.2, y_low + 0.4),
      (3.2, y_low - 0.4),
      mark: (end: ">"),
      stroke: 2.8pt,
    )

    // Верхний энергетический уровень eps_2
    draw.line((x_start, y_high), (x_end, y_high), stroke: 2pt)
    draw.content(
      (x_start - 0.1, y_high),
      text(size: 24pt)[$epsilon_2$],
      anchor: "east",
    )
    draw.content(
      (x_end + 0.1, y_high),
      text(size: 24pt)[$psi_2$],
      anchor: "west",
    )
  })
}
