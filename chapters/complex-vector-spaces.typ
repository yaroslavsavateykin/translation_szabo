#import "../macros.typ": sub-eq, task

Нужно обобщить идеи трёхмерной векторной алгебры на $N$-мерное
пространство, в котором векторы могут быть комплексными. Мы будем
использовать эффективный формализм, введённый Дираком, позволяющий записывать
результаты исключительно кратко и просто. По аналогии с базисом
$brace.l e_i brace.r$ в трёх измерениях рассмотрим $N$ базисных
векторов, обозначаемых символом $bar.v i chevron.r$, $i eq 1 comma 2
comma dots.h comma N$, которые называются кет-векторами, или просто
кетами. Мы предполагаем, что этот базис полон, так что любой кет-вектор
$bar.v a chevron.r$ можно записать в виде

$
  bar.v a chevron.r eq sum_(i eq 1)^N bar.v i chevron.r a_i
$ <eq:141>

Это простое обобщение уравнения (1.1), переписанного в новой нотации.

После выбора базиса вектор $bar.v a chevron.r$ можно полностью описать,
задав его $N$ компонент $a_i$, $i eq 1 comma 2 comma dots.h comma N$,
относительно базиса $brace.l bar.v i chevron.r brace.r$. Как и раньше,
мы располагаем эти числа в матрицу-столбец $bold(a)$:

$
  bold(a) eq mat(delim: "(", a_1; a_2; dots.v; a_N)
$ <eq:142>

и говорим, что $bold(a)$ является матричным представлением абстрактного
вектора $bar.v a chevron.r$ в базисе $brace.l bar.v i chevron.r brace.r$.
Напомним (уравнение (1.27)), что сопряжённой к матрице-столбцу
$bold(a)$ является матрица-строка $bold(a)^dagger$:

$
  bold(a)^dagger eq mat(delim: "(", a_1^ast.basic, a_2^ast.basic, dots.h, a_N^ast.basic)
$ <eq:143>

Теперь введём абстрактный бра-вектор $chevron.l a bar.v$, матричным
представлением которого является $bold(a)^dagger$. Скалярное произведение
бра-вектора $chevron.l a bar.v$ и кет-вектора $bar.v b chevron.r$
определяется как

$
  chevron.l a bar.v bar.v b chevron.r eq chevron.l a bar.v b chevron.r
  eq bold(a)^dagger bold(b)
  eq mat(delim: "(", a_1^ast.basic, a_2^ast.basic, dots.h, a_N^ast.basic)
  mat(delim: "(", b_1; b_2; dots.v; b_N)
  eq sum_(i eq 1)^N a_i^ast.basic b_i
$ <eq:144>

Это естественное обобщение скалярного произведения, заданного в уравнении
(1.4). Необычные названия бра (для $chevron.l bar.v$) и кет (для
$bar.v chevron.r$) были выбраны потому, что запись скалярного
произведения $chevron.l bar.v chevron.r$ напоминает слово bracket,
разбитое как bra-c-ket. Заметим, что

$
  chevron.l a bar.v a chevron.r eq sum_(i eq 1)^N a_i^ast.basic a_i
  eq sum_(i eq 1)^N abs(a_i)^2
$ <eq:145>

всегда является действительным и положительным числом и представляет собой
обобщение квадрата длины трёхмерного вектора. По аналогии с уравнением
@eq:141 естественно ввести бра-базис
$brace.l chevron.l i bar.v brace.r$, полный в том смысле, что любой
бра-вектор $chevron.l a bar.v$ можно записать как линейную комбинацию
базисных бра-векторов:

$
  chevron.l a bar.v eq sum_i a_i^ast.basic chevron.l i bar.v
$ <eq:146>

Тогда скалярное произведение $chevron.l a bar.v$ и
$bar.v b chevron.r$ принимает вид

$
  chevron.l a bar.v b chevron.r eq sum_(i j) a_i^ast.basic chevron.l i bar.v j chevron.r b_j
$

Чтобы это выражение совпадало с нашим определением скалярного произведения
@eq:144, должно выполняться условие

$
  chevron.l i bar.v j chevron.r eq delta_(i j)
$ <eq:147>

которое является утверждением об ортонормированности базиса и обобщением
уравнения (1.7). Итак, кет-вектор $bar.v a chevron.r$ представляется
матрицей-столбцом $bold(a)$, бра-вектор $chevron.l b bar.v$ —
матрицей-строкой $bold(b)^dagger$, а их скалярное произведение есть просто
матричное произведение этих представлений.

Теперь зададимся вопросом: если дан кет $bar.v a chevron.r$ или бра
$chevron.l a bar.v$, как определить его компоненты относительно базиса
$brace.l bar.v i chevron.r brace.r$ или
$brace.l chevron.l i bar.v brace.r$? Мы действуем в полной аналогии с
трёхмерным случаем (ср. уравнение (1.8)). Умножим уравнение @eq:141 слева
на $chevron.l j bar.v$, а уравнение @eq:146 справа на
$bar.v j chevron.r$ и получим

#sub-eq("a")[
  $
    chevron.l j bar.v a chevron.r eq sum_i chevron.l j bar.v i chevron.r a_i
    eq sum_i delta_(j i) a_i eq a_j
  $ <eq:148a>
]

и

#sub-eq("b", same: true)[
  $
    chevron.l a bar.v j chevron.r eq sum_i a_i^ast.basic chevron.l i bar.v j chevron.r
    eq sum_i a_i^ast.basic delta_(i j) eq a_j^ast.basic
  $ <eq:148b>
]

Выражение «умножить слева на $chevron.l j bar.v$» является сокращённой
формой высказывания «взять скалярное произведение с $chevron.l j bar.v$».
Заметим, что

$
  chevron.l j bar.v a chevron.r eq lr((chevron.l a bar.v j chevron.r))^ast.basic
  eq lr((chevron.l a bar.v j chevron.r))^dagger
$ <eq:149>

Используя эти результаты, можно переписать уравнения @eq:141 и @eq:146 в
виде

#sub-eq("a")[
  $
    bar.v a chevron.r eq sum_i bar.v i chevron.r a_i
    eq sum_i bar.v i chevron.r chevron.l i bar.v a chevron.r
  $ <eq:150a>
]

и

#sub-eq("b", same: true)[
  $
    chevron.l a bar.v eq sum_i a_i^ast.basic chevron.l i bar.v
    eq sum_i chevron.l a bar.v i chevron.r chevron.l i bar.v
  $ <eq:150b>
]

что подсказывает запись

$
  1 eq sum_i bar.v i chevron.r chevron.l i bar.v
$ <eq:151>

Это аналог уравнения (1.10) и утверждение о полноте базиса. Мы увидим, что
умножение на единичный оператор и использование уравнения @eq:151 является
чрезвычайно мощным способом вывода многих соотношений.

По аналогии с уравнением (1.11) определим оператор $hat(O)$ как объект,
который, действуя на кет $bar.v a chevron.r$, переводит его в кет
$bar.v b chevron.r$:

$
  hat(O) bar.v a chevron.r eq bar.v b chevron.r
$ <eq:152>

Как и раньше, оператор полностью определён, если известно, как он действует
на базис $brace.l bar.v i chevron.r brace.r$:

$
  hat(O) bar.v i chevron.r eq sum_j bar.v j chevron.r chevron.l j bar.v hat(O) bar.v i chevron.r
  eq sum_j bar.v j chevron.r O_(j i)
$ <eq:153>

так что $bb(O)$ является матричным представлением оператора $hat(O)$ в
базисе $brace.l bar.v i chevron.r brace.r$. Умножая @eq:153 слева на
$chevron.l k bar.v$, получаем

$
  chevron.l k bar.v hat(O) bar.v i chevron.r eq sum_j chevron.l k bar.v j chevron.r O_(j i)
  eq sum_j delta_(k j) O_(j i) eq O_(k i)
$ <eq:154>

что даёт полезное выражение для матричных элементов $bb(O)$. Следует
отметить, что матричное представление $hat(O)$ легко получить, используя
соотношение полноты @eq:151:

$
  hat(O) bar.v i chevron.r eq 1 hat(O) bar.v i chevron.r
  eq sum_j bar.v j chevron.r chevron.l j bar.v hat(O) bar.v i chevron.r
$ <eq:155>

Сравнение с уравнением @eq:153 даёт

$
  chevron.l j bar.v hat(O) bar.v i chevron.r eq lr((bb(O)))_(j i) eq O_(j i)
$ <eq:156>

В качестве ещё одной иллюстрации использования соотношения полноты, а также
встроенной согласованности и простоты нотации Дирака, найдём матричное
представление оператора $hat(C) eq hat(A) hat(B)$ через матричные
представления операторов $hat(A)$ и $hat(B)$ (ср. уравнение (1.15)):

$
  chevron.l i bar.v hat(C) bar.v j chevron.r
  & eq lr((bb(C)))_(i j) eq chevron.l i bar.v hat(A) hat(B) bar.v j chevron.r \
  & eq sum_k chevron.l i bar.v hat(A) bar.v k chevron.r chevron.l k bar.v hat(B) bar.v j chevron.r \
  & eq sum_k lr((bb(A)))_(i k) lr((bb(B)))_(k j)
$

Теперь введём сопряжённый к $hat(O)$ оператор, обозначаемый
$hat(O)^dagger$. Если $hat(O)$ переводит кет $bar.v a chevron.r$ в кет
$bar.v b chevron.r$ (ср. уравнение @eq:152), то сопряжённый оператор
переводит бра $chevron.l a bar.v$ в бра $chevron.l b bar.v$, т. е.

$
  chevron.l a bar.v hat(O)^dagger eq chevron.l b bar.v
$ <eq:157>

Это уравнение называется сопряжённым к уравнению @eq:152. Умножая обе
части уравнения @eq:152 слева на $chevron.l c bar.v$ и обе части уравнения
@eq:157 справа на $bar.v c chevron.r$, получаем

$
  chevron.l c bar.v hat(O) bar.v a chevron.r eq chevron.l c bar.v b chevron.r
$

и

$
  chevron.l a bar.v hat(O)^dagger bar.v c chevron.r eq chevron.l b bar.v c chevron.r
$

Так как $chevron.l b bar.v c chevron.r eq
lr((chevron.l c bar.v b chevron.r))^ast.basic$, следует, что

$
  chevron.l a bar.v hat(O)^dagger bar.v c chevron.r
  eq lr((chevron.l c bar.v hat(O) bar.v a chevron.r))^ast.basic
$ <eq:158>

Поскольку метки $a$, $b$ и $c$ произвольны, мы показали, что матричное
представление $hat(O)^dagger$ является сопряжённым к матричному
представлению $hat(O)$, поскольку

$
  chevron.l i bar.v hat(O)^dagger bar.v j chevron.r
  eq lr((bb(O)^dagger))_(i j)
  eq lr((chevron.l j bar.v hat(O) bar.v i chevron.r))^ast.basic
  eq O_(j i)^ast.basic
$ <eq:159>

Наконец, оператор называется эрмитовым, если он самосопряжён:

$
  hat(O) eq hat(O)^dagger
$ <eq:160>

Следовательно, элементы матричного представления эрмитова оператора
удовлетворяют соотношению

$
  chevron.l a bar.v hat(O) bar.v b chevron.r
  eq chevron.l a bar.v hat(O)^dagger bar.v b chevron.r
  eq lr((chevron.l b bar.v hat(O) bar.v a chevron.r))^ast.basic
$ <eq:161>
