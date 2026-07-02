#import "@preview/cetz:0.5.2"


// Воспроизводит геометрию исходного рисунка.
// Единица координат CeTZ по умолчанию равна 1 cm.
#let aperture-figure = cetz.canvas(
  // length: 0.8cm,
  {
    import cetz.draw: *

    let slit-width = 0.68
    let slit-height = 13.50
    let half-slit = slit-width / 2

    // Детерминированная псевдослучайная величина в диапазоне [0, 1).
    // Она нужна только для воспроизводимой точечной штриховки.
    let noise(i, a, b, c) = {
      calc.rem(i * a + i * i * b + c, 1009) / 1009
    }

    // Белое поле внутри узкой центральной полосы.
    rect(
      (-half-slit, 0),
      (half-slit, slit-height),
      fill: white,
      stroke: none,
    )

    // Основной слой точек по всей высоте полосы.
    for i in range(430) {
      let x = (
        -half-slit + 0.025 + noise(i, 73, 29, 100) * (slit-width - 0.05)
      )
      let y = (
        0.035 + noise(i + 127, 151, 43, 100) * (slit-height - 0.07)
      )
      let r = 0.006 + noise(i + 311, 89, 37, 7) * 0.010

      circle((x, y), radius: r, fill: black, stroke: none)
    }

    // Более плотная штриховка в верхней части, как на оригинале.
    for i in range(300) {
      let x = (
        -half-slit + 0.025 + noise(i + 509, 97, 41, 23) * (slit-width - 0.05)
      )
      let y = (
        6.35 + noise(i + 701, 137, 53, 11) * (slit-height - 6.39)
      )
      let r = 0.006 + noise(i + 887, 83, 47, 19) * 0.012

      circle((x, y), radius: r, fill: black, stroke: none)
    }

    // Несколько более крупных пятен делают фактуру похожей на скан.
    for i in range(95) {
      let x = (
        -half-slit + 0.035 + noise(i + 1013, 109, 61, 29) * (slit-width - 0.07)
      )
      let y = (
        0.08 + noise(i + 1217, 163, 67, 13) * (slit-height - 0.16)
      )
      let r = 0.013 + noise(i + 1429, 79, 71, 37) * 0.013

      circle((x, y), radius: r, fill: black, stroke: none)
    }

    // Три вложенных прямоугольника.
    rect((-2.68, 0), (2.68, 1.70), stroke: 1.15pt)
    rect((-1.35, 0), (1.35, 3.40), stroke: 1.15pt)
    rect((-0.66, 0), (0.66, 6.80), stroke: 1.15pt)

    // Контур узкой центральной полосы поверх штриховки.
    rect(
      (-half-slit, 0),
      (half-slit, slit-height),
      stroke: 1.15pt,
    )

    // Горизонтальная ось и короткая отметка x = 0.
    line((-5.34, 0), (5.34, 0), stroke: 1.20pt)
    line((0, 0), (0, -0.22), stroke: 1.00pt)

    // Вертикальный размер 1/(2 epsilon).
    line(
      (-3.50, 0),
      (-3.50, 13.46),
      stroke: 1.05pt,
      mark: (
        start: "stealth",
        end: "stealth",
        fill: black,
        stroke: black,
        length: 0.24,
        width: 0.16,
        inset: 0.045,
        transform-shape: false,
      ),
    )

    content(
      (-3.50, 7.05),
      box(fill: white, inset: 0.6em, $ frac(1, 2 epsilon) $),
      anchor: "center",
    )

    // Две стрелки, направленные к краям щели; между ними подпись 2 epsilon.
    line(
      (-1.32, 13.92),
      (-0.43, 13.92),
      stroke: 1.00pt,
      mark: (
        end: "stealth",
        fill: black,
        stroke: black,
        length: 0.22,
        width: 0.14,
        inset: 0.04,
        transform-shape: false,
      ),
    )
    line(
      (1.32, 13.92),
      (0.43, 13.92),
      stroke: 1.00pt,
      mark: (
        end: "stealth",
        fill: black,
        stroke: black,
        length: 0.22,
        width: 0.14,
        inset: 0.04,
        transform-shape: false,
      ),
    )
    content(
      (0, 13.92),
      box(fill: white, inset: (x: 2pt, y: 0.5pt), $ 2 epsilon $),
      anchor: "center",
    )

    content((0, -0.42), $x = 0$, anchor: "north")
  },
)

#align(center, aperture-figure)
