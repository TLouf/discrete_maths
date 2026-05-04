#import "../assets/theory_template.typ": *
#show: theory

= Sequences

#fa-book() This chapter overlaps with sections 2.4, 8.2, 8.4 of Rosen.

#slidebreak()

== Defining sequences

Sequences are basically indexed collections of elements, or, to be more formal:

#definition(title: [Sequence], slide-break: false)[
  A sequence is a function from a set of indices $I subset.eq NN$ to a set $A$ of elements at each index.
  The image in $A$ of the integer $n in I$ is denoted $a_n$, and is called the $n^"th"$ term of the sequence.
  The sequence can be represented as $( a_n )_(n in I)$.
]

#slidebreak()

#remark[
  There are many ways to represent sequences in computers.
  In python for instance, there are `bytes` (bytes sequences), `str` (character sequences), `list`, `tuple`, or even `range` which #link("https://docs.python.org/3/library/stdtypes.html#sequence-types-list-tuple-range")[are sequence types].
  Note how #link("https://docs.python.org/3/library/collections.abc.html#collections-abstract-base-classes")[even in python] the difference is made between sequences and sets: the `Sequence`'s central method is `__getitem__` --which allows you to retrieve their $n"th"$ element--, which doesn't exist for `Set`, whose central method is `__contains__`, to check if an element is inside the set.
]

#slidebreak()

The terms of a sequence can be defined explicitly, with a closed form...

#example[
  Let's define the sequence $(a_n)_(n in NN)$ where $a_n = 2^n$.
  Then the terms of the sequence are $1, 2, 4, 8, dots$
]

... but not only!
They may also be defined recursively, that is, providing some initial terms together with a rule that is needed to determine subsequent terms.

#definition(title: [Recurrence relation])[
  A *recurrence relation* for the sequence $(a_n)_(n in NN)$ is an equation that expresses $a_n$ in terms of one or more previous terms $a_(n-1), a_(n-2), ..., a_(n-k)$, and possibly $n$.
  The *initial conditions* are the first $k$ terms in the sequence: $a_0, ..., a_(k-1)$; which are necessary to be able to determine all terms of such a sequence.
]

#example[
  Redefine the previous sequence ($a_n = 2^n$) and the factorial ($b_n = n!$) using recurrence relations.
]

#slidebreak()

#remark[
  - More than one sequence may satisfy the same recurrence relation, hence the importance of initial conditions.
  - From the principle of strong induction (@thm-strong-induction), we know that a recurrence relation together with a set of initial conditions define a unique sequence.
]


== Aggregating sequences

Sometimes, we're not interested in every term of the sequence, but in some aggregate.
For instance, you're not really interested in all movements in your bank account, but in your balance, so the sum of all these movements.

The two fundamental ways to aggregate a sequence are the summation and products, that we introduce below.

#definition(title: [Sequence sum])[
  Given a sequence $(a_n)_(n in I)$ with $I subset.eq NN$, its *sum* is the sum of its terms.
  Very often, we sum over contiguous integers, so $I = {m, m+1, dots, M}$ with $M > m$, and we write it
  $
    sum_(n in I) a_n = a_m + a_(m+1) + dots + a_M = sum_(n=m)^M a_n.
  $
  If $I$ is infinite, the sum is called a *series*.
  If $I$ is empty, the sum is $0$.
]


#definition(title: [Sequence product])[
  Given a sequence $(a_n)_(n in I)$ with $I subset.eq NN$, its *product* is the product of its terms.
  Very often, we sum over contiguous integers, so $I = {m, m+1, dots, M}$ with $M > m$, and we write it
  $
    product_(n in I) a_n = a_m a_(m+1) dots a_M = product_(n=m)^M a_n.
  $
  If $I$ is infinite, the sum is called an *infinite product*.
  If $I$ is empty, the product is $1$.
]

#slidebreak()

The usual laws of arithmetic apply to these sums and products.

#proposition(slide-break: false)[
  Let $(x_n)$ and $(y_n)$ be two sequences, $I subset.eq NN$ and $a,b in RR$, then
  $
    sum_(i in I) (a x_n + b y_n) = a sum_(i in I) x_n + b sum_(i in I) y_n
  $

  $
    product_(i in I) (x_n^a y_n^b) = (product_(i in I) x_n)^a (product_(i in I) y_n)^b
  $
]

#slidebreak()

We can often prove a closed form for a sum or a product using induction.
To show it, let's introduce two fundamental kinds of sequences.

#definition(title: [Arithmetic progression], slide-break: false)[
  An arithmetic progression is a sequence $(a_n)_(n in NN)$ that satisfies the recurrence relation
  $
    a_(n+1) = a_n + d
  $
  where $d in RR$ is called the common difference.
]


#definition(title: [Geometric progression])[
  A geometric progression is a sequence $(a_n)_(n in NN)$ that satisfies the recurrence relation
  $
    a_(n+1) = r a_n
  $
  where $r in RR$ is called the common ratio.
]

#slidebreak()

Then the following can be proven by induction.

#proposition(slide-break: false)[
  For all $n in NN$ and $r in RR without {1}$:
  $
     "(i)" & sum_(k=0)^n k = (n (n+1)) / 2 \
    "(ii)" & sum_(k=0)^n r^k = (1 - r^(n+1)) / (1 - r)
  $
] <prop-arithm-geo-sums>


== Solving recurrence relations

We have seen above how to translate an explicit sequence definition into a recurrence relation.
However, most of the time, it's the other way around.
In this case, we want to *solve* the recurrence relation, that is, to find the equivalent explicit sequence definition, also known as a *closed formula*, if it exists.

=== Linear homogeneous recurrence relations

Let us first study linear recurrence relations, as they often appear in real-world problems, and can be solved systematically.

#definition(slide-break: false)[
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
  where $c in RR$, and we know the initial condition $a_0$. Then, the solution of this relation is given by
  $ forall n in NN, a_n = a_0 c^n. $
]

Let us now observe that $a_n = alpha x^n$ with $alpha, x in RR^*$ is a solution of $k^"th"$ order recurrence relation iff, for all $n >= k$:

#math.equation(numbering: "(1)", block: true, number-align: end + top)[
  $
        & alpha x^n = c_1 alpha x^(n-1) + c_2 alpha x^(n-2) + dots + c_k alpha x^(n-k) \
    <=> & x^k - c_1 x^(k-1) - c_2 x^(k-2) - dots - c_(k-1) x - c_k = 0 \
    <=> & P(x) = 0
  $
] <eq:homog_rec_sol>

where we introduced the *characteristic polynomial* $P$, whose roots we will call the *characteristic roots*.

#slidebreak()

// First, we can observe that a linear combination of two solutions of such a recurrence relation is also a solution.
// Indeed, let's consider $s_n$ and $t_n$ two solutions of a recurrence relation, and take $b_1, b_2 in RR$, then:
// $
//   b_1 s_n + b_2 t_n &= b_1 (c_1 s_(n-1) + dots + c_k s_(n-k)) +  b_2 (c_1 t_(n-1) + dots + c_k t_(n-k))\
//   &= c_1 (b_1 s_(n-1) + b_2 t_(n-1)) + dots + c_k (b_1 s_(n-k) + b_2 t_(n-k))
// $
// which means that $b_1 s_n + b_2 t_n$ is also a solution of the same recurrence relation.

The equivalence above implies that if $x_i$ is a characteristic root, $alpha x_i^n$ is a solution of the recurrence relation.
The characteristic polynomial of a $k^"th"$ order linear recurrence is of degree $k$, so it admits $k$ characteristic roots: $x_1, dots, x_k$.

- Let us first suppose all roots are distinct.
  Then the solution is a linear combination of the form:
  $
    a_n = sum_(i=1)^k alpha_i x_i^n
  $

#slidebreak()

- Let us now suppose we have a root $x_i$ of multiplicity $m_i >= 2$.
  Then the derivative $P'$ of the characteristic polynomial also has $x_i$ as a root, of multiplicity $m_i - 1$.

  Also, we can notice that @eq:homog_rec_sol is equivalent to $x^(n-k) P(x) = 0$, by retracing our steps.
  Now if we write $Q_1(x) = x^(n-k) P(x)$, then $Q'_1(x_i) = 0$, which we can rewrite as
  $
    n x_i^(n-1) = c_1 (n-1) x_i^(n-2) + dots + c_k (n-k) x_i^(n-k-1).
  $
  Multiplying both side by $x_i$, we then see that $a_n = n x_i^n$ is a solution of the recurrence.

  Then, if $m_i >= 3$, we can do the same with $Q_2 (x) = x Q'_1 (x)$ and find that $n^2 x^n$ is also a solution, and again with $m_i >= 4$, etc.

  By induction, we can thus get that if $x_i$ is a characteristic root of multiplicity $m_i$, then
  $
    n x_i^n, space n^2 x_i^n, space dots space, space n^(m_i-1) x_i^n
  $
  are also solutions of the recurrence.

Putting everything together, we get the following general result.

#theorem(title: "Solution of a linear homogeneous recurrence relation")[
  Let $(a_n)$ be a sequence satisfying a recurrence relation of the form:
  $
    a_n = c_1 a_(n-1) + c_2 a_(n-2) + dots + c_k a_(n-k)
  $
  with $c_1, dots, c_k in RR$.
  Let us assume that its characteristic polynomial
  $
    P(x) = x^k - c_1 x^(k-1) - c_2 x^(k-2) - dots - c_(k-1) x - c_k
  $
  has $r$ distinct roots $x_1, dots, x_r$ with multiplicities $m_1, dots, m_r$.

  Then, a sequence $(a_n)$ is a solution of the recurrence relation iff
  $
    forall n in NN, a_n = sum_(i=1)^r (sum_(j=1)^(m_i) alpha_(i, j) n^(j-1) ) x_i^n
  $
  where $alpha_(i,j)$ are constants to be fixed according to initial conditions.
]
// highlight in alpha sub: i = which root, j = which multiplicity
// total of $k$ alphas by fundamental theorem of algebra


Let us see what this gives in a simple case, with Fibonacci-like recurrences.

#corollary(title: "Solution of a homogeneous Fibonacci-like recurrence relation")[
  Let us suppose that the sequence $(a_n)_(n in NN)$ satisfies the recurrence relation
  $ forall n >= 2, a_n = c_1 a_(n-1) + c_2 a_(n-2) $
  with $c_1, c_2 in RR$.
  If the *characteristic equation* associated to this relation
  $ x^2 = c_1 x + c_2 $
  has characteristic roots $x_1$ and $x_2$, then the solution of the recurrence relation is
  $
    forall n in NN, a_n = cases(
      alpha_1 x_1^n + alpha_2 x_2^n & "if" x_1 != x_2,
      (alpha_1 + n alpha_2) x_1^n & "if" x_1 = x_2
    )
  $
  where the constants $alpha_1$ and $alpha_2$ can be obtained using the initial conditions $a_0, a_1$.
]

// #example[
//   TODO  with actual Fibo
// ]

=== Linear nonhomogeneous recurrence relation

What if we now add heterogeneity?

#theorem(title: "Solution of a linear nonhomogeneous recurrence relation")[
  Let us consider the linear nonhomogeneous recurrence relation with constant coefficients:
  $ a_n = c_1 a_(n-1) + c_2 a_(n-2) + ... + c_k a_(n-k) + f(n) $
  where $c_1, c_2, ..., c_k in RR$, and the initial conditions $a_0, ..., a_(k-1)$ are known.\

  Then, the general solution of this linear nonhomogeneous recurrence is $(a_n^((h)) + a_n^((p)))_(n in NN)$, where $(a_n^((h)))$ is the solution of the associated _homogeneous_ recurrence relation
  $ a_n = c_1 a_(n-1) + c_2 a_(n-2) + ... + c_k a_(n-k), $
  and $(a_n^((p)))$ is any _particular_ solution of the nonhomogeneous relation.
]
// proof: consider two particular solutions of the nonhomogeneous relation, and subtract them -> solution to homogenous

So the hard part is to "guess" a particular solution of the nonhomogeneous relation.
In some simple examples though, it is not too hard to make the right guess.

// #example[
//   TODO, like example 10 p 548
// ]

== Generating functions
// emphasize difference between formal series, and the actual function: would be nice to change terminology so GF is always an actual function, while GS is the abstract, formal series that can represent any sequence, regardless of its convergence.

=== Definitions

We will now introduce generating functions, which are a very powerful tool to manipulate sequences.
The idea is not to find a function which is "equal" to the sequence in any sense, but one that *encodes the sequence*.

To be more specific, when you formulate a generating function you compress all the information necessary to reproduce the full sequence, so the value of all its terms, into a simple function such as $f(x) = e^x$, $f(x)=1 / (1-x)$, etc .

#slidebreak()

How can a function contain all this information, though?
By using the fact that many functions can be written as a power series, which means there is a sequence $(a_n)_(n in NN)$ such that
$
  f(x) = sum_(n=0)^(+oo) a_n x^n.
$
An obvious example is the polynomials: for instance $P(x) = 1 + 2 x^2$ can be written as a power series with sequence $(a_n)$ such that $a_0 = 1, a_2 = 2, "and" forall n in NN without {0, 2}, a_n = 0$.

But many other functions can be written as a power series, for instance by using their Taylor expansion!
For instance, $e^x = sum_(n=0)^(+oo) x^n / n!$, so its associated sequence is $a_n = 1 / n!$.
We can thus say that $e^x$ _generates_ this sequence, in the sense that it can tell you the values of all its terms.
Contrary to what you've seen previously in calculus though, here we do things the other way around: we start from a sequence and try to find its generating function.

#definition[
  The *generating function* (GF) associated to the sequence $(a_n)_(n in NN)$ is a function $G$ which can be written as a formal power series with the terms of the sequence as coefficients:
  $ G(x) = a_0 + a_1 x + a_2 x^2 + ... + a_n x^n + ... = sum_(n=0)^(+ oo) a_n x^n $
  The series itself is called a *generating series*.
]

#remark[
  We used the term _formal_ because the series is only used as a representation of the sequence.
  $x$ shouldn't be seen as an actual variable taking real values, we only use $x^n$ as a symbol that marks, or corresponds to "where" the $n^"th"$ term of the sequence is in the series.
  It is only when we state the equality of a generating series with a function that the associated "real" series should be well-defined, that is, it should converge for at least some values of $x$.
]

Because we have this abstraction of a formal power series, we can redefine how to add or multiply them together.

#definition[
  Let $f(x) = sum_(n=0)^(+ oo) a_n x^n$ and $g(x) = sum_(n=0)^(+ oo) b_n x^n$. Then
  $
      "(i)" & f(x) + g(x) = sum_(n=0)^(+ oo) (a_n + b_n) x^n,             && "(addition)" \
     "(ii)" & f(x) g(x) = sum_(n=0)^(+ oo) (sum_(j=0)^k a_j b_(k-j)) x^n, && "(multiplication)" \
    "(iii)" & x^m f(x) = sum_(n=m)^(+ oo) a_(n-m) x^n                     && "(shifting)"
  $
]

#remark[
  This actually matches the algebra of actual power series, simply because we defined it so it matches, since we want to eventually interpret the series as a closed-form function.
]

A summary of known series which can be identified when determining a closed form from a generating series is shown in @tbl-power-series.

#figure(
  table(
    columns: 3,
    gutter: 1em,
    align: horizon,
    table.hline(),
    table.header([Power series], [Closed form], [Reference]),
    table.hline(),
    [$ sum_(n=0)^(k) binom(k, n) x^n $], [$ (1 + x)^k $], [@thm-binomial],
    [$ sum_(n=0)^(k) x^n $], [$ (1 - x^(k+1)) / (1 - x) $], [@prop-arithm-geo-sums],
    [$ sum_(n=0)^(+ oo) a^n x^n $], [$ 1 / (1 - a x) $], [Taylor],
    [$ sum_(n=0)^(+ oo) x^n / (n!) $], [$ e^x $], [Taylor],
    [$ sum_(n=1)^(+ oo) (-1)^(n+1) / n x^n $], [$ log(1+x) $], [Taylor],
    table.hline(),
  ),
  caption: [Some useful closed forms for power series],
) <tbl-power-series>


=== Solving recurrence relations

An example of the power of generating functions is how they can be used to solve recurrence relations, using the following procedure:
1. Rewrite the recurrence relation for $a_n$ in terms of an equation that only involves the generating function $G$.
2. Solve this equation and obtain a closed form for $G(x)$.
3. Compute the coefficients $a_n$ by performing the Taylor expansion of $G$ around $x = 0$.

#slidebreak()

#example[
  Solve the recurrence relation $forall n in NN^*, a_n = 3 a_(n-1)$, with $a_0 = 2$.
]


=== Solving counting problems

A generating series can encode a specific kind of sequence: namely, the sequence $(a_n)$ of number of ways to select some object $n$ times from a set.
So for instance, the series $(1 + 2 x + 3 x^2)$ can encode the fact that we have a single way to not select the object, two to select it once, and three to select it twice.

#slidebreak()

#example[
  Let's say we want to determine the number of ways to insert tokens worth $1 euro$, $2 euro$ and $5 euro$ into a vending machine to pay for an item that costs $r$ euros, when the order in which the tokens are inserted does not matter.
]

#slidebreak()

#solution[
  The number of euros produced by picking $n$ tokens worth $i$ euros can be seen as the exponent in $(x^(i))^n = x^(i n)$ within the formalism of generating functions.
  Besides, we might pick any number of tokens of each type, so for each type we need to sum over all possible number of picks $n$.
  Then the answer is the coefficient in front of $x^r$ in the following generating function:
  $
    (sum_(n=0)^(+ oo) x^n)(sum_(n=0)^(+ oo) x^(2 n))(sum_(n=0)^(+ oo) x^(5 n))
  $
  using the product rule.
  The independence of picks is clearly visible in the generating function.

  When the order matters, then using the product rule, the process of picking $n$ tokens successively can be represented by $(x + x^2 + x^5)^n$.
  The number of ways for these $n$ picks to sum up to $r$ euros is then the coefficient of $x^r$.
  Since any number of tokens may be inserted, the number of ways to produce $r$ euros when the order matters is the coefficient of $x^r$ when we sum over all possible $n$ values:
  $
    sum_(n=0)^(+ oo) (x + x^2 + x^5)^n
  $

  In both cases, the answer might seem complicated to get by hand for large $r$, but it is relatively straightforward using a computer.
]

#slidebreak()

#remark[
  In generating functions representing combinatorial problems, you can think of additions as logical "or", and products as logical "and".
]

#slidebreak()

#remark[
  Here, we barely scratched the surface of how generating functions can be used for counting problems.
  They can go as far as #link("https://www.youtube.com/watch?v=bOXCLR3Wric")[pairing together with complex number analysis to solve some hard counting problems.]
]
