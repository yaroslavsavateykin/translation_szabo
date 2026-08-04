#import "@preview/cetz:0.5.2"

#let cetz-bracket(i, j, k, l) = context {
  let size = text.size

  box(baseline: 24%, cetz.canvas({
    import cetz.draw: *

    // 1. Стили двусторонних залитых стрелок под шрифт
    set-style(
      stroke: 0.5pt,
      mark: (
        start: ">",
        end: ">",
        fill: black,
        scale: 0.65,
      ),
    )

    // 2. Посимвольный вывод выражения без пробелов (выравнивание по левому краю)
    content((0.00, 0), $chevron.l$, anchor: "west")
    content((0.18, 0), $#i$, name: "i", anchor: "west")
    content((0.36, 0), $#j$, name: "j", anchor: "west")
    content((0.57, 0), $|$, anchor: "west")
    content((0.69, 0), $#k$, name: "k", anchor: "west")
    content((0.90, 0), $#l$, name: "l", anchor: "west")
    content((1.08, 0), $chevron.r$, anchor: "west")

    // 3. Верхняя двусторонняя стрелка (от i к k)
    let y-up = 0.35
    line(
      "i.north",
      (rel: (0, y-up), to: "i.north"),
      (rel: (0, y-up), to: "k.north"),
      "k.north",
    )

    // 4. Нижняя двусторонняя стрелка (от j к l)
    let y-down = -0.32
    line(
      "j.south",
      (rel: (0, y-down), to: "j.south"),
      (rel: (0, y-down - 0.03), to: "l.south"),
      "l.south",
    )
  }))
}
