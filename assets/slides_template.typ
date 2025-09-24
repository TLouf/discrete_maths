#import "@preview/touying:0.6.1": *
#import themes.simple: simple-theme
#import "base_template.typ": *

#let slides(doc) = {
  set math.equation(numbering: none)

  show: base(doc)
}
