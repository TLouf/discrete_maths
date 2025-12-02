#import "assets/base_template.typ": *
#show: base

#set document(title: "Discrete Mathematics @ UC3M - Exercises")
#set page(
  margin: 1.5cm,
  columns: 2,
  footer: [
    #set text(gray)
    Discrete Mathematics @ UC3M - Exercises
  ],
)
#set par(justify: true)
#set text(size: 11pt)
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

// TODO: all drawings!

= Set theory

+ Let $A = {x in ZZ | x^2 < 16}$. For each of the following statements, determine whether it is true or not:
  + ${0, 1, 2, 3} subset A$
  + ${3, 1} in A$
  + ${x in ZZ | |x| < 4} subset A$
  + $emptyset subset A$
  + $3 in A$
  + ${3} in A$
  + $A subset {-3, -2, -1, 0, 1, 2, 3}$

+ Prove the following identities:
  + $A union (A inter B) = A inter (A union B) = A$
  + $(A union B) without C = (A without C) union (B without C)$
  + $A without (B union C) = (A without B) without C$
  + $(A triangle.t B) triangle.t C = A triangle.t (B triangle.t C)$
  + $A without B = A triangle.t (A inter B)$
  + $overline((A triangle.t B)) = overline(A) triangle.t B = A triangle.t overline(B)$

+ Simplify the following expressions:
  + $[overline(B) inter (A union C) inter D] union [(A union B) inter overline(B)]$ #v(0.5em)
  + $overline(([(A union B) inter C] union overline(B)))$

+ Determine if the functions $f, g : RR arrow RR$ below are injective or not:
  $
    f(x) & = cases(
             2x "if" x >= 0\,,
             -2x - 1 "if" x < 0.
           ) \
    g(x) & = cases(
             3x + 1 "if" x >= 0\,,
             2x "if" x < 0.
           )
  $

+ Given the function $F : RR without {-1\/2} arrow RR without {1\/2}$, defined as follows:
  $ F(x) = (x + 3)/(1 + 2x), $
  determine if its inverse exists or not. In case it exists, find $F^(-1)$.

+ Let us consider the floor and ceiling functions. They are defined as follows:
  - The function floor assigns to each real number $x$ the largest integer $floor(x) <= x$.
  - The function ceiling assigns to each real number $x$ the smallest integer $ceil(x) >= x$.

  Then,
  + Draw the graph of both functions $y = floor(x)$ and $y = ceil(x)$.
  + Compute the following quantities:
    $
      floor(1\/2), ceil(1\/2), floor(-1\/2), ceil(-1\/2), \ floor(pi),
      ceil(pi), floor(1\/2 + ceil(1\/2)),\ ceil(floor(1\/2) + ceil(1\/2) + 1\/2)
    $
  + In a certain communication protocol, the data is transmitted in groups of 53 bytes. How many groups can be transmitted in one minute through a connection working at a rate of 500 Kilobits per second?\
    _Note: Each byte contains 8 bits._

+ Determine if each one of the following functions $f : A arrow B$ is injective (one-to-one), surjective (onto), bijective, or none of these:
  + $A eq.not emptyset$, $B = cal(P)(A)$, $f(a) = {a}$
  + $A = B = cal(P)({a, b, c, d}), f(X) = overline(X)$
  + $A = B = cal(P)({a, b, c, d}), f(X) = X union {a, b}$
  + $A = B = cal(P)({a, b, c, d}), f(X) = X inter {a, b}$

= Relations

+ Let $A$ and $B$ be two sets, and let $f: A -> B$ be a certain function. Show that any binary relation defined on $A$ of the form
  $ a rel b <==> f(a) = f(b), quad a, b in A $
  is an equivalence relation for any $f$. Find the quotient set $A\/R$.

+ Let $A$ be a set, and $B subset.eq A$ a fixed subset of $A$. We now consider the power set $cal(P)(A)$, and define the following relation on $cal(P)(A)$: for any subsets $X, Y subset.eq A$:
  $ X rel Y <==> X inter B = Y inter B $
  + Prove that $R$ is an equivalence relation.
  + Compute its quotient set $cal(P)(A)\/R$, and prove that there is a bijection between this quotient set and $cal(P)(B)$.

+ Let $R$ be a relation defined on $NN times NN$, such that $(a, b)R(c, d)$ if and only if $a + b = c + d$. Show that $R$ is an equivalence relation on $NN times NN$, and that there exists a bijection between the quotient set $(NN times NN)\/R$ and $NN$.

+ Let
  $
    A = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}
  $
  and let $R$ be a relation on $A$, such that $a rel b$ if and only if $floor(sqrt(a)) = floor(sqrt(b))$. Show that $R$ is an equivalence relation, find its classes of equivalence, and its quotient set.

+ We define the relation $R$ on $RR^2 = RR times (RR without {0})$ such that
  $ (a, b)R(c, d) <==> a d = b c $
  Show that this is an equivalence relation, and obtain the quotient set $RR^2\/R$.

+ A relation $R$ defined on a set $A$ is a *circular relation* if it verifies the following property:
  $ a rel b "and" b rel c ==> c rel a $
  Prove that a relation is an equivalence relation if and only if it is circular and reflexive.

+ A relation $R$ on a set $A$ is *weakly transitive* if, for all elements $a, b, c, d in A$, the relations $a rel b$, $b rel c$, and $c rel d$ imply that $a rel d$. Determine which one of the following two statements is true and which one is false (by proving the former, and giving a counter-example of the latter):
  + Every symmetric and weakly transitive relation is transitive.
  + Every reflexive, symmetric, and weakly transitive relation is an equivalence relation.

+ The adjacency matrix of a binary relation $R$ is given by
  $ A_R = mat(1, 0, 1; 0, 1, b; 1, a, c) $
  where $a, b, c = 0, 1$. Which conditions should $a$, $b$, and $c$ satisfy so that $R$ becomes an equivalence relation?

+ Show that the following relations are equivalence relations. Find the corresponding classes of equivalence and the quotient set $V\/R$:
  + $V = ZZ$ and $v rel w$ if $|v - w|$ is a multiple of 2.
  + $V = ZZ$ and $v rel w$ if $v^2 - w^2 = v - w$. Describe the equivalence class containing the element 2005.
  + $V = RR^2$ and $(x, y)R(u, w)$ if $x y = u w$.
  + $V = RR^2$ and $(x, y)R(u, w)$ if $(x - y)(x + y) = (u - w)(u + w)$.
  + $V = RR^2$ and $(x, y)R(u, w)$ if $x^2 + y^2 = u^2 + w^2$.



+ Given the matrix representing the relation $R$ on a set $A$
  $ mat(1, 1, 1, 1, 0; 0, 1, 1, 1, 0; 0, 0, 1, 1, 0; 0, 0, 0, 1, 0; 0, 0, 1, 1, 1) $
  + Compute $"Dom"(R)$ and $"Im"(R)$.
  + Draw its Hasse diagram.
  + Find a total order compatible with $R$.

+ Let $A = {0, 1, 2} times {2, 5, 8}$, and let us define the order relation $R$ on $A$ such that $(a, b) rel (c, d) <==> (a + b) | (c + d)$. Find the maximal, minimal, maximum, and minimum elements of the poset $(A, R)$.

+ Let us consider the relation $R$ on $RR^2$ given by
  $ (a, b) rel (c, d) <==> a <= c "and" b <= d $
  Find the maximal and minimal elements of the set $C subset.eq RR^2$:
  $ C = {(x, y) in RR^2 | x^2 + y^2 = 1} $
  Find $sup(C)$ and $inf(C)$ by considering $C$ as a subset of $RR^2$.

+ Let us consider two binary relations on the set $NN$.
  $ a rel_1 b <==> exists n in NN "such that" a = b^n $
  $ a rel_2 b <==> exists n in NN union {0} "such that" a = b^n $
  + Show that $R_1$ is an order relation. Is $R_2$ also an order relation? Is $R_1$ a total order?
  + Find the Hasse diagram of both relations on the set $A = {n in NN | 1 <= n <= 9}$.
  + Find for $R_1$ and $R_2$ the maximal, minimal, maximum, and minimum elements on $A$. Find also the supremum and infimum of $A$ as a subset of $NN$.

+ A polygon $P$ is convex if, for any two points $a, b in P$, the segment $overline(a b)$ joining both points is totally contained inside the polygon. Prove that the sum of the interior angles of a convex polygon of $n >= 3$ sides is $(n - 2)pi$.

+ Prove that $1 + 2^n < 3^n$ for each $n >= 2$.



= Elementary number theory

+ Given $a = 92$ and $b = 84$, use Euclid's algorithm to compute $d = gcd(a, b)$. Find integers $x, y in ZZ$ such that $a x + b y = d$.

+ The product of two natural numbers is 1260, and their lcm is 630. Find those numbers.

+ How many positive divisors does the number $29338848000 = 2^8 dot 3^5 dot 5^3 dot 7^3 dot 11$ have? How many of them are multiple of 99? And how many of them are multiple of 39?

+ Prove that $log_2 3$ is an irrational number.

+ Prove that 101 is a prime number.

+ Prove that $6 | a(a + 1)(2a + 1)$ for any $a in ZZ$.

+ Find the integer solutions of the Diophantine equations:
  + $28x + 36y = 44$.
  + $66x + 550y = 88$.

+ Solve the following congruence equations:
  + $3x equiv 5 space (mod 13)$.
  + $8x equiv 2 space (mod 10)$.
  + $5x equiv 7 space (mod 15)$.
  + $3x equiv 9 space (mod 15)$.

+ Find the remainder of the integer $2^68$ when divided by 19.

+ Prove that $30 | (a^25 - a)$ for any $a in ZZ$.

+ Compute the last two digits of the integer $3^1492$.

+ Find the remainder of the hexadecimal number $"A1F05FFA01AFA0F"$ when divided by 5.

// 11.2
+ Let $A = {6, 10, 12, 18, 21, 40, 441, 1323}$. We define the following binary relation $R$ on $A$:
  $ x rel y <==> "x and y have the same prime divisors" $
  If $R$ is an equivalence relation, find its classes of equivalence, or if it is not an equivalence relation, say which properties do not hold.

// 13.4
+ Let $A = {n in ZZ | 2 <= n <= 12}$, and let us define on $A$ the order relation $R$ given by
  $ n rel m <==> n | m, "or" n "is prime and" n <= m $
  Give the maximal, minimal, maximum, and minimum elements of the poset $(A, R)$.

// 13.7
+ Prove that for all $n in NN$ the following equation holds:
  $ 3 | (4^n - 1) $

// 13.11
+ Given their form provided below, prove by induction that the Fibonacci numbers $F_n$ and $F_(n+1)$ are relatively prime for all integer $n >= 0$:
  $
    F_n = F_(n-1) + F_(n-2), quad n >= 2, quad F_0 = 0, quad F_1 = 1
  $


= Counting

+ Computers represent information using bits. A bit has two possible values: 0 or 1. A bit string of length $n$ is a sequence of $n$ bits $b_1 b_2 b_3 ... b_n$.
  + How many different bit strings are there of length $n$?
  + How many bit strings of length $n >= 2$ start and end with 1?
  + How many bit strings have length smaller or equal to $n$?
  + How many bit strings of length smaller or equal to $n in NN$ contain only 1's?
  + How many bit strings of length $n >= 6$ contain at least three 0's and three 1's?
  + How many bit strings of length $n >= 5$ either start with 00 or end with three 1's?
  + A palindrome is a bit string such its inverse is identical to itself (e.g., 0010110100). How many bit strings of length $n$ are palindromes?

+ A wedding photographer likes to make pictures of the 10 people present in the banquet (including the groom and the bride) in groups of 6 persons. How many distinct pictures can the photographer take if
  + the bride is in the picture?
  + both the bride and the groom are in the picture?
  + exactly one of them (bride or groom) is in the picture?
  + both the bride and the groom are next to each other in the picture?
  + both the bride and the groom are in the picture but not next to each other?
  + both the groom and the bride are next to each other in the picture, and the bride is on the left of the groom?

+ Find how many five-digit numbers $n$ can be formed with the set $A = {1, 2, 3}$, and such that each digit in $A$ must appear in the number $n$ at least once.

+ Find how many three-letter words can be formed with the 10-element set ${A, B, ..., J}$, and such that the letters are all distinct and ordered in the standard lexicographic way.

+ The USS Arizona had 12 distinct flags and the sailors could put up to 3 flags in the corresponding flagpole, each flag configuration describing a distinct circumstance in the ship.
  - How many distinct circumstances using at least one flag could be described with this set-up?
  - How many distinct circumstances using at least one flag could be described if there were three equal sets of the above-mentioned 12 flags?

+ Find in how many ways we can put three letters A and seven letters B such that there are no two consecutive A's.

+ We have a three-dimensional space and we are allowed to move with jumps of length 1 unit in the direction of three coordinate axis. In other words, each trajectory is composed by moves of the following three types:
  - (H) $(x, y, z) arrow (x + 1, y, z)$,
  - (V) $(x, y, z) arrow (x, y + 1, z)$,
  - (L) $(x, y, z) arrow (x, y, z + 1)$.

  How many trajectories are there joining the points $(-1, 2, 0)$ and $(1, 3, 7)$? How many of them go through the point $(0, 3, 4)$?


// *Proposition 1 (The pigeonhole principle)*: If $k + 1$ or more objects are placed into $k$ boxes, then there is at least one box containing two or more of the objects.

// _Remark_: Given a function $f : A arrow B$ with $|A| > |B|$, then $f$ cannot be injective. Therefore, there exist at least two distinct elements $a, b in A$ such that $f(a) = f(b) in B$.

// *Proposition 2 (The generalized pigeonhole principle)*: If $N$ objects are placed into $k$ boxes, then there is at least one box containing at least $ceil(N\/k)$ objects.


// *Theorem 2.8 (The division algorithm)*: Let $a$ and $b eq.not 0$ be two integers. Then there exists a unique pair of integers $q$ and $r$ such that
// $ a = q dot b + r quad "with" quad 0 <= r < |b|. $

// + Show that, given any five distinct integers, there are at least two of them with the same remainder when divided by four.


+ We have 4 golf balls and 10 distinct boxes. Compute the number of distinct ways of distributing the golf balls in the boxes if:
  + All golf balls are distinct, and each box may contain at most one ball.
  + All golf balls are indistinguishable, and each box may contain at most one ball.
  + All golf balls are indistinguishable, and we can put as many balls as we wish in each box.
  + All golf balls are distinct, and we can put as many balls as we wish in each box.

+ If we simultaneously toss 6 identical dice, how many distinct results are possible?

+ We want to line up $a$ white balls and $b$ black balls. In how many distinct ways can we arrange these balls such that there are exactly $k + 1$ groups of black balls?\
  _Note: A group of equal balls may consist in a single ball._

+ Find the number of 4-element subsets taken from the set ${1, 2, 3, ..., 15}$, and such that they do not contain consecutive integers.

+ Find the number of $p$-element subsets taken from the $n$-element set ${a_1, a_2, ..., a_n}$, and such that they do not contain consecutive elements.

+ Find the number of distinct solutions of the equation $x_1 + x_2 + x_3 = 17$ when the $x_i$ all belong to the set
  + $NN$ of the non-negative integers.
  + $NN^*$ of positive integers.
  + ${0, 1, 2, 3, 4, 5, 6}$.

+ We have 7 distinct object types, and we want to choose 25 objects in such a way that there are always at least 2 objects and at most six objects of each type. In how many distinct ways can we achieve this task?

+ #[
    + Eight people go out for dinner and on the dessert menu there are four distinct desserts. How many distinct orders can the waiter have?
    + How many distinct solutions exist of the equation
      $ x_1 + x_2 + x_3 + ... + x_n = r, $
      with $x_i in NN$?
    + How many distinct positive integer solutions exist of the equation
      $ x_1 + x_2 + x_3 + ... + x_n = 21, $
      with the constraint $x_1 > 1$?
  ]

+ A sales company wants to audit the results in 20 cities, and there are 5 employees willing to do that job; each of them will be in charge of 4 cities.
  + In how many distinct ways can the company manager split the 20 cities in 5 groups of 4 cities each?
  + In how many distinct ways can the company manager assign the cities to the 5 employees?


= Sequences

+ For each integer $n in NN$, let us consider the set of $n$ lines in the plane with the following properties:
  - P1. There are no parallel lines.
  - P2. At each intersection point, only two lines meet.

  Let $S_n$ be the number of regions of the plane defined by $n$ lines with the above properties:
  - Find a recurrence equation for $S_n$.
  - Solve this equation.

+ Let us consider numerical strings of 10 digits formed with elements in the set ${0, 1, 2}$. How many of these strings are such that the sum of the 10 digits is an even number?

+ A software company is trying to solve a very complicated problem. They say they are in the $n$-th phase of the project when there are $n$ steps left to finish it. Let us suppose that in each phase there are five options. Two of them, lead to the $(n - 1)$-th phase; but the other three options are better in the sense that they lead directly to the $(n - 2)$-th phase. Let us denote by $a_n$ the number of ways of achieving the solution of the project from the $n$-th phase. If $a_1 = 2$, check that $a_2 = 7$, and obtain a recurrence equation for $a_n$. Prove that
  $ a_n = 1/4 [3^(n+1) + (-1)^n]. $

+ Compute the number of bit strings of length $n >= 1$ such that they do not have two consecutive zeros.

+ There are $3^n$ strings of length $n$ formed by ${0, 1, 2}$. Compute the number of those strings with an odd number of zeros $a_n$, by first proving that the recurrence equation for $a_n$ is
  $ a_n = a_(n-1) + 3^(n-1), quad n >= 2, quad a_1 = 1, $
  and then, by solving this equation.

+ Solve the equation:
  $ a_n = 4a_(n-1) - 4a_(n-2), quad n >= 3, quad a_1 = a_2 = 1. $

+ Let $a_n$ be the number of strings of length $n$ which can be formed with ${0, 1, 2}$ in such a way that there are no consecutive 1's nor two consecutive 2's.
  + Show that $a_n = 2a_(n-1) + a_(n-2)$, $n >= 3$.
  + Find an explicit solution for $a_n$.

+ Solve the equation:
  $ a_n = -a_(n-1) + 3 dot 2^(n-1), quad n >=2, quad a_1 = 0. $

+ Let us consider the following recursive algorithm to compute the exponential $a^n$ with $n in NN$:
  ```
  procedure exp1(a,n)
    if (n = 1)
      return a
    else
      m = floor(n/2)
      return exp1(a,m) * exp1(a,n-m)
  ```
  Let $b_n$ be the number of multiplications needed to compute $a^n$:
  - Compute $b_1$, $b_2$, $b_3$, and $b_4$.
  - Find a recurrence equation for ${b_n}$.
  - Solve this recurrence when $n$ is a power of 2.
  - Prove that $b_n = n - 1$ for any $n in NN$.

+ Find the number of distinct integer solutions of the linear equation
  $ x_1 + x_2 + x_3 = 17 $
  if the variables are constrained as follows:
  + $x_i in {0, 1, 2, dots, 6}$.
  + $x_1, x_2 in 2NN$ are even integers, and $x_3 >= 0$ is an odd integer.
  + $x_i$ are non-negative odd integers.

+ Solve the following recurrences using generating functions:
  + $a_(n+1) - a_n = 3^n$, $n >= 0$, $a_0 = 1$.
  + $a_(n+1) - a_n = n^2$, $n >= 0$, $a_0 = 1$.
  + $a_n - a_(n-1) = 5^(n-1)$, $n >= 1$, $a_0 = 1$.
  + $a_(n+2) - 3a_(n+1) + 2a_n = 0$, $n >= 0$, $a_0 = 1$, $a_1 = 6$.
  + $a_(n+2) - 2a_(n+1) + a_n = 2^n$, $n >= 0$, $a_0 = 1$, $a_1 = 2$.
  + $a_(n+2) - 2a_(n+1) - a_n = 2^n$, $n >= 0$, $a_0 = 1$, $a_1 = 2$.

+ Prove that given a positive integer $N$, the number of partitions of $N$ into distinct positive integers is equal to the number of partitions of $N$ into odd positive integers. For instance, the integer $N = 4$ has two partitions into distinct positive integers ($3 + 1$ and $4$), and two partitions into odd positive integers ($1 + 1 + 1 + 1$ and $3 + 1$). The integer $N = 6$ has four partitions into distinct positive integers ($1 + 2 + 3$, $2 + 4$, $1 + 5$, and $6$), and four partitions into odd positive integers ($1 + 1 + 1 + 1 + 1 + 1$, $1 + 1 + 1 + 3$, $3 + 3$, and $1 + 5$).

+ Let $F$ be the generating function that solves the following recurrence with $n$-dependent coefficients:
  $
    forall n >= 2, n a_n = 2(a_(n-1) + a_(n-2)), \
    quad a_0 = e, quad a_1 = 2e
  $
  Find the equation satisfied by $F$. \
  _Hint:_ The equation may involve $F'$.

+ Find, using generating functions, the number of distinct integer solutions of the equation
  $ x_1 + x_2 + x_3 = N $
  with $x_i >= 0$.


= Graph theory

+ Let $V$ be the set of those two-letter words formed with the alphabet ${w, x, y, z}$ and starting with either $y$ or $z$. We define the graph $G = (V, A)$ in such a way that two words in $V$ determine an edge in $A$ if they differ in exactly one letter:
  + How many vertices does $G$ have?
  + Draw the graph $G$.
  + Prove that $G$ is regular and compute its degree.
  + Determine whether $G$ is bipartite or not.

+ Let $G$ be a graph with 20 edges, and such that its edge-complement $overline(G)$ has 25 edges. How many vertices does $G$ have?

+ Compute the number of vertices of simple connected graphs $G$ if:
  + $G$ is a 2-regular graph with 9 edges.
  + $G$ is a regular graph with 6 edges.
  + $G$ has 10 edges, 2 vertices of degree 4, and all other vertices have degree 3.

+ Let $K_n$ be the complete graph of $n$ vertices.
  - Draw $K_1$, $K_2$, $K_3$, $K_4$, and $K_5$.
  - Which is the degree of the vertices of $K_n$?
  - How many edges does $K_n$ have?
  - Prove that $K_n$ is a sub-graph of $K_m$ for all $n < m$.

+ For which values of $n >= 3$ are the graphs $K_n$, $P_n$, $Q_n$, and $C_n$ bipartite?

+ Prove that in any simple graph with no isolated vertices, there are at least two vertices with the same degree.

+ Find the minimum number of vertices of a graph with 7 edges if every vertex has a degree at most 3.

+ Write the adjacency matrices $A_1$ and $A_2$ corresponding to the graphs shown in the figure, and prove that these two graphs are isomorphic by finding a change-of-basis matrix $P$ satisfying $A_2 = P^(-1) dot A_1 dot P$.

  #figure(
    grid(
      columns: 2,
      column-gutter: 1em,
      raw-render(
        ```dot
        graph {
          node[shape=circle margin=0 width=0.2]
          1 -- 2;
          1 -- 3;
          1 -- 4;
          3 -- 2;
          3 -- 4;
        }
        ```,
        width: 3cm,
        engine: "circo",
      ),
      raw-render(
        ```dot
        graph {
          node[shape=circle margin=0 width=0.2]
          1 -- 2;
          1 -- 3;
          2 -- 4;
          3 -- 2;
          3 -- 4;
        }
        ```,
        width: 3cm,
        engine: "circo",
      ),
    ),
  )

+ Let $G$ be the graph shown in the figure below. We now consider the following walks on $G$:
  #figure(
    raw-render(
      ```dot
      graph {
        node[shape=circle margin=0 width=0.2]
        a -- b;
        a -- c;
        a -- d;
        a -- e;
        b -- c;
        b -- d;
        c -- e;
      }
      ```,
      width: 5cm,
      engine: "sfdp",
    ),
  )
  + $C_1 = (a, e, b, c, b)$
  + $C_2 = (e, b, a, d, b, e)$
  + $C_3 = (a, e, a, d, b, c, a)$
  + $C_4 = (c, b, d, a, e, c)$

  Determine which ones are trails, paths, cycles, or circuits, and compute their corresponding lengths.


+ Let $K_n$ be the complete graph of $n$ vertices.
  + How many length-3 cycles does it contain?
  + How many triangles does each edge of $K_n$ belong to?

// 13.6
+ Let us consider the cycle $C_4 = (V_4, E_4)$ with labeled vertices $V_4 = {a, b, c, d}$.
  + If $A$ is the set of the spanning subgraphs of $C_4$:
    $ A = {G = (V_4, E) | E subset.eq E_4} $
    compute the cardinal of $A$.
  + We define on $A$ the following equivalence relation $R$: if $G_1, G_2 in A$,
    $ G_1 rel G_2 <==> G_1 "is isomorphic to" G_2 $
    Find the equivalence classes $[G]_R$, and the quotient set $C = A\/R$.
  + We now define the order relation $prec.eq.curly$ on the quotient set $C$ as follows: $[A]_R prec.eq.curly [B]_R$ if and only if there exist graphs $G_1 = (V_4, E_1) in [A]_R$ and $G_2 = (V_4, E_2) in [B]_R$ such that $E_1 subset.eq E_2$. Find the Hasse diagram associated to the set $(C, prec.eq.curly)$. Is $(C, prec.eq.curly)$ a totally ordered set?
  + Let $Z subset C$ be the subset of $C$ containing the classes of equivalence that contain at least one representative with two edges. Compute $sup(Z)$ and $inf(Z)$.

+ Show that the paraffins $C_n H_(2n+2)$ have tree-like molecules [Arthur Caley, 1857].

+ Prove that in a rooted tree such that all vertices that are not leaves have degree 3, then the tree has an even number of vertices.

+ Prove that there is no planar and connected graph satisfying that each vertex has at least degree 8, and each face is bounded by at least 8 edges.

+ Let $G$ and $G'$ be two distinct connected graphs. $G$ is a plane graph with 10 vertices, such that it splits the plane into 3 regions. $G'$ is a 10-vertex graph with all vertices of degree at least 3. Are $G$ and $G'$ isomorphic?

+ Give an example (if any) of
  + a regular and bipartite graph,
  + a 3-regular graph with 9 vertices,
  + a graph with $n$ vertices and $(n - 1)(n - 2)\/2$ edges,
  + a 4-regular connected multi-graph,
  + a graph isomorphic to its edge-complement,
  + a graph isomorphic to its dual.

+ How many trees does a forest of 62 vertices and 51 edges contain?

+ Let $X = {A, B, C}$. We define the simple graph $G = (V, E)$ in the following way: the set of vertices is given by the power set of $X$ ($V = cal(P)(X)$), and two vertices $R, S in V$ are adjacent if and only if $R subset S$ or $S subset R$.
  - How many vertices and edges does $G$ contain?
  - Determine the degree of each vertex in $V$. Is $G$ regular?
  - Is $G$ planar?
  - Is $G$ bipartite?

+ Show that if $G = (V, E)$ is a simple graph and
  $ |E| > binom(|V| - 1, 2), $
  then $G$ is connected.

+ If the mean degree of a connected graph is greater than 2, then show that there exist at least two independent cycles.

+ Let $G = (V, E)$ be a graph whose adjacency matrix $A_G$ is given by
  $
    A_G = mat(
      0, 1, 0, 1, 0, 0, 1, 0;
      1, 0, 1, 0, 0, 1, 0, 0;
      0, 1, 0, 1, 1, 0, 0, 0;
      1, 0, 1, 0, 0, 0, 0, 1;
      0, 0, 1, 0, 0, 1, 0, 1;
      0, 1, 0, 0, 1, 0, 1, 0;
      1, 0, 0, 0, 0, 1, 0, 1;
      0, 0, 0, 1, 1, 0, 1, 0;
    ).
  $
  Answer the following questions using arguments based solely on the matrix $A_G$ (without using any graphical representation of $G$ that can be obtained from $A_G$):
  + Tell whether $G$ is a simple graph, a multi-graph, or a pseudo-graph.
  + How many vertices and edges does $G$ contain?
  + Is $G$ a regular graph? If yes, tell the common degree, and if not, give the degree sequence of $G$.
  + Let $i eq.not j$ be two distinct vertices of $G$ ($i, j in V$). Let $n_(i j)$ be the number of walks from $i$ to $j$ of length 3. Find all the possible values of $n_(i j)$ for $G$.
  + Which is the length of a minimum-length cycle of $G$?


+ Let $G = (V, E)$ be the graph defined by the following adjacency matrix:
  $
    A_G = mat(
      0, 0, 1, 1, 0, 1, 0, 0;
      0, 0, 0, 0, 1, 0, 1, 0;
      1, 0, 0, 1, 0, 1, 0, 1;
      1, 0, 1, 0, 0, 0, 0, 1;
      0, 1, 0, 0, 0, 0, 1, 0;
      1, 0, 1, 0, 0, 0, 0, 1;
      0, 1, 0, 0, 1, 0, 0, 0;
      0, 0, 1, 1, 0, 1, 0, 0;
    ).
  $
  + Is it bipartite? Is it planar?
  + Find a spanning tree (if any).

+ Tell whether the following weighted graph has a spanning tree of weight equal or smaller than 12.
  #figure(
    raw-render(
      ```dot
      graph {
        layout=neato
        edge [fontsize=10 labelfloat=true labeldistance=1]
        node[shape=circle margin=0 width=0.2]
        a -- b [taillabel="2"]
        a -- d [label="5" weight=5]
        a -- g [label="4"]
        a -- h [label="7" weight=7]
        b -- c [label="7" weight=7]
        b -- d [label="2"]
        b -- g [label="2"]
        c -- h [headlabel="2"]
        c -- d [taillabel="5" weight=5]
        d -- e [taillabel="1"]
        e -- f [label="3"]
        e -- h [label="1"]
        f -- g [label="3"]
        f -- h [label="6" weight=6]
      }
      ```,
      width: 5cm,
    ),
  )

+ Let us consider the following directed graph.
  #figure(
    raw-render(
      ```dot
      digraph {
        layout=neato
        edge [fontsize=10 labelfloat=true labeldistance=2]
        node[shape=circle margin=0 width=0.2]
        a -> b [taillabel="30"]
        a -> c [label="50"]
        c -> b [label="19"]
        c -> d [label="12"]
        c -> f [headlabel="10"]
        b -> d [label="6"]
        b -> e [taillabel="40"]
        d -> e [taillabel="35"]
        d -> f [label="23"]
        e -> f [label="12"]
        e -> g [label="8"]
        f -> g [label="20"]
      }
      ```,
      width: 5cm,
    ),
  )
  + Find the shortest path to go from a to g.
  + Find the shortest path to go from a to g, assuming that the edges cb and ef are not directed (i.e., you can use both directions).

+ In the weighted graph shown in the figure below, compute the distances $d(a, h)$, $d(a, e)$, $d(d, a)$, $d(d, g)$, and $d(b, e)$.
  #figure(
    raw-render(
      ```dot
      graph {
        layout=sfdp
        splines=true
        edge [fontsize=10 labelfloat=true labeldistance=1]
        node[shape=circle margin=0 width=0.2]
        a -- b [taillabel="6"]
        a -- f [label="9"]
        b -- c [label="7"]
        b -- g [label="8"]
        b -- f [label="5"]
        c -- h [headlabel="3"]
        c -- g [label="5"]
        c -- d [label="6"]
        d -- e [taillabel="4"]
        d -- h [label="10"]
        e -- f [label="8"]
        e -- h [label="9"]
        f -- g [label="4"]
        f -- h [label="7"]
        g -- h [label="4"]
      }
      ```,
      width: 7cm,
    ),
  )

+ Let $V = {A, B, C, D, E, F, G, H, I, J, K, L, M}$ be the set of vertices of the weighted graph $G = (V, E)$. Its weight matrix is given below: e.g., for $(C, D) in E$, its weight is $w(C, D) = 10$.
  $
    mat(
      , 5, , , 7, 14, , , , , , , ;
      5, , 7, , 1, , 2, , , , , , ;
      , 7, , 10, , , 6, 6, , , , , ;
      , , 10, , , , , 4, , , , , ;
      7, 1, , , , 4, , , , , , , ;
      14, , , , 4, , 8, , 6, 4, , , ;
      , 2, 6, , , 8, , 7, 6, 4, , , ;
      , , 6, 4, , , 7, , , , 1, 2, ;
      , , , , , 6, 6, , , , , , ;
      , , , , , 4, 4, , , , 11, 13, ;
      , , , , , , , 1, , 11, , , 2;
      , , , , , , , 2, , 13, , , 5;
      , , , , , , , , , , 2, 5, ;
    )
  $
  + Compute the minimum weight (or shortest) path from vertex A to vertex M. Compute the total weight of such path.
  + Find a minimum-weight spanning tree and give its weight.

+ Let $G = (V, E, omega)$ be the following weighted graph (with the weight of the edge ${f, h}$ equal to $x in RR$). Compute the range of values of the weight $x in RR$, so that the minimum-length path from a to h goes through the edge ${F, H}$.
  #figure(
    raw-render(
      ```dot
      graph {
        layout=neato
        edge[labeldistance=2]
        node[shape=circle margin=0 width=0.2]
        a -- b [label="1"];
        a -- d [label="3"];
        a -- c [headlabel="2"];
        b -- c [label="2"];
        b -- e [taillabel="5"];
        c -- d [label="2"];
        c -- f [taillabel="5"];
        d -- g [taillabel="4"];
        e -- f [label="5"];
        e -- h [label="4"];
        f -- g [label="3"];
        f -- h [taillabel="x"];
        g -- h [label="5"];
      }
      ```,
      width: 5cm,
    ),
  )

+ A constructor is planning a new urban development formed by 9 family houses, and now he is designing the water supply. As he knows some graph theory, he defines a weighted graph $G = (V, E, omega)$, where the vertices $V = {a, b, c, d, e, f, g, h, i}$ correspond to the houses, two vertices are adjacent if the houses can be connected by a water pipe, and the weight of each edge is the cost (in thousands of euros) of placing the corresponding water pipe. The graph $G$ is given by
  #figure(
    raw-render(
      ```dot
      graph {
        layout=neato
        start=regular
        node[shape=circle margin=0 width=0.2]
        a -- b [label="5"];
        a -- d [label="6"];
        b -- c [label="6"];
        b -- e [label="7"];
        c -- f [label="5"];
        d -- e [label="6"];
        d -- g [label="4"];
        e -- f [label="5"];
        e -- h [label="5"];
        f -- i [label="3"];
        g -- h [label="7"];
        h -- i [label="8"];
      }
      ```,
      width: 6cm,
    ),
  )
  - If the constructor places the water supply on house a, compute using Dijsktra's algorithm the minimum-cost path to reach house i (where he will live). As a side result, compute the total cost of the rooted (at a) spanning tree that connects A to all the other vertices.
  - When they heard this idea, the other neighbors complained about the price. They preferred to place the pipes using a minimum-cost spanning tree. Find one of these subgraphs using Prim's algorithm, and compute the total cost of the pipes.


+ Let $G$ be the following weighted graph, let $H$ be the simple graph obtained by erasing the weights of $G$.
  #figure(
    raw-render(
      ```dot
      graph {
        layout=neato
        edge[labeldistance=2]
        node[shape=circle margin=0 width=0.2]
        a -- b [label="1"];
        a -- d [label="5"];
        b -- c [headlabel="3"];
        b -- e [taillabel="2"];
        c -- e [taillabel="2"];
        c -- g [taillabel="3"];
        d -- e [taillabel="5"];
        d -- f [taillabel="2"];
        e -- g [headlabel="1"];
        f -- g [label="2"];
      }
      ```,
      width: 5cm,
    ),
  )
  + Find a minimum-weight spanning tree for $G$.
  + Is $H$ bipartite? If yes, give the partition of $V$ into two disjoint sets that provides a proof for bipartiteness.
  + Tell whether there are Euler tours/trails, and Hamilton cycles/paths.
  + Find a graph with exactly the same degree sequence as $H$, but not isomorphic to $H$. Explain why it is not isomorphic to $H$.

+ Tell whether there are Euler tours/trails, and Hamilton cycles/paths in the following graphs.
  #figure(
    raw-render(
      ```dot
      graph {
        layout=neato
        node[shape=circle margin=0 width=0.2]
        0 -- 1;
        0 -- 4;
        0 -- 5;
        1 -- 2;
        2 -- 3;
        3 -- 4;
      }
      ```,
      width: 5cm,
    ),
  )
  #figure(
    raw-render(
      ```dot
      graph {
        layout=neato
        node[shape=circle margin=0 width=0.2]
        a -- {b, d};
        c -- {d, b};
        g -- {f, h};
        e -- {f, h};
      }
      ```,
      width: 5cm,
    ),
  )
  #figure(
    raw-render(
      ```dot
      graph {
        layout=neato
        node[shape=circle margin=0 width=0.2]
        0 -- {1, 4, 5};
        2 -- {1, 7, 3};
        8 -- {3, 7, 9};
        6 -- {1, 5, 7}
        4 -- {3, 9};
        5 -- 9
        }
      ```,
      width: 5cm,
    ),
  )

+ Tell whether the following graph admits an Euler tour/trail, and find it (if any).
  #figure(
    raw-render(
      ```dot
      graph {
        layout=neato
        node[shape=circle margin=0 width=0.2]
        e -- {a, b, d, f, h, i};
        f -- {g, c, d, i, b};
        g -- c;
        d -- {h, a};
        i -- h;
      }
      ```,
      width: 5cm,
    ),
  )

+ In a film festival there are 6 films on the first day. Films 1, 3, and 5 are dramas; films 2, 4, and 6 are comedies; films 3 and 4 are indies, and films 5 and 6 are blockbusters. Each film lasts two hours. What is the minimum number of hours needed to show all films, in such a way that films of the same type do not overlap?

+ Given a set of intervals in $RR$, we can construct a graph named _interval graph_ in the following way: each interval is a vertex of the graph, and two vertices are adjacent if and only if the corresponding intervals have a non-empty intersection.
  + Compute the interval graph $G$ associated to the intervals:
    $ {(1, 9), (7, 8), (0, 3), (4, 10), (2, 6), (5, 11)} $
  + Tell whether this graph is bipartite, admits an Euler tour or a Hamilton cycle. In case there is an Euler tour/trail and/or a Hamilton cycle/path, find one example of each.

+ Find examples of simple graphs $G$ that satisfy the following conditions:
  - $G$ has 7 vertices, is Hamiltonian, and is Eulerian.
  - $G$ has 8 vertices, is Hamiltonian and Eulerian, but there is at least one Hamilton cycle that does not coincide with any Euler tour.
  - $G$ has 7 vertices, is Hamiltonian, is not Eulerian, and has no cut-edges.
  - $G$ has 7 vertices, is not Hamiltonian, and is Eulerian.
  - $G$ has 7 vertices, is Hamiltonian, is not Eulerian, and is bipartite.

+ Let $G = (V, E)$ be the graph defined by the following adjacency matrix:
  $
    A_G = mat(
      0, 0, 1, 1, 0, 1, 0, 0;
      0, 0, 0, 0, 1, 0, 1, 0;
      1, 0, 0, 1, 0, 1, 0, 1;
      1, 0, 1, 0, 0, 0, 0, 1;
      0, 1, 0, 0, 0, 0, 1, 0;
      1, 0, 1, 0, 0, 0, 0, 1;
      0, 1, 0, 0, 1, 0, 0, 0;
      0, 0, 1, 1, 0, 1, 0, 0;
    ).
  $
  + Find its chromatic number using a graph-theoretic algorithm.
  + Find a spanning tree of $G$ (if any).
  + Does $G$ admit an Euler trail? Which is the minimum number of edges we should add to $G$ to make it an Eulerian graph?

+ Let $G_n = (V_n, E_n)$ with $n in NN$ be a graph family defined as follows:
  - Each vertex $v in V_n$ corresponds to a bit string of length $n$ with an even number of ones.
  - Two vertices $x, y in V_n$ are adjacent (${x, y} in E_n$) if and only if they differ exactly in two bits.

  If $n$ is a fixed natural number, compute $|V_n|$ and $|E_n|$. Is $G_n$ a regular graph? If the answer is positive, then give the common degree; and if the answer is negative, then give the degree sequence. For which values of $n$ the graph $G_n$ is Eulerian?

// 13.10
+ Prove using induction that the number of odd-degree vertices in any graph $G$ is an even number.
