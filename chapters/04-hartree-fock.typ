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


= Приближение Хартри-Фока <sec:chapter3>

#include "04-01-hartree-fock-equations.typ"
#pagebreak()

#include "04-02-derivation-of-hartree-fock-equations.typ"
#pagebreak()

#include "04-03-interpretation-of-solutions-to-hf-equations.typ"
#pagebreak()

#include "04-04-roothaan-equations.typ"
#pagebreak()

#include "04-05-model-calculations-on-h2-and-heh-plus.typ"
#pagebreak()

#include "04-06-polyatomic-basis-sets.typ"
#pagebreak()

#include "04-07-illustrative-closed-shell-hf.typ"
#pagebreak()

#include "04-08-unrestricted-open-shell-hf.typ"
