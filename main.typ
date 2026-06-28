#set document(title: "Квантовая химия")
#set text(
  lang: "ru",
  // font: "New Computer Modern",
  font: "Cambria Math",
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
  numbering: "1",
)
#set par(
  justify: true,
  leading: 0.65em,
  first-line-indent: 1.2em,
)
#set heading(numbering: "1.1.")



#let title_page() = {
  align(center)[
    #v(2.8cm)
    #text(size: 16pt)[Московский государственный университет]
    #linebreak()
    #text(size: 16pt)[имени М. В. Ломоносова]
    #linebreak()
    #v(0.45cm)
    #text(size: 16pt)[Химический факультет]

    #v(3.2cm)
    #text(size: 28pt, weight: "bold")[Квантовая химия]

    #v(1.0cm)
    #text(size: 16pt, style: "italic")[Перевод книги]
    #linebreak()
    #text(size: 16pt, style: "italic")[«Modern Quantum Chemistry»]

    #v(2.0cm)
    // #rule(length: 8.6cm, stroke: 0.8pt)

    #v(4.2cm)
    #text(size: 15pt)[Москва — 23 апреля 2026 г.]
  ]
}

#title_page()
#pagebreak()

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
