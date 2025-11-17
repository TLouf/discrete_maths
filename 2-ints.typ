#import "assets/base_template.typ": *

#show: base


= Integer and Modular Arithmetic

// TODO: too long!
This chapter covers:
1. Integer arithmetic:
  - Integer divisibility
  - Euclid's algorithm
  - Bézout's identity
  - Linear Diophantine equations
2. Modular arithmetic:
  - Linear congruences
  - Arithmetic on $ZZ_p$
  - Euler's $phi$ function. Euler's theorem

== Integer Divisibility

The set of integers $ZZ$ is closed with respect to the operations of sum, subtraction, and product. In other words, for every $a, b in ZZ$, $a plus.minus b in ZZ$ and $a dot b in ZZ$. They also satisfy:
- $0$ is the identity with respect to the sum: $a + 0 = a$ for every $a in ZZ$.
- $1$ is the identity with respect to the product: $a dot 1 = a$ for every $a in ZZ$.
- For every $a in ZZ$, there exists a unique inverse element $-a in ZZ$ such that $a + (-a) = 0$.

However, the result of dividing two integers might not be an integer.

#definition[
  Given two integers $a != 0$ and $b$, we say that $a$ divides $b$ if there is an integer $q in ZZ$ such that $b = a dot q$. If $a$ divides $b$, we say that $a$ is a factor of $b$ and that $b$ is a multiple of $a$. We denote $a | b$ when $a$ divides $b$, and we write $a parallel.not b$ when $a$ does not divide $b$.
]

*Remarks:*
- Every non-zero integer $a in ZZ \\ {0}$ divides $0$: $0 = a dot 0$ ($q = 0$).
- $1$ divides any $a in ZZ$: $a = 1 dot a$ ($q = a$).
- Any nonzero integer $a in ZZ \\ {0}$ divides itself: $a = a dot 1$ ($q = 1$).

== The Division Algorithm

#theorem(title: "The Division Algorithm")[
  Let $a$ and $b != 0$ be two integers. Then there exists a unique pair of integers $q$ and $r$ such that
  $ a = q dot b + r quad "with" 0 <= r < |b| $
  - The numbers $a$ and $b$ are called dividend and divisor, respectively.
  - The number $r$ is the remainder: $r = a mod b$.
  - The number $q$ is the quotient: $q = a "div" b = cases(floor(a\/b) & "if" b > 0, ceil(a\/b) & "if" b < 0)$
]

== Properties of Integer Division

#theorem[
  Let $a, b, c$ be integers. Then:
  1. If $a | b$ and $a | c$, then $a | (b + c)$.
  2. If $a | b$, then $a | (b dot c)$ for every $c in ZZ$.
  3. If $a | b$ and $b | c$, then $a | c$.
  4. If $c != 0$, then $a | b$ if and only if $(c dot a) | (c dot b)$.
  5. If $a | b$ and $b != 0$, then $|a| <= |b|$.
  6. If $a | b$ and $b | a$, then $a = plus.minus b$.
]

#theorem[
  If $a | b_i$ for $i = 1, ..., N$, then $a | sum_(i=1)^N u_i dot b_i$ for every $u_i in ZZ$.
]

== Greatest Common Divisor. Euclid's Lemma

#definition[
  Let $a, b$ be integers, not both simultaneously zero. The largest integer $d$ such that $d | a$ and $d | b$ is called the greatest common divisor of $a$ and $b$. It is denoted by $gcd(a, b)$.
]

*Remarks:*
- The case $a = b = 0$ is excluded because any integer divides $0$.
- $gcd(0, a) = |a|$ for every nonzero integer $a$.

#theorem[
  The greatest common divisor of two numbers is unique.
]

#definition[
  Two integers $a$ and $b$ are relatively prime if $gcd(a, b) = 1$. The integers $a_1, a_2, ..., a_n$ are pairwise relatively prime if $gcd(a_i, a_j) = 1$ for any $1 <= i < j <= n$.
]

#lemma(title: "Euclid")[
  Given the integers $a$, $b != 0$, $q$ and $r$, such that $a = q dot b + r$ with $0 <= r < |b|$, then $gcd(a, b) = gcd(b, r)$.
]

== Euclid's Algorithm

*Problem 9:* Apply recursively Euclid's lemma to compute $gcd(662, 414)$.

$
    a & = b dot q + r \
  662 & = 414 dot 1 + 248 \
  414 & = 248 dot 1 + 166 \
  248 & = 166 dot 1 + 82 \
  166 & = 82 dot 2 + 2 \
   82 & = 2 dot 41 + 0
$

$gcd(662, 414) = gcd(414, 248) = gcd(248, 166) = gcd(166, 82) = gcd(82, 2) = 2$.

In general, $gcd(a, b) = gcd(b, r_1) = gcd(r_1, r_2) = ... = gcd(r_(n-2), r_(n-1))$, where $r_(n-1)$ is the last nonzero remainder ($r_n = 0$). In the last step:
$ r_(n-2) = q_n dot r_(n-1) ==> r_(n-1) | r_(n-2) $
Therefore, $gcd(r_(n-2), r_(n-1)) = r_(n-1)$.

#theorem[
  In Euclid's algorithm, $gcd(a, b) = r_(n-1)$ (= the last nonzero remainder).
]

== Bézout's Identity

#theorem(title: "Bézout's Identity, 1730-1783")[
  If $a$ and $b$ are two integers not simultaneously zero, then there exist integers $u, w$ such that
  $ gcd(a, b) = a dot u + b dot w $
]

*Proof:* We write the steps of Euclid's algorithm, and "unroll them":
$
        a & = q_1 dot b + r_1 ==> r_1 = a - q_1 dot b \
        b & = q_2 dot r_1 + r_2 ==> r_2 = b - q_2 dot r_1 \
      r_1 & = q_3 dot r_2 + r_3 ==> r_3 = r_1 - q_3 dot r_2 \
          & dots.v \
  r_(n-4) & = q_(n-2) dot r_(n-3) + r_(n-2) ==> r_(n-2) = r_(n-4) - q_(n-2) dot r_(n-3) \
  r_(n-3) & = q_(n-1) dot r_(n-2) + r_(n-1) ==> r_(n-1) = r_(n-3) - q_(n-1) dot r_(n-2) \
  r_(n-2) & = q_n dot r_(n-1) + (r_n = 0) ==> r_(n-1) = gcd(a, b)
$

Then,
$
  gcd(a, b) = r_(n-1) & = alpha_(n-1) r_(n-3) + beta_(n-1) r_(n-2) \
                      & = alpha_(n-2) r_(n-4) + beta_(n-2) r_(n-3) \
                      & = ... \
                      & = alpha_3 r_1 + beta_3 r_2 \
                      & = alpha_2 b + beta_2 r_1 \
                      & = alpha_1 a + beta_1 b
$

*Important remark:* Bézout's identity does not imply that the integers $u, v$ are unique.

#theorem[
  Let $a$ and $b$ be two integers not simultaneously zero with $gcd(a, b) = d$. An integer $c$ can be written in the form $a dot x + b dot y$ for some integers $x, y$ if and only if $c$ is a multiple of $d$. In particular, $d$ is the smallest positive integer of the form $a dot x + b dot y$ with $x, y in ZZ$.
]

#corollary[
  Two integers are relatively prime if and only if there exist integers $x, y$ such that $a dot x + b dot y = 1$.
]

#corollary[
  If $gcd(a, b) = d$, then
  1. $gcd(m dot a, m dot b) = m dot d$ for every $m in NN$.
  2. $gcd(a\/d, b\/d) = 1$.
]

#corollary[
  If $a, b$ are two relatively-prime integers, then:
  1. If $a | c$ and $b | c$, then $(a dot b) | c$.
  2. If $a | (b dot c)$, then $a | c$.
]

== Least Common Multiple

#definition[
  The least common multiple of two natural numbers $a, b$ is the least natural number $m$ such that $a | m$ and $b | m$. It is denoted by $"lcm"(a, b)$.
]

*Remark:* This number exists because the set of natural numbers $NN$ is a well-ordered set (see next chapter).

#theorem[
  If $a, b$ are two natural numbers, then
  $ gcd(a, b) dot "lcm"(a, b) = a dot b $
]

== Prime Numbers

#definition[
  A natural number $p > 1$ is called a prime number if the only positive factors of $p$ are $1$ and $p$. A natural number $p > 1$ that is not prime is called composite.
]

*Remark:* The natural number $1$ is not prime. The first prime number is $2$, and the other prime numbers are odd natural numbers $(3, 5, 7, 11, ...)$.

#theorem(title: "Euclid")[
  There are infinitely many prime numbers.
]

#theorem[
  The positive integer $n$ is a composite number if and only if $n$ can be divided by some prime number $p <= sqrt(n)$.
]

#lemma[
  Let $p$ be a prime number, and let $a, b$ be integers. Then:
  (a) Either $p | a$, or $p$ and $a$ are relatively prime.
  (b) If $p | (a dot b)$, then either $p | a$ or $p | b$.
]

== The Fundamental Theorem of Arithmetic

#theorem(title: "The Fundamental Theorem of Arithmetic")[
  Every natural number $n > 1$ can be written uniquely as a product of primes
  $ n = p_1^(n_1) dot p_2^(n_2) dot p_3^(n_3) dot ... dot p_k^(n_k) $
  where the $p_i$ are distinct prime numbers written in increasing order, and the exponents $n_i$ are natural numbers $n_i >= 1$.
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

== Linear Diophantine Equations [Diophantus of Alexandria, IIIrd century]

#definition[
  A Diophantine equation is an equation of one or several variables such that we are only interested in their integer solutions.
]

#theorem(title: "Brahmagupta, VIIth century")[
  The linear equation
  $ a dot x + b dot y = c $
  where $a, b, c$ are integers (and $a, b$ not simultaneously zero), admits integer solutions if and only if $d = gcd(a, b)$ divides $c$. In this case, there exist infinitely many integer solutions $(x_k, y_k)$ with $k in ZZ$ given by
  $
    x_k & = u dot p + (b dot k)\/d \
    y_k & = w dot p - (a dot k)\/d
  $
  where $p = c\/d in ZZ$ and $u, w$ are given by
  $ d = u dot a + w dot b $
]

== Modular Arithmetic

Modular arithmetic allows us to perform algebraic operations using, instead of a given set of numbers, their respective remainders with respect to some fixed positive number called the modulus. The modulus is $12$ or $24$ when we count hours with a clock, $7$ when we count days in a week, etc.

#definition[
  Let $a, b$ be integers, and let $m$ be a natural number. Then $a, b$ are congruent modulo $m$ if $m | (a - b)$. This relation is denoted as $a equiv b (mod m)$.
]

#proposition[
  1. $a equiv b (mod m)$ if and only if $a mod m = b mod m$.
  2. $a equiv b (mod m)$ if and only if $a = b + k dot m$ for some $k in ZZ$.
]

#theorem[
  For each positive integer $m$, the binary relation $equiv (mod m)$ is an equivalence relation.
]

== The Quotient Set $ZZ_m$

The equivalence classes (or congruence classes) modulo $m$
$ [a]_m = {b in ZZ | a equiv b (mod m)} = {a + m k | k in ZZ} $
form a partition of $ZZ$. There are $m$ distinct equivalence classes corresponding to the $m$ possible remainders obtained by dividing an integer by $m$.

#theorem[
  The quotient set $ZZ_m = ZZ \/ equiv (mod m)$ is given by
  $ ZZ_m = {[a]_m | 0 <= a <= m - 1} $
]

*Remark:* Usually, the notation for $ZZ_m$ is a bit sloppy:
$ ZZ_m = {0, 1, 2, ..., m - 1} $

== Modular Arithmetic

#theorem[
  Let $m$ be a positive integer. If $a_1 equiv b_1 (mod m)$ and $a_2 equiv b_2 (mod m)$, then:
  - $a_1 plus.minus a_2 equiv b_1 plus.minus b_2 (mod m)$.
  - $a_1 dot a_2 equiv b_1 dot b_2 (mod m)$.
]

#corollary[
  Let $m, k$ be positive integers, and let $a, b in ZZ$. If $a equiv b (mod m)$, then $a^k equiv b^k (mod m)$.
]

#theorem[
  Let $m$ be a positive integer, and let $a, b, c$ be integers. If $a dot c equiv b dot c (mod m)$ and $gcd(c, m) = 1$, then $a equiv b (mod m)$.
]

*Remarks:*
- This theorem allows us to divide by a common factor $c$ both sides of the sign $equiv$ whenever $c$ and the modulus $m$ are relatively prime.
- If $c$ and $m$ are not relatively prime, then the correct result is: Let us write $m = p dot c$ for positive integers $p, c$, and let $a, b$ be integers. If $a dot c equiv b dot c (mod p dot c)$, then $a equiv b (mod p)$.

== Modular Division: Linear Congruence Equations

#definition[
  A congruence modulo $m$ of the form
  $ a dot x equiv b (mod m) $
  where $m$ is a positive integer, $a, b$ are integers, and $x$ is a variable is called a linear congruence equation.
]

*Remarks:*
- If there exists a unique solution of the linear congruence equation $a dot x equiv 1 (mod m)$, then solving this equation is equivalent to obtaining the multiplicative inverse of $a$ modulo $m$.
- If $x$ is a solution of a linear congruence equation, and $x' equiv x (mod m)$, then $x'$ is also a solution of that equation: $a dot x' equiv a dot x (mod m) equiv b (mod m)$.
- Therefore, the solutions of a linear congruence equation (if any) form classes of congruence modulo $m$: i.e., they are elements of $ZZ_m$.

== Linear Congruence Equations

#theorem[
  If $d = gcd(a, m)$, then the linear congruence equation
  $ a dot x equiv b (mod m) $
  has a solution if and only if $d | b$. In this case and if $x_0$ is a particular solution of the linear congruence equation, the general solution is given by
  $ x_k = x_0 + (m dot k)\/d, quad k in ZZ $
  In particular, these solutions form $d$ congruence classes modulo $m$ with representatives:
  ${x_0, x_0 + m\/d, x_0 + (2m)\/d, ..., x_0 + (m(d - 1))\/d}$
]

#corollary[
  If $gcd(a, m) = 1$, the solutions $x$ of the linear congruence equation $a dot x equiv b (mod m)$ form a unique congruence class modulo $m$.
]

#corollary[
  If $gcd(a, m) = 1$ with $m > 1$, then there exists a multiplicative inverse of $a$ modulo $m$. This multiplicative inverse is unique modulo $m$.
]

== Arithmetic with $ZZ_m$

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
  An element $x not equiv 0 (mod m)$ of $ZZ_m$ is a divisor of zero if there exists an element $y not equiv 0 (mod m)$ such that $x dot y equiv 0 (mod m)$.
]

*Remark:* In some books, the condition $x not equiv 0 (mod m)$ is dropped.

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
- If $m = p dot q$ is composite, then there are divisors of zero in $ZZ_m$: $p dot q equiv 0 (mod m)$ with $p, q not equiv 0 (mod m)$. In this case, $(ZZ_m, +, dot)$ is a ring with divisors of zero.

#definition[
  Euler's (totient) function $phi : NN -> NN$ is defined as $phi(m)$ gives the number of invertible elements of $ZZ_m$.
]

#lemma[
  If $p$ is a prime number, then $phi(p) = p - 1$.
]

== Euler's Theorem

#theorem(title: "Euler, 1790")[
  If $y$ is invertible in $ZZ_m$ (i.e., if $gcd(y, m) = 1$), then
  $ y^(phi(m)) equiv 1 (mod m) $
]

#corollary(title: "Fermat's Little Theorem")[
  If $p$ is a prime number and if $y not equiv 0 (mod p)$, then
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
