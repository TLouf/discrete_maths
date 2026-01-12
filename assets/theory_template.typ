#let format = {
  let valid-values = ("slides", "notes")
  let value = sys.inputs.at("format", default: "notes")
  assert(value in valid-values)
  value
}
// #let format = "slides"

#let format-file = {
  if format == "slides" {
    "slides_template.typ"
  } else if format == "notes" {
    "notes_template.typ"
  } else {
    "base_template.typ"
  }
}
#import format-file: *

#let solutions = {
  let valid-values = ("true": true, "false": false)
  let value = lower(sys.inputs.at("solutions", default: "true"))
  assert(value in valid-values) //, message: "`--input solutions` must be true or false")
  valid-values.at(value)
}

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

#let theory(doc) = {
  if not solutions {
    set-result("noanswer")
  }
  if format == "slides" {
    show: slides
    doc
  } else if format == "notes" {
    show: notes
    doc
  }
}
