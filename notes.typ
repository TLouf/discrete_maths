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
// counting (Rosen 6.) -> proba (Rosen 7.) (perspective only?)
// advanced counting (Rosen 8.)
// number theory (Rosen 4.) -> crypto, RNG
// partial exam
// graph theory: application of everything


// AI BSc have logic course but DS BSc don't!

// boolean algebra? introduce from parallel between set relations and logical operations as in Epp?

#include "1-sets.typ"
#colbreak()
#include "2-ints.typ"
#colbreak()

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


= Counting

The *goal of counting* is basically to determine the cardinality of certain finite sets.

#definition[
  Two sets $A$ and $B$ have the same cardinality if and only if there exists a *bijective function* $f : A -> B$.
]

#definition[
  A set that is either finite or has the same cardinality as the set $NN$ is called *countable*.
]


== Basic Counting Principles

1. *The sum rule*: if $A inter B = emptyset$, then $|A union B| = |A| + |B|$.
2. *The product rule*: $|A times B| = |A| dot |B|$.
3. *The inclusion-exclusion principle*: $|A union B| = |A| + |B| - |A inter B|$.
4. *The pigeonhole principle*. (See problem set.)

== The Sum Principle

#proposition(title: "The sum principle v1")[
  If $A$ and $B$ are two finite and disjoint sets $A inter B = emptyset$, then
  $ |A union B| = |A| + |B| $
]

#proposition(title: "The sum principle v2")[
  If $A_1, A_2, ..., A_m$ are a sequence of finite and pairwise disjoint sets $A_i inter A_j = emptyset$ for all $i != j$, then
  $ |A_1 union A_2 union ... union A_m| = |A_1| + |A_2| + ... + |A_m| = sum_(j=1)^m |A_j| $
]

#proposition(title: "The sum principle v3")[
  If a first task can be done in $n_1$ ways, and a second task in $n_2$ ways, and if these tasks cannot be done at the same time, then there are $n_1 + n_2$ ways to do either task.
]

== The Product Principle

#proposition(title: "The product principle v1")[
  If $A$ and $B$ are two finite sets, then
  $ |A times B| = |A| dot |B| $
]

#proposition(title: "The product principle v2")[
  If $A_1, A_2, ..., A_m$ are finite sets, then
  $ |A_1 times A_2 times ... times A_m| = |A_1| dot |A_2| dots |A_m| = product_(k=1)^m |A_k| $
]

#proposition(title: "The product principle v3")[
  Suppose that a procedure can be broken down into two tasks. If there are $n_1$ ways to perform the first task, and $n_2$ ways to perform the second task after the first task has been done, then there are $n_1 dot n_2$ ways to do the procedure.
]

== Cardinality of the Power Set

#corollary[
  Given a finite set $A$, then
  $ |cal(P)(A)| = 2^(|A|) $
]

== The Inclusion-Exclusion Principle

#proposition(title: "The inclusion-exclusion principle v1")[
  $ |A union B| = |A| + |B| - |A inter B| $
]

#proposition(title: "The inclusion-exclusion principle v2")[
  $ |A union B union C| = |A| + |B| + |C| - |A inter B| - |A inter C| - |B inter C| + |A inter B inter C| $
]

#proposition(title: "The inclusion-exclusion principle v3")[
  $
    |A_1 union A_2 union ... union A_n| & = sum_(1 <= i <= n) |A_i| - sum_(1 <= i < j <= n) |A_i inter A_j| \
                                        & quad + sum_(1 <= i < j < k <= n) |A_i inter A_j inter A_k| - ... \
                                        & quad + (-1)^(n+1) |A_1 inter A_2 inter ... inter A_n|
  $
]

#proposition(title: "The inclusion-exclusion principle v4")[
  Given sets $A_i subset S$ with $1 <= i <= n$, then
  $
    |overline(A_1 union A_2 union ... union A_n)| = |overline(A_1) inter overline(A_2) inter ... inter overline(A_n)| = |S| - |A_1 union A_2 union ... union A_n|
  $
]

= Combinatorics
// https://www.youtube.com/watch?v=VJkvPTY6kZw

*Remarks.*
- $overline(A_1) inter overline(A_2) inter ... inter overline(A_n) = {x | x in.not A_1, x in.not A_2, ..., x in.not A_n}$
- $overline(A) = S without A => |overline(A)| = |S| - |A|$

== Permutations

#definition[
  For each positive integer $n in NN$, we define the *factorial* of $n$ as
  $
    n! = n dot (n-1) dot (n-2) dots 2 dot 1 = product_(k=1)^n k
  $
]

#proposition(title: [Permutations of $n$ distinct objects])[
  Given $n$ distinct objects, there are $n!$ distinct ordered arrangements (= permutations) of these objects.
]

#proposition(title: "Permutations with repetition")[
  Given $n$ objects that can classified into $k$ groups of identical objects, and such that the first group contains $n_1$ identical elements, the second group contains $n_2$ identical elements, etc., then the number of distinct ordered arrangements of these objects is
  $ binom(n, n_1, n_2, ..., n_k) equiv frac(n!, n_1! n_2! dots n_k!) $
  with $sum_(i=1)^k n_i = n$.
]

== Ordered Subsets

#proposition[
  Given a set of $n$ distinct elements, we can form
  $ n(n-1)(n-2)...(n-r+1) = frac(n!, (n-r)!) $
  ordered subsets containing $r$ elements.
]

*Remark.* If $r = n$, the first formula implies that there are $n!$ permutations of a set of $n$ distinct elements. The second formula only makes sense if we define $0! = 1$.

#proposition[
  The number of ordered subsets of $r$ elements taken from a set of $n$ distinct objects with repetition allowed is $n^r$.
]

== Subsets

#proposition[
  The number of distinct subsets with $r$ elements that can be extracted from a set of $n$ distinct elements is given by:
  $ binom(n, r) = frac(n!, r!(n-r)!) $
  The symbol $binom(n, r)$ is read "$n$ choose $r$".
]

#definition(title: "Binomial coefficients")[
  For all non-negative integers $n, r in ZZ^+$ such that $0 <= r <= n$, we define the *binomial coefficient* $binom(n, r)$ as follows:
  $ binom(n, r) = frac(n!, r!(n-r)!) $
  where we define $0! = 1$.
]

*Remark.* $binom(n, k) = 0$ whenever $k < 0$, or $k > n$.

== Binomial Coefficients: Pascal's Triangle

#align(center)[
  #table(
    columns: 9,
    stroke: none,
    align: center,
    [], [], [], [], [1], [], [], [], [],
    [], [], [], [1], [], [1], [], [], [],
    [], [], [1], [], [2], [], [1], [], [],
    [], [1], [], [3], [], [3], [], [1], [],
    [1], [], [4], [], [6], [], [4], [], [1],
  )
]

$ binom(n, r) equiv binom("row", "column") $

#theorem(title: "Symmetry")[
  $ binom(n, r) = binom(n, n-r) = frac(n!, r!(n-r)!), quad n >= 0, 0 <= r <= n $
]

#theorem(title: "Pascal's identity")[
  $ binom(n+1, r) = binom(n, r) + binom(n, r-1), quad n >= 0, 0 < r <= n $
]

== Newton's Binomial Theorem

#theorem(title: "Newton's binomial theorem")[
  $ (x + y)^n = sum_(k=0)^n binom(n, k) x^k y^(n-k), quad n >= 0 $
]
// https://www.youtube.com/watch?v=6agQBHWP8IE

#corollary[
  $ (1 + x)^n = sum_(k=0)^n binom(n, k) x^k, quad n >= 0 $
]

#corollary[
  For every $n >= 0$,
  $ sum_(k=0)^n binom(n, k) = 2^n, quad sum_(k=0)^n (-1)^k binom(n, k) = 0 $
]


== Distributions

#proposition(title: "Distributions")[
  The number of distributions of a given set of identical $r$ objects into $n$ (distinct) groups, and such that each group contains at least one object, is given by $binom(r-1, n-1)$.
]

#proposition[
  The number of distributions of a given set of identical $r$ objects into $n$ (distinct) groups is given by $binom(n+r-1, r)$.
]

== Set Partitions

#definition[
  Let $S$ be a finite set of cardinality $n$. A *partition* of $S$ of type $(n_1, n_2, ..., n_k)$ with $n_i in NN$ is the set ${S_i}_(i=1)^k$, where the subsets $S_i$ satisfy: (1) $|S_i| = n_i$ for all $1 <= i <= k$, (2) are pairwise disjoint: $S_i inter S_j = emptyset$ for all $i != j$; and (3) their union is $S$ (therefore, $sum_(i=1)^k n_i = n$).
]

#proposition[
  Let $S$ be a set of cardinality $m dot n$. Then, there exist
  $ frac((m dot n)!, (m!)^n n!) $
  distinct partitions of $S$ into $n$ subsets $S_i$ of type $(m, m, ..., m)$.
]

#proposition[
  The number of distinct partitions of a set of cardinality $m$ of type $(m_1, m_2, ..., m_n)$ is given by
  $ binom(m, m_1, m_2, ..., m_n) product_(k >= 1) frac(1, r_k!) $
  where $r_k$ if the number of subsets of cardinality $k$.
]


= Recurrence Relations
// cover sequences Rosen 2.4, recurrence: Rosen 5.3, 5.4 + Rosen 8.? that's a lot

1. *Recurrence relations*:
  - Definitions.
  - Solution of a linear homogeneous recurrence relation.
  - Solution of a linear nonhomogeneous recurrence relation.
2. *Generating functions*.

#definition[
  A *recurrence relation* for the sequence $(a_n)_(n in NN)$ is an equation that expresses $a_n$ in terms of one or more terms $a_(n-1), a_(n-2), ..., a_(n-k)$, and possibly $n$. In other words, it is, for any fixed $k >= 1$, an equation of the type
  $ F(n; a_n, a_(n-1), a_(n-2), ..., a_(n-k)) = 0 $
  which is valid for all $n >= k + 1$. The *initial conditions* are the first $k$ terms in the sequence: i.e., $(a_1, ..., a_k)$.
]

#definition[
  - A recurrence relation is of *$k$-th order* if $a_n$ can be expressed in terms of $k$ terms $a_(n-1), a_(n-2), ..., a_(n-k)$.
  - A recurrence relation is *linear* if it expresses $a_n$ as a linear function of $a_(n-1), a_(n-2), ..., a_(n-k)$. Otherwise, the relation is *nonlinear*.
  - A recurrence relation is *homogeneous* if the zero sequence $a_n = a_(n-1) = ... = a_(n-k) = 0$ satisfies the relation. Otherwise, it is *nonhomogeneous*.
]

== Solution of a Linear Homogeneous Recurrence Relation

#theorem(title: "Solution of a homogeneous first-order recurrence relation")[
  Let us suppose that the sequence $(a_n)_(n in NN)$ satisfies the recurrence relation
  $ a_n = A a_(n-1), quad n >= 2 $
  where $A in RR$, and we know the initial condition $a_1$. Then, the solution of this relation is given by
  $ a_n = a_1 A^(n-1), quad n >= 1 $
]

*Remark.* In this course, we will only consider linear recurrence relations with constant coefficients ($A$ in the previous theorem).

#theorem(title: "Solution of a homogeneous Fibonacci-type recurrence relation")[
  Let us suppose that the sequence $(a_n)_(n in NN)$ satisfies the recurrence relation
  $ a_n = A a_(n-1) + B a_(n-2), quad n >= 3 $
  with $A, B in RR$, and known initial conditions $a_1, a_2$. If the *characteristic equation* associated to this relation
  $ x^2 = A x + B $
  has characteristic roots $alpha$ and $beta$, then the solution of the recurrence relation is given for all $n >= 1$ by
  $
    a_n = cases(
      K_1 alpha^n + K_2 beta^n & "if" alpha != beta,
      (K_1 + n K_2) alpha^n & "if" alpha = beta
    )
  $
  where the constants $K_1$ and $K_2$ can be obtained using the initial conditions $a_1, a_2$.
]

=== General Case

Let us suppose that the sequence $(a_n)_(n in NN)$ satisfies the linear recursion:
$ a_n = c_1 a_(n-1) + c_2 a_(n-2) + ... + c_k a_(n-k), quad n >= k + 1 $
with real numbers $c_1, c_2, ..., c_k$. We assume that the $k$ initial conditions $a_1, a_2, ..., a_k$ are known.

If we look for a solution of the form
$ a_n = K_i x^n $
then the amplitude $K_i$ cancels out, and the indeterminate $x$ should satisfy the *characteristic equation*:
$ x^k = c_1 x^(k-1) + c_2 x^(k-2) + ... + c_k $

If $a_n$ and $b_n$ are two solutions of a given linear homogeneous recurrence relation, then any linear combination $alpha a_n + beta b_n$ will be also a solution of that recursion.

The space of solutions has a vector space structure.

To each distinct characteristic root $x_i$, there corresponds a solution $a_n^((i))$, whose structure depends on the multiplicity of $x_i$:
- If the root $x_i$ is simple, then $a_n^((i)) = K_i x_i^n$.
- If the root $x_i$ is double, then $a_n^((i)) = (K_i + K_i' n) x_i^n$.
- If the root $x_i$ is triple, then $a_n^((i)) = (K_i + K_i' n + K_i'' n^2) x_i^n$, etc.

If the characteristic equation has $r$ distinct roots $x_i$ with multiplicities $k_i$ (such that $sum_(i=1)^r k_i = k$), then the general solution for this recursion has the form:
$ a_n = sum_(i=1)^r [sum_(j=1)^(k_i) K_i^((j)) n^(j-1)] x_i^n, quad n >= 1 $
where the $k$ constants $K_i^((j))$ are determined using the $k$ initial conditions.

== Solution of a Linear Nonhomogeneous Recurrence Relation

#theorem(title: "Solution of a linear nonhomogeneous recurrence relation")[
  Let us assume that the sequence $(a_n)_(n in NN)$ satisfies the linear nonhomogeneous recurrence relation with constant coefficients:
  $ a_n = c_1 a_(n-1) + c_2 a_(n-2) + ... + c_k a_(n-k) + t_n, quad n >= k + 1 $
  where $c_1, c_2, ..., c_k in RR$, and the initial conditions $a_1, ..., a_k$ are known. The function $t_n : NN -> RR$ is a given *known function* of $n$. Then, the general solution of this linear nonhomogeneous recurrence is equal to the sum of the general solution for the linear homogeneous recurrence relation
  $ a_n = c_1 a_(n-1) + c_2 a_(n-2) + ... + c_k a_(n-k), quad n >= k + 1 $
  plus any particular solution of the full recurrence.
]

#theorem(title: "Solution of a linear nonhomogeneous recurrence relation")[
  Let us suppose that the sequence $(a_n)_(n in NN)$ satisfies the linear nonhomogeneous recurrence
  $ a_n = c_1 a_(n-1) + c_2 a_(n-2) + ... + c_k a_(n-k) + t_n, quad n >= k + 1 $
  where $c_1, c_2, ..., c_k in RR$, and the initial conditions $a_1, a_2, ..., a_k$ are known. Let us further assume that the function $t_n : NN -> RR$ is of the form
  $ t_n = s^n [b_0 + b_1 n + ... + b_t n^t] $
  with real numbers $b_0, b_1, ..., b_t$. If $s$ is not a characteristic root of the associated linear homogeneous recurrence, then there exists a particular solution of the form
  $ a_n^p = s^n [p_0 + p_1 n + ... + p_t n^t] $
  If $s$ is a characteristic root with multiplicity $m$ of the associated linear homogeneous recurrence, then there exists a particular solution of the form
  $ a_n^p = n^m s^n [p_0 + p_1 n + ... + p_t n^t] $
]

The particular solution $a_n^p$ has no free parameters: there is only a unique choice for the coefficients ${p_k}_(k=1)^t$ such that $a_n^p$ is actually a solution.

== Generating Functions
// TODO: keep?

1. *Recurrence relations*.
2. *Generating functions*:
  - Definitions.
  - How to efficiently encode combinatorial problems?
  - Solution of recurrence relations.

#definition[
  The *generating function* (GF) associated to the sequence $(a_k)_(k=0)^infinity$ is the following formal power series:
  $ F(x) = a_0 + a_1 x + a_2 x^2 + ... + a_n x^n + ... = sum_(n=0)^infinity a_n x^n $
]

Examples:
- $(1 + x)^k = sum_(n=0)^k binom(k, n) x^n$ is the GF of $(binom(k, 0), binom(k, 1), ..., binom(k, k), 0, 0, ...)$.
- $1 + x + x^2 + ... + x^(k-1) = sum_(n=0)^(k-1) x^n = frac(1 - x^k, 1 - x)$ is the GF of $(1, 1, ..., 1, 0, 0, ...)$ where there are $k$ ones.
- $frac(1, 1 - x) = 1 + x + x^2 + x^3 + ... = sum_(n=0)^infinity x^n$ is the GF of $(1, 1, 1, ...)$.
- $e^x = 1 + x + frac(x^2, 2!) + frac(x^3, 3!) + ... = sum_(n=0)^infinity frac(x^n, n!)$ is the GF of $(1, 1, frac(1, 2!), frac(1, 3!), ...)$.

== Basic Operations with Generating Functions

The GF for the sequence $(1, 2, 3, ...)$ is given by
$
  sum_(n=0)^infinity (n + 1) x^n = frac(d, d x) sum_(n=0)^infinity x^(n+1) = frac(d, d x) frac(x, 1 - x) = frac(1, (1 - x)^2)
$

If $F(x) = sum_(n=0)^infinity a_n x^n$, and $G(x) = sum_(n=0)^infinity b_n x^n$, then
$ (F + G)(x) = sum_(n=0)^infinity (a_n + b_n) x^n $

If $F$ is the GF of the sequence ${a_n}_(n=0)^infinity$, then the GF of the sequence $(0, 0, ..., 0, a_0, a_1, ...)$ where there are $k$ zeros is $G(x) = x^k F(x)$.

== Integer Partitions

*Problem 7*: Count the number of distinct partitions of the positive integer $N$. For example, if $N = 4$, there are 5 partitions: $4 = 3 + 1 = 2 + 2 = 2 + 1 + 1 = 1 + 1 + 1 + 1$.

1. The sum principle allows us to compute the generating function associated to use the positive integer $k$ in the partition:
  - The generating function for using 1 in the partition is $f_1 = 1 + x + x^2 + x^3 + ... = frac(1, 1-x)$.
  - The generating function for using $2 = 1 + 1$ in the partition is $f_2 = 1 + x^2 + x^4 + x^6 + ... = frac(1, 1-x^2)$.
  - The generating function for using $p >= 1$ in the partition is $f_p = 1 + x^p + x^(2p) + x^(3p) + ... = frac(1, 1-x^p)$.

2. Because writing up a partition is a sequential process, the generating function that encodes Problem 7 is given by the product principle:
  $
    f(x) = product_(k=1)^infinity f_k (x) = product_(k=1)^infinity frac(1, 1 - x^k) = 1 + x + 2x^2 + 3x^3 + 5x^4 + 7x^5 + ...
  $

== Practical Procedure

*Encoding of a combinatorial problem:*
1. Compute the generating function $F$ by using the sum/product principles and other operations.
2. Compute the coefficients $a_n$ by performing the Taylor power-series expansion of $F$ around $x = 0$.

*Solving a recurrence relation:*
1. Rewrite the recurrence relation for $a_n$ in terms of an equation that only involves the generating function $F$.
2. Solve this equation and obtain a closed form for $F$ in terms of $x$.
3. Compute the coefficients $a_n$ by performing the Taylor power-series expansion of $F$ around $x = 0$.

== Example: The Fibonacci Recursion

We want to solve the recurrence relation
$ f_n = f_(n-1) + f_(n-2), quad n >= 2, quad f_0 = 0, quad f_1 = 1 $
by using the generating function
$ F(x) = sum_(n=0)^infinity f_n x^n = f_0 + f_1 x + sum_(n=2)^infinity f_n x^n $

Algorithm:
1. Multiply the recurrence relation by $x^n$, and sum over all values of $n$ for which this recursion is valid (in our case, $n >= 2$):
  $ sum_(n=2)^infinity f_n x^n = sum_(n=2)^infinity f_(n-1) x^n + sum_(n=2)^infinity f_(n-2) x^n $

2. Manipulate the sums so that they can be expressed in terms of $F$ and the initial conditions $f_0 = 0, f_1 = 1$:
  - $sum_(n=2)^infinity f_n x^n = F - f_0 - f_1 x = F - x$.
  - $sum_(n=2)^infinity f_(n-1) x^n = x sum_(n=2)^infinity f_(n-1) x^(n-1) = x sum_(m=1)^infinity f_m x^m = x(F - f_0) = x F$.
  - $sum_(n=2)^infinity f_(n-2) x^n = x^2 sum_(n=2)^infinity f_(n-2) x^(n-2) = x^2 sum_(m=0)^infinity f_m x^m = x^2 F$.

  The Fibonacci recursion now becomes the equation
  $ F - x = x F + x^2 F $

3. We solve this equation for $F$:
  $ F(x) = frac(x, 1 - x - x^2) = sum_(n=0)^infinity f_n x^n $

4. We compute the Taylor power-series expansion of $F$ and we read the coefficient of $x^n$:
  $ F(x) = frac(x, 1 - x - x^2) = x + x^2 + 2x^3 + 3x^4 + 5x^5 + 8x^6 + 13x^7 + ... $

  We can obtain all coefficients with a little algebra:
  $
    F(x) = frac(alpha, x + (1 + sqrt(5))\/2) + frac(beta, x + (1 - sqrt(5))\/2) = frac(1, sqrt(5)) [frac(1, 1 - x(1 + sqrt(5))\/2) - frac(1, 1 - x(1 - sqrt(5))\/2)]
  $
  $ = sum_(n=0)^infinity frac(x^n, sqrt(5)) [(frac(1 + sqrt(5), 2))^n - (frac(1 - sqrt(5), 2))^n] $

  Therefore,
  $ f_n = frac(1, sqrt(5)) [(frac(1 + sqrt(5), 2))^n - (frac(1 - sqrt(5), 2))^n] $

== Generalized Binomial Theorem

#theorem[
  Let $k$ be a fixed positive integer, then we have formally that
  $ frac(1, (1 + x)^k) = sum_(n=0)^infinity binom(-k, n) x^n $
  where for all $n >= 0$ the above binomial coefficient is defined as
  $ binom(-k, n) = frac(-k(-k - 1)(-k - 2) ... (-k - n + 1), n!) = (-1)^n binom(n + k - 1, n) $
]


= Lattices and Boolean Algebras
// TODO: remove?

This chapter covers:
1. Lattices and Boolean algebras:
  - Definitions and properties.
  - Bounded lattices.
  - Distributive lattices.
  - Complemented lattices.
  - Boolean algebras.

== Lattices

#definition[
  A lattice is a nonempty partially ordered set $(A, prec.eq)$ in which $sup({a, b})$ and $inf({a, b})$ exist for all $a, b in A$.
]

- If $sup(a, b)$ and $inf(a, b)$ exist, they are unique.
- If $(A, prec.eq)$ is a lattice, both operations can be considered as binary operations on $A$:
  - Their supremum is denoted by $sup(a, b) = a or b in A$.
  - Their infimum is denoted by $inf(a, b) = a and b in A$.
- Not every partially ordered set is a lattice.
- A totally-ordered set is a lattice with $sup(a, b) = max(a, b)$ and $inf(a, b) = min(a, b)$.

== Duality

- If $(A, prec.eq)$ is a partially ordered set, then $(A, succ.eq)$ is also a partially ordered set. The Hasse diagram of $(A, succ.eq)$ is obtained by inverting the Hasse diagram of $(A, prec.eq)$.
- If $(A, prec.eq)$ is a lattice, then $(A, succ.eq)$ is also a lattice, with the interchange $sup <-> inf$.

#corollary(title: "Duality Principle")[
  Any statement about a lattice $(A, prec.eq)$ is still valid if we make the interchanges $prec.eq <-> succ.eq$, $sup <-> inf$, and $or <-> and$.
]

- The lattices $(A, prec.eq)$ and $(A, succ.eq)$ are dual.
- The order relations $prec.eq$ and $succ.eq$ are dual.
- The operations $or$ and $and$ are dual.

== Lattice Properties

#proposition[
  If $(A, prec.eq)$ is a lattice, then for any $a, b, c in A$:
  1. $sup(a, a) = a or a = a$ [idempotent law].
  2. $sup(a, b) = a or b = b or a = sup(b, a)$ [commutativity law].
  3. $sup(a, sup(b, c)) = a or (b or c) = (a or b) or c = sup(sup(a, b), c)$ [associativity law].
  4. $sup(a, inf(a, b)) = a or (a and b) = a$ [absorption law].
]

By duality, one obtains

#corollary[
  If $(A, prec.eq)$ is a lattice, then for any $a, b, c in A$:
  1. $inf(a, a) = a and a = a$ [idempotent law].
  2. $inf(a, b) = a and b = b and a = inf(b, a)$ [commutativity law].
  3. $inf(a, inf(b, c)) = a and (b and c) = (a and b) and c = inf(inf(a, b), c)$ [associativity law].
  4. $inf(a, sup(a, b)) = a and (a or b) = a$ [absorption law].
]

#proposition[
  If $(A, prec.eq)$ is a lattice, then the following statements are equivalent for any $a, b in A$:
  1. $a prec.eq b$.
  2. $sup(a, b) = a or b = b$.
  3. $inf(a, b) = a and b = a$.
]

#proposition(title: "Distributive Inequalities")[
  If $(A, prec.eq)$ is a lattice, then for any $a, b, c in A$:
  1. $inf(a, sup(b, c)) = a and (b or c) prec.eq (a and b) or (a and c) = sup(inf(a, b), inf(a, c))$.
  2. $sup(a, inf(b, c)) = a or (b and c) succ.eq (a or b) and (a or c) = inf(sup(a, b), sup(a, c))$.
]

== Lattices as Algebraic Structures

#definition[
  A lattice is an algebraic structure $(A, or, and)$ with two binary operations $or$ and $and$ that satisfy the commutative, associative, and absorption laws.
]

- The absorption law implies the idempotent law.
- Even though we do not assume the existence of any order relation on $A$, there is one order relation induced by the properties of the operations $or$ and $and$. In particular, for any $a, b in A$,
  $ a prec.eq b <==> a or b = b $
- $a prec.eq a$ because $a or a = a$ (idempotent law).
- If $a prec.eq b <==> a or b = b$. If $b prec.eq a <==> b or a = a$. Therefore, $a = b$.
- If $a prec.eq b <==> a or b = b$ and $b prec.eq c <==> b or c = c$, then $a or c = a or (b or c) = (a or b) or c = b or c = c$. Therefore $a prec.eq c$.
- In summary, $prec.eq$ is a partial order relation and $(A, prec.eq)$ is a partially ordered set.

#definition[
  Given a lattice $(A, or, and)$, a sublattice $(M, or, and)$ of $(A, or, and)$ is given by a nonempty subset $M subset.eq A$ such that $(M, or, and)$ is also a lattice using the same operations as those used in $(A, or, and)$. (In other words, $(M, or, and)$ should be closed under the binary operations $or$ and $and$.)
]

Any lattice is a sublattice of itself.

== Bounded Lattices

#definition[
  A lattice $(A, prec.eq)$ has a lower bound, denoted by $0$, if $0 prec.eq a$ for all $a in A$. A lattice has an upper bound denoted by $1$, if $a prec.eq 1$ for all $a in A$. A lattice is bounded if it contains a lower bound $0$ and an upper bound $1$.
]

The bounds $0$ and $1$ satisfy the following properties for all $a in A$:
- $sup(a, 1) = a or 1 = 1$.
- $inf(a, 1) = a and 1 = a$.
- $sup(a, 0) = a or 0 = a$.
- $inf(a, 0) = a and 0 = 0$.

- The upper bound $1$ is the identity element for $and$: $a and 1 = a$, and it satisfies $a or 1 = 1$.
- The lower bound $0$ is the identity element for $or$: $a or 0 = a$, and it satisfies $a and 0 = 0$.
- In a bounded lattice, we can extend the duality principle by considering the interchange $0 <-> 1$.
- Any finite lattice $A$ is bounded: $1 = sup(A)$ and $0 = inf(A)$.

== Distributive Lattices

#definition[
  A lattice $(A, prec.eq)$ is a distributive lattice if for all $a, b, c in A$,
  $
    inf(a, sup(b, c)) & = a and (b or c) = (a and b) or (a and c) = sup(inf(a, b), inf(a, c)) \
    sup(a, inf(b, c)) & = a or (b and c) = (a or b) and (a or c) = inf(sup(a, b), sup(a, c))
  $
]

This property is stronger than the distributive laws:
$
  inf(a, sup(b, c)) & = a and (b or c) prec.eq (a and b) or (a and c) = sup(inf(a, b), inf(a, c)) \
  sup(a, inf(b, c)) & = a or (b and c) succ.eq (a or b) and (a or c) = inf(sup(a, b), sup(a, c))
$

#theorem[
  A lattice is distributive if and only if it does not contain a sublattice that is isomorphic to any of the following two lattices: $N_5$ (the "pentagonal lattice") and $M_3$ (the "diamond lattice").
]

== Complemented Lattices

#definition[
  Let $(A, or, and, 0, 1)$ be a bounded lattice. An element $a in A$ has a complement $b in A$ if $sup(a, b) = a or b = 1$ and $inf(a, b) = a and b = 0$.
]

- The bounds $0$ and $1$ are complements of each other.
- If $a$ is a complement of $b$, then $b$ is a complement of $a$.
- An element $a in A$ may have no complements, or it may have several ones.
- The unique complement of $1$ is $0$, and vice versa.

#definition[
  A bounded lattice $(A, or, and, 0, 1)$ is complemented if for each $a in A$ there is at least one complement.
]

#proposition[
  Let $(A, or, and)$ be a distributive lattice. If an element $a in A$ has a complement, then this element is unique.
]

If $(A, or, and)$ is a distributive and complemented lattice, then each element $a in A$ has a unique complement. This element will be denoted by $overline(a)$.

== Boolean Algebras

#definition(title: "Definition 1")[
  A Boolean algebra is a bounded, distributive and complemented lattice $(A, or, and, overline(#hide[a]), 0, 1)$.
]

#definition(title: "Definition 2")[
  Let $B$ be a nonempty set with at least two distinct elements $0, 1$. We define on $B$ the following operations:
  - The (binary) Boolean sum $(a, b) -> a + b in B$.
  - The (binary) Boolean multiplication $(a, b) -> a dot b in B$.
  - The (unary) complementation $a -> overline(a) in B$.

  Then $B$ is a Boolean algebra if the following properties hold for all $a, b, c in B$:
  1. $a + 0 = a$ [identity w.r.t. the sum].
  2. $a dot 1 = a$ [identity w.r.t. the multiplication].
  3. $a + b = b + a$, $a dot b = b dot a$ [commutativity laws].
  4. $a + (b + c) = (a + b) + c$, $a dot (b dot c) = (a dot b) dot c$ [associativity laws].
  5. $a + (b dot c) = (a + b) dot (a + c)$, $a dot (b + c) = (a dot b) + (a dot c)$ [distributive laws].
  6. $a + overline(a) = 1$, $a dot overline(a) = 0$ [complement laws].
]

== Simple Boolean Algebra

- We can drop the symbol $dot$ in the Boolean multiplication $a dot b = a b$ whenever there is no confusion.
- The elements $0, 1 in A$ do not have to be equal to the numbers $0, 1 in ZZ$.
- The Boolean operations $+$ and $dot$ do not have to coincide with the sum and multiplication of real numbers.

Let $(B, +, dot, overline(#hide[a]), 0, 1)$ be an algebra with $B = {0, 1}$ and the operations $+$, $dot$, and $overline(#hide[a])$ defined on $B$ as follows:
$
      1 dot 0 & = 0 dot 1 = 0 dot 0 = 0 \
      1 dot 1 & = 1 \
        1 + 1 & = 1 + 0 = 0 + 1 = 1 \
        0 + 0 & = 0 \
  overline(1) & = 0 \
  overline(0) & = 1
$

Then $(B, +, dot, overline(#hide[a]), 0, 1)$ is a Boolean algebra, and it is the simplest one that exists: the Boolean algebra of two elements.

== General Non-Trivial Boolean Algebras

Let $A$ be a nonempty set. We now consider the power set $cal(P)(A)$ with the order relation for every pair $B, C subset.eq A$:
$ B prec.eq C <==> B subset.eq C $

- The set $(cal(P)(A), prec.eq)$ is a partially ordered set.
- The set $(cal(P)(A), prec.eq)$ is a lattice. Given $B, C subset.eq A$, then
  - $sup(B, C) = B union C subset.eq A$ ($or => union$).
  - $inf(B, C) = B inter C subset.eq A$ ($and => inter$).
- The identities are
  - $1 = A$.
  - $0 = emptyset$.
- The set $(cal(P)(A), union, inter, emptyset, A)$ is a distributive lattice.
- Each $B subset.eq A$ has a unique complement $overline(B) = A \\ B subset.eq A$.
- The set $(cal(P)(A), union, inter, \\, emptyset, A)$ is a Boolean algebra.
- Practical use in probability theory.

== Properties of a Boolean Algebra

#proposition[
  Let $(B, +, dot, overline(#hide[a]), 0, 1)$ be a Boolean algebra. Then, for all $a, b in B$:
  1. Idempotent laws: $a + a = a$ and $a dot a = a$.
  2. Dominance laws: $a + 1 = 1$ and $a dot 0 = 0$.
  3. Absorption laws: $a dot (a + b) = a$ and $a + a dot b = a$.
  4. De Morgan laws: $overline((a + b)) = overline(a) dot overline(b)$ and $overline((a dot b)) = overline(a) + overline(b)$.
  5. Involution law: $overline(overline(a)) = a$.
  6. $overline(1) = 0$ and $overline(0) = 1$.
]

#definition[
  Given a statement in a Boolean algebra, its dual statement is obtained by interchanging $+ <-> dot$ and $0 <-> 1$ in the original statement.
]

#proposition[
  If a theorem is a consequence of the definitions of Boolean algebra, then the dual of the theorem is also a theorem.
]

#definition[
  Let $(B, +, dot, overline(#hide[a]), 0, 1)$ be a Boolean algebra. Then a subset $C subset.eq B$ is a Boolean subalgebra if $0, 1 in C$, and it is closed under the same operations $+$, $dot$, $overline(#hide[a])$.
]

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
