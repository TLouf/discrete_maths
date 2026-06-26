#import "../../../../assets/exam_template.typ": *

#show: doc => exam(
  [Discrete Mathematics],
  [Bachelor in Data Science and Engineering],
  datetime(year: 2026, month: 5, day: 15),
  is_final: true,
  checksum: false,
  doc,
)


=

+ We have
  $
    x_1 equiv a x_0 (mod p) equiv 3 dot 2 (mod 7) equiv 6 (mod 7) \
    x_2 equiv 18 (mod 7) equiv 4 (mod 7) \
    x_3 equiv 5 (mod 7) \
    x_4 equiv 1 (mod 7) \
    x_5 equiv 3 (mod 7) \
    x_6 equiv 2 (mod 7)
  $

+ $y_n = a^n x_0$, which can be proven by a trivial induction. Then:
  - Base step: we have
    $
      a y_0 equiv a x_0 (mod p) equiv x_1 (mod p)
    $
    so the congruence holds for $n = 0$.
  - Inductive step: let's assume that for a given $n in NN$, we have
    $
      x_(n+1) equiv (a y_n) (mod p)
    $
    From the recurrence relation that defines $(x_n)$, we know that
    $
      x_(n+2) equiv (a x_(n+1)) (mod p)
    $
    Using the inductive hypothesis, we can then write
    $
      x_(n+2) equiv (a dot a dot y_n) (mod p) equiv (a dot (a dot y_n)) (mod p) equiv (a dot y_(n+1)) (mod p)
    $
    The congruence thus holds for $n+1$.
  By induction, the congruence thus holds for any $n in NN$.

+ The period length is defined as a $k in NN^*$ such that
  $
    forall n in NN, x_n equiv x_(n+k) (mod p)
  $
  From the previous question, we know that $x_(n+1) equiv (a^(n+1) x_0) (mod p)$.
  We thus get that the definition of the period length given above is equivalent to
  $
    a^(n+1) x_0 equiv a^(n+1+k) x_0 (mod p)
    <=> x_0 equiv a^k x_0 (mod p)
  $
  Where in the second step we could simplify by $a^(n+1)$ on both sides, since $p$ is prime and $p divides.not a$.
  There are then two cases:
  - (optional) $p = 2 = x_0$, in which case we have $x_(n+1) equiv 2 a^(n) (mod 2) equiv 0 (mod 2)$, so the terms of the sequence stay even for every $n$, hence a period length of $1 = p-1$.
  - $p != 2$, so $gcd(p, x_0) = 1$, so we can simplify by $x_0$ and get that the period length definition is equivalent to
    $
      a^k equiv 1 (mod p)
    $
    Also, since $p divides.not a$, according to Fermat's little theorem, we know that $a^(p-1) equiv 1 (mod p)$.
  The period length is thus directly $p-1$ (the smallest one could also be one of its divisors, but saying this was not necessary).



=

+
  - Reflexivity: the path of length $0$ defined by the sequence with single term $u$ forms a path from $u$ to $u$ (such a path is actually at the edge of the definition we gave in the course, so some leniency will be shown in the correction on this point).
  - Antisymmetry: let's take $u,v in V$ such that $u prec.curly.eq v$, and assume that $v prec.curly.eq u$.
    This means there is a path $P_1$ from $u$ to $v$, and another $P_2$ from $v$ to $u$.
    If we concatenate these two paths, we can thus get a path from $u$ to $u$, or also, from $v$ to $v$.
    If $u != v$, this concatenation would thus form a cycle, which contradicts the fact that $G$ has no cycles.
    Therefore, by contradiction, we can only have $v prec.curly.eq u$ if $u = v$, which proves the antisymmetry.
  - Transitivity: let's take $u,v,w in V$ such that $u prec.curly.eq v$ and $v prec.curly.eq w$.
    This means there is a path $P_1$ from $u$ to $v$, and another $P_2$ from $v$ to $w$.
    If we concatenate these two paths, we thus get a path $P_3$ from $u$ to $w$, which means that $u prec.curly.eq w$ and proves the transitivity.

+ The Hasse diagram is:
  #align(center)[
    ```
              7
             / \
            5   6
             \ /
              3    4
              │ \ /
              1  2
    ```
  ]
  The set of minimal elements is ${1, 2}$ and the one of maximal elements is ${4, 7}$.
  There is no minimum and no maximum.

+ If we drop the condition that $G$ does not contain cycles, then it is an equivalence.
  Reflexivity and transitivity directly follow from those of $prec.curly.eq$.
  The only real difference is on the symmetry. Let's take $u,v in V$ such that $u rel v$.
  This means there is a path from $u$ to $v$, and one from $v$ to $u$, which is allowed here since $G$ can contain cycles.
  Then we also have $v rel u$, as it just swaps the two predicates: there is a path from $v$ to $u$, and one from $u$ to $v$.

+ Each equivalence class contains the set of vertices of a strongly connected component of $G$ (the largest such components).


=

+ Let's assume $A_G$ is written based on the following sequence of vertices: $1, 2, dots, 6$. There are two possibilities:
  - We follow these steps:
    - $e^* = {2, 4}$, which we remove from $T$.
    - $e^* = {3, 6}$, which we do not remove from $T$, as it would break the graph into two connected components.
    - $e^* = {4, 6}$, which we do not remove from $T$, for the same reason.
    - $e^* = {1, 2}$, which we remove from $T$.
    - $e^* = {3, 5}$, which we remove from $T$.
    - there is no edge left to remove which wouldn't break $T$ into more components, so we can stop here.
  - Or, we first remove ${3, 6}$ and therefore keep ${2,4}$.

+ Prim would only act on one connected component of the graph, on which it would generate a minimum spanning tree.
  It would thus need to be repeated on each connected component to obtain a minimum spanning forest.
  `algo1`, on the other hand, directly gives a minimum spanning forest, since it maintains the number of components, and can remove maximum-weight edges from any of them.

=

+ The process here is that we want to form a $5$-subset of the set of movies $M$ of cardinality $abs(M) = 15$.
  Given the condition on the Kill Bill movies, we have to separate between two mutually exclusive cases though:
  - We don't take any of these two movies, which is the same as forming $5$-subsets from $M$ with these two taken out. There are thus $binom(13, 5)$ ways to do that.
  - We take both of them, so there only remains to form $3$ subsets from the remaining set of $13$ movies, for which there are $binom(13, 3)$ possibilities.
  By the sum rule, there are thus $binom(13, 5) + binom(13, 3)$ possible subsets of movies we can take.

+
  - For the selection of movies (before ordering!), there are only two mutually exclusive possibilities:
    - $3$ movies are from a single genre, and only $1$ movie from each of the other genre is selected.
      To select which genre is which in this $(3,1,1)$ pattern, we have $3$ possibilities (where to place the $3$).
      There are then $binom(5, 3) dot binom(5, 1) dot binom(5, 1)$ ways to select the $5$ movies appearing in the ranking.
      In total, this gives
      $
        S_1 = 3 dot binom(5, 3) dot binom(5, 1) dot binom(5, 1)
      $
    - $1$ movie is from a single genre, and the remaining $4$ are equally shared between the other two genres.
      To select which genre is which in this $(1,2,2)$ pattern, we have $3$ possibilities (where to place the $1$).
      There are then $binom(5, 2) dot binom(5, 2) dot binom(5, 1)$ ways to select the $5$ movies appearing in the ranking.
      In total, this gives
      $
        S_2 = 3 dot binom(5, 2) dot binom(5, 2) dot binom(5, 1)
      $
    In each case, once the movies are selected, we can order them in $5!$ ways.
    By the sum and product rule, this gives
    $
      T_1 = 5! dot (S_1 + S_2)
    $

  - If we allow at most one tie, the only step we change is the final one, of ordering the movies.
    Having a tie is the same as having a block of two movies which move together when reordering the sequence.
    So the process to form a ranking with a tie from a selection of $5$ movies consists in first selecting which $2$ movies are tied ($binom(5, 2)$ possibilities), and then ordering $4$ blocks ($4!$ possibilities).
    By the product rule, there are thus
    $
      T_2 = 4! dot binom(5, 2) dot (S_1 + S_2)
    $
    possible rankings with ties.
    Then (optional), since the ranking can have _at most_ one tie, it means it either has one, or none.
    The final result is therefore $T_1 + T_2$.
