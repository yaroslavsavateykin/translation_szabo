#import "../macros.typ": task
Теперь нужно сформулировать и доказать важную теорему, называющуюся
#emph[вариационным принципом]: если дана нормированная волновая
функция $bar.v tilde(Phi) chevron.r$, удовлетворяющая граничным
условиям (чаще всего стремлению к 0 на бесконечности), то среднее
значение энергии, рассчитанное на этой функции, является оценкой
сверху для точной энергии основного состояния. То есть, если

$ chevron.l tilde(Phi) bar.v tilde(Phi) chevron.r eq 1 $

то

$ chevron.l tilde(Phi) |hat(H)| tilde(Phi) chevron.r gt.eq E_0 $

Равенство выполняется только если
$|tilde(Phi) chevron.r eq| Phi_0 chevron.r$. Доказать эту теорему
несложно. Для начала рассмотрим

$
  chevron.l tilde(Phi) bar.v tilde(Phi) chevron.r eq 1 & eq sum_(alpha beta) chevron.l tilde(Phi) |Phi_alpha chevron.r chevron.l Phi_alpha| Phi_beta chevron.r chevron.l Phi_beta |tilde(Phi) chevron.r eq sum_(alpha beta) chevron.l tilde(Phi)|Phi_alpha chevron.r delta_(alpha beta) chevron.l Phi_beta|tilde(Phi) chevron.r\
  & eq sum_alpha chevron.l tilde(Phi) |Phi_alpha chevron.r chevron.l Phi_alpha| tilde(Phi) chevron.r eq sum_alpha |chevron.l Phi_alpha| tilde(Phi) chevron.r|^2
$

где мы использовали @eq:1144, @eq:1146 и @eq:1147. Далее

$
  chevron.l tilde(Phi) |hat(H)| tilde(Phi) chevron.r eq sum_(alpha beta) chevron.l tilde(Phi) |Phi_alpha chevron.r chevron.l Phi_alpha| hat(H) |Phi_beta chevron.r chevron.l Phi_beta| tilde(Phi) chevron.r eq sum_alpha E_alpha |chevron.l Phi_alpha| tilde(Phi) chevron.r|^2
$

поскольку @eq:dc952f. Наконец, поскольку $E_alpha gt.eq E_0$ при любых
$alpha$, получаем:

$
  chevron.l tilde(Phi) |hat(H)| tilde(Phi) chevron.r gt.eq sum_alpha E_0 |chevron.l Phi_alpha|tilde(Phi) chevron.r|""^2 eq E_0 sum_alpha|chevron.l Phi_alpha |tilde(Phi) chevron.r|^2 eq E_0
$

Вариационный принцип для основного состояния показывает, что энергия
приближённой волновой функции всегда слишком высока. Таким образом,
энергия служит показателем качества волновой функции: чем ниже
энергия, тем лучше волновая функция. Это основа вариационного
принципа, в котором выбирается нормированная пробная волновая функция
$|tilde(Phi) chevron.r$, зависящая от определённых параметров, а
параметры варьируются до достижения минимума средней энергии
$chevron.l tilde(Phi) |hat(H)| tilde(Phi) chevron.r$. Это значение
служит вариационной оценкой точного значения энергии основного
состояния.

#task()[
  Уравнение Шрёдингера в атомных единицах для одномерного движения
  электрона под действием потенциала $minus delta (x)$:

  $
    (minus 1 / 2 frac(d^2, d x^2) minus delta (x)) |Phi chevron.r eq E| Phi chevron.r
  $

  Примените вариационный метод, используя данную пробную функцию:

  $|tilde(Phi) chevron.r eq N e^(minus alpha x^2)$

  чтобы показать, что $minus 1 / pi$ является оценкой сверху для
  точной энергии основного состояния (равной на самом деле
  $minus 0.5$). Вам понадобится интеграл

  $
    integral_(minus oo)^oo d x thin x^(2 m) e^(minus alpha x^2) eq frac((2 m) excl sqrt(pi), 2^(2 m) m excl alpha^(m plus 1 slash 2))
  $
]

#task()[
  Дано уравнение Шрёдингера для атома водорода в атомных единицах:

  $
    (minus 1 / 2 nabla^2 minus 1 / r) |Phi chevron.r eq E| Phi chevron.r
  $

  Примените вариационный метод, используя данную пробную функцию:

  $ bar.v tilde(Phi) chevron.r eq N e^(minus alpha r^2) $

  чтобы показать, что $minus frac(4, 3pi) eq minus 0.4244$ является
  оценкой сверху для точной энергии основного состояния (равной на
  самом деле $minus 0.5$). Вам понадобятся соотношения

  $
    nabla^2 f (r) eq r^(minus 2) frac(d, d r) (r^2 frac(d, d r)) f (r)
  $

  $
    integral_0^oo d r thin r^(2 m) e^(minus alpha r^2) eq frac((2 m) excl pi^(1 slash 2), 2^(2 m plus 1) m excl alpha^(m plus 1 slash 2))
  $

  $
    integral_0^oo d r thin r^(2 m plus 1) e^(minus alpha r^2) eq frac(m excl, 2 alpha^(m plus 1))
  $
]

#task()[
  Вариационный принцип, применённый к задачам на собственные значения
  матрицы, говорит о том, что если $bold(c)$ — нормированный
  $(bold(c)^dagger bold(c) eq 1)$ вектор-столбец, то
  $bold(c)^dagger bb(O) bold(c)$ больше либо равен наименьшему
  собственному значению $bb(O)$. Для симметричной матрицы $2 times 2$
  ($O_12 eq O_21$)

  $
    bb(O) eq mat(delim: "(", O_11, O_12; O_12, O_22) quad
  $

  рассмотрите пробный вектор

  $ bold(c) eq vec(cos theta, sin theta) $

  нормированный пpи любых знaчениях $theta$. Вычислите

  $ omega (theta) eq bold(c)^dagger bb(O) bold(c) $

  и найдите значение $theta$ (например, $theta_0$), при котором
  $omega (theta)$ достигает минимума. Покажите, что $omega (theta_0)$
  в точности рaвно нaименьшему значению $bb(O)$ (1.105). Почему
  следует ожидать такой рeзультат?
]
