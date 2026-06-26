#import "base_template.typ": *
#import "@preview/subpar:0.2.2"

#let exercises(doc) = {
  show: base

  set page(
    margin: 1.5cm,
  )
  set par(justify: true)
  set text(size: 11pt)

  set enum(full: true, numbering: (..nums) => {
    let level = nums.pos().len() - 1
    if level == 0 {
      text(weight: "bold")[#context { counter(heading).display() }.#numbering("1", ..nums)]
    } else {
      numbering("(i)", nums.pos().last())
    }
  })

  show: el.config.ref.with(supplement: "Question")

  show heading.where(level: 1): h => {
    pagebreak(weak: true)
    h
  }
  set heading(numbering: "1")

  doc
}
