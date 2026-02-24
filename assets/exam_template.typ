#import "base_template.typ": *

#let all-points = state("all-points", ())

#let q(pts, body) = enum.item([
  #grid(
    columns: (1fr, auto),
    align: horizon,
    column-gutter: 1em,
    body, [* / #pts*],
  )
  #all-points.update(old => { old + (pts,) })
])

#let exam(course, programme, date, is_final: true, checksum: false, doc) = {
  show: base

  set page(
    paper: "a4",
    margin: (x: 10mm, bottom: 12mm, top: 18mm),
  )
  set text(size: 12pt)
  set par(justify: true)

  set math.equation(numbering: none)
  set enum(numbering: "(a)")

  show heading.where(level: 1): it => [
    #set text(14pt)
    #v(.5em)
    Exercise #counter(heading).display(it.numbering)
    #it.body
    #all-points.update(old => { old + (0,) })
  ]

  v(-40pt)
  figure(image("uc3m_Denom_Matematicas.svg", height: 64pt))
  text(13pt)[
    #align(center)[
      *#smallcaps[#programme] #h(1fr) #course*
    ]

    #align(right)[
      #if is_final [Final] else [Partial]
      exam -- #date.display("[month repr:long] [day], [year]")
    ]
    #context {
      let nr_exercises = counter(heading).final().at(0)
      let exercise_cells = (
        for ex_nr in range(nr_exercises) {
          (
            [
              Exercise #(ex_nr + 1)
              #h(1fr) / #all-points.at(<end>).split(0).at(ex_nr + 1).sum(default: 0)
            ],
          )
        }
      )
      exercise_cells.push([
        Grade #h(1fr) / #all-points.at(<end>).sum()
      ])
      figure(
        table(
          align: bottom + left,
          columns: nr_exercises + 1,
          stroke: 1pt,
          inset: (top: 20pt),
          ..exercise_cells
        ),
      )
    }

    #v(.5em)
    Name: #underline(stroke: black, evade: false)[#text(white, lorem(10))]
    #v(.5em)
  ]
  doc

  hide[. <end>]

  if checksum {
    assert(all-points.at(<end>).sum() == 100, message: "Points don't sum to 100!")
  }
}
