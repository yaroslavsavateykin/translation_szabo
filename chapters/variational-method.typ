#import "../macros.typ": task




В этом разделе рассматривается важный подход к нахождению приближённых
решений уравнения на собственные значения

$ hat(O) Phi (x) eq omega Phi (x) $

Уравнения на собственные значения важны, поскольку стационарное
уравнение Шрёдингера представляет собой уравнение на собственные
значения:

$ hat(H) |Phi chevron.r eq E| Phi chevron.r $ <eq:b7deab>

$hat(H)$ — эрмитов оператор, называемый гамильтонианом,
$bar.v Phi chevron.r$ — волновая функция, $E$ — энергия. Необходимо
найти приближённые решения уравнений на собственные значения,
поскольку уравнение Шрёдингера не может быть решено точно за
исключением простейших случаев. Хотя нижеизложенное справедливо для
любой задачи на собственные значения, мы будем использовать нотацию и
терминологию, связанные с уравнением Шрёдингера @eq:b7deab.

При условии, что задан оператор $hat(H)$, существует бесконечный набор
точных решений уравнения Шрёдингера, пронумерованных индексом $alpha$,

$
  hat(H) |Phi_alpha chevron.r eq E_alpha| Phi_alpha chevron.r quad alpha eq 0 comma 1 comma dots.h
$

где

$ E_0 lt.eq E_1 lt.eq E_2 lt.eq dots.h lt.eq E_alpha lt.eq dots.h $

Для простоты мы предположили, что набор $brace.l E_alpha brace.r$
дискретен. Поскольку $hat(H)$ эрмитов, собственные значения $E_alpha$
действительны и соответствующие волновые функции ортонормированы

$
  chevron.l Phi_alpha bar.v Phi_beta chevron.r eq delta_(alpha beta)
$ <eq:1144>

Таким образом, умножая @eq:b7deab слева на $chevron.l Phi_beta bar.v$,
получим

$
  chevron.l Phi_beta |hat(H)| Phi_alpha chevron.r eq E_alpha delta_(alpha beta)
$ <eq:dc952f>

Более того, мы предполагаем, что собственные функции $hat(H)$ образуют
полный набор, и любая функция $bar.v tilde(Phi) chevron.r$,
удовлетворяющая тем же граничным условиям, что и набор
$brace.l bar.v Phi_alpha chevron.r brace.r$, может быть представлена
как линейная комбинация $bar.v Phi_alpha chevron.r$

$
  |tilde(Phi) chevron.r eq sum_alpha bar.v Phi_alpha chevron.r c_alpha eq sum_alpha bar.v Phi_alpha chevron.r chevron.l Phi_alpha| tilde(Phi) chevron.r
$ <eq:1146>

и

$
  chevron.l tilde(Phi) bar.v eq sum_alpha c_alpha^ast.basic chevron.l Phi_alpha| eq sum_alpha chevron.l tilde(Phi) |Phi_alpha chevron.r chevron.l Phi_alpha|
$ <eq:1147>
