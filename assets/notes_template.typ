#import "base_template.typ": *

#let slidebreak() = {}
#let pause = {}

#let notes(doc) = {
  show: base

  set document(author: "Thomas Louf", title: "Discrete Mathematics @ UC3M - Lecture notes")
  show heading.where(level: 1): h => {
    pagebreak(to: "odd", weak: true)
    h
  }
  set page(
    paper: "a4",
    margin: 2cm,
    footer: context [
      #set text(gray)
      Discrete Mathematics @ UC3M - Lecture notes
      #h(1fr)
      #counter(page).display("1")
    ],
  )
  set text(size: 12pt)
  set par(justify: true)

  doc
}
