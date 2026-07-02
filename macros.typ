// macros.typ

#let task-kind = "task"

#let task-counter = counter(
  figure.where(kind: task-kind),
)

#let task(body) = figure(
  block(
    width: 100%,
    breakable: true,
    inset: (
      left: 1em,
      right: 0.8em,
      top: 0.65em,
      bottom: 0.65em,
    ),
    stroke: (
      left: 2.5pt + rgb("#3d5a80"),
      right: none,
      top: none,
      bottom: none,
    ),
    radius: 0pt,
    fill: rgb("#f6f8fb"),
    above: 0.8em,
    below: 0.8em,
  )[
    #context {
      // Отменяем стандартное центрирование содержимого figure.
      set align(left)

      set par(
        justify: true,
        first-line-indent: 0pt,
      )

      let number = task-counter.display("1")

      [
        *Задача #number.*
        #body
      ]
    }
  ],

  kind: task-kind,
  supplement: [задача],
  numbering: "1",

  // Поэтому никакой подписи снизу не будет.
  caption: none,

  outlined: false,
)
