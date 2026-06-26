#import "../../../../assets/exam_template.typ": *

#show: doc => exam(
  [Discrete Mathematics],
  [Bachelor in Artificial Intelligence],
  datetime(year: 2026, month: 6, day: 22),
  is_final: true,
  checksum: false,
  doc,
)

_You must show your derivations, with properly-justified steps, in order to be awarded points. You have a maximum of two hours and a half to hand in your exam._


=

We consider the simple undirected graph $G = ({v_1, dots, v_6}, E)$ corresponding to the following adjacency matrix, defined according to the ordering $v_1, dots, v_6$:
$
  A_G = mat(
    0, 1, 1, 0, 0, 0;
    1, 0, 0, 1, 1, 0;
    1, 0, 0, 1, 0, 1;
    0, 1, 1, 0, 1, 0;
    0, 1, 0, 1, 0, 1;
    0, 0, 1, 0, 1, 0;
  )
$

#q(10)[
  Run the breadth-first search algorithm on $G$, starting from $v_1$.
  Show each step explicitly, draw the resulting tree, and indicate the distance from $v_1$ to every other vertex.
  When multiple candidate vertices can be explored, the one which appears first in the ordering $v_1, dots, v_6$ should be picked.
]

#q(5)[
  Suppose one additional edge is inserted between $v_1$ and $v_6$.
  Without rerunning the entire algorithm, determine which vertices have a shorter distance from $v_1$, and draw the output tree.
]

#q(10)[
  Suppose that in (a) you were asked instead to pick the candidate vertex that appears last in the ordering, when multiple choices are possible.
  Would the computed distances change?
  Would the obtained tree necessarily change?
  Explain your answers, without rerunning the algorithm.
]

=

In computer science, _hash tables_ store data by assigning keys to positions in an array via a _hash function_.
A standard choice for integer keys and a table of size $m$ is
$ h(n) = n mod m. $

In what follows we fix $m = 8$ and study the mathematical properties of the mapping $h : ZZ -> ZZ_8$,
$ h(n) = n mod 8. $

#q(10)[
  Prove that $h$ is a well-defined function, and determine whether it is injective, surjective, or both.
]

#q(10)[
  Prove that the following relation $~$ is an equivalence relation on $ZZ$:
  $ m ~ n <=> h(m) = h(n). $
]

#q(5)[
  Describe the equivalence classes of $~$. How many are there? Explicitly identify the quotient set $ZZ \/ ~$.
]

=

Let $a_n$ denote the number of binary strings of length $n$ containing at least one occurrence of two consecutive 1's.

#q(5)[
  Compute $a_1$, $a_2$, and $a_3$.
]

#q(10)[
  Using counting arguments, prove that
  $
    forall n>=3, a_n = a_(n-1) + a_(n-2) + 2^(n-2).
  $

]

#q(10)[
  Solve this recurrence to obtain a closed-form expression for $a_n$.
]

// #q(5)[
//   Let $b_n$ be the count of binary strings of length $n$ with no consecutive 1's.
//   How is $a_n$ related to $b_n$?
//   Verify the closed form for $a_n$ by using this relationship with $b_n$.
// ]


=

#q(5)[
  Consider the graph $G$ drawn below.
  What kind of graph is $G$?
  What happens if the edge ${1, 2}$ gets removed?
  How can this edge then be called?

  #figure(
    raw-render(
      ```dot
      graph {
        layout=neato
        start=11
        node[shape=circle fontsize=20 margin=0]
        1 -- {2, 3};
        2 -- {4, 5};
        4 -- {6, 7};
        3 -- {8,9,10};
        10 -- 11;
      }
      ```,
      height: 4cm,
    ),
  )

]

#q(10)[
  Let $F= (V, E)$ be a forest composed of two trees $T_1 = (V_1, E_1)$ and $T_2 = (V_2, E_2)$.
  Prove that adding to $E$ a single edge $e={v_1, v_2}$ such that $v_1 in V_1$ and $v_2 in V_2$ ensures that any pair of vertices of $F$ is connected by a unique path.
]

#q(10)[
  Let $F=(V,E)$ be a forest composed of $k >= 1$ trees $T_1, dots, T_k$.
  Prove, by induction on $k$, that if we add $k−1$ edges to $F$, one at a time, each new edge connecting two vertices that lie in different connected components of the graph as it stands at that moment, the result is a single tree on all of $V$.
]

// a) Let G be a simple graph on n vertices and m edges. Using the handshaking theorem, prove that the number of vertices of odd degree is always even. Deduce that no graph can have exactly one vertex of odd degree.
// b) Let f(n) denote the minimum number of edges a connected simple graph on n vertices can have. Conjecture the value of f(n) and prove your conjecture by induction on n. At each inductive step, identify explicitly how removing an edge affects the degree sequence, and use part (a) to rule out any parity obstruction.
// c) A connected graph G on n vertices achieves the minimum f(n) edges. Prove by induction that G has at least two vertices of degree 1, and conclude using the handshaking theorem that the sum of all degrees equals 2(n − 1). Verify this on a concrete example with n = 5.
//
//
//
//
// #q(10)[

//   Prove by induction on $m$ that if $G$ has $c$ connected components, then
//   $
//     abs(E) <= binom(n, 2) - binom(c, 2)
//   $
//   _(Hint: adding an edge either merges two components or stays within one.)_
// ]

// #q(10)[
//   Now suppose $G$ is a tree. Use strong induction on $n$ to prove that removing any edge of $G$ splits it into exactly two trees.
// ]

// #q(5)[
//   Use a counting argument to justify why the number of triangles a vertex $v$ with degree $k(v) >= 2$ can be involved in satisfies
//   $
//     t(v) <= binom(k(v), 2).
//   $
// ]
