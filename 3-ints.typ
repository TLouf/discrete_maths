#import "assets/theory_template.typ": *
#show: theory


= Elementary number theory

#fa-book() This chapter overlaps with sections 4.1, 4.3, 4.4, 4.5 and 4.6 of Rosen.

#slidebreak()

== Integer divisibility

#slidebreak()

The set of integers $ZZ$ is closed with respect to the operations of sum, subtraction, and product.
In other words, for every $a, b in ZZ$, $a plus.minus b in ZZ$ and $a dot b in ZZ$. #pause They also satisfy:
- $0$ is the identity with respect to the sum: $a + 0 = a$ for every $a in ZZ$.
#pause
- $1$ is the identity with respect to the product: $a dot 1 = a$ for every $a in ZZ$.
#pause
- For every $a in ZZ$, there exists a unique inverse element $-a in ZZ$ such that $a + (-a) = 0$.
#pause

However, the result of dividing two integers is not necessarily an integer!

#slidebreak()

#definition(title: [Divisibility])[
  Given two integers $a != 0$ and $b$, we say that $a$ *divides* $b$ if there exists a *quotient* $q in ZZ$ such that $b = a dot q$.

  Then $a$ is called a *factor* or *divisor* of $b$, and $b$ a *multiple* of $a$.

  We denote $a divides b$ when $a$ divides $b$, and we write $a divides.not b$ when $a$ does not divide $b$. So, in summary:
  $
    a divides b <=> exists q in ZZ, b = a dot q
  $
]

#slidebreak()

#remark[
  - Every nonzero integer divides $0$:
    $
      forall a in ZZ without {0}, 0 = a dot 0 #h(1em) (q = 0).
    $
  - Every nonzero integer divides itself:
    $
      forall a in ZZ without {0}, a = a dot 1 #h(1em) (q = 1).
    $
  - $1$ divides any integer:
    $
      forall a in ZZ, a = 1 dot a #h(1em) (q = a).
    $
]


#theorem[
  Let $a, b, c$ be integers. Then:
  1. If $a divides b$ and $a divides c$, then $a divides (b + c)$.
  2. If $a divides b$, then $a divides (b dot c)$ for every $c in ZZ$.
  3. If $a divides b$ and $b divides c$, then $a divides c$.
  4. If $c != 0$, then $a divides b$ if and only if $(c dot a) divides (c dot b)$.
  5. If $a divides b$ and $b != 0$, then $|a| <= |b|$.
  6. If $a divides b$ and $b divides a$, then $a = plus.minus b$.
] <thm-divides>


#theorem[
  If $a divides b_i$ for $i = 1, ..., N$, then $a divides sum_(i=1)^N u_i dot b_i$ for all $u_i in ZZ$. In other words, an integer divides any linear combination with integer coefficients of its multiples.
]

What if an integer does not divide another?
Then we need to involve a remainder.

#theorem(title: "The Division Algorithm")[
  Let $a$ and $b != 0$ be two integers. Then there exists a unique pair of integers $q$ and $r$ such that
  $ a = q dot b + r quad "with" 0 <= r < |b| $
] <thm-division-algo>
// existence p.362

#definition[
  In the equality given in @thm-division-algo:
  - the numbers $a$ and $b$ are called dividend and divisor, respectively,
  - the number $r$ is called the *remainder* and we write
    $
      r = a mod b,
    $
  - the number $q$ is called the *quotient* and we write
    $
      q = a "div" b = cases(floor(a\/b) & "if" b > 0, ceil(a\/b) & "if" b < 0).
    $
]

#slidebreak()

#remark[
  $mod$ is called the modulo or remainder operation, and $"div"$ the floor division or quotient operation. They both have associated symbols in most programming languages (respectively `%` and `//` in python, for instance).
]
// Rosen ex.24


== Modular arithmetic
<sec-mod-arithmetic>

=== Congruence

Modular arithmetic allows us to perform algebraic operations using, instead of a given set of numbers, their respective remainders with respect to some fixed positive number called the modulus.
This might sound convoluted but is actually fairly common.
For example, to answer the question "What day of the week will we be 10 days from now?", you use modular arithmetic.

#slidebreak()

We've already seen the operation notation $r = a mod b$, but to perform modular arithmetic we need to introduce a related notation, which involves a relation instead.

#definition(title: "Congruence", slide-break: false)[
  Let $a, b in ZZ$, and $m in NN^*$.
  Then $a$ and $b$ are said to be congruent modulo $m$ if $m divides (a - b)$.
  This relation is denoted as $a equiv b (mod m)$.
  It is called a congruence with modulus $m$.
]

#slidebreak()

$a equiv b (mod m)$ and $a mod m = b$ include different uses of "$mod$"": in the first it represents a relation, while it represents an operation in the second.
However, this shared notation comes from the fact that the relation and the operation are closely related.

#theorem[
  Let $a,b in ZZ$ and $m in NN^*$.
  $a$ and $b$ are congruent modulo $m$ iff they have the same remainder when divided by $m$, that is:
  $
    a equiv b (mod m) <=> a mod m = b mod m.
  $
]

#slidebreak()

#question-box[
  - Can you now translate "What day of the week will we be 10 days from now?" in modular arithmetic terms? Start with wondering: how can I represent days of the week numerically? Then, what is the modulus, here?
  - Can you find other examples of real-life problems involving congruences?
  // anything with cycle: so time-related stuff but also angles!
]

#slidebreak()

From the definition of divisibility, we can directly get that:
#theorem(slide-break: false)[
  Let $a,b in ZZ$ and $m in NN^*$.
  $a$ and $b$ are congruent modulo $m$ if and only if there is an integer $q$ such that $a = q dot m + b$, that is:
  $
    a equiv b (mod m) <=> exists q in ZZ, a = q dot m + b.
  $
] <thm-congruence-remainder>
#pause
...so a congruence is just another way of writing the division algorithm (@thm-division-algo), where the quotient is disregarded.

#slidebreak()

Let's now see how operations between congruent integers go.

#theorem(slide-break: false)[
  Let $m$ be a positive integer. If $a_1 equiv b_1 (mod m)$ and $a_2 equiv b_2 (mod m)$, then:
  - $a_1 plus.minus a_2 equiv b_1 plus.minus b_2 (mod m)$.
  - $a_1 dot a_2 equiv b_1 dot b_2 (mod m)$.
]

#slidebreak()

#proof[
  Using @thm-congruence-remainder, we know there exist $s$ and $t$ such that $a_1 = b_1 + s m$ and $a_2 = b_2 + t m$, so:
  $
    cases(
      a_1 + a_2 = (b_1 + b_2) + (s + t) m,
      a_1 a_2 = (b_1 b_2) + (b_1 t + b_2 s + s t m) m,
    ).
  $
  Hence the result.
]

#slidebreak()

#corollary[
  Let $m, k in NN^*$ and $a, b in ZZ$. If $a equiv b (mod m)$, then $a^k equiv b^k (mod m)$.
]

#pause

Also since $a equiv (a mod m) (mod m)$, we get that:
#corollary[
  Let $a,b in ZZ$ and $m in NN^*$.
  Then
  $
    cases(
      (a+b) mod m = ((a mod m) + (b mod m)) mod m\,,
      (a dot b) mod m = ((a mod m) dot (b mod m)) mod m.,
    )
  $
] <cor-mod-add-mult>

#slidebreak()

#important[
  Some operations may not go as expected!
  For instance, while
  $
    a equiv b (mod m) => forall c in ZZ, a dot c equiv b dot c (mod m),
  $
  the converse is not necessarily true, meaning:
  $
    a dot c equiv b dot c (mod m) cancel(=>) a equiv b (mod m).
  $
  For instance: can you divide both sides of the equivalence by $3$ in $12 equiv 6 (mod 3)$?
]

=== Arithmetic modulo $m$

To study operations involving congruences properly, let's first see how they define particular sets of integers with their own arithmetic.

#theorem(slide-break: false)[
  For each positive integer $m$, the binary relation $equiv (mod m)$ is an equivalence relation, as defined in @sec-equiv-rels.
] <thm-mod-is-equiv>

#slidebreak()

A good way to visualize this relation is to imagine that the straight line of integers gets rolled into a wheel with $m$ ticks:

#let n = 10
#let m = 5
#figure(
  grid(
    columns: 1fr,
    gutter: 1em,
    cetz.canvas({
      import cetz.draw: *

      let radius = m / (2 * calc.pi)
      circle((0, 0), radius: radius, name: "c", stroke: (dash: "dashed"))
      for i in range(1, m) {
        let ang = i * 360deg / m - 90deg
        content((ang, radius + 0.3), [#i], name: "t")
        line((ang, radius - 0.1), (ang, radius + 0.1))
      }
      arc((220deg, radius * 0.6), radius: radius * 0.6, start: 220deg, stop: -40deg, name: "rot", stroke: 0.5pt, mark: (
        end: (symbol: ">"),
      ))

      line((0, -radius), (n, -radius), name: "l", mark: (
        end: (symbol: ">"),
      ))
      for i in range(n) {
        line((i, -radius - 0.1), (i, -radius + 0.1), name: "t")
        content("t", [#i], anchor: "north", padding: 10pt)
      }

      content((3, radius / 2), text(2em)[$dots$])

      let x = 6
      set-origin((x, 0))
      circle((0, 0), radius: radius, name: "c", stroke: (dash: "dashed"))
      for i in range(1, m) {
        let ang = i * 360deg / m - 90deg
        content((ang, radius + 0.3), [#calc.rem(i + 2, m)], name: "t")
        line((ang, radius - 0.1), (ang, radius + 0.1))
      }
    }),
  ),
)

This is equivalent to defining the quotient set we'll introduce below!

#definition(title: "Congruence classes")[
  We define the congruence classes modulo $m$ as
  $ [r]_m = {b in ZZ | b equiv r (mod m)} = {q dot m + r | q in ZZ} $
]

#slidebreak()

It follows from @thm-mod-is-equiv that congruence classes are equivalence classes.
Thus, to a given modulo $m$ correspond $m$ distinct equivalence classes.
And from @thm-equiv-classes-partition follows that:
#theorem(slide-break: false)[
  For any positive integer $m$, the congruence classes modulo $m$ form a partition of $ZZ$.
]

#slidebreak()

We can then define the set of the "simplest" representatives of these congruence classes: those corresponding to a quotient $q$ equal to zero.
#definition(slide-break: false)[
  For any positive integer $m$, we define
  $ ZZ_m = {r in ZZ | 0 <= r <= m - 1} = {0, 1, dots, m-1} $
]

#slidebreak()

We know that any congruence modulo $m$ can be performed the same way on these representatives as on all members of their respective classes: we can thus define an *arithmetic modulo $m$* on $ZZ_m$.

#pause

Arithmetic on $ZZ_m$, however, can be distinct from the one you know on $ZZ$.
Still, we know from @cor-mod-add-mult that they share similarities, which allows us to provide the following definitions.

#slidebreak()

#definition[
  For a given $m in NN^*$ and $x, y in ZZ_m$, we define:
  - the addition $+_m$:
    $
      x +_m y = (x + y) mod m,
    $
  // where the addition on the right-hand side is the addition on $ZZ$,
  - and the multiplication $dot_m$:
    $
      x dot_m y = (x dot y) mod m,
    $
  where the operations on the right-hand side are the ones on $ZZ$.
]

#slidebreak()

These operations satisfy many of the familiar properties that addition and multiplication have on $ZZ$.
That is, for any $x,y in ZZ_m$:
- Closure: $x +_m y in ZZ_m$ and $x dot_m y in ZZ_m$.
- Associativity: $x +_m (y +_m z) = (x +_m y) +_m z$ and $x dot_m (y dot_m z) = (x dot_m y) dot_m z$.
- Commutativity: $x +_m y = y +_m x$ and $x dot_m y = y dot_m x$.
- Distributivity: $x dot_m (y +_m z) = x dot_m y +_m x dot_m z$.
- Identity element (sum): $exists 0_m in ZZ_m$ such that $0_m +_m x = x$.
- Identity element (product): $exists 1_m in ZZ_m$ such that $1_m dot_m x = x$.
- Additive inverses: $exists (-_m x) in ZZ_m$ such that $x +_m (-_m x) = 0_m$.

#slidebreak()

#home[
  Check they actually satisfy them!
  What are $0_m$, $1_m$ and $(-x_m)$ with regards to their counterparts in $ZZ$?
  // TODO: make this an exercise?
]

#slidebreak()

Multiplicative inverses do not appear here, simply because they do not always exist in $ZZ_m$.
For instance, there is no multiplicative inverse of 2 modulo 6, as you can verify.

#definition(title: [Multiplicative inverse])[
  An element $r in ZZ_m$ has a multiplicative inverse modulo $m$ if there is an element $s in ZZ_m$ such that $r dot s equiv 1 (mod m)$.
] <def-mult-inv-mod>

We will return to multiplicative inverses later on.

== Greatest common divisors and least common multiples

=== Definitions

#definition(title: "Greatest common divisor", slide-break: false)[
  Let $a, b$ be integers which are not both zero. The largest positive integer $d$ that divides both $a$ and $b$ is called the *greatest common divisor* of $a$ and $b$. It is denoted by $gcd(a, b)$.
]

#slidebreak()

#remark[
  - The case $a = b = 0$ is excluded because any integer divides $0$.
  - $gcd(0, a) = |a|$ for all nonzero integers $a$.
  - $gcd(a, b) = gcd(abs(a), abs(b))$
]


#definition(title: "Relative primes")[
  Two integers $a$ and $b$ are *relatively prime* if $gcd(a, b) = 1$.

  The integers $a_1, a_2, ..., a_n$ are pairwise relatively prime if $gcd(a_i, a_j) = 1$ for any $1 <= i < j <= n$.
]

#definition(title: "Least common multiple")[
  The *least common multiple* of two natural numbers $a, b$ is the smallest natural number $m$ that is divisible by both $a$ and $b$, that is $a divides m$ and $b divides m$. It is denoted by $"lcm"(a, b)$.
]


=== How to compute them

The $gcd$ can be obtained systematically using the following lemma.

#lemma(title: [Euclid's lemma], slide-break: false)[
  Given the integers $a$, $b != 0$, $q$ and $r$, such that $a = q dot b + r$ with $0 <= r < |b|$, then $gcd(a, b) = gcd(b, r)$.
] <lma-euclid-algo>
// proof using @thm-divides

#slidebreak()

But how? Let's write $r_0 = |a|$, $r_1 = |b|$, $r_2 = r$ and $q_1 = q$ and apply the lemma successively:
$
      r_0 & = q_1 r_1 + r_2                   & 0 & <= r_2 < r_1, \
      r_1 & = q_2 r_2 + r_3                   & 0 & <= r_3 < r_2, \
   dots.v \
  r_(n-2) & = q_(n-1) r_(n-1) + r_(n) #h(2em) & 0 & <= r_n < r_(n-1), \
  r_(n-1) & = q_n r_n.
$

#slidebreak()

Since we have by @thm-division-algo that $|a| = r_0 > r_1 > dots > r_n >= 0$, this sequence of remainders cannot contain more than $|a|$ terms, so it has a finite size $n$. This means that there exists an $n$ such that $r_n divides r_(n-1)$.

It then follows from @lma-euclid-algo that
$
  gcd(a, b) & = gcd(|a|, |b|) = gcd(r_0, r_1) = gcd(r_1, r_2) = dots \
            & = gcd(r_(n-1), r_n) \
            & = r_n
$

#slidebreak()

#example[
  Apply recursively Euclid's lemma to compute $gcd(662, 414)$.
]

#slidebreak()

The $lcm$ is then straightforward to compute since we can use the following theorem.

#theorem(slide-break: false)[
  If $a, b$ are two natural numbers, then
  $ gcd(a, b) dot "lcm"(a, b) = a dot b $
]
// Rosen ex. 31

=== How to use them in modular arithmetic

#theorem(title: "Bézout's Identity", slide-break: false)[
  If $a$ and $b$ are two integers not simultaneously zero, then their $gcd$ can be written as a linear combination of these two integers. In other words:
  $ exists (x, y) in ZZ^2, gcd(a, b) = a dot x + b dot y $
] <thm-bezout>

#slidebreak()

#proof[
  We write the steps of Euclid's algorithm, and "unroll them":
  $
          a & = q_1 dot b + r_2 => r_2 = a - q_1 dot b \
          b & = q_2 dot r_2 + r_3 => r_3 = b - q_2 dot r_2 \
        r_2 & = q_3 dot r_3 + r_4 => r_4 = r_2 - q_3 dot r_3 \
            & dots.v \
    r_(n-3) & = q_(n-2) dot r_(n-2) + r_(n-1) => r_(n-1) = r_(n-3) - q_(n-2) dot r_(n-2) \
    r_(n-2) & = q_(n-1) dot r_(n-1) + r_(n) => r_(n) = r_(n-2) - q_(n-1) dot r_(n-1) \
    r_(n-1) & = q_n dot r_(n) => r_(n) = gcd(a, b)
  $

  #slidebreak()

  Then,
  $
    gcd(a, b) = r_(n) & = alpha_(n-1) r_(n-2) + beta_(n-1) r_(n-1) \
                      & = alpha_(n-2) r_(n-3) + beta_(n-2) r_(n-2) \
                      & = ... \
                      & = alpha_3 r_2 + beta_3 r_3 \
                      & = alpha_2 b + beta_2 r_2 \
                      & = alpha_1 a + beta_1 b
  $
]

#remark[
  Bézout's identity does not imply that the integers $x$ and $y$ are unique.
]

#slidebreak()

The identity allows us to redefine the $gcd$ through the following theorem.

#theorem(slide-break: false)[
  Let $a$ and $b$ be two integers not simultaneously zero with $gcd(a, b) = d$.

  An integer $c$ can be written in the form $a dot x + b dot y$ for some integers $x$ and $y$ if and only if $c$ is a multiple of $d$.

  In particular, the $gcd$ $d$ is the smallest positive integer of the form $a dot x + b dot y$ with $x, y in ZZ$.
]

#slidebreak()

And as a direct consequence, to redefine relatively-prime integers through the following corollary.

#corollary[
  Two integers are relatively prime if and only if there exist integers $x$ and $y$ such that
  $
    a dot x + b dot y = 1
  $
]

#corollary[
  If $gcd(a, b) = d$, then
  1. $ forall m in NN, gcd(m dot a, m dot b) = m dot d $
  2. $ gcd(a/d, b/d) = 1 $
]

#slidebreak()

#corollary[
  If $a, b$ are two relatively-prime integers, then:
  1. If $a divides c$ and $b divides c$, then $(a dot b) divides c$.
  2. If $a divides (b dot c)$, then $a divides c$.
] <cor-rel-prime-div>
// TODO: proofs?

#theorem[
  Let $a, b, c$ be integers, and $m$ a positive integer relatively prime to $c$. Then
  $
    a dot c equiv b dot c (mod m) => a equiv b (mod m).
  $
] <thm-factor-congruence>

#slidebreak()

#remark[
  - This theorem allows us to divide by a common factor $c$ both sides of the sign $equiv$ whenever $c$ and the modulus $m$ are relatively prime.
  - If $c$ and $m$ are not relatively prime, then the correct result is:\
    Let us write $m = p dot c$ for positive integers $p, c$, and let $a, b$ be integers. If $a dot c equiv b dot c (mod p dot c)$, then $a equiv b (mod p)$.
]


== Prime numbers

=== Definition

#definition(title: "Prime numbers", slide-break: false)[
  A natural number $p > 1$ is called a *prime number* if its only positive divisors are $1$ and itself.

  A natural number $p > 1$ that is not prime is called *composite*.
]

#remark[
  The natural number $1$ is not prime.
  The first prime number is $2$, and the other prime numbers are odd natural numbers $(3, 5, 7, 11, ...)$.
]

#theorem(title: "Euclid")[
  There are infinitely many prime numbers.
]

#home[
  How primes are distributed is a topic that has attracted interest and fascination for centuries.
  You can check out this #link("https://www.youtube.com/watch?v=EK32jo7i5LQ")[cool video on prime numbers] (and this cool channel in general!) for an example of how it can connect to other problems.
]

=== Primes as building blocks

Since a prime only has $1$ and itself as divisors, the $gcd$ of a prime and any other number can only be $1$ or the prime. Thus:

#lemma(slide-break: false)[
  Let $p$ be a prime number, and let $a$ be an integer.
  Then, either $p divides a$, or $p$ and $a$ are relatively prime.
]

#slidebreak()

And using @cor-rel-prime-div, we can then get that:

#lemma(slide-break: false)[
  If $p$ is prime and $p | display(product_(i=1)^n) a_i$, where each $a_i$ is an integer, then $p divides a_i$ for some $i$.
] <lm-prime-div-prod>
which leads us to a crucial result...

#theorem(title: "The Fundamental Theorem of Arithmetic")[
  Every natural number $n > 1$ can be written uniquely as a product of primes
  $ n = p_1^(n_1) dot p_2^(n_2) dot p_3^(n_3) dot ... dot p_k^(n_k) $
  where the $p_i$ are distinct prime numbers written in increasing order, and the exponents $n_i$ are natural numbers $n_i >= 1$.
] <thm-fundamental-arithmetic>

#slidebreak()

#proof[
  / Existence of the factorization: This can be proven by induction.
    / Basis step: For $n=2$, the factorization exists since $2$ itself is prime.

    / Inductive step: Let us assume that for a given $n$, all integers $2 <= j <= n$ have a prime factorization.

      - First, if $n+1$ is prime, its prime factorization is simply itself, hence its existence.
      - If it is composite, it means it can be written as $n+1 = a dot b$, where $2 <= a <= b <= n$.
        By the inductive hypothesis, both $a$ and $b$ have prime factorizations, so $n+1$ can also be factorized, by combining these two.

    We thus just proved the existence of the factorization for any $n >= 2$.

  / Uniqueness: This can be proven by contradiction.
    Let's suppose that $n in NN$ admits two distinct factorizations, so there exist $s >= 1$ primes $p_i$ and $t >= 1$ primes $q_j$ such that
    $
      n = product_(i=1)^s p_i = product_(j=1)^t q_j,
    $
    and such that we can simplify the equality above by the common factors, and get
    $
      product_(k=1)^u p_(i_k) = product_(l=1)^v q_(j_l),
    $
    with $u,v >= 1$.
    For each $k$, we know that $p_(i_k) divides n$, and so, by @lm-prime-div-prod, necessarily $p_(i_k) divides q_(j_l)$ for some $l$.
    Since these numbers are primes, this is impossible, by definition.
    Hence the uniqueness of the factorization.
]

#slidebreak()

#remark[If you're curious as to why this theorem is _fundamental_, you can check out #link("https://www.youtube.com/watch?v=46E0-XJuAXs")[this nice video].]

#slidebreak()

This theorem first allows us to prove another that makes it easier to determine if an integer is prime.

#theorem(slide-break: false)[
  The positive integer $n$ is a composite number if and only if $n$ can be divided by some prime number $p <= sqrt(n)$.
]

#example[See Exercise 3.7]

#slidebreak()

The prime factorization also helps obtaining the $gcd$ and $lcm$ of two integers.

#proposition[
  If the integers $a, b > 1$ can be factorized in the form
  $
    a & = p_1^(n_1) dot p_2^(n_2) ... p_k^(n_k) \
    b & = p_1^(m_1) dot p_2^(m_2) ... p_k^(m_k)
  $
  with $n_i, m_i >= 0$, then
  $
      gcd(a, b) & = p_1^(min(n_1, m_1)) dot p_2^(min(n_2, m_2)) dot dots dot p_k^(min(n_k, m_k)) \
    "lcm"(a, b) & = p_1^(max(n_1, m_1)) dot p_2^(max(n_2, m_2)) dot dots dot p_k^(max(n_k, m_k))
  $
]


== Solving congruences

=== Congruences involving very large numbers

Results on primes can also be used to compute the remainder of divisions of some very high numbers, even when they can't be stored in a computer's memory.
How? Using the following.

#theorem(title: "Fermat's little theorem", slide-break: false)[
  Let $p$ be a prime number and $y$ any integer. Then, if $y equiv.not 0 (mod p)$, we have
  $ y^(p-1) equiv 1 (mod p) $
] <thm-fermat-little>

#proof[
  See exercises.
]

#slidebreak()

#corollary[
  If $p$ is a prime number, then $y^p equiv y (mod p)$ for any integer $y$.
]

But what if the divisor is not prime?
Then, @thm-fundamental-arithmetic comes to the rescue, paired with the following.

#theorem(title: [Chinese remainder theorem])[
  Let $m_1, m_2, dots, m_n in NN without {0,1}$ be pairwise relative primes, and $a_1, a_2, dots, a_n in NN$. Then the system
  $
    cases(
      x equiv a_1 (mod m_1),
      x equiv a_2 (mod m_2),
      quad dots.v,
      x equiv a_n (mod m_n),
    )
  $
  has a unique solution modulo $m = display(product_(i=1)^n m_i)$.
] <thm-chinese-remainder>

#slidebreak()

Then, to solve $y^n equiv x (mod m)$, we factor $m$ into primes $m_i$, and then solve the system from @thm-chinese-remainder.


=== Linear congruence equations

Being able to solve linear equations is fundamental to many problems of calculus or linear algebra, and the same is true for linear _congruence_ equations in number theory.

#definition[
  A linear congruence equation is a congruence modulo $m$ of the form
  $ a dot x equiv b (mod m) $
  where $m$ is a positive integer, $a, b$ are integers, and $x$ is a variable.
]

#slidebreak()

To solve these equations, we can use multiplicative inverses (from @def-mult-inv-mod).
Indeed, let's consider $m > 1$, and assume $a$ admits a multiplicative inverse $a^(-1) in ZZ_m$.
Then, we can multiply both sides of the linear congruence equation by $a^(-1)$ to isolate $x$:
$
  a dot x equiv b (mod m) => x equiv a^(-1) dot b (mod m).
$
The solutions $x$ are then all integers congruent to $a^(-1) dot b$ modulo $m$.
But let's first see when we can get such an inverse.

#theorem[
  An element $r in ZZ_m$ has a multiplicative inverse if and only if $r$ and $m$ are relatively prime.
]

#corollary[
  If $p$ is a prime number, every nonzero element of $ZZ_p$ is invertible.
]

Here's why we stopped right after introducing multiplicative inverses above: we needed to introduce relatively prime numbers before being able to condition their existence.

#theorem[
  For any $r in ZZ_m$, if its multiplicative inverse exists, then it is unique modulo $m$.
]

#notation[
  Since the inverse of $r$ modulo $m$ is unique when it exists, it will be denoted by $r^(-1)$.
]

#remark[
  For small values of $m$ finding a multiplicative inverse is straightforward: we can simply multiply $a$ by $2, dots, m-1$ until the result exceeds a multiple of $m$ by $1$.

  For higher $m$, we can rather use Bézout (@thm-bezout) to find coefficients $x$ and $y$ such that
  $
    gcd(a, m) = 1 = a dot x + m dot y <=> a dot x equiv 1 (mod m)
  $
  It will then follow that $x$ is an inverse of $a$ modulo $m$.
]

#slidebreak()

We can thus provide the following way to solve linear congruence equations.

#theorem(slide-break: false)[
  If $a$ and $m$ are relatively prime integers, then the linear congruence equation
  $ a dot x equiv b (mod m) $
  has a unique solution modulo $m$, which is $x_0 = (a^(-1) dot b) mod m$, where $a^(-1)$ is the inverse of $a$ modulo $m$.

  The general solution is then given by
  $
    forall k in ZZ, x_k = x_0 + (k dot m),
  $
  which forms a congruent class modulo $m$.
]

// #example[
//   Solve the congruence $2 x equiv 7 (mod 17)$
// ]


== Applications

=== Random number generators

Many algorithms need to draw random numbers to work, for instance in statistical sampling, cryptography or to train machine-learning models.
Because generating actually-random numbers needs a natural source of randomness, such as complex atmospheric phenomena, it is limited by the "rate of randomness" that these sources can provide.
Most often we thus rather generate _pseudorandom_ numbers in computers.

#slidebreak()

A popular procedure to do so is called the *linear congruential method*.
It consists in first choosing four integers:
- the modulus $m$ (large!),
- the multiplier $a in [| 2, m-1|]$,
- the increment $c in [| 0, m-1|]$,
- the seed $x_0 in [| 0, m-1|]$.
Using these, a sequence of pseudorandom numbers can be generated by successively applying
$
  x_(n+1) = (a x_n + c) mod m.
$

=== Cryptography

Number theory, and particularly modular arithmetic, is the basis for many cryptography techniques.
Perhaps the simplest example is Caesar's encryption process.
It maps each letter of the latin alphabet to a number in $ZZ_26$, and shifts them by an arbitrary $k$ modulo $26$.
It can thus be written as the function
$
  f: ZZ_26 -> ZZ_26, f(l) = (l + k) mod 26.
$

// RSA requires Chinese remainder, Fermat's, fast modular exponentiation... a bit too much.
#home[
  More complex techniques which are actually widely-used nowadays also involve modular arithmetic.
  One example is the RSA system, which is based on Fermat's little theorem (@thm-fermat-little).
  For more information, see section 4.6 of Rosen.
]
