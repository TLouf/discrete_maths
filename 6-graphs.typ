#import "assets/theory_template.typ": *
#show: theory

= Graph theory

#fa-book() This chapter overlaps with sections 10.1-4, 10.6, 11.1 and 11.4-5 of Rosen.

#slidebreak()

Why study graphs?
In general, because they help you understand the structure on which interactions play out.
But for now, it's enough to say: _because they look nice_, whether they represent #link("https://www.flowmap.blue/1eZsRuRnUvJ8zU5VARuO5f5joQODvC-Fc8923GQRBrVI?d=0")[mobility flows], #link("https://twitterexplorer.org/try.html")[online social networks], #link("https://www.flowmap.blue/1Pqzc63fDdRVTrgi7u8MtGY1eAHFQjYTGXw_yHomb3DA?d=0")[trade networks] or #link("https://fairinternetreport.com/research/internet-speed-map-single-day")[the internet].

== Defining graphs

=== Basic definitions

#definition(title: [Directed graphs], slide-break: false)[
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
  If $e = {u, v} in E$, we say that $e$ is *incident* on $u$ and $v$, or equivalently, that the two vertices are *adjacent* or *neighbours*.
]

#slidebreak()

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

#notation[
  In an undirected graph $G=(V,E)$, the set of neighbours of $v in V$, also called its *neighbourhood*, is denoted $cal(N) (v)$.
]

#slidebreak()

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

#slidebreak()

Again in a similar fashion to relations, graphs can be represented by an adjacency matrix.

#definition(title: [Adjacency matrix], slide-break: false)[
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

#definition(title: [Bipartite graphs], slide-break: false)[
  A graph $G = (V, E)$ is *bipartite* if its vertex set $V$ can be partitioned into two disjoint subsets $V_1$ and $V_2$ such that every edge in the graph connects a vertex in $V_1$ with a vertex in $V_2$.
]

#slidebreak()

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

#definition(title: [Simple graphs], slide-break: false)[
  A simple graph is an unweighted graph without multi-edges or self-loops.
]

#definition(title: [Subgraphs])[
  The graph $H = (W, F)$ is a *subgraph* of $G = (V, E)$ if its vertex and edge sets are subsets of $G$'s, that is $W subset.eq V$ and $F subset.eq E$.
]


=== Isomorphism of graphs

The same graph can be represented in a number of ways: graphically the vertices are placed arbitrarily on a plane, and in an adjacency matrix, the ordering of vertices is also arbitrary.
Also, if the vertex labels do not carry any particular meaning --i.e. they are "dummy" labels--, the labels too are arbitrary.
It is thus important to be able to recognize the same graph, however it was represented.

#definition(title: [Graph isomorphism])[
  The simple graphs $G_1 = (V_1, E_1)$ and $G_2 = (V_2, E_2)$ are *isomorphic* if and only if there exist a bijective function $f : V_1 -> V_2$ with the following property: $a$ and $b$ are adjacent in $G_1$ if and only if $f(a)$ and $f(b)$ are adjacent in $G_2$. The function $f$ is called an *isomorphism*.
]

#slidebreak()

Some simple tests based on aggregate measures can be used to discard isomorphism between two graphs.

#remark[
  Given two simple graphs $G_1 = (V_1, E_1)$ and $G_2 = (V_2, E_2)$, then
  1. If $|V_1| != |V_2|$, then $G_1$ and $G_2$ are not isomorphic.
  2. If $|E_1| != |E_2|$, then $G_1$ and $G_2$ are not isomorphic.
]

#slidebreak()

#remark[
  $G_1$ and $G_2$ are isomorphic if there exists an invertible linear map (basically a permutation of the "basis vectors") $pi : V_1 -> V_2$ such that $A_2 = P^(-1) dot A_1 dot P$. There are $|V_1|! = |V_2|!$ maps of this type, hence the difficulty of testing for isomorphism if two graphs share many similarities at the aggregate level!
]

== Traversing graphs

The whole point of a graph model is not to only look at binary relationships between pairs of entities represented by edges between pairs of vertices, but to investigate the interconnections over the whole set of vertices, thus including "long-distance relationships".
That is why traversing graphs is crucial, as it can provide us with central information about a graph.

=== Definitions

#definition(title: [Walks on graphs], slide-break: false)[
  A *walk* on a graph $G = (V, E)$ is an alternating sequence of vertices and edges of the form $v_0, e_1, v_1, e_2, v_2, ..., v_(l-1), e_l, v_l$, such that $e_k$ is from $v_(k-1)$ to $v_(k)$ for all $k$.
  It is said to be *closed* if it ends where it starts, so if $v_1 = v_l$, and open otherwise.
  The *length* of the walk is equal to the number of edges in the walk $l$, and is at least one.
] <def-walk>

#slidebreak()

#remark[
  - In an undirected graph, the condition on each edge is $e_k = {v_(k-1), v_k}$, meaning that edges can be traversed in both directions.
  - A walk on a graph without multi-edges can be described more simply by a sequence of vertices, as each edge is uniquely determined by a pair of vertices.
]


#definition[
  A *trail* is a walk with no repeated edge.
  A closed trail is called a *circuit*.

  A *path* is a trail with no repeated vertex, with the potential exception of the first which may also appear as the last in the sequence. A *cycle* is a closed path.
]

#remark[
  The definitions of trails and paths are equivalent on a simple graph.
  In this case, we usually prefer to use the term "path".
]

=== Graph connectivity
// TODO: move to describing graphs?

These definitions allow us to give a basic yet fundamental characteristic of a graph, namely, it connectivity.

#definition(title: [Graph connectedness], slide-break: false)[
  An undirected graph is said to be *connected* if every pair of vertices is connected by a path.
]

#definition[
  A directed graph $G=(V,E)$ is
  - *strongly connected* if for every $u,v in V$, there is a path from $u$ to $v$ and from $v$ to $u$,
  - *weakly connected* if for every $u,v in V$, there is a path between $u$ and $v$ in the underlying undirected graph.
  A strongly or weakly disconnected graph can then be partitioned into strongly and weakly connected components.
]

#slidebreak()

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

When looking at individual vertices instead, their connectivity can be measured by counting the number of walks which connect them.

#theorem[
  Let $G$ be a graph with adjacency matrix $A$ with respect to the ordering $v_1, v_2, ..., v_(|V|)$ of its vertex set.
  The number of distinct oriented walks of length $n >= 1$ that start at $v_i$ and end at $v_j$ is given by the entry $(i, j)$ of the matrix $A^n$.
] <thm-walk-count-adj-power>
// beautiful proof by induction p 723

#slidebreak()

// TODO: reconcile ordering of degree definition
#corollary[
  Let $G$ be a simple graph with adjacency matrix $A$, then
  - $A^2_(i i) = k(i)$ for every $1 <= i <= |V|$.
  - $"tr" A^2 = 2 |E|$.
  - $"tr" A^3 = 6 times$ number of unoriented triangles in $G$.
]

#remark[
  Connectivity between two vertices is better characterised by computing the number of _paths_ joining them.
  However, counting paths is a harder problem.
  // ref 8.7 of Newman
]

=== Shortest paths

A very common problem related to paths is to find the shortest way to go from one vertex to another.
But first, what does "short" mean here?
Let's generalise the notion of path length to weighted graphs.

#definition(title: [Path length])[
  Given a simple, undirected and weighted graph $G = (V, E, omega)$ with positive weights, the length $L(P)$ of a path $P = v_0, e_1, v_1, e_2, v_2 dots, v_(l-1), e_l, v_l$ is the sum of the weights of the edges that it traverses:
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

#slidebreak()

If the path is long, this gets very costly, though.
Also, if the graph is weighted, the shortest path in terms of number of traversed edges is not necessarily the shortest path in terms of edge weights.
That's why we need another method to compute shortest paths, such as Dijkstra's algorithm.

The basic idea of the algorithm is to iteratively explore the graph from the point of view of the starting vertex $s$.
Starting from $s$, in each step we find its next closest vertex, until we've reached $t$.
Crucially though, since shortcuts can sometimes appear, we need to keep track of known or estimated distances throughout the exploration.
Let's proceed on the following example.

#example[
  Find the shortest path from $s$ to $t$ in:
  #figure(
    raw-render(
      ```dot
      graph {
        layout=neato
        node[shape=circle margin=0 fontsize=20]
        edge[labeldistance=2]
        s [pos="0,1!"]
        b [pos="1,2!"]
        c [pos="1,0!"]
        d [pos="3,2!"]
        e [pos="3,0!"]
        t [pos="4,1!"]
        s -- b [label=4]
        s -- c [taillabel=2]
        b -- c [label=1]
        e -- c [label=9]
        d -- b [label=5]
        d -- c [label=8]
        d -- e [label=2]
        d -- t [headlabel=4]
        e -- t [label=3]
      }
      ```,
      width: 7cm,
    ),
  )
]
// do iteratively with a table

#slidebreak()

#algorithm(
  pseudocode-list(numbered-title: [Dijkstra's], booktabs: true)[
    + *procedure* Dijkstra($G=(V, E, omega)$ with $V={s=v_0, v_1, dots, v_n=t}$)
      + for $i = 1$ to $n$
        + $d(s, v_i) = infinity$ #comment[initialise unknown shortest lengths as infinity]
      + $S = emptyset$
      + *while* $t in.not S$ #comment[until we've reached $t$]
        + $u = "a vertex not in" S "with" d(s, u) "minimal"$ #comment[consider the next closest vertex] #line-label(
            <lalg-next-closest>,
          )
        + $S = S union {u}$
        + *for* all $v in cal(N)(u)$ #comment[for all neighbours $v$ of $u$]
          + *if* $d(s, u) + w(u, v) < d(s, v)$ *then* #comment[if going through $u$ creates a shortcut to reach $v$]
            + $d(s, v) = d(s, u) + w(u, v)$ #comment[update the shortest length to reach $v$] #line-label(
                <lalg-dist-update>,
              )
      + *return* $d(s,t)$ #comment[shortest path length from source $s$ to target $t$]
  ],
) <alg-dijkstra>

#slidebreak()

#remark[
  - If at @lalg-next-closest there are several options, we can choose any of them.
  - The sequence of vertices composing the path can be obtained by keeping track of the current best path, or simply of the best predecessor, whenever we reassign $d(a, v)$ in @lalg-dist-update.
  - The shortest path between two vertices is not necessarily unique. It is perfectly possible to have two or more paths of equal length between a given pair of vertices.
]


== Describing graphs
// TODO: add clustering from discussion on transitivity of relation, as in Newman p.183?
// TODO: Mengers theorem p. 139?

=== Degree

A vertex' importance can first be quantified by its degree.

#definition(title: [Vertex in/out-degree], slide-break: false)[
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
  Let's consider a directed graph $G$ and its adjacency matrix $A$ associated to the ordering $v_1, v_2, ..., v_(abs(V))$ of its vertex set $V$.
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

#definition(title: [Vertex degree])[
  The *degree* of a vertex $v in V$ in an undirected graph $G = (V, E)$ is the number of edges incident with it, except that a loop contributes twice to the degree of that vertex. The degree of a vertex $v$ is denoted by $k(v)$.
]

#proposition[
  Let's consider an undirected graph $G$ and its adjacency matrix $A$ associated to the ordering $v_1, v_2, ..., v_(|V|)$ of its vertex set $V$.
  Then:
  $
    forall i in [| 1, abs(V) |], k (v_i) = A_(i i) + sum_j (A_(i j) + A_(j i)) / 2 = A_(i i) + sum_j A_(i j)
  $
] <prop-undir-deg-adj>

#slidebreak()

We can then get a similar result as @prop-handshaking-dir, which is known as the handshaking theorem.

#theorem(title: "The handshaking theorem", slide-break: false)[
  In any undirected graph $G = (V, E)$, we have that
  $ sum_(v in V) k(v) = 2|E| $
]

#slidebreak()

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

#slidebreak()

The notion of degree also allows us to define a very special kind of graph.

#definition(title: [Regular graph], slide-break: false)[
  A *regular graph* is an undirected graph whose vertices all have the same degree.
]

#slidebreak()

The notion of degree also gets naturally generalised to the case of weighted graphs.

#definition(title: [Vertex in/out-strength], slide-break: false)[
  Let $G$ be a weighted directed graph $G = (V, E, omega)$, and let $v in V$ be a vertex of $G$.
  The *in-strength* $s^(("in")) (v)$ of $v$ is the sum of the weights of edges whose head is $v$.
  The *out-strength* $s^(("out")) (v)$ of $v$ is the sum of the weights of edges whose tail is $v$.
]

#definition(title: [Vertex strength])[
  Let $G$ be a weighted undirected graph $G = (V, E, omega)$, and let $v in V$ be a vertex of $G$.
  The *strength* $s (v)$ of $v$ is the sum of the weights of edges adjacent to $v$, except that a loop contributes its weight twice.
]

@prop-dir-deg-adj then also holds for strengths in weighted directed graphs, and @prop-undir-deg-adj for those in weighted undirected ones.

#slidebreak()

These measures, degree and strength, are very local in nature, and thus may not represent the importance of a vertex in the context of the whole graph.

=== Eigenvector centrality

A first way to provide more global information to quantify a vertex' importance is to consider that a vertex should be considered more important not only the more neighbours it has, but also the more important these neighbours are.

#slidebreak()

That is how we define the eigenvector centrality $x(u)$ of a vertex $u$ in an undirected graph: it's proportional to the sum of the centralities of its neighbours:
$
  x(u) = c^(-1) sum_(v in cal(N) (u)) x(v),
$
where $c in RR^+$ is a constant.

#slidebreak()

Rewriting this equality for every vertex, and involving the adjacency matrix $A$ of the graph, we get
$
  x = c^(-1) A x <=> A x = c x,
$
where $x$ is a vector of centrality scores, which is an eigenvector of $A$ associated to the eigenvalue $c$!
And from the Perron-Frobenius theorem from linear algebra, we know that since $A$ has non-negative values, if we want our centralities to all be non-negative, $c$ must be the largest eigenvalue.

#definition(title: [Eigenvector centrality])[
  Given a simple undirected graph represented by an adjacency matrix $A$, the eigenvector centrality of vertex $i$ is the $i^"th"$ element of one of $A$'s leading eigenvectors.
]

#slidebreak()

#remark[
  - The point of centralities is to compare vertices, so the same eigenvector should be considered for all nodes!
  - To generalise to directed networks, some small tweaks are needed: see Sections 7.1.2-3 in Newman.
]


=== Betweenness centrality

A second way to account for the global graph context to quantify a vertex' centrality is to use shortest paths.

#definition(title: [Vertex betweenness: simple], slide-break: false)[
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

#definition(title: [Edge betweenness], slide-break: false)[
  The betweenness centrality of an edge is the number of shortest paths passing through it, where we consider paths between all connected vertex pairs, weighting multiple shortest paths appropriately.
]

#slidebreak()

#remark[
  This edge centrality is linked to the #link("https://smg.media.mit.edu/library/Granovetter.WeakTies.pdf")["strength of weak ties" theory formulated by the sociologist Mark Granovetter], which suggests that weak social relationships are central for the diffusion of information in a network (in very rough terms).
]

=== Graph size

The size of a graph can be simply considered to be its number of vertices and edges, but this gives little information.
Indeed, it does not say how far away vertices are from each other in the graph.
For that, we can look into the lengths of shortest paths, and for instance compute the average shortest path length.

#slidebreak()

Alternatively, we can consider its longest shortest path.

#definition(title: [Graph diameter], slide-break: false)[
  The diameter of a graph is the length of its longest shortest path, or in other words, the distance between its farthest vertices, in terms of shortest path length.
]

#slidebreak()

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

#slidebreak()

#proposition[
  For simple undirected graphs,
  $
    rho = (2 m) / (n ( n-1)).
  $
]



== Trees

A tree is a special kind of graph which is useful in many applications, especially in computer science.

=== Definitions

#definition(title: [Tree], slide-break: false)[
  A *tree* is a simple connected and undirected graph with no cycles.
  A *forest* is a simple undirected graph with no cycles. Each connected component of a forest is a tree.
]

#slidebreak()

The natural way to represent a tree is to pick one of its vertices as its *root*, and place it at its top, with a branching structure going down.
The vertices at the bottom are then called *leaves*, as they are the extremities of the tree represented thus.

#slidebreak()

#example[
  Here is how the same tree can be represented when non-rooted (lefft) and when rooted on $1$ (right).
  #figure(
    grid(
      columns: 2,
      column-gutter: 2em,
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
        width: 80%,
      ),
      raw-render(
        ```dot
        graph {
          layout=neato
          start=10
          node[shape=circle fontsize=24 margin=0]
          1[pos="3,4!"]
          2[pos="5,3!"]
          4[pos="6,2!"]
          5[pos="4,2!"]
          6[pos="5,1!"]
          7[pos="7,1!"]
          3[pos="1,3!"]
          8[pos="0,2!"]
          9[pos="1,2!"]
          10[pos="2,2!"]
          11[pos="2,1!"]
          1 -- {2, 3};
          2 -- {4, 5};
          4 -- {6, 7};
          3 -- {8,9,10};
          10 -- 11;
        }
        ```,
        width: 80%,
      ),
    ),
  )
]

#slidebreak()

#example[
  Computer file systems are organized as trees with a natural root called the root directory `/`.
  #figure(
    raw-render(
      ```dot
      graph {
        layout=neato
        start=10
        node[shape=none fontsize=24 margin=0]
        1[pos="3,4!" label="\/"]
        2[pos="5,3!" label="usr"]
        4[pos="6,2!" label="bin"]
        5[pos="4,2!" label="share"]
        6[pos="5,1!" label="firefox"]
        7[pos="7,1!" label="typst"]
        3[pos="1,3!" label="home"]
        8[pos="0,2!" label="Alice"]
        9[pos="1,2!" label="Bob"]
        10[pos="2,2!" label="Eve"]
        11[pos="2,1!" label="file.pdf"]
        1 -- {2, 3};
        2 -- {4, 5};
        4 -- {6, 7};
        3 -- {8,9,10};
        10 -- 11;
      }
      ```,
      width: 50%,
    ),
  )
  What do leaves and non-leave vertices correspond to in this case?
]

#slidebreak()

The most important property of trees follows.

#theorem(slide-break: false)[
  A graph $G = (V, E)$ is a tree if and only if there exists a unique path between any pair of vertices.
]

It comes naturally from the fact that if we add a second path between any pair of vertices of a tree, we create a cycle.
It is central because it means many problems are very simple on trees, notably those related to shortest paths.

#theorem[
  1. The simple graph $G$ is a tree if and only if it is connected and, if we remove any edge, we obtain a disconnected graph.
  2. The simple graph $G$ is a tree if and only if it does not contain any cycles and, if we add any edge, we create a cycle.
]

#slidebreak()

A tree can therefore only be grown by adding a vertex and an edge connecting an existing vertex to this new one.
More specifically, to grow a tree:
1. Start from the trivial tree $T = ({r}, emptyset)$, where $r$ is the root vertex.
2. Given $T = (V, E)$, add a new vertex $u$ and a new edge ${u, v}$ where $v in V$.

#theorem[
  Any graph obtained by using the preceding procedure is a tree, and any tree can be obtained in this way.
]

The validity of this growing procedure also leads to the following property, which follows by induction.

#theorem[
  Any tree with $n$ vertices has $n - 1$ edges.
] <thm-tree-nr-edges>

And the converse is also true!
If we suppose a connected graph with $n$ vertices and $n-1$ edges is not a tree, then it means we can remove edges from this graph to destroy existing cycles, and thus create a tree, which would have fewer than $n-1$ edges, which contradicts the above theorem.

#theorem[
  If $G$ is a simple undirected graph with $n$ vertices, then the following statements are equivalent:
  1. $G$ is a tree.
  2. $G$ is connected and has $n - 1$ edges.
  3. $G$ has $n - 1$ edges and does not contain any cycle.
]

// TODO: add decision tree as application, p. 796?

=== Spanning trees

#definition(title: [Spanning tree], slide-break: false)[
  A *spanning tree* of a connected graph $G$ is a subgraph of $G$ that is a tree containing all vertices of $G$.
]

#slidebreak()

The most basic way to build a spanning tree is to remove edges from a graph to destroy its cycles, without removing vertices.
This idea is the basis on which we can prove the following.

#theorem(slide-break: false)[
  A simple graph is connected if and only if it has a spanning tree.
]

#slidebreak()

Identifying cycles can be computationally hard, hence the need for other algorithms, such as breadth-first search.
The idea of the algorithm is to explore the graph iteratively, starting from a root vertex
At each step, we consider all the neighbours of the vertices added to the tree in the previous step.
A neighbour and its associated edge are then added to the spanning tree only if the vertex is not already present.

#slidebreak()

The reason it's called breadth-first can be directly understood from the figure below: at each step shown in a distinct shade of grey, we add all vertices of a given level to the tree, thus obtaining its full "breadth" at this level.

#figure(
  grid(
    columns: 2,
    column-gutter: 1em,
    raw-render(
      ```dot
      graph {
        layout=neato
        start=8
        node[style=filled shape=circle fontsize=24 margin=0]
        a [fillcolor="#00000088"]
        subgraph {
          node [fillcolor="#00000055"]
          b;c;
        }
        subgraph {
          node [fillcolor="#00000022"]
          d;e;i;j;h
        }
        subgraph {
          node [fillcolor="#ffffff"]
          g;f;k;
        }
        a -- {b, c};
        b -- {d, e};
        d -- {f, g};
        c -- {h,i,j};
        e -- {g,d}
        j -- {i, k};
        k -- h;
      }
      ```,
      width: 100%,
    ),
    raw-render(
      ```dot
      graph {
        layout=neato
        node[shape=circle style=filled fontsize=24 margin=0]
        a [fillcolor="#00000088"]
        subgraph {
          node [fillcolor="#00000055"]
          b;c;
        }
        subgraph {
          node [fillcolor="#00000022"]
          d;e;i;j;h
        }
        subgraph {
          node [fillcolor="#ffffff"]
          g;f;k;
        }
        a[pos="3,4!"]
        b[pos="5,3!"]
        d[pos="4,2!"]
        e[pos="6,2!"]
        f[pos="3,1!"]
        g[pos="5,1!"]
        c[pos="1,3!"]
        h[pos="0,2!"]
        i[pos="1,2!"]
        j[pos="2,2!"]
        k[pos="0,1!"]
        a -- {b, c};
        b -- {d, e};
        d -- {f, g};
        c -- {h,i,j};
        h -- k;
      }
      ```,
      width: 100%,
    ),
  ),
)
It can be formally written as follows.
#algorithm(
  pseudocode-list(numbered-title: [Breadth-first search (BFS)], booktabs: true)[
    + *procedure* BFS($G=(V,E)$: connected graph with $V={v_1, v_2, dots, v_n}$)
      + $T = (V_T, E_T) = ({v_1}, emptyset)$ #comment[pick a root $v_1$ and initialise the tree]
      + $S_p = {v_1}$ #comment[set of vertices previously added to $T$]
      + *while* $abs(S_p)$ > 0 #comment[while we have vertices to consider]
        + $S_n = emptyset$ #comment[set of vertices to consider next]
        + *for* each $v in S_p$ #comment[for each vertex previously added to $T$]
          + *for* each $w in cal(N) (v) without V_T$ #comment[for all $v$'s neighbours not already in $T$]
            + $T = (V_T union {w}, E_T union {{v,w}})$ #comment[add it to the tree]
            + $S_n = S_n union {w}$ #comment[consider $w$'s neighbours at the next step]
        + $S_p = S_n$
      + *return* $T$ #comment[spanning tree]
  ],
)

#slidebreak()

#remark[
  We already saw a variant of breadth-first search: Dijkstra's algorithm (@alg-dijkstra)!
]

#slidebreak()

We can also produce a spanning tree of a simple graph by the use of depth-first search.
The idea here is to form the tree by forming the longest paths possible at each step.
A first path starting from an arbitrary root is formed, until no more vertices can be added.
The vertices and edges composing this path are added to the tree.
We then backtrack through the path until we find a vertex from which we can start a second path.
The same procedure as before is repeated, and the backtracking as well until all vertices were added to the tree.

#slidebreak()

We show on the figure below the tree resulting from a depth-first search carried out on the same graph as above.
On the right-hand side vertex labels indicate the order in which they were added.
The reason it's called depth-first can be directly understood from this figure: the tree is formed by forming branches which are as deep as possible, given the choices made during path formation.

#figure(
  grid(
    columns: 2,
    raw-render(
      ```dot
      graph {
        layout=neato
        node[shape=circle fontsize=24 margin=0]
        a[pos="2.5,4!"]
        b[pos="4,3!"]
        d[pos="4,2!"]
        e[pos="5,0!"]
        f[pos="3,1!"]
        g[pos="5,1!"]
        c[pos="1,3!"]
        j[pos="1,2!"]
        h[pos="2,0!"]
        k[pos="2,1!"]
        i[pos="0,1!"]
        a -- {b, c};
        b -- {d};
        d -- {f, g};
        e -- g;
        c -- j;
        j -- {i,k};
        k -- h;
      }
      ```,
      width: 90%,
    ),
    raw-render(
      ```dot
      graph {
        layout=neato
        node[shape=circle fontsize=24 margin=0]
        a[pos="2.5,4!" label="1"]
        b[pos="4,3!" label="7"]
        d[pos="4,2!" label="8"]
        e[pos="5,0!" label="11"]
        f[pos="3,1!" label="9"]
        g[pos="5,1!" label="10"]
        c[pos="1,3!" label="2"]
        h[pos="2,0!" label="6"]
        i[pos="0,1!" label="4"]
        j[pos="1,2!" label="3"]
        k[pos="2,1!" label="5"]
        a -- {b, c};
        b -- {d};
        d -- {f, g};
        e -- g;
        c -- j;
        j -- {i,k};
        k -- h;
      }
      ```,
      width: 90%,
    ),
  ),
)

#algorithm(
  pseudocode-list(numbered-title: [Depth-first search (DFS)], booktabs: true)[
    + *procedure* DFS($G=(V,E)$: connected graph with $V={v_1, v_2, dots, v_n}$)
      + $T = (V_T, E_T) = ({v_1}, emptyset)$ #comment[pick a root $v_1$ and initialise the tree]
      + visit($v_1$)
      + *return* $T$ #comment[spanning tree]
    + *procedure* visit($v: v in V$)
      + *for* each $w in cal(N) (v) without V_T$ #comment[for each neighbour of $v$ not already in $T$]
        + $T = (V_T union {w}, E_T union {{v,w}})$ #comment[add it to the tree]
        + visit($w$) #comment[visit its neighbours]
  ],
)

#slidebreak()

// TODO: show cut vertex application?
Both algorithms can be used as the basis for algorithms that solve many different problems.
For example, they can be used to find paths and circuits in a graph, to determine the connected components of a graph, or to find the cut vertices of a connected graph.


=== Minimum-weight spanning trees

A graph may admit many spanning trees, all with the same number of edges according to @thm-tree-nr-edges, so a priori equivalent.
However, for weighted graphs, some might be more optimal, in a certain sense.

#definition(slide-break: false)[
  A *minimum-weight spanning tree* of a connected weighted graph $G = (V, E, omega)$ is a spanning tree $T = (V, A)$ of $G$ such that $omega(A) = sum_(e in A) omega(e)$ takes the minimum possible value.
]

Thus, if the weights encode some form of cost to traverse edges, as in the shortest path problem, finding a minimum-weight spanning tree gives an optimal way to fully traverse a graph.

// #example[
//   TODO
// ]

#definition[
  A *greedy algorithm* to solve a given problem is an algorithm that when presented with a choice, always selects what seems to be the best option at this given moment.
]

#remark[
  There is no guarantee that selecting the best option at each step, so the one that's best _locally_, leads to a _globally_ optimal solution in the end.
]

#slidebreak()

The two algorithms we will present below are greedy, but actually lead to an optimal solution!

The first is Prim's algorithm: it starts by adding any edge with smallest weight to the spanning tree.
It then successively add edges of minimum weight that are incident to a vertex already in the tree, all the while avoiding to form cycles.
It can stop once the tree is spanning, that is, once it has $abs(V)-1$ edges, following @thm-tree-nr-edges.

#slidebreak()

#algorithm(
  pseudocode-list(numbered-title: [Prim's algorithm], booktabs: true)[
    + *procedure* Prim($G=(V,E, omega)$: connected weighted graph with $V={v_1, v_2, dots, v_n}$)
      + $T = (V_T, E_T) = ({v_(k_0), v_(j_0)}, {{v_(k_0), v_(j_0)}})$ where $omega({v_(k_0), v_(j_0)})$ is minimum.
      + *for* $i = 1$ to $n - 2$
        + $e_(i) = {v_(k_i), v_(j_i)}$ edge of minimum weight that doesn't form cycles and such that $v_(k_i) in V_T$.
        + $T = (V_T union {v_(k_i)}, E_T union {e_(i)})$
      + *return* $T$ #comment[minimum-weight spanning tree]
  ],
)

But an #link("https://upload.wikimedia.org/wikipedia/commons/9/9b/PrimAlgDemo.gif")[image] is worth a thousand words.

#slidebreak()

#theorem[
  Given a connected weighted graph $G = (V, E, omega)$, Prim's algorithm produces a minimum-weight spanning tree of $G$.
]

#slidebreak()

Kruskal's algorithm, on the other hand, starts with a tree comprising all vertices.
It then iterates through the list of edges sorted by weight, and adds it to the tree if it does not form a cycle.
It stops when $abs(V)-1$ edges have been added.

#slidebreak()

#algorithm(
  pseudocode-list(numbered-title: [Kruskal's algorithm], booktabs: true)[
    + *procedure* Kruskal($G=(V,E, omega)$: connected weighted graph
      + $T = (V_T, E_T) = (V, emptyset)$
      + Place the edges by increasing weight into a list $L$
      + *for* each $e$ in $L$
        + *if* $e$ does not form a cycle when added to $T$
          + $T = (V, E_T union {e})$
      + *return* $T$ #comment[minimum-weight spanning tree]
  ],
)

Again, an #link("https://upload.wikimedia.org/wikipedia/commons/b/bb/KruskalDemo.gif")[image] is worth a thousand words.


#theorem[
  Given a connected weighted graph $G = (V, E, omega)$, Kruskal's algorithm produces a minimum-weight spanning tree of $G$.
]

#slidebreak()

#remark[
  In both cases,
  - more than one edge may have the same weight,
  - which means that the minimum-weight spanning tree might not be unique.
]
