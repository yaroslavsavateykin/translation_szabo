#import "@preview/cetz:0.5.2"

// Функция генерирует графическую матрицу КВ с поддержкой масштабирования
#let ci_matrix(scale-factor: 100%) = {
  // Базовые математические стили без пробелов вокруг |
  let mel(x, y) = $lr(chevron.l #x|hat(H)|#y chevron.r)$
  let bra(x) = $lr(chevron.l #x |)$
  let ket(x) = $lr(| #x chevron.r)$

  let S = $lr(| S chevron.r)$
  let D = $lr(| D chevron.r)$
  let T = $lr(| T chevron.r)$
  let Q = $lr(| Q chevron.r)$

  scale(scale-factor, reflow: true)[
    #block(breakable: false, width: 100%)[
      #cetz.canvas({
        import cetz.draw: *

        // Настройки шага сетки матрицы
        let dx = 1.8 // Расстояние между столбцами
        let dy = 0.8 // Расстояние между строками по вертикали

        // Координаты центра матрицы (начало отсчета для элементов)
        let start-x = 4.0
        let start-y = 6.0

        // Стили линий для квадратных скобок матрицы
        let bracket-stroke = (thickness: 1.2pt, paint: black)

        // ==========================================
        // 1. ВЕРХНИЕ ЗАГОЛОВКИ (СТОЛБЦЫ)
        // ==========================================
        // Строка 1: Полные функции
        let col-labels-1 = (
          ket($Psi_0$),
          ket($Psi_a^r$),
          ket($Psi_(a b)^(r s)$),
          ket($Psi_(a b c)^(r s t)$),
          ket($Psi_(a b c d)^(r s t u)$),
          $dots$,
        )
        // Строка 2: Краткие обозначения
        let col-labels-2 = (ket($Psi_0$), S, D, T, Q, $dots$)

        for i in range(6) {
          let cx = start-x + i * dx
          content(
            (cx, start-y + 2 * dy),
            col-labels-1.at(i),
            anchor: "center",
          )
          content(
            (cx, start-y + 1 * dy),
            col-labels-2.at(i),
            anchor: "center",
          )
        }

        // ==========================================
        // 2. ЛЕВЫЕ ЗАГОЛОВКИ (СТРОКИ)
        // ==========================================
        let row-labels = (
          bra($Psi_0$),
          bra("S"),
          bra("D"),
          bra("T"),
          bra("Q"),
          $dots.v$,
        )

        for j in range(6) {
          let cy = start-y - j * dy
          // Смещаем строго левее первой колонки элементов (на 1.8 единицы)
          content(
            (start-x - 1.75, cy),
            row-labels.at(j),
            anchor: "east",
          )
        }

        // ==========================================
        // 3. МАТРИЧНЫЕ ЭЛЕМЕНТЫ (ДАННЫЕ)
        // ==========================================
        let matrix-data = (
          (
            mel($Psi_0$, $Psi_0$),
            $0$,
            mel($Psi_0$, [D]),
            $0$,
            $0$,
            $dots$,
          ),
          (
            "",
            mel([S], [S]),
            mel([S], [D]),
            mel([S], [T]),
            $0$,
            $dots$,
          ),
          (
            "",
            "",
            mel([D], [D]),
            mel([D], [T]),
            mel([D], [Q]),
            $dots$,
          ),
          ("", "", "", mel([T], [T]), mel([T], [Q]), $dots$),
          ("", "", "", "", mel([Q], [Q]), $dots$),
          (
            $dots.v$,
            $dots.v$,
            $dots.v$,
            $dots.v$,
            $dots.v$,
            $dots.down$,
          ),
        )

        for j in range(6) {
          for i in range(6) {
            let cx = start-x + i * dx
            let cy = start-y - j * dy
            content(
              (cx, cy),
              matrix-data.at(j).at(i),
              anchor: "center",
            )
          }
        }

        // ==========================================
        // 4. КВАДРАТНЫЕ СКОБКИ МАТРИЦЫ
        // ==========================================
        let left-bracket-x = start-x - 1.2
        let right-bracket-x = start-x + 5 * dx + 1
        let top-bracket-y = start-y + 0.5
        let bottom-bracket-y = start-y - 5 * dy - 0.4

        // Левая квадратная скобка [
        line(
          (left-bracket-x + 0.3, top-bracket-y),
          (left-bracket-x, top-bracket-y),
          stroke: bracket-stroke,
        )
        line(
          (left-bracket-x, top-bracket-y),
          (left-bracket-x, bottom-bracket-y),
          stroke: bracket-stroke,
        )
        line(
          (left-bracket-x, bottom-bracket-y),
          (left-bracket-x + 0.3, bottom-bracket-y),
          stroke: bracket-stroke,
        )

        // Правая квадратная скобка ]
        line(
          (right-bracket-x - 0.3, top-bracket-y),
          (right-bracket-x, top-bracket-y),
          stroke: bracket-stroke,
        )
        line(
          (right-bracket-x, top-bracket-y),
          (right-bracket-x, bottom-bracket-y),
          stroke: bracket-stroke,
        )
        line(
          (right-bracket-x, bottom-bracket-y),
          (right-bracket-x - 0.3, bottom-bracket-y),
          stroke: bracket-stroke,
        )

        // ==========================================
        // 5. ПОДПИСИ СООТВЕТСТВИЙ ВНИЗУ
        // ==========================================
        let caption-y = bottom-bracket-y - 0.6
        let center-matrix-x = start-x + 2.5 * dx

        content(
          (center-matrix-x, caption-y),
          $lr(chevron.l S|hat(H)|T chevron.r) <-> lr(chevron.l Psi_a^r|hat(H)|Psi_(c d e)^(t u v) chevron.r)$,
          anchor: "center",
        )
        content(
          (center-matrix-x, caption-y - 0.8),
          $lr(chevron.l D|hat(H)|D chevron.r) <-> lr(chevron.l Psi_(a b)^(r s)|hat(H)|Psi_(c d)^(t u) chevron.r)$,
          anchor: "center",
        )
      })
    ]
  ]
}


