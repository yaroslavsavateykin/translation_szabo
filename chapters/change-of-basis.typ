#import "../macros.typ": sub-eq, task

В подразделе 1.1.1 мы видели, что выбор базиса не является
единственным. Пусть даны два полных ортонормированных базиса
$brace.l|i chevron.r brace.r$ и
$brace.l|alpha chevron.r brace.r$; теперь нужно найти связь
между ними. Для обозначения бра- и кет-векторов первого базиса будем
использовать латинские буквы $i comma j comma k comma dots.h$, а для
бра- и кет-векторов второго базиса — греческие буквы
$alpha comma beta comma gamma$. Поэтому имеем

#sub-eq("a")[
  $
    chevron.l i|j chevron.r eq delta_(i j) comma quad
    sum_i|i chevron.r chevron.l i|eq 1
  $ <eq:162a>
]

и

#sub-eq("b", same: true)[
  $
    chevron.l alpha|beta chevron.r eq delta_(alpha beta) comma quad
    sum_alpha|alpha chevron.r chevron.l alpha|eq 1
  $ <eq:162b>
]

Поскольку базис $brace.l|i chevron.r brace.r$ полон, любой кет
из базиса $brace.l|alpha chevron.r brace.r$ можно выразить как
линейную комбинацию кетов базиса $brace.l|i chevron.r brace.r$,
и наоборот. То есть

$
  | alpha chevron.r eq 1|alpha chevron.r
  eq sum_i|i chevron.r chevron.l i|alpha chevron.r
  eq sum_i|i chevron.r U_(i alpha)
$ <eq:163>

где мы определили элементы матрицы преобразования $bb(U)$ как

$
  chevron.l i|alpha chevron.r eq U_(i alpha) eq (bb(U))_(i alpha)
$ <eq:164>

При преобразовании в противоположном направлении получаем

$
  | i chevron.r eq 1|i chevron.r
  eq sum_alpha|alpha chevron.r chevron.l alpha|i chevron.r
  eq sum_alpha|alpha chevron.r U_(i alpha)^ast.basic
  eq sum_alpha|alpha chevron.r (bb(U)^dagger)_(alpha i)
$ <eq:165>

где использованы уравнение @eq:149 и определение сопряжённой матрицы,
показывающие, что

$
  chevron.l alpha|i chevron.r eq (chevron.l i|alpha chevron.r)^ast.basic
  eq U_(i alpha)^ast.basic eq (bb(U)^dagger)_(alpha i)
$ <eq:166>

Важно помнить, что, поскольку $bb(U)$ определена уравнением @eq:164,
$chevron.l alpha|i chevron.r$ не равно $U_(alpha i)$, а задаётся
уравнением @eq:166. Теперь докажем, что матрица преобразования $bb(U)$
унитарна. Это является следствием ортонормированности базисов:

$
  delta_(i j) eq chevron.l i|j chevron.r
  & eq sum_(alpha beta) chevron.l i|alpha chevron.r
  chevron.l alpha|beta chevron.r chevron.l beta|j chevron.r \
  & eq sum_alpha (bb(U))_(i alpha) (bb(U)^dagger)_(alpha j) \
  & eq (bb(U) bb(U)^dagger)_(i j)
$

В матричной записи это просто

#sub-eq("a")[
  $
    bb(1) eq bb(U) bb(U)^dagger
  $ <eq:167a>
]

Аналогично, начиная с $chevron.l alpha|beta chevron.r eq
delta_(alpha beta)$, можно показать, что

#sub-eq("b", same: true)[
  $
    bb(1) eq bb(U)^dagger bb(U)
  $ <eq:167b>
]

и, следовательно, $bb(U)$ унитарна. Таким образом, мы приходим к
важному результату: два ортонормированных базиса связаны унитарной
матрицей через уравнение @eq:163 и обратное к нему уравнение @eq:165.
Как показывает уравнение @eq:164, элементы матрицы преобразования
$bb(U)$ являются скалярными произведениями между векторами двух
базисов.

Теперь рассмотрим, как связаны матричные представления оператора
$hat(O)$ в двух разных полных ортонормированных базисах. Полученный
результат будет играть центральную роль в следующем подразделе, где мы
будем рассматривать задачу на собственные значения. Пусть $bb(O)$ —
матричное представление $hat(O)$ в базисе
$brace.l|i chevron.r brace.r$, а $bb(Omega)$ — его матричное
представление в базисе $brace.l|alpha chevron.r brace.r$:

#sub-eq("a")[
  $
    hat(O)|i chevron.r eq sum_j|j chevron.r chevron.l j|hat(O)|i chevron.r
    eq sum_j|j chevron.r O_(j i)
  $ <eq:168a>
]

#sub-eq("b", same: true)[
  $
    hat(O)|alpha chevron.r eq sum_beta|beta chevron.r chevron.l beta|hat(O)|alpha chevron.r
    eq sum_beta|beta chevron.r Omega_(beta alpha)
  $ <eq:168b>
]

Чтобы найти связь между $bb(O)$ и $bb(Omega)$, используем уже знакомый
приём введения единичного оператора:

$
  Omega_(alpha beta) eq chevron.l alpha|hat(O)|beta chevron.r
  & eq chevron.l alpha|1 hat(O) 1|beta chevron.r \
  & eq sum_(i j) chevron.l alpha|i chevron.r
  chevron.l i|hat(O)|j chevron.r
  chevron.l j|beta chevron.r \
  & eq sum_(i j) (bb(U)^dagger)_(alpha i) O_(i j) U_(j beta)
$ <eq:169>

Следовательно,

#sub-eq("a")[
  $
    bb(Omega) eq bb(U)^dagger bb(O) bb(U)
  $ <eq:170a>
]

или, умножая слева на $bb(U)$, а справа на $bb(U)^dagger$,

#sub-eq("b", same: true)[
  $
    bb(O) eq bb(U) bb(Omega) bb(U)^dagger
  $ <eq:170b>
]

Эти уравнения показывают, что матрицы $bb(O)$ и $bb(Omega)$ связаны
унитарным преобразованием. Важность таких преобразований состоит в
том, что для любого эрмитова оператора, матричное представление
которого в базисе $brace.l|i chevron.r brace.r$ недиагонально,
всегда можно найти базис $brace.l|alpha chevron.r brace.r$, в
котором матричное представление оператора диагонально, т. е.

$
  Omega_(alpha beta) eq omega_alpha delta_(alpha beta)
$ <eq:171>

В следующем подразделе мы рассмотрим задачу диагонализации эрмитовых
матриц унитарными преобразованиями.

#task()[
  Покажите, что след матрицы инвариантен относительно унитарного
  преобразования, т. е. если

  $
    bb(Omega) eq bb(U)^dagger bb(O) bb(U)
  $

  то $tr bb(Omega) eq tr bb(O)$.
]
