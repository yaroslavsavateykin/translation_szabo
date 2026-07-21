#import "@preview/cetz:0.5.2"

#let molecular_orbitals() = {
  cetz.canvas({
    import cetz.draw: *

    // Настройки стилей
    let font-size = 11pt
    let label-size = 10pt
    let line-stroke = 1.5pt

    // Функция для отрисовки одной системы (атомные и молекулярные орбитали)
    let draw_system(x-offset, system-num, label-idx) = {
      // Атомные орбитали (кружочки с точкой)
      circle((x-offset + 0.5, 6.0), radius: 0.35, stroke: 1pt)
      circle((x-offset + 0.5, 6.0), radius: 0.03, fill: black)
      content((x-offset + 0.5, 5.3), text(
        size: font-size,
      )[$phi_1^#label-idx$])

      circle((x-offset + 1.7, 6.0), radius: 0.35, stroke: 1pt)
      circle((x-offset + 1.7, 6.0), radius: 0.03, fill: black)
      content((x-offset + 1.7, 5.3), text(
        size: font-size,
      )[$phi_2^#label-idx$])

      // Номер системы сверху
      content((x-offset + 1.1, 6.8), text(
        size: font-size,
        weight: "bold",
      )[#system-num])

      // Молекулярные уровни энергии (линии)
      line(
        (x-offset + 0.3, 4.4),
        (x-offset + 1.9, 4.4),
        stroke: line-stroke,
      )
      content((x-offset + 2.2, 4.4), text(
        size: font-size,
      )[$2_#label-idx$])

      line(
        (x-offset + 0.3, 3.7),
        (x-offset + 1.9, 3.7),
        stroke: line-stroke,
      )
      content((x-offset + 2.2, 3.7), text(
        size: font-size,
      )[$1_#label-idx$])
    }

    // Отрисовка левой (1) и правой (2) подсистем
    draw_system(0.0, "1", "1")
    draw_system(5.0, "2", "2")

    // Блок формул снизу (выровнен по левому краю)
    let formulas-y = 2.5
    let dy = 0.65

    content((0.3, formulas-y - 0 * dy), anchor: "west", text(
      size: font-size,
    )[
      $
        lr(|1_1 chevron.r) = (2 (1 + S_12))^(-1/2) (phi_1^1 + phi_2^1)
      $
    ])
    content((0.3, formulas-y - 1 * dy), anchor: "west", text(
      size: font-size,
    )[
      $
        lr(|2_1 chevron.r) = (2 (1 - S_12))^(-1/2) (phi_1^1 - phi_2^1)
      $
    ])
    content((0.3, formulas-y - 2 * dy), anchor: "west", text(
      size: font-size,
    )[
      $
        lr(|1_2 chevron.r) = (2 (1 + S_12))^(-1/2) (phi_1^2 + phi_2^2)
      $
    ])
    content((0.3, formulas-y - 3 * dy), anchor: "west", text(
      size: font-size,
    )[
      $
        lr(|2_2 chevron.r) = (2 (1 - S_12))^(-1/2) (phi_1^2 - phi_2^2)
      $
    ])
  })
}

