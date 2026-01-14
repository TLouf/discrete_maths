#import "assets/base_template.typ": *
#show: base
#set document(title: "Discrete Mathematics @ UC3M - Answers to exercises")
#show: el.config.ref.with(supplement: "Question")

#set page(
  margin: 1.5cm,
  footer: [
    #set text(gray)
    Discrete Mathematics @ UC3M - Answers to exercises
  ],
)

#set enum(full: true, numbering: (..nums) => {
  let level = nums.pos().len() - 1
  if level == 0 {
    text(weight: "bold")[#context { counter(heading).display() }.#numbering("1", ..nums)]
  } else {
    numbering("(i)", nums.pos().last())
  }
})
#show heading.where(level: 1): h => {
  pagebreak(weak: true)
  h
}
#set heading(numbering: "1")

= Set theory

+
  + True.
  + False.
  + False.
  + True
  + True
  + False
  + False.

+
  + True.
  + False.
  + True.
  + True.
  + True.
  + False.

+ $A = {1}, B = {1, {1}}$

+ Suppose $A subset.eq B$, take $S subset.eq A in cal(P) (A)$, prove it is in $cal(P) (B)$, so prove $S subset.eq B$. Then suppose $cal(P) (A) subset.eq cal(P) (B)$, take $a in A$, prove it is in $B$.

+ Hint: use Venn diagrams or truth tables.

+
  + $A$.
  + $B inter C$.

+
  + $union_(i=0)^(+ oo) A_i = NN, inter_(i=0)^(+ oo) A_i = {0}$
  + $union_(i=0)^(+ oo) A_i = ZZ, inter_(i=0)^(+ oo) A_i = ZZ^-$

+ The set of triples $(a, b, c)$, where $a$ is an airline and $b$ and $c$ are cities. It can thus represent all the possible combinations of air trips between European cities.

+ A collision is when $d$ is a relation, but not a function.

+ Setting a primary key makes the relation a function.
  Rows can then be uniquely identified and thus queried faster, and unintended duplicates cannot appear, avoiding unexpected behaviours.

+
  - $f$ is not injective nor surjective.
  - $g$ is injective; but it is not surjective.

+ $F$ is bijective, and there exists the inverse function $F^(-1): RR without {1\/2} arrow RR without {-1\/2}$ defined as follows:
  $ F^(-1)(x) = (x - 3)/(1 - 2x) . $

+
  1. The graphics are [floor and ceiling function graphs]
  2. $floor(1\/2) = 0$. $ceil(1\/2) = 1$. $floor(-1\/2) = -1$. $ceil(-1\/2) = 0$. $floor(pi) = 3$. $ceil(pi) = 4$. $floor(1\/2 + ceil(1\/2)) = 1$. $ceil(floor(1\/2) + ceil(1\/2) + 1\/2) = 2$.
  3. $70754$ groups.

+
  1. Injective, not surjective, and not bijective.
  2. Injective, surjective, and bijective.
  3. It is not injective, not surjective, and not bijective.
  4. It is not injective, not surjective, and not bijective.


= Relations

+
  + Yes.
  + Yes.
  + No: not transitive (can have 4 different parents for 3 children).
  + No: not transitive (same as above, basically).
  + No: same.

+ Can be being from the same city, went to the same highschool, will get the same mark...

+
  + It is an equivalence relation (so reflexive, symmetric and transitive).
  + $B$ is the set of bit strings. $R$ is still an equivalence relation.

+ The quotient set is isomorphic to $op("Im")(f)$. #let rel-same-function-image = [Question *2.1*] //#el.elabel("lab") <rel-same-function-image>

+
  + Use #rel-same-function-image.
  + $cal(P)(A)\/R = {[C]_R : C in cal(P)(B)}$, and it is isomorphic to $cal(P)(B)$.

+
  + Use #rel-same-function-image.
  + $NN times NN\/R = {[(N, 1)]_R : N >= 1}$, and it is isomorphic to $NN$. $NN$ is obviously isomorphic to $NN without {1}$: use the bijective function $f : NN -> NN without {1}$ such that $f(n) = n + 1$.

+
  + Use #rel-same-function-image.
  + The equivalence classes are $[1]_R = {1, 2, 3}$, $[4]_R = {4, 5, 6, 7, 8}$, and $[9]_R = {9, 10, 11, 12, 13, 14, 15}$.
  + $A\/R = {[1]_R, [4]_R, [9]_R}$.

+
  + Use #rel-same-function-image.
  + $RR times (RR without {0}) \/ R = {[(K, 1)]_R : K in RR}$.

+ You have to show the implications in both directions:
  + If $R$ is an equivalence relation, then $R$ is circular and reflexive.
  + If $R$ is a circular and reflexive relation, then $R$ is an equivalence relation.

+ 1) False. 2) True.

+ $a = b = 0$, and $c = 1$.

+
  + It is an equivalence relation by #rel-same-function-image with $f : ZZ -> ZZ$ defined by $f(x) = x mod 2$. As $op("Im") f = {0, 1}$, there are two classes of equivalence:
    $ [0]_R = {x in ZZ : x "is even"}, $
    $ [1]_R = {x in ZZ : x "is odd"}. $
    and the quotient set is
    $ ZZ\/R = {[0]_R, [1]_R}. $

  + It is an equivalence relation by #rel-same-function-image with $f : ZZ -> ZZ$ defined by $f(x) = x^2 - x$. If $v, w$ belongs to the same equivalence class, they should satisfy
    $ v^2 - w^2 = (v - w)(v + w) = v - w ==> cases(v = w, v + w = 1 "if" v != w) $
    Therefore, the equivalence classes have two elements:
    $ [n]_R = {n, 1 - n}. $
    The quotient set is
    $ ZZ\/R = {[n]_R : n in NN}, $
    and it is isomorphic to $NN$. The equivalence class containing 2005 is
    $ [2005]_R = {2005, -2004}. $

  + It is an equivalence relation by #rel-same-function-image with $f : RR^2 -> RR^2$ defined by $f(x, y) = x y$. The equivalence classes are given by those points in $RR^2$ satisfying $x y = alpha$, where $alpha$ is a constant: each equivalence class is a $45°$-rotated standard hyperbola. In particular, $alpha > 0$ corresponds to a hyperbola on the first and third quadrants; $alpha = 0$ to the coordinate axes; and $alpha < 0$ to a hyperbola on the second and fourth quadrants. The equivalence classes are:
    $ [(1, alpha)]_R = {(x, y) in RR^2 : x y = alpha}. $
    The quotient set is:
    $ RR^2\/R = {[(1, alpha)]_R : alpha in RR}, $
    therefore, such set is isomorphic to $RR$.

  + It is an equivalence relation by #rel-same-function-image with $f : RR^2 -> RR^2$ defined by $f(x, y) = x^2 - y^2$. The equivalence classes are given by those points in $RR^2$ satisfying $x^2 - y^2 = alpha$, where $alpha$ is a constant. The equivalence classes are standard hyperbolas with asymptotes $y = plus.minus x$. In particular, $alpha > 0$ corresponds to a hyperbola that crosses the $x$-axis at $plus.minus sqrt(alpha)$. If $alpha = 0$, the equivalence class consists precisely in the lines $y = plus.minus x$. Finally, if $alpha < 0$, we have a $90°$-rotated hyperbola that crosses the $y$-axis at $y = plus.minus sqrt(-alpha)$. The equivalence classes are:
    $ [(sqrt(alpha), 0)]_R = {(x, y) in RR^2 : x^2 - y^2 = alpha}, quad alpha >= 0 $
    $ [(0, sqrt(-alpha))]_R = {(x, y) in RR^2 : x^2 - y^2 = alpha}, quad alpha < 0 $
    The quotient set is:
    $ RR^2\/R = {[(sqrt(alpha), 0)]_R : alpha >= 0} union {[(0, sqrt(-alpha))]_R : alpha < 0}, $
    therefore, such set is isomorphic to $RR$.

  + It is an equivalence relation by #rel-same-function-image with $f : RR^2 -> RR^2$ defined by $f(x, y) = x^2 + y^2$. The equivalence classes are given by those points in $RR^2$ satisfying $x^2 + y^2 = alpha^2 >= 0$, where $alpha$ is a constant. Therefore, the equivalence classes are circumferences of radius $alpha >= 0$:
    $ [(alpha, 0)]_R = {(x, y) in RR^2 : x^2 + y^2 = alpha^2 "and" alpha >= 0}. $
    The quotient set is
    $ RR^2\/R = {[(alpha, 0)]_R : alpha >= 0}, $
    therefore, such set is isomorphic to $RR^+ = {x in RR : x >= 0}$.

+
  + ${(a,a), (b,b), (a,b), (b,a)}$ for ${a,b}$, ${(c,c), (d,d), (c,d), (d,c)}$ for ${c,d}$, ...
  + ${(a,a)}$ for ${a}$, ${(b,b)}$ for ${b}$, ...

+
  + No (first overlaps with other two).
  + Yes.
  + No (misses $(0,0)$).

+
  + $op("Dom")(R) = op("Im")(R) = A$.
  + The Hasse diagram is:
    #align(center)[
      ```
      4
      │
      3 ─────┐
      │      │
      2      5
      │
      1
      ```
    ]
// + $1 prec.eq 2 prec.eq 5 prec.eq 3 prec.eq 4$.

+
  + Set of maximal elements = ${(1, 8), (1, 5), (0, 8), (2, 8), (2, 5)}$.
  + Set of minimal elements = ${(1, 2), (0, 2), (0, 5), (2, 5)}$.
  + $max(A)$ and $min(A)$ do not exist.

+
  + Set of maximal elements = ${(x, y) in C : x, y >= 0}$.
  + Set of minimal elements = ${(x, y) in C : x, y <= 0}$.
  + $sup(C) = (1, 1)$ and $inf(C) = (-1, -1)$.

+
  + The proof is straightforward. $R_2$ is an order relation. Both relations are partial orders.
  + The Hasse diagram for $R_1$ is:
    #align(center)[
      ```
      ┌ 2 ┐  3
      │   │  │
      4   8  9  7  5  6  1
      ```
    ]
    The Hasse diagram for $R_2$ is:
    #align(center)[
      ```
        ┌ 2 ┐  3
        │   │  │
        4   8  9  7  5  6
        └───┴──┴──┴──┴──┘
                1
      ```
    ]
  + $R_1$: set of maximal elements = ${1, 2, 3, 5, 6, 7}$; set of minimal elements = ${1, 4, 8, 9, 5, 6, 7}$; $max(A)$ and $min(A)$ do not exist.

    $R_2$: set of maximal elements = ${2, 3, 5, 6, 7}$; set of minimal elements = ${1}$; $max(A)$ does not exist; but $min(A) = 1$.

  + $R_1$: $op("major")(A) = op("minor")(A) = emptyset$, therefore, $sup(A)$ and $inf(A)$ do not exist.

    $R_2$: $op("major")(A) = emptyset$, therefore $sup(A)$ does not exist; $op("minor")(A) = {1}$, and $inf(A) = 1$.


+ The base case is $n = 3$: the sum of the internal angles of a triangle is equal to $pi = (3 - 2)pi$ (Euclid's axiom). A convex polygon of $n = 6$ sides is a hexagon.

+ Once the induction hypothesis is used, the final result followed by using the inequalities $3 > 2 > 1$.

+ The general formula for the product of odd numbers is $1 dot 3 dot 5 dots.c (2n - 1) = (2n!)/(2^n dot n!)$.


= Elementary number theory

+
  + 7:00
  + 8:00
  + 10:00

+ $gcd(92, 84) = 4 = 11 dot 84 - 10 dot 92$.

+ The set of solutions is:
  $ {(2, 630), (10, 126), (14, 90), (18, 70), (630, 2), (126, 10), (90, 14), (70, 18)}. $

+
  + $1728$.
  + $576$.
  + $0$.

+ Prove it by contradiction using the fundamental theorem of arithmetic.

+ You only need to prove that $p divides.not 101$ for $p = 2, 3, 5, 7$. Why?

+ As any integer $a$ can be written as $a = 6q + r$ with $r in {0, 1, 2, 3, 4, 5}$, it suffices to prove the statement for each possible remainder $r$.

+ 55.

+
  + $x equiv 6 (mod 13)$.
  + There are two solutions: $x equiv 4 (mod 10)$ and $x equiv 9 (mod 10)$.
  + There are no solutions.
  + There are three solutions: $x equiv 3 (mod 15)$, $x equiv 8 (mod 15)$, and $x equiv 13 (mod 15)$.

+ Hint: First prove that $p | (a^25 - a)$ for $p = 2, 3, 5$.

+ Suppose that $x^2 equiv 1 (mod p)$. Then $p$ divides $x^2 − 1 = (x + 1)(x − 1)$. So $p ∣ x + 1$ or $p ∣ x − 1$, so $x equiv −1 (mod p)$ or $x equiv 1 (mod p)$.

+ It is an equivalence relation (use #rel-same-function-image), and the equivalence classes are $[6]_R = {6, 12, 18}$, $[10]_R = {10, 40}$, and $[21]_R = {21, 441, 1323}$.

+
  + Set of maximal elements = ${8, 9, 10, 12}$.
  + Set of minimal elements = ${2}$.
  + $max(A)$ does not exist; but $min(A) = 2$.

+ Note: this statement can be proven by using modular arithmetic (without induction); but we look for a proof that makes explicit use of mathematical induction.

+ In the inductive step, it is easier to use a proof by contradiction.

= Counting

+
  + Relation is subset of $A times A$ of cardinality $n^2$, so $2^(n^2)$.
  + $2^(n^2 - n)$ (like removing diagonal elements of matrix).
  + $2^(n (n+1) / 2)$. See as independent binary choices to include ordered pair in relation or not. Two kinds of choices: for diagonal elements, have $2^n$ valid choices. For off-diagonal: $n (n-1) / 2$ unordered pairs: for each, can either include both $(a,b)$ and $(b,a)$ only, or neither, because of symmetry, which leads to $2^(n (n-1) / 2)$ valid choices. Since choices are independent, multiply the two to get the result.
  + $2^n dot 3^(n (n-1) / 2)$. Here again two cases: diagonal: $2^n$ choices and off-diagonal: $n (n-1) / 2$ unordered pairs: for each, can include $(a,b)$ only, $(b,a)$ only, or neither, because of antisymmetry, which leads to $3^(n (n-1) / 2)$ possible choices.

+
  1. $2^n$.
  2. $2^(n-2)$ with $n >= 2$.
  3. $sum_(k=1)^n 2^k = 2^(n+1) - 2$.
  4. $n$.
  5. $sum_(k=3)^(n-3) binom(n, k)$ with $n >= 6$.
  6. $2^(n-2) + 2^(n-3) - 2^(n-5)$ with $n >= 5$.
  7. $2^(ceil(n\/2))$.

+
  1. $P(9,5) dot 6 = 90 720$.
  2. $P(8,4) dot 6 dot 5 = 50 400$.
  3. $8^2 dot 7 dot 6^2 dot 5 = 80 640$.
  4. $8 dot 7 dot 6 dot 5^2 dot 2 = 16 800$.
  5. $8 dot 7 dot 6 dot 5^2 dot 4 = 33 600$.
  6. $7 dot 6^2 dot 5^2 dot 4 = 8 400$.

+ Not considering leap years, it is $1 - 365! / ((365 - 50)! dot 365^50) approx 0.97$.

+ $3^5 - 3 times 2^5 + 3 = 150$.

+ If we assume that the spaces between two consecutive flags are immaterial, the results are:
  + $1464$.
  + $1884$.

+ $binom(8, 3)$.

+
  + $360$.
  + $120$.

+
  1. $10 times 9 times 8 times 7$.
  2. $binom(10, 4)$.
  3. $binom(13, 4)$.
  4. $10^4$.

+ $binom(11, 6)$.

+
  + $5148 (∼ 0.2%)$.
  + $48 (∼ 0.002%)$.
  + $624 (∼ 0.02%)$.
  + $24 (∼ 0.0009%)$.
  + $288 (∼ 0.01%)$.
  + $3744 (∼ 0.1%)$.

+ $binom(a+1, k+1) binom(b-1, k)$.

+ $binom(12, 4)$.

+ $binom(n-p+1, p)$.

+
  + $binom(19, 2)$.
  + $binom(16, 2)$.
  + $binom(19, 2) - 3 binom(12, 2) + 3 binom(5, 2) = 3$.

+ $binom(17, 6) - 7 binom(12, 6) + binom(7, 2) binom(7, 1) = 6055$.

+
  1. $4^8$.
  2. $binom(r-1, n-1)$.
  3. $binom(19, n-1)$.

+
  1. $frac(20!, (4!)^5 5!)$.
  2. $frac(20!, (4!)^5)$.

+ $binom(2 n, n + 1) + binom(2 n, n) = binom(2 n + 1, n + 1) = 1/2 (binom(2 n + 1, n + 1) + binom(2 n + 1, n + 1)) = 1/2 (binom(2 n + 1, n + 1) + binom(2 n + 1, n)) = 1/2 binom(2 n + 2, n+1)$

+
  + From the definition of binomial coefficients we can get that $binom(n, k-1) = k / (n_k+1) binom(n, k)$, hence the less than inequalities. The "greater than" ones follow by symmetry of the coefficients.
  + The previous question tells us that $binom(n, floor(n/2))$ is the largest of the coefficients $binom(1, n), dots, binom(n, n-1)$, so it's greater than or equal to their average, which is $(2^n - 2) / (n-1)$, and $(2^n - 2) / (n-1) - 2^n / n = (2^n - 2n) / (n (n-1)) >= 0$ for $n>=2$, hence the result.


= Sequences

+
  - $a_n = a_(n-1) + n$ for all $n >= 2$ and $a_1 = 2$.
  - $a_n = (n^2 + n + 2)\/2$ for all $n >= 1$.

+ $29525$.

+ $a_n = 2a_(n-1) + 3a_(n-2)$ for all $n >= 2$ with $a_0 = 1$ and $a_1 = 2$.

+ $a_n = 1/sqrt(5) [(frac(1 + sqrt(5), 2))^(n+2) - (frac(1 - sqrt(5), 2))^(n+2)]$ for all $n >= 1$.

+ $a_n = 1/2 (3^n - 1)$ for all $n >= 1$.

+ $a_n = (3 - n) 2^(n-2)$ for all $n >= 1$.

+ $a_n = 1/2 [(1 + sqrt(2))^(n+1) + (1 - sqrt(2))^(n+1)]$ for all $n >= 1$.

+ $a_n = 2^n + 2(-1)^n$ for all $n >= 1$.

+
  + $A=-1, B=-7$
  + $a_n = alpha 2^n - n - 7$
  + $alpha=11$

+
  - $b_1 = 0$, $b_2 = 1$, $b_3 = 2$ and $b_4 = 3$.
  - If $n = 2p$ is even $(p >= 1)$, $b_(2p) = 2b_p + 1$. If $n = 2p - 1$ is odd $(p >= 1)$, $b_(2p-1) = b_p + b_(p-1) + 1$.
  - $b_(2^k) = 2^k - 1$ for all $k >= 0$.
  - You need to use the strong version of the induction principle you have seen in Calculus. However, you can go back to this problem after Section 13 (order relations).

+
  - $binom(19, 2) - 3 binom(12, 2) + 3 binom(5, 2) = 3$.
  - $binom(8, 2) = 28$.
  - $binom(9, 2) = 36$.

+
  1. $a_n = 1/2 (3^n + 1)$, $n >= 0$.
  2. $a_n = 4 binom(n+1, 1) - 5 binom(n+2, 2) + 2 binom(n+3, 3)$, $n >= 0$.
  3. $a_n = 1/4 (5^n + 3)$, $n >= 0$.
  4. $a_n = 5 times 2^n - 4$, $n >= 0$.
  5. $a_n = 2^n$, $n >= 0$.
  6. $a_n = -2^n - 1/sqrt(2) (1 - sqrt(2))^(n+1) + 1/sqrt(2) (1 + sqrt(2))^(n+1)$, $n >= 0$.

+ The two generating functions are:
  - $f_1(x) = product_(n=1)^infinity (1 + x^n)$.
  - $f_2(x) = product_(n=1)^infinity 1/(1 - x^(2n-1))$.

+ $F'(x) = 2(1 + x) F(x)$.

+ $binom(2+N, 2)$.



= Graph theory

+
  1. $8$.
  2.
    #figure(
      raw-render(
        ```dot
        graph {
          layout=neato
          node[shape=circle margin=0 width=0.2]
          zx -- {zw, zy, yx, zz};
          yy -- {yz, yw, zy, yx};
          yw -- {yx, zw, yz};
          zz -- {zw, zy, yz};
          zw -- zy;
          yz -- yx;
          }
        ```,
        width: 5cm,
      ),
    )
  3. The common degree is 4.
  4. It is not bipartite.

+ $10$.

+
  1. $|V| = 9$.
  2. There are only two possible cases: if the degree is $d = 2$, then $|V| = 6$; and if the degree is $d = 3$, then $|V| = 4$.
  3. $|V| = 6$.

+
  1. A graphical representation of the graphs $K_n$ with $1 <= k <= 5$ is:
    #figure(
      grid(
        columns: (0.5fr, 1fr, 1fr, 1fr, 1fr),
        raw-render(
          ```dot
          graph {
            layout=neato
            node[shape=point margin=0]
            1
            }
          ```,
        ),
        raw-render(
          ```dot
          graph {
            layout=neato
            node[shape=point margin=0]
            1 -- 2;
            }
          ```,
        ),
        raw-render(
          ```dot
          graph {
            layout=neato
            node[shape=point margin=0]
            1 -- {2, 3};
            2 -- 3;
            }
          ```,
        ),
        raw-render(
          ```dot
          graph {
            layout=neato
            node[shape=point margin=0]
            1 -- {2, 3, 4};
            4 -- {2, 3};
            2 -- 3;
            }
          ```,
        ),
        raw-render(
          ```dot
          graph {
            layout=neato
            node[shape=point margin=0]
            1 -- {2, 3, 4, 5};
            3 -- {2, 4, 5};
            2 -- {4, 5};
            4 -- 5;
            }
          ```,
        ),
      ),
    )
  2. The degree of $K_n$ is $n - 1$.
  3. $|E_n| = binom(n, 2)$.
  4. Hint: you have to prove that $V_n subset V_m$ and $E_n subset E_m$ whenever $n < m$.

+
  1. False for any $n >= 3$.
  2. True for any $n >= 3$.
  3. True for any $n >= 3$.
  4. True for any even $n >= 4$.

+ $|V|_"min" = 5$.

+ The adjacency matrices $A_1$ (with the vertex ordering $(v_1, v_2, v_3, v_4)$) and $A_2$ (with the vertex ordering $(u_1, u_2, u_3, u_4)$), and the permutation matrix $P$ are:
  $
    A_1 = mat(
      0, 1, 1, 1;
      1, 0, 1, 0;
      1, 1, 0, 1;
      1, 0, 1, 0
    ), quad A_2 = mat(
      0, 1, 1, 0;
      1, 0, 1, 1;
      1, 1, 0, 1;
      0, 1, 1, 0
    ), quad P = mat(
      0, 1, 0, 0;
      1, 0, 0, 0;
      0, 0, 1, 0;
      0, 0, 0, 1
    ).
  $

+
  1. Walk of length 4.
  2. Closed walk of length 5.
  3. Closed walk of length 6.
  4. Cycle of length 5.


+
  1. $n(n - 1)(n - 2)$ cycles.
  2. $n - 2$ triangles.


+
  + $|A| = 16$.
  + There are 6 equivalence classes (for simplicity let us denote them $C_j$):
    #let c0 = cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.05, fill: black, name: "b")
      circle((0.3, 0), radius: 0.05, fill: black, name: "c")
      circle((0, 0.3), radius: 0.05, fill: black, name: "a")
      circle((0.3, 0.3), radius: 0.05, fill: black, name: "d")
    })
    #let c1 = cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.05, fill: black, name: "b")
      circle((0.3, 0), radius: 0.05, fill: black, name: "c")
      circle((0, 0.3), radius: 0.05, fill: black, name: "a")
      circle((0.3, 0.3), radius: 0.05, fill: black, name: "d")
      line("a", "b")
    })
    #let c2b = cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.05, fill: black, name: "b")
      circle((0.3, 0), radius: 0.05, fill: black, name: "c")
      circle((0, 0.3), radius: 0.05, fill: black, name: "a")
      circle((0.3, 0.3), radius: 0.05, fill: black, name: "d")
      line("a", "b")
      line("d", "a")
    })
    #let c2a = cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.05, fill: black, name: "b")
      circle((0.3, 0), radius: 0.05, fill: black, name: "c")
      circle((0, 0.3), radius: 0.05, fill: black, name: "a")
      circle((0.3, 0.3), radius: 0.05, fill: black, name: "d")
      line("a", "b")
      line("c", "d")
    })
    #let c3 = cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.05, fill: black, name: "b")
      circle((0.3, 0), radius: 0.05, fill: black, name: "c")
      circle((0, 0.3), radius: 0.05, fill: black, name: "a")
      circle((0.3, 0.3), radius: 0.05, fill: black, name: "d")
      line("a", "b")
      line("c", "d")
      line("a", "d")
    })
    #let c4 = cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.05, fill: black, name: "b")
      circle((0.3, 0), radius: 0.05, fill: black, name: "c")
      circle((0, 0.3), radius: 0.05, fill: black, name: "a")
      circle((0.3, 0.3), radius: 0.05, fill: black, name: "d")
      line("a", "b")
      line("c", "b")
      line("c", "d")
      line("a", "d")
    })
    - $C_0 = [#c0]_R = {H = (V_4, emptyset)}$.
    - $C_1 = [#c1]_R = {H = (V_4, E) : |E| = 1}$.
    - $C_(2a) = [#c2a]_R = {H = (V_4, E) : |E| = 2 "and" H "is a p.m. of" C_4}$.
    - $C_(2b) = [#c2b]_R = {H = (V_4, E) : |E| = 2 "and" H "is not a p.m. of" C_4}$.
    - $C_3 = [#c3]_R = {H = (V_4, E) : |E| = 3}$.
    - $C_4 = [#c4]_R = {H = (V_4, E) : |E| = 4}$.
    where p.m. means perfect matching.

    - $C = A\/R = {C_0, C_1, C_(2a), C_(2b), C_3, C_4}$.

  + The Hasse diagram is: // TODO
    #align(center)[
      ```
              C_4
              │
              C_3
            ┌─┴─┐
         C_2a   C_2b
            └─┬─┘
              C_1
              │
              C_0
      ```
    ]

    It is not a totally ordered set.

  + $sup(Z) = C_3$ and $inf(Z) = C_1$.

+
  + Yes
  + No (cycle)
  + No (forest)
  + Yes
  + No (cycle)
  + No (forest)

+ $999$.

+
  + #figure(
      raw-render(
        ```dot
        graph {
          layout=neato;
          concentrate=true;
          node[shape=circle margin=0 fontsize=24]
          a[pos="0,1!"]
          b[pos="0,0!"]
          c[pos="1,0.5!"]
          d[pos="2,0.5!"]
          e[pos="3,1!"]
          f[pos="3,0!"]
          g[pos="4,0!"]
          h[pos="4,1!"]
          i[pos="5,1!"]
          j[pos="5,0!"]
          a -- b;
          c -- {b, d};
          d -- {e};
          e -- f;
          g -- {h, f, j};
          h -- {i};
        }
        ```,
        width: 7cm,
      ),
    )
  + #figure(
      raw-render(
        ```dot
        graph {
          layout=neato;
          concentrate=true;
          node[shape=circle margin=0 fontsize=24]
          a[pos="0,1!"]
          b[pos="0,0!"]
          c[pos="1,0.5!"]
          d[pos="2,0.5!"]
          e[pos="3,1!"]
          f[pos="3,0!"]
          g[pos="4,0!"]
          h[pos="4,1!"]
          i[pos="5,1!"]
          j[pos="5,0!"]
          a -- {b,c};
          c -- {d};
          d -- {e, f};
          e -- h;
          h -- i;
          f -- g;
          g -- j;
        }
        ```,
        width: 7cm,
      ),
    )


+ Hint: Use that $V = V_1 union V_3$ where $V_1$ (resp. $V_3$) is the set of vertices of degree 1 (resp. 3).

+
  1. $C_(2n)$.
  2. There is no such graph.
  3. A graph with two connected components: $K_(n-1)$ and an isolated vertex.
  4. Two vertices joined by four edges.
  5. $P_4$.
  6. $C_2$.

+ 11 trees.

+
  - $|V| = 8$ and $|E| = 19$.
  - $d(emptyset) = d(X) = 7$. The other vertices have $d(v) = 4$. $G$ is not regular.
  - $G$ is not bipartite.

+ Hint: Which is the simple graph with $n$ vertices and $binom(n, 2)$ edges?

+ Hint: The average degree of a graph $G = (V, E)$ is defined as follows:
  $ overline(d) = 1/abs(V) sum_(v in V) d(v) . $
  Use also the following result: Let $G$ be a connected graph containing a cycle. Then, if we remove any edge of that cycle, the resulting graph is also connected.

+
  + $G$ is simple.
  + $|V| = 8$ and $|E| = 12$.
  + $G$ is regular with $d = 3$.
  + $n_(i j) in {0, 6, 7}$.
  + The length of the shortest cycle in $G$ is $ell_"min" = 4$.


+
  1. It is not bipartite.
  2. There are no spanning trees.

+ There is no spanning tree of weight $<= 12$.

+ All graph models are weighted graphs whose vertices are the metro stops. Then edges are drawn between connected stops and their weights are:
  + travel times,
  + distances,
  + fares.

+
  1. The path is $(a, b, e, g)$ with length 78.
  2. The same as above.

+ $d(a, h) = 16$, $d(a, e) = 17$, $d(d, a) = 19$, $d(d, g) = 11$, and $d(b, e) = 13$.

+
  1. One possible minimum-weight path is $(A, B, G, H, K, M)$ with weight $omega = 17$.
  2. One possible minimum-weight spanning tree has the edge set
    $ E = {{B, E}, {H, K}, {B, G}, {K, M}, {H, L}, {F, E}, {G, J}, {H, D}, {A, B}, {F, I}, {C, G}, {C, H}} . $
    Its weight is $omega = 43$.

+ $0 < x <= 3$.

+ This problem is about finding a spanning tree. A possible set of flights to discontinue are: Boston–New York, Detroit–Boston, Boston–Washington, New York–Washington, New York–Chicago, Atlanta–Washington, Atlanta–Dallas, Atlanta–Los Angeles, Atlanta–St. Louis, St. Louis–Dallas, St. Louis–Detroit, St. Louis–Denver, Dallas–San Diego, Dallas–Los Angeles, Dallas–San Francisco, San Diego–Los Angeles, Los Angeles–San Francisco, San Francisco–Seattle.

+
  + The minimum cost from $a$ to $i$ is equal to 19. The total cost of the constructor's design depends on the found tree: it can be in the range from 40 to 43.
  + The cost of the alternative design is 39.


+
  1. Using Kruskal's algorithm, a spanning tree $T = (V, E)$ would be given by $E = {{a, b}, {e, g}, {b, e}, {e, c}, {f, g}, {f, d}}$ with weight $omega = 10$.
  2. It is not bipartite.

+ 6 hours.

+ There is no such spanning tree.

+
  + $|V_n| = 2^(n-1)$.
  + $G_n$ is regular with degree $d = binom(n, 2)$.
  + $|E_n| = 2^(n-2) binom(n, 2)$.

+ The base case corresponds to the trivial graph of $n$ vertices $G = (V, emptyset)$ (with $|V| = n >= 1$). Then, you apply induction on the number of edges $|E|$.
