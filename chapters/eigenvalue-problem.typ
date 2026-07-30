#import "../macros.typ": sub-eq, task

Когда оператор $hat(O)$ действует на вектор $bar.v alpha chevron.r$,
получающийся вектор в общем случае отличается от
$bar.v alpha chevron.r$. Если $hat(O) bar.v alpha chevron.r$ является
просто постоянной, умноженной на $bar.v alpha chevron.r$, т. е.

$
  hat(O) bar.v alpha chevron.r eq omega_alpha bar.v alpha chevron.r
$ <eq:172>

то $bar.v alpha chevron.r$ называется собственным вектором оператора
$hat(O)$ с собственным значением $omega_alpha$. Без потери общности
собственные векторы можно выбрать нормированными:

$
  chevron.l alpha bar.v alpha chevron.r eq 1
$ <eq:173>

В этой книге нас интересуют собственные векторы и собственные значения
эрмитовых операторов ($hat(O)^dagger eq hat(O)$). Они обладают
следующими свойствами.

#emph[1. Собственные значения эрмитова оператора действительны.] Это
непосредственно следует из уравнения @eq:161, которое утверждает, что

$
  chevron.l alpha bar.v hat(O) bar.v alpha chevron.r
  eq chevron.l alpha bar.v hat(O)^dagger bar.v alpha chevron.r
  eq (chevron.l alpha bar.v hat(O) bar.v alpha chevron.r)^ast.basic
$ <eq:174>

Умножая соотношение для собственного значения @eq:172 слева на
$chevron.l alpha bar.v$ и подставляя результат в @eq:174, получаем

$
  omega_alpha eq omega_alpha^ast.basic
$ <eq:175>

что и требовалось доказать.

#emph[2. Собственные векторы эрмитова оператора ортогональны.] Для
доказательства рассмотрим

$
  hat(O) bar.v beta chevron.r eq omega_beta bar.v beta chevron.r
$

Сопряжённое к этому уравнению имеет вид

$
  chevron.l beta bar.v hat(O)^dagger eq chevron.l beta bar.v omega_beta^ast.basic
$

где мы использовали @eq:157 и тот факт, что сопряжением числа является
его комплексное сопряжение. Поскольку $hat(O)$ эрмитов, а $omega_beta$
действителен, получаем

$
  chevron.l beta bar.v hat(O) eq chevron.l beta bar.v omega_beta
$ <eq:176>

Умножая @eq:172 слева на $chevron.l beta bar.v$, а @eq:176 справа на
$bar.v alpha chevron.r$ и вычитая получающиеся выражения, находим

$
  (omega_beta minus omega_alpha) chevron.l beta bar.v alpha chevron.r eq 0
$ <eq:177>

так что $chevron.l beta bar.v alpha chevron.r eq 0$, если
$omega_alpha != omega_beta$. Следовательно, ортогональность немедленно
вытекает, если два собственных значения не совпадают, т. е. если они
невырождены. Два собственных вектора $bar.v 1 chevron.r$ и
$bar.v 2 chevron.r$ являются вырожденными, если им соответствует одно
и то же собственное значение:

$
  hat(O) bar.v 1 chevron.r eq omega bar.v 1 chevron.r comma quad
  hat(O) bar.v 2 chevron.r eq omega bar.v 2 chevron.r
$ <eq:178>

Теперь покажем, что вырожденные собственные векторы всегда можно
выбрать ортогональными. Сначала заметим, что любая линейная комбинация
вырожденных собственных векторов также является собственным вектором с
тем же собственным значением, т. е.

$
  hat(O) (x bar.v 1 chevron.r plus y bar.v 2 chevron.r)
  eq x omega bar.v 1 chevron.r plus y omega bar.v 2 chevron.r
  eq omega (x bar.v 1 chevron.r plus y bar.v 2 chevron.r)
$ <eq:179>

Существует много способов найти две линейные комбинации
$bar.v 1 chevron.r$ и $bar.v 2 chevron.r$, которые ортогональны. Одна
из таких процедур называется ортогонализацией Шмидта. Предположим, что
$bar.v 1 chevron.r$ и $bar.v 2 chevron.r$ нормированы, и пусть
$chevron.l 1 bar.v 2 chevron.r eq S != 0$. Выберем
$bar.v upright(I) chevron.r eq bar.v 1 chevron.r$, так что
$chevron.l upright(I) bar.v upright(I) chevron.r eq 1$. Положим
$bar.v upright(II)' chevron.r eq bar.v 1 chevron.r plus c bar.v 2 chevron.r$
и выберем $c$ так, чтобы
$chevron.l upright(I) bar.v upright(II)' chevron.r eq 0 eq 1 plus c S$.
Наконец, нормируем $bar.v upright(II)' chevron.r$ и получаем

$
  bar.v upright(II) chevron.r eq (S^(-2) minus 1)^(-1 slash 2)
  (bar.v 1 chevron.r minus S^(-1) bar.v 2 chevron.r)
$ <eq:180>

Таким образом, собственные векторы
$brace.l bar.v alpha chevron.r brace.r$ эрмитова оператора можно
выбрать так, чтобы они образовывали ортонормированный набор:

$
  chevron.l alpha bar.v beta chevron.r eq delta_(alpha beta)
$ <eq:181>

Матричное представление эрмитова оператора $hat(O)$ в произвольном
базисе $brace.l bar.v i chevron.r brace.r$ в общем случае не
диагонально. Однако его матричное представление в базисе, образованном
его собственными векторами, диагонально. Чтобы показать это, умножим
уравнение для собственного значения @eq:172 слева на
$chevron.l beta bar.v$ и используем соотношение ортонормированности
@eq:181:

$
  chevron.l beta bar.v hat(O) bar.v alpha chevron.r eq omega_alpha delta_(alpha beta)
$ <eq:182>

Задачу на собственные значения, которую мы хотим решить, можно
сформулировать следующим образом. Пусть дана матрица $bb(O)$ —
матричное представление эрмитова оператора $hat(O)$ в
ортонормированном базисе
$brace.l bar.v i chevron.r comma i eq 1 comma 2 comma dots.h comma N brace.r$.
Нужно найти ортонормированный базис
$brace.l bar.v alpha chevron.r comma alpha eq 1 comma 2 comma dots.h comma N brace.r$,
в котором матричное представление $bb(Omega)$ оператора $hat(O)$
диагонально, т. е.
$Omega_(alpha beta) eq omega_alpha delta_(alpha beta)$. Иными словами,
нужно диагонализовать матрицу $bb(O)$. В предыдущем подразделе мы
видели, что два представления оператора $hat(O)$ связаны унитарным
преобразованием (ср. уравнение @eq:170a):

$
  bb(Omega) eq bb(U)^dagger bb(O) bb(U)
$

Следовательно, задача диагонализации эрмитовой матрицы $bb(O)$
эквивалентна задаче нахождения унитарной матрицы $bb(U)$, переводящей
$bb(O)$ в диагональную матрицу:

$
  bb(U)^dagger bb(O) bb(U) eq bb(omega) eq
  mat(
    delim: "(", omega_1, 0, dots.h, 0;
    0, omega_2, dots.h, 0;
    dots.v, dots.v, dots.down, dots.v;
    0, 0, dots.h, omega_N
  )
$ <eq:183>

Из такой формулировки ясно, что эрмитова матрица размера $N times N$
имеет $N$ собственных значений.

Существует множество эффективных алгоритмов диагонализации эрмитовых
матриц.#super[1] Для наших целей компьютерные программы, основанные на
таких алгоритмах, можно рассматривать как «чёрные ящики», которые по
заданной матрице $bb(O)$ определяют $bb(U)$ и $bb(omega)$. Чтобы
установить связь с изложением задачи на собственные значения,
встречающимся в большинстве элементарных учебников по квантовой химии,
теперь рассмотрим вычислительно неэффективную процедуру, основанную на
нахождении корней секулярного определителя.

Поставленную выше задачу на собственные значения можно
переформулировать следующим образом. Для заданной эрмитовой матрицы
$bb(O)$ размера $N times N$ нужно найти все различные матрицы-столбцы
$bold(c)$ (собственные векторы $bb(O)$) и соответствующие числа
$omega$ (собственные значения $bb(O)$), такие что

#sub-eq("a")[
  $
    bb(O) bold(c) eq omega bold(c)
  $ <eq:184a>
]

Это уравнение можно переписать как

#sub-eq("b", same: true)[
  $
    (bb(O) minus omega bb(1)) bold(c) eq 0
  $ <eq:184b>
]

Как было показано в упражнении 1.7, уравнение @eq:184b может иметь
нетривиальное решение ($bold(c) != 0$) только тогда, когда

$
  det (bb(O) minus omega bb(1)) eq 0
$ <eq:185>

Это называется секулярным определителем. Такой определитель является
многочленом степени $N$ относительно неизвестной $omega$. Многочлен
степени $N$ имеет $N$ корней $omega_alpha$,
$alpha eq 1 comma 2 comma dots.h comma N$, которые в данном случае
называются собственными значениями матрицы $bb(O)$. После нахождения
собственных значений соответствующие собственные векторы можно найти,
подставляя каждое $omega_alpha$ в уравнение @eq:184a и решая
получающиеся уравнения для $bold(c)^alpha$. Таким образом,
$bold(c)^alpha$ определяется с точностью до множительного
коэффициента, который в конце фиксируется условием нормировки
$bold(c)^alpha$:

$
  sum_i (c_i^alpha)^ast.basic c_i^alpha eq 1
$ <eq:186>

Так мы можем найти $N$ решений уравнения @eq:184a:

$
  bb(O) bold(c)^alpha eq omega_alpha bold(c)^alpha quad
  alpha eq 1 comma 2 comma dots.h comma N
$ <eq:187>

Поскольку $bb(O)$ эрмитова, её собственные значения действительны, а
собственные векторы ортогональны:

$
  sum_i (c_i^alpha)^ast.basic c_i^beta eq delta_(alpha beta)
$ <eq:188>

Чтобы установить связь с предыдущими результатами, построим матрицу
$bb(U)$, определённую как $U_(i alpha) eq c_i^alpha$, т. е.

$
  bb(U) eq
  mat(
    delim: "(", c_1^1, c_1^2, dots.h, c_1^N;
    c_2^1, c_2^2, dots.h, c_2^N;
    dots.v, dots.v, dots.down, dots.v;
    c_N^1, c_N^2, dots.h, c_N^N
  )
  eq (bold(c)^1 bold(c)^2 dots.h bold(c)^N)
$ <eq:189>

Таким образом, $alpha$-й столбец $bb(U)$ — это просто матрица-столбец
$bold(c)^alpha$. Тогда, используя @eq:187, можно показать, что

$
  bb(O) bb(U) eq bb(U)
  mat(
    delim: "(", omega_1, 0, dots.h, 0;
    0, omega_2, dots.h, 0;
    dots.v, dots.v, dots.down, dots.v;
    0, 0, dots.h, omega_N
  )
  eq bb(U) bb(omega)
$ <eq:190>

Поскольку $U_(i alpha) eq c_i^alpha$, соотношение ортонормированности
@eq:188 эквивалентно

$
  sum_i (c_i^alpha)^ast.basic c_i^beta
  eq sum_i (bb(U)^dagger)_(alpha i) U_(i beta)
  eq delta_(alpha beta)
$ <eq:191>

что в матричной записи имеет вид

$
  bb(U)^dagger bb(U) eq bb(1)
$ <eq:192>

Наконец, умножая обе части уравнения @eq:190 слева на $bb(U)^dagger$ и
используя уравнение @eq:192, получаем

$
  bb(U)^dagger bb(O) bb(U) eq bb(omega)
$ <eq:193>

что идентично уравнению @eq:183. Поэтому уравнение @eq:189 задаёт
связь между унитарным преобразованием $bb(U)$, диагонализующим матрицу
$bb(O)$, и собственными векторами $bold(c)^alpha$ матрицы $bb(O)$.

#task()[
  Покажите, что уравнение @eq:190 содержит уравнение @eq:187 для всех
  $alpha eq 1 comma 2 comma dots.h comma N$.
]

В качестве иллюстрации этого формализма рассмотрим задачу нахождения
собственных значений и собственных векторов симметричной матрицы
размера $2 times 2$ ($O_12 eq O_21$):

$
  bb(O) eq mat(delim: "(", O_11, O_12; O_21, O_22)
$

или, что то же самое, задачу на собственные значения

$
  mat(delim: "(", O_11, O_12; O_21, O_22) vec(c_1, c_2)
  eq omega vec(c_1, c_2)
$ <eq:194>

Мы решим эту задачу двумя способами: сначала через секулярный
определитель (уравнение @eq:185), а затем непосредственным нахождением
матрицы $bb(U)$, диагонализующей $bb(O)$. Чтобы уравнение @eq:194
имело нетривиальное решение, секулярный определитель должен обращаться
в нуль:

$
  det mat(delim: "(", O_11 minus omega, O_12; O_21, O_22 minus omega)
  eq omega^2 minus omega (O_22 plus O_11) plus O_11 O_22 minus O_12 O_21 eq 0
$ <eq:195>

Это квадратное уравнение имеет два решения:

#sub-eq("a")[
  $
    omega_1 eq frac(1, 2) [O_11 plus O_22 minus ((O_22 minus O_11)^2 plus 4 O_12 O_21)^(1 slash 2)]
  $ <eq:196a>
]

#sub-eq("b", same: true)[
  $
    omega_2 eq frac(1, 2) [O_11 plus O_22 plus ((O_22 minus O_11)^2 plus 4 O_12 O_21)^(1 slash 2)]
  $ <eq:196b>
]

которые являются собственными значениями матрицы $bb(O)$. Чтобы найти
собственный вектор, соответствующий заданному собственному значению,
например $omega_2$, подставим $omega_2$ в уравнение @eq:194 и получим

#sub-eq("a")[
  $
    O_11 c_1^2 plus O_12 c_2^2 eq omega_2 c_1^2
  $ <eq:197a>
]

#sub-eq("b", same: true)[
  $
    O_21 c_1^2 plus O_22 c_2^2 eq omega_2 c_2^2
  $ <eq:197b>
]

где верхние индексы «2» показывают, что рассматривается второе
собственное значение. Затем используем одно из этих двух эквивалентных
уравнений и условие нормировки

$
  (c_1^2)^2 plus (c_2^2)^2 eq 1
$ <eq:198>

для нахождения $c_1^2$ и $c_2^2$. В качестве простой иллюстрации
рассмотрим случай $O_11 eq O_22 eq a$ и $O_12 eq O_21 eq b$. Из
уравнений @eq:196a и @eq:196b получаем два собственных значения:

#sub-eq("a")[
  $
    omega_1 eq a minus b
  $ <eq:199a>
]

#sub-eq("b", same: true)[
  $
    omega_2 eq a plus b
  $ <eq:199b>
]

Чтобы найти собственный вектор, соответствующий $omega_2$, используем
уравнение @eq:197a, которое в данном случае даёт

$
  a c_1^2 plus b c_2^2 eq (a plus b) c_1^2
$

откуда получаем

$
  c_1^2 eq c_2^2
$

Наконец, условие нормировки @eq:198 даёт

#sub-eq("a")[
  $
    c_1^2 eq 2^(-1 slash 2) comma quad c_2^2 eq 2^(-1 slash 2)
  $ <eq:1100a>
]

Полностью аналогично находим

#sub-eq("b", same: true)[
  $
    c_1^1 eq 2^(-1 slash 2) comma quad c_2^1 eq minus 2^(-1 slash 2)
  $ <eq:1100b>
]

#task()[
  Поскольку компоненты собственного вектора могут быть найдены из
  уравнения на собственные значения только с точностью до
  множительного коэффициента, который затем определяется нормировкой,
  в уравнении @eq:194 можно положить $c_1 eq 1$ и $c_2 eq c$. Тогда
  уравнение @eq:194 принимает вид

  $
    O_11 plus O_12 c eq omega
  $

  $
    O_21 plus O_22 c eq omega c
  $

  Исключив $c$, найдите два корня получающегося уравнения и покажите,
  что они совпадают с корнями, заданными уравнениями @eq:196a и
  @eq:196b. Этот приём, который мы ещё много раз будем использовать в
  книге для нахождения наименьшего собственного значения матрицы, по
  существу является методом секулярного определителя без
  определителей. Поэтому его можно использовать для нахождения
  наименьшего собственного значения некоторых матриц размера
  $N times N$, не вычисляя определитель размера $N times N$.
]

Теперь решим задачу на собственные значения для матрицы $2 times 2$
путём непосредственного нахождения ортогональной матрицы $bb(U)$,
диагонализующей симметричную матрицу $bb(O)$, т. е.

$
  bb(U)^dagger bb(O) bb(U)
  eq mat(delim: "(", U_11, U_21; U_12, U_22)
  mat(delim: "(", O_11, O_12; O_12, O_22)
  mat(delim: "(", U_11, U_12; U_21, U_22)
  eq bb(omega) eq mat(delim: "(", omega_1, 0; 0, omega_2)
$ <eq:1101>

Требование

$
  bb(U)^dagger bb(U)
  eq mat(
    delim: "(", U_11 U_11 plus U_21 U_21, U_11 U_12 plus U_21 U_22;
    U_12 U_11 plus U_22 U_21, U_12 U_12 plus U_22 U_22
  )
  eq bb(1) eq mat(delim: "(", 1, 0; 0, 1)
$ <eq:1102>

накладывает три ограничения (два диагональных и одно недиагональное)
на четыре элемента матрицы $bb(U)$. Следовательно, $bb(U)$ может быть
полностью задана всего одним параметром. Поскольку

$
  mat(delim: "(", cos theta, sin theta; sin theta, minus cos theta)
  mat(delim: "(", cos theta, sin theta; sin theta, minus cos theta)
  eq mat(
    delim: "(", cos^2 theta plus sin^2 theta, 0;
    0, cos^2 theta plus sin^2 theta
  )
  eq bb(1)
$ <eq:1103>

при любых значениях параметра $theta$, удобно записать

$
  bb(U) eq mat(delim: "(", cos theta, sin theta; sin theta, minus cos theta)
$ <eq:1104>

Это наиболее общий вид ортогональной матрицы $2 times 2$. Теперь
выберем $theta$ так, чтобы

$
  bb(U)^dagger bb(O) bb(U)
  & eq mat(delim: "(", cos theta, sin theta; sin theta, minus cos theta)
  mat(delim: "(", O_11, O_12; O_12, O_22)
  mat(delim: "(", cos theta, sin theta; sin theta, minus cos theta) \
  & eq mat(
    delim: "(",
    O_11 cos^2 theta plus O_22 sin^2 theta plus O_12 sin 2 theta,
    frac(1, 2) (O_11 minus O_22) sin 2 theta minus O_12 cos 2 theta;
    frac(1, 2) (O_11 minus O_22) sin 2 theta minus O_12 cos 2 theta,
    O_11 sin^2 theta plus O_22 cos^2 theta minus O_12 sin 2 theta
  )
$

была диагональной. Это выполняется, если выбрать $theta$ так, чтобы

$
  frac(1, 2) (O_11 minus O_22) sin 2 theta minus O_12 cos 2 theta eq 0
$

Это уравнение имеет решение

$
  theta_0 eq frac(1, 2) tan^(-1) frac(2 O_12, O_11 minus O_22)
$ <eq:1105>

Следовательно, два собственных значения $bb(O)$ равны

#sub-eq("a")[
  $
    omega_1 eq O_11 cos^2 theta_0 plus O_22 sin^2 theta_0 plus O_12 sin 2 theta_0
  $ <eq:1106a>
]

и

#sub-eq("b", same: true)[
  $
    omega_2 eq O_11 sin^2 theta_0 plus O_22 cos^2 theta_0 minus O_12 sin 2 theta_0
  $ <eq:1106b>
]

Сравнивая уравнения @eq:1104 и @eq:189, получаем два собственных
вектора:

#sub-eq("a")[
  $
    vec(c_1^1, c_2^1) eq vec(cos theta_0, sin theta_0)
  $ <eq:1107a>
]

и

#sub-eq("b", same: true)[
  $
    vec(c_1^2, c_2^2) eq vec(sin theta_0, minus cos theta_0)
  $ <eq:1107b>
]

Следует упомянуть, что метод Якоби для диагонализации матриц размера
$N times N$ является обобщением описанной выше процедуры. Основная
идея этого метода состоит в итерационном устранении недиагональных
элементов матрицы путём многократного применения ортогональных
преобразований, подобных рассмотренным здесь.

#task()[
  Рассмотрите матрицы

  $
    bb(A) eq mat(delim: "(", 3, 1; 1, 3)
  $

  $
    bb(B) eq mat(delim: "(", 3, 1; 1, 2)
  $

  Найдите численные значения собственных значений и соответствующих
  собственных векторов этих матриц: a) методом секулярного
  определителя; b) методом унитарного преобразования. Вы увидите, что
  подход (b) намного проще.
]
