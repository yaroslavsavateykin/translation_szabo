#import "@preview/cetz:0.5.2"

#let h2_potential_curves(scale-factor: 100%) = {
  let y_axis_label = scale(reflow: false, rotate(-90deg)[#text(
    size: 1.2em,
  )[$E("H"_2)-2E("H") space ("а.e.")$]])
  scale(scale-factor, reflow: true)[
    #block(breakable: false, width: 100%)[
      #cetz.canvas({
        import cetz.draw: *

        // Масштабирование координат: из математического шага в сантиметры холста
        let map_x(x) = (x - 0.4) * 3.0
        let map_y(y) = (y + 0.21) * 40.0

        // ==========================================
        // МАТЕМАТИЧЕСКИЙ АЛГОРИТМ ГЕНЕРАЦИИ 100+ ТОЧЕК
        // ==========================================
        let generate_smooth_points(data, steps_per_segment: 100) = {
          let n = data.len()
          if n < 2 { return data }

          let pts = ()
          for i in range(0, n - 1) {
            let p0 = data.at(calc.max(0, i - 1))
            let p1 = data.at(i)
            let p2 = data.at(i + 1)
            let p3 = data.at(calc.min(n - 1, i + 2))

            for j in range(0, steps_per_segment) {
              let t = j / steps_per_segment
              let t2 = t * t
              let t3 = t2 * t

              let x = (
                0.5
                  * (
                    (2 * p1.at(0))
                      + (-p0.at(0) + p2.at(0)) * t
                      + (
                        2 * p0.at(0)
                          - 5 * p1.at(0)
                          + 4 * p2.at(0)
                          - p3.at(0)
                      )
                        * t2
                      + (
                        -p0.at(0)
                          + 3 * p1.at(0)
                          - 3 * p2.at(0)
                          + p3.at(0)
                      )
                        * t3
                  )
              )
              let y = (
                0.5
                  * (
                    (2 * p1.at(1))
                      + (-p0.at(1) + p2.at(1)) * t
                      + (
                        2 * p0.at(1)
                          - 5 * p1.at(1)
                          + 4 * p2.at(1)
                          - p3.at(1)
                      )
                        * t2
                      + (
                        -p0.at(1)
                          + 3 * p1.at(1)
                          - 3 * p2.at(1)
                          + p3.at(1)
                      )
                        * t3
                  )
              )
              pts.push((map_x(x), map_y(y)))
            }
          }
          let last = data.at(n - 1)
          pts.push((map_x(last.at(0)), map_y(last.at(1))))
          pts
        }

        // ==========================================
        // МАССИВЫ ОПОРНЫХ ТОЧЕК КРИВЫХ
        // ==========================================
        let rhf_data = (
          (0.775, -0.035),
          (0.85, -0.085),
          (1.00, -0.13),
          (1.20, -0.17),
          (1.40, -0.184),
          (1.60, -0.173),
          (1.80, -0.144),
          (2.00, -0.098),
          (2.20, -0.05),
          (2.40, 0.00),
          (2.53, 0.03),
        )

        let uhf_data = (
          (0.72, 0.03),
          (0.80, -0.06),
          (1.00, -0.13),
          (1.20, -0.17),
          (1.40, -0.184),
          (1.60, -0.173),
          (1.80, -0.144),
          (2.00, -0.098),
          (2.12, -0.076),
          (2.28, -0.054),
          (2.45, -0.038),
          (2.70, -0.024),
          (3.10, -0.012),
          (3.60, -0.004),
          (4.00, -0.002),
        )

        let ci_data = (
          (0.78, 0.02),
          (0.92, -0.09),
          (1.06, -0.136),
          (1.18, -0.158),
          (1.30, -0.170),
          (1.42, -0.174),
          (1.54, -0.171),
          (1.68, -0.165),
          (1.85, -0.151),
          (2.05, -0.127),
          (2.45, -0.089),
          (2.80, -0.06),
          (3.20, -0.038),
          (3.60, -0.023),
          (4.00, -0.015),
        )

        let exact_data = (
          (0.81, 0.01),
          (0.95, -0.11),
          (1.15, -0.175),
          (1.40, -0.204),
          (1.65, -0.191),
          (1.95, -0.153),
          (2.40, -0.095),
          (2.90, -0.050),
          (3.30, -0.026),
          (3.65, -0.012),
          (4.00, -0.008),
        )

        // ==========================================
        // ОСИ КООРДИНАТ И ДЕЛЕНИЯ
        // ==========================================
        let axis_stroke = 1.8pt + black
        let tick_stroke = 1.2pt + black

        line(
          (map_x(0.4), map_y(-0.21)),
          (map_x(0.4), map_y(0.03)),
          stroke: axis_stroke,
        )
        line(
          (map_x(0.4), map_y(0.00)),
          (map_x(4.0), map_y(0.00)),
          stroke: axis_stroke,
        )

        content(
          (map_x(4.0) + 0.2, map_y(0.00) + 0.4),
          text(size: 1.2em)[R (а.е.)],
          anchor: "west",
        )
        content(
          (map_x(-0.25), map_y(-0.075)),
          y_axis_label,
          anchor: "center",
        )

        // Тики оси X
        for x_val in (0.6, 1.0, 1.4, 1.8, 2.2, 2.6, 3.0, 3.4) {
          let cx = map_x(x_val)
          let cy = map_y(0.00)
          line((cx, cy), (cx, cy + 0.2), stroke: tick_stroke)
          content(
            (cx, cy + 0.3),
            text(size: 1.05em)[#str(x_val)],
            anchor: "south",
          )
        }

        // Тики оси Y
        let y_vals = (
          0.02,
          0.00,
          -0.02,
          -0.04,
          -0.06,
          -0.08,
          -0.10,
          -0.12,
          -0.14,
          -0.16,
          -0.18,
          -0.20,
        )
        for y_val in y_vals {
          let cx = map_x(0.4)
          let cy = map_y(y_val)
          line((cx, cy), (cx - 0.2, cy), stroke: tick_stroke)
          content(
            (cx - 0.3, cy),
            text(size: 1.05em)[#str(y_val)],
            anchor: "east",
          )
        }

        // ==========================================
        // ОТРИСОВКА КРИВЫХ
        // ==========================================
        let line_thickness = 2.5pt
        line(..generate_smooth_points(rhf_data), stroke: (
          thickness: line_thickness,
          paint: black,
          dash: (12pt, 4pt, 2pt, 4pt),
        ))
        line(..generate_smooth_points(uhf_data), stroke: (
          thickness: line_thickness,
          paint: black,
          dash: "solid",
        ))
        line(..generate_smooth_points(ci_data), stroke: (
          thickness: line_thickness,
          paint: black,
          dash: (8pt, 5pt),
        ))
        line(..generate_smooth_points(exact_data), stroke: (
          thickness: line_thickness,
          paint: black,
          dash: (2pt, 3.5pt),
        ))

        // ==========================================
        // ГЕОМЕТРИЧЕСКИЙ РИСУНОК МОЛЕКУЛЫ (ВВЕРХУ)
        // ==========================================
        let ox = map_x(1.4)
        let oy = map_y(-0.03)
        let mol_arrow_style = (
          start: "stealth",
          end: "stealth",
          scale: 0.5,
          fill: black,
        )

        circle((ox - 0.7, oy), radius: 0.35, stroke: 1.2pt + black)
        circle((ox + 0.7, oy), radius: 0.35, stroke: 1.2pt + black)
        line(
          (ox - 0.775, oy),
          (ox + 0.775, oy),
          stroke: 1.2pt + black,
          mark: mol_arrow_style,
        )
        content(
          (ox, oy + 0.55),
          text(size: 1.3em)[$R$],
          anchor: "center",
        )

        // ==========================================
        // БЕЗОПАСНЫЕ НАПРАВЛЯЮЩИЕ И ТЕКСТОВЫЕ МЕТКИ
        // ==========================================
        let arrow_style = (end: "stealth", scale: 0.5, fill: black)
        let label_stroke = 1pt + black

        // Выноска RHF: смещена выше, указывает на поднимающийся хвост
        content(
          (map_x(1.72), map_y(-0.06)),
          text(size: 1.3em)[RHF],
          anchor: "east",
        )
        line(
          (map_x(1.75), map_y(-0.057)),
          (map_x(2.2), map_y(-0.042)),
          stroke: label_stroke,
          mark: arrow_style,
        )

        // Выноска UHF: вынесена вправо, указывает на сплошную линию диссоциации
        content(
          (map_x(2.58), map_y(-0.04)),
          text(size: 1.3em)[UHF],
          anchor: "west",
        )
        line(
          (map_x(2.58), map_y(-0.045)),
          (map_x(2.28), map_y(-0.058)),
          stroke: label_stroke,
          mark: arrow_style,
        )

        // Выноска Full CI: смещена ниже линии, указывает снизу вверх
        content(
          (map_x(2.25), map_y(-0.1655)),
          text(size: 1.3em)[Full CI],
          anchor: "west",
        )
        line(
          (map_x(2.22), map_y(-0.165)),
          (map_x(1.9), map_y(-0.16)),
          stroke: label_stroke,
          mark: arrow_style,
        )

        // Выноска Exact: опущена в самый низ, ведет к нижней точечной кривой
        content(
          (map_x(3.02), map_y(-0.115)),
          text(size: 1.3em)[*Точная кривая*\ (Колос-Вольневич)],
          anchor: "west",
        )
        line(
          (map_x(3.05), map_y(-0.095)),
          (map_x(2.95), map_y(-0.05)),
          stroke: label_stroke,
          mark: arrow_style,
        )
      })
    ]
  ]
}

#h2_potential_curves()
