#import "../macros.typ": task

#set text(lang: "ru", font: "New Computer Modern", size: 12pt)
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

#let chapter_num() = {
  let nums = counter(heading).get()
  if nums.len() > 0 { str(nums.at(0)) } else { "0" }
}

#show heading.where(level: 1): it => {
  counter(math.equation).update(0)
  it
}

#set math.equation(
  numbering: n => "(" + chapter_num() + "." + str(n) + ")",
)

#set figure(
  numbering: n => "(" + chapter_num() + "." + str(n) + ")",
)

#show math.equation: set text(font: "New Computer Modern Math")


= Многочастичная теория возмущений <sec:45145d>

#include "06-01-rs-perturbation-theory.typ"
#pagebreak()

#include "06-02-diagrammatic-rs-theory.typ"
#pagebreak()

#include "06-03-orbital-perturbation-theory.typ"
#pagebreak()

#include "06-04-diagrammatic-orbital-perturbation-theory.typ"
#pagebreak()

#include "06-05-perturbation-expansion-of-correlation-energy.typ"
#pagebreak()

#include "06-06-n-dependence-of-rs-expansion.typ"
#pagebreak()

#include "06-07-diagrammatic-expansion-of-correlation-energy.typ"
