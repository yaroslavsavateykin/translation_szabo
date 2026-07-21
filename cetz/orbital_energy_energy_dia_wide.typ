#import "@preview/cetz:0.5.2"

// Широкий вариант: рисунок полностью построен вручную средствами CeTZ.
// Горизонтальные расстояния увеличены примерно вдвое.
#let orbital-energy-diagram-manual-wide(
  length: 0.6cm,
) = {
  let h = 17.0

  let axis-x = 2
  let separator-x = 14.6
  let right-x = 24

  let alpha-left = 4.20
  let alpha-center = 7.35
  let alpha-right = 10.50

  let beta-left = 17.15
  let beta-center = 20.30
  let beta-right = 23.45

  // Кусочно-линейная шкала с разрывом между −1,8 и −20,71 а. е.
  let display-energy(e) = {
    if e >= -1.8 {
      4.7 + (e + 1.8) / 1.8 * 12.3
    } else {
      (e + 20.77) / 0.06 * 3.6
    }
  }

  let y-of(e) = h * 0.1 + h * 0.8 * display-energy(e) / 17.0

  let upper-ticks = (
    (energy: 0.0, label: "0,0"),
    (energy: -0.2, label: "−0,2"),
    (energy: -0.4, label: "−0,4"),
    (energy: -0.6, label: "−0,6"),
    (energy: -0.8, label: "−0,8"),
    (energy: -1.0, label: "−1,0"),
    (energy: -1.2, label: "−1,2"),
    (energy: -1.4, label: "−1,4"),
    (energy: -1.6, label: "−1,6"),
    (energy: -1.8, label: "−1,8"),
  )

  let lower-ticks = (
    (energy: -20.71, label: "−20,71"),
    (energy: -20.73, label: "−20,73"),
    (energy: -20.75, label: "−20,75"),
    (energy: -20.77, label: "−20,77"),
  )

  let caption(body) = text(
    style: "normal",
    weight: "regular",
    body,
  )

  cetz.canvas(
    length: length,
    {
      import cetz.draw: *

      let bottom-y = y-of(-20.8)
      let lower-top-y = y-of(-20.71)
      let upper-bottom-y = y-of(-1.8)
      let top-y = y-of(0.0)
      let break-y = (lower-top-y + upper-bottom-y) / 2
      let title-y = y-of(-0.36)

      let draw-level(
        x,
        energy,
        label: none,
        label-dy: 0.0,
        half-width: 0.62,
        leader: false,
      ) = {
        let y = y-of(energy)
        let x-end = x + half-width

        line(
          (x - half-width, y),
          (x-end, y),
          stroke: 1.05pt,
        )

        if label != none {
          let label-x = x-end + 0.28
          let label-y = y + label-dy

          if leader and calc.abs(label-dy) > 0.001 {
            line(
              (x-end, y),
              (x-end + 0.12, y),
              (label-x - 0.08, label-y),
              stroke: 0.55pt,
            )
          }

          content(
            (label-x, label-y),
            label,
            anchor: "west",
          )
        }
      }

      let draw-pi-pair(x-left, x-right, energy, label) = {
        draw-level(x-left, energy)
        draw-level(x-right, energy, label: label)
      }

      // Ось энергии и разрыв шкалы.
      line(
        (axis-x, bottom-y),
        (axis-x, break-y - 0.30),
        stroke: 1.15pt,
      )
      line((axis-x, break-y + 0.30), (axis-x, top-y), stroke: 1.15pt)

      line(
        (axis-x - 0.10, break-y - 0.29),
        (axis-x + 0.10, break-y - 0.15),
        (axis-x - 0.10, break-y - 0.01),
        (axis-x + 0.10, break-y + 0.13),
        (axis-x - 0.10, break-y + 0.27),
        stroke: 1.15pt,
      )

      for tick in upper-ticks {
        let y = y-of(tick.at("energy"))
        line((axis-x, y), (axis-x + 0.30, y), stroke: 1.05pt)
        content(
          (axis-x - 0.34, y),
          caption(tick.at("label")),
          anchor: "east",
        )
      }

      for tick in lower-ticks {
        let y = y-of(tick.at("energy"))
        line((axis-x, y), (axis-x + 0.30, y), stroke: 1.05pt)
        content(
          (axis-x - 0.34, y),
          caption(tick.at("label")),
          anchor: "east",
        )
      }

      content(
        (-1, (bottom-y + top-y) / 2),
        caption([Энергия орбиталей (а. е.)]),
        angle: 90deg,
        anchor: "center",
      )

      // Разделитель панелей и нижняя линия.
      line(
        (separator-x, bottom-y),
        (separator-x, top-y),
        stroke: 1.15pt,
      )
      // line((axis-x, bottom-y), (right-x, bottom-y), stroke: 1.15pt)

      content(
        ((alpha-left + alpha-right) / 2, title-y),
        caption([α-орбитали]),
        anchor: "center",
      )
      content(
        ((beta-left + beta-right) / 2, title-y),
        caption([β-орбитали]),
        anchor: "center",
      )

      // Альфа-орбитали.
      draw-pi-pair(alpha-left, alpha-right, -0.56, caption(
        [1π#sub[g]],
      ))
      draw-level(alpha-center, -0.76, label: caption([3σ#sub[g]]))
      draw-pi-pair(alpha-left, alpha-right, -0.84, caption(
        [1π#sub[u]],
      ))
      draw-level(alpha-center, -1.20, label: caption([2σ#sub[u]]))
      draw-level(alpha-center, -1.72, label: caption([2σ#sub[g]]))

      // Почти совпадающие уровни разнесены по вертикали и соединены выносками.
      draw-level(
        alpha-center,
        -20.762,
        label: caption([1σ#sub[u]]),
        label-dy: 0.28,
        leader: true,
      )
      draw-level(
        alpha-center,
        -20.768,
        label: caption([1σ#sub[g]]),
        label-dy: -0.28,
        leader: true,
      )

      // Бета-орбитали.
      draw-pi-pair(beta-left, beta-right, -0.58, caption([1π#sub[u]]))
      draw-level(beta-center, -0.70, label: caption([3σ#sub[g]]))
      draw-level(beta-center, -1.00, label: caption([2σ#sub[u]]))
      draw-level(beta-center, -1.58, label: caption([2σ#sub[g]]))
      draw-level(
        beta-center,
        -20.708,
        label: caption([1σ#sub[u]]),
        label-dy: 0.28,
        leader: true,
      )
      draw-level(
        beta-center,
        -20.712,
        label: caption([1σ#sub[g]]),
        label-dy: -0.28,
        leader: true,
      )
    },
  )
}

#align(center)[
  #orbital-energy-diagram-manual-wide()
]
