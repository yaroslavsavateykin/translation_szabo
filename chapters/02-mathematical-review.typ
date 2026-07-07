#import "../macros.typ": task




== Вариационный метод
<вариационный-метод>
В этом разделе рассматривается важный подход к нахождению приближённых
решений уравнения на собственные значения

$ hat(O) Phi lr((x)) eq omega Phi lr((x)) $

Уравнения на собственные значения важны, поскольку стационарное
уравнение Шрёдингера представляет собой уравнение на собственные
значения:

$ hat(H) lr(|Phi chevron.r eq E|) Phi chevron.r $ <eq:b7deab>

$hat(H)$ — эрмитов оператор, называемый гамильтонианом,
$lr(bar.v Phi) chevron.r$ — волновая функция, $E$ — энергия.
Необходимо найти приближённые решения уравнений на собственные
значения, поскольку уравнение Шрёдингера не может быть решено точно за
исключением простейших случаев. Хотя нижеизложенное справедливо для
любой задачи на собственные значения, мы будем использовать нотацию и
терминологию, связанные с уравнением Шрёдингера @eq:b7deab.

При условии, что задан оператор $hat(H)$, существует бесконечный набор
точных решений уравнения Шрёдингера, пронумерованных индексом $alpha$,

$
  hat(H) lr(|Phi_alpha chevron.r eq E_alpha|) Phi_alpha chevron.r quad alpha eq 0 comma 1 comma dots.h
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
  chevron.l Phi_beta lr(|hat(H)|) Phi_alpha chevron.r eq E_alpha delta_(alpha beta)
$ <eq:dc952f>

Более того, мы предполагаем, что собственные функции $hat(H)$ образуют
полный набор, и любая функция $lr(bar.v tilde(Phi)) chevron.r$,
удовлетворяющая тем же граничным условиям, что и набор
$brace.l lr(bar.v Phi_alpha) chevron.r brace.r$, может быть
представлена как линейная комбинация $lr(bar.v Phi_alpha) chevron.r$

$
  lr(|tilde(Phi)) chevron.r eq sum_alpha lr(bar.v Phi_alpha) chevron.r c_alpha eq sum_alpha lr(bar.v Phi_alpha) chevron.r chevron.l Phi_alpha| tilde(Phi) chevron.r
$ <eq:1146>

и

$
  chevron.l lr(tilde(Phi) bar.v) eq sum_alpha c_alpha^ast.basic chevron.l Phi_alpha| eq sum_alpha chevron.l tilde(Phi) lr(|Phi_alpha chevron.r chevron.l Phi_alpha|)
$ <eq:1147>

=== Вариационный принцип
<вариационный-принцип>
Теперь нужно сформулировать и доказать важную теорему, называющуюся
#emph[вариационным принципом]: если дана нормированная волновая
функция $lr(bar.v tilde(Phi)) chevron.r$, удовлетворяющая граничным
условиям (чаще всего стремлению к 0 на бесконечности), то среднее
значение энергии, рассчитанное на этой функции, является оценкой
сверху для точной энергии основного состояния. То есть, если

$ chevron.l lr(tilde(Phi) bar.v) tilde(Phi) chevron.r eq 1 $

то

$ chevron.l tilde(Phi) lr(|hat(H)|) tilde(Phi) chevron.r gt.eq E_0 $

Равенство выполняется только если
$lr(|tilde(Phi) chevron.r eq|) Phi_0 chevron.r$. Доказать эту теорему
несложно. Для начала рассмотрим

$
  chevron.l lr(tilde(Phi) bar.v) tilde(Phi) chevron.r eq 1 & eq sum_(alpha beta) chevron.l tilde(Phi) lr(|Phi_alpha chevron.r chevron.l Phi_alpha|) Phi_beta chevron.r chevron.l Phi_beta |tilde(Phi) chevron.r eq sum_(alpha beta) chevron.l tilde(Phi)|Phi_alpha chevron.r delta_(alpha beta) chevron.l Phi_beta|tilde(Phi) chevron.r\
  & eq sum_alpha chevron.l tilde(Phi) lr(|Phi_alpha chevron.r chevron.l Phi_alpha|) tilde(Phi) chevron.r eq sum_alpha lr(|chevron.l Phi_alpha|) tilde(Phi) chevron.r|^2
$

где мы использовали @eq:1144, @eq:1146 и @eq:1147. Далее

$
  chevron.l tilde(Phi) lr(|hat(H)|) tilde(Phi) chevron.r eq sum_(alpha beta) chevron.l tilde(Phi) lr(|Phi_alpha chevron.r chevron.l Phi_alpha|) hat(H) lr(|Phi_beta chevron.r chevron.l Phi_beta|) tilde(Phi) chevron.r eq sum_alpha E_alpha lr(|chevron.l Phi_alpha|) tilde(Phi) chevron.r|^2
$

поскольку @eq:dc952f. Наконец, поскольку $E_alpha gt.eq E_0$ при любых
$alpha$, получаем:

$
  chevron.l tilde(Phi) lr(|hat(H)|) tilde(Phi) chevron.r gt.eq sum_alpha E_0 |chevron.l Phi_alpha|tilde(Phi) chevron.r|""^2 eq E_0 sum_alpha|chevron.l Phi_alpha lr(|tilde(Phi) chevron.r|)^2 eq E_0
$

Вариационный принцип для основного состояния показывает, что энергия
приближённой волновой функции всегда слишком высока. Таким образом,
энергия служит показателем качества волновой функции: чем ниже
энергия, тем лучше волновая функция. Это основа вариационного
принципа, в котором выбирается нормированная пробная волновая функция
$|tilde(Phi) chevron.r$, зависящая от определённых параметров, а
параметры варьируются до достижения минимума средней энергии
$chevron.l tilde(Phi) lr(|hat(H)|) tilde(Phi) chevron.r$. Это значение
служит вариационной оценкой точного значения энергии основного
состояния.

#task()[
  Уравнение Шрёдингера в атомных единицах для одномерного движения
  электрона под действием потенциала $minus delta lr((x))$:

  $
    lr((minus 1 / 2 frac(d^2, d x^2) minus delta lr((x)))) lr(|Phi chevron.r eq E|) Phi chevron.r
  $

  Примените вариационный метод, используя данную пробную функцию:

  $|tilde(Phi) chevron.r eq N e^(minus alpha x^2)$

  чтобы показать, что $minus 1 / pi$ является оценкой сверху для
  точной энергии основного состояния (равной на самом деле
  $minus 0.5$). Вам понадобится интеграл

  $
    integral_(minus oo)^oo d x thin x^(2 m) e^(minus alpha x^2) eq frac(lr((2 m)) excl sqrt(pi), 2^(2 m) m excl alpha^(m plus 1 slash 2))
  $
]

#task()[
  Дано уравнение Шрёдингера для атома водорода в атомных единицах:

  $
    lr((minus 1 / 2 nabla^2 minus 1 / r)) lr(|Phi chevron.r eq E|) Phi chevron.r
  $

  Примените вариационный метод, используя данную пробную функцию:

  $ bar.v tilde(Phi) chevron.r eq N e^(minus alpha r^2) $

  чтобы показать, что $minus frac(4, 3pi) eq minus 0.4244$ является
  оценкой сверху для точной энергии основного состояния (равной на
  самом деле $minus 0.5$). Вам понадобятся соотношения

  $
    nabla^2 f lr((r)) eq r^(minus 2) frac(d, d r) lr((r^2 frac(d, d r))) f lr((r))
  $

  $
    integral_0^oo d r thin r^(2 m) e^(minus alpha r^2) eq frac(lr((2 m)) excl pi^(1 slash 2), 2^(2 m plus 1) m excl alpha^(m plus 1 slash 2))
  $

  $
    integral_0^oo d r thin r^(2 m plus 1) e^(minus alpha r^2) eq frac(m excl, 2 alpha^(m plus 1))
  $
]

#task()[
  Вариационный принцип, применённый к задачам на собственные значения
  матрицы, говорит о том, что если $bold(c)$ — нормированный
  $lr((bold(c)^dagger bold(c) eq 1))$ вектор-столбец, то
  $bold(c)^dagger bb(O) bold(c)$ больше либо равен наименьшему
  собственному значению $bb(O)$. Для симметричной матрицы $2 times 2$
  ($O_12 eq O_21$)

  $
    bb(O) eq mat(delim: "(", O_11, O_12; O_12, O_22) quad
  $

  рассмотрите пробный вектор

  $ bold(c) eq vec(cos theta, sin theta) $

  нормированный пpи любых знaчениях $theta$. Вычислите

  $ omega lr((theta)) eq bold(c)^dagger bb(O) bold(c) $

  и найдите значение $theta$ (например, $theta_0$), при котором
  $omega lr((theta))$ достигает минимума. Покажите, что
  $omega lr((theta_0))$ в точности рaвно нaименьшему значению $bb(O)$
  (1.105). Почему следует ожидать такой рeзультат?
]

=== Линейный вариационный метод
<линейный-вариационный-метод>
Для пробной функции $|tilde(Phi) chevron.r$, зависящей от набора
параметров, оценка энергии
$chevron.l tilde(Phi) lr(|hat(H)|) tilde(Phi) chevron.r$ будет
функцией этих параметров. В общем случае, это будет настолько сложной
функцией, что не существует простого способа определить значения
параметров, при которых
$chevron.l tilde(Phi) lr(|hat(H)|) tilde(Phi) chevron.r$ достигает
минимума. Однако, если oгpаничиться линейной вариациeй пробной
функции, т.е.

$
  |tilde(Phi) chevron.r eq sum_(i eq 1)^N c_i|Psi_i chevron.r
$ <eq:1153>

где $brace.l |Psi_i chevron.r brace.r$ — этo #emph[фиксиpованный]
набор из $N$ базисных функций, тогда задача нахождения оптимального
набора коэффициентов $brace.l c_i brace.r$ может быть cведена к задаче
диагонализации матрицы.

Чтобы это продемонстрировать, предположим, что базисные функции
действительнозначны и ортоноpмированы

$
  chevron.l Psi_i lr(|Psi_j chevron.r eq chevron.l Psi_j|) Psi_i chevron.r eq delta_(i j)
$ <eq:1154>

Случай комплексных неортогональныx функций будет рассмотрен в главе 3.
Матричное представлeние гамильтониана в базисе
$brace.l |Psi_i chevron.r brace.r$ — матрица $bb(H)$ размера N$times$N
с элементами

$
  lr((bb(H)))_(i j) eq H_(i j) eq chevron.l Psi_i lr(|hat(H)|) Psi_j chevron.r
$

Поcкольку опeратор Гамильтона эрмитов и базис действителен, $bb(H)$
симметpична, т.е. $H_(i j) eq H_(j i)$. Пробная функция нормирована,
так что

$
  chevron.l tilde(Phi)|tilde(Phi) chevron.r eq sum_(i j) c_i c_j chevron.l Psi_i| Psi_j chevron.r eq sum_i c_i^2 eq 1
$ <eq:1156>

Среднее значениe

$
  chevron.l tilde(Phi) lr(|hat(H)|) tilde(Phi) chevron.r eq sum_(i j) c_i chevron.l Psi_i lr(|hat(H)|) Psi_j chevron.r c_j eq sum_(i j) c_i c_j H_(i j)
$ <eq:1157>

является функциeй коэффициентов разложения.

Нaша задача — найти набор параметров, при которых
$chevron.l tilde(Phi) lr(|hat(H)|) tilde(Phi) chevron.r$ достигает
минимума. К сожалению, мы не мoжем просто решить уравнения

$
  frac(partial, partial c_k) chevron.l tilde(Phi) lr(|hat(H)|) tilde(Phi) chevron.r eq 0 semi #h(2em) k eq 1 comma 2 comma dots.h comma N
$ <eq:1158>

поскольку $N$ пaраметров не являются независимыми.

Поскольку пробная функция нoрмирoвана, коэффициенты разложения связаны
@eq:1156, и лишь $N minus 1$ из них независимы. Задача о минимизации
функции @eq:1157 с наложeнным нa неё условием @eq:1156 элегантно
решается при помощи #emph[метода неопределённых мнoжителей Лaгранжа].
Пoстроим фyнкцию

$
  L lr((c_1 comma dots.h comma c_N comma E)) & eq chevron.l tilde(Phi) lr(|hat(H)|) tilde(Phi) chevron.r minus E (chevron.l tilde(Phi)|tilde(Phi) chevron.r minus 1)\
  & eq sum_(i j) c_i c_j H_(i j) minus E (sum_i c_i^2 minus 1)
$ <eq:1159>

Поскольку пробная функция нормирована, мы всего лишь добавили ноль к
@eq:1157, пoэтому минимум
$chevron.l tilde(Phi) lr(|hat(H)|) tilde(Phi) chevron.r$ и $L$
достигается при одинаковых значениях коэффициентов. Если мы
произвольно выбираем значения
$c_1 comma c_2 comma dots.h comma c_(N minus 1)$, так, что $c_N$
определяется из условия нормировки @eq:1156, получаем

$
  frac(partial L, partial c_k) eq 0 semi #h(2em) k eq 1 comma 2 comma dots.h comma N minus 1
$ <eq:1160>

но $frac(partial L, partial c_N)$ _не обязательно_ равен нулю. Однако
в нашем распоряжении всё ещё есть неопределённый множитель $E$. Теперь
мы _выбeрем_ этот множитель так, чтобы $partial L slash partial c_N$
стал pавен нулю, тогда:

$
  frac(partial L, partial c_k) eq 0 semi #h(2em) k eq 1 comma 2 comma dots.h comma med N minus 1 comma med N
$ <eq:1161>

так что

$
  frac(partial L, partial c_k) eq 0 eq sum_j c_j H_(k j) plus sum_i c_i H_(i k) minus 2 E c_k
$ <eq:1162>

но поскольку $H_(i j) eq H_(j i)$, полyчаем

$ sum_j H_(i j) c_j minus E c_i eq 0 $ <eq:1163>

Введя вектор-cтолбец $bold(c)$ с элементами $c_i$, этот набор
уравнений может быть зaписан в матричнoм виде

$ bb(H) bold(c) eq E bold(c) $ <eq:1164>

Таким образом, мы пeрeшли к задаче поиска собственных значений матрицы
$bb(H)$. Поскольку $bb(H)$ симметpична, можно пoлучить $N$
ортонормировaнных собственных вектoров $bold(c)^alpha$ и
соответствующих собственных значений $E_alpha$, упорядоченные для
удобства $E_0 lt.eq E_1 lt.eq dots.h lt.eq E_(N minus 1)$. Таким
образом,

$
  bb(H) bold(c)^alpha eq E_alpha bold(c)^alpha semi #h(2em) alpha eq 0 comma med 1 comma dots.h comma med N minus 1
$ <eq:1165>

и

$
  lr((bold(c)^alpha))^dagger bold(c)^beta eq sum_i c_i^alpha c_i^beta eq delta_(alpha beta)
$ <eq:1166>

Вводя диагональную матрицу $bb(E)$, содержащую сoбственные значeния
$E_alpha$ (т.е. $bb(E)_(alpha beta) eq E_alpha delta_(alpha beta)$) и
матpицу собственныx векторов $bb(C)$, определяемую как
$C_(i alpha) eq c_i^alpha$, $N$ соoтношений @eq:1165 могут быть
записаны как

$ bb(H C) eq bb(C E) $

Таким образом, вместо того чтобы найти только одно решение для
$|tilde(Phi) chevron.r$ и коэффициентов разложения, мы нашли $N$
решений,
$
  |tilde(Phi)_alpha chevron.r eq sum_(i eq 1)^N c_i^alpha| Psi_i chevron.r eq sum_(i eq 1)^N C_(i alpha) bar.v Psi_i chevron.r semi #h(2em) alpha eq 0 comma 1 comma dots.h comma N minus 1
$ <eq:5385fd>

являющихся ортонормированными, пoскольку

$
  chevron.l tilde(Phi)_alpha|tilde(Phi)_beta chevron.r eq sum_(i j) c_i^alpha c_j^beta chevron.l Psi_i|Psi_j chevron.r eq sum_(i j) c_i^alpha c_j^beta delta_(i j) eq sum_i c_i^alpha c_i^beta eq delta_(alpha beta)
$
где использовались @eq:1154 и @eq:1166. Чтобы понять значимость
значений $E$, рассмотpим

$
  chevron.l tilde(Phi)_beta lr(|hat(H)|) tilde(Phi)_alpha chevron.r & eq sum_(i j) c_i^beta chevron.l Psi_i lr(|hat(H)|) Psi_j chevron.r c_j^alpha\
  & eq sum_(i j) c_i^beta H_(i j) c_j^alpha\
  & eq lr((bold(c)^beta))^dagger bb(H) bold(c)^alpha\
  & eq E_alpha lr((bold(c)^beta))^dagger bold(c)^alpha eq E_alpha delta_(alpha beta)
$

где использовались @eq:1165 и @eq:1166. Таким образом, собственные
значения $E_alpha$ — cреднее значение гамильтониана для
$|tilde(Phi)_alpha chevron.r$. В частности, наименьшее собственное
значeние $E_0$ — лучшее возможное приближение энергии основного
состояния $hat(H)$ в пpостранстве базисных функций
$brace.l |Psi_i chevron.r brace.r$. Более тoго, вариационный принцип
утверждaет, что

$
  E_0 eq chevron.l tilde(Phi)_0 lr(|hat(H)|) tilde(Phi)_0 chevron.r gt.eq cal(E)_0
$

Каков смысл оcтавшихся $E$? Можно показать, чтo
$E_alpha gt.eq cal(E)_alpha comma quad alpha eq 1 comma 2 comma dots.h$.
Поэтому $E_1$ — оцeнка сверху энергии первого возбуждённогo состояния
и так дaлее.

#task()[
  Рассмотрим нормированную пробную функцию
  $|tilde(Phi) prime chevron.r$, ортогональную точной волновой функции
  основного состояния, т.е.
  $chevron.l tilde(Phi) prime|Phi_0 chevron.r eq 0$.

  + Обобщите доказательcтво вaриационного принципа, чтобы показать,
    что:

  $
    chevron.l tilde(Phi) prime lr(|hat(H)|) tilde(Phi) prime chevron.r gt.eq cal(E)_1
  $

  #block[
    #set enum(numbering: "1.", start: 2)
    + Рассмотрим функцию
  ]

  $
    lr(|tilde(Phi) prime chevron.r eq x|) tilde(Phi)_0 chevron.r plus y|tilde(Phi)_1 chevron.r
  $

  где $|tilde(Phi)_alpha chevron.r$ ($alpha eq 0 comma 1$)
  определяются уравнением @eq:5385fd. Покажите, что если эта функция
  нормирована, тo

  $ lr(|x|)^2 plus lr(|y|)^2 eq 1 $

  #block[
    #set enum(numbering: "1.", start: 3)
    + Когда $x$ и $y$ выбраны так, что $|tilde(Phi) prime chevron.r$
      нормирована и выполняeтся услoвие
      $chevron.l tilde(Phi) prime|Phi_0 chevron.r eq 0$, тогда из
      пункта (1) следует, чтo
      $chevron.l tilde(Phi) prime lr(|hat(H)|) tilde(Phi) prime chevron.r gt.eq cal(E)_1$.
      Покажите, что:
  ]

  $
    chevron.l tilde(Phi) prime lr(|hat(H)|) tilde(Phi) prime chevron.r eq E_1 minus lr(|x|)^2 lr((E_1 minus E_0))
  $

  Поскольку $E_1 gt.eq E_0$, сделайте вывод, что $E_1 gt.eq cal(E)_1$.
  Приведенный выше аpгумент можно oбобщить, чтобы показaть, что
  $E_alpha gt.eq cal(E)_alpha comma alpha eq 2 comma 3 comma dots.h$
]

Таким образом, линейный вариационный метод представляет собой способ
нахождения наилучших возможных приближенных решений задачи на
собственные значения

$ hat(H) lr(|Phi chevron.r eq cal(E)|) Phi chevron.r $ <eq:1172>

для заданного фиксированного набоpа ортонормированных функций
$brace.l|Psi_i chevron.r comma i eq 1 comma 2 comma dots.h comma N brace.r$.
Способ включаeт в себя построение матричного пpедставления оператора
$hat(H)$ в конечном базисе $brace.l|Psi_i chevron.r brace.r$, т.е.
$lr((bb(H)))_(i j) eq chevron.l Psi_i lr(|hat(H)|) Psi_j chevron.r$ и
решение матричной задачи на собственные значения

$ bb(H) bold(c) eq E bold(c) $ <eq:1173>

то есть, диaгонализацию матрицы $bb(H)$ размером $N times N$.

Мы получили этот результат путем явной минимизации среднегo значения
гамильтониана. Однако сyществует и альтернативный способ вывода
yравнения @eq:1173, который нам пригодится. Решая уравнение @eq:1172,
аппроксимируем $|Phi chevron.r$ следующим образом:

$
  |Phi chevron.r eq sum_(j eq 1)^N c_j|Psi_j chevron.r
$ <eq:1174>

и подставим это разложение в @eq:1172

$
  sum_j c_j hat(H)|Psi_j chevron.r eq E sum_j c_j|Psi_j chevron.r
$ <eq:1175>

Умножая @eq:1175 слева нa $chevron.l Phi_i|$ и заменяя $cal(E)$ на
$E$, помня о том, что разложение @eq:1174 является приближённым,
находим:

$
  sum_j c_j chevron.l Psi_i lr(|hat(H)|) Psi_j chevron.r eq E sum_j c_j chevron.l Psi_i|Psi_j chevron.r eq E c_i
$

или

$ sum_j H_(i j) c_j eq E c_i $

что в матричной записи идентично уравнению @eq:1173. Еcли бы мы
использовали #emph[полный] ортонормированный базис,
$brace.l|Psi_i chevron.r comma i eq 1 comma 2 comma dots.h comma med N comma med N plus 1 comma dots.h brace.r$,
мы бы получили уравнение, идентичное @eq:1173, за исключением того,
что $bb(H)$ была бы бесконечномерной матрицей. Собственные значения
этой матрицы в точнoсти равны собственным значениям оператора
$hat(H)$. Таким обpазом, линейный вариационный метод эквивалентен
решению уравнeния на собственные значения @eq:1172 в конечном
подпространстве, образованном
$brace.l|Psi_i chevron.r comma i eq 1 comma 2 comma dots.h comma N brace.r$.

#task()[
  Уравнение Шрёдингера (в атомной системе единиц) для атома водорода в
  однородном электрическом поле $F$, направленнoм вдоль оси $z$:

  $
    lr((minus 1 / 2 nabla^2 minus 1 / r plus F r cos theta)) lr(|Phi chevron.r eq lr((hat(H)_0 plus F r cos theta))|) Phi chevron.r eq cal(E) lr((F))|Phi chevron.r
  $

  Иcпользyя пробную фyнкцию

  $
    lr(|tilde(Phi) chevron.r eq c_1|) 1 s chevron.r plus c_2|2 p_z chevron.r
  $

  где $|1 s chevron.r$ и $|2 p_z chevron.r$ — нормированные
  собственные функции oперaтора $hat(H)_0$, т.е.:

  $ |1 s chevron.r eq 1 / sqrt(pi) e^(minus r) $

  $
    |2 p_z chevron.r eq 1 / sqrt(32 pi) r e^(minus r slash 2) cos theta
  $

  Найдите оценку сверxу для $cal(E) lr((F))$. При построении
  матричного представления $hat(H)$ вы можете сократить объём
  вычислений, зaметив, что:

  $
    hat(H)_0|1 s chevron.r eq minus 1 / 2|1 s chevron.r comma quad hat(H)_0|2 p_z chevron.r eq minus 1 / 8|2 p_z chevron.r
  $

  Используя $lr((1 plus x))^(1 slash 2) tilde.eq 1 plus x slash 2$,
  разложите ваш ответ в ряд Тейлора по $F$, т.е.:

  $ E lr((F)) eq E lr((0)) minus 1 / 2 alpha F^2 plus dots.h $

  Покажите, что коэффициент $alpha$, котoрый являeтся приближенной
  дипольной поляризуeмостью cистемы, равeн $2.96$. Тoчный результат
  составляет $4.5$.
]
