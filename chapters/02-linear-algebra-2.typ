#import "../macros.typ": task

#let book-eq(number, body) = {
  set math.equation(numbering: _ => number)
  body
}

#counter(math.equation).update(40)

=== $N$-мерные комплексные векторные пространства
<n-мерные-комплексные-векторные-пространства>
Нужно обобщить идеи трёхмерной векторной алгебры на $N$-мерное
пространство, в котором векторы могут быть комплексными. Мы будем
использовать эффективный формализм, введённвй Дираком, позволяющий записывать
результаты исключительно кратко и просто. По аналогии с базисом
$brace.l e_i brace.r$ в трёх измерениях рассмотрим $N$ базисных
векторов, обозначаемых символом $bar.v i chevron.r$, $i eq 1 comma 2
comma dots.h comma N$, которые называются кет-векторами, или просто
кетами. Мы предполагаем, что этот базис полон, так что любой кет-вектор
$bar.v a chevron.r$ можно записать в виде

#book-eq[(1.41)][
  $
    bar.v a chevron.r eq sum_(i eq 1)^N bar.v i chevron.r a_i
  $ <eq:141>
]

Это простое обобщение уравнения (1.1), переписанного в новой нотации.

После выбора базиса вектор $bar.v a chevron.r$ можно полностью описать,
задав его $N$ компонент $a_i$, $i eq 1 comma 2 comma dots.h comma N$,
относительно базиса $brace.l bar.v i chevron.r brace.r$. Как и раньше,
мы располагаем эти числа в матрицу-столбец $bold(a)$:

#book-eq[(1.42)][
  $
    bold(a) eq mat(delim: "(", a_1; a_2; dots.v; a_N)
  $ <eq:142>
]

и говорим, что $bold(a)$ является матричным представлением абстрактного
вектора $bar.v a chevron.r$ в базисе $brace.l bar.v i chevron.r brace.r$.
Напомним (уравнение (1.27)), что сопряжённой к матрице-столбцу
$bold(a)$ является матрица-строка $bold(a)^dagger$:

#book-eq[(1.43)][
  $
    bold(a)^dagger eq mat(delim: "(", a_1^ast.basic, a_2^ast.basic, dots.h, a_N^ast.basic)
  $ <eq:143>
]

Теперь введём абстрактный бра-вектор $chevron.l a bar.v$, матричным
представлением которого является $bold(a)^dagger$. Скалярное произведение
бра-вектора $chevron.l a bar.v$ и кет-вектора $bar.v b chevron.r$
определяется как

#book-eq[(1.44)][
  $
    chevron.l a bar.v bar.v b chevron.r eq chevron.l a bar.v b chevron.r
    eq bold(a)^dagger bold(b)
    eq mat(delim: "(", a_1^ast.basic, a_2^ast.basic, dots.h, a_N^ast.basic)
    mat(delim: "(", b_1; b_2; dots.v; b_N)
    eq sum_(i eq 1)^N a_i^ast.basic b_i
  $ <eq:144>
]

Это естественное обобщение скалярного произведения, заданного в уравнении
(1.4). Необычные названия бра (для $chevron.l bar.v$) и кет (для
$bar.v chevron.r$) были выбраны потому, что запись скалярного
произведения $chevron.l bar.v chevron.r$ напоминает слово bracket,
разбитое как bra-c-ket. Заметим, что

#book-eq[(1.45)][
  $
    chevron.l a bar.v a chevron.r eq sum_(i eq 1)^N a_i^ast.basic a_i
    eq sum_(i eq 1)^N abs(a_i)^2
  $ <eq:145>
]

всегда является действительным и положительным числом и представляет собой
обобщение квадрата длины трёхмерного вектора. По аналогии с уравнением
@eq:141 естественно ввести бра-базис
$brace.l chevron.l i bar.v brace.r$, полный в том смысле, что любой
бра-вектор $chevron.l a bar.v$ можно записать как линейную комбинацию
базисных бра-векторов:

#book-eq[(1.46)][
  $
    chevron.l a bar.v eq sum_i a_i^ast.basic chevron.l i bar.v
  $ <eq:146>
]

Тогда скалярное произведение $chevron.l a bar.v$ и
$bar.v b chevron.r$ принимает вид

$
  chevron.l a bar.v b chevron.r eq sum_(i j) a_i^ast.basic chevron.l i bar.v j chevron.r b_j
$

Чтобы это выражение совпадало с нашим определением скалярного произведения
@eq:144, должно выполняться условие

#book-eq[(1.47)][
  $
    chevron.l i bar.v j chevron.r eq delta_(i j)
  $ <eq:147>
]

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

#book-eq[(1.48a)][
  $
    chevron.l j bar.v a chevron.r eq sum_i chevron.l j bar.v i chevron.r a_i
    eq sum_i delta_(j i) a_i eq a_j
  $ <eq:148a>
]

и

#book-eq[(1.48b)][
  $
    chevron.l a bar.v j chevron.r eq sum_i a_i^ast.basic chevron.l i bar.v j chevron.r
    eq sum_i a_i^ast.basic delta_(i j) eq a_j^ast.basic
  $ <eq:148b>
]

Выражение «умножить слева на $chevron.l j bar.v$» является сокращённой
формой высказывания «взять скалярное произведение с $chevron.l j bar.v$».
Заметим, что

#book-eq[(1.49)][
  $
    chevron.l j bar.v a chevron.r eq lr((chevron.l a bar.v j chevron.r))^ast.basic
    eq lr((chevron.l a bar.v j chevron.r))^dagger
  $ <eq:149>
]

Используя эти результаты, можно переписать уравнения @eq:141 и @eq:146 в
виде

#book-eq[(1.50a)][
  $
    bar.v a chevron.r eq sum_i bar.v i chevron.r a_i
    eq sum_i bar.v i chevron.r chevron.l i bar.v a chevron.r
  $ <eq:150a>
]

и

#book-eq[(1.50b)][
  $
    chevron.l a bar.v eq sum_i a_i^ast.basic chevron.l i bar.v
    eq sum_i chevron.l a bar.v i chevron.r chevron.l i bar.v
  $ <eq:150b>
]

что подсказывает запись

#book-eq[(1.51)][
  $
    1 eq sum_i bar.v i chevron.r chevron.l i bar.v
  $ <eq:151>
]

Это аналог уравнения (1.10) и утверждение о полноте базиса. Мы увидим, что
умножение на единичный оператор и использование уравнения @eq:151 является
чрезвычайно мощным способом вывода многих соотношений.

По аналогии с уравнением (1.11) определим оператор $hat(O)$ как объект,
который, действуя на кет $bar.v a chevron.r$, переводит его в кет
$bar.v b chevron.r$:

#book-eq[(1.52)][
  $
    hat(O) bar.v a chevron.r eq bar.v b chevron.r
  $ <eq:152>
]

Как и раньше, оператор полностью определён, если известно, как он действует
на базис $brace.l bar.v i chevron.r brace.r$:

#book-eq[(1.53)][
  $
    hat(O) bar.v i chevron.r eq sum_j bar.v j chevron.r chevron.l j bar.v hat(O) bar.v i chevron.r
    eq sum_j bar.v j chevron.r O_(j i)
  $ <eq:153>
]

так что $bb(O)$ является матричным представлением оператора $hat(O)$ в
базисе $brace.l bar.v i chevron.r brace.r$. Умножая @eq:153 слева на
$chevron.l k bar.v$, получаем

#book-eq[(1.54)][
  $
    chevron.l k bar.v hat(O) bar.v i chevron.r eq sum_j chevron.l k bar.v j chevron.r O_(j i)
    eq sum_j delta_(k j) O_(j i) eq O_(k i)
  $ <eq:154>
]

что даёт полезное выражение для матричных элементов $bb(O)$. Следует
отметить, что матричное представление $hat(O)$ легко получить, используя
соотношение полноты @eq:151:

#book-eq[(1.55)][
  $
    hat(O) bar.v i chevron.r eq 1 hat(O) bar.v i chevron.r
    eq sum_j bar.v j chevron.r chevron.l j bar.v hat(O) bar.v i chevron.r
  $ <eq:155>
]

Сравнение с уравнением @eq:153 даёт

#book-eq[(1.56)][
  $
    chevron.l j bar.v hat(O) bar.v i chevron.r eq lr((bb(O)))_(j i) eq O_(j i)
  $ <eq:156>
]

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

#book-eq[(1.57)][
  $
    chevron.l a bar.v hat(O)^dagger eq chevron.l b bar.v
  $ <eq:157>
]

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

#book-eq[(1.58)][
  $
    chevron.l a bar.v hat(O)^dagger bar.v c chevron.r
    eq lr((chevron.l c bar.v hat(O) bar.v a chevron.r))^ast.basic
  $ <eq:158>
]

Поскольку метки $a$, $b$ и $c$ произвольны, мы показали, что матричное
представление $hat(O)^dagger$ является сопряжённым к матричному
представлению $hat(O)$, поскольку

#book-eq[(1.59)][
  $
    chevron.l i bar.v hat(O)^dagger bar.v j chevron.r
    eq lr((bb(O)^dagger))_(i j)
    eq lr((chevron.l j bar.v hat(O) bar.v i chevron.r))^ast.basic
    eq O_(j i)^ast.basic
  $ <eq:159>
]

Наконец, оператор называется эрмитовым, если он самосопряжён:

#book-eq[(1.60)][
  $
    hat(O) eq hat(O)^dagger
  $ <eq:160>
]

Следовательно, элементы матричного представления эрмитова оператора
удовлетворяют соотношению

#book-eq[(1.61)][
  $
    chevron.l a bar.v hat(O) bar.v b chevron.r
    eq chevron.l a bar.v hat(O)^dagger bar.v b chevron.r
    eq lr((chevron.l b bar.v hat(O) bar.v a chevron.r))^ast.basic
  $ <eq:161>
]

=== Замена базиса
<замена-базиса>
В подразделе 1.1.1 мы видели, что выбор базиса не является единственным.
Пусть даны два полных ортонормированных базиса
$brace.l bar.v i chevron.r brace.r$ и
$brace.l bar.v alpha chevron.r brace.r$; теперь нужно найти связь между
ними. Для обозначения бра- и кет-векторов первого базиса будем использовать
латинские буквы $i comma j comma k comma dots.h$, а для бра- и кет-векторов
второго базиса — греческие буквы $alpha comma beta comma gamma$. Поэтому
имеем

#book-eq[(1.62a)][
  $
    chevron.l i bar.v j chevron.r eq delta_(i j) comma quad
    sum_i bar.v i chevron.r chevron.l i bar.v eq 1
  $ <eq:162a>
]

и

#book-eq[(1.62b)][
  $
    chevron.l alpha bar.v beta chevron.r eq delta_(alpha beta) comma quad
    sum_alpha bar.v alpha chevron.r chevron.l alpha bar.v eq 1
  $ <eq:162b>
]

Поскольку базис $brace.l bar.v i chevron.r brace.r$ полон, любой кет из
базиса $brace.l bar.v alpha chevron.r brace.r$ можно выразить как линейную
комбинацию кетов базиса $brace.l bar.v i chevron.r brace.r$, и наоборот.
То есть

#book-eq[(1.63)][
  $
    bar.v alpha chevron.r eq 1 bar.v alpha chevron.r
    eq sum_i bar.v i chevron.r chevron.l i bar.v alpha chevron.r
    eq sum_i bar.v i chevron.r U_(i alpha)
  $ <eq:163>
]

где мы определили элементы матрицы преобразования $bb(U)$ как

#book-eq[(1.64)][
  $
    chevron.l i bar.v alpha chevron.r eq U_(i alpha) eq lr((bb(U)))_(i alpha)
  $ <eq:164>
]

При преобразовании в противоположном направлении получаем

#book-eq[(1.65)][
  $
    bar.v i chevron.r eq 1 bar.v i chevron.r
    eq sum_alpha bar.v alpha chevron.r chevron.l alpha bar.v i chevron.r
    eq sum_alpha bar.v alpha chevron.r U_(i alpha)^ast.basic
    eq sum_alpha bar.v alpha chevron.r lr((bb(U)^dagger))_(alpha i)
  $ <eq:165>
]

где использованы уравнение @eq:149 и определение сопряжённой матрицы,
показывающие, что

#book-eq[(1.66)][
  $
    chevron.l alpha bar.v i chevron.r eq lr((chevron.l i bar.v alpha chevron.r))^ast.basic
    eq U_(i alpha)^ast.basic eq lr((bb(U)^dagger))_(alpha i)
  $ <eq:166>
]

Важно помнить, что, поскольку $bb(U)$ определена уравнением @eq:164,
$chevron.l alpha bar.v i chevron.r$ не равно $U_(alpha i)$, а задаётся
уравнением @eq:166. Теперь докажем, что матрица преобразования $bb(U)$
унитарна. Это является следствием ортонормированности базисов:

$
  delta_(i j) eq chevron.l i bar.v j chevron.r
  & eq sum_(alpha beta) chevron.l i bar.v alpha chevron.r
  chevron.l alpha bar.v beta chevron.r chevron.l beta bar.v j chevron.r \
  & eq sum_alpha lr((bb(U)))_(i alpha) lr((bb(U)^dagger))_(alpha j) \
  & eq lr((bb(U) bb(U)^dagger))_(i j)
$

В матричной записи это просто

#book-eq[(1.67a)][
  $
    bb(1) eq bb(U) bb(U)^dagger
  $ <eq:167a>
]

Аналогично, начиная с $chevron.l alpha bar.v beta chevron.r eq
delta_(alpha beta)$, можно показать, что

#book-eq[(1.67b)][
  $
    bb(1) eq bb(U)^dagger bb(U)
  $ <eq:167b>
]

и, следовательно, $bb(U)$ унитарна. Таким образом, мы приходим к важному
результату: два ортонормированных базиса связаны унитарной матрицей через
уравнение @eq:163 и обратное к нему уравнение @eq:165. Как показывает
уравнение @eq:164, элементы матрицы преобразования $bb(U)$ являются
скалярными произведениями между векторами двух базисов.

Теперь рассмотрим, как связаны матричные представления оператора
$hat(O)$ в двух разных полных ортонормированных базисах. Полученный
результат будет играть центральную роль в следующем подразделе, где мы
будем рассматривать задачу на собственные значения. Пусть $bb(O)$ —
матричное представление $hat(O)$ в базисе
$brace.l bar.v i chevron.r brace.r$, а $bb(Omega)$ — его матричное
представление в базисе $brace.l bar.v alpha chevron.r brace.r$:

#book-eq[(1.68a)][
  $
    hat(O) bar.v i chevron.r eq sum_j bar.v j chevron.r chevron.l j bar.v hat(O) bar.v i chevron.r
    eq sum_j bar.v j chevron.r O_(j i)
  $ <eq:168a>
]

#book-eq[(1.68b)][
  $
    hat(O) bar.v alpha chevron.r eq sum_beta bar.v beta chevron.r chevron.l beta bar.v hat(O) bar.v alpha chevron.r
    eq sum_beta bar.v beta chevron.r Omega_(beta alpha)
  $ <eq:168b>
]

Чтобы найти связь между $bb(O)$ и $bb(Omega)$, используем уже знакомый
приём введения единичного оператора:

#book-eq[(1.69)][
  $
    Omega_(alpha beta) eq chevron.l alpha bar.v hat(O) bar.v beta chevron.r
    & eq chevron.l alpha bar.v 1 hat(O) 1 bar.v beta chevron.r \
    & eq sum_(i j) chevron.l alpha bar.v i chevron.r
    chevron.l i bar.v hat(O) bar.v j chevron.r
    chevron.l j bar.v beta chevron.r \
    & eq sum_(i j) lr((bb(U)^dagger))_(alpha i) O_(i j) U_(j beta)
  $ <eq:169>
]

Следовательно,

#book-eq[(1.70a)][
  $
    bb(Omega) eq bb(U)^dagger bb(O) bb(U)
  $ <eq:170a>
]

или, умножая слева на $bb(U)$, а справа на $bb(U)^dagger$,

#book-eq[(1.70b)][
  $
    bb(O) eq bb(U) bb(Omega) bb(U)^dagger
  $ <eq:170b>
]

Эти уравнения показывают, что матрицы $bb(O)$ и $bb(Omega)$ связаны
унитарным преобразованием. Важность таких преобразований состоит в том,
что для любого эрмитова оператора, матричное представление которого в
базисе $brace.l bar.v i chevron.r brace.r$ недиагонально, всегда можно
найти базис $brace.l bar.v alpha chevron.r brace.r$, в котором матричное
представление оператора диагонально, т. е.

#book-eq[(1.71)][
  $
    Omega_(alpha beta) eq omega_alpha delta_(alpha beta)
  $ <eq:171>
]

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

=== Задача на собственные значения
<задача-на-собственные-значения>
Когда оператор $hat(O)$ действует на вектор $bar.v alpha chevron.r$,
получающийся вектор в общем случае отличается от $bar.v alpha chevron.r$.
Если $hat(O) bar.v alpha chevron.r$ является просто постоянной, умноженной
на $bar.v alpha chevron.r$, т. е.

#book-eq[(1.72)][
  $
    hat(O) bar.v alpha chevron.r eq omega_alpha bar.v alpha chevron.r
  $ <eq:172>
]

то $bar.v alpha chevron.r$ называется собственным вектором оператора
$hat(O)$ с собственным значением $omega_alpha$. Без потери общности
собственные векторы можно выбрать нормированными:

#book-eq[(1.73)][
  $
    chevron.l alpha bar.v alpha chevron.r eq 1
  $ <eq:173>
]

В этой книге нас интересуют собственные векторы и собственные значения
эрмитовых операторов ($hat(O)^dagger eq hat(O)$). Они обладают следующими
свойствами.

#emph[1. Собственные значения эрмитова оператора действительны.] Это
непосредственно следует из уравнения @eq:161, которое утверждает, что

#book-eq[(1.74)][
  $
    chevron.l alpha bar.v hat(O) bar.v alpha chevron.r
    eq chevron.l alpha bar.v hat(O)^dagger bar.v alpha chevron.r
    eq lr((chevron.l alpha bar.v hat(O) bar.v alpha chevron.r))^ast.basic
  $ <eq:174>
]

Умножая соотношение для собственного значения @eq:172 слева на
$chevron.l alpha bar.v$ и подставляя результат в @eq:174, получаем

#book-eq[(1.75)][
  $
    omega_alpha eq omega_alpha^ast.basic
  $ <eq:175>
]

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

где мы использовали @eq:157 и тот факт, что сопряжением числа является его
комплексное сопряжение. Поскольку $hat(O)$ эрмитов, а $omega_beta$
действителен, получаем

#book-eq[(1.76)][
  $
    chevron.l beta bar.v hat(O) eq chevron.l beta bar.v omega_beta
  $ <eq:176>
]

Умножая @eq:172 слева на $chevron.l beta bar.v$, а @eq:176 справа на
$bar.v alpha chevron.r$ и вычитая получающиеся выражения, находим

#book-eq[(1.77)][
  $
    lr((omega_beta minus omega_alpha)) chevron.l beta bar.v alpha chevron.r eq 0
  $ <eq:177>
]

так что $chevron.l beta bar.v alpha chevron.r eq 0$, если
$omega_alpha != omega_beta$. Следовательно, ортогональность немедленно
вытекает, если два собственных значения не совпадают, т. е. если они
невырождены. Два собственных вектора $bar.v 1 chevron.r$ и
$bar.v 2 chevron.r$ являются вырожденными, если им соответствует одно и
то же собственное значение:

#book-eq[(1.78)][
  $
    hat(O) bar.v 1 chevron.r eq omega bar.v 1 chevron.r comma quad
    hat(O) bar.v 2 chevron.r eq omega bar.v 2 chevron.r
  $ <eq:178>
]

Теперь покажем, что вырожденные собственные векторы всегда можно выбрать
ортогональными. Сначала заметим, что любая линейная комбинация
вырожденных собственных векторов также является собственным вектором с тем
же собственным значением, т. е.

#book-eq[(1.79)][
  $
    hat(O) lr((x bar.v 1 chevron.r plus y bar.v 2 chevron.r))
    eq x omega bar.v 1 chevron.r plus y omega bar.v 2 chevron.r
    eq omega lr((x bar.v 1 chevron.r plus y bar.v 2 chevron.r))
  $ <eq:179>
]

Существует много способов найти две линейные комбинации
$bar.v 1 chevron.r$ и $bar.v 2 chevron.r$, которые ортогональны. Одна из
таких процедур называется ортогонализацией Шмидта. Предположим, что
$bar.v 1 chevron.r$ и $bar.v 2 chevron.r$ нормированы, и пусть
$chevron.l 1 bar.v 2 chevron.r eq S != 0$. Выберем
$bar.v upright(I) chevron.r eq bar.v 1 chevron.r$, так что
$chevron.l upright(I) bar.v upright(I) chevron.r eq 1$. Положим
$bar.v upright(II)' chevron.r eq bar.v 1 chevron.r plus c bar.v 2 chevron.r$
и выберем $c$ так, чтобы
$chevron.l upright(I) bar.v upright(II)' chevron.r eq 0 eq 1 plus c S$.
Наконец, нормируем $bar.v upright(II)' chevron.r$ и получаем

#book-eq[(1.80)][
  $
    bar.v upright(II) chevron.r eq lr((S^(-2) minus 1))^(-1 slash 2)
    lr((bar.v 1 chevron.r minus S^(-1) bar.v 2 chevron.r))
  $ <eq:180>
]

Таким образом, собственные векторы
$brace.l bar.v alpha chevron.r brace.r$ эрмитова оператора можно выбрать
так, чтобы они образовывали ортонормированный набор:

#book-eq[(1.81)][
  $
    chevron.l alpha bar.v beta chevron.r eq delta_(alpha beta)
  $ <eq:181>
]

Матричное представление эрмитова оператора $hat(O)$ в произвольном базисе
$brace.l bar.v i chevron.r brace.r$ в общем случае не диагонально. Однако
его матричное представление в базисе, образованном его собственными
векторами, диагонально. Чтобы показать это, умножим уравнение для
собственного значения @eq:172 слева на $chevron.l beta bar.v$ и используем
соотношение ортонормированности @eq:181:

#book-eq[(1.82)][
  $
    chevron.l beta bar.v hat(O) bar.v alpha chevron.r eq omega_alpha delta_(alpha beta)
  $ <eq:182>
]

Задачу на собственные значения, которую мы хотим решить, можно
сформулировать следующим образом. Пусть дана матрица $bb(O)$ — матричное
представление эрмитова оператора $hat(O)$ в ортонормированном базисе
$brace.l bar.v i chevron.r comma i eq 1 comma 2 comma dots.h comma N brace.r$.
Нужно найти ортонормированный базис
$brace.l bar.v alpha chevron.r comma alpha eq 1 comma 2 comma dots.h comma N brace.r$,
в котором матричное представление $bb(Omega)$ оператора $hat(O)$
диагонально, т. е. $Omega_(alpha beta) eq omega_alpha delta_(alpha beta)$.
Иными словами, нужно диагонализовать матрицу $bb(O)$. В предыдущем
подразделе мы видели, что два представления оператора $hat(O)$ связаны
унитарным преобразованием (ср. уравнение @eq:170a):

$
  bb(Omega) eq bb(U)^dagger bb(O) bb(U)
$

Следовательно, задача диагонализации эрмитовой матрицы $bb(O)$
эквивалентна задаче нахождения унитарной матрицы $bb(U)$, переводящей
$bb(O)$ в диагональную матрицу:

#book-eq[(1.83)][
  $
    bb(U)^dagger bb(O) bb(U) eq bb(omega) eq
    mat(
      delim: "(", omega_1, 0, dots.h, 0;
      0, omega_2, dots.h, 0;
      dots.v, dots.v, dots.down, dots.v;
      0, 0, dots.h, omega_N
    )
  $ <eq:183>
]

Из такой формулировки ясно, что эрмитова матрица размера $N times N$
имеет $N$ собственных значений.

Существует множество эффективных алгоритмов диагонализации эрмитовых
матриц.#super[1] Для наших целей компьютерные программы, основанные на таких
алгоритмах, можно рассматривать как «чёрные ящики», которые по заданной
матрице $bb(O)$ определяют $bb(U)$ и $bb(omega)$. Чтобы установить связь с
изложением задачи на собственные значения, встречающимся в большинстве
элементарных учебников по квантовой химии, теперь рассмотрим вычислительно
неэффективную процедуру, основанную на нахождении корней секулярного
определителя.

Поставленную выше задачу на собственные значения можно переформулировать
следующим образом. Для заданной эрмитовой матрицы $bb(O)$ размера
$N times N$ нужно найти все различные матрицы-столбцы $bold(c)$
(собственные векторы $bb(O)$) и соответствующие числа $omega$
(собственные значения $bb(O)$), такие что

#book-eq[(1.84a)][
  $
    bb(O) bold(c) eq omega bold(c)
  $ <eq:184a>
]

Это уравнение можно переписать как

#book-eq[(1.84b)][
  $
    lr((bb(O) minus omega bb(1))) bold(c) eq 0
  $ <eq:184b>
]

Как было показано в упражнении 1.7, уравнение @eq:184b может иметь
нетривиальное решение ($bold(c) != 0$) только тогда, когда

#book-eq[(1.85)][
  $
    det lr((bb(O) minus omega bb(1))) eq 0
  $ <eq:185>
]

Это называется секулярным определителем. Такой определитель является
многочленом степени $N$ относительно неизвестной $omega$. Многочлен
степени $N$ имеет $N$ корней $omega_alpha$,
$alpha eq 1 comma 2 comma dots.h comma N$, которые в данном случае
называются собственными значениями матрицы $bb(O)$. После нахождения
собственных значений соответствующие собственные векторы можно найти,
подставляя каждое $omega_alpha$ в уравнение @eq:184a и решая получающиеся
уравнения для $bold(c)^alpha$. Таким образом, $bold(c)^alpha$ определяется
с точностью до множительного коэффициента, который в конце фиксируется
условием нормировки $bold(c)^alpha$:

#book-eq[(1.86)][
  $
    sum_i lr((c_i^alpha))^ast.basic c_i^alpha eq 1
  $ <eq:186>
]

Так мы можем найти $N$ решений уравнения @eq:184a:

#book-eq[(1.87)][
  $
    bb(O) bold(c)^alpha eq omega_alpha bold(c)^alpha quad
    alpha eq 1 comma 2 comma dots.h comma N
  $ <eq:187>
]

Поскольку $bb(O)$ эрмитова, её собственные значения действительны, а
собственные векторы ортогональны:

#book-eq[(1.88)][
  $
    sum_i lr((c_i^alpha))^ast.basic c_i^beta eq delta_(alpha beta)
  $ <eq:188>
]

Чтобы установить связь с предыдущими результатами, построим матрицу
$bb(U)$, определённую как $U_(i alpha) eq c_i^alpha$, т. е.

#book-eq[(1.89)][
  $
    bb(U) eq
    mat(
      delim: "(", c_1^1, c_1^2, dots.h, c_1^N;
      c_2^1, c_2^2, dots.h, c_2^N;
      dots.v, dots.v, dots.down, dots.v;
      c_N^1, c_N^2, dots.h, c_N^N
    )
    eq lr((bold(c)^1 bold(c)^2 dots.h bold(c)^N))
  $ <eq:189>
]

Таким образом, $alpha$-й столбец $bb(U)$ — это просто матрица-столбец
$bold(c)^alpha$. Тогда, используя @eq:187, можно показать, что

#book-eq[(1.90)][
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
]

Поскольку $U_(i alpha) eq c_i^alpha$, соотношение ортонормированности
@eq:188 эквивалентно

#book-eq[(1.91)][
  $
    sum_i lr((c_i^alpha))^ast.basic c_i^beta
    eq sum_i lr((bb(U)^dagger))_(alpha i) U_(i beta)
    eq delta_(alpha beta)
  $ <eq:191>
]

что в матричной записи имеет вид

#book-eq[(1.92)][
  $
    bb(U)^dagger bb(U) eq bb(1)
  $ <eq:192>
]

Наконец, умножая обе части уравнения @eq:190 слева на $bb(U)^dagger$ и
используя уравнение @eq:192, получаем

#book-eq[(1.93)][
  $
    bb(U)^dagger bb(O) bb(U) eq bb(omega)
  $ <eq:193>
]

что идентично уравнению @eq:183. Поэтому уравнение @eq:189 задаёт связь
между унитарным преобразованием $bb(U)$, диагонализующим матрицу $bb(O)$,
и собственными векторами $bold(c)^alpha$ матрицы $bb(O)$.

#task()[
  Покажите, что уравнение @eq:190 содержит уравнение @eq:187 для всех
  $alpha eq 1 comma 2 comma dots.h comma N$.
]

В качестве иллюстрации этого формализма рассмотрим задачу нахождения
собственных значений и собственных векторов симметричной матрицы размера
$2 times 2$ ($O_12 eq O_21$):

$
  bb(O) eq mat(delim: "(", O_11, O_12; O_21, O_22)
$

или, что то же самое, задачу на собственные значения

#book-eq[(1.94)][
  $
    mat(delim: "(", O_11, O_12; O_21, O_22) vec(c_1, c_2)
    eq omega vec(c_1, c_2)
  $ <eq:194>
]

Мы решим эту задачу двумя способами: сначала через секулярный определитель
(уравнение @eq:185), а затем непосредственным нахождением матрицы $bb(U)$,
диагонализующей $bb(O)$. Чтобы уравнение @eq:194 имело нетривиальное
решение, секулярный определитель должен обращаться в нуль:

#book-eq[(1.95)][
  $
    det mat(delim: "(", O_11 minus omega, O_12; O_21, O_22 minus omega)
    eq omega^2 minus omega lr((O_22 plus O_11)) plus O_11 O_22 minus O_12 O_21 eq 0
  $ <eq:195>
]

Это квадратное уравнение имеет два решения:

#book-eq[(1.96a)][
  $
    omega_1 eq frac(1, 2) lr([O_11 plus O_22 minus lr(((O_22 minus O_11)^2 plus 4 O_12 O_21))^(1 slash 2)])
  $ <eq:196a>
]

#book-eq[(1.96b)][
  $
    omega_2 eq frac(1, 2) lr([O_11 plus O_22 plus lr(((O_22 minus O_11)^2 plus 4 O_12 O_21))^(1 slash 2)])
  $ <eq:196b>
]

которые являются собственными значениями матрицы $bb(O)$. Чтобы найти
собственный вектор, соответствующий заданному собственному значению,
например $omega_2$, подставим $omega_2$ в уравнение @eq:194 и получим

#book-eq[(1.97a)][
  $
    O_11 c_1^2 plus O_12 c_2^2 eq omega_2 c_1^2
  $ <eq:197a>
]

#book-eq[(1.97b)][
  $
    O_21 c_1^2 plus O_22 c_2^2 eq omega_2 c_2^2
  $ <eq:197b>
]

где верхние индексы «2» показывают, что рассматривается второе собственное
значение. Затем используем одно из этих двух эквивалентных уравнений и
условие нормировки

#book-eq[(1.98)][
  $
    lr((c_1^2))^2 plus lr((c_2^2))^2 eq 1
  $ <eq:198>
]

для нахождения $c_1^2$ и $c_2^2$. В качестве простой иллюстрации рассмотрим
случай $O_11 eq O_22 eq a$ и $O_12 eq O_21 eq b$. Из уравнений @eq:196a и
@eq:196b получаем два собственных значения:

#book-eq[(1.99a)][
  $
    omega_1 eq a minus b
  $ <eq:199a>
]

#book-eq[(1.99b)][
  $
    omega_2 eq a plus b
  $ <eq:199b>
]

Чтобы найти собственный вектор, соответствующий $omega_2$, используем
уравнение @eq:197a, которое в данном случае даёт

$
  a c_1^2 plus b c_2^2 eq lr((a plus b)) c_1^2
$

откуда получаем

$
  c_1^2 eq c_2^2
$

Наконец, условие нормировки @eq:198 даёт

#book-eq[(1.100a)][
  $
    c_1^2 eq 2^(-1 slash 2) comma quad c_2^2 eq 2^(-1 slash 2)
  $ <eq:1100a>
]

Полностью аналогично находим

#book-eq[(1.100b)][
  $
    c_1^1 eq 2^(-1 slash 2) comma quad c_2^1 eq minus 2^(-1 slash 2)
  $ <eq:1100b>
]

#task()[
  Поскольку компоненты собственного вектора могут быть найдены из
  уравнения на собственные значения только с точностью до множительного
  коэффициента, который затем определяется нормировкой, в уравнении @eq:194
  можно положить $c_1 eq 1$ и $c_2 eq c$. Тогда уравнение @eq:194
  принимает вид

  $
    O_11 plus O_12 c eq omega
  $

  $
    O_21 plus O_22 c eq omega c
  $

  Исключив $c$, найдите два корня получающегося уравнения и покажите, что
  они совпадают с корнями, заданными уравнениями @eq:196a и @eq:196b. Этот
  приём, который мы ещё много раз будем использовать в книге для нахождения
  наименьшего собственного значения матрицы, по существу является методом
  секулярного определителя без определителей. Поэтому его можно использовать
  для нахождения наименьшего собственного значения некоторых матриц размера
  $N times N$, не вычисляя определитель размера $N times N$.
]

Теперь решим задачу на собственные значения для матрицы $2 times 2$ путём
непосредственного нахождения ортогональной матрицы $bb(U)$,
диагонализующей симметричную матрицу $bb(O)$, т. е.

#book-eq[(1.101)][
  $
    bb(U)^dagger bb(O) bb(U)
    eq mat(delim: "(", U_11, U_21; U_12, U_22)
    mat(delim: "(", O_11, O_12; O_12, O_22)
    mat(delim: "(", U_11, U_12; U_21, U_22)
    eq bb(omega) eq mat(delim: "(", omega_1, 0; 0, omega_2)
  $ <eq:1101>
]

Требование

#book-eq[(1.102)][
  $
    bb(U)^dagger bb(U)
    eq mat(
      delim: "(", U_11 U_11 plus U_21 U_21, U_11 U_12 plus U_21 U_22;
      U_12 U_11 plus U_22 U_21, U_12 U_12 plus U_22 U_22
    )
    eq bb(1) eq mat(delim: "(", 1, 0; 0, 1)
  $ <eq:1102>
]

накладывает три ограничения (два диагональных и одно недиагональное) на
четыре элемента матрицы $bb(U)$. Следовательно, $bb(U)$ может быть
полностью задана всего одним параметром. Поскольку

#book-eq[(1.103)][
  $
    mat(delim: "(", cos theta, sin theta; sin theta, minus cos theta)
    mat(delim: "(", cos theta, sin theta; sin theta, minus cos theta)
    eq mat(
      delim: "(", cos^2 theta plus sin^2 theta, 0;
      0, cos^2 theta plus sin^2 theta
    )
    eq bb(1)
  $ <eq:1103>
]

при любых значениях параметра $theta$, удобно записать

#book-eq[(1.104)][
  $
    bb(U) eq mat(delim: "(", cos theta, sin theta; sin theta, minus cos theta)
  $ <eq:1104>
]

Это наиболее общий вид ортогональной матрицы $2 times 2$. Теперь выберем
$theta$ так, чтобы

$
  bb(U)^dagger bb(O) bb(U)
  & eq mat(delim: "(", cos theta, sin theta; sin theta, minus cos theta)
  mat(delim: "(", O_11, O_12; O_12, O_22)
  mat(delim: "(", cos theta, sin theta; sin theta, minus cos theta) \
  & eq mat(
    delim: "(",
    O_11 cos^2 theta plus O_22 sin^2 theta plus O_12 sin 2 theta,
    frac(1, 2) lr((O_11 minus O_22)) sin 2 theta minus O_12 cos 2 theta;
    frac(1, 2) lr((O_11 minus O_22)) sin 2 theta minus O_12 cos 2 theta,
    O_11 sin^2 theta plus O_22 cos^2 theta minus O_12 sin 2 theta
  )
$

была диагональной. Это выполняется, если выбрать $theta$ так, чтобы

$
  frac(1, 2) lr((O_11 minus O_22)) sin 2 theta minus O_12 cos 2 theta eq 0
$

Это уравнение имеет решение

#book-eq[(1.105)][
  $
    theta_0 eq frac(1, 2) tan^(-1) frac(2 O_12, O_11 minus O_22)
  $ <eq:1105>
]

Следовательно, два собственных значения $bb(O)$ равны

#book-eq[(1.106a)][
  $
    omega_1 eq O_11 cos^2 theta_0 plus O_22 sin^2 theta_0 plus O_12 sin 2 theta_0
  $ <eq:1106a>
]

и

#book-eq[(1.106b)][
  $
    omega_2 eq O_11 sin^2 theta_0 plus O_22 cos^2 theta_0 minus O_12 sin 2 theta_0
  $ <eq:1106b>
]

Сравнивая уравнения @eq:1104 и @eq:189, получаем два собственных вектора:

#book-eq[(1.107a)][
  $
    vec(c_1^1, c_2^1) eq vec(cos theta_0, sin theta_0)
  $ <eq:1107a>
]

и

#book-eq[(1.107b)][
  $
    vec(c_1^2, c_2^2) eq vec(sin theta_0, minus cos theta_0)
  $ <eq:1107b>
]

Следует упомянуть, что метод Якоби для диагонализации матриц размера
$N times N$ является обобщением описанной выше процедуры. Основная идея
этого метода состоит в итерационном устранении недиагональных элементов
матрицы путём многократного применения ортогональных преобразований,
подобных рассмотренным здесь.

#task()[
  Рассмотрите матрицы

  $
    bb(A) eq mat(delim: "(", 3, 1; 1, 3)
  $

  $
    bb(B) eq mat(delim: "(", 3, 1; 1, 2)
  $

  Найдите численные значения собственных значений и соответствующих
  собственных векторов этих матриц: a) методом секулярного определителя;
  b) методом унитарного преобразования. Вы увидите, что подход (b) намного
  проще.
]

=== Функции матриц
<функции-матриц>
Для заданной эрмитовой матрицы $bb(A)$ можно определить функцию от
$bb(A)$, т. е. $f lr((bb(A)))$, почти так же, как определяется функция
$f lr((x))$ от простой переменной $x$. Например, квадратный корень из
матрицы $bb(A)$, обозначаемый $bb(A)^(1 slash 2)$, — это просто такая
матрица, которая при умножении на саму себя даёт $bb(A)$, т. е.

#book-eq[(1.108)][
  $
    bb(A)^(1 slash 2) bb(A)^(1 slash 2) eq bb(A)
  $ <eq:1108>
]

Синус или экспонента матрицы определяются через ряд Тейлора
соответствующей функции, например

$
  exp lr((bb(A))) eq bb(1) plus frac(1, 1 excl) bb(A)
  plus frac(1, 2 excl) bb(A)^2 plus frac(1, 3 excl) bb(A)^3 plus dots.h
$

или в общем виде

#book-eq[(1.109)][
  $
    f lr((bb(A))) eq sum_(n eq 0)^oo c_n bb(A)^n
  $ <eq:1109>
]

После этих определений остаётся задача вычисления $bb(A)^(1 slash 2)$ или
$exp lr((bb(A)))$. Если $bb(A)$ — диагональная матрица,

$
  lr((bb(A)))_(i j) eq a_i delta_(i j)
$

то всё просто, поскольку

#book-eq[(1.110)][
  $
    bb(A)^n eq mat(
      delim: "(", a_1^n, 0, dots.h, 0;
      0, a_2^n, dots.h, 0;
      dots.v, dots.v, dots.down, dots.v;
      0, 0, dots.h, a_N^n
    )
  $ <eq:1110>
]

и поэтому

#book-eq[(1.111)][
  $
    f lr((bb(A))) eq sum_(n eq 0)^oo c_n bb(A)^n & eq mat(
                                                     delim: "(", sum_n c_n a_1^n, 0, dots.h, 0;
                                                     0, sum_n c_n a_2^n, dots.h, 0;
                                                     dots.v, dots.v, dots.down, dots.v;
                                                     0, 0, dots.h, sum_n c_n a_N^n
                                                   ) \
                                                 & eq mat(
                                                     delim: "(", f lr((a_1)), 0, dots.h, 0;
                                                     0, f lr((a_2)), dots.h, 0;
                                                     dots.v, dots.v, dots.down, dots.v;
                                                     0, 0, dots.h, f lr((a_N))
                                                   )
  $ <eq:1111>
]

Аналогично квадратный корень из диагональной матрицы имеет вид

#book-eq[(1.112)][
  $
    bb(A)^(1 slash 2) eq mat(
      delim: "(", a_1^(1 slash 2), 0, dots.h, 0;
      0, a_2^(1 slash 2), dots.h, 0;
      dots.v, dots.v, dots.down, dots.v;
      0, 0, dots.h, a_N^(1 slash 2)
    )
  $ <eq:1112>
]

Что делать, если $bb(A)$ не диагональна? Поскольку $bb(A)$ эрмитова, всегда
можно найти унитарное преобразование, диагонализующее её, т. е.

#book-eq[(1.113a)][
  $
    bb(U)^dagger bb(A) bb(U) eq bb(a)
  $ <eq:1113a>
]

Обратное преобразование, которое «раздиагонализует» $bb(a)$, имеет вид

#book-eq[(1.113b)][
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

#book-eq[(1.114)][
  $
    bb(A)^n eq bb(U) bb(a)^n bb(U)^dagger
  $ <eq:1114>
]

поэтому

$
  f lr((bb(A))) eq sum_n c_n bb(A)^n
  eq bb(U) lr((sum_n c_n bb(a)^n)) bb(U)^dagger
  eq bb(U) f lr((bb(a))) bb(U)^dagger
$

то есть

#book-eq[(1.115)][
  $
    f lr((bb(A))) eq bb(U)
    mat(
      delim: "(", f lr((a_1)), 0, dots.h, 0;
      0, f lr((a_2)), dots.h, 0;
      dots.v, dots.v, dots.down, dots.v;
      0, 0, dots.h, f lr((a_N))
    )
    bb(U)^dagger
  $ <eq:1115>
]

#counter(math.equation).update(115)

Следовательно, чтобы вычислить любую функцию эрмитовой матрицы $bb(A)$,
сначала диагонализуют $bb(A)$ и получают $bb(a)$ — диагональную матрицу,
содержащую все собственные значения $bb(A)$. Затем вычисляют
$f lr((bb(a)))$, что просто, потому что $bb(a)$ диагональна. Наконец,
$f lr((bb(a)))$ «раздиагонализуют» с помощью @eq:1113b, получая @eq:1115.
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
$f lr((bb(A)))$, то $f lr((bb(A)))$ не существует. Например, если попытаться
вычислить обратную матрицу $bb(A)^(-1)$ для матрицы $bb(A)$, имеющей
нулевое собственное значение (скажем, $a_i eq 0$), то
$f lr((a_i)) eq 1 / a_i eq oo$, и поэтому $bb(A)^(-1)$ не существует. Как
показывает упражнение 1.12(a), определитель матрицы равен произведению её
собственных значений. Следовательно, если одно из собственных значений
$bb(A)$ равно нулю, то $det lr((bb(A)))$ равен нулю, и приведённый выше
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

  + $det lr((bb(A)^n)) eq a_1^n a_2^n dots.h a_N^n$.

  + $tr bb(A)^n eq sum_(alpha eq 1)^N a_alpha^n$.

  + Если $bb(G) lr((omega)) eq lr((omega bb(1) minus bb(A)))^(-1)$, то

    $
      lr((bb(G) lr((omega))))_(i j)
      eq sum_alpha frac(U_(i alpha) U_(j alpha)^ast.basic, omega minus a_alpha)
      eq sum_alpha frac(c_i^alpha lr((c_j^alpha))^ast.basic, omega minus a_alpha)
    $

    Покажите, что с использованием нотации Дирака это можно переписать как

    $
      lr((bb(G) lr((omega))))_(i j)
      eq chevron.l i bar.v bb(G) lr((omega)) bar.v j chevron.r
      eq sum_alpha frac(
        chevron.l i bar.v alpha chevron.r chevron.l alpha bar.v j chevron.r,
        omega minus a_alpha
      )
    $
]

В качестве интересного применения этого соотношения рассмотрим задачу
решения следующей системы неоднородных линейных уравнений:

$
  lr((omega bb(1) minus bb(A))) bold(x) eq bold(c)
$

относительно $bold(x)$. Самый прямой путь состоит в обращении
$omega bb(1) minus bb(A)$, т. е.

$
  bold(x) eq lr((omega bb(1) minus bb(A)))^(-1) bold(c)
  eq bb(G) lr((omega)) bold(c)
$

Если нужно получить $bold(x)$ как функцию $omega$, матрицу приходится
обращать для каждого значения $omega$. Однако, если диагонализовать
$bb(A)$, можно записать

$
  x_i eq sum_j lr((bb(G) lr((omega))))_(i j) c_j
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
    f lr((bb(A))) eq mat(
      delim: "(",
      frac(1, 2) lr([f lr((a plus b)) plus f lr((a minus b))]),
      frac(1, 2) lr([f lr((a plus b)) minus f lr((a minus b))]);
      frac(1, 2) lr([f lr((a plus b)) minus f lr((a minus b))]),
      frac(1, 2) lr([f lr((a plus b)) plus f lr((a minus b))])
    )
  $
]
