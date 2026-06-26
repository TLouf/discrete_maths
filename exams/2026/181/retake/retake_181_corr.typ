#import "../../../../assets/exam_template.typ": *

#show: doc => exam(
  [Discrete Mathematics],
  [Bachelor in Artificial Intelligence],
  datetime(year: 2026, month: 6, day: 22),
  is_final: true,
  checksum: false,
  doc,
)


=

+ Vertices are added in the following order: $v_2, v_3, v_4, v_5, v_6$, and the resulting tree is:
  ```
       1
     /   \
    2     3
   / \    |
  4   5   6
  ```
  $v_2$ and $v_3$ are at a distance of $1$ from $v_1$, while the rest is at a distance of $2$.

+ This would simply create a shortcut to $v_6$, so it would only reduce its distance by $1$, without affecting the rest:
  ```
        1
     /  |  \
    2   3   6
   / \
  4   5
  ```

+ The computed distances cannot change, the ordering we consider to resolve ties should not make any vertex closer or further away from the origin. However, it can change the tree, but not necessarily, as we can have graphs in which there is no choice to make, at any step (simplest example: a path graph). Here though, since both $2$ and $3$ are connected to $4$, for instance, if we consider the reverse ordering then $3$ and $4$ will be connected by an edge, and not $2$ and $4$.


=

+ $h$ is a well-defined function by the division algorithm: every integer $n$ has a unique remainder in $ZZ_8 = {0, 1, dots, 7}$ when divided by $8$.
  It is not injective, indeed $h(0) = h(8) = 0$, for instance.
  It is surjective, since, for instance, $forall i in ZZ_8, h(i) = i$.

+ It is an equivalence relation directly since $h$ is a function (exercise 2.4).

+ There are $8$ equivalence classes, one for each possible remainder, so $[i]_~$ for every $i in ZZ_8$.
  The quotient set is a partition of the integers by the remainder they have when divided by $8$.


=

+ $a_1 = 0$, $a_2 = 1$ (`11`) and $a_3 = 3$ (`110`, `011` and `111`).

+ Two possibilities here: the first (recommended as seen in exercises) relies on the complement, the second (also admitted) is direct.
  / First alternative: first, the number of binary strings of length $n$ is $2^n$.
    We will count $b_n$, the number of such strings that contain no occurrence of two consecutive $1$'s, because $a_n + b_n = 2^n$.
    We can consider two mutually exclusive cases for such a string:
    - Its ends with a $0$, so $n-1$ bits before just need to not contain two consecutive $1$'s: $b_(n-1)$ options.
    - Its ends with a $1$, so the bit before must be a $0$, and $n-2$ bits before that just need to not contain two consecutive $1$'s: $b_(n-2)$ options.
    Thus $b_n$ satisfies the relation
    $
      b_n = b_(n-1) + b_(n-2)
    $
    which gives for $a_n$:
    $
      & 2^n - a_n = 2^(n-1) - a_(n-1) + 2^(n-2) - a_(n-2) \
      & <=> a_n = a_(n-1) + a_(n-2) + 2^n - 2^(n-1) - 2^(n-2) \
      & <=> a_n = a_(n-1) + a_(n-2) + 2^(n-2) (4 - 2 - 1) \
      & <=> a_n = a_(n-1) + a_(n-2) + 2^(n-2)
    $
  / Second alternative: for a string of length $n$ that contain at least one occurrence of `11`, we have three mutually exclusive options:
    - Its ends with `0`, so the $n-1$ bits before only need to contain `11`: $a_(n-1)$ options.
    - Its ends with `01`, so the $n-2$ bits before only need to contain `11`: $a_(n-2)$ options.
    - It ends with `11`, so the $n-2$ bits before can be chosen freely: $2^(n-2)$ options.
    Hence the result by the sum rule.

+ We first find the homogeneous solution thanks to the characteristic roots $x$ such that
  $
    x^2 - x - 1 = 0
  $
  which gives the roots $x_(1,2) = (1 plus.minus sqrt(5)) / 2$.
  Thus
  $
    a_n^((h)) = alpha_1 ((1 plus sqrt(5)) / 2)^n + alpha_2 ((1 minus sqrt(5)) / 2)^n.
  $

  The recurrence is nonhomogeneous, so let us find a particular solution of the form
  $
    a_n^((p)) = A 2^n
  $
  Inserting it into the recurrence relation, we get
  $
    A 2^n = A 2^(n-1) + A 2^(n-1) + 2^(n-2) => A = 1
  $

  We finally put the solution together and apply the initial conditions:
  $
    cases(
      a_1 = 0,
      a_2 = 1,
    ) => cases(
      alpha_1 (1 + sqrt(5)) + alpha_2 (1 - sqrt(5)) + 4 = 0,
      alpha_1 (1 + sqrt(5))^2 + alpha_2 (1 - sqrt(5))^2 + 16 = 2,
    ) => cases(
      alpha_1 = - (3 sqrt(5) + 5) / (10),
      alpha_2 = - (-3 sqrt(5) + 5) / (10),
    )
  $
  Which leads to
  $
    a_n = - (3 sqrt(5) + 5) / (10) ((-1 plus sqrt(5)) / 2)^n - (-3 sqrt(5) + 5) / (10) ((-1 minus sqrt(5)) / 2)^n + 2^n
  $



=

+ $G$ is a tree (unweighted). This edge is a bridge: if it is removed, the tree will become a forest with two connected components.

+ Here again, two alternatives:
  / First alternative:
    Let consider a pair $(u,v) in V^2$. We have two options to consider:
    - $(u,v) in V_i^2$ with $i in {1,2}$: both vertices are in $T_i$, so since $T_i$ is a tree there is only one path connecting them within $T_i$. Also, there cannot be any path connecting them that at some point go to the other, $T_j$, since there is only one edge connecting both trees, which a path cannot traverse twice, by definition.
    - $(u,v) in V_i times V_j$ with $i != j$. Before adding the new edge, these two vertices were not connected by any path. However, each was connected by a unique path to $v_i$ and $v_j$, respectively. Therefore, with the new edge between $v_i$ and $v_j$, we can now concatenate one of these two preexisting paths with this new edge, and the other path, which connects $u$ and $v$ uniquely.
  / Second alternative: (a bit more convoluted but accepted)
    In each tree $T_i$, if there are $n_i$ vertices, there are $n_i-1$ edges.
    When adding an edge, the new graph thus has $n_1 + n_2 - 2 + 1 = n - 1$ edges, where $n = n_1+n_2$ is simply $abs(V)$.
    To prove $F$ then becomes a tree, there only remains to see that adding the edge makes the graph connected.
    Indeed, since the only pairs of vertices which were not connected by a path were pairs $(u, v) in V_1 times V_2$ (or inversely), the addition of an edge between the two trees will also connect these pairs, by paths you can obtain by concatenating an existing path from $u$ to $v_1$, the new edge ${v_1, v_2}$, and an existing path from $v_2$ to $v$.
    $F$ then becomes a tree, and so, as a tree, all its pairs of vertices are connected by a unique path.

+ / Base case: for $k=1$, $k-1 = 0$ so we have no edge to remove, and $T$ is already a tree.
  / Inductive step: for a fixed $k>=1$, let's assume that  we can convert a forest composed of $k$ trees into a single tree, by adding $k-1$ edges following the given process.
    Let us now consider a forest $F$ which has $k+1$ trees $T_1 = (V_1, E_1), dots, T_(k+1) = (V_(k+1), E_(k+1))$.
    Let us pick $T_1$ and $T_2$, and add an edge $e={v_1, v_2}$ with $v_1 in V_1$ and $v_2 in V_2$.
    Then by question (b), we know that after adding this edge, there is a unique path connecting every pair of vertices from $V_1 union V_2$, which means that the graph $(V_1 union V_2, E_1 union E_2 union {e})$ is a tree.
    So our forest now contains $k$ trees.
    We can thus use the inductive hypothesis to conclude that the predicate we want to prove is also true for $k+1$.
  By induction, it is thus true for every $k>=1$.
