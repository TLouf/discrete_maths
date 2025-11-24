#import "assets/base_template.typ": *

#show: base
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

// boolean algebra? introduce from parallel between set relations and logical operations as in Epp?

#include "1-sets.typ"
#colbreak()
#include "2-rels.typ"
#colbreak()
#include "3-ints.typ"
#colbreak()
#include "4-counting.typ"
#colbreak()
#include "5-recurrence.typ"
#colbreak()


= Graph Theory I
// TODO: rearrange chapters' content

== Undirected Graphs

1. *Undirected graphs*:
  - Basic notation and definitions.
  - Graph representation.
  - Graph isomorphism.
  - Walks in a graph.
  - Trees.
  - Planar graphs.
2. *Algorithms in graph theory*.
3. *Combinatorial problems on graphs*.

#definition[
  A *pseudograph* $G = (V, E, gamma)$ consists of a nonempty vertex set $V$, an edge set $E$, and a function $gamma : E -> {{u, v} | u, v in V}$

  - The function $gamma$ encodes the graph connectivities.
  - If $e in E$ satisfies $gamma(e) = {u, v}$ with $u != v$, we say that $u$ and $v$ are *adjacent*, and that $e$ is *incident* with $u$ and $v$.
  - If there two distinct edges $e_1, e_2 in E$ such that $gamma(e_1) = gamma(e_2) = {a, b}$, then we say that $e_1$ and $e_2$ are *multiple edges*.
  - If there exists $e in E$ such that $gamma(e) = {v, v} = {v}$, then $e$ is a *loop* incident with $v$.
  - Hereafter, if we do not say it explicitly, we will assume that $G = (V, E)$ is undirected.
]

#definition[
  A *multigraph* $G = (V, E)$ is a pseudograph in which multiple edges are allowed, but loops are not allowed. A *simple graph* $G = (V, E)$ is a pseudograph in which loops and multiple edges are not allowed.
]

#definition[
  A graph $G = (V, E)$ is *bipartite* if its vertex set $V$ can be partitioned into two disjoint subsets $V_1$ and $V_2$ such that every edge in the graph connects a vertex in $V_1$ with a vertex in $V_2$.
]

*Simple graph families:*
- The complete graph on $n$ vertices $K_n$.
- The path $P_n$ on $n$ vertices.
- The cycle $C_n$ on $n$ vertices.
- The wheel graph on $n + 1$ vertices $W_n$.
- The complete bipartite graph on $n$ and $m$ vertices $K_(n,m)$.
- The $n$-cube graphs $Q_n$ are defined as follows: each vertex represents a bit string of length $n$, and two vertices $u$ and $v$ are adjacent if and only if the corresponding bit strings differ in exactly one bit.


== Vertex degree

=== Definitions

#definition[
  The *degree* (or valence) of a vertex $v in V$ in a graph $G = (V, E)$ is the number of edges incident with it, except that a loop contributes twice to the degree of that vertex. The degree of a vertex $v$ is denoted by $d(v)$.
]

*Remark.* Given a vertex $v in V$, its degree $d(v)$ is equal to
$ d(v) = |{{v, y} in E | y != v}| + 2 times "number of loops incident with" v $

#definition[
  A vertex of degree 1 is called a *terminal* (or a *pendant vertex*). A vertex of degree 0 is called an *isolated vertex*. A graph with no edges is called *trivial*.
]

#definition[
  A *regular graph* is a graph such that all vertices have the same degree.
]

=== The Handshaking Theorem

#theorem(title: "The Handshaking Theorem")[
  In any undirected graph $G = (V, E)$, we have that
  $ sum_(v in V) d(v) = 2|E| $
]

#corollary[
  For any graph $G$, the sum of all vertex degrees is an even number.
]

#theorem[
  Any graph has an even number of vertices of odd degree.
]

#corollary[
  For any graph $G$ with an odd number of vertices, there is an odd number of vertices of even degree.
]


== Complementary Graph and Subgraphs

#definition[
  The *complementary graph* $overline(G) = (V, overline(E))$ of a simple graph $G = (V, E)$ has the same vertex set as $G$, and two vertices are adjacent in $overline(G)$ if and only if they are not adjacent in $G$.
]

#definition[
  The graph $H = (W, F)$ is a *subgraph* of $G = (V, E)$ if $W subset.eq V$ and $F subset.eq E$.
]

#definition[
  Given a graph $G = (V, E)$, a *spanning subgraph* of $G$ is any subgraph $H = (V, F)$ of $G$ (hence, $F subset.eq E$).
]

#definition[
  Let $G = (V, E)$ be a graph, and $v_1, v_2, ..., v_(|V|)$ be a fixed ordering of its vertex set $V$. The *adjacency matrix* of $G$ associated to that particular vertex ordering is the matrix of dimensions $|V| times |V|$ such that its entry $A_(i j)$ counts the number of edges joining the vertices $v_i$ and $v_j$.
]

== Isomorphism of Graphs

*Remark.* Do not confuse a graph with its graphical representation!

#definition[
  The simple graphs $G_1 = (V_1, E_1)$ and $G_2 = (V_2, E_2)$ are *isomorphic* if and only if there exist a bijective function $f : V_1 -> V_2$ with the following property: $a$ and $b$ are adjacent in $G_1$ if and only if $f(a)$ and $f(b)$ are adjacent in $G_2$. The function $f$ is called an *isomorphism*.
]

*Remark.* Given two simple graphs $G_1 = (V_1, E_1)$ and $G_2 = (V_2, E_2)$, then
1. If $|V_1| != |V_2|$, then $G_1$ and $G_2$ are not isomorphic.
2. If $|E_1| != |E_2|$, then $G_1$ and $G_2$ are not isomorphic.
3. If $S_i$ is the degree sequence of the graph $G_i$, and $S_1 != S_2$, then $G_1$ and $G_2$ are not isomorphic.
4. Other methods.

*Remark.* $G_1$ and $G_2$ are isomorphic if there exists an invertible linear map (basically a permutation of the "basis vectors") $pi : V_1 -> V_2$ such that $A_2 = P^(-1) dot A_1 dot P$. There are $|V_1|! = |V_2|!$ maps of this type!

== Walks on a graph

#definition[
  A *walk* on a graph $G = (V, E)$ is an alternating sequence of vertices and edges of the form $v_0, {v_0, v_1}, v_1, {v_1, v_2}, v_2, ..., v_(ell-1), {v_(ell-1), v_ell}, v_ell$. The length of the walk is equal to the number of edges in the walk. There is an implicit direction in every walk: $v_0$ is the initial vertex, and $v_ell$ is the final vertex.
]

#definition[
  A *trail* is a walk in which no edge occurs more than once. A closed trail is called a *circuit*. A *path* is a trail in which all of its vertices are different. A *cycle* is a closed path of positive length.
]

*Remark.* Circuit can be also used as a synonym of closed walk, or closed path (cycle).

== Number of Walks Between Two Vertices

#theorem[
  Let $G$ be a graph with adjacency matrix $A$ with respect to the ordering ${v_1, v_2, ..., v_(|V|)}$ of its vertex set. The number of distinct oriented walks of length $n >= 1$ that start at $v_i$ and end at $v_j$ is given by the entry $(i, j)$ of the matrix $A^n$.
]

#corollary[
  Let $G$ be a simple graph with adjacency matrix $A$, then
  - $A^2_(i i) = d(i)$ for every $1 <= i <= |V|$.
  - $"tr" A^2 = 2|E|$.
  - $"tr" A^3 = 6 times$ number of unoriented triangles in $G$.
]

== Connected Graphs

#definition[
  An undirected graph is *connected* if there is a path between every pair of distinct vertices of $G$. A *disconnected* graph is formed by the disjoint union of several connected subgraphs called the *connected components* of the graph.
]

*Remark.* If two vertices of a graph can be connected by a walk, then there is at least one path connecting them. These paths correspond to the walks of minimum length connecting these two vertices.

#definition[
  An *articulation point* or *cut vertex* of a graph $G$ is a vertex whose removal (together with those edges incident with it) produces a graph with more connected components than in $G$. A *cut edge* or *bridge* of a graph $G$ is an edge whose removal produces a graph with more connected components than in $G$.
]

= Graph Theory II

== Trees

=== Definitions

#definition[
  A *tree* is a simple connected graph with no cycles. A *forest* is a simple graph with no cycles. Each connected component of a forest is a tree.
]

*Remark.* Trees may be rooted trees. A rooted tree is a tree with one distinguished vertex (the root). Hereafter, we will assume that all trees are rootless, unless specified.

#theorem[
  1. The simple graph $G$ is a tree if and only if it is connected and, if we remove any edge, we obtain a disconnected graph.
  2. The simple graph $G$ is a tree if and only if it does not contain any cycles and, if we add any edge, we create a cycle.
]

#theorem[
  A graph $G = (V, E)$ is a tree if and only if there exists a unique path between any pair of vertices.
]

#definition[
  How to grow a tree?
  1. Start from the trivial tree $T = ({r}, emptyset)$, where $r$ is the root vertex.
  2. Given $T = (V, E)$, add a new vertex $u$ and a new edge ${u, v}$ where $v in V$.
]

#theorem[
  Any graph obtained by using the preceding procedure is a tree, and any tree can be obtained in this way.
]

=== Properties

#theorem[
  Any tree with at least two vertices contains at least two vertices of degree one.
]

#theorem[
  Any tree with $n$ vertices has $n - 1$ edges.
]

#theorem[
  If $G$ is a graph with $n$ vertices, then the following statements are equivalent:
  1. $G$ is a tree.
  2. $G$ is connected and has $n - 1$ edges.
  3. $G$ has $n - 1$ edges and does not contain any cycle.
]

== Planar Graphs


=== Definitions

#definition[
  A *planar graph* is a graph that can be embedded in the plane: i.e., it can be drawn on the plane in such a way that their edges do not cross each other. A *plane graph* is a graphical representation of a planar graph such that their edges do not cross each other.
]

#definition[
  A *subdivision* of an edge results from inserting a new vertex into that edge. The subdivision of a graph $G$ is obtained by subdividing one or more edges in $G$.
]

#theorem(title: "Kuratowski, 1930")[
  A graph is planar if and only if it does not contain a subgraph that is a subdivision of $K_5$ or $K_(3,3)$.
]

=== Planar and Dual Graphs

#theorem(title: "Euler's formula, 1752")[
  A plane and connected graph $G = (V, E)$ divides the plane into $R$ regions (or faces), such that
  $ |V| - |E| + R = 2 $
  A plane graph (not necessarily connected) divides the plane into $R$ regions, such that
  $ |V| - |E| + R = 1 + "number of connected components of" G $
]

#definition[
  Given a plane connected graph $G = (V, E)$, we can define its *dual graph* $G^* = (V^*, E^*)$ in the following way: To each region $f$ of $G$ we associate a dual vertex $f^* in V^*$, and to each edge $e in E$, there corresponds a unique dual edge $e^* in E^*$. If the original edge $e$ is the intersection of two faces $f, h$ (possibly, $f = h$), then the corresponding dual edge $e^*$ is incident with the dual vertices $f^*, g^* in V^*$.
]

- $G^*$ can be drawn in such a way that any dual edge $e^*$ only crosses $e$.
- Notice that $(G^*)^* = G$.

=== Some Corollaries About Graph Planarity

#definition[
  Given a plane graph, the *degree of a region* $r$ is the degree of the dual vertex $r in V^*$ associated with it in the dual graph $G^*$. We denote the degree of the region $r$ as $d_r$ (or $d(r)$).
]

#theorem(title: "Handshake Theorem for the dual graph")[
  Given a plane connected graph $G$, then
  $ 2|E| = sum_(r in R) d_r $
  where $R$ is the set of regions defined on the plane by $G$.
]

#corollary[
  If $G$ is a simple, connected, and planar graph with $|V| >= 3$, then $|E| <= 3|V| - 6$.
]

#corollary[
  If $G$ is a simple, connected, and planar graph with $|V| >= 3$ and without cycles of length 3, then $|E| <= 2|V| - 4$.
]

= Graph Theory III

== Algorithms in Graph Theory

1. *Undirected graphs*.
2. *Algorithms in graph theory*:
  - *Minimum-weight spanning tree*: Prim's and Kruskal's algorithms.
  - *Shortest path*: Dijkstra's algorithm.
  - *Graph colorings*.
  - *Eulerian and Hamiltonian graphs*. Fleury's algorithm.
3. *Combinatorial problems on graphs*.

== Minimum-Weight Spanning Tree

#definition[
  A *spanning tree* of a connected graph $G$ is a subgraph of $G$ that is a tree and contains all vertices of $G$.
]

#definition[
  A *weighted graph* $G = (V, E, omega)$ is a graph such that every edge $e in E$ is associated to a weight $omega(e) in RR$.
]

#definition[
  A *minimum-weight spanning tree* of a connected weighted graph $G = (V, E, omega)$ is a spanning tree $T = (V, A)$ of $G$ such that $omega(A) = sum_(e in A) omega(e)$ takes the minimum possible value.
]

*Problem 1*: Find a minimum-weight spanning tree of a connected weighted graph $G = (V, E, omega)$.

*Remark.* The number of trees on $n$ vertices grows very rapidly with $n$.

#definition[
  A *greedy algorithm* to solve a given problem is an algorithm such that at every step, it always takes, among all the choices allowed by the problem, the optimum one.
]

== Prim's Algorithm, 1957

#algorithm(
  pseudocode-list(numbered-title: [Prim's algorithm], booktabs: true)[
    // *procedure* Prim($G$: connected weighted graph with $n$ vertices)
    + $T_1 = (V_1, E_1)$ where $E_1 = {e_1}$, $e_1 = {x_0, x_1}$ is one edge with minimum weight $omega_"min"$, and $V_1 = {x_0, x_1}$.
    + *for* $i = 1$ *to* $n - 2$
      + $e_(i+1) = {x_i, x_(i+1)}$ edge of minimum weight that is incident with a vertex $x_j$ of $T_i = (V_i, E_i)$, and such that it does not form a cycle when added to $T_i$
      + $T_(i+1) = (V_i union {x_(i+1)}, E_i union {e_(i+1)}) = (V_(i+1), E_(i+1))$
  ],
)

*Remarks.*
- The edge $e_i$ ($i = 1, ..., n-1$) might not be unique.
- The minimum-weight spanning tree might not be unique.
- At each step, $T_i$ is a tree ($1 <= i <= n-1$).

#theorem[
  Given a connected weighted graph $G = (V, E, omega)$, Prim's algorithm produces a minimum-weight spanning tree of $G$.
]

== Kruskal's Algorithm, 1957

#algorithm(
  pseudocode-list(numbered-title: [Kruskal's algorithm], booktabs: true)[
    // *procedure* Kruskal($G$: connected weighted graph with $n$ vertices)
    + $T_0 = (V, E_0)$ with $E_0 = emptyset$
    + *for* $i = 1$ *to* $n - 1$
      + $e_i =$ edge of minimum weight such that it does not form a cycle when added to $T_(i-1) = (V, E_(i-1))$
      + $T_i = (V, E_(i-1) union {e_i}) = (V, E_i)$
  ],
)

*Remarks.*
- The edge $e_i$ ($i = 1, ..., n-1$) might not be unique.
- At each step, $T_i$ is a forest ($1 <= i <= n-1$).

#theorem[
  Given a connected weighted graph $G = (V, E, omega)$, Kruskal's algorithm produces a minimum-weight spanning tree of $G$.
]

== Shortest Path Between Two Vertices: Dijkstra's Algorithm, 1959

*Problem 2*: Find the shortest path that joins an initial vertex $s$ to a final vertex $t$ belonging to a simple, connected, and weighted graph $G = (V, E, omega)$ such that all weights are positive ($omega_e > 0$ for every edge $e in E$).

#theorem[
  Dijkstra's algorithm finds the length of the shortest path between two vertices of a simple, connected, and weighted graph $G = (V, E, omega)$ with all its weights being positive.
]

*The basic idea:*
In each iteration, we assign to each vertex $j$ two labels, that might be either temporary $(delta_j, P_j)$ or permanent $underline((delta_j, P_j))$.
- The label $delta_j$ is an estimate of the length of the path going from the initial vertex $s$ to the vertex $j$.
- The label $P_j$ is an estimate of the predecessor of the vertex $j$ along the above path.
We will denote the weight of the edge ${i, j} in E$ as $omega({i, j}) = omega_(i j) > 0$.

== Dijkstra's Algorithm

1. *Initial Step*: We mark the origin $s$ with the permanent label $underline((0, s))$.
  All the other vertices $j in V$ ($j != s$) are marked with temporary labels:
  - If ${j, s} in E$, we assign the label $(omega_(s,j), s)$ to $j$.
  - If ${j, s} in.not E$, we assign to $j$ the label $(infinity, -)$.

2. Let $v in V$ be the last vertex that has become permanent. For each temporary vertex $j$, we compare the temporary label $delta_j$ to the new value $delta_v + omega_(v,j)$:
  - If $delta_v + omega_(v,j) < delta_j$, the old label $(delta_j, P_j)$ is replaced by $(delta_v + omega_(v,j), v)$.
  - If $delta_v + omega_(v,j) > delta_j$, the label $(delta_j, P_j)$ remains the same.

3. Among all temporary vertices $j$, we choose one $j_0$ with the minimum label
  $ delta_(j_0) = min(delta_j | j "is temporary") = delta_"min" $
  - If $delta_"min" = infinity$, the algorithm ends: there is no path between $s$ and $t$.
  - If $delta_"min" < infinity$, we mark such vertex with the permanent label $underline((delta_"min", P_(j_0)))$.

4. If $t$ is the vertex whose label has become permanent, the algorithm ends. The length of the shortest path between $s$ and $t$ is $delta_t$, and such a path is obtained by following the permanent labels in reverse order $t -> P_t -> ... -> s$. Otherwise, go back to Step (2).

*Remarks.*
- If at a given step there are several options, we can choose any of them.
- The shortest path between two vertices may not be unique; but the shortest length does not depend on such a choice.
- The final output of Dijkstra's algorithm (when all vertices have been marked permanent) is a rooted spanning tree $T$, such that the root is the initial vertex $s$, and the distance between $s$ and any other vertex $j$ of the graph is the sum of all the weights of the unique path between $s$ and $j$ on $T$.

== Directed Graphs or Digraphs

#definition[
  A *directed graph* $G = (V, E)$ consists in a nonempty set of vertices $V$ and an edge set $E$, such that each edge $e in E$ is an ordered pair of vertices $e = (x, y)$ with $x, y in V$.
]

#definition[
  Let $G$ be a directed graph $G = (V, E)$, and let $v in V$ be a vertex of $G$. The *indegree* $d_i (v)$ of $v$ is the number of edges whose second entry is $v$. The *outdegree* $d_o (v)$ of $v$ is the number of edges whose first entry is $v$.
]

#proposition[
  In any directed graph $G = (V, E)$:
  $ sum_(v in V) d_i (v) = sum_(v in V) d_o (v) = |E| $
]

#definition[
  Let $G = (V, E)$ be a directed graph, and we consider the ordering $v_1, v_2, ..., v_(|V|)$ of its vertex set $V$. The *adjacency matrix* of $G$ associated to that ordering is the $|V| times |V|$ matrix whose entries $A_(i j)$ count the number of edges $(v_i, v_j)$ that start at $v_i$ and end at $v_j$.
]

#definition[
  A *walk* of length $ell$ in a directed graph $G = (V, E)$ is a sequence of $ell$ edges of the form $(v_0, v_1), (v_1, v_2), ..., (v_(ell-1), v_ell)$.

  The definitions of trail, path, closed walk, circuit, and cycle are the natural generalization of those given for undirected graphs in Chapter 4.

  We can also define weighted directed graphs $G = (V, E, omega)$ in an analogous way.
]

= Graph Theory IV

== Eulerian Graphs

*Problem 4 (Euler)*: The old city of Königsberg was crossed by a river and there were seven bridges. Was it possible to start walking at some point of the city and get back to the same place by crossing every bridge exactly once?

*Problem 5*: Given a graph $G = (V, E)$, is there any circuit containing every edge $e in E$? (If it is a circuit, then each edge is visited exactly once).

#definition[
  An *Euler tour* is a circuit containing every edge of the graph. A graph admitting an Euler tour is an *Eulerian graph*.

  An *Euler trail* is an open trail that contains all the edges of the graph.
]

#theorem[
  A connected graph is Eulerian if and only if the degree of all its vertices is even.
  A connected graph contains an Euler trail if and only if it contains exactly two vertices of odd degree.
  A connected and directed graph is Eulerian if and only if for every vertex $v in V$, $d_i (v) = d_o (v)$.
]

Therefore, the *problem of the bridges of Königsberg* does not have any solution: the corresponding graph does not admit any Euler tour/trail.

== Fleury's Algorithm

Let $G = (V, E)$ be a connected graph with all its vertices of even degree:
1. *Initial step*: We choose any vertex $v_0$ as the initial vertex of the Euler tour $C_0 = (v_0)$ and we define $G_0 = (V_0, E_0) = G$. The algorithm sequentially increases the tour $C_0$, while it sequentially deletes elements from $G$.

2. *How to extend the trail?*: Let $C_i = (v_0, e_1, v_1, ..., e_i, v_i)$ be the trail corresponding to the graph $G_i = (V_i, E_i) subset.eq G_0$.
  - If there exits a unique edge incident with $v_i$, $e_(i+1) = {v_i, w} in E_i = E without {e_1, e_2, ..., e_i}$:
    - $C_(i+1) = (v_0, e_1, v_1, ..., e_i, v_i, e_(i+1), w)$.
    - $G_(i+1) = (V_i without {v_i}, E_i without {e_(i+1)}) = (V_(i+1), E_(i+1))$.
  - If there are several edges in $E_i$ incident with $v_i$, we can choose any of these edges as long as the chosen one is not a bridge of $G_i$. If we choose $e_(i+1) = {v_i, w} in E_i$:
    - $C_(i+1) = (v_0, e_1, v_1, ..., e_i, v_i, e_(i+1), w)$.
    - $G_(i+1) = (V_i, E_i without {e_(i+1)}) = (V_(i+1), E_(i+1))$.

3. We repeat Step (2) $|E|$ times until $G_(|E|) = (emptyset, emptyset)$. Then $C_(|E|)$ is the Euler tour we were looking for.

== Hamiltonian Graphs

*Problem 6*: Is it possible to find a cycle on a graph $G$ such that it contains all vertices of $G$ exactly once?

#definition[
  A *Hamilton cycle* of a graph $G$ is a cycle that contains all the vertices of $G$. A graph admitting one Hamilton graph is a *Hamiltonian graph*.

  A *Hamilton path* of a graph $G$ is an open path that contains all vertices of $G$.
]

The problem of deciding that a given graph is Hamiltonian or not is hard.

#theorem(title: "Dirac, 1950")[
  If $G$ is a simple graph with $n >= 3$ vertices and each vertex has a degree $>= n\/2$, then $G$ is a Hamiltonian graph.
]

*Remark.* Not every Hamiltonian graph satisfies the above condition: e.g. $C_n$ with $n >= 5$.
