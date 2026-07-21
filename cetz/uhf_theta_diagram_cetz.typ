#import "@preview/cetz:0.5.2"

#let uhf-theta-diagram(
  length: 0.5cm,
  line-width: 1.05pt,
) = cetz.canvas(
  length: length,
  {
    import cetz.draw: *

    let axis-stroke = (paint: black, thickness: line-width)
    let curve-stroke = (paint: black, thickness: line-width)

    // Горизонтальная ось со стрелкой.
    let horizontal-axis(y) = {
      line(
        (4.25, y),
        (17.55, y),
        stroke: axis-stroke,
      )

      // Наконечник стрелки.
      line(
        (17.55, y),
        (16.92, y + 0.22),
        (16.92, y - 0.22),
        close: true,
        fill: black,
        stroke: none,
      )
    }

    // ----------------------------------------------------------
    // a) Малое R: один минимум при theta = 0.
    // ----------------------------------------------------------
    let upper-y = 11.25
    let upper-x0 = 10.55

    horizontal-axis(upper-y)

    line(
      (upper-x0, upper-y),
      (upper-x0, 18.95),
      stroke: axis-stroke,
    )

    // В CeTZ порядок аргументов bezier:
    // начальная точка, конечная точка, управляющая 1, управляющая 2.
    bezier(
      (7.15, 18.50),
      (upper-x0, 12.80),
      (7.90, 15.85),
      (8.95, 12.80),
      stroke: curve-stroke,
    )
    bezier(
      (upper-x0, 12.80),
      (14.18, 18.50),
      (12.10, 12.80),
      (13.32, 15.85),
      stroke: curve-stroke,
    )

    content(
      (0.55, 13.72),
      [a) Маленькие $R$],
      anchor: "west",
    )

    content(
      (10.82, 17.10),
      [$E_0(theta)$],
      anchor: "west",
    )

    content(
      (upper-x0, 10.82),
      [$0$],
      anchor: "north",
    )

    content(
      (17.08, 10.82),
      [$theta$],
      anchor: "north",
    )

    // ----------------------------------------------------------
    // b) Большое R: симметричная двухъямная кривая.
    // ----------------------------------------------------------
    let lower-y = 0.65
    let lower-x0 = 10.55

    horizontal-axis(lower-y)

    line(
      (lower-x0, lower-y),
      (lower-x0, 9.65),
      stroke: axis-stroke,
    )

    bezier(
      (6.42, 9.10),
      (9.08, 3.85),
      (7.05, 6.65),
      (7.88, 3.85),
      stroke: curve-stroke,
    )
    bezier(
      (9.08, 3.85),
      (lower-x0, 5.55),
      (9.82, 3.85),
      (9.88, 5.55),
      stroke: curve-stroke,
    )
    bezier(
      (lower-x0, 5.55),
      (12.03, 3.85),
      (11.18, 5.55),
      (11.30, 3.85),
      stroke: curve-stroke,
    )
    bezier(
      (12.03, 3.85),
      (14.48, 9.28),
      (13.25, 3.85),
      (13.92, 6.70),
      stroke: curve-stroke,
    )

    content(
      (0.72, 4.55),
      [b) Маленькие $R$],
      anchor: "west",
    )

    content(
      (10.86, 8.15),
      [$E_0(theta)$],
      anchor: "west",
    )

    content(
      (lower-x0, 0.20),
      [$0$],
      anchor: "north",
    )

    content(
      (17.08, 0.20),
      [$theta$],
      anchor: "north",
    )
  },
)
