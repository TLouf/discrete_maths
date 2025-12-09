#import "assets/base_template.typ": *

#show: base


= Elementary number theory

#fa-book() This chapter overlaps with sections 4.1, 4.3, 4.5 and 4.6 of Rosen.
// TODO: add 4.2?
// TODO: too long!


== Integer divisibility

The set of integers $ZZ$ is closed with respect to the operations of sum, subtraction, and product. In other words, for every $a, b in ZZ$, $a plus.minus b in ZZ$ and $a dot b in ZZ$. They also satisfy:
- $0$ is the identity with respect to the sum: $a + 0 = a$ for every $a in ZZ$.
- $1$ is the identity with respect to the product: $a dot 1 = a$ for every $a in ZZ$.
- For every $a in ZZ$, there exists a unique inverse element $-a in ZZ$ such that $a + (-a) = 0$.

However, the result of dividing two integers might not be an integer.

#definition(title: [Divisibility])[
  Given two integers $a != 0$ and $b$, we say that $a$ *divides* $b$ if there exists an integer $q in ZZ$ such that $b = a dot q$. If $a$ divides $b$, we say that $a$ is a *factor* or *divisor* of $b$ and that $b$ is a *multiple* of $a$. We denote $a divides b$ when $a$ divides $b$, and we write $a divides.not b$ when $a$ does not divide $b$.
]

#remark[
  - Every non-zero integer divides $0$:
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
  If $a divides b_i$ for $i = 1, ..., N$, then $a divides sum_(i=1)^N u_i dot b_i$ for all $u_i in ZZ$. In other words, any integer divides any linear combination with integer coefficients of its multiples.
]

#theorem(title: "The Division Algorithm")[
  Let $a$ and $b != 0$ be two integers. Then there exists a unique pair of integers $q$ and $r$ such that
  $ a = q dot b + r quad "with" 0 <= r < |b| $
] <thm-division-algo>

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

#remark[
  $mod$ is called the modulo or remainder operation, and $"div"$ the floor division or quotient operation. They both have associated symbols in most programming languages (respectively `%` and `//` in python, for instance).
]
// Rosen ex.24


== Modular Arithmetic
<sec-mod-arithmetic>

Modular arithmetic allows us to perform algebraic operations using, instead of a given set of numbers, their respective remainders with respect to some fixed positive number called the modulus.
This might sound convoluted but is actually fairly common.
For example, to answer the question "What day of the week will we be 10 days from now?", you use modular arithmetic.
We've already seen the operation notation $r = a mod b$, but to perform module arithmetic we need to introduce a related notation, which involves a relation instead.

#definition(title: "Congruence")[
  Let $a, b$ be integers, and let $m$ be a natural number. Then $a, b$ are congruent modulo $m$ if $m divides (a - b)$. This relation is denoted as $a equiv b (mod m)$. It is called a congruence with modulus $m$.
]

#proposition[
  1. $a equiv b (mod m)$ if and only if $a mod m = b mod m$.
  2. $a equiv b (mod m)$ if and only if $a = b + k dot m$ for some $k in ZZ$.
]

The congruence modulo $m$ between two integers thus indicates that they have the same remainder when they are divided by the modulus $m$.

#question-box[
  - Can you now translate "What day of the week will we be 10 days from now?" in modular arithmetic terms? Start with wondering: how can I represent days of the week numerically? Then, what is the modulus, here?
  - Can you find other examples of real-life problems involving congruences?
  // anything with cycle: so time-related stuff but also angles!
]

#theorem[
  For each positive integer $m$, the binary relation $equiv (mod m)$ is an equivalence relation, as defined in @sec-equiv-rels.
] <thm-mod-is-equiv>


=== The Quotient Set $ZZ_m$

A good way to visualize such problems of modular arithmetic is to imagine that the straight lines of integers gets rolled into a single circle with $m$ ticks:

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
// TODO: all below assumes knowledge of equivalence relations!
This is equivalent to defining the quotient set we'll introduce below!

#definition(title: "Congruence classes")[
  We define the congruence classes modulo $m$ as
  $ [a]_m = {b in ZZ | a equiv b (mod m)} = {a + m k | k in ZZ} $
]

#property[
  It follows from @thm-mod-is-equiv that congruence classes are equivalence classes, and thus from @thm-equiv-classes-partition that they form a partition of $ZZ$.

  Also, there are $m$ distinct equivalence classes corresponding to the $m$ possible remainders obtained by dividing an integer by $m$.
]

#theorem[
  The quotient set $ZZ_m = ZZ \/ equiv (mod m)$ is given by
  $ ZZ_m = {[a]_m | 0 <= a <= m - 1} $
]

*Remark:* Usually, the notation for $ZZ_m$ is a bit sloppy:
$ ZZ_m = {0, 1, 2, ..., m - 1} $

=== Modular Arithmetic

#theorem[
  Let $m$ be a positive integer. If $a_1 equiv b_1 (mod m)$ and $a_2 equiv b_2 (mod m)$, then:
  - $a_1 plus.minus a_2 equiv b_1 plus.minus b_2 (mod m)$.
  - $a_1 dot a_2 equiv b_1 dot b_2 (mod m)$.
]

#corollary[
  Let $m, k$ be positive integers, and let $a, b in ZZ$. If $a equiv b (mod m)$, then $a^k equiv b^k (mod m)$.
]

== Greatest common divisors and least common multiples

=== Definitions

#definition(title: "Greatest common divisor")[
  Let $a, b$ be integers which are not both zero. The largest positive integer $d$ that divides both $a$ and $b$ is called the *greatest common divisor* of $a$ and $b$. It is denoted by $gcd(a, b)$.
]

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

#lemma[
  Given the integers $a$, $b != 0$, $q$ and $r$, such that $a = q dot b + r$ with $0 <= r < |b|$, then $gcd(a, b) = gcd(b, r)$.
] <lma-euclid-algo>
// proof using @thm-divides

But how? Let's write $r_0 = |a|$, $r_1 = |b|$, $r_2 = r$ and $q_1 = q$ and apply the lemma successively:
$
      r_0 & = q_1 r_1 + r_2                   & 0 & <= r_2 < r_1, \
      r_1 & = q_2 r_2 + r_3                   & 0 & <= r_3 < r_2, \
   dots.v \
  r_(n-2) & = q_(n-1) r_(n-1) + r_(n) #h(2em) & 0 & <= r_n < r_(n-1), \
  r_(n-1) & = q_n r_n.
$
Since we have by @thm-division-algo that $|a| = r_0 > r_1 > dots > r_n >= 0$, this sequence of remainders cannot contain more than $|a|$ terms, so it has a finite size $n$. This means that there exists an $n$ such that $r_n divides r_(n-1)$. It then follows from @lma-euclid-algo that
$
  gcd(a, b) = gcd(|a|, |b|) = gcd(r_0, r_1) = gcd(r_1, r_2) = dots = gcd(r_(n-1), r_n) = r_n
$

#example[
  Apply recursively Euclid's lemma to compute $gcd(662, 414)$.
]

The $lcm$ is then straightforward to compute since we can use the following theorem.

#theorem[
  If $a, b$ are two natural numbers, then
  $ gcd(a, b) dot "lcm"(a, b) = a dot b $
]
// Rosen ex. 31

=== How to use them in modular arithmetic

#theorem(title: "Bézout's Identity")[
  If $a$ and $b$ are two integers not simultaneously zero, then there exist integers $x, y$ such that
  $ gcd(a, b) = a dot x + b dot y $
]

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

The identity allows us to redefine the $gcd$ through the following theorem.

#theorem[
  Let $a$ and $b$ be two integers not simultaneously zero with $gcd(a, b) = d$. An integer $c$ can be written in the form $a dot x + b dot y$ for some integers $x$ and $y$ if and only if $c$ is a multiple of $d$. In particular, the $gcd$ $d$ is the smallest positive integer of the form $a dot x + b dot y$ with $x, y in ZZ$.
]

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

#corollary[
  If $a, b$ are two relatively-prime integers, then:
  1. If $a divides c$ and $b divides c$, then $(a dot b) divides c$.
  2. If $a divides (b dot c)$, then $a divides c$.
]
// TODO: proofs?

#theorem[
  Let $m$ be a positive integer, and let $a, b, c$ be integers. If $a dot c equiv b dot c (mod m)$ and $gcd(c, m) = 1$, then $a equiv b (mod m)$.
]

#remark[
  - This theorem allows us to divide by a common factor $c$ both sides of the sign $equiv$ whenever $c$ and the modulus $m$ are relatively prime.
  - If $c$ and $m$ are not relatively prime, then the correct result is: Let us write $m = p dot c$ for positive integers $p, c$, and let $a, b$ be integers. If $a dot c equiv b dot c (mod p dot c)$, then $a equiv b (mod p)$.
]


== Prime Numbers

=== Definition

#definition(title: "Prime numbers")[
  A natural number $p > 1$ is called a *prime number* if the only positive divisors of $p$ are $1$ and $p$. A natural number $p > 1$ that is not prime is called *composite*.
]

#remark[
  The natural number $1$ is not prime. The first prime number is $2$, and the other prime numbers are odd natural numbers $(3, 5, 7, 11, ...)$.
]

#theorem(title: "Euclid")[
  There are infinitely many prime numbers.
]

=== Primes as building blocks

#theorem(title: "The Fundamental Theorem of Arithmetic")[
  Every natural number $n > 1$ can be written uniquely as a product of primes
  $ n = p_1^(n_1) dot p_2^(n_2) dot p_3^(n_3) dot ... dot p_k^(n_k) $
  where the $p_i$ are distinct prime numbers written in increasing order, and the exponents $n_i$ are natural numbers $n_i >= 1$.
]
// https://www.youtube.com/watch?v=46E0-XJuAXs

#theorem[
  The positive integer $n$ is a composite number if and only if $n$ can be divided by some prime number $p <= sqrt(n)$.
]

#lemma[
  Let $p$ be a prime number, and let $a, b$ be integers. Then:
  + Either $p divides a$, or $p$ and $a$ are relatively prime.
  + If $p divides (a dot b)$, then either $p divides a$ or $p divides b$.
]

#proposition[
  If the integers $a, b > 1$ can be factorized in the form
  $
    a & = p_1^(n_1) dot p_2^(n_2) ... p_k^(n_k) \
    b & = p_1^(m_1) dot p_2^(m_2) ... p_k^(m_k)
  $
  with $n_i, m_i >= 0$ and all prime factors of $a$ and $b$ appear in both decompositions, then
  $
      gcd(a, b) & = p_1^(min(n_1, m_1)) dot p_2^(min(n_2, m_2)) ... p_k^(min(n_k, m_k)) \
    "lcm"(a, b) & = p_1^(max(n_1, m_1)) dot p_2^(max(n_2, m_2)) ... p_k^(max(n_k, m_k))
  $
]

== Linear Congruence Equations
// TODO keep?

#definition[
  A congruence modulo $m$ of the form
  $ a dot x equiv b (mod m) $
  where $m$ is a positive integer, $a, b$ are integers, and $x$ is a variable is called a linear congruence equation.
]

*Remarks:*
- If there exists a unique solution of the linear congruence equation $a dot x equiv 1 (mod m)$, then solving this equation is equivalent to obtaining the multiplicative inverse of $a$ modulo $m$.
- If $x$ is a solution of a linear congruence equation, and $x' equiv x (mod m)$, then $x'$ is also a solution of that equation: $a dot x' equiv a dot x (mod m) equiv b (mod m)$.
- Therefore, the solutions of a linear congruence equation (if any) form classes of congruence modulo $m$: i.e., they are elements of $ZZ_m$.

=== Solving Linear Congruence Equations

#theorem[
  If $d = gcd(a, m)$, then the linear congruence equation
  $ a dot x equiv b (mod m) $
  has a solution if and only if $d divides b$. In this case and if $x_0$ is a particular solution of the linear congruence equation, the general solution is given by
  $ x_k = x_0 + (m dot k)\/d, quad k in ZZ $
  In particular, these solutions form $d$ congruence classes modulo $m$ with representatives:
  ${x_0, x_0 + m\/d, x_0 + (2m)\/d, ..., x_0 + (m(d - 1))\/d}$
]

#corollary[
  If $gcd(a, m) = 1$, the solutions $x$ of the linear congruence equation $a dot x equiv b (mod m)$ form a unique congruence class modulo $m$.
]

// why multiplicative inverse? to solve extra type of linear congruence eqs
#corollary[
  If $gcd(a, m) = 1$ with $m > 1$, then there exists a multiplicative inverse of $a$ modulo $m$. This multiplicative inverse is unique modulo $m$.
]

=== Arithmetic with $ZZ_m$
// TODO keep? put above if keep

The elements of $ZZ_m$ with $m in NN$ are equivalence classes modulo $m$. For the sake of simplicity, $x in ZZ_m$ represents that $x in [x]_m$.

The sum and the multiplication on $ZZ_m$ are defined as:
$
    x + y & = [x]_m + [y]_m = [x + y]_m \
  x dot y & = [x]_m dot [y]_m = [x dot y]_m
$

and they verify the usual properties: for every $x, y, z in ZZ_m$,
- Closure: $x + y in ZZ_m$ and $x dot y in ZZ_m$.
- Associativity: $x + (y + z) = (x + y) + z$ and $x dot (y dot z) = (x dot y) dot z$.
- Commutativity: $x + y = y + x$ and $x dot y = y dot x$.
- Distributivity: $x dot (y + z) = x dot y + x dot z$.
- Identity element (sum): $exists 0 in ZZ_m$ such that $0 + x = x$, $forall x in ZZ_m$.
- Identity element (product): $exists 1 in ZZ_m$ such that $1 dot x = x$, $forall x in ZZ_m$.
- Inverse element (sum): $forall x in ZZ_m$, $exists -x in ZZ_m$ such that $x + (-x) = 0$.

*Remark:* These properties are those characterizing a field [like $(RR, +, dot)$], except for the existence of a multiplicative inverse.

In $ZZ$ there does not exist in general the multiplicative inverse of an integer $x$: $y$ is the multiplicative inverse of $x$ if and only if $x dot y = 1$. However, two properties hold:
1. Cancellation law: If $x != 0$ and $x dot y = x dot z$, then $y = z$.
2. If $x dot y = 0$, then either $x = 0$ or $y = 0$.

None of these two properties holds in general in $ZZ_m$.

#definition[
  An element $x equiv.not 0 (mod m)$ of $ZZ_m$ is a divisor of zero if there exists an element $y equiv.not 0 (mod m)$ such that $x dot y equiv 0 (mod m)$.
]

*Remark:* In some books, the condition $x equiv.not 0 (mod m)$ is dropped.

#definition[
  An element $x in ZZ_m$ is a unit modulo $m$ if it has a multiplicative inverse modulo $m$; i.e., if there is an element $s in ZZ_m$ such that $x dot s equiv 1 (mod m)$.
]

#theorem[
  The multiplicative inverse of a unit modulo $m$ is unique.
]

*Remark:* As the inverse of a unit $r$ modulo $m$ is unique, it will be denoted by $r^(-1)$.

#theorem[
  An element $r in ZZ_m$ is invertible (i.e., it has a multiplicative inverse) if and only if $r$ and $m$ are relatively prime.
]

#corollary[
  If $p$ is a prime number, every nonzero element of $ZZ_p$ is invertible.
]

- If $p$ is prime, then $(ZZ_p, +, dot)$ is a field like $(RR, +, dot)$ or $(QQ, +, dot)$.
- If $m = p dot q$ is composite, then there are divisors of zero in $ZZ_m$: $p dot q equiv 0 (mod m)$ with $p, q equiv.not 0 (mod m)$. In this case, $(ZZ_m, +, dot)$ is a ring with divisors of zero.

#definition[
  Euler's (totient) function $phi : NN -> NN$ is defined as $phi(m)$ gives the number of invertible elements of $ZZ_m$.
]

#lemma[
  If $p$ is a prime number, then $phi(p) = p - 1$.
]

=== Euler's Theorem

#theorem(title: "Euler, 1790")[
  If $y$ is invertible in $ZZ_m$ (i.e., if $gcd(y, m) = 1$), then
  $ y^(phi(m)) equiv 1 (mod m) $
]

#corollary(title: "Fermat's Little Theorem")[
  If $p$ is a prime number and if $y equiv.not 0 (mod p)$, then
  $ y^(p-1) equiv 1 (mod p) $
]

#corollary[
  If $p$ is a prime number, then $y^p equiv y (mod p)$ for any integer $y$.
]

#theorem[
  1. If $p$ is a prime, then $phi(p^k) = p^(k-1)(p - 1)$ for every $k in NN$.
  2. If $gcd(m, n) = 1$, then $phi(m dot n) = phi(m) dot phi(n)$.
  3. If $n >= 2$ has the following decomposition in prime factors $n = product_(k=1)^r p_k^(n_k)$ with $n_k >= 1$, then $phi(n) = n dot product_(k=1)^r (1 - 1\/p_k)$.
]

== Applications

=== Random number generators

=== Cryptography

=== Further resources

- #link("https://www.youtube.com/watch?v=EK32jo7i5LQ")[Cool video on prime numbers] (and cool channel in general!)
