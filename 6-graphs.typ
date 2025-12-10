#import "assets/theory_template.typ": *
#show: theory

= Graph theory

#fa-book() This chapter overlaps with sections 10.1-6, 11.1 and 11.4-5 of Rosen.

== Defining graphs

=== Basic definitions

#definition(title: [Directed graphs])[
  A *directed graph* is an ordered pair $G = (V, E)$ where
  - $V$ is a nonempty set of *vertices*, also called nodes.
  // TODO: only really a relation if directed graph! so start from directed? which is probably the most intuitive to understand?
  - $E subset.eq V times V$ is the graph's adjacency relation, which is a binary relation on $V$.
    Its elements are called *edges*, or links.
    If $e = (u, v) in E$, we say that $e$ is *incident* on $u$ and $v$, that the two vertices are *adjacent*, that $u$ is $e$'s *tail* and $v$ its *head*, and also that $u$ is $v$'s *predecessor* and $v$ is $u$'s *successor*.
]

We actually already introduced directed graphs as a natural representation of a binary relation, in @sec-rels-sets!
Directed graphs can then be represented in a similar way.
For instance:
#figure(
  raw-render(
    ```dot
    digraph {
      layout=neato
      start=5
      node[shape=circle margin=0]
      1 -> 2;
      1 -> 3;
      2 -> 4;
      2 -> 3;
      5 -> {4, 2, 1};
      6 -> 3
      7;
    }
    ```,
    width: 5cm,
  ),
)

#definition(title: [Undirected graphs])[
  An *undirected graph* is an ordered pair $G = (V, E)$ of vertex and edge sets $V$ and $E$, where $E$ is a set of _unordered_ pairs of vertices, that is $E subset.eq { {u,v} | u,v in V}$.
  If $e = {u, v} in E$, we say that $e$ is *incident* on $u$ and $v$, or equivalently, that the two vertices are *adjacent*, or that $u$ is in $v$'s *neighbourhood* $cal(N)(v)$, and vice versa.
]

#remark[
  The edge set of a directed graph is defined as
  $
    E subset.eq V times V = { (u,v) | u,v in V},
  $
  which is a set of _ordered_ pairs of vertices.
]

#remark[
  An undirected graph can be seen as a directed graph whose adjacency relation is symmetric ---meaning if $(u,v)$ is an edge, then $(v,u)$ as well---, but also crucially considering that these are not two distinct edges but a single one, which can be represented as a 2-set ${u,v}$.
]

The representation of undirected graphs then simplifies the edges by removing the arrows indicating direction:
#figure(
  raw-render(
    ```dot
    graph {
      layout=neato
      start=5
      node[shape=circle margin=0]
      1 -- 2;
      1 -- 3;
      2 -- 4;
      2 -- 3;
      5 -- {4, 2, 1};
      6 -- 3
      7;
    }
    ```,
    width: 5cm,
  ),
)

In the following, we'll use the word *"graph"* to refer to either a directed or undirected graph.

Again in a similar fashion to relations, graphs can be represented by an adjacency matrix.

#definition(title: [Adjacency matrix])[
  Let's consider a graph $G = (V, E)$, and the ordering $v_1, v_2, ..., v_(|V|)$ of its vertex set $V$.
  The *adjacency matrix* of $G$ associated to that ordering is the $|V| times |V|$ matrix whose entries $A_(i j)$ count the number of edges between $v_i$ and $v_j$.
] <def-adj-mat>

#property[
  The adjacency matrix of an undirected graph is symmetric.
]

#notation[
  In the following, whenever we refer to a vertex as the vertex $i$ or $j$, we mean $v_i$ or $v_j$ in the ordering $v_1, v_2, ..., v_(|V|)$, from which the graph's adjacency matrix has been defined.
]

=== Particular graphs

An interesting particular case of graphs is the one that represents relationships between two separate sets of entities.

#definition(title: [Bipartite graphs])[
  A graph $G = (V, E)$ is *bipartite* if its vertex set $V$ can be partitioned into two disjoint subsets $V_1$ and $V_2$ such that every edge in the graph connects a vertex in $V_1$ with a vertex in $V_2$.
]

#remark[
  A directed bipartite graph can actually represent a binary relations between two sets.
]

We will now introduce some particular kinds of graphs which are not so common and that we will largely ignore in the following.

#definition(title: [Self-loops])[
  In a graph $G = (V, E)$, a vertex which is adjacent to itself is called a self-loop.
]

#remark[
  A graph can either allow or disallow self-loops, depending on what it models.
  Following the binary relation analogy, disallowing self-loops can be thought of as forcing the adjacency relation to be irreflexive.
]

The entries of the adjacency matrix defined in @def-adj-mat have been defined as edge _counts_, meaning it could take values in $NN$, while graph definitions above implied values in ${0,1}$, encoding the absence or presence of an edge.
Actually, we defined adjacency matrices this way so it's general enough to account for multigraphs.

#definition(title: [Multigraphs])[
  A *multigraph* $G = (V, E)$ is a graph in which multiple edges are allowed between the same pair of vertices, which implies that $E$ is not defined as a set but as a collection with potential repetitions.
]

Multigraphs are actually very rare in practice, as they can often be equivalently represented by weighted graphs.

#definition(title: [Weighted graphs])[
  A *weighted graph* $G = (V, E, omega)$ is a graph such that every edge $e in E$ is associated to a weight $omega(e) in RR$.
]

#remark[
  Naturally then, the entries of the adjacency matrix of a weighted graph correspond to the edge weights, that is:
  $
    A_(i j) = w( (v_i, v_j) ) = w_(i j)
  $
  // TODO remark on weight meanings? as can be distance or similarity
]

Most of the time in this course, we will ignore these generalisations and only consider simple graphs.

#definition(title: [Simple graphs])[
  A simple graph is an unweighted graph without multi-edges or self-loops.
]

#definition(title: [Subgraphs])[
  The graph $H = (W, F)$ is a *subgraph* of $G = (V, E)$ if its vertex and edge sets are subsets of $G$'s, that is $W subset.eq V$ and $F subset.eq E$.
]


=== Isomorphism of graphs

The same graph can be represented in a number of ways: graphically the vertices are placed arbitrarily on a plane, and in an adjacency matrix, the ordering of vertices is also arbitrary.
Also, if the vertex labels do not carry any particular meaning ---i.e. they are "dummy" labels---, the labels too are arbitrary.
It is thus important to be able to recognize the same graph, however it was represented.

#definition[
  The simple graphs $G_1 = (V_1, E_1)$ and $G_2 = (V_2, E_2)$ are *isomorphic* if and only if there exist a bijective function $f : V_1 -> V_2$ with the following property: $a$ and $b$ are adjacent in $G_1$ if and only if $f(a)$ and $f(b)$ are adjacent in $G_2$. The function $f$ is called an *isomorphism*.
]

Some simple tests based on aggregate measures can be used to discard isomorphism between two graphs.

#remark[
  Given two simple graphs $G_1 = (V_1, E_1)$ and $G_2 = (V_2, E_2)$, then
  1. If $|V_1| != |V_2|$, then $G_1$ and $G_2$ are not isomorphic.
  2. If $|E_1| != |E_2|$, then $G_1$ and $G_2$ are not isomorphic.
]

#remark[
  $G_1$ and $G_2$ are isomorphic if there exists an invertible linear map (basically a permutation of the "basis vectors") $pi : V_1 -> V_2$ such that $A_2 = P^(-1) dot A_1 dot P$. There are $|V_1|! = |V_2|!$ maps of this type, hence the difficulty of testing for isomorphism if two graphs share many similarities at the aggregate level!
]

== Traversing graphs

The whole point of a graph model is not to only look at binary relationships between pairs of entities represented by edges between pairs of vertices, but to investigate the interconnections over the whole set of vertices, thus including "long-distance relationships".
That is why traversing graphs is crucial, as it can provide us with central information about a graph.

=== Definitions

#definition[
  A *walk* on a graph $G = (V, E)$ is an alternating sequence of vertices and edges of the form $v_0, e_1, v_1, e_2, v_2, ..., v_(l-1), e_l, v_l$, such that $e_k$ is from $v_(k-1)$ to $v_(k)$ for all $k$.
  It is said to be *closed* if it ends where it starts, so if $v_1 = v_l$, and open otherwise.
  The *length* of the walk is equal to the number of edges in the walk $l$, and is at least one.
] <def-walk>

#remark[
  - In an undirected graph, the condition on each edge is $e_k = {v_(k-1), v_k}$, meaning that edges can be traversed in both directions.
  - A walk on a graph without multi-edges can be described more simply by a sequence of vertices, as each edge is uniquely determined by a pair of vertices.
]


#definition[
  A *trail* is a walk with no repeated edge.
  A closed trail is called a *circuit*.

  A *path* is a trail with no repeated vertex, with the potential exception of the first which may also appear as the last one. A *cycle* is a closed path.
]

#remark[
  The definitions of trails and paths are equivalent on a simple graph.
  In this case, we usually prefer to use the term "path".
]

=== Graph connectivity
// TODO: move to describing graphs?

These definitions allow us to give a basic yet fundamental characteristic of a graph, namely, it connectivity.

#definition[
  An undirected graph is said to be *connected* if every pair of vertices is connected by a path.
]

#definition[
  A directed graph $G=(V,E)$ is
  - *strongly connected* if for every $u,v in V$, there is a path from $u$ to $v$ and from $v$ to $u$,
  - *weakly connected* if for every $u,v in V$, there is a path between $u$ and $v$ in the underlying undirected graph.
  A strongly or weakly disconnected graph can then be partitioned into strongly and weakly connected components.
]

#question-box[
  The connectivity only tells us whether a graph is connected, but not how strongly it is.
  But given the following two graphs, which would you say is more strongly connected?
  Why?
  #figure(
    grid(
      columns: 2,
      column-gutter: 2em,
      raw-render(
        ```dot
        graph {
          layout=neato
          start=10
          node[shape=circle margin=0]
          1 -- {2, 3, 4};
          3 -- 2;
          4 -- {5, 6};
          5 -- 6;
        }
        ```,
        width: 5cm,
      ),
      raw-render(
        ```dot
        graph {
          layout=neato
          start=10
          node[shape=circle margin=0 fontsize=13]
          1 -- {2, 3};
          3 -- 2;
          2 -- 5;
          3 -- 6;
          4 -- {5, 6};
          5 -- 6;
        }
        ```,
        width: 5cm,
      ),
    ),
  )
]

One way to quantify the connectivity is to check how easy it is to split a graph into separate components.

#definition[
  A *cut edge* or *bridge* of a graph $G$ is an edge whose removal produces a graph with more connected components than in $G$.

  A *cut vertex* or *articulation point* of a graph $G$ is a vertex whose removal (together with those edges incident with it) produces a graph with more connected components than in $G$.
] <def-cut-ev>

Counting the minimum number of cut edges/vertices necessary to create $k$ components thus allows a better characterisation of a graph's connectivity.

=== Vertices connectivity

How well two vertices are connected can then be measured by counting the number of walks which connect them.

#theorem[
  Let $G$ be a graph with adjacency matrix $A$ with respect to the ordering $v_1, v_2, ..., v_(|V|)$ of its vertex set. The number of distinct oriented walks of length $n >= 1$ that start at $v_i$ and end at $v_j$ is given by the entry $(i, j)$ of the matrix $A^n$.
]
// beautiful proof by induction p 723

// TODO: reconcile ordering of degree definition
#corollary[
  Let $G$ be a simple graph with adjacency matrix $A$, then
  - $A^2_(i i) = k(i)$ for every $1 <= i <= |V|$.
  - $"tr" A^2 = 2|E|$.
  - $"tr" A^3 = 6 times$ number of unoriented triangles in $G$.
]

=== Shortest paths

A very common problem related to paths is to find the shortest way to go from one vertex to another.
But first, what does "short" mean here?
Let's generalise the notion of path length to weighted graphs.

#definition[
  Given a simple, undirected and weighted graph $G = (V, E, omega)$ with positive weights, the length $L(P)$ of a path $P = v_0, e_1 v_1, e_2, v_2 dots, v_(l-1), e_l, v_l$ is the sum of the weights of the edges that it traverses:
  $
    L(P) = sum_(i=1)^l w(e_i).
  $
]

Here, the edge weights are thus interpreted as a distance between the vertices they connect.
This definition allows to recover the one of walk length for unweighted graphs (@def-walk) by taking unit weights.


#definition(title: [Shortest path problem])[
  Given a simple, undirected and weighted graph $G = (V, E, omega)$ with positive weights, and $s,t in V$, a shortest path problem consists in finding the shortest path that connects $s$ and $t$, that is:
  $
    argmin_(P in cal(P)(s,t)) L(P),
  $
  where $cal(P)(s,t)$ is the set of paths that connect $s$ and $t$.
]


#question-box[
  In an unweighted graph, how can you get the shortest path length using the adjacency matrix?
]

If the path is long, this gets very costly, though.
Also, if the graph is weighted, the shortest path in terms of number of traversed edges is not necessarily the shortest path in terms of edge weights.
That's why we need another method to compute shortest paths, such as Dijkstra's algorithm.
The basic idea of the algorithm is to iteratively explore the graph from the point of view of the starting vertex $s$.
Starting from $s$, in each step we find its next closest vertex, until we've reached $t$.
Crucially though, since shortcuts can sometimes appear, we need to keep track of known or estimated distances throughout the exploration.
Let's proceed on the following example.

#example[
  Find the shortest path from $a$ to $z$ in:
  #figure(
    raw-render(
      ```dot
      graph {
        layout=neato
        node[shape=circle margin=0]
        edge[labeldistance=2]
        a [pos="0,1!"]
        b [pos="1,2!"]
        c [pos="1,0!"]
        d [pos="3,2!"]
        e [pos="3,0!"]
        z [pos="4,1!"]
        a -- b [label=4]
        a -- c [taillabel=2]
        b -- c [label=1]
        e -- c [label=9]
        d -- b [label=5]
        d -- c [label=8]
        d -- e [label=2]
        d -- z [headlabel=4]
        e -- z [label=3]
      }
      ```,
      width: 7cm,
    ),
  )
]
// do iteratively with a table

#algorithm(
  pseudocode-list(
    numbered-title: [Dijkstra's

      *Input:* $G=(V, E, omega)$ connected and simple with positive weights, and with vertices \ $a=v_0, v_1, dots, v_n=z$.//, and taking $w(u,v) = +oo$ if $(u,v) in.not E$.

      *Output:* $d(a, z)$, length of shortest path from $a$ to $z$.
    ],
    booktabs: true,
  )[
    + for $i = 1$ to $n$
      + $d(a, v_i) = infinity$ #comment[initialise unknown shortest lengths as infinity]
    + $d(a, a) = 0$
    + $S = emptyset$
    + *while* $z in.not S$ #comment[until we've reached $z$]
      + $u = "a vertex not in" S "with" d(a, u) "minimal"$ #comment[consider the next closest vertex] #line-label(
          <lalg-next-closest>,
        )
      + $S = S union {u}$
      + *for* all $v in cal(N)(u)$ #comment[for all neighbours $v$ of $u$]
        + *if* $d(a, u) + w(u, v) < d(a, v)$ #comment[if going through $u$ creates a shortcut to reach $v$]
          + *then* $d(a, v) = d(a, u) + w(u, v)$ #comment[update the shortest length to reach $v$] #line-label(<lalg-dist-update>)

  ],
)

#remark[
  - If at @lalg-next-closest there are several options, we can choose any of them.
  - The sequence of vertices composing the path can be obtained by keeping track of the current best path, or simply of the best predecessor, whenever we reassign $d(a, v)$ in @lalg-dist-update.
  - The shortest path between two vertices is not necessarily unique. It is perfectly possible to have two or more paths of equal length between a given pair of vertices.
]


== Describing graphs
// TODO: vertex neighbourhood? Laplacian?
// TODO: add clustering from discussion on transitivity of relation, as in Newman p.183?
// TODO: Mengers theorem p. 139?

=== Degree

A vertex' importance can first be quantified by its degree.

#definition[
  Let $G$ be a directed graph $G = (V, E)$, and let $v in V$ be a vertex of $G$.
  The *in-degree* $k^(("in")) (v)$ of $v$ is the number of edges whose head is $v$, that is which end at $v$.
  The *out-degree* $k^(("out")) (v)$ of $v$ is the number of edges whose tail is $v$, that is which start from $v$.
]

#figure(
  grid(
    columns: 2,
    column-gutter: 2em,
    row-gutter: 1em,
    align: horizon + center,
    raw-render(
      ```dot
      digraph {
        layout=neato
        node[shape=circle margin=0]
        1 -> {2, 3, 4, 5} [color=grey90];
        2 -> 1;
        3 -> 1;
        5 -> 1;
      }
      ```,
      width: 4cm,
    ),
    raw-render(
      ```dot
      digraph {
        layout=neato
        node[shape=circle margin=0]
        1 -> {2, 3, 4, 5};
        2 -> 1 [color=grey90];
        3 -> 1 [color=grey90];
        5 -> 1 [color=grey90];
      }
      ```,
      width: 4cm,
    ),

    [Computing $1$'s in-degree], [Computing $1$'s out-degree],
  ),
)


#proposition[
  Let's consider a directed graph $G$ and its adjacency matrix $A$ associated to the ordering $v_1, v_2, ..., v_(|V|)$ of its vertex set $V$.
  Then:
  $
    forall i in [| 1, abs(V) |], cases(
      k^(("in")) (v_i) = sum_j A_(j i),
      k^(("out")) (v_i) = sum_j A_(i j),
    )
  $
] <prop-dir-deg-adj>

It then follows that summing over degrees amounts to summing all entries of the adjacency matrix, which gives the following result.

#proposition[
  In any directed graph $G = (V, E)$:
  $ sum_(v in V) k^(("in")) (v) = sum_(v in V) k^(("out")) (v) = |E| $
] <prop-handshaking-dir>

The definition of degree follows naturally for undirected graphs, by considering that two directed edges $(u,v)$ and $(v,u)$ correspond to a single undirected edge ${u,v}$.

#definition[
  The *degree* of a vertex $v in V$ in an undirected graph $G = (V, E)$ is the number of edges incident with it, except that a loop contributes twice to the degree of that vertex. The degree of a vertex $v$ is denoted by $k(v)$.
]

#proposition[
  Let's consider an undirected graph $G$ and its adjacency matrix $A$ associated to the ordering $v_1, v_2, ..., v_(|V|)$ of its vertex set $V$.
  Then:
  $
    forall i in [| 1, abs(V) |], k (v_i) = A_(i i) + sum_j (A_(i j) + A_(j i)) / 2 = A_(i i) + sum_j A_(i j)
  $
] <prop-undir-deg-adj>

We can then get a similar result as @prop-handshaking-dir, which is known as the handshaking theorem.

#theorem(title: "The handshaking theorem")[
  In any undirected graph $G = (V, E)$, we have that
  $ sum_(v in V) k(v) = 2|E| $
]

#remark[
  This also holds for undirected graphs with loops, thanks to the convention we took to consider a self-loop as incident twice to its vertex.
]

#corollary[
  For any undirected graph, the sum of all vertex degrees is an even number.
]

#corollary[
  Any undirected graph has an even number of vertices of odd degree.
]

#corollary[
  For any undirected graph with an odd number of vertices, there is an odd number of vertices of even degree.
]

The notion of degree also allows us to define a very special kind of graph.

#definition(title: [Regular graph])[
  A *regular graph* is an undirected graph whose vertices all have the same degree.
]

The notion of degree also gets naturally generalised to the case of weighted graphs.

#definition[
  Let $G$ be a weighted directed graph $G = (V, E, omega)$, and let $v in V$ be a vertex of $G$.
  The *in-strength* $s^(("in")) (v)$ of $v$ is the sum of the weights of edges whose head is $v$.
  The *out-strength* $s^(("out")) (v)$ of $v$ is the sum of the weights of edges whose tail is $v$.
]

#definition[
  Let $G$ be a weighted undirected graph $G = (V, E, omega)$, and let $v in V$ be a vertex of $G$.
  The *strength* $s (v)$ of $v$ is the sum of the weights of edges adjacent to $v$, except that a loop contributes its weight twice.
]

@prop-dir-deg-adj then also holds for strengths in weighted directed graphs, and @prop-undir-deg-adj for those in weighted undirected ones.

These measures, degree and strength, are very local in nature, and thus may not represent the importance of a vertex in the context of the whole graph.

=== Eigenvector centrality

A first way to provide more global information to quantify a vertex' importance is to consider that a vertex should be considered more important not only the more neighbours it has, but also the more important these neighbours are.
That is how we define the eigenvector centrality $x(u)$ of a vertex $u$ in an undirected graph: it's proportional to the sum of the centralities of its neighbours:
$
  x(u) = c^(-1) sum_(v in cal(N) (u)) x(v),
$
where $c in RR^+$ is a constant.
Rewriting this equality for every vertex, and involving the adjacency matrix $A$ of the graph, we get
$
  x = c^(-1) A x <=> A x = c x,
$
where $x$ is a vector of centrality scores, which is an eigenvector of $A$ associated to the eigenvalue $c$!
And from the Perron-Frobenius theorem from linear algebra, we know that since $A$ has non-negative values, if we want our centralities to all be non-negative, $c$ must be the largest eigenvalue.

#definition(title: [Eigenvector centrality])[
  Given a simple undirected graph represented by an adjacency matrix $A$, the eigenvector centrality of vertex $i$ is the $i^"th"$ element of one of $A$'s leading eigenvectors.
]

#remark[
  - The point of centralities is to compare vertices, so the same eigenvector should be considered for all nodes!
  - To generalise to directed networks, some small tweaks are needed: see Sections 7.1.2-3 in Newman.
]


=== Betweenness centrality

A second way to account for the global graph context to quantify a vertex' centrality is to use shortest paths.

#definition(title: [Vertex betweenness: simple])[
  The betweenness centrality of a vertex is the number of shortest paths between pairs of other vertices which pass through it.
]

However, as mentioned above, there may be more than one shortest path between a pair of vertices.

#definition(title: [Vertex betweenness: full])[
  The betweenness centrality of a vertex is the number of shortest paths between pairs of other vertices which pass through it, where we weight each path by the number of shortest paths between each pair of vertices:
  $
    forall u in V, b(u) = sum_(s, t in V without {u}) #h(.5em) sum_(P in cal(P)(s,t)) #h(.5em) sum_(u in P) 1 / abs(cal(P)(s,t)),
  $
  where $cal(P)(s,t)$ is the set of shortest paths from $s$ to $t$.
]

A strength of betweenness is that it not only characterises the importance of vertices, but of edges too!

#definition(title: [Edge betweenness])[
  The betweenness centrality of an edge is the number of shortest paths passing through it, where we consider paths between all connected vertex pairs, weighting multiple shortest paths appropriately.
]

#remark[
  This edge centrality is linked to the #link("https://smg.media.mit.edu/library/Granovetter.WeakTies.pdf")["strength of weak ties" theory formulated by the sociologist Mark Granovetter], which suggests that weak social relationships are central for the diffusion of information in a network (in very rough terms).
]

=== Graph size

The size of a graph can be simply considered to be its number of vertices and edges, but this gives little information.
Indeed, it does not say how far away vertices are from each other in the graph.
For that, we can look into the lengths of shortest paths, and for instance compute the average shortest path length.
Alternatively, we can consider its longest shortest path.


#definition(title: [Graph diameter])[
  The diameter of a graph is the length of its longest shortest path, or in other words, the distance between its farthest vertices, in terms of shortest path length.
]

#remark[
  The graph diameter is what's behind the idea of the "six degrees of separation": the fact that if you build the graph of social connections between people, its diameter is equal to 6 (or at least, in a famous experiment made by Stanley Milgram, for more see #link("https://www.youtube.com/watch?v=CYlon2tvywA")[this video]).
]


=== Graph density

We already saw how to check how well connected a graph is, using cut edges and vertices (@def-cut-ev).
A complementary, easier way to quantify that is to count how many edges the graph has, and compare it to the maximum it could have.

#question-box[
  How many edges can a simple undirected graph have at maximum?\ _Hint_: this is a combinatorics question!
  // the number of ways you can choose two vertices from a set of $n$
]

#definition(title: [Graph density])[
  The density $rho$ of a graph is the fraction of possible edges which are actually present in the graph.
]

#remark[
  The density can be thought of as the probability that two vertices picked from the graph uniformly at random are connected by an edge.
]

#proposition[
  For simple undirected graphs,
  $
    rho = (2 m) / (n ( n-1)).
  $
]


== Euler and Hamilton paths
// TODO: keep?

=== Eulerian graphs

*Problem*: The old city of Königsberg was crossed by a river and there were seven bridges. Was it possible to start walking at some point of the city and get back to the same place by crossing every bridge exactly once?

#figure(image("./assets/konisgberg.svg", width: 50%))

In graph theory terms, this gives: given a graph $G = (V, E)$, is there any circuit containing every edge $e in E$? (If it is a circuit, then each edge is visited exactly once).

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

=== Fleury's algorithm

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

=== Hamiltonian graphs

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

// TODO: relate to traveling salesman problem, p. 749



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

=== Minimum-weight spanning tree

// TODO move to trees
#definition[
  A *spanning tree* of a connected graph $G$ is a subgraph of $G$ that is a tree and contains all vertices of $G$.
]


#definition[
  A *minimum-weight spanning tree* of a connected weighted graph $G = (V, E, omega)$ is a spanning tree $T = (V, A)$ of $G$ such that $omega(A) = sum_(e in A) omega(e)$ takes the minimum possible value.
]

*Problem 1*: Find a minimum-weight spanning tree of a connected weighted graph $G = (V, E, omega)$.

*Remark.* The number of trees on $n$ vertices grows very rapidly with $n$.

#definition[
  A *greedy algorithm* to solve a given problem is an algorithm such that at every step, it always takes, among all the choices allowed by the problem, the optimum one.
]

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

// == Planar graphs

// // TODO: keep?

// === Definitions

// #definition[
//   A *planar graph* is a graph that can be embedded in the plane: i.e., it can be drawn on the plane in such a way that their edges do not cross each other. A *plane graph* is a graphical representation of a planar graph such that their edges do not cross each other.
// ]

// #definition[
//   A *subdivision* of an edge results from inserting a new vertex into that edge. The subdivision of a graph $G$ is obtained by subdividing one or more edges in $G$.
// ]

// #theorem(title: "Kuratowski, 1930")[
//   A graph is planar if and only if it does not contain a subgraph that is a subdivision of $K_5$ or $K_(3,3)$.
// ]

// === Planar and dual graphs

// #theorem(title: "Euler's formula, 1752")[
//   A plane and connected graph $G = (V, E)$ divides the plane into $R$ regions (or faces), such that
//   $ |V| - |E| + R = 2 $
//   A plane graph (not necessarily connected) divides the plane into $R$ regions, such that
//   $ |V| - |E| + R = 1 + "number of connected components of" G $
// ]

// #definition[
//   Given a plane connected graph $G = (V, E)$, we can define its *dual graph* $G^* = (V^*, E^*)$ in the following way: To each region $f$ of $G$ we associate a dual vertex $f^* in V^*$, and to each edge $e in E$, there corresponds a unique dual edge $e^* in E^*$. If the original edge $e$ is the intersection of two faces $f, h$ (possibly, $f = h$), then the corresponding dual edge $e^*$ is incident with the dual vertices $f^*, g^* in V^*$.
// ]

// - $G^*$ can be drawn in such a way that any dual edge $e^*$ only crosses $e$.
// - Notice that $(G^*)^* = G$.

// === Some corollaries about graph planarity

// #definition[
//   Given a plane graph, the *degree of a region* $r$ is the degree of the dual vertex $r in V^*$ associated with it in the dual graph $G^*$. We denote the degree of the region $r$ as $d_r$ (or $k(r)$).
// ]

// #theorem(title: "Handshake Theorem for the dual graph")[
//   Given a plane connected graph $G$, then
//   $ 2|E| = sum_(r in R) d_r $
//   where $R$ is the set of regions defined on the plane by $G$.
// ]

// #corollary[
//   If $G$ is a simple, connected, and planar graph with $|V| >= 3$, then $|E| <= 3|V| - 6$.
// ]

// #corollary[
//   If $G$ is a simple, connected, and planar graph with $|V| >= 3$ and without cycles of length 3, then $|E| <= 2|V| - 4$.
// ]
