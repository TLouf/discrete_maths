#import "../../../../assets/exam_template.typ": *

#show: doc => exam(
  [Discrete Mathematics],
  [Bachelor in Data Science and Engineering],
  datetime(year: 2026, month: 5, day: 15),
  is_final: true,
  checksum: false,
  doc,
)

_You must show your derivations, with properly-justified steps, in order to be awarded points. Counting results can be given in terms of factorials, powers and binomial coefficients. You have a maximum of two hours and a half to hand in your exam._


=

We define a sequence $(x_n)_(n in NN)$ by the following recurrence relation:
$
  forall n in NN, x_(n+1) equiv (a x_n) (mod p), quad x_0 = 2,
$
where $a in NN^*$ and $p$ is a prime number such that $p divides.not a$.

#q(5)[
  Taking $p=7$ and $a=3$, compute its terms up to $x_6$.
]

#q(10)[
  Provide a closed form for the sequence defined as
  $
    forall n in NN, y_(n+1) = a y_n, quad y_0 = x_0,
  $
  and prove by induction that
  $
    forall n in NN, x_(n+1) equiv (a y_n) (mod p).
  $
]


#q(10)[
  The period length for such sequences is defined as the number of terms after which the sequence repeats.
  What is the period length of $(x_n)$, for general values of $p$ and $a$?
]

=

Let $G = (V, E)$ be a simple directed graph which does not contain any cycle.
We define a relation $prec.curly.eq$ as follows:
$
  forall u,v in V, u prec.curly.eq v <=> "there is a path from" u "to" v.
$

#q(10)[
  Prove that $(V, prec.curly.eq)$ is a partially ordered set.
]

#q(10)[
  For the graph shown below, draw the Hasse diagram of $(V, prec.curly.eq)$, identify the minimal and maximal elements, and the maximum and minimum, if they exist.

  #figure(
    raw-render(
      ```dot
      digraph {
        layout=neato
        start=2
        node[shape=circle margin=0 fontsize=20]
        1 -> 3;
        2 -> {3, 4, 5};
        3 -> {5, 6};
        5 -> 7;
        6 -> 7;
        }
      ```,
      width: 4cm,
    ),
  )
]

#q(10)[
  Which constraint on $G$ should be dropped for the relation $R$ given below to be an equivalence relation? Provide a proof for your answer.
  $
    forall u,v in V, u rel v <=> (u prec.curly.eq v) "and" (v prec.curly.eq u).
  $
]

#q(5)[
  Provide a simple interpretation of $R$'s equivalence classes.
]

=


We define the algorithm `algo1` as:
#algorithm(
  pseudocode-list(booktabs: true)[
    + *procedure* `algo1` ($G=(V, E, omega)$: undirected, weighted graph)
      + $T = (V_T, E_T) "with" V_T = V "and" E_T = E$
      + *while* $E != emptyset$
        + $e^* = display(argmax_(e in E)) omega(e)$
        + $E = E without {e^*}$
        + *if* removing $e^*$ from $T$ does not increase its number of connected components
          + $E_T = E_T without {e^*}$
      + *return* $T$
  ],
)

#q(10)[
  Apply this algorithm, writing each step explicitly, to the graph $G$ defined by the adjacency matrix:
  $
    A_G = mat(
      0, 3, 2, 0, 0, 0;
      3, 0, 2, 5, 1, 0;
      2, 2, 0, 0, 3, 5;
      0, 5, 0, 0, 0, 4;
      0, 1, 3, 0, 0, 0;
      0, 0, 5, 4, 0, 0;
    )
  $
]

#q(10)[
  What would be the output of Prim's algorithm if applied to a disconnected graph?
  What is then the advantage of `algo1` over Prim?
]


=

Below is a watchlist composed of 15 movies equally divided between three genres.

#figure(
  table(
    columns: 6,
    align: left,
    table.cell(rowspan: 5)[*Action*],
    [Sinners],
    table.cell(rowspan: 5)[*Drama*],
    [Sentimental Value],
    table.cell(rowspan: 5)[*Comedy*],
    [Wild Tales],
    [Fallen Angels],
    [Shoplifters],
    [Being John Malkovich],
    [Baby Driver],
    [Happy as Lazzaro],
    [Day for Night],
    [Kill Bill: Vol.1],
    [Thelma and Louise],
    [The Big Lebowski],
    [Kill Bill: Vol.2],
    [Portrait of a Lady on Fire],
    [Frances Ha],
  ),
)

#q(5)[
  The term is ending and you start planning a trip, during which you'll be offline most of the time.
  You want to take some movies with you from the list, but you can only take 5 of them.
  In how many ways can you select these 5 movies, knowing that if one of the two Kill Bill movies is included, the other should too?
]

#q(15)[
  After watching these 15 movies, you want to rank them.
  How many top-5 rankings are possible, assuming you want to include at least one movie from each genre?
  What if you're also allowed to include at most one tie, meaning, to give the same rank to $2$ movies out of $5$?
]


// Consideremos el conjunto X = {0, 1, 2, 3, 4, 5, 6, 9} (omitiendo el 7 y
// el 8). ¿Cuántas cadenas, formadas con las cifras de X , de longitud n hay cuya
// suma de cifras sea congruente con 1 (mód 3)?


// #q(10)[
//   Prove that any tree with $n$ vertices has exactly $n-1$ edges, using a strong induction on $n >= 1$.
// ]
