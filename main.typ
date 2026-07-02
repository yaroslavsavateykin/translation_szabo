#set document(title: "Квантовая химия")
#set text(
  lang: "ru",
  font: "New Computer Modern",
  size: 12pt,
)


#set page(
  paper: "a4",
  margin: (
    left: 2cm,
    right: 2cm,
    top: 2cm,
    bottom: 2cm,
  ),
)
#set par(
  justify: true,
  leading: 0.65em,
  first-line-indent: 1.2em,
)
#set heading(numbering: "1.1.")



#set math.equation(numbering: "(1)")
#show math.equation: equation => {
  if (
    equation.block and not equation.has("label") and equation.numbering != none
  ) [
    #counter(math.equation).update(
      number => calc.max(number - 1, 0),
    )

    #math.equation(
      equation.body,
      block: true,
      numbering: none,
    )
  ] else {
    equation
  }
}

#show ref: it => {
  let el = it.element
  if el != none and el.func() == math.equation {
    let n = counter(math.equation).at(el.location())
    link(el.location(), [#numbering(el.numbering, ..n)])
  } else if el != none and el.func() == figure {
    let n = counter(figure.where(kind: el.kind)).at(el.location())
    let prefix = if el.kind == table { [табл. ] } else { [рис. ] }
    link(el.location(), [#prefix#numbering(el.numbering, ..n)])
  } else {
    it
  }
}



#align(center)[
  #text(size: 16pt)[Московский государственный университет]
  #linebreak()
  #text(size: 16pt)[имени М. В. Ломоносова]
  #linebreak()
  #v(0.45cm)
  #text(size: 16pt)[Химический факультет]

  #v(3.5cm)
  #text(size: 16pt)[_Перевод избранных\ глав книги_]
  #v(1cm)
  #smallcaps()[
    #text(size: 23pt)[_Modern Quantum Chemistry_]
  ]

  #text(size: 18pt)[
    Introduction to Advanced\ Electronic Structure Theory

  ]

  #text(size: 16pt)[
    A. Szabo, N. S. Ostlund
  ]


  #v(2.0cm)
  // #rule(length: 8.6cm, stroke: 0.8pt)

  #v(4.2cm)
  #align(bottom)[
    #text(size: 15pt)[Москва 2026 г.]
  ]
]

#pagebreak()

#set page(numbering: "1")
#counter(page).update(1)

#include "chapters/00-introduction.typ"
#pagebreak()

#outline(title: [Содержание])
#pagebreak()

#include "chapters/01-glossary.typ"
#pagebreak()

#include "chapters/02-mathematical-review.typ"
#pagebreak()

#include "chapters/03-many-electron-wave-functions-and-operators.typ"
#pagebreak()

#include "chapters/04-hartree-fock.typ"
#pagebreak()

#include "chapters/05-configuration-interaction.typ"
#pagebreak()

#include "chapters/06-many-body-perturbation-theory.typ"
