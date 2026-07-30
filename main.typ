#import "settings.typ": book-template
#show: book-template

#include "titlepage.typ"

#counter(page).update(1)

#include "chapters/introduction.typ"
#pagebreak()

#outline(title: [Содержание])
#pagebreak()

= Словарь <словарь>

#include "chapters/glossary.typ"
#pagebreak()

= Математический обзор <математический-обзор>

== ЛИНЕЙНАЯ АЛГЕБРА

#include "chapters/linear-algebra.typ"

=== Трехмерная векторная алгебра

#include "chapters/three-dimensional-vector-algebra.typ"

=== Матрицы

#include "chapters/matrices.typ"

=== Определители

#include "chapters/determinants.typ"
#pagebreak()
// здесь еще куча всяких видимо глав от Амины и Максима

=== $N$-мерные комплексные векторные пространства
<n-мерные-комплексные-векторные-пространства>

#include "chapters/complex-vector-spaces.typ"

=== Замена базиса
<замена-базиса>

#include "chapters/change-of-basis.typ"

=== Задача на собственные значения
<задача-на-собственные-значения>

#include "chapters/eigenvalue-problem.typ"

=== Функции матриц
<функции-матриц>

#include "chapters/matrix-functions.typ"
#pagebreak()

== Ортогональные функции, собственные функции\ и операторы

#include "chapters/orthogonal-functions-eigenfunctions-and-operators.typ"
#pagebreak()

== Вариационный метод
<вариационный-метод>

#include "chapters/variational-method.typ"

=== Вариационный принцип
<вариационный-принцип>

#include "chapters/variational-principle.typ"

=== Линейный вариационный метод
<линейный-вариационный-метод>

#include "chapters/linear-variational-method.typ"
#pagebreak()

= Многоэлектронные волновые функции и операторы <sec:chapter2>

== Электронная задача
<subsec:a225f6>

#include "chapters/electronic-task.typ"

=== Атомные единицы
<атомные-единицы>

#include "chapters/atomic-units.typ"

=== Приближение Борна-Оппенгеймера
<приближение-борна-оппенгеймера>

#include "chapters/born-oppenheimer-approximation.typ"

=== Антисимметрия, или принцип Паули
<антисимметрия-или-принцип-паули>

#include "chapters/antisymmetry-or-pauli-principle.typ"
#pagebreak()

== Орбитали, определители Слейтера и базисные функции <subsec:08ac26>

=== Спин-орбитали и пространственные орбитали
<спин-орбитали-и-пространственные-орбитали>

#include "chapters/spin-and-spatial-orbitals.typ"

=== Произведения Хартри
<произведения-хартри>

#include "chapters/hartree-products.typ"

=== Определители Слейтера
<subsubsec:jfrit85>

#include "chapters/slater-determinants.typ"

=== Приближение Хартри-Фока
<приближение-хартри-фока>

#include "chapters/hartree-fock-approximation.typ"
#pagebreak()

=== Модель $H_2$ в минимальном базисе
<модель-h_2-в-минимальном-базисе>

#include "chapters/h2-model-in-minimal-basis.typ"

=== Возбуждённые детерминанты
<возбужденные-детерминанты>

#include "chapters/excited-determinants.typ"

=== Вид точной волновой функции и конфигурационное взаимодействие
<вид-точной-волновой-функции-и-конфигурационное-взаимодействие>

#include "chapters/exact-wave-function-and-configuration-interaction.typ"
#pagebreak()

== Операторы и матричные элементы <subsec:8def7f>

=== Матричные элементы в минимальном базисе $upright(H_2)$
<матричные-элементы-в-минимальном-базисе-mathrmh_2>

#include "chapters/matrix-elements-in-minimal-h2-basis.typ"

=== Обозначения для одно- и двухэлектронных интегралов
<обознaчения-для-одно--и-двухэлектронных-интегралов>

#include "chapters/one-and-two-electron-integral-notation.typ"

=== Общие правила для матричных элементов
<subsubsec:mj576>

#include "chapters/general-rules-for-matrix-elements.typ"

=== Вывод правил для матричных элементов
<вывод-правил-для-матричных-элементов>

#include "chapters/derivation-of-matrix-element-rules.typ"
#pagebreak()

=== Переход от спин-орбиталей к пространственным орбиталям
<пeреход-от-спин-орбиталей-к-прoстpанственным-орбиталям>

#include "chapters/spin-to-spatial-orbitals.typ"

=== Кулоновские и обменные интегралы
<кулоновские-и-oбменные-интегралы>

#include "chapters/coulomb-and-exchange-integrals.typ"

=== Псевдоклассическая интерпретация энергии детерминанта
<псевдоклаcсическая-интерпретация-энергии-детерминанта>

#include "chapters/pseudoclassical-determinant-energy.typ"
#pagebreak()

= Приближение Хартри-Фока <sec:chapter3>

== Уравнения Хартри-Фока
<уравнения-хартри-фока>

#include "chapters/hartree-fock-equations.typ"

=== Кулоновский и Обменный Операторы
<кулоновский-и-обменный-операторы>

#include "chapters/coulomb-and-exchange-operators.typ"

=== Оператор Фока
<оператор-фока>

#include "chapters/fock-operator.typ"
#pagebreak()

== Вывод уравнений Хартри-Фока
<subsec:f59de4>

#include "chapters/derivation-of-hartree-fock-equations.typ"

=== Функциональное варьирование
<функциональное-варьирование>

#include "chapters/functional-variation.typ"

=== Минимизация энергии одного детерминанта
<минимизация-энергии-одного-детерминaнта>

#include "chapters/single-determinant-energy-minimization.typ"

=== Канонические уравнения Хартри-Фока
<кaнонические-уравнения-хартри-фока>

#include "chapters/canonical-hartree-fock-equations.typ"
#pagebreak()

== Интерпретация решений уравнений Хартри-Фока
<интерпpетация-решений-yравнений-хaртри-фока>

#include "chapters/interpretation-of-hartree-fock-solutions.typ"

=== Орбитальные энергии и теорема Купманса
<орбитальные-энергии-и-теорeма-купманса>

#include "chapters/orbital-energies-and-koopsmans-theorem.typ"

=== Теорема Бриллюэна
<subsubsec:brillouin_theorem>

#include "chapters/brillouin-theorem.typ"

=== Гамильтониан Хартри-Фока
<гамильтoниан-хартри-фока>

#include "chapters/hartree-fock-hamiltonian.typ"
#pagebreak()

#import "macros.typ": task

== Ограниченный метод Хартри-Фока для закрытых оболочек: уравнения Рутана

=== Хартри-Фок для замкнутых оболочек: спин-орбитали
<subsubsec:rhf_closed_shell_restricted>

#include "chapters/closed-shell-hartree-fock-spin-orbitals.typ"

=== Введение базиса: уравнения Рутана
<введение-базиса-урaвнения-pутана>

#include "chapters/basis-introduction-roothaan-equations.typ"

=== Плотность заряда
<плотность-заряда>

#include "chapters/charge-density.typ"

=== Выражение для матрицы Фока
<выражениe-для-матрицы-фока>

#include "chapters/closed-shell-fock-matrix-expression.typ"
#pagebreak()

=== Ортогонализация базиса
<оpтогонализация-базиса>

#include "chapters/basis-orthogonalization.typ"

=== Метод SCF
<метод-scf>

#include "chapters/scf-method.typ"

=== Средние значения и анализ заселённостей
<средние-значения-и-анализ-заселённоcтей>

#include "chapters/expectation-values-and-population-analysis.typ"
#pagebreak()

== Многоатомные базисные наборы
<многоатомные-базисные-наборы>

#include "chapters/polyatomic-basis-sets.typ"

=== Контрактированные гауссовы функции
<контрактированные-гаyссовы-функции>

#include "chapters/contracted-gaussian-functions.typ"

=== Минимальные базисные наборы: STO-3G
<минимальные-базисные-наборы-sto-3g>

#include "chapters/minimal-basis-sets-sto-3g.typ"

=== Валентно-расщепленные базисные наборы: 4-31G
<валентно-расщепленные-базисные-наборы-4-31g>

#include "chapters/split-valence-basis-sets-4-31g.typ"

=== Поляризованные базисные наборы: 6-31G и 6-31G\*
<поляризованные-базисные-наборы-6-31g-и-6-31g>

#include "chapters/polarized-basis-sets-6-31g.typ"
#pagebreak()

== Неограниченный метод Хартри-Фока для открытых оболочек: уравнения Попла-Несбета
<неограниченный-метод-хартри-фока-для-открытых-оболочек-уравнения-попла-несбета>

#include "chapters/unrestricted-open-shell-hartree-fock.typ"

=== Хартри-Фок для открытых оболочек: неограниченные спин-орбитали
<хартри-фок-для-открытых-обoлочек-неограниченные-спин-оpбитaли>

#include "chapters/unrestricted-open-shell-spin-orbitals.typ"

=== Введение базиса: уравнения Попла-Несбета
<введение-базиса-уравнения-попла-несбета>

#include "chapters/basis-introduction-pople-nesbet-equations.typ"

=== Матрицы плотности в UHF
<матрицы-плотности-в-uhf>

#include "chapters/uhf-density-matrices.typ"

=== Выражение для матриц Фока <выражение-для-матриц-фока>

#include "chapters/unrestricted-fock-matrix-expression.typ"

=== Решение неограниченных уравнений SCF
<решение-неограниченных-уравнений-scf>

#include "chapters/unrestricted-scf-solution.typ"

=== Иллюстративные расчёты в UHF
<иллюстративные-расчёты-в-uhf>

#include "chapters/illustrative-uhf-calculations.typ"

=== Проблема диссоциации и её решение в методе UHF
<проблема-диcсоциaции-и-её-решениe-в-методе-uhf>

#include "chapters/uhf-dissociation-problem.typ"
#pagebreak()

#import "macros.typ": task

= Конфигурационное взаимодействие <sec:chapter4>

== Многоконфигурационные волновые функции и структура полной матрицы CI
<многоконфигурационные-волновые-функции-и-структура-полной-матрицы-ci>

#include "chapters/full-ci-matrix.typ"

=== Промежуточная нормировка и выражение для корреляционной энергии

#include "chapters/intermediate-normalization-and-correlation-energy.typ"
#pagebreak()

== CI с двукратными возбуждениями
<ci-с-двукратными-возбуждениями>

#include "chapters/doubly-excited-ci.typ"
#pagebreak()

== Натуральные орбитали и одночастичная приведённая матрица плотности
<натуральные-орбитали-и-одночастичная-приведённая-матрица-плотности>

#include "chapters/natural-orbitals-and-one-particle-density-matrix.typ"
#pagebreak()

== Метод многоконфигурационного самосогласованного поля (MCSCF) и обобщённый метод валентных связей (GVB)
<метод-многоконфигурационного-самосогласованного-поля-mcscf-и-обобщённый-метод-валентных-связей-gvb>

#include "chapters/mcscf-and-gvb.typ"
#pagebreak()

== Усечённый CI и проблема размерной согласованности
<subsec:section4_6>

#include "chapters/truncated-ci-and-size-consistency.typ"
#pagebreak()

#import "macros.typ": task

= Многочастичная теория возмущений <sec:45145d>

== Теория возмущений Рэлея-Шрёдингера (RS)
<subsec:section6_1>

#include "chapters/rayleigh-schrodinger-perturbation-theory.typ"
#pagebreak()

== Орбитальная теория возмущений: одночастичные возмущения
<орбитальная-теория-возмущений-одночастичные-возмущения>

#include "chapters/orbital-perturbation-theory.typ"
#pagebreak()

== Разложение энергии корреляции в ряд теории возмущений
<разложение-энергии-корреляции-в-ряд-теории-возмущений>

#include "chapters/correlation-energy-perturbation-expansion.typ"
#pagebreak()

== $N$-зависимость разложения теории возмущений RS
<n-зависимость-разложения-теории-возмущений-rs>

#include "chapters/n-dependence-of-rs-expansion.typ"
#pagebreak()
#pagebreak()

= Приложение

#include "chapters/content.typ"
