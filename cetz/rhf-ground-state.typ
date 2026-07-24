#import "@preview/cetz:0.5.2"

// Функция рисует диаграмму орбитальных уровней закрытой оболочки RHF.
// Использование в тексте (см. пример ниже) — через импорт этой функции.
#let rhf_ground_state() = {
  cetz.canvas({
    import cetz.draw: *

    let font-size = 14pt
    let line-stroke = 1.5pt
    let level-length = 2.0

    // Рисует пару электронов (спин вверх и спин вниз) по центру уровня.
    // Локально линия уровня считается расположенной на y = 1.0,
    // а затем всё сдвигается на нужную высоту через translate.
    let draw_electrons(x) = {
      // Спин вверх (левая стрелочка)
      line((x - 0.1, 0.7), (x - 0.1, 1.3), stroke: 1.2pt)
      line((x - 0.1, 1.3), (x - 0.22, 1.13), stroke: 1.2pt)
      line((x - 0.1, 1.3), (x + 0.02, 1.13), stroke: 1.2pt)

      // Спин вниз (правая стрелочка)
      line((x + 0.1, 1.3), (x + 0.1, 0.7), stroke: 1.2pt)
      line((x + 0.1, 0.7), (x + 0.22, 0.87), stroke: 1.2pt)
      line((x + 0.1, 0.7), (x - 0.02, 0.87), stroke: 1.2pt)
    }

    // Один энергетический уровень: горизонтальная линия, подпись справа
    // и (опционально) пара электронов по центру.
    let level(x-start, y-pos, label, has-electrons: true) = {
      line(
        (x-start, y-pos),
        (x-start + level-length, y-pos),
        stroke: line-stroke,
      )

      content(
        (x-start + level-length + 0.35, y-pos),
        text(size: font-size)[#label],
        anchor: "west",
      )

      if has-electrons {
        group({
          translate((0, y-pos - 1.0))
          draw_electrons(x-start + level-length / 2)
        })
      }
    }

    // Троеточие между уровнями, обозначающее пропущенные орбитали.
    let dots(x-start, y-bottom, y-top) = {
      let cx = x-start + level-length / 2 - 0.15
      let step = (y-top - y-bottom) / 4
      for i in range(1, 4) {
        circle(
          (cx, y-bottom + step * i),
          radius: 0.035,
          fill: black,
          stroke: none,
        )
      }
    }

    // Уровни снизу вверх.
    level(0.0, 1.0, $psi_1$)
    level(0.0, 2.5, $psi_2$)
    dots(0.0, 3.0, 5.5)
    level(0.0, 6.0, $psi_a$)
    level(0.0, 7.5, $psi_b$)
    dots(0.0, 8.0, 10.5)
    level(0.0, 11.0, $psi_(N\/2)$)
  })
}
