#import "@preview/cetz:0.5.2"

// Объявляем функцию, которую можно импортировать
#let H2-ground-state() = {
  cetz.canvas({
    import cetz.draw: *

    let level-stroke = (thickness: 1.5pt, paint: black)
    let arrow-stroke = (thickness: 2pt, paint: black)
    let mark-style = (end: ">", scale: 0.6)

    // БЛОК 1
    content((x: 0.8, y: 9.5), text(size: 16pt)[$|Psi_0 chevron.r = $], anchor: "east")
    line((x: 3, y: 8.6), (x: 5, y: 8.6), stroke: level-stroke)
    content((x: 2.2, y: 8.6), text(size: 16pt)[$chi_1$], anchor: "east")
    line((x: 3, y: 10.6), (x: 5, y: 10.6), stroke: level-stroke)
    content((x: 2.2, y: 10.6), text(size: 16pt)[$chi_3$], anchor: "east")
    content((x: 4, y: 8.1), text(size: 66pt, baseline: -2pt)[\*])
    line((x: 7, y: 8.6), (x: 9, y: 8.6), stroke: level-stroke)
    content((x: 10.4, y: 8.6), text(size: 16pt)[$chi_2$], anchor: "east")
    line((x: 7, y: 10.6), (x: 9, y: 10.6), stroke: level-stroke)
    content((x: 10.4, y: 10.6), text(size: 16pt)[$chi_4$], anchor: "east")
    content((x: 8, y: 8.1), text(size: 66pt, baseline: -2pt)[\*])

    // БЛОК 2
    content((x: 0.8, y: 5.65), text(size: 16pt)[$equiv$], anchor: "east")
    line((x: 3, y: 4.8), (x: 5, y: 4.8), stroke: level-stroke)
    content((x: 2.2, y: 5), text(size: 16pt)[$chi_1$], anchor: "east")
    line((x: 3, y: 6.6), (x: 5, y: 6.6), stroke: level-stroke)
    content((x: 2.2, y: 6.6), text(size: 16pt)[$chi_3$], anchor: "east")
    line((x: 4, y: 4), (x: 4, y: 5.9), stroke: arrow-stroke, mark: mark-style)
    line((x: 7, y: 4.8), (x: 9, y: 4.8), stroke: level-stroke)
    content((x: 9.8, y: 4.8), text(size: 16pt)[$chi_2$], anchor: "west")
    line((x: 7, y: 6.6), (x: 9, y: 6.6), stroke: level-stroke)
    content((x: 9.8, y: 6.6), text(size: 16pt)[$chi_4$], anchor: "west")
    line((x: 8, y: 5.9), (x: 8, y: 4), stroke: arrow-stroke, mark: mark-style)

    // БЛОК 3
    content((x: 0.8, y: 1.75), text(size: 16pt)[$equiv$], anchor: "east")
    line((x: 4.4, y: 1), (x: 7.6, y: 1), stroke: level-stroke)
    content((x: 8.4, y: 1), text(size: 16pt)[$psi_1$], anchor: "west")
    line((x: 4.4, y: 2.8), (x: 7.6, y: 2.8), stroke: level-stroke)
    content((x: 8.4, y: 2.8), text(size: 16pt)[$psi_2$], anchor: "west")
    line((x: 5.2, y: 0), (x: 5.2, y: 2), stroke: arrow-stroke, mark: mark-style)
    line((x: 6.8, y: 2), (x: 6.8, y: 0), stroke: arrow-stroke, mark: mark-style)
    
  })
}
