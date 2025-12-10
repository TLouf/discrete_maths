#import "base_template.typ": *

#let notes(doc) = {
  show: base

  show heading.where(level: 1): h => {
    pagebreak(to: "odd", weak: true)
    h
  }
  set page(paper: "a4", margin: 2cm)
  set text(size: 12pt)
  set par(justify: true)

  doc
}
