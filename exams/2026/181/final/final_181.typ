#import "../../../../assets/exam_template.typ": *

#show: doc => exam(
  [Discrete Mathematics],
  [Bachelor in Artificial Intelligence],
  datetime(year: 2026, month: 5, day: 21),
  is_final: true,
  checksum: false,
  doc,
)

_You must show your derivations, with properly-justified steps, in order to be awarded points. You have a maximum of two hours and a half to hand in your exam._


=


Let $k in NN^*$, and $G_(k+1)$ be a complete graph with $k+1$ vertices.
Suppose we build a sequence $(G_n)_(n >= k+1)$ of undirected simple graphs, starting from $G_(k+1)$, and where $G_(n+1)$ is obtained from $G_n$ by adding one new vertex connected to $k$ distinct existing vertices.

#q(10)[
  How many edges does $G_(k+1)$ have?
  Provide two distinct proofs for your answer, one based on a counting argument, and the other on a result from graph theory.
]

#q(10)[
  Prove by induction that the number of edges of $G_n$ is
  $
    abs(E_n) = (k (k+1)) / 2 + k dot (n-k-1)
  $
]

#q(5)[
  For which values of $n$ is $G_n$ regular?
]

=

We define the algorithm `algo` as:
#algorithm(
  pseudocode-list(booktabs: true)[
    + *procedure* `algo`($G=(V, E, omega)$ connected, undirected, with $V={v_1, dots, v_n}$)
      + *for* all $v in cal(N) (v_1)$
        + $d(v_1, v) = omega(v_1, v)$
        + $"pred"(v) = v_1$
      + *for* all $v in V without cal(N) (v_1)$
        + $d(v_1, v) = oo$
      + $T = (V_T, E_T)$ with $V_T = {v_1}, E_T = emptyset$
      + *while* $abs(V_T) != abs(V)$
        + $u = display(argmin_(v in V without V_T)) d(v_1, v)$
        + $V_T = V_T union {u}, E_T = E_T union {{"pred"(u), u}}$
        + *for* all $v in cal(N)(u) without V_T$
          + *if* $d(v_1, u) + omega(u, v) < d(v_1, v)$ *then*
            + $d(v_1, v) = d(v_1, u) + omega(u, v)$
            + $"pred"(v) = u$
      + *return* $T$
  ],
)

#q(5)[
  Explain in a few words why the output of this algorithm is a spanning tree of its input $G$.
]

#q(10)[
  Apply this algorithm, writing each step explicitly, to the graph $G$ defined by the adjacency matrix $A_G$, and defining $v_1$ as the vertex corresponding to the first column/row of this matrix:
  $
    A_G = mat(
      0, 3, 2, 0, 0, 0;
      3, 0, 2, 5, 1, 0;
      2, 2, 0, 0, 3, 5;
      0, 5, 0, 0, 0, 4;
      0, 1, 3, 0, 0, 0;
      0, 0, 5, 4, 0, 0;
    ).
  $
]

#q(10)[
  Does this algorithm find a minimum spanning tree of $G$?
  Answer by first comparing its output in the example above to the one of Prim's or Kruskal's, and then giving a short explanation as to why it is or isn't necessarily able to find a minimum spanning tree, in general.
]



=

Let $A$ be a set with cardinality $n$.

#q(15)[
  How many relations on $A$ are both reflexive and symmetric?
  How many are both reflexive and antisymmetric?
]

#q(10)[
  How many relations on $A$ are neither reflexive nor symmetric?
]


=

We define a sequence $(S_n)_(n in NN)$ as:
$
  forall n in NN, S_n = (sum_(i=1)^6 i^n) mod 7.
$

#q(5)[
  Compute $S_1$ and $S_2$.
]

#q(5)[
  Use Fermat's little theorem to compute $S_k$ for $k in NN$ such that $6 divides k$.
]

#q(10)[
  Let $a in ZZ_6 without {0}$.
  Prove that
  $
    forall i,j in ZZ_6, a i equiv a j space (mod 7) <=> i = j,
  $
  and use this to show that $a^k S_k equiv S_k (mod 7)$.
]

#q(5)[
  Let us now consider $k in NN^*$ such that $6 divides.not k$.\
  Using the fact that you can choose the $a$ from above so that $a^k equiv.not 1 (mod 7)$, give the value of $S_k$.
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
