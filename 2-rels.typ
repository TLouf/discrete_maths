#import "assets/base_template.typ": *

#show: base

= Relations

== Binary Relations

1. *Binary relations*:
  - Definitions.
  - Graphical representation of a relation.
  - Operations with relations.
  - Properties.
2. *Equivalence relations*:
  - Equivalence classes.
  - Quotient set.
3. *Order relations*.

== Binary Relations on a Set

#definition[
  A *binary relation* $R$ on the set $V$ is a subset of the Cartesian product $V times V$. Hence, $R subset.eq V times V$. The *domain* of $R$ is the set:
  $ "Dom" R = {v in V | (v, w) in R "for some" w in V} $
  and the *image* of $R$ is the set:
  $ "Im" R = {w in V | (v, w) in R "for some" v in V} $
]

== Properties of Relations on a Set $V$

#definition[
  A relation $R$ is reflexive if for every $v in V$, $v R v$.
]

#definition[
  A relation $R$ is irreflexive if for every $v in V$, $v R v$ does not hold.
]

#definition[
  A relation $R$ is symmetric if $R = R^(-1)$, i.e., if $v R w ==> w R v$.
]

#definition[
  A relation $R$ is antisymmetric if $(v_1 R v_2) and (v_2 R v_1) ==> v_1 = v_2$.
]

== Transitive Relations

#definition[
  A relation $R$ is transitive if $(v_1 R v_2) and (v_2 R v_3) ==> v_1 R v_3$.
]

#proposition[
  A relation $R$ is transitive if and only if $R^n subset.eq R$ for all $n in NN$. The $n$-th power $R^n$ of the relation $R$ is recursively defined as follows:
  $ R^1 = R, quad R^n = R circle R^(n-1) $
]

#corollary[
  A relation $R$ is transitive if and only if $R^2 subset.eq R$. In other words, $R$ is transitive if and only if for each nonzero entry $(A_(R^2))_(i,j) = 1$ of the adjacency matrix of $R^2$, the corresponding entry of the adjacency matrix of $R$ is also nonzero $(A_R)_(i,j) = 1$.
]

== Equivalence Relations
// One example why modulo stuff should be before relations
#definition[
  A relation $R$ on a set $V$ is an equivalence relation if it is reflexive, symmetric and transitive.
]

*Notation:* If $R$ is an equivalence relation, $a R b$ is usually denoted as $a equiv b (mod R)$.

#definition[
  Let $R$ be an equivalence relation on a set $V$. The set of all the elements of $V$ related to a certain element $v in V$ is called the equivalence class determined by $v$, and it is denoted as $[v]_R$, or simply as $[v]$. Therefore,
  $ [v]_R = {w in V | v R w} $
  Any element $w in [v]_R$ (in particular, $v$) is a representative of the equivalence class $[v]_R$.
]

== Quotient Set
// TODO: keep?

#theorem[
  Let $R$ be an equivalence relation on $V$. Then,
  1. $[a]_R$ is non-empty for all $a in V$.
  2. For any two elements $a, b in V$, either $[a]_R = [b]_R$ (and $a R b$), or $[a]_R inter [b]_R = emptyset$.
  3. The equivalence classes determine the relation uniquely.
]

#theorem[
  Let $R$ be an equivalence relation on $V$. Then the set of all equivalence classes of $R$ form a partition of $V$. Conversely, given a partition ${V_1, V_2, ...}$ of $V$, there exists an equivalence relation $R$ such that its equivalence classes are the sets $V_i$.
]

#definition[
  Let $R$ be an equivalence relation on $V$. The set of all the equivalence classes of $R$ is called the quotient set of $V$ by $R$, and it is denoted by $V\/R$:
  $ V\/R = {[v]_R | v in V} $
]


= Order Relations

1. Order relations:
  - Partially ordered sets.
  - Hasse diagrams.
  - Maximal elements.
  - Totally ordered sets.
  - Well-ordered sets and mathematical induction.

== Partial Order Relations

#definition[
  A binary relation on a set $V$ is a partial order (or an order relation) if it is reflexive, antisymmetric, and transitive.
]

*Notation:* Order relations are usually denoted by the symbol $prec.eq$.

#definition[
  A set $V$ equipped with an order relation $prec.eq$ is called a partially ordered set $(V, prec.eq)$ (or poset).
]

#definition[
  Let $(V, prec.eq)$ be a partially ordered set. Two elements $a, b in V$ are comparable if either $a prec.eq b$ or $b prec.eq a$. If none of these conditions holds, such elements are incomparable.
]

#definition[
  A partially ordered set $(V, prec.eq)$ is totally ordered when any pair of elements $a, b in V$ are comparable. In this case, $(V, prec.eq)$ is a totally ordered set (or linear order or chain).
]

== Hasse Diagrams (1926)

// TODO: haven/t seen graphs until now
The directed graph associated to an order relation $prec.eq$ can be simplified by eliminating redundant elements.

*Algorithm to obtain the Hasse diagram for a partial order $prec.eq$:*
1. As $prec.eq$ is reflexive, there is a loop incident with each vertex. We eliminate all these loops.
2. The transitivity of $prec.eq$ implies the existence of subgraphs of the following type: If $a prec.eq b$ and $b prec.eq c$, we eliminate the superfluous edge associated to $a prec.eq c$.
3. We choose that all the oriented edges point upwards. Then, we eliminate all the arrows.

== Extremal Elements

#definition[
  Let $(V, prec.eq)$ be a partially ordered set. $M in V$ is a maximal element if for all $v in V$, $M prec.eq v$ implies that $M = v$. $m in V$ is a minimal element if for all $v in V$, $v prec.eq m$ implies that $m = v$. In other words, in the Hasse diagram associated to $(V, prec.eq)$, there is no element above $M$, and no element below $m$.
]

#definition[
  Let $(V, prec.eq)$ be a partially ordered set. $M^star in V$ is a maximum (or greatest element) if $v prec.eq M^star$ for all $v in V$. $m^star in V$ is a minimum (or least element) if $m^star prec.eq v$ for all $v in V$.

  In other words, in the Hasse diagram associated to $(V, prec.eq)$, $M^star$ is above all the elements of $V$, and $m^star$ is below all elements of $V$. The maximum and minimum of $(V, prec.eq)$ are denoted by $max(V)$ and $min(V)$, respectively.
]

*Remark:* The maximal, minimal, greatest, and/or least elements of $(V, prec.eq)$ might not exist.

#theorem[
  The maximum $M^star$ of a partially ordered set $(A, prec.eq)$, if it exists, is unique. In addition, the maximum of $(A, prec.eq)$ is also a maximal element of it.
]

#definition[
  Let $(V, prec.eq)$ be a partially ordered set, and $B subset V$. $u in V$ is an upper bound of $B$ if $b prec.eq u$ for all $b in B$. The set of the upper bounds of $B$ is denoted by $"major"(B)$.

  The supremum of $B$, $sup(B)$, is the least upper element of $B$: $sup(B) = min("major"(B))$.

  $d in V$ is a lower bound of $B$ if $d prec.eq b$ for all $b in B$. The set of all the lower bounds of $B$ is denoted by $"minor"(B)$.

  The infimum of $B$, $inf(B)$, is the greatest lower element of $B$: $inf(B) = max("minor"(B))$.
]

*Remark:* It may happen that $"major"(B) = emptyset$, $"minor"(B) = emptyset$ and/or $sup(B)$ and $inf(B)$ do not exist.

== Total Order Compatible with a Partial Order

#definition[
  A total order $(V, prec.eq_T)$ is compatible with the partial order $(V, prec.eq_P)$ if for all $v, w in V$, $v prec.eq_P w$ implies that $v prec.eq_T w$.
]

#algorithm(
  pseudocode-list(numbered-title: [Topological Sort], booktabs: true)[
    + k = 1
    + while $V != emptyset$
      + $v_k = "a minimal element of" (V, prec.eq_P)$
      + $V <- V \\ {v_k}$
      + $k <- k + 1$
    + $v_1 prec.eq_T v_2 prec.eq_T ... prec.eq_T v_n "is a total order compatible with" (V, prec.eq_P)$.
  ],
)


== Well-Ordered Sets

#definition[
  $(V, prec.eq)$ is a well-ordered set if $(V, prec.eq)$ is a total order and any nonempty subset of $V$ always has a minimum.
]

*Remarks:*
- The set of natural numbers with the usual order $(NN, <=)$ is a well-ordered set. This property is equivalent to the induction principle.
- The totally-ordered set $(ZZ, <=)$ is not a well-ordered set; but as $ZZ$ is isomorphic to $NN$, we can choose another order $prec.eq$ such that $(ZZ, prec.eq)$ is a well-ordered set.

== The Induction Principle for the Natural Numbers

#definition(title: "Induction Principle: Weak Version")[
  Let $P$ be some property that satisfies the following conditions:
  1. Base step: $P(1)$ is true.
  2. Inductive step: If $P(k)$ is true for an arbitrary and fixed $k$, then $P(k + 1)$ is true.

  Then, $P(n)$ is true for every $n in NN$.
]

*Remark:* The hypothesis in the inductive step ($P(k)$ is true) is called the induction hypothesis. To perform the inductive step, one assumes the induction hypothesis, and then uses this assumption to prove that $P(k + 1)$ is true.

#definition(title: "Induction Principle: Strong Version")[
  Let $P$ be some property that satisfies the following conditions:
  1. Base step: $P(1)$ is true.
  2. Inductive step: Given an arbitrary fixed $k$, if $P(m)$ is true for any $1 <= m <= k$, then $P(k + 1)$ is true.

  Then, $P(n)$ is true for every $n in NN$.
]

#proposition(title: "Strong Induction Principle for Well-Ordered Sets")[
  Let $(V, prec.eq)$ be a well-ordered set, and $P$ be some property that satisfies the following conditions:
  1. Base step: $P(v_0)$ is true for $v_0 = min(V)$.
  2. Inductive step: Let $w$ be an arbitrary fixed element of $V$, and let $v$ be its successor. If $P(x)$ is true for all $v_0 prec.eq x prec.eq w$, then $P(v)$ is true.

  Then, $P(v)$ is true for every $v in V$.
]

// TODO: recursion?

== Summary: Types of Relations

#table(
  columns: 6,
  align: center,
  toprule(),
  table.header(
    [*Relation*], [*Reflexive*], [*Symmetric*], [*Antisymmetric*], [*Transitive*], [*Additional Properties*]
  ),
  midrule(), [Equivalence], [✅], [✅], [❌], [✅],
  [], [Order], [✅], [❌], [✅], [✅],
  [], [Total order], [✅], [❌], [✅], [✅],
  [Every pair is comparable], [Well-ordered set], [✅], [❌], [✅], [✅],
  [Every nonempty subset has a minimum], bottomrule(),
)
