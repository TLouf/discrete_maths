#import "@preview/touying:0.6.1": *
#import themes.simple: simple-theme
#import "base_template.typ": *

// // Issues:
// // - pause in enum inside a theorion env like definition doesn't work
#let slidebreak() = { pagebreak() }
#let slides(handout: false, doc) = {
  show: base

  set heading(numbering: "1.1")
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: raw)).update(0)
    align(center)[#it]
  }

  show heading.where(level: 3): it => {
    v(-0.5em)
    it
  }
  set math.equation(numbering: none)

  show: simple-theme.with(
    aspect-ratio: "16-9",
    config-common(
      slide-level: 3,
      frozen-counters: (theorem-counter,),
      handout: handout,
    ),
    header: utils.display-current-heading(level: 2, setting: utils.fit-to-width.with(grow: false, 100%)),
    header-right: context utils.slide-counter.display(),
    footer-right: [],
    subslide-preamble: [], //block(
    // below: 1.3em,
    // text(1.1em, weight: "bold", utils.display-current-heading(level: 2)),
    // ),
  )
  doc
}
