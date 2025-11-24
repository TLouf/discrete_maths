#import "assets/base_template.typ": *

#show: base

= Sequences

#fa-book() This chapter overlaps with sections 2.4, 8.2, 8.4 of Rosen. TODO

== Defining sequences

Sequences are basically indexed collections of elements, or, to be more formal:

#definition(title: [Sequence])[
  A sequence is a function from a set of indices $I subset.eq NN$ to a set $A$ of elements at each index.
  The image in $A$ of the integer $n in I$ is denoted $a_n$, and is called the $n^"th"$ term of the sequence.
  The sequence can be represented as $( a_n )_(n in I)$.
]

#remark[
  There are many ways to represent sequences in computers.
  In python for instance, there are `bytes` (bytes sequences), `str` (text sequences), `list`, `tuple`, or even `range` which #link("https://docs.python.org/3/library/stdtypes.html#sequence-types-list-tuple-range")[are sequence types].
  Note how #link("https://docs.python.org/3/library/collections.abc.html#collections-abstract-base-classes")[even in python] the difference is made between sequences and sets: the `Sequence`'s central method is `__getitem__` ---which allows you to retrieve their $n"th"$ element---, which doesn't exist for `Set`, whose central method is `__contains__`, to check if an element is inside the set.
]

The terms of a sequence can be defined explicitly...

#example[
  Let's define the sequence $(a_n)_(n in NN)$ where $a_n = 2^n$.
  Then the terms of the sequence are $1, 2, 4, 8, dots$
]

... but not only!
They may also be defined recursively, that is, providing some initial terms together with a rule that is needed to determine subsequent terms.

// we know recursively defined functions are well-defined from the principle of induction
#definition(title: [Recurrence relation])[
  A *recurrence relation* for the sequence $(a_n)_(n in NN)$ is an equation that expresses $a_n$ in terms of one or more previous terms $a_(n-1), a_(n-2), ..., a_(n-k)$, and possibly $n$.
  The *initial conditions* are the first $k$ terms in the sequence $(a_1, ..., a_k)$, which are necessary to be able to determine all terms of such a sequence.
]

#example[
  Redefine the previous sequence ($a_n = 2^n$) and the factorial ($b_n = n!$) using recurrence relations.
]

#remark[
  - More than one sequence may satisfy the same recurrence relation, hence the importance of initial conditions.
  - From the principle of strong induction (@thm-strong-induction), we know that a recurrence relation together with a set of initial conditions define a unique sequence.
]

// TODO: sums? and arithmetic/geometric progressions? fibo?

== Solving recurrence relations

We have seen above how to translate an explicit sequence definition into a recurrence relation.
However, most of the time, it's the other way around.
In this case, we want to *solve* the recurrence relation, that is, to find the equivalent explicit sequence definition, also known as a *closed formula*, if it exists.

=== Linear homogeneous recurrence relations

Let us first study linear recurrence relations, as they often appear in real-world problems, and can be solved systemically.

#definition[
  - A recurrence relation is of *$k^"th"$ order* if $a_n$ can be expressed in terms of its $k$ previous terms $a_(n-1), a_(n-2), ..., a_(n-k)$.
  - A recurrence relation is *linear* if it expresses $a_n$ as a linear combination of its previous terms.
  - A recurrence relation is *homogeneous* if the zero sequence $a_n = 0$ satisfies the relation.
]

#proposition[
  A $k^"th"$ order linear recurrence relation with constant coefficients is of the form
  $
    a_n = c_1 a_(n-1) + c_2 a_(n-2) + dots + c_k a_(n-k) + f(n)
  $
  where $c_1, dots, c_k in RR$, $c_k != 0$, and $f: NN -> RR$ which does not depend on any sequence term.\
  The relation is also homogeneous iff $f(n) = 0$ for all $n$.
]

To gain some intuition on the solution of such recurrence relations, let's start simple.

#theorem(title: "Solution of a homogeneous first-order recurrence relation")[
  Let us suppose that the sequence $(a_n)_(n in NN)$ satisfies the recurrence relation
  $ forall n >=1, a_n = c a_(n-1), $
  where $c in RR$, and we know the initial condition $a_1$. Then, the solution of this relation is given by
  $ forall n in NN, a_n = a_0 c^n. $
]

Let us now observe that $a_n = alpha x^n$ with $alpha, x in RR^*$ is a solution of such recurrence relations iff
$
  &alpha x^n = c_1 alpha x^(n-1) +  c_2 alpha x^(n-2) + dots +  c_k alpha x^(n-k)\
  <=> & x^k - c_1 x^(k-1) - c_2 x^(k-2) - dots - c_(k-1) x - c_k = 0\
  <=> & P(x) = 0
$
where we introduced the *characteristic polynomial* $P$, whose roots we will call the *characteristic roots*.
This implies that if $x_i$ is a characteristic root, $alpha x_i^n$ is a solution of the recurrence relation.
The multiplicative $alpha$ cancelled out above, so its value is to be fixed according to the initial conditions.
The characteristic polynomial of a $k^"th"$ order linear recurrence is of degree $k$, so it admits $k$ characteristic roots, $x_1, dots, x_k$.

Let us first suppose all roots are distinct.
Then the solution is a linear combination of the form:
$
  a_n = sum_(i=1)^k alpha_i x_i^n
$

Let us now suppose we have a root $x_i$ of multiplicity $k_i > 1$.
Then the derivative $P'$ of the characteristic polynomial also has $x_i$ as a root, of multiplicity $k_i - 1$!
So $x_i$ also satisfies
$
  &P'(x_i) = 0\
  <=> & k x_i^(k-1) - c_1 (k-1) x_i^(k-2) - dots - c_(k-1) = 0\
  <=> & k x_i^(k) - c_1 (k-1) x_i^(k-1) - dots - c_(k-1) x_i = 0\
$
which shows that $n x_i^n$ is also a solution.
Thus, the fact that $x_i$ is a root of the first, second, ..., $(k-1)^"th"$ derivative of the characteristic polynomial $P$ enables us to see that $n x_i^n, n^2 x_i^n, dots, n^(k-1) x_i^n$ are also solutions.

Putting everything together, we get the following general result.

// Second, we can observe that a linear combination of two solutions of such a recurrence relation is also a solution.
// Indeed, let's consider $s_n$ and $t_n$ two solutions of a recurrence relation, and take $b_1, b_2 in RR$, then:
// $
//   b_1 s_n + b_2 t_n &= b_1 (c_1 s_(n-1) + dots + c_k s_(n-k)) +  b_2 (c_1 t_(n-1) + dots + c_k t_(n-k))\
//   &= c_1 (b_1 s_(n-1) + b_2 t_(n-1)) + dots + c_k (b_1 s_(n-k) + b_2 t_(n-k))
// $
// which means that $b_1 s_n + b_2 t_n$ is also a solution of the same recurrence relation.

#theorem(title: "Solution of a linear homogeneous recurrence relation")[
  Let $(a_n)$ be recurrence relation of the form:
  $
    a_n = c_1 a_(n-1) + c_2 a_(n-2) + dots + c_k a_(n-k)
  $
  with $c_1, dots, c_k in RR$.
  Let us assume that its characteristic polynomial
  $
    P(x) = x^k - c_1 x^(k-1) - c_2 x^(k-2) - dots - c_(k-1) x - c_k
  $
  has $r$ distinct roots $x_1, dots, x_r$ with multiplicities $k_1, dots, k_r$.

  Then, a sequence $(a_n)$ is a solution of the recurrence relation iff
  $
    forall n in NN, a_n = sum_(i=1)^r (sum_(j=0)^(m_i-1) alpha_(i, j) n^(j) ) x_i^n
  $
  where $alpha_(i,j)$ are constants to be fixed according to initial conditions.
]


Let us see this in practice with the Fibonacci recurrence.

#corollary(title: "Solution of a homogeneous Fibonacci-type recurrence relation")[
  Let us suppose that the sequence $(a_n)_(n in NN)$ satisfies the recurrence relation
  $ a_n = c_1 a_(n-1) + c_2 a_(n-2), quad n >= 3 $
  with $c_1, c_2 in RR$, and known initial conditions $a_1, a_2$. If the *characteristic equation* associated to this relation
  $ x^2 = c_1 x + c_2 $
  has characteristic roots $alpha$ and $beta$, then the solution of the recurrence relation is given for all $n >= 1$ by
  $
    a_n = cases(
      K_1 alpha^n + K_2 beta^n & "if" alpha != beta,
      (K_1 + n K_2) alpha^n & "if" alpha = beta
    )
  $
  where the constants $K_1$ and $K_2$ can be obtained using the initial conditions $a_1, a_2$.
]


=== Linear nonhomogeneous recurrence relation

#theorem(title: "Solution of a linear nonhomogeneous recurrence relation")[
  Let us assume that the sequence $(a_n)_(n in NN)$ satisfies the linear nonhomogeneous recurrence relation with constant coefficients:
  $ a_n = c_1 a_(n-1) + c_2 a_(n-2) + ... + c_k a_(n-k) + t_n, quad n >= k + 1 $
  where $c_1, c_2, ..., c_k in RR$, and the initial conditions $a_1, ..., a_k$ are known. The function $t_n : NN -> RR$ is a given *known function* of $n$. Then, the general solution of this linear nonhomogeneous recurrence is equal to the sum of the general solution for the linear homogeneous recurrence relation
  $ a_n = c_1 a_(n-1) + c_2 a_(n-2) + ... + c_k a_(n-k), quad n >= k + 1 $
  plus any particular solution $a_n^p$ of the full recurrence.
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
