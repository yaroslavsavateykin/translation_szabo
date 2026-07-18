#import "@preview/cetz:0.5.2"

#let excitations_equations(scale-factor: 100%) = {
  scale(scale-factor, reflow: true)[
    #block(breakable: false, width: 100%)[
      #cetz.canvas({
        import cetz.draw: *

        // Настройки позиционирования строк
        let dy = 0.92 // Вертикальный шаг между формулами
        let start-y = 15.0
        let text-size = 1.25em
        let heading-size = 1.35em

        // Функция для левого выравнивания блоков формул
        let row(index, body, is-heading: false) = {
          content(
            (0, start-y - index * dy),
            text(size: if is-heading { heading-size } else {
              text-size
            })[#body],
            anchor: "west",
          )
        }

        // ==========================================
        // SINGLE EXCITATIONS (ОДНОКРАТНЫЕ ВОЗБУЖДЕНИЯ)
        // ==========================================
        row(0, strong("Однократные возбуждения"), is-heading: true)

        row(1, $ lr(<Psi_0|hat(H)|""^1 Psi_a^r>) = 0 $)

        row(
          2,
          $
            lr(<""^1 Psi_a^r|hat(H) - E_0|""^1 Psi_b^s>) = (epsilon_r - epsilon_a) delta_(r s) delta_(a b) - (r s|b a) + 2(r a|b s)
          $,
        )

        // ==========================================
        // DOUBLE EXCITATIONS (ДВУКРАТНЫЕ ВОЗБУЖДЕНИЯ)
        // ==========================================
        row(3, strong("Двукратные возбуждения"), is-heading: true)

        row(4, $ lr(<Psi_0|hat(H)|""^1 Psi_(a a)^(r r)>) = K_(r a) $)

        row(
          5,
          $
            lr(<Psi_0|hat(H)|""^1 Psi_(a a)^(r s)>) = 2^(1/2) (s a|r a)
          $,
        )

        row(
          6,
          $
            lr(<Psi_0|hat(H)|""^1 Psi_(a b)^(r r)>) = 2^(1/2) (r b|r a)
          $,
        )

        row(
          7,
          $
            lr(<Psi_0|hat(H)|""^A Psi_(a b)^(r s)>) = 3^(1/2) ((r a|s b) - (r b|s a))
          $,
        )

        row(
          8,
          $
            lr(<Psi_0|hat(H)|""^B Psi_(a b)^(r s)>) = (r a|s b) + (r b|s a)
          $,
        )

        row(
          9,
          $
            lr(<""^1 Psi_(a a)^(r r)|hat(H) - E_0|""^1 Psi_(a a)^(r r)>) = 2(epsilon_r - epsilon_a) + J_(a a) + J_(r r) - 4J_(r a) + 2K_(r a)
          $,
        )

        row(
          10,
          $
            lr(<""^1 Psi_(a a)^(r r)|hat(H) - E_0|""^1 Psi_(a a)^(r s)>) = epsilon_r + epsilon_s - 2epsilon_a + J_(a a) + J_(r s) + K_(r s) - 2J_(s a) - 2J_(r a) + K_(s a) + K_(r a)
          $,
        )

        row(
          11,
          $
            lr(<""^1 Psi_(a a)^(r r)|hat(H) - E_0|""^1 Psi_(a b)^(r r)>) = 2epsilon_r - epsilon_a - epsilon_b + J_(r r) + J_(a b) + K_(a b) - 2J_(r b) - 2J_(r a) + K_(r b) + K_(r a)
          $,
        )

        // Первая длинная формула без пробелов
        row(
          12,
          $
            lr(<""^A Psi_(a b)^(r s)|hat(H) - E_0|""^A Psi_(a b)^(r s)>) = epsilon_r + epsilon_s - epsilon_a - epsilon_b + J_(a b) + J_(r s) - K_(a b)
          $,
        )
        row(
          13,
          $
            quad - K_(r s) - J_(s b) - J_(s a) - J_(r b) - J_(r a) + 3/2 (K_(s b) + K_(s a) + K_(r b) + K_(r a))
          $,
        )

        // Вторая длинная формула без пробелов
        row(
          14,
          $
            lr(<""^B Psi_(a b)^(r s)|hat(H) - E_0|""^B Psi_(a b)^(r s)>) = epsilon_r + epsilon_s - epsilon_a - epsilon_b + J_(a b) + J_(r s) + K_(a b)
          $,
        )
        row(
          15,
          $
            quad + K_(r s) - J_(s b) - J_(s a) - J_(r b) - J_(r a) + 1/2 (K_(s b) + K_(s a) + K_(r b) + K_(r a))
          $,
        )

        // Финальная строка без пробелов
        row(
          16,
          $
            lr(<""^A Psi_(a b)^(r s)|hat(H)|""^B Psi_(a b)^(r s)>) = (3/4)^(1/2) (K_(s b) - K_(s a) - K_(r b) + K_(r a))
          $,
        )
      })
    ]
  ]
}

