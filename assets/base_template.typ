#import "@preview/pinit:0.2.2": *
#import "@preview/pavemat:0.2.0": pavemat
#import "@preview/fontawesome:0.5.0": *
#import "@preview/codly:1.3.0": *
#import "@preview/lovelace:0.3.0": *
#import "@preview/equate:0.3.2": equate
#import "@preview/quick-maths:0.2.1": shorthands
#import "@preview/cetz:0.4.1"
#import "@preview/lilaq:0.5.0" as lq
#import "@preview/itemize:0.2.0" as el
#import "@preview/booktabs:0.0.3": *

#import "@preview/theorion:0.4.1": *
#import "@preview/thmbox:0.3.0": proof
#import cosmos.rainbow: *

// Issues:
// - pause in enum inside a theorion env like definition doesn't work

#let transp = white.transparentize(100%)

#let implies() = box(rotate(fa-reply(solid: true), 180deg))

#let mhide(fill: transp, it) = {
  set text(fill: fill)
  it
}
#let rank = math.op("rank")
#let Col = math.op("Col")
#let Span = math.op("Span")
#let proj = math.op("proj")
#let sign = math.op("sign")
#let rel = math.op($"" R ""$)
#let argmin = math.op("argmin", limits: true)
#let argmax = math.op("argmax", limits: true)
#let rmat = math.mat.with(align: right)
#let mathc(x, color) = text(fill: color)[$#x$]

#let important = important-box
#let notation = remark.with(title: "Notation", icon-name: "pencil")
#let home = tip-box.with(title: "Try at home", icon-name: "home")

#let question-box = note-box.with(
  fill: rgb("#BA0865"),
  title: "Question",
  icon-name: "question",
)

#let (properties-counter, properties-box, properties, show-properties) = make-frame(
  "properties",
  (en: (us: "Properties", gb: "Properties")),
  counter: theorem-counter,
  render: render-fn.with(fill: eastern.darken(10%)),
)

#let iif-list-markers = level => {
  if level == 1 {
    (
      ellipse(inset: 0pt, stroke: none, fill: white.darken(20%).transparentize(50%))[
        #set align(center + horizon)
        $=>$
      ],
      ellipse(inset: 0pt, stroke: none, fill: white.darken(20%).transparentize(50%))[
        #set align(center + horizon)
        $=<$
      ],
    )
  } else {
    [#sym.bullet]
  }
}
#let iif-proof-list = list.with(marker: iif-list-markers)

#let algorithm = figure.with(
  kind: "algorithm",
  supplement: [Algorithm],
)
#let comment(body, gap_to_right: 1fr, fill: white.darken(40%), size: 0.8em) = {
  h(gap_to_right)
  text(fill: fill, size: size, sym.triangle.stroked.r + sym.space + body)
}

#let base(doc) = {
  show link: set text(blue)

  set heading(numbering: "1.1")
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: raw)).update(0)
    it
  }

  show math.cases: math.display
  set math.equation(numbering: none)

  set figure(numbering: (..num) => numbering("1.1", counter(heading).get().first(), num.pos().first()))
  set enum(numbering: "(i)")

  set page(paper: "a4", margin: 1in)
  set text(size: 12pt)
  set par(justify: true)

  show: equate.with(breakable: true, sub-numbering: false)
  show: shorthands.with(
    ($+-$, $plus.minus$),
    ($|-$, math.tack),
    ($=<$, math.arrow.l.double),
  )

  show ref: el.ref-enum
  show: el.default-enum-list

  set table(stroke: none)

  show: show-theorion
  set-inherited-levels(1)
  set-zero-fill(true)
  set-leading-zero(true)
  set-theorion-numbering("1.1")
  show: show-properties
  show math.prec.eq: math.scripts(math.prec.eq)

  show: lq.set-diagram(
    xaxis: (position: bottom, subticks: none),
    yaxis: (position: left, subticks: none),
  )

  show "python": [#fa-python() Python]
  show " iff": [if and only if]

  doc
}
