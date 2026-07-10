#import "settings.typ": book-template
#show: book-template

#include "titlepage.typ"

#counter(page).update(1)

#include "chapters/00-introduction.typ"
#pagebreak()

#outline(title: [Содержание])
#pagebreak()


#include "chapters/01-glossary.typ"
#pagebreak()

= Математический обзор <математический-обзор>

#include "lin_alg.typ"
#pagebreak()
// здесь еще куча всяких видимо глав от Амины и Максима

#include "chapters/00-eigenvectors-and-etc.typ"
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
