#import "@preview/cetz:0.3.1"

#set page(width: auto, height: auto, margin: 1cm)

#cetz.canvas({
  import cetz.draw: *

  // Настройка стилей для линий энергетических уровней и стрелок спинов
  let level-stroke = (thickness: 1.5pt, paint: black)
  let arrow-stroke = (thickness: 2pt, paint: black)
  let mark-style = (end: ">", scale: 0.7)

  // ==========================================
  // БЛОК 1: Первый уровень (|Psi_0> =)
  // ==========================================
  
  // Левый символ равенства волновой функции
  content((-0.8, 5.0), [$|Psi_0 angle = $], anchor: "east")
  
  // Левая пара уровней (chi_1, chi_3)
  line((0.5, 4.5), (2.0, 4.5), stroke: level-stroke)
  content((0.3, 4.5), [$\chi_1$], anchor: "east")
  line((0.5, 5.5), (2.0, 5.5), stroke: level-stroke)
  content((0.3, 5.5), [$\chi_3$], anchor: "east")
  
  // Звездочка/крестик на уровне chi_1
  content((1.25, 4.5), text(size: 22pt, baseline: -2pt)[$\*$])

  // Правая пара уровней (chi_2, chi_4)
  line((3.0, 4.5), (4.5, 4.5), stroke: level-stroke)
  content((4.7, 4.5), [$\chi_2$], anchor: "west")
  line((3.0, 5.5), (4.5, 5.5), stroke: level-stroke)
  content((4.7, 5.5), [$\chi_4$], anchor: "west")
  
  // Звездочка/крестик на уровне chi_2
  content((3.75, 4.5), text(size: 22pt, baseline: -2pt)[$\*$])


  // ==========================================
  // БЛОК 2: Второй уровень (Раздельные спины)
  // ==========================================
  
  // Знак тождественности
  content((-0.8, 2.0), [$\equiv$], anchor: "east")

  // Левая пара уровней (chi_1, chi_3)
  line((0.5, 1.5), (2.0, 1.5), stroke: level-stroke)
  content((0.3, 1.5), [$\chi_1$], anchor: "east")
  line((0.5, 2.5), (2.0, 2.5), stroke: level-stroke)
  content((0.3, 2.5), [$\chi_3$], anchor: "east")
  
  // Стрелка вверх на chi_1
  line((1.25, 1.1), (1.25, 1.9), stroke: arrow-stroke, mark: mark-style)

  // Правая пара уровней (chi_2, chi_4)
  line((3.0, 1.5), (4.5, 1.5), stroke: level-stroke)
  content((4.7, 1.5), [$\chi_2$], anchor: "west")
  line((3.0, 2.5), (4.5, 2.5), stroke: level-stroke)
  content((4.7, 2.5), [$\chi_4$], anchor: "west")
  
  // Стрелка вниз на chi_2
  line((3.75, 1.9), (3.75, 1.1), stroke: arrow-stroke, mark: mark-style)


  // ==========================================
  // БЛОК 3: Третий уровень (Спаренные спины)
  // ==========================================
  
  // Знак тождественности
  content((-0.8, -1.0), [$\equiv$], anchor: "east")

  // Общие уровни (psi_1, psi_2)
  line((1.5, -1.5), (4.0, -1.5), stroke: level-stroke)
  content((4.2, -1.5), [$\psi_1$], anchor: "west")
  line((1.5, -0.5), (4.0, -0.5), stroke: level-stroke)
  content((4.2, -0.5), [$\psi_2$], anchor: "west")
  
  // Спаренные стрелки на psi_1
  line((2.5, -1.9), (2.5, -1.1), stroke: arrow-stroke, mark: mark-style)
  line((3.0, -1.1), (3.0, -1.9), stroke: arrow-stroke, mark: mark-style)
})
