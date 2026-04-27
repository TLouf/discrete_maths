#import "../../../assets/exam_template.typ": *

#show: doc => exam(
  [Discrete Mathematics],
  [Bachelor in Artificial Intelligence],
  datetime(year: 2026, month: 2, day: 27),
  is_final: false,
  checksum: false,
  doc,
)


_You must show your derivations, with properly-justified steps, in order to be awarded points. You have a maximum of one hour and a half to hand in your exam._


=

+ #image("sym_diff_in_subset.svg", height: 4cm)

+
  - Reflexivity: $X triangle X = emptyset subset.eq K$ so $X rel X$.
  - Symmetry: comes from the symmetry of the symmetric difference.
  - Transitivity: consider $X, Y, Z$ such that $X rel Y$ and $Y rel Z$. Using the hint, we have that
    $
      X triangle Z = (X triangle Y) triangle (Y triangle Z) subset.eq (X triangle Y) union (Y triangle Z) subset.eq K union K = K
    $
    Hence $X rel Z$.
+ The classes are:
  - $[ emptyset ]_R = {emptyset, {c}}$
  - $[ {a} ]_R = {{a}, {a,c}}$
  - $[ {b} ]_R = {{b}, {b,c}}$
  - $[ {a,b} ]_R = {{a,b}, {a,b,c}}$


=

+
  - It is a properly-defined function by the fundamental theorem of arithmetic.
  - It is not injective because, for instance, $f(6) = f(12) = 6$.
  - It is not surjective because, for instance, $12 = 2^2 dot 3$ cannot be written as a product of primes with only unit powers, again by the fundamental theorem of arithmetic.

+
  - Reflexivity: $forall a, f(a) divides f(a)$ so yes.
  - Antisymmetry: since $f$ is not injective ($f(a) = f(b) cancel(=>) a = b$), this actually depends on the values present in $A$! Here, there's no $a,b in A$ distinct such that $f(a) = f(b)$ so the relation is antisymmetric, but if we had instead, for instance, $B = A union {2}$, then $(B,R)$ would not be a poset because $f(2) divides f(4)$ and $f(4) divides f(2)$, since $f(4) = f(2) = 2$.
  - Transitivity: let's consider $a,b,c in A$, all distinct, such that $a rel b$ and $b rel c$. Then,
    $
      exists k_1, k_2, cases(
        f(b) = k_1 f(a),
        f(c) = k_2 f(b)
      ) => f(c) = (k_1 k_2) f(a)
    $
    So $f(a) divides f(c)$ with quotient $k_1 dot k_2$, thus $a rel c$.

+ The Hasse diagram is:
  #align(center)[
    ```
       14   6  15
      /  \ / \ /
     7    4   9
    ```
  ]
  The set of minimal elements is ${7, 4, 9}$, and the one of maximal elements is ${14, 6, 15}$. There is no minimum and no maximum.

+ Upper bounds: ${6}$, and no lower bounds because no element in $A$ precedes $4$ and $9$.

// #pagebreak()

=

+ First, this is a congruence modulo $26$. The encrypted letter is obtained by multiplying the input letter $x in ZZ_26$ by $a$, and computing the remainder of the obtained number when divided by $26$. So:
  $
    y equiv a x (mod 26)
  $

+ I would need to know the value of $a$, and check that $a$ is relatively prime with $26$, because otherwise the congruence does not admit a unique solution in $ZZ_26$.
  If they are relatively prime, I compute the inverse of $a$ modulo $26$, and then compute $a^(-1) dot y$ for each $y$ in order to obtain each $x$.

+ First, $7$ is relatively prime to $26$ so the encryption is properly defined.
  Writing the Euclid algorithm I get:
  $
    26 = 3 dot 7 + 5 \
    7 = 1 dot 5 + 2 \
    5 = 2 dot 2 + 1
  $
  and unrolling it, I get:
  $
    1 & = 5 - 2 dot 2 \
      & = 5 - 2 dot (7 - 1 dot 5) = 3 dot 5 - 2 dot 7 \
      & = 3 dot (26 - 3 dot 7) - 2 dot 7 = 3 dot 26 - 11 dot 7
  $
  which allows me to identify
  $
    a^(-1) = -11 mod 26 = 15.
  $
  We then have two letters to decrypt:
  - $a^(-1) dot 25 equiv 375 (mod 26) equiv 11 (mod 26)$
  - $a^(-1) dot 20 equiv 300 (mod 26) equiv 14 (mod 26)$
  $11$ and $14$ correspond to the letters `L` and `O`, respectively, so the decrypted message is `LOL`.

  *For $m=25$*:

  First, $7$ is relatively prime to $25$ so the encryption is properly defined.
  Writing the Euclid algorithm I get:
  $
    25 = 3 dot 7 + 4 \
    7 = 1 dot 4 + 3 \
    4 = 1 dot 3 + 1
  $
  and unrolling it, I get:
  $
    1 & = 4 - 1 dot 3 \
      & = 4 - 1 dot (7 - 1 dot 4) = 2 dot 4 - 1 dot 7 \
      & = 2 dot (25 - 3 dot 7) - 1 dot 7 = 2 dot 25 - 7 dot 7
  $
  which allows me to identify
  $
    a^(-1) = -7 mod 25 = 18.
  $
  We then have two letters to decrypt:
  - $a^(-1) dot 25 equiv 450 (mod 25) equiv 0 (mod 25)$
  - $a^(-1) dot 20 equiv 360 (mod 25) equiv 10 (mod 25)$
  $0$ and $10$ correspond to the letters `A` and `K`, respectively, so the decrypted message is `AKA`.
