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


= Конфигурационное взаимодействие <sec:chapter4>

#include "05-01-full-ci-matrix.typ"
#pagebreak()

#include "05-02-doubly-excited-ci.typ"
#pagebreak()

#include "05-03-illustrative-calculations.typ"
#pagebreak()

#include "05-04-natural-orbitals-and-1rdm.typ"
#pagebreak()

#include "05-05-mcscf-and-gvb.typ"
#pagebreak()

#include "05-06-truncated-ci-and-size-consistency.typ"
