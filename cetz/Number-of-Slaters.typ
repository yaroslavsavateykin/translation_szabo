#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot

#set page(width: auto, height: auto, margin: 1cm)
#set text(font: "New Computer Modern", size: 11pt)

#let Number-of-Slaters()={

cetz.canvas({
  import cetz.draw: *

  // Стиль осей, стрелок и меток
  let axis-stroke = (thickness: 1.2pt, paint: black)
  let arrow-stroke = (thickness: 1.5pt, paint: black)
  let tick-stroke = (thickness: 1pt, paint: black)
  let mark-style = (end: ">", scale: 0.8)

  // ==========================================
  // 1. ОСИ КООРДИНАТ И ЗАСЕЧКИ
  // ==========================================
  
  // Ось Y и ось X
  line((x: 2, y: 1), (x: 2, y: 11), stroke: axis-stroke)
  line((x: 2, y: 1), (x: 13, y: 1), stroke: axis-stroke)

  // Засечки на оси Y (координаты 10, 20, 30, 40, 50)
  let y-positions = (3, 5, 7, 9, 11)
  let y-labels = ("10", "20", "30", "40", "50")
  for (i, y) in y-positions.enumerate() {
    line((x: 1.8, y: y), (x: 2, y: y), stroke: tick-stroke)
    content((x: 1.6, y: y), text(y-labels.at(i)), anchor: "east")
  }

  // Засечки на оси X (координаты 1, 10, 100, 1000, 10000)
  let x-positions = (4, 6, 8, 10, 12)
  let x-labels = ("1", "10", "100", "1000", "10000")
  for (i, x) in x-positions.enumerate() {
    line((x: x, y: 1), (x: x, y: 1.2), stroke: tick-stroke)
    content((x: x, y: 0.6), text(x-labels.at(i)), anchor: "north")
  }

  // ==========================================
  // 2. НАЗВАНИЯ ОСЕЙ
  // ==========================================
  
  // Название оси X (снизу по центру)
  content((x: 7.5, y: -0.2), [Число детерминантов Слейтера $binom(2K, N)$], anchor: "north")

  // Название оси Y (вертикальное, слева)
  content((x: -0.5, y: 6), rotate(90deg)[Число пространственных базисных функций $K$], anchor: "center")

  // ==========================================
  // 3. СТРЕЛКИ И ТЕКСТ НА ГРАФИКЕ
  // ==========================================
  
  // Стрелка "Предел Хартри-Фока"
  line((x: 4, y: 6), (x: 4, y: 11), stroke: arrow-stroke, mark: mark-style)
  content((x: 4, y: 11.3), align(center)[Предел\ Хартри—Фока], anchor: "south")

  // Стрелка "Полное КВ"
  line((x: 6, y: 6.5), (x: 12, y: 6.5), stroke: arrow-stroke, mark: mark-style)
  content((x: 12.2, y: 6.5), [Полное КВ], anchor: "west")

  // Стрелка "Точный результат"
  line((x: 6, y: 8.0), (x: 10.5, y: 11.2), stroke: arrow-stroke, mark: mark-style)
  content((x: 10.5, y: 11.4), [Точный результат], anchor: "south")
})
}