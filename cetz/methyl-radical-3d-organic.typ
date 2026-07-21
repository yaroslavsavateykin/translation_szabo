#import "@preview/cetz:0.5.2"

// Метильный радикал CH3 с пространственной p_z-орбиталью
// и энергетической диаграммой справа.
//
// Поверхность орбитали строится не как произвольный эллипсоид,
// а как изоповерхность водородоподобной орбитали 2p_z:
//
//   psi_210(x, y, z)
//     = z / (4 sqrt(2 pi) a_0^(5/2)) exp(-r / (2 a_0)),
//
//   r = sqrt(x^2 + y^2 + z^2).
//
// После перехода к безразмерным координатам 2 a_0 = 1 имеем
// psi proportional z exp(-r). Для s = |z| и
// rho = sqrt(x^2 + y^2) условие |psi| = iso даёт
//
//   rho(s) = sqrt(ln(s / iso)^2 - s^2).
//
// Профиль поверхности вычисляется именно из этого уравнения. Отдельный
// осевой масштаб используется лишь для более наглядной книжной проекции.

#let methyl-radical-3d = cetz.canvas(
  length: 0.52cm,
  padding: 0.14,
  {
    import cetz.draw: *

    let outline-stroke = (
      paint: black,
      thickness: 0.92pt,
      cap: "round",
      join: "round",
    )
    let bond-stroke = (
      paint: black,
      thickness: 0.88pt,
      cap: "round",
      join: "round",
    )
    let level-stroke = (
      paint: black,
      thickness: 0.78pt,
      cap: "round",
      join: "round",
    )
    let electron-stroke = (
      paint: black,
      thickness: 0.68pt,
      cap: "round",
      join: "round",
    )
    let mesh-back = (
      paint: luma(76%),
      thickness: 0.32pt,
      dash: "dashed",
      cap: "round",
      join: "round",
    )
    let mesh-front = (
      paint: luma(51%),
      thickness: 0.41pt,
      cap: "round",
      join: "round",
    )

    let cy = 5.10

    // Параметры изоповерхности |z| exp(-beta r) = iso.
    let beta = 1.00
    let iso = 0.16

    // Два положительных корня s exp(-beta s) = iso
    // при beta = 1 и iso = 0.16.
    let s-min = 0.19432
    let s-max = 2.89587

    // Книжная проекция: лопасти немного вытянуты вдоль оси,
    // но их профиль по-прежнему вычисляется из функции 2p_z.
    let axial-scale = 1.86
    let radial-scale = 0.70
    let node-gap = 0.12
    let depth-tilt = 0.15
    let samples = 72
    let arc-samples = 34

    let rho(s) = {
      let radius = calc.ln(s / iso) / beta
      radial-scale * calc.sqrt(calc.max(0.0, radius * radius - s * s))
    }

    // Ортографическая проекция поверхности вращения.
    // phi управляет положением точки вокруг оси p_z.
    let surface-point(s, phi, dir) = {
      let rr = rho(s)
      let depth = rr * calc.sin(phi)
      (
        rr * calc.cos(phi),
        cy + dir * (node-gap + axial-scale * (s - s-min)) + depth-tilt * depth,
      )
    }

    let sample-meridian(phi, dir) = range(samples + 1).map(i => {
      let s = s-min + (s-max - s-min) * i / samples
      surface-point(s, phi, dir)
    })

    let sample-parallel(s, phi-start, phi-stop, dir) = {
      range(arc-samples + 1).map(i => {
        let phi = phi-start + (phi-stop - phi-start) * i / arc-samples
        surface-point(s, phi, dir)
      })
    }

    let orbital-lobe(dir: 1, fill-color: luma(96%)) = {
      // Силуэт поверхности: два крайних меридиана.
      let left = sample-meridian(180deg, dir)
      let right = sample-meridian(0deg, dir).rev()
      let silhouette = left + right

      line(
        ..silhouette,
        close: true,
        fill: fill-color,
        stroke: none,
      )

      // Сначала задняя половина сетки — светлая и штриховая.
      for t in (
        0.08,
        0.16,
        0.26,
        0.38,
        0.52,
        0.66,
        0.78,
        0.88,
        0.95,
      ) {
        let s = s-min + (s-max - s-min) * t
        line(
          ..sample-parallel(s, 0deg, 180deg, dir),
          stroke: mesh-back,
        )
      }
      for phi in (22deg, 58deg, 96deg, 132deg, 168deg) {
        line(..sample-meridian(phi, dir), stroke: mesh-back)
      }

      // Затем видимая передняя половина — более тёмная и сплошная.
      for t in (
        0.08,
        0.16,
        0.26,
        0.38,
        0.52,
        0.66,
        0.78,
        0.88,
        0.95,
      ) {
        let s = s-min + (s-max - s-min) * t
        line(
          ..sample-parallel(s, 180deg, 360deg, dir),
          stroke: mesh-front,
        )
      }
      for phi in (192deg, 228deg, 264deg, 302deg, 338deg) {
        line(..sample-meridian(phi, dir), stroke: mesh-front)
      }

      // Внешний контур кладётся поверх сетки.
      line(
        ..silhouette,
        close: true,
        fill: none,
        stroke: outline-stroke,
      )
    }

    // Разная светлота подчёркивает противоположные фазы p-орбитали,
    // не добавляя лишних знаков к исходной схеме.
    orbital-lobe(dir: 1, fill-color: luma(95%))
    orbital-lobe(dir: -1, fill-color: luma(98%))

    // Связи C—H.
    line((0.23, cy), (2.58, cy), stroke: bond-stroke)
    content(
      (2.80, cy),
      anchor: "west",
      [#text(
        font: "New Computer Modern",
        size: 10.5pt,
        weight: "bold",
      )[H]],
    )

    // Связь, направленная от наблюдателя: стандартный штрихованный клин.
    // Штрихи расширяются от атома углерода к атому водорода.
    let hashed-x0 = -0.22
    let hashed-y0 = cy + 0.06
    let hashed-x1 = -2.55
    let hashed-y1 = cy + 0.40
    let hashed-dx = hashed-x1 - hashed-x0
    let hashed-dy = hashed-y1 - hashed-y0
    let hashed-length = calc.sqrt(
      hashed-dx * hashed-dx + hashed-dy * hashed-dy,
    )
    let hashed-nx = -hashed-dy / hashed-length
    let hashed-ny = hashed-dx / hashed-length

    for i in range(1, 10) {
      let t = i / 10
      let center-x = hashed-x0 + hashed-dx * t
      let center-y = hashed-y0 + hashed-dy * t
      let half-width = 0.018 + 0.165 * t

      line(
        (
          center-x - hashed-nx * half-width,
          center-y - hashed-ny * half-width,
        ),
        (
          center-x + hashed-nx * half-width,
          center-y + hashed-ny * half-width,
        ),
        stroke: (
          paint: black,
          thickness: 0.72pt,
          cap: "round",
        ),
      )
    }

    content(
      (-2.82, cy + 0.42),
      anchor: "east",
      [#text(
        font: "New Computer Modern",
        size: 10.5pt,
        weight: "bold",
      )[H]],
    )

    // Связь, направленная к наблюдателю: стандартный сплошной клин.
    line(
      (-0.19, cy - 0.07),
      (-2.57, cy - 0.91),
      (-2.39, cy - 1.20),
      close: true,
      fill: black,
      stroke: none,
    )
    content(
      (-2.77, cy - 1.12),
      anchor: "east",
      [#text(
        font: "New Computer Modern",
        size: 10.5pt,
        weight: "bold",
      )[H]],
    )

    // Белая подложка сохраняет читаемость C на фоне сетки.
    circle((0, cy), radius: 0.31, fill: white, stroke: none)
    content((0, cy), [#text(
      font: "New Computer Modern",
      size: 10.5pt,
      weight: "bold",
    )[C]])

    // Электронные стрелки с одной и той же системой координат.
    // Их стержни пересекают энергетическую линию, как в обычной
    // орбитальной диаграмме; пары на всех уровнях совпадают по высоте.
    let electron-up(x, y) = {
      let y-base = y - 0.105
      let y-tip = y + 0.67
      line((x, y-base), (x, y-tip), stroke: electron-stroke)
      line(
        (x, y-tip),
        (x - 0.090, y-tip - 0.155),
        stroke: electron-stroke,
      )
      line(
        (x, y-tip),
        (x + 0.090, y-tip - 0.155),
        stroke: electron-stroke,
      )
    }

    let electron-down(x, y) = {
      let y-top = y + 0.67
      let y-tip = y - 0.105
      line((x, y-top), (x, y-tip), stroke: electron-stroke)
      line(
        (x, y-tip),
        (x - 0.090, y-tip + 0.155),
        stroke: electron-stroke,
      )
      line(
        (x, y-tip),
        (x + 0.090, y-tip + 0.155),
        stroke: electron-stroke,
      )
    }

    // Энергетическая диаграмма справа. Все координаты уровней получаются
    // из двух шагов, а не задаются независимо: четыре sigma-линии и три
    // верхние линии поэтому остаются строго параллельными и равноотстоящими.
    let x1 = 4.55
    let x2 = 7.15
    let xc = (x1 + x2) / 2

    let sigma-bottom = 1.72
    let sigma-step = 1.10
    let sigma-levels = range(4).map(i => (
      sigma-bottom + sigma-step * i
    ))
    let sigma-top = sigma-levels.last()

    let pi-level = sigma-top + 1.34
    let upper-step = 0.94
    let upper-levels = (
      pi-level,
      pi-level + upper-step,
      pi-level + 2 * upper-step,
    )

    for y in sigma-levels + upper-levels {
      line((x1, y), (x2, y), stroke: level-stroke)
    }

    // Две точки над верхним уровнем, как в исходной схеме.
    circle(
      (xc, upper-levels.last() + 0.43),
      radius: 0.045,
      fill: black,
      stroke: none,
    )
    circle(
      (xc, upper-levels.last() + 0.75),
      radius: 0.045,
      fill: black,
      stroke: none,
    )

    // Однократно занятый pi-уровень.
    electron-up(xc, pi-level - 0.28)
    content(
      (x1 - 0.36, pi-level),
      anchor: "east",
      [#text(font: "New Computer Modern", size: 10.5pt)[$pi$]],
    )

    // Четыре заполненных sigma-уровня.
    for y in sigma-levels {
      electron-up(xc - 0.28, y - 0.28)
      electron-down(xc + 0.28, y - 0.28)
    }

    let sigma-mid = (sigma-bottom + sigma-top) / 2

    // Настоящая фигурная скобка из математического шрифта Typst.
    // CeTZ только размещает готовый растянутый глиф; никаких кривых Безье нет.
    content(
      (x1 - 0.50, sigma-mid + 0.02),
      anchor: "center",
      [#text(
        font: "New Computer Modern",
        size: 10.5pt,
      )[$stretch(brace.l, size: #5.05em)$]],
    )
    content(
      (x1 - 0.91, sigma-mid),
      anchor: "east",
      [#text(font: "New Computer Modern", size: 10.5pt)[$sigma$]],
    )
  },
)
