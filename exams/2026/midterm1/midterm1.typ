#import "../../../assets/exam_template.typ": *

#show: doc => exam(
  [Discrete Mathematics],
  [Bachelor in Artificial Intelligence],
  datetime(year: 2026, month: 2, day: 27),
  is_final: false,
  checksum: false,
  doc,
)

_You must show your derivations, with properly-justified steps, in order to be awarded points. You have a maximum of 90 minutes to hand in your exam._


=

Let $S$ be a finite set, and $K subset.eq S$. We define a relation $R$ on $cal(P)(S)$ such that:
$
  forall X, Y in cal(P)(S), X rel Y <=> X triangle Y subset.eq K
$
where $triangle$ denotes the symmetric difference between two sets.

#q(5)[Represent on a Venn diagram the sets $S, K, X "and" Y$ where $X$ and $Y$ are such that $X rel Y$.]

#q(15)[
  Show that $R$ is an equivalence relation.
  _Hint:_ you can use the following identity without proving it:
  $
    X triangle Z = (X triangle Y) triangle (Y triangle Z)
  $
]

#q(10)[
  Considering $S = {a,b,c}$ and $K={c}$, list the equivalence classes defined by $R$ on $cal(P)(S)$.
]


=

We define a function $f : NN without {0,1} -> NN without {0,1}$ such that $f(n) = product_i p_i$, where $p_i$ are all the distinct prime factors of $n$. So for instance, $f(12) = f(2^2 dot 3) = 2 dot 3 = 6$.

#q(10)[
  Is $f$ a properly-defined function?
  Is it injective, surjective, bijective, or none of these?
]

#q(15)[
  Prove that $(A, R)$ is a partially-ordered set, where $A = {4, 6, 7, 9, 14, 15}$ and $R$ is defined as:
  $
    forall a,b in A, a rel b <=> f(a) divides f(b).
  $
]


#q(10)[
  Draw the Hasse diagram for this poset.
  Identify its minimal and maximal elements, and its minimum and maximum, if they exist.
]

#q(5)[
  Find the set of upper and lower bounds in $A$ for $B = {4, 9}$.
]

// #pagebreak()

=

A friend of yours encrypts their text messages using an affine cypher: they encode each letter as a number ($A=0, B=1, dots, Z = 25$), and multiply each of the obtained numbers by some $a in NN$ to encrypt each of them.

#q(5)[
  Write the congruence equation satisfied by the encrypted letter $y$, in function of the input letter $x$.
]

#q(10)[
  Explain, in plain words, how you would decrypt a message which was encrypted this way.
]

#q(15)[
  Decrypt the 3-letter message `25 20 25`, knowing that your friend used $a=7$.
]
