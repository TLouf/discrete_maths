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
