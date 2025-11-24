#import "assets/base_template.typ": *

#show: base

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
