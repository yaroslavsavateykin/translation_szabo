#import "@preview/cetz:0.5.2"

// Финальная функция с точным положением RHF и сближенными минимумами Full CI / Exact
#let h2_potential_curves_with_gvb(scale-factor: 100%) = {
  // Увеличенный размер шрифта для оси Y с нативным поворотом без пробелов у |
  let y_axis_label = scale(reflow: false, rotate(-90deg)[#text(
    size: 1.2em,
  )[$E("H"_2)-2E("H") space ("а.е.")$]])

  scale(scale-factor, reflow: true)[
    #block(breakable: false, width: 100%)[
      #cetz.canvas({
        import cetz.draw: *

        // Масштабирование координат: из математического шага в сантиметры холста
        let map_x(x) = (x - 0.4) * 3.5
        let map_y(y) = (y + 0.21) * 50.0

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
        // МАССИВЫ ОПОРНЫХ ТОЧЕК КРИВЫХ (ФИНАЛЬНАЯ ТОПОЛОГИЯ)
        // ==========================================

        // 1. RHF (Штрих-пунктирная) — ИСПРАВЛЕНО: пересекает ноль строго в районе 2.84
        let rhf_data = (
          (0.78, 0.02),
          (0.85, -0.05),
          (1.00, -0.105),
          (1.20, -0.13),
          (1.40, -0.135),
          (1.60, -0.122),
          (1.80, -0.104),
          (2.00, -0.08),
          (2.20, -0.056),
          (2.46, -0.027),
          (2.76, 0.004),
          (3.1, 0.042),
        )

        // 2. UHF (Сплошная)
        let uhf_data = (
          (0.78, 0.02),
          (0.85, -0.05),
          (1.00, -0.105),
          (1.20, -0.13),
          (1.40, -0.135),
          (1.60, -0.122),
          (1.80, -0.104),
          (2.00, -0.08),
          (2.20, -0.056),
          (2.50, -0.027),
          (2.90, -0.012),
          (3.50, -0.003),
          (4.00, 0.00),
        )

        // 3. GVB (Редкий крупный пунктир)
        let gvb_data = (
          (0.79, 0.015),
          (0.90, -0.07),
          (1.10, -0.125),
          (1.30, -0.148),
          (1.42, -0.150),
          (1.60, -0.143),
          (1.80, -0.128),
          (2.10, -0.10),
          (2.50, -0.069),
          (2.90, -0.051),
          (3.40, -0.037),
          (4.00, -0.021),
        )

        // 4. Full CI (Штриховая) — ИСПРАВЛЕНО: минимум углублен до -0.165 для сближения
        let ci_data = (
          (0.80, 0.01),
          (0.92, -0.08),
          (1.10, -0.138),
          (1.30, -0.162),
          (1.42, -0.165),
          (1.56, -0.158),
          (1.76, -0.139),
          (2.10, -0.108),
          (2.50, -0.076),
          (2.90, -0.052),
          (3.40, -0.034),
          (4.00, -0.020),
        )

        // 5. Exact / Колос-Вольневич (Точечная) — ИСПРАВЛЕНО: минимум поднят до -0.171 для сближения
        let exact_data = (
          (0.81, 0.005),
          (0.95, -0.095),
          (1.15, -0.150),
          (1.35, -0.170),
          (1.40, -0.171),
          (1.56, -0.166),
          (1.78, -0.148),
          (2.10, -0.118),
          (2.50, -0.084),
          (2.90, -0.058),
          (3.40, -0.039),
          (4.00, -0.024),
        )

        // ==========================================
        // ОСИ КООРДИНАТ И ДЕЛЕНИЯ
        // ==========================================
        let axis_stroke = 1.8pt + black
        let tick_stroke = 1.2pt + black

        line(
          (map_x(0.4), map_y(-0.19)),
          (map_x(0.4), map_y(0.05)),
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
          (map_x(-0.2), map_y(0.00) - 3),
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
          0.04,
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
        // ОТРИСОВКА ВЫСОКОПЛОТНЫХ И ГЛАДКИХ КРИВЫХ
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
        line(..generate_smooth_points(gvb_data), stroke: (
          thickness: line_thickness,
          paint: black,
          dash: (4pt, 6pt),
        ))
        line(..generate_smooth_points(ci_data), stroke: (
          thickness: line_thickness,
          paint: black,
          dash: (8pt, 4pt),
        ))
        line(..generate_smooth_points(exact_data), stroke: (
          thickness: line_thickness,
          paint: black,
          dash: (2pt, 3.5pt),
        ))

        // ==========================================
        // ГЕОМЕТРИЧЕСКИЙ РИСУНОК МОЛЕКУЛЫ (ВВЕРУ)
        // ==========================================
        let ox = map_x(1.4)
        let oy = map_y(-0.02)
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
        // ТОЧНЫЕ УКАЗАТЕЛИ К КРИВЫХ (БЕЗ НАЕЗДОВ)
        // ==========================================
        let arrow_style = (end: "stealth", scale: 0.5, fill: black)
        let label_stroke = 1pt + black

        // Направляющая RHF
        content(
          (map_x(1.96), map_y(-0.043)),
          text(size: 1.2em)[RHF],
          anchor: "east",
        )
        line(
          (map_x(2), map_y(-0.04)),
          (map_x(2.47), map_y(-0.02)),
          stroke: label_stroke,
          mark: arrow_style,
        )

        // Направляющая UHF
        content(
          (map_x(3.2), map_y(-0.02)),
          text(size: 1.2em)[UHF],
          anchor: "west",
        )
        line(
          (map_x(3.15), map_y(-0.02)),
          (map_x(2.65), map_y(-0.021)),
          stroke: label_stroke,
          mark: arrow_style,
        )

        // Направляющая GVB
        content(
          (map_x(2.48), map_y(-0.0645)),
          text(size: 1.2em)[GVB],
          anchor: "east",
        )
        line(
          (map_x(2.18), map_y(-0.07)),
          (map_x(2.18), map_y(-0.09)),
          stroke: label_stroke,
          mark: arrow_style,
        )

        // Направляющая Full CI
        content(
          (map_x(2.1), map_y(-0.14)),
          text(size: 1.2em)[Full CI],
          anchor: "west",
        )
        line(
          (map_x(2.1), map_y(-0.14)),
          (map_x(1.76), map_y(-0.14)),
          stroke: label_stroke,
          mark: arrow_style,
        )

        // Направляющая Exact
        content(
          (map_x(3.1), map_y(-0.13)),
          text(size: 1.2em)[*Exact*\ (Колос-Вольневич)],
          anchor: "west",
        )
        line(
          (map_x(3.05), map_y(-0.13)),
          (map_x(2.7), map_y(-0.072)),
          stroke: label_stroke,
          mark: arrow_style,
        )
      })
    ]
  ]
}

#h2_potential_curves_with_gvb()
