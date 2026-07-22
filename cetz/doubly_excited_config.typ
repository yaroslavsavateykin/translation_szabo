#import "@preview/cetz:0.5.2"

#let doubly_excited_config() = {
  cetz.canvas({
    import cetz.draw: *

    let font-size = 14pt
    let line-stroke = 1.5pt

    // Вспомогательная функция для отрисовки пары спинов (вверх и вниз) по центру линии
    let draw_electrons(x) = {
      // Спин вверх (левая стрелочка)
      line((x - 0.1, 0.7), (x - 0.1, 1.3), stroke: 1.2pt, name: "up")
      line((x - 0.1, 1.3), (x - 0.22, 1.13), stroke: 1.2pt)
      line((x - 0.1, 1.3), (x + 0.02, 1.13), stroke: 1.2pt)

      // Спин вниз (правая стрелочка)
      line(
        (x + 0.1, 1.3),
        (x + 0.1, 0.7),
        stroke: 1.2pt,
        name: "down",
      )
      line((x + 0.1, 0.7), (x + 0.22, 0.87), stroke: 1.2pt)
      line((x + 0.1, 0.7), (x - 0.02, 0.87), stroke: 1.2pt)
    }

    // Функция для одного энергетического уровня
    let level(x-start, y-pos, label, has-electrons: false) = {
      // Горизонтальная линия уровня
      line(
        (x-start, y-pos),
        (x-start + 2.0, y-pos),
        stroke: line-stroke,
      )

      // Подпись уровня справа
      content((x-start + 2.3, y-pos), text(size: font-size)[#label])

      // Рисуем электроны, если они заданы для уровня
      if has-electrons {
        // Сдвигаем координаты рисования стрелок в центр линии уровня
        group({
          translate((0, y-pos - 1.0))
          draw_electrons(x-start + 1.0)
        })
      }
    }

    // --- Левая подсистема (заполненная электронами) ---
    level(0.0, 2.5, $2_1$, has-electrons: true)
    level(0.0, 1.0, $1_1$, has-electrons: true)

    // --- Правая подсистема (пустая) ---
    level(5.0, 2.5, $2_2$, has-electrons: false)
    level(5.0, 1.0, $1_2$, has-electrons: false)
  })
}

