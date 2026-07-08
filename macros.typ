// ============================================================================
// в settings.typ есть правило переноса на другую страницу
#let task-kind = "task"

#let task-counter = counter(
  figure.where(kind: task-kind),
)

#let task-numbering(number) = context {
  let chapter = counter(heading).get().first()

  numbering(
    "1.1",
    chapter,
    number,
  )
}

#let reset-task-counter(heading-body) = [
  #task-counter.update(0)
  #heading-body
]

#let task(
  body,
  breakable: true,
) = figure(
  block(
    width: 100%,
    breakable: breakable,

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
      set align(left)

      set par(
        justify: true,
        first-line-indent: 0pt,
      )

      let number = task-counter.display(
        task-numbering,
      )

      [
        *Задача #number.*

        #body
      ]
    }
  ],

  kind: task-kind,
  supplement: [задача],
  numbering: task-numbering,
  caption: none,
  outlined: false,
)

// ============================================================================

#let placeholder(body) = box(
  fill: rgb(240, 120, 120),
  // stroke: (
  //   left: 3pt + rgb(220, 20, 60),
  // ),
  inset: 3pt,
)[
  #body
]

// ============================================================================
#let theorem-kind = "theorem"

#let theorem(
  body,
  name: none,
  breakable: true,
) = figure(
  block(
    width: 100%,
    breakable: breakable,

    inset: (
      left: 1em,
      right: 0.8em,
      top: 0.65em,
      bottom: 0.65em,
    ),

    stroke: (
      left: 2.5pt + rgb("#ee6c4d"),
      right: none,
      top: none,
      bottom: none,
    ),

    radius: 0pt,
    fill: rgb("#fdf3f0").transparentize(30%),
    above: 0.8em,
    below: 0.8em,
  )[
    #set align(left)

    #set par(
      justify: true,
      first-line-indent: 0pt,
    )

    #body
  ],

  kind: theorem-kind,
  supplement: [теорема],
  numbering: none,
  caption: none,
  outlined: false,
)

// ============================================================================
