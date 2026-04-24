#import "assets/base_template.typ": *
#import "@preview/subpar:0.2.2"
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

= Set theory

+ Let $A = {x in ZZ | x^2 < 16}$. For each of the following statements, determine whether it is true or not:
  + ${0, 1, 2, 3} subset A$
  + ${3, 1} in A$
  + ${x in ZZ | |x| < 4} subset A$
  + $emptyset subset A$
  + $3 in A$
  + ${3} in A$
  + $A subset {-3, -2, -1, 0, 1, 2, 3}$

// R 2.1.13
+ Let $x in U$. For each of the following statements, determine whether it is true or not:
  + $x in {x}$
  + ${x} in {x}$
  + ${x} subset.eq {x}$
  + ${x} in {{x}}$
  + $emptyset subset.eq {x}$
  + $emptyset in {x}$

// R 2.1.20
+ Find two sets $A$ and $B$ such that $A in B$ and $A subset.eq B$.

// R 2.1.27
+ Given two sets $A$ and $B$, show that
  $
    A subset.eq B <=> cal(P) (A) subset.eq cal(P) (B).
  $

+ Prove the following identities:
  + $A union (A inter B) = A inter (A union B) = A$
  + $(A union B) without C = (A without C) union (B without C)$
  + $A without (B union C) = (A without B) without C$
  + $(A triangle.t B) triangle.t C = A triangle.t (B triangle.t C)$
  + $A without B = A triangle.t (A inter B)$
  + $overline((A triangle.t B)) = overline(A) triangle.t B = A triangle.t overline(B)$

+ Simplify the following expressions:#v(0.2em)
  + $overline((overline(A) union overline(B))) union overline((overline(A) union B))$ #v(0.5em)
  + $overline((overline([(A union B) inter C]) union overline(B)))$

// R 2.2.54
+ Determine $union_(i=0)^(+ oo) A_i$ and $inter_(i=0)^(+ oo) A_i$ for
  + $A_i = {0, 1, dots, i}$,
  + $A_i = {dots, -2, -1, dots, i}$.

// R 2.1.31
+ What is the Cartesian product $A times B times C$, where $A$ is the set of all airlines and $B$ and $C$ are both the set of all cities in Europe? What could this Cartesian product represent, in plain words?

+ A dictionary is a data structure that is equivalent to a function $d: K -> V$ which assigns values ($in V$) to keys ($in K$).
  Explain, in terms of relations and functions, what a collision (when one key is repeated in the dictionary) represents.

+ In a relational database, a table with $n$ columns is a data structure that is equivalent to a relation $R subset.eq C_1 times C_2 times dots times C_n$, where the sets $C_i$ correspond to the possible values in each column.
  It is strongly recommended to add a primary key --which is a column or a set of columns which uniquely identify each row-- to such tables.
  How does adding a primary key change the underlying relation, in mathematical terms?
  Can you guess why this is recommended?

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

// R 9.5.2
+ Which of these relations on the set of all people are equivalence relations?
  + ${(a, b) ∣ a "and" b "are the same age"}$
  + ${(a, b) ∣ a "and" b "have the same parents"}$
  + ${(a, b) ∣ a "and" b "share a common parent"}$
  + ${(a, b) ∣ a "and" b "have met"}$
  + ${(a, b) ∣ a "and" b "speak a common language" }$

// R 9.5.4
+ Define three equivalence relations on the set of students in your group, different from the relations we already presented.
  Determine the equivalence classes for each of these equivalence relations.

+ Let $A = {"foo", "bar", "baz", "xyz", "spam"}$ a set of character strings, and $R subset.eq A times A$ such that $x rel y$ for $x,y in A$ iff $x$ and $y$ have the same number of characters.
  + Describe $R$ using a directed graph, and say which properties it satisfies ((anti)reflexivity, (anti)symmetry, transitivity).
  + Let us now consider $B = limits(times.big)_(i=1)^N {0, 1}$ for a given $N in NN$, and $R subset.eq B times B$ with the same notion of relation as above. Interpret the set $B$ in computer science terms, and determine which properties $R$ satisfies.\
    _Note:_ $limits(times.big)_(i=1)^N C$ denotes the cartesian product of $C$ with itself $N$ times: $C times C times dots times C$.


+ Let $A$ and $B$ be two sets, and let $f: A -> B$ be a certain function. Show that any binary relation defined on $A$ of the form
  $ a rel b <==> f(a) = f(b), quad a, b in A $
  is an equivalence relation for any $f$. Find the quotient set $A\/R$.

+ Let $A$ be a set, and $B subset.eq A$ a fixed subset of $A$. We now consider the power set $cal(P)(A)$, and define the following relation on $cal(P)(A)$: for any subsets $X, Y subset.eq A$:
  $ X rel Y <==> X inter B = Y inter B $
  + Prove that $R$ is an equivalence relation.
  + Compute its quotient set $cal(P)(A)\/R$, and prove that there is a bijection between this quotient set and $cal(P)(B)$.

+ Let $R$ be a relation defined on $NN times NN$, such that $(a, b) rel (c, d)$ if and only if $a + b = c + d$.
  Show that $R$ is an equivalence relation on $NN times NN$, and that there exists a bijection between the quotient set $(NN times NN)\/R$ and $NN$.

+ Let
  $
    A = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}
  $
  and let $R$ be a relation on $A$, such that $a rel b$ if and only if $floor(sqrt(a)) = floor(sqrt(b))$.
  Show that $R$ is an equivalence relation, find its classes of equivalence, and its quotient set.

+ We define the relation $R$ on $RR times (RR without {0})$ such that
  $ (a, b) rel (c, d) <==> a d = b c $
  Show that this is an equivalence relation, and obtain the quotient set $( RR times (RR without {0}) ) \/ R$.

+ A relation $R$ defined on a set $A$ is a *circular relation* if it verifies the following property:
  $ (a rel b) and (b rel c) ==> c rel a $
  Prove that a relation is an equivalence relation if and only if it is circular and reflexive.

+ A relation $R$ on a set $A$ is *weakly transitive* if, for all elements $a, b, c, d in A$, the relations $a rel b$, $b rel c$, and $c rel d$ imply that $a rel d$. Determine which one of the following two statements is true and which one is false (by proving the true statement, and giving a counter-example of the false one):
  + Every symmetric and weakly transitive relation is transitive.
  + Every reflexive, symmetric, and weakly transitive relation is an equivalence relation.

+ The adjacency matrix of a binary relation $R$ is given by
  $ M_R = mat(1, 0, 1; 0, 1, b; 1, a, c) $
  where $a, b, c = 0, 1$. Which conditions should $a$, $b$, and $c$ satisfy so that $R$ becomes an equivalence relation?

+ Show that the following relations are equivalence relations. Find the corresponding classes of equivalence and the quotient set $V\/R$:
  + $V = ZZ$ and $v rel w$ if $|v - w|$ is a multiple of 2.
  + $V = ZZ$ and $v rel w$ if $v^2 - w^2 = v - w$. Describe the equivalence class containing the element 2005.
  + $V = RR^2$ and $(x, y) rel (u, w)$ if $x y = u w$.
  + $V = RR^2$ and $(x, y) rel (u, w)$ if $(x - y)(x + y) = (u - w)(u + w)$.
  + $V = RR^2$ and $(x, y) rel (u, w)$ if $x^2 + y^2 = u^2 + w^2$.

// R 9.5.48
+ List the equivalence relations produced by these partitions of ${a, b, c, d, e, f, g}$.
  + ${{a, b}, {c, d}, {e, f, g}}$
  + ${{a}, {b}, {c, d}, {e, f}, {g}}$

// R 9.5.45
+ Which of these are partitions of the set $ZZ times ZZ$ of ordered pairs of integers?
  + The set of pairs $(x, y)$ where $x$ or $y$ is odd, the set of pairs $(x, y)$ where $x$ is even, and the set of pairs $(x, y)$ where $y$ is even.
  + The set of pairs $(x, y)$ where both $x$ and $y$ are odd, the set of pairs $(x, y)$ where exactly one of $x$ and $y$ is odd, and the set of pairs $(x, y)$ where both $x$ and $y$ are even.
  + the set of pairs $(x, y)$ where $x != 0$ and $y != 0$, the set of pairs $(x, y)$ where $x = 0$ and $y != 0$, and the set of pairs $(x, y)$ where $x != 0$ and $y = 0$.

+ Given the matrix representing the relation $R$ on a set $A$
  $ mat(1, 1, 1, 1, 0; 0, 1, 1, 1, 0; 0, 0, 1, 1, 0; 0, 0, 0, 1, 0; 0, 0, 1, 1, 1) $
  + Compute $"Dom"(R)$ and $"Im"(R)$.
  + Draw its Hasse diagram.
// + Find a total order compatible with $R$.

+ Let $A = {0, 1, 2} times {2, 5, 8}$, and let us define the order relation $R$ on $A$ such that $(a, b) rel (c, d) <==> (a + b) | (c + d)$.
  Find the maximal, minimal, maximum, and minimum elements of the poset $(A, R)$.

+ Let us consider the relation $R$ on $RR^2$ given by
  $ (a, b) rel (c, d) <==> a <= c "and" b <= d $
  Find the maximal and minimal elements of the set $C subset.eq RR^2$:
  $ C = {(x, y) in RR^2 | x^2 + y^2 = 1} $
  Find $sup(C)$ and $inf(C)$ by considering $C$ as a subset of $RR^2$.

+ Let us consider two binary relations on the set $NN^*$.
  $ a rel_1 b <==> exists n in NN^* "such that" a = b^n $
  $ a rel_2 b <==> exists n in NN "such that" a = b^n $
  + Show that $R_1$ is an order relation. Is $R_2$ also an order relation? Is $R_1$ a total order?
  + Find the Hasse diagram of both relations on the set $A = {n in NN^* | 1 <= n <= 9}$.
  + Find for $R_1$ and $R_2$ the maximal, minimal, maximum, and minimum elements on $A$. Find also the supremum and infimum of $A$ as a subset of $NN^*$.

+ A polygon $P$ is convex if, for any two points $a, b in P$, the segment $overline(a b)$ joining both points is totally contained inside the polygon.
  Prove that the sum of the interior angles of a convex polygon of $n >= 3$ sides is $(n - 2)pi$.\
  _Hint:_ You may use the fact that any convex polygon with $n$ edges is the result of adding a triangle to a convex polygon of $n − 1$ edges.

+ Prove that $1 + 2^n < 3^n$ for each $n >= 2$.

+ Consider the identities
  $
                      1 & = 2!/(2) \
                3 dot 1 & = 4!/(4 dot 2!) \
          5 dot 3 dot 1 & = 6!/(8 dot 3!) \
    7 dot 5 dot 3 dot 1 & = 8!/(16 dot 4!)
  $
  Guess a general formula and prove its validity by induction.


= Elementary number theory

// R 4.1.15
+ What time does a 12-hour clock read
  + 80 hours after it reads 11:00?
  + 40 hours before it reads 12:00?
  + 100 hours after it reads 6:00?

+ Prove that $6 | a(a + 1)(2a + 1)$ for any $a in ZZ$.

+ Given $a = 92$ and $b = 84$, use Euclid's algorithm to compute $d = gcd(a, b)$. Find integers $x, y in ZZ$ such that $a x + b y = d$.

// 13.7
+ Prove that the following equation holds for all $n in NN^*$:
  $ 3 | (4^n - 1) $

// 13.11
+ Given their form provided below, prove by induction that the Fibonacci numbers $F_n$ and $F_(n+1)$ are relatively prime for all integer $n >= 0$:
  $
    F_n = F_(n-1) + F_(n-2), quad n >= 2, quad F_0 = 0, quad F_1 = 1
  $

+ Prove that $log_2 3$ is an irrational number.

+ Prove that 101 is a prime number.

+ How many positive divisors does the number $29338848000 = 2^8 dot 3^5 dot 5^3 dot 7^3 dot 11$ have? How many of them are multiple of 99? And how many of them are multiple of 39?

+ The product of two natural numbers is 1260, and their lcm is 630. Find those numbers.

// R 4.4.6.b)
+ Find an inverse of $a$ modulo $m$ for $a=34$ and $m=89$.

// TODO:
// You run a bakery that sells cookies in packs of 12. However, your shipping crates only fit 10 packs perfectly. You have a customer who doesn't want a full crate; they specifically want a delivery that results in 4 loose packs left over for their display counter.
// How many cookies (x) do you need to bake (in multiples of 12) to ensure that after filling as many 10-pack crates as possible, you have exactly 4 packs left?

+ Solve the following congruence equations:
  + $3 x equiv 5 space (mod 13)$.
  + $8 x equiv 2 space (mod 10)$.
  + $5 x equiv 7 space (mod 15)$.
  + $3 x equiv 9 space (mod 15)$.

// R 4.4.17
+ Show that if $p$ is prime, the only solutions of $x^2 equiv 1 (mod p)$ are integers $x$ such that $x equiv 1 (mod p)$ or $x equiv −1 (mod p)$.

// 11.2
+ Let $A = {6, 10, 12, 18, 21, 40, 441, 1323}$. We define the following binary relation $R$ on $A$:
  $ x rel y <==> "x and y have the same prime divisors" $
  If $R$ is an equivalence relation, find its classes of equivalence, or if it is not an equivalence relation, say which properties do not hold.

// 13.4
+ Let $A = {n in ZZ | 2 <= n <= 12}$, and let us define on $A$ the order relation $R$ given by
  $ n rel m <==> n | m, "or" n "is prime and" n <= m $
  Give the maximal, minimal, maximum, and minimum elements of the poset $(A, R)$.

+ Find the remainder of the integer $2^68$ when divided by 19.

+ Compute the last digit of the integer $3^1492$.

+ Let's prove Fermat's little theorem.
  Let's consider an integer $a$ and a prime $p$ such that $p divides.not a$.
  + Show that no two of the integers $a, 2 a, dots, (p-1)a$ are congruent modulo $p$.
  + Show that this implies that
    $
      product_(i=1)^(p-1) i equiv product_(i=1)^(p-1) i dot a space (mod p),
    $
    which is equivalent to
    $
      (p-1)! equiv a^(p-1) (p-1)! space (mod p).
    $
  + Show that it then follows that
    $
      a^(p-1) equiv 1 (mod p).
    $
  + Finally, show that for all integers $a$:
    $
      a^p equiv a (mod p).
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

+ A hacker with access to your computer can try $10^9$ passwords per second.
  Assuming a hacker knows your password is $6$, $7$ or $8$ characters long, how long would it take them (at most) to crack it by brute force, if they also know that your password...
  + ...only contains the 26 characters from the latin alphabet?
  + ...also contains at least one digit?
  + ...also contains at least one special character (33 distinct ones)?
  + Is it always good to add a constraint such as "the password must contain at least one character from this set of characters"?

+ Consider a group of six people, in which individuals can either be friends or enemies with each other. Show that there are either three mutual friends or three mutual enemies in the group.

+ A sales company wants to audit the results in 20 cities, and there are 5 employees willing to do that job; each of them will be in charge of 4 cities.
  + In how many distinct ways can the company manager assign the cities to the 5 employees?
  + In how many distinct ways can the company manager split the 20 cities in 5 groups of 4 cities each?

+ A wedding photographer likes to make pictures of the 10 people present in the banquet (including the groom and the bride) in groups of 6 persons. How many distinct pictures can the photographer take if
  + the bride is in the picture?
  + both the bride and the groom are in the picture?
  + exactly one of them (bride or groom) is in the picture?
  + both the bride and the groom are next to each other in the picture?
  + both the bride and the groom are in the picture but not next to each other?
  + both the groom and the bride are next to each other in the picture, and the bride is on the left of the groom?

+ What is the probability that from fifty persons chosen at random, at least two of them have their birthday the same day of the year?

+ Find how many five-digit numbers $n$ can be formed with the set $A = {1, 2, 3}$, and such that each digit in $A$ must appear in the number $n$ at least once.

+ The USS Arizona had 12 distinct flags and the sailors could put up to 3 flags in the corresponding flagpole, each flag configuration describing a distinct circumstance in the ship.
  + How many distinct circumstances using at least one flag could be described with this set-up?
  + How many distinct circumstances using at least one flag could be described if there were three equal sets of the above-mentioned 12 flags?

+ Find in how many ways we can put three letters A and seven letters B such that there are no two consecutive A's.

+ Let $A$ be a set with cardinality $n$.
  + How many different relations are there on $A$?
  + How many of them are reflexive?
  + How many of them are symmetric?
  + How many of them are antisymmetric?

+ We have a three-dimensional space and we are allowed to move with jumps of length 1 unit in the direction of three coordinate axis. In other words, each trajectory is composed by moves of the following three types:
  - (H) $(x, y, z) arrow (x + 1, y, z)$,
  - (V) $(x, y, z) arrow (x, y + 1, z)$,
  - (L) $(x, y, z) arrow (x, y, z + 1)$.

  + How many trajectories are there joining the points $(-1, 2, 0)$ and $(1, 3, 7)$?
  + How many of them go through the point $(0, 3, 4)$?


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

+ In how many ways can a player extract 5 cards from a poker deck (i.e., four suits, each with 13 cards 2, 3, . . . , 9, 10, J, Q, K, A) and obtain
  + a flush (five cards from the same suit)?
  + four aces?
  + a four of a kind (four cards with the same number)?
  + three aces and two Js?
  + three aces and a pair (two cards with the same number)?
  + full house (a three of a kind and a pair)?
  What are then the associated probabilities?

+ We want to line up $a$ white balls and $b$ black balls. In how many distinct ways can we arrange these balls such that there are exactly $k + 1$ groups of black balls?\
  _Note: A group of equal balls may consist in a single ball._

+ Find the number of $p$-element subsets taken from the $n$-element set ${a_1, a_2, ..., a_n}$, and such that they do not contain consecutive elements.

+ Find the number of distinct solutions of the equation $x_1 + x_2 + x_3 = 17$ when the $x_i$ all belong to the set
  + $NN$ of the non-negative integers.
  + $NN^*$ of positive integers.
  + ${0, 1, 2, 3, 4, 5, 6}$.

+ We have 7 distinct object types, and we want to choose 25 objects in such a way that there are always at least 2 objects and at most six objects of each type. In how many distinct ways can we achieve this task?

// R 6.4.29
+ Show that
  $
    forall n in NN, binom(2 n, n+1) + binom(2 n, n) = 1/2 binom(2 n + 2, n + 1)
  $

// R 6.4.18-20
+
  + Show that for all positive integers $n$,
    $
      binom(n, 0) < binom(n, 1) < dots < binom(n, floor(n/2)),\
      binom(n, ceil(n/2)) > dots > binom(n, n-1) > binom(n, n).
    $
  + Show that if $n$ is greater than $1$, then
    $
      binom(n, floor(n/2)) >= 2^n / n.
    $


= Sequences

+ A data ingestion pipeline is managed using a queue of tasks to be performed.
  At every time step $n$, $k$ tasks are added to the queue, but the system only manages to process half of the tasks present in the queue at the start of the the time step.
  + Write the recurrence relation satisfied by $Q_n$, the queue length at step $n$.
  + Solve the recurrence.
  + What will the queue's length eventually converge to?

+ Your company wants to design a model to forecast the sales it makes every day.
  To simplify, you choose to make only two predictions per week: one for an average weekday, and another for an average weekend day.
  The model should then take into account that the sales tend to grow exponentially with time, that there is a correlation between two days if they are both weekdays or both weekend days, and that, if the sales volume was high during the weekend, it removes potential sales from the weekdays, and vice versa.
  The following model is thus proposed:
  $
    s_n = -1/3 s_(n−1) + 1/5 s_(n−2) + 1.1^n
  $
  + Identify the terms related to each effect described above, and interpret $n$.
  + Solve the recurrence relation.
  + Which effect will end up dominating the others?

+ A distributed database can be seen as a network of $N$ instances which communicate with one another in a decentralised way.
  To synchronise data between instances, some systems such as Cassandra use the "gossip protocol": every second, each up-to-date instance randomly selects another out-dated instance to share the update with.
  We also assume that every second, two instances do not receive the update correctly because of connection timeouts.
  + If $u_t$ denotes the number of nodes which have received a given update after $t$ seconds, what recurrence relation does it satisfy?
  + Solve the recurrence with a sensible choice of $u_0$.
  + How long would it take to update a million instances?
  + Assuming that an instance doesn't know which others are updated when selecting one to gossip with, how does the recurrence relation for $u_t$ change? Can you define two broad phases of $u_t$'s growth, and determine to which value it should converge?

+ For each integer $n in NN$, let us consider the set of $n$ lines in the plane with the following properties:
  - P1. There are no parallel lines.
  - P2. At each intersection point, only two lines meet.

  Let $S_n$ be the number of regions of the plane defined by $n$ lines with the above properties:
  + Find a recurrence equation for $S_n$.
  + Solve this equation.

+ Let us consider numerical strings of 10 digits formed with elements in the set ${0, 1, 2}$. How many of these strings are such that the sum of the 10 digits is an even number?

+ A software company is trying to solve a very complicated problem. They say they are in the $n$-th phase of the project when there are $n$ steps left to finish it. Let us suppose that in each phase there are five options. Two of them, lead to the $(n - 1)$-th phase; but the other three options are better in the sense that they lead directly to the $(n - 2)$-th phase. Let us denote by $a_n$ the number of ways of achieving the solution of the project from the $n$-th phase. If $a_1 = 2$, check that $a_2 = 7$, and obtain a recurrence equation for $a_n$. Prove that
  $ a_n = 1/4 [3^(n+1) + (-1)^n]. $

+ Compute the number of bit strings of length $n >= 1$ which do not have two consecutive zeros.

+ There are $3^n$ strings of length $n$ formed by ${0, 1, 2}$. Compute the number of those strings with an odd number of zeros $a_n$, by first proving that the recurrence equation for $a_n$ is
  $ a_n = a_(n-1) + 3^(n-1), quad n >= 2, quad a_1 = 1, $
  and then, by solving this equation.

+ Solve the equation:
  $ a_n = 4a_(n-1) - 4a_(n-2), quad n >= 3, quad a_1 = a_2 = 1. $

+ Let $a_n$ be the number of strings of length $n$ which can be formed with ${0, 1, 2}$ in such a way that there are neither two consecutive 1's nor two consecutive 2's.
  + Show that $a_n = 2a_(n-1) + a_(n-2)$, $n >= 3$.
  + Find an explicit solution for $a_n$.

+ Solve the equation:
  $ a_n = -a_(n-1) + 3 dot 2^(n-1), quad n >=2, quad a_1 = 0. $

// R 8.2.25
+ Let us consider the recurrence relation $a_n = 2 a_(n−1) + n + 5$
  + Determine values of the constants $A$ and $B$ such that $a_n = A n + B$ is a solution of this recurrence relation.
  + Find all solutions of this recurrence relation.
  + Find the solution of this recurrence relation when $a_0 = 4$.

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
  + Compute $b_1$, $b_2$, $b_3$, and $b_4$.
  + Find a recurrence equation for $(b_n)$.
  + Solve this recurrence when $n$ is a power of 2.
  + Prove that $b_n = n - 1$ for any $n in NN$.

+ Solve the following recurrences using generating functions:
  + $a_(n+1) - a_n = 3^n$, $n >= 0$, $a_0 = 1$.
  // + $a_(n+1) - a_n = n^2$, $n >= 0$, $a_0 = 1$.
  + $a_n - a_(n-1) = 5^(n-1)$, $n >= 1$, $a_0 = 1$.
  + $a_(n+2) - 3a_(n+1) + 2a_n = 0$, $n >= 0$, $a_0 = 1$, $a_1 = 6$.
  + $a_(n+2) - 2a_(n+1) + a_n = 2^n$, $n >= 0$, $a_0 = 1$, $a_1 = 2$.
  + $a_(n+2) - 2a_(n+1) - a_n = 2^n$, $n >= 0$, $a_0 = 1$, $a_1 = 2$.

+ Let $F$ be the generating function that solves the following recurrence with $n$-dependent coefficients:
  $
    forall n >= 2, n a_n = 2(a_(n-1) + a_(n-2)), \
    quad a_0 = e, quad a_1 = 2e
  $
  Find the equation satisfied by $F$. \
  _Hint:_ The equation may involve $F'$.

// Uses generalized binomial theorem
// + Find, using generating functions, the number of distinct integer solutions of the equation
//   $ x_1 + x_2 + x_3 = N $
//   with $x_i >= 0$.


= Graph theory
// TODO: basic exercise about translating from/to adj matrix to/from graph reprs?

+ For each example, define what the vertices and the edges are. Decide if the graph should be directed and/or weighted, if it contains self-loops, if it is bipartite and whether it's connected.
  + Metro network of a city.
  + Physical contacts between people over the course of a day.
  + An online social network.
  + A country's highway network.
  + Economic transactions between banks.
  + Network of users and movies on a streaming platform (user connected to movie if they have given it a rating).

+ Draw examples of graphs that satisfy the following properties.
  + A graph with 6 vertices and 5 edges that does not contain cycles.
  + A graph with 6 vertices and 5 edges that contains exactly one cycle.
  + A connected bipartite graph with 6 vertices that contains a cycle.
  + A graph with 6 vertices that is not bipartite.
  + A graph that has a cut edge, a cut vertex and a cycle.
  + A graph with a cut vertex but no cut edges.
  + A directed graph with 5 vertices that is weakly connected but not strongly connected.
  + A directed graph with 4 vertices that is strongly connected, but ceases to be so upon removing a single edge.
  + A 3-regular graph with 6 vertices.
  + Two graphs with 6 vertices that have the same degree sequence but are not isomorphic.
  + A disconnected graph with 7 vertices consisting of exactly two connected components, one of which is a cycle and the other a tree.
  + A tree with 10 vertices, 4 of which are branches of degree 3 and the rest are leaves.

+ Let $V$ be the set of those two-letter words formed with the alphabet ${w, x, y, z}$ and starting with either $y$ or $z$. We define the graph $G = (V, E)$ in such a way that two words in $V$ determine an edge in $E$ if they differ in exactly one letter:
  + How many vertices does $G$ have?
  + Draw the graph $G$.
  + Prove that $G$ is regular and compute its degree.
  + Determine whether $G$ is bipartite or not.

+ The complementary graph $overline(G)$ of a simple graph $G$ has the same vertices as $G$, but two vertices are adjacent in $overline(G)$ if and only if they are not adjacent in $G$.
  Let $G$ be a graph with 20 edges such that $overline(G)$ has 25 edges. How many vertices does $G$ have?

+ Compute the number of vertices of simple connected graphs $G$ if:
  + $G$ is a 2-regular graph with 9 edges.
  + $G$ is a regular graph with 6 edges.
  + $G$ has 10 edges, 2 vertices of degree 4, and all other vertices have degree 3.

+ Let $K_n$ be the complete simple graph of $n$ vertices.
  + Draw $K_1$, $K_2$, $K_3$, $K_4$, and $K_5$.
  + Which is the degree of the vertices of $K_n$?
  + How many edges does $K_n$ have?
  + Prove that $K_n$ is a sub-graph of $K_m$ for all $n < m$.

+ For which values of $n >= 3$ are the graphs $K_n$, $P_n$, and $C_n$ ---respectively the complete simple graph, the path and the cycle of $n$ vertices--- bipartite?

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
        a -- {b, c, d, e};
        b -- {c, d, e};
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


+ Let $K_n$ be the complete simple graph of $n$ vertices.
  + How many length-3 cycles does it contain?
  + How many triangles does each edge of $K_n$ belong to?

// 13.6
+ Let us consider the cycle $C_4 = (V_4, E_4)$ with labeled vertices $V_4 = {a, b, c, d}$.
  + If $A$ is the following set of subgraphs of $C_4$:
    $ A = {(V_4, E) | E subset.eq E_4} $
    compute the cardinality of $A$.
  + We define on $A$ the following equivalence relation $R$: if $G_1, G_2 in A$,
    $ G_1 rel G_2 <==> G_1 "is isomorphic to" G_2 $
    Find the equivalence classes $[G]_R$, and the quotient set $C = A\/R$.
  + We now define the order relation $prec.eq.curly$ on the quotient set $C$ as follows: $[A]_R prec.eq.curly [B]_R$ if and only if there exist graphs $G_1 = (V_4, E_1) in [A]_R$ and $G_2 = (V_4, E_2) in [B]_R$ such that $E_1 subset.eq E_2$. Find the Hasse diagram associated to the set $(C, prec.eq.curly)$. Is $(C, prec.eq.curly)$ a totally ordered set?
  + Let $Z subset C$ be the subset of $C$ containing the classes of equivalence that contain at least one representative with two edges. Compute $sup(Z)$ and $inf(Z)$.

+ Let $G_n = (V_n, E_n)$ with $n in NN^*$ be a graph family defined as follows:
  - Each vertex $v in V_n$ corresponds to a bit string of length $n$ with an even number of ones.
  - Two vertices $x, y in V_n$ are adjacent (${x, y} in E_n$) if and only if they differ exactly in two bits.

  Compute $|V_n|$ and $|E_n|$.

// 13.10
+ Prove using induction that the number of odd-degree vertices in any simple undirected graph $G$ is an even number.


+ Let $X$ be a finite set of cardinality $n$. We define the simple graph $G = (V, E)$ in the following way: the set of vertices is given by the power set of $X$ ($V = cal(P)(X)$), and two vertices $R, S in V$ are adjacent if and only if $R subset S$ or $S subset R$.
  + How many vertices does $G$ contain?
  + Prove that the number of edges of $G$ satisfies the following recurrence relation:
    $
      forall n in NN, a_(n+1) = 2 a_n + 3^n
    $
  + How many edges does $G$ contain?
  + Taking $X = {A, B, C}$, determine the degree of each vertex in $V$.
    Is $G$ regular?
  + Is $G$ bipartite?

+ Show that if $G = (V, E)$ is a simple graph and
  $ |E| > binom(|V| - 1, 2), $
  then $G$ is connected.


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
  + What kind of graph is $G$?
  + How many vertices and edges does $G$ contain?
  + Is $G$ a regular graph? If yes, tell the common degree, and if not, give the degree sequence of $G$.
  + Let $i eq.not j$ be two distinct vertices of $G$ ($i, j in V$). Let $n_(i j)$ be the number of walks from $i$ to $j$ of length 3. Find all the possible values of $n_(i j)$ for $G$.
  + Which is the length of a minimum-length cycle of $G$?
// R 10.6.1
+ For each of these problems about a subway system, describe a weighted graph model that can be used to solve the problem.
  + What is the least amount of time required to travel between two stops?
  + What is the minimum distance that can be traveled to reach a stop from another stop?
  + What is the least fare required to travel between two stops if fares between stops are added to give the total fare?

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
        start=2
        splines=true
        edge [fontsize=10 labelfloat=true labeldistance=1 color="#00000055"]
        node[shape=circle margin=0 width=0.2]
        a -- b [label="6"]
        a -- f [label="9"]
        b -- c [label="7"]
        b -- g [label="8"]
        b -- f [label="5"]
        c -- h [headlabel="3"]
        c -- g [label="5"]
        c -- d [label="6"]
        d -- e [label="4"]
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

+ Let $G = (V, E, omega)$ be the following weighted graph (with the weight of the edge ${f, h}$ equal to $x in RR$). Compute the range of values of the weight $x in RR$, so that the minimum-length path from a to h goes through the edge ${f, h}$.
  #figure(
    raw-render(
      ```dot
      graph {
        layout=neato
        start=9
        edge[labeldistance=2 color="#00000055"]
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
      width: 6cm,
    ),
  )

+ Considering the following graph $G$, which vertex would you say is the most central?
  You should reason about the different meanings the word "central" can take.
  #figure(
    raw-render(
      ```dot
      graph {
        layout=neato
        start=12
        node[shape=circle fontsize=16 margin=0.05 fontsize=18 width=0.2]
        a -- {b, c} ;
        c -- {e, f, g};
        e -- {f, g};
        g -- f;
        b -- {h, i, j, k}
      }
      ```,
      width: 6cm,
    ),
  )

+ Identify (sub)structures in the following graph $G$.
  #figure(
    raw-render(
      ```dot
      graph {
        layout=circo
        node[shape=circle fontsize=16 margin=0.05 fontsize=24 width=0.2]
        a -- {b, c, d, e};
        b -- {c, d, h};
        c -- {d, h};
        e -- {f, g};
        h -- {i, j};
        j -- {d, k, l};
      }
      ```,
      width: 6cm,
    ),
  )


+ Which of these graphs are trees?
  #subpar.grid(
    columns: (1fr, 1fr),
    numbering-sub: "(i)",
    figure(
      cetz.canvas({
        import cetz.draw: *
        circle((0, 1), radius: 0.1, fill: black, name: "a")
        circle((1, 1), radius: 0.1, fill: black, name: "b")
        circle((2, 1), radius: 0.1, fill: black, name: "c")
        circle((0, 0), radius: 0.1, fill: black, name: "1")
        circle((1, 0), radius: 0.1, fill: black, name: "2")
        circle((2, 0), radius: 0.1, fill: black, name: "3")
        line("a", "1")
        line("b", "2")
        line("c", "3")
        line("b", "1")
        line("c", "2")
      }),
      caption: [],
    ),
    figure(
      cetz.canvas({
        import cetz.draw: *
        circle((0, 1), radius: 0.1, fill: black, name: "a")
        circle((1, 1), radius: 0.1, fill: black, name: "b")
        circle((2, 1), radius: 0.1, fill: black, name: "c")
        circle((0, 0), radius: 0.1, fill: black, name: "1")
        circle((1, 0), radius: 0.1, fill: black, name: "2")
        circle((2, 0), radius: 0.1, fill: black, name: "3")
        line("a", "1")
        line("b", "2")
        line("c", "3")
        line("b", "1")
        line("c", "2")
        line("1", "2")
      }),
      caption: [],
    ),

    figure(
      cetz.canvas({
        import cetz.draw: *
        circle((0, 1), radius: 0.1, fill: black, name: "a")
        circle((1, 1), radius: 0.1, fill: black, name: "b")
        circle((2, 1), radius: 0.1, fill: black, name: "c")
        circle((0, 0), radius: 0.1, fill: black, name: "1")
        circle((1, 0), radius: 0.1, fill: black, name: "2")
        circle((2, 0), radius: 0.1, fill: black, name: "3")
        line("a", "1")
        line("c", "3")
        line("b", "1")
        line("c", "2")
      }),
      caption: [],
    ),
    figure(
      cetz.canvas({
        import cetz.draw: *
        circle((0, 0.8), radius: 0.1, fill: black, name: "a")
        circle((1, 1), radius: 0.1, fill: black, name: "b")
        circle((2, 1), radius: 0.1, fill: black, name: "c")
        circle((0, 0), radius: 0.1, fill: black, name: "1")
        circle((1, 0.15), radius: 0.1, fill: black, name: "2")
        circle((2, 0.1), radius: 0.1, fill: black, name: "3")
        line("a", "2")
        line("b", "1")
        line("b", "c")
        line("c", "3")
        line("1", "2")
      }),
      caption: [],
    ),

    figure(
      cetz.canvas({
        import cetz.draw: *
        circle((0, 1), radius: 0.1, fill: black, name: "a")
        circle((1, 1), radius: 0.1, fill: black, name: "b")
        circle((2, 1), radius: 0.1, fill: black, name: "c")
        circle((0, 0), radius: 0.1, fill: black, name: "1")
        circle((1, 0), radius: 0.1, fill: black, name: "2")
        circle((2, 0), radius: 0.1, fill: black, name: "3")
        line("a", "1")
        line("b", "2")
        line("c", "3")
        line("b", "1")
        line("c", "2")
        line("a", "3")
      }),
      caption: [],
    ),
    figure(
      cetz.canvas({
        import cetz.draw: *
        circle((0, 1), radius: 0.1, fill: black, name: "a")
        circle((1, 1), radius: 0.1, fill: black, name: "b")
        circle((2, 1), radius: 0.1, fill: black, name: "c")
        circle((0, 0), radius: 0.1, fill: black, name: "1")
        circle((1, 0), radius: 0.1, fill: black, name: "2")
        circle((2, 0), radius: 0.1, fill: black, name: "3")
        line("a", "2")
        line("b", "3")
        line("c", "2")
        line("b", "1")
      }),
      caption: [],
    ),
  )

+
  + Considering a rooted tree with $n$ vertices in which every internal vertex has $m$ children, prove that $n = m i + 1$, where $i$ is the number of internal vertices.
  + Suppose 1000 players enter a chess tournament. Use a rooted tree model of the tournament to determine how many games must be played to determine a champion, if a player is eliminated after one loss and games are played until only one entrant has not lost. (Assume there are no ties.)

+ Prove that in a rooted tree such that all vertices that are not leaves have degree 3, then the tree has an even number of vertices.

+ How many trees does a forest of 62 vertices and 51 edges contain?

+ If the mean degree of a connected graph is greater than 2, then show that it admits at least two independent cycles.

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
  + Is it bipartite?
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

// R 11.4.13-16 833 1064
+ Let's consider the following graph.
  #figure(
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
        c -- {a, b, d};
        d -- {e, f};
        e -- f;
        g -- {h, f, j};
        h -- {e, i};
      }
      ```,
      width: 7cm,
    ),
  )
  + Use depth-first search to produce a spanning tree of this graph, choosing $a$ as its root, and assuming that vertices are ordered alphabetically.
  + Do the same using breadth-first search.

// R 11.4.23
+ Suppose that an airline must reduce its flight schedule to save money. If its original routes are as illustrated here, which flights can be discontinued to retain service between all pairs of cities (where it may be necessary to combine flights to fly from one city to another)?
  #figure(
    raw-render(
      ```dot
      graph {
        layout=neato;
        start=11;
        concentrate=true;
        splines=true;
        edge [color="#00000055"]
        node[shape=point margin=0 width=0.2]
        sf[xlabel="San Francisco"];
        sea[xlabel="Seattle"];
        chi[xlabel="Chicago"];
        la[xlabel="Los Angeles"];
        sd[xlabel="San Diego"];
        ny[xlabel="New York"];
        den[xlabel="Denver"];
        dal[xlabel="Dallas"];
        det[xlabel="Detroit"];
        bos[xlabel="Boston"];
        stl[xlabel="St Louis"];
        atl[xlabel="Atlanta"];
        was[xlabel="Washington"];
        ban[xlabel="Bangor"];
        sea -- {sf} ;
        chi -- {sea, stl, den, det, bos, ny, was, atl};
        den -- {sf, la, sd, dal, stl};
        det -- {bos, ny, stl};
        bos -- {ban, was, ny, chi, det};
        la -- {dal, atl}[len=2];
        la -- {sd,sf}[len=0.5]
        atl -- {dal, stl, chi};
        atl -- was[len=0.5];
        ny -- {was, bos}[len=0.5]
        ny -- {det, chi};
        stl -- {chi, det, atl, den, dal};
        dal -- {sd, la, sf, den, stl, atl};
      }
      ```,
      width: 9cm,
    ),
  )

+ A constructor is planning a new urban development formed by 9 family houses, and now they are designing the water supply. As they know some graph theory, they define a weighted graph $G = (V, E, omega)$, where the vertices $V = {a, b, c, d, e, f, g, h, i}$ correspond to the houses, two vertices are adjacent if the houses can be connected by a water pipe, and the weight of each edge is the cost (in thousands of euros) of placing the corresponding water pipe. The graph $G$ is given by
  #figure(
    raw-render(
      ```dot
      graph {
        layout=neato
        start=11
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
      width: 5cm,
    ),
  )
  + If the constructor places the water supply on house a, compute using Dijsktra's algorithm the minimum-cost path to reach house i (where they will live). As a side result, compute the total cost of the rooted (at a) spanning tree that connects A to all the other vertices.
  + When they heard this idea, the other neighbors complained about the price. They preferred to place the pipes using a minimum-cost spanning tree. Find one of these subgraphs using Prim's algorithm, and compute the total cost of the pipes.


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

+ In a film festival there are 6 films on the first day. Films 1, 3, and 5 are dramas; films 2, 4, and 6 are comedies; films 3 and 4 are indies, and films 5 and 6 are blockbusters. Each film lasts two hours. What is the minimum number of hours needed to show all films, in such a way that films of the same type do not overlap?

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
