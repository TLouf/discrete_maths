#import "assets/base_template.typ": *

#show: base

= Relations


== Binary Relations on a Set

While we previously introduced relations $R$ from a set $A$ to a set $B$, here we'll be particularly interested in the case where $A = B$, that is relations on a single set.

#definition(title: [Binary relation on a set])[
  A *binary relation* $R$ on the set $A$ is a subset of $A times A$, so: $R subset.eq A times A$.
]


#definition(title: [Reflexive relations])[
  A relation $R$ is reflexive if for every $a in A$, $a rel a$.

  A relation $R$ is irreflexive if for every $a in A$, $a cancel(rel) a$.
]


#definition(title: [Symmetric relations])[
  A relation $R$ is symmetric if $R = R^(-1)$, i.e., if $a rel b ==> b rel a$.

  A relation $R$ is antisymmetric if $(a rel b) and (b rel a) ==> a = b$.
]

== Transitive Relations

#definition[
  A relation $R$ is transitive if $(a rel b) and (b rel c) ==> a rel c$.
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
  A relation $R$ on a set $A$ is an equivalence relation if it is reflexive, symmetric and transitive.
]

*Notation:* If $R$ is an equivalence relation, $a rel b$ is usually denoted as $a equiv b (mod R)$.

#definition[
  Let $R$ be an equivalence relation on a set $A$. The set of all the elements of $A$ related to a certain element $a in A$ is called the equivalence class determined by $a$, and it is denoted as $[a]_R$, or simply as $[a]$. Therefore,
  $ [a]_R = {b in A | a rel b} $
  Any element $b in [a]_R$ (in particular, $a$) is a representative of the equivalence class $[a]_R$.
]

== Quotient Set
// TODO: keep?

#theorem[
  Let $R$ be an equivalence relation on $A$. Then,
  1. $[a]_R$ is non-empty for all $a in A$.
  2. For any two elements $a, b in A$, either $[a]_R = [b]_R$ (and $a rel b$), or $[a]_R inter [b]_R = emptyset$.
  3. The equivalence classes determine the relation uniquely.
]

#theorem[
  Let $R$ be an equivalence relation on $A$. Then the set of all equivalence classes of $R$ form a partition of $A$. Conversely, given a partition ${V_1, V_2, ...}$ of $A$, there exists an equivalence relation $R$ such that its equivalence classes are the sets $V_i$.
]

#definition[
  Let $R$ be an equivalence relation on $A$. The set of all the equivalence classes of $R$ is called the quotient set of $A$ by $R$, and it is denoted by $A\/R$:
  $ A\/R = {[a]_R | a in A} $
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
  A binary relation on a set $A$ is a partial order (or an order relation) if it is reflexive, antisymmetric, and transitive.
]

*Notation:* Order relations are usually denoted by the symbol $prec.eq$.

#definition[
  A set $A$ equipped with an order relation $prec.eq$ is called a partially ordered set $(A, prec.eq)$ (or poset).
]

#definition[
  Let $(A, prec.eq)$ be a partially ordered set. Two elements $a, b in A$ are comparable if either $a prec.eq b$ or $b prec.eq a$. If none of these conditions holds, such elements are incomparable.
]

#definition[
  A partially ordered set $(A, prec.eq)$ is totally ordered when any pair of elements $a, b in A$ are comparable. In this case, $(A, prec.eq)$ is a totally ordered set (or linear order or chain).
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
  Let $(A, prec.eq)$ be a partially ordered set. $M in A$ is a maximal element if for all $a in A$, $M prec.eq a$ implies that $M = a$. $m in A$ is a minimal element if for all $a in A$, $a prec.eq m$ implies that $m = a$. In other words, in the Hasse diagram associated to $(A, prec.eq)$, there is no element above $M$, and no element below $m$.
]

#definition[
  Let $(A, prec.eq)$ be a partially ordered set. $M^star in A$ is a maximum (or greatest element) if $a prec.eq M^star$ for all $a in A$. $m^star in A$ is a minimum (or least element) if $m^star prec.eq a$ for all $a in A$.

  In other words, in the Hasse diagram associated to $(A, prec.eq)$, $M^star$ is above all the elements of $A$, and $m^star$ is below all elements of $A$. The maximum and minimum of $(A, prec.eq)$ are denoted by $max(A)$ and $min(A)$, respectively.
]

*Remark:* The maximal, minimal, greatest, and/or least elements of $(A, prec.eq)$ might not exist.

#theorem[
  The maximum $M^star$ of a partially ordered set $(A, prec.eq)$, if it exists, is unique. In addition, the maximum of $(A, prec.eq)$ is also a maximal element of it.
]

#definition[
  Let $(A, prec.eq)$ be a partially ordered set, and $B subset A$. $u in A$ is an upper bound of $B$ if $b prec.eq u$ for all $b in B$. The set of the upper bounds of $B$ is denoted by $"major"(B)$.

  The supremum of $B$, $sup(B)$, is the least upper element of $B$: $sup(B) = min("major"(B))$.

  $d in A$ is a lower bound of $B$ if $d prec.eq b$ for all $b in B$. The set of all the lower bounds of $B$ is denoted by $"minor"(B)$.

  The infimum of $B$, $inf(B)$, is the greatest lower element of $B$: $inf(B) = max("minor"(B))$.
]

*Remark:* It may happen that $"major"(B) = emptyset$, $"minor"(B) = emptyset$ and/or $sup(B)$ and $inf(B)$ do not exist.

== Total Order Compatible with a Partial Order

#definition[
  A total order $(A, prec.eq_T)$ is compatible with the partial order $(A, prec.eq_P)$ if for all $a, b in A$, $a prec.eq_P b$ implies that $a prec.eq_T b$.
]

#algorithm(
  pseudocode-list(numbered-title: [Topological Sort], booktabs: true)[
    + k = 1
    + while $A != emptyset$
      + $v_k = "a minimal element of" (A, prec.eq_P)$
      + $A <- A \\ {v_k}$
      + $k <- k + 1$
    + $v_1 prec.eq_T v_2 prec.eq_T ... prec.eq_T v_n "is a total order compatible with" (A, prec.eq_P)$.
  ],
)


== Well-Ordered Sets

#definition[
  $(A, prec.eq)$ is a well-ordered set if $(A, prec.eq)$ is a total order and any nonempty subset of $A$ always has a minimum.
]

*Remarks:*
- The set of natural numbers with the usual order $(NN, <=)$ is a well-ordered set. This property is equivalent to the induction principle.
- The totally-ordered set $(ZZ, <=)$ is not a well-ordered set; but as $ZZ$ is isomorphic to $NN$, we can choose another order $prec.eq$ such that $(ZZ, prec.eq)$ is a well-ordered set.

== The Induction Principle for the Natural Numbers

#definition(title: "Induction Principle: Weak Version")[
  Let $P$ be some predicate that satisfies the following conditions:
  1. Base step: $P(1)$ is true.
  2. Inductive step: If $P(k)$ is true for an arbitrary and fixed $k$, then $P(k + 1)$ is true.

  Then, $P(n)$ is true for every $n in NN$.
]

*Remark:* The hypothesis in the inductive step ($P(k)$ is true) is called the induction hypothesis. To perform the inductive step, one assumes the induction hypothesis, and then uses this assumption to prove that $P(k + 1)$ is true.

#definition(title: "Induction Principle: Strong Version")[
  Let $P$ be some predicate that satisfies the following conditions:
  1. Base step: $P(1)$ is true.
  2. Inductive step: Given an arbitrary fixed $k$, if $P(m)$ is true for any $1 <= m <= k$, then $P(k + 1)$ is true.

  Then, $P(n)$ is true for every $n in NN$.
]

#proposition(title: "Strong Induction Principle for Well-Ordered Sets")[
  Let $(A, prec.eq)$ be a well-ordered set, and $P$ be some predicate that satisfies the following conditions:
  1. Base step: $P(v_0)$ is true for $v_0 = min(A)$.
  2. Inductive step: Let $b$ be an arbitrary fixed element of $A$, and let $a$ be its successor. If $P(x)$ is true for all $v_0 prec.eq x prec.eq b$, then $P(a)$ is true.

  Then, $P(a)$ is true for every $a in A$.
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
