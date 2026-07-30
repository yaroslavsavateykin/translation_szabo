#import "../macros.typ": sub-eq, task

Нужно обобщить идеи трёхмерной векторной алгебры на $N$-мерное
пространство, в котором векторы могут быть комплексными. Мы будем
использовать эффективный формализм, введённый Дираком, позволяющий
записывать результаты исключительно кратко и просто. По аналогии с
базисом $brace.l e_i brace.r$ в трёх измерениях рассмотрим $N$
базисных векторов, обозначаемых символом $|i chevron.r$,
$i eq 1 comma 2
comma dots.h comma N$, которые называются кет-векторами, или просто
кетами. Мы предполагаем, что этот базис полон, так что любой
кет-вектор $|a chevron.r$ можно записать в виде

$
  |a chevron.r eq sum_(i eq 1)^N|i chevron.r a_i
$ <eq:141>

Это простое обобщение уравнения (1.1), переписанного в новой нотации.

После выбора базиса вектор $|a chevron.r$ можно полностью описать,
задав его $N$ компонент $a_i$, $i eq 1 comma 2 comma dots.h comma N$,
относительно базиса $brace.l|i chevron.r brace.r$. Как и раньше, мы
располагаем эти числа в матрицу-столбец $bold(a)$:

$
  bold(a) eq mat(delim: "(", a_1; a_2; dots.v; a_N)
$ <eq:142>

и говорим, что $bold(a)$ является матричным представлением
абстрактного вектора $|a chevron.r$ в базисе
$brace.l|i chevron.r brace.r$. Напомним (уравнение (1.27)), что
сопряжённой к матрице-столбцу $bold(a)$ является матрица-строка
$bold(a)^dagger$:

$
  bold(a)^dagger eq mat(delim: "(", a_1^ast.basic, a_2^ast.basic, dots.h, a_N^ast.basic)
$ <eq:143>

Теперь введём абстрактный бра-вектор $chevron.l a|$, матричным
представлением которого является $bold(a)^dagger$. Скалярное
произведение бра-вектора $chevron.l a|$ и кет-вектора $|b chevron.r$
определяется как

$
  chevron.l a||b chevron.r eq chevron.l a|b chevron.r
  eq bold(a)^dagger bold(b)
  eq mat(delim: "(", a_1^ast.basic, a_2^ast.basic, dots.h, a_N^ast.basic)
  mat(delim: "(", b_1; b_2; dots.v; b_N)
  eq sum_(i eq 1)^N a_i^ast.basic b_i
$ <eq:144>

Это естественное обобщение скалярного произведения, заданного в
уравнении (1.4). Необычные названия бра (для $chevron.l|$) и кет (для
$|chevron.r$) были выбраны потому, что запись скалярного произведения
$chevron.l|chevron.r$ напоминает слово bracket, разбитое как
bra-c-ket. Заметим, что

$
  chevron.l a|a chevron.r eq sum_(i eq 1)^N a_i^ast.basic a_i
  eq sum_(i eq 1)^N abs(a_i)^2
$ <eq:145>

всегда является действительным и положительным числом и представляет
собой обобщение квадрата длины трёхмерного вектора. По аналогии с
уравнением @eq:141 естественно ввести бра-базис
$brace.l chevron.l i|brace.r$, полный в том смысле, что любой
бра-вектор $chevron.l a|$ можно записать как линейную комбинацию
базисных бра-векторов:

$
  chevron.l a|eq sum_i a_i^ast.basic chevron.l i|
$ <eq:146>

Тогда скалярное произведение $chevron.l a|$ и $|b chevron.r$ принимает
вид

$
  chevron.l a|b chevron.r eq sum_(i j) a_i^ast.basic chevron.l i|j chevron.r b_j
$

Чтобы это выражение совпадало с нашим определением скалярного
произведения @eq:144, должно выполняться условие

$
  chevron.l i|j chevron.r eq delta_(i j)
$ <eq:147>

которое является утверждением об ортонормированности базиса и
обобщением уравнения (1.7). Итак, кет-вектор $|a chevron.r$
представляется матрицей-столбцом $bold(a)$, бра-вектор $chevron.l b|$
— матрицей-строкой $bold(b)^dagger$, а их скалярное произведение есть
просто матричное произведение этих представлений.

Теперь зададимся вопросом: если дан кет $|a chevron.r$ или бра
$chevron.l a|$, как определить его компоненты относительно базиса
$brace.l|i chevron.r brace.r$ или $brace.l chevron.l i|brace.r$? Мы
действуем в полной аналогии с трёхмерным случаем (ср. уравнение
(1.8)). Умножим уравнение @eq:141 слева на $chevron.l j|$, а уравнение
@eq:146 справа на $|j chevron.r$ и получим

#sub-eq("a")[
  $
    chevron.l j|a chevron.r eq sum_i chevron.l j|i chevron.r a_i
    eq sum_i delta_(j i) a_i eq a_j
  $ <eq:148a>
]

и

#sub-eq("b", same: true)[
  $
    chevron.l a|j chevron.r eq sum_i a_i^ast.basic chevron.l i|j chevron.r
    eq sum_i a_i^ast.basic delta_(i j) eq a_j^ast.basic
  $ <eq:148b>
]

Выражение «умножить слева на $chevron.l j|$» является сокращённой
формой высказывания «взять скалярное произведение с $chevron.l j|$».
Заметим, что

$
  chevron.l j|a chevron.r eq (chevron.l a|j chevron.r)^ast.basic
  eq (chevron.l a|j chevron.r)^dagger
$ <eq:149>

Используя эти результаты, можно переписать уравнения @eq:141 и @eq:146
в виде

#sub-eq("a")[
  $
    |a chevron.r eq sum_i|i chevron.r a_i
    eq sum_i|i chevron.r chevron.l i|a chevron.r
  $ <eq:150a>
]

и

#sub-eq("b", same: true)[
  $
    chevron.l a|eq sum_i a_i^ast.basic chevron.l i|
    eq sum_i chevron.l a|i chevron.r chevron.l i|
  $ <eq:150b>
]

что подсказывает запись

$
  1 eq sum_i|i chevron.r chevron.l i|
$ <eq:151>

Это аналог уравнения (1.10) и утверждение о полноте базиса. Мы увидим,
что умножение на единичный оператор и использование уравнения @eq:151
является чрезвычайно мощным способом вывода многих соотношений.

По аналогии с уравнением (1.11) определим оператор $hat(O)$ как
объект, который, действуя на кет $|a chevron.r$, переводит его в кет
$|b chevron.r$:

$
  hat(O)|a chevron.r eq|b chevron.r
$ <eq:152>

Как и раньше, оператор полностью определён, если известно, как он
действует на базис $brace.l|i chevron.r brace.r$:

$
  hat(O)|i chevron.r eq sum_j|j chevron.r chevron.l j|hat(O)|i chevron.r
  eq sum_j|j chevron.r O_(j i)
$ <eq:153>

так что $bb(O)$ является матричным представлением оператора $hat(O)$ в
базисе $brace.l|i chevron.r brace.r$. Умножая @eq:153 слева на
$chevron.l k|$, получаем

$
  chevron.l k|hat(O)|i chevron.r eq sum_j chevron.l k|j chevron.r O_(j i)
  eq sum_j delta_(k j) O_(j i) eq O_(k i)
$ <eq:154>

что даёт полезное выражение для матричных элементов $bb(O)$. Следует
отметить, что матричное представление $hat(O)$ легко получить,
используя соотношение полноты @eq:151:

$
  hat(O)|i chevron.r eq 1 hat(O)|i chevron.r
  eq sum_j|j chevron.r chevron.l j|hat(O)|i chevron.r
$ <eq:155>

Сравнение с уравнением @eq:153 даёт

$
  chevron.l j|hat(O)|i chevron.r eq (bb(O))_(j i) eq O_(j i)
$ <eq:156>

В качестве ещё одной иллюстрации использования соотношения полноты, а
также встроенной согласованности и простоты нотации Дирака, найдём
матричное представление оператора $hat(C) eq hat(A) hat(B)$ через
матричные представления операторов $hat(A)$ и $hat(B)$ (ср. уравнение
(1.15)):

$
  chevron.l i|hat(C)|j chevron.r
  & eq (bb(C))_(i j) eq chevron.l i|hat(A) hat(B)|j chevron.r \
  & eq sum_k chevron.l i|hat(A)|k chevron.r chevron.l k|hat(B)|j chevron.r \
  & eq sum_k (bb(A))_(i k) (bb(B))_(k j)
$

Теперь введём сопряжённый к $hat(O)$ оператор, обозначаемый
$hat(O)^dagger$. Если $hat(O)$ переводит кет $|a chevron.r$ в кет
$|b chevron.r$ (ср. уравнение @eq:152), то сопряжённый оператор
переводит бра $chevron.l a|$ в бра $chevron.l b|$, т. е.

$
  chevron.l a|hat(O)^dagger eq chevron.l b|
$ <eq:157>

Это уравнение называется сопряжённым к уравнению @eq:152. Умножая обе
части уравнения @eq:152 слева на $chevron.l c|$ и обе части уравнения
@eq:157 справа на $|c chevron.r$, получаем

$
  chevron.l c|hat(O)|a chevron.r eq chevron.l c|b chevron.r
$

и

$
  chevron.l a|hat(O)^dagger|c chevron.r eq chevron.l b|c chevron.r
$

Так как $chevron.l b|c chevron.r eq
(chevron.l c|b chevron.r)^ast.basic$, следует, что

$
  chevron.l a|hat(O)^dagger|c chevron.r
  eq (chevron.l c|hat(O)|a chevron.r)^ast.basic
$ <eq:158>

Поскольку метки $a$, $b$ и $c$ произвольны, мы показали, что матричное
представление $hat(O)^dagger$ является сопряжённым к матричному
представлению $hat(O)$, поскольку

$
  chevron.l i|hat(O)^dagger|j chevron.r
  eq (bb(O)^dagger)_(i j)
  eq (chevron.l j|hat(O)|i chevron.r)^ast.basic
  eq O_(j i)^ast.basic
$ <eq:159>

Наконец, оператор называется эрмитовым, если он самосопряжён:

$
  hat(O) eq hat(O)^dagger
$ <eq:160>

Следовательно, элементы матричного представления эрмитова оператора
удовлетворяют соотношению

$
  chevron.l a|hat(O)|b chevron.r
  eq chevron.l a|hat(O)^dagger|b chevron.r
  eq (chevron.l b|hat(O)|a chevron.r)^ast.basic
$ <eq:161>
