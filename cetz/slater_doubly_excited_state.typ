#import "@preview/cetz:0.5.2"

#let slater_doubly_excited_state() = {
  cetz.canvas({
    import cetz.draw: *

    // Настройка базовых стилей
    let line-stroke = (thickness: 1.5pt, paint: black)
    let transition-stroke = (thickness: 2.3pt, paint: black)
    let wave-stroke = (thickness: 5pt, paint: black) // Утолщенная синусоида
    let mark-style = (end: "stealth", scale: 0.8, fill: black) // Заполненная стрелка
    let dots-size = 2.2em
    let text-size = 1.5em // Увеличенный размер шрифта для всего текста

    // Функция для вывода электрона в виде текстового астериска
    let draw-electron(pos) = {
      // Смещение по Y (-0.1) компенсирует высоту шрифта астериска для идеального выравнивания по линии
      content(
        (pos.x, pos.y + 0.135),
        text(size: 3.5em)[$*$],
        anchor: "center",
      )
    }

    // ==========================================
    // ЛЕВАЯ ЧАСТЬ: Подпись состояния
    // ==========================================
    content(
      (4.5, 6.5),
      text(size: text-size)[ $|Psi_(a b)^(r s) chevron.r$ ],
      anchor: "east",
    )

    // ==========================================
    // ВЕРХНЯЯ ЧАСТЬ: Виртуальные спин-орбитали
    // ==========================================

    // Уровень chi_2K (Ширина 3.5: от 6.25 до 9.75)
    line((6.25, 15), (9.75, 15), stroke: line-stroke)
    content(
      (10.0, 15),
      text(size: text-size)[$chi_(2K)$],
      anchor: "west",
    )

    // Троеточие под chi_2K
    content((8, 14), text(size: dots-size)[$dots.v$])

    // Уровень chi_s (занят вторым возбужденным электроном)
    line((6.25, 13), (9.75, 13), stroke: line-stroke)
    content(
      (10.0, 13),
      text(size: text-size)[$chi_s$],
      anchor: "west",
    )
    draw-electron((x: 8, y: 13))

    // Уровень chi_r (занят первым возбужденным электроном)
    line((6.25, 12), (9.75, 12), stroke: line-stroke)
    content(
      (10.0, 12),
      text(size: text-size)[$chi_r$],
      anchor: "west",
    )
    draw-electron((x: 8, y: 12))

    // Троеточие под chi_r
    content((8, 11), text(size: dots-size)[$dots.v$])

    // Уровень chi_N+1
    line((6.25, 10), (9.75, 10), stroke: line-stroke)
    content(
      (10.0, 10),
      text(size: text-size)[$chi_(N+1)$],
      anchor: "west",
    )

    // ==========================================
    // РАЗДЕЛИТЕЛЬНАЯ СИНУСОИДА
    // ==========================================
    let start-x = 5.0
    let end-x = 11.0
    let base-y = 9.0
    let amplitude = 0.07
    let frequency = 10
    let steps = 200

    let wave-points = ()
    for i in range(0, steps + 1) {
      let t = i / steps
      let x = start-x + t * (end-x - start-x)
      let y = (
        base-y + amplitude * calc.sin(2 * calc.pi * frequency * t)
      )
      wave-points.push((x, y))
    }
    line(..wave-points, stroke: wave-stroke)

    // ==========================================
    // НИЖНЯЯ ЧАСТЬ: Занятые спин-орбитали
    // ==========================================

    // Уровень chi_N с электроном
    line((6.25, 8), (9.75, 8), stroke: line-stroke)
    content((10.0, 8), text(size: text-size)[$chi_N$], anchor: "west")
    draw-electron((x: 8, y: 8))

    // Троеточие под chi_N
    content((8, 7), text(size: dots-size)[$dots.v$])

    // Уровень chi_b (пустой, откуда ушел второй электрон)
    line((6.25, 6), (9.75, 6), stroke: line-stroke)
    content((10.0, 6), text(size: text-size)[$chi_b$], anchor: "west")

    // Уровень chi_a (пустой, откуда ушел первый электрон)
    line((6.25, 5), (9.75, 5), stroke: line-stroke)
    content((10.0, 5), text(size: text-size)[$chi_a$], anchor: "west")

    // Троеточие под chi_a
    content((8, 4), text(size: dots-size)[$dots.v$])

    // Уровни chi_2 и chi_1 с электронами
    line((6.25, 3), (9.75, 3), stroke: line-stroke)
    content((10.0, 3), text(size: text-size)[$chi_2$], anchor: "west")
    draw-electron((x: 8, y: 3))

    line((6.25, 2), (9.75, 2), stroke: line-stroke)
    content((10.0, 2), text(size: text-size)[$chi_1$], anchor: "west")
    draw-electron((x: 8, y: 2))

    // ==========================================
    // ДВЕ СТРЕЛКИ ВОЗБУЖДЕНИЯ (ПЕРЕХОДА)
    // ==========================================
    // Первая стрелка: от уровня chi_a (y=5) до уровня chi_r (y=12)
    line(
      (7.1, 5.0),
      (7.1, 12.0),
      stroke: transition-stroke,
      mark: mark-style,
    )

    // Вторая стрелка: от уровня chi_b (y=6) до уровня chi_s (y=13)
    line(
      (7.5, 6.0),
      (7.5, 13.0),
      stroke: transition-stroke,
      mark: mark-style,
    )
  })
}

