#import "@preview/cetz:0.5.2": canvas, draw

  #let orbital-diagram(spin-up: true, label: none) = canvas(
    length: 1cm,
    {
      import draw: *

      let y-pos = (0, 4.5, 3.5, 2.5, 1.5, 0.5)
      let arrow-y = 1.5

      for i in (0, 1, 2) {
        line((-1, y-pos.at(i)), (1, y-pos.at(i)), stroke: 1.5pt)
      }

      for i in (0, 1, 2) {
        circle((0, 5.5 - i * 0.4), radius: 0.06, fill: black)
      }

      for i in (3, 4, 5) {
        line((-1, y-pos.at(i)), (1, y-pos.at(i)), stroke: 1.5pt)
        line(
          (0, y-pos.at(i) - 0.3),
          (0, y-pos.at(i) + 0.3),
          stroke: 1pt,
        )
        if spin-up {
          line(
            (0, y-pos.at(i) - 0.3),
            (0, y-pos.at(i) + 0.3),
            stroke: 1.5pt,
            mark: (end: ">"),
          )
        } else {
          line(
            (0, y-pos.at(i) + 0.3),
            (0, y-pos.at(i) - 0.3),
            stroke: 1.5pt,
            mark: (end: ">"),
          )
        }
      }

      if label != none {
        content((0, -0.3), label)
      }
    },
  )

  #grid(
    columns: 2,
    gutter: 3em,
    align(center, orbital-diagram(
      spin-up: true,
      label: $psi_i^alpha$,
    )),
    align(center, orbital-diagram(
      spin-up: false,
      label: $psi_i^beta$,
    )),
  )