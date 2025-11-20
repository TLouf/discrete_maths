#import "assets/base_template.typ": *

#show: base

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
