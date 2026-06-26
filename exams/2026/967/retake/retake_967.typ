#import "../../../../assets/exam_template.typ": *

#show: doc => exam(
  [Discrete Mathematics],
  [Bachelor in Data Science and Engineering],
  datetime(year: 2026, month: 6, day: 23),
  is_final: true,
  checksum: false,
  doc,
)

_You must show your derivations, with properly-justified steps, in order to be awarded points. Counting results can be given in terms of factorials, powers and binomial coefficients. You have a maximum of two hours and a half to hand in your exam._

=

Let $V={v_1,v_2, dots, v_n}$ be a fixed vertex set, with $n >= 3$.
Let $cal(G)_V$ be the set of all simple undirected graphs with vertex set $V$.

For $G, H in cal(G)_V$, we define the following relation:
$
  G prec.curly.eq H <=> E_G subset.eq E_H
$
where $E_G$ and $E_H$ are the edge sets of $G$ and $H$, respectively.

#q(10)[
  Show that $prec.curly.eq$ is a partial order on $cal(G)_V$.
]

#q(5)[
  For general values of $n$, identify the minimal and maximal elements of this poset, and its maximum and minimum, if they exist.
]

#q(10)[
  Take $n=3$. Draw the Hasse diagram of $(cal(G)_V, prec.curly.eq)$.
]

=

Let's consider a weighted graph $G$ defined by the following adjacency matrix:
$
  A_G = mat(
    0, 3, 2, 0, 0, 0;
    3, 0, 2, 5, 1, 0;
    2, 2, 0, 0, 3, 6;
    0, 5, 0, 0, 0, 4;
    0, 1, 3, 0, 0, 0;
    0, 0, 6, 4, 0, 0;
  ).
$
#q(15)[
  Determine the shortest paths between $v_1$ and every other vertex of $G$, where $v_1$ is the vertex corresponding to the first row/column of $A_G$.
  Show how you work through Dijkstra's algorithm with a table, preferably, and give the path lengths.
]

#q(5)[
  What kind of graph $H$ do you form if you take the union of all the shortest paths you computed above?
]

#q(10)[
  Dijkstra's algorithm usually breaks ties arbitrarily when several vertices have the same tentative distance.
  If you run the algorithm twice but choose a different vertex when presented with a tie, does this change the distance to every vertex?
  Can the graph $H$ as described above differ?
  Explain for the general case, without rerunning the algorithm.
]

=

Suppose you want want to make a custom bracelet, using beads which are either: red and 1 millimeter long, yellow and 2 millimeter long, or purple and 1 millimeter long.
Let $b_n$ be the number of $n$-millimeter-long bracelets you can form.

#q(5)[
  Compute $b_1$, $b_2$ and $b_3$.
]

#q(10)[
  Using counting arguments, prove that
  $
    forall n>=3, b_n = 2 b_(n-1) + b_(n-2)
  $
]

#q(10)[
  Solve this recurrence to obtain a closed-form expression for $b_n$.
]

=

#q(10)[
  Prove by induction that $6 divides (7^n − 1)$ for all $n >= 1$.
]

#q(10)[
  Determine in two different ways the remainder of $7^100$ when divided by $6$.
  One of them should use directly the result from (a).
]


// Consideremos el conjunto X = {0, 1, 2, 3, 4, 5, 6, 9} (omitiendo el 7 y
// el 8). ¿Cuántas cadenas, formadas con las cifras de X , de longitud n hay cuya
// suma de cifras sea congruente con 1 (mód 3)?
