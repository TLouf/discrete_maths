#import "assets/base_template.typ": *

#show: base

#show heading.where(level: 1): h => {
  pagebreak(to: "odd", weak: true)
  h.body
}
// To hide solutions and proofs:
#set-result("noanswer")

// arrange in 11 chapters taught over 13 weeks (two weeks of revision+partial)
// https://aplicaciones.uc3m.es/cpa/generaFicha?est=350&plan=566&asig=16489&&anio=2025&idioma=2
// https://aplicaciones.uc3m.es/cpa/generaFicha?est=506&plan=555&asig=20191&anio=2025&idioma=2
// discrete maths: study discrete objects, so objects which are distinct and not connected. Also means they are countable. Why? Computers deal with discrete information. Even real numbers, which are theoretically continuous, are represented discretely on computers: i.e. there is a finite number of possible real numbers

// syllabus:
// set theory (Rosen 2.)
// relations (Rosen 9.) -> boolean ops
// order as particular case of relation (Rosen 9.) -> induction (Rosen 3.), sorting
// number theory (Rosen 4.) -> crypto, RNG
// counting (Rosen 6.) -> proba (Rosen 7.) (perspective only?)
// recurrence? Rosen 5.3
// advanced counting (Rosen 8.)
// partial exam
// graph theory: application of everything


// AI BSc have logic course but DS BSc don't!

// TODO: join end of sets with rels?
#include "1-sets.typ"
#include "2-rels.typ"
#include "3-ints.typ"
#include "4-counting.typ"
#include "5-seqs.typ"
#include "6-graphs.typ"
