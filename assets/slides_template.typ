#import "@preview/touying:0.6.1": *
#import themes.simple: simple-theme
#import "base_template.typ": *

// // Issues:
// // - pause in enum inside a theorion env like definition doesn't work
#let slidebreak(weak: true) = { pagebreak(weak: weak) }

#let theorion-render-fn = render-fn
#let render-fn(
  fill: red,
  prefix: none,
  title: "",
  full-title: auto,
  slide-break: true,
  ..args,
) = {
  if slide-break { slidebreak() }
  theorion-render-fn(fill: fill, prefix: prefix, title: title, full-title: full-title, ..args)
}
#let (theorem-counter, theorem-box, theorem, show-theorem) = make-frame(
  "theorem",
  theorion-i18n-map.at("theorem"),
  inherited-levels: 2,
  render: render-fn.with(fill: red.darken(20%)),
)
#let (lemma-counter, lemma-box, lemma, show-lemma) = make-frame(
  "lemma",
  theorion-i18n-map.at("lemma"),
  counter: theorem-counter,
  render: render-fn.with(fill: teal.darken(10%)),
)
#let (definition-counter, definition-box, definition, show-definition) = make-frame(
  "definition",
  theorion-i18n-map.at("definition"),
  counter: theorem-counter,
  render: render-fn.with(fill: orange),
)
#let (proposition-counter, proposition-box, proposition, show-proposition) = make-frame(
  "proposition",
  theorion-i18n-map.at("proposition"),
  counter: theorem-counter,
  render: render-fn.with(fill: blue.darken(10%)),
)
#let (property-counter, property-box, property, show-property) = make-frame(
  "property",
  theorion-i18n-map.at("property"),
  counter: theorem-counter,
  render: render-fn.with(fill: eastern.darken(10%)),
)

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

  show heading.where(level: 2): it => {
    slidebreak()
    align(center + horizon)[#it]
    slidebreak()
  }

  show heading.where(level: 3): it => {
    slidebreak()
    it
  }
  set math.equation(numbering: none)

  show: simple-theme.with(
    aspect-ratio: "16-9",
    config-common(
      slide-level: 1,
      frozen-counters: (theorem-counter,),
      handout: handout,
    ),
    header: utils.display-current-heading(
      level: 2,
      setting: utils.fit-to-width.with(grow: false, 100%),
    ),
    header-right: context utils.slide-counter.display(),
    footer-right: [],
    subslide-preamble: [], //block(
    // below: 1.3em,
    // text(1.1em, weight: "bold", utils.display-current-heading(level: 2)),
    // ),
  )
  doc
}
