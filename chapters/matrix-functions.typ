#import "../macros.typ": sub-eq, task

Для заданной эрмитовой матрицы $bb(A)$ можно определить функцию от
$bb(A)$, т. е. $f (bb(A))$, почти так же, как определяется функция
$f (x)$ от простой переменной $x$. Например, квадратный корень из
матрицы $bb(A)$, обозначаемый $bb(A)^(1 slash 2)$, — это просто такая
матрица, которая при умножении на саму себя даёт $bb(A)$, т. е.

$
  bb(A)^(1 slash 2) bb(A)^(1 slash 2) eq bb(A)
$ <eq:1108>

Синус или экспонента матрицы определяются через ряд Тейлора
соответствующей функции, например

$
  exp (bb(A)) eq bb(1) plus frac(1, 1 excl) bb(A)
  plus frac(1, 2 excl) bb(A)^2 plus frac(1, 3 excl) bb(A)^3 plus dots.h
$

или в общем виде

$
  f (bb(A)) eq sum_(n eq 0)^oo c_n bb(A)^n
$ <eq:1109>

После этих определений остаётся задача вычисления $bb(A)^(1 slash 2)$ или
$exp (bb(A))$. Если $bb(A)$ — диагональная матрица,

$
  (bb(A))_(i j) eq a_i delta_(i j)
$

то всё просто, поскольку

$
  bb(A)^n eq mat(
    delim: "(", a_1^n, 0, dots.h, 0;
    0, a_2^n, dots.h, 0;
    dots.v, dots.v, dots.down, dots.v;
    0, 0, dots.h, a_N^n
  )
$ <eq:1110>

и поэтому

$
  f (bb(A)) eq sum_(n eq 0)^oo c_n bb(A)^n & eq mat(
                                                   delim: "(", sum_n c_n a_1^n, 0, dots.h, 0;
                                                   0, sum_n c_n a_2^n, dots.h, 0;
                                                   dots.v, dots.v, dots.down, dots.v;
                                                   0, 0, dots.h, sum_n c_n a_N^n
                                                 ) \
                                               & eq mat(
                                                   delim: "(", f (a_1), 0, dots.h, 0;
                                                   0, f (a_2), 0, dots.h, 0;
                                                   dots.v, dots.v, dots.down, dots.v;
                                                   0, 0, dots.h, f (a_N)
                                                 )
$ <eq:1111>

Аналогично квадратный корень из диагональной матрицы имеет вид

$
  bb(A)^(1 slash 2) eq mat(
    delim: "(", a_1^(1 slash 2), 0, dots.h, 0;
    0, a_2^(1 slash 2), dots.h, 0;
    dots.v, dots.v, dots.down, dots.v;
    0, 0, dots.h, a_N^(1 slash 2)
  )
$ <eq:1112>

Что делать, если $bb(A)$ не диагональна? Поскольку $bb(A)$ эрмитова, всегда
можно найти унитарное преобразование, диагонализующее её, т. е.

#sub-eq("a")[
  $
    bb(U)^dagger bb(A) bb(U) eq bb(a)
  $ <eq:1113a>
]

Обратное преобразование, которое «раздиагонализует» $bb(a)$, имеет вид

#sub-eq("b", same: true)[
  $
    bb(A) eq bb(U) bb(a) bb(U)^dagger
  $ <eq:1113b>
]

Теперь заметим, что

$
  bb(A)^2 eq bb(U) bb(a) bb(U)^dagger bb(U) bb(a) bb(U)^dagger
  eq bb(U) bb(a)^2 bb(U)^dagger
$

или в общем случае

$
  bb(A)^n eq bb(U) bb(a)^n bb(U)^dagger
$ <eq:1114>

поэтому

$
  f (bb(A)) eq sum_n c_n bb(A)^n
  eq bb(U) (sum_n c_n bb(a)^n) bb(U)^dagger
  eq bb(U) f (bb(a)) bb(U)^dagger
$

то есть

$
  f (bb(A)) eq bb(U)
  mat(
    delim: "(", f (a_1), 0, dots.h, 0;
    0, f (a_2), dots.h, 0;
    dots.v, dots.v, dots.down, dots.v;
    0, 0, dots.h, f (a_N)
  )
  bb(U)^dagger
$ <eq:1115>

Следовательно, чтобы вычислить любую функцию эрмитовой матрицы $bb(A)$,
сначала диагонализуют $bb(A)$ и получают $bb(a)$ — диагональную матрицу,
содержащую все собственные значения $bb(A)$. Затем вычисляют
$f (bb(a))$, что просто, потому что $bb(a)$ диагональна. Наконец,
$f (bb(a))$ «раздиагонализуют» с помощью @eq:1113b, получая @eq:1115.
Например, квадратный корень из матрицы $bb(A)$ можно найти как

$
  bb(A)^(1 slash 2) eq bb(U) bb(a)^(1 slash 2) bb(U)^dagger
$

поскольку

$
  bb(A)^(1 slash 2) bb(A)^(1 slash 2)
  & eq bb(U) bb(a)^(1 slash 2) bb(U)^dagger bb(U) bb(a)^(1 slash 2) bb(U)^dagger \
  & eq bb(U) bb(a)^(1 slash 2) bb(a)^(1 slash 2) bb(U)^dagger
  eq bb(U) bb(a) bb(U)^dagger eq bb(A)
$

Если описанная выше процедура приводит к бесконечному результату для
$f (bb(A))$, то $f (bb(A))$ не существует. Например, если попытаться
вычислить обратную матрицу $bb(A)^(-1)$ для матрицы $bb(A)$, имеющей
нулевое собственное значение (скажем, $a_i eq 0$), то
$f (a_i) eq 1 / a_i eq oo$, и поэтому $bb(A)^(-1)$ не существует.
Как показывает упражнение 1.12(a), определитель матрицы равен произведению её
собственных значений. Следовательно, если одно из собственных значений
$bb(A)$ равно нулю, то $det (bb(A))$ равен нулю, и приведённый выше
аргумент показывает, что $bb(A)^(-1)$ не существует. Тот же результат был
получен другим способом в упражнении 1.7.

#task()[
  Дано, что

  $
    bb(U)^dagger bb(A) bb(U) eq bb(a) eq
    mat(
      delim: "(", a_1, 0, dots.h, 0;
      0, a_2, dots.h, 0;
      dots.v, dots.v, dots.down, dots.v;
      0, 0, dots.h, a_N
    )
  $

  или

  $
    bb(A) bold(c)^alpha eq a_alpha bold(c)^alpha
    quad alpha eq 1 comma 2 comma dots.h comma N
  $

  Покажите, что

  + $det (bb(A)^n) eq a_1^n a_2^n dots.h a_N^n$.

  + $tr bb(A)^n eq sum_(alpha eq 1)^N a_alpha^n$.

  + Если $bb(G) (omega) eq (omega bb(1) minus bb(A))^(-1)$, то

    $
      (bb(G) (omega))_(i j)
      eq sum_alpha frac(U_(i alpha) U_(j alpha)^ast.basic, omega minus a_alpha)
      eq sum_alpha frac(c_i^alpha (c_j^alpha)^ast.basic, omega minus a_alpha)
    $

    Покажите, что с использованием нотации Дирака это можно переписать как

    $
      (bb(G) (omega))_(i j)
      eq chevron.l i bar.v bb(G) (omega) bar.v j chevron.r
      eq sum_alpha frac(
        chevron.l i bar.v alpha chevron.r chevron.l alpha bar.v j chevron.r,
        omega minus a_alpha
      )
    $
]

В качестве интересного применения этого соотношения рассмотрим задачу
решения следующей системы неоднородных линейных уравнений:

$
  (omega bb(1) minus bb(A)) bold(x) eq bold(c)
$

относительно $bold(x)$. Самый прямой путь состоит в обращении
$omega bb(1) minus bb(A)$, т. е.

$
  bold(x) eq (omega bb(1) minus bb(A))^(-1) bold(c)
  eq bb(G) (omega) bold(c)
$

Если нужно получить $bold(x)$ как функцию $omega$, матрицу приходится
обращать для каждого значения $omega$. Однако, если диагонализовать
$bb(A)$, можно записать

$
  x_i eq sum_j (bb(G) (omega))_(i j) c_j
  eq sum_(j alpha) frac(
    U_(i alpha) U_(j alpha)^ast.basic c_j,
    omega minus a_alpha
  )
$

Теперь вычисление $bold(x)$ как функции $omega$ становится простым с
вычислительной точки зрения.

#task()[
  Если

  $
    bb(A) eq mat(delim: "(", a, b; b, a)
  $

  покажите, что

  $
    f (bb(A)) eq mat(
      delim: "(",
      frac(1, 2) [f (a plus b) plus f (a minus b)],
      frac(1, 2) [f (a plus b) minus f (a minus b)];
      frac(1, 2) [f (a plus b) minus f (a minus b)],
      frac(1, 2) [f (a plus b) plus f (a minus b)]
    )
  $
]
