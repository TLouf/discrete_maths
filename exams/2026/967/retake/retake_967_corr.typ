#import "../../../../assets/exam_template.typ": *

#show: doc => exam(
  [Discrete Mathematics],
  [Bachelor in Data Science and Engineering],
  datetime(year: 2026, month: 6, day: 23),
  is_final: true,
  checksum: false,
  doc,
)


=

+
  - Reflexivity: $E_G subset.eq E_G$, so $G prec.curly.eq H$.
  - Antisymmetry: let us consider $G$ and $H$ such that $G prec.curly.eq H$ and $H prec.curly.eq G$.
    Then $E_G subset.eq E_H$ and $E_H subset.eq E_G$, which implies that $E_G = E_H$.
    Since they also share the same vertex set $V$, by definition of $cal(G)_V$ then $G = H$, hence the antisymmetry.
  - Transitivity: let us consider $F, G, H$ such that $F prec.curly.eq G$ and $G prec.curly.eq H$.
    Then by transitivity of the subset relation, we have that $E_F subset.eq E_H$, so $F prec.curly.eq H$.

+ Minimal elements have no predecessors: here it would be the graph $(V, emptyset)$, which is the minimum, since $emptyset$ is a subset of all sets.
  Maximal elements do not precede any other element: so it would be the complete graph, which is also the maximum.

+
  #let c0 = cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 0.05, fill: black, name: "b")
    circle((0.2, 0.3), radius: 0.05, fill: black, name: "c")
    circle((0.4, 0), radius: 0.05, fill: black, name: "a")
  })
  #let c11 = cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 0.05, fill: black, name: "b")
    circle((0.2, 0.3), radius: 0.05, fill: black, name: "c")
    circle((0.4, 0), radius: 0.05, fill: black, name: "a")
    line("a", "b")
  })
  #let c12 = cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 0.05, fill: black, name: "b")
    circle((0.2, 0.3), radius: 0.05, fill: black, name: "c")
    circle((0.4, 0), radius: 0.05, fill: black, name: "a")
    line("c", "b")
  })
  #let c13 = cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 0.05, fill: black, name: "b")
    circle((0.2, 0.3), radius: 0.05, fill: black, name: "c")
    circle((0.4, 0), radius: 0.05, fill: black, name: "a")
    line("a", "c")
  })
  #let c21 = cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 0.05, fill: black, name: "b")
    circle((0.2, 0.3), radius: 0.05, fill: black, name: "c")
    circle((0.4, 0), radius: 0.05, fill: black, name: "a")
    line("a", "b")
    line("a", "c")
  })
  #let c22 = cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 0.05, fill: black, name: "b")
    circle((0.2, 0.3), radius: 0.05, fill: black, name: "c")
    circle((0.4, 0), radius: 0.05, fill: black, name: "a")
    line("a", "b")
    line("b", "c")
  })
  #let c23 = cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 0.05, fill: black, name: "b")
    circle((0.2, 0.3), radius: 0.05, fill: black, name: "c")
    circle((0.4, 0), radius: 0.05, fill: black, name: "a")
    line("c", "b")
    line("a", "c")
  })
  #let c3 = cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 0.05, fill: black, name: "b")
    circle((0.2, 0.3), radius: 0.05, fill: black, name: "c")
    circle((0.4, 0), radius: 0.05, fill: black, name: "a")
    line("a", "b")
    line("a", "c")
    line("b", "c")
  })
  We define $G_1, dots, G_8$ as the graphs $#c0, #c11, #c12, #c13, #c21, #c22, #c23, #c3$, and the Hasse diagram is then:
  ```
       G_8
    /   |   \
  G_5  G_7  G_6
   | /\ |  \ |
  G_2  G_4  G_3
    \   |   /
       G_1
  ```

=

+ The tuples $("destination", "distance")$ you should get by running the algorithm are
  $ (v_2 ,3), (v_3, 2), (v_4, 8), (v_5, 4), (v_6, 8) $

+ You obtain a spanning tree of $G$.

+ Breaking ties differently will not change the distances, since it will find a shortest path anyway. However it might find shortest paths which traverse different edges, so the path can be different, although of same length. The graph $H$ can then differ.

=

+ By enumeration, we get $b_1 = 2$, $b_2 = 5$ and $b_3 = 12$

+ To form a bracelet of length $n$, we have two mutually exclusive possibilities:
  - The last bead is the long one: then it can be formed by adding a long bead to a bracelet of length $n-2$: $b_(n-2)$ possibilities.
  - The last bead is a short one (red or purple): then it can be formed by adding either a red or purple bead (two possibilities) to a bracelet of length $n-1$, which makes $2 b_(n-1)$ possibilities, by the product rule.

  By the sum rule, we thus have the required recurrence.

+ We first find the homogeneous solution thanks to the characteristic roots $x$ such that
  $
    x^2 - 2 x - 1 = 0
  $
  which gives the roots $x_(1,2) = 1 plus.minus sqrt(2)$.
  Thus $b_n^((h)) = alpha_1 (1 + sqrt(2))^n + alpha_2 (1 - sqrt(2))^n$.
  The recurrence is homogeneous, so we can directly apply the initial conditions:
  $
    cases(
      alpha_1 (1 + sqrt(2)) + alpha_2 (1 - sqrt(2)) = 2,
      alpha_1 (3 + 2 sqrt(2)) + alpha_2 (3 - 2 sqrt(2)) = 5,
    ) => cases(
      alpha_1 = (2 + sqrt(2)) / 4,
      alpha_2 = (4 - 3 sqrt(2)) / (4 - 4 sqrt(2)),
    )
  $
  Which leads to
  $
    b_n = ((2 + sqrt(2)) (1 + sqrt(2))^(n) + (4 - 3 sqrt(2)) (1 - sqrt(2))^(n-1)) / 4
  $


=

+ / Base step: $6 divides 6$, hence the result for $n=1$.
  / Inductive step: let's assume the result holds true for a fixed $n >= 1$.
    Then there exists $q in ZZ$ such that
    $
      7^n - 1 = 6 dot q => 7^(n+1) - 7 = 7 dot 6 dot q => 7^(n+1) - 1 = 7 dot 6 dot q + 6 = 6 dot (7 dot q + 1) => 6 divides 7^(n+1) - 1
    $
    The result thus holds for $n+1$.
  By induction, it holds for $n >= 1$.

+ We look for $x equiv 7^100 (mod 6)$ in two ways.

  - Using (a), we have that $7^n - 1 equiv 0 (mod 6) <=> 7^n equiv 1 (mod 6)$, which is valid for $n=100$.

  - By the Chinese remainder theorem, the following system admits a unique solution, also solution to $7^100 equiv x (mod 6)$:
    $
      cases(
        7^100 equiv x (mod 2),
        7^100 equiv x (mod 3),
      )
    $
    Since $7$ is odd, $7^100 equiv 1 (mod 2)$, and (but this is not even needed here) by Fermat's little theorem, $7^100 equiv (7^50)^2 (mod 3) equiv 1 (mod 3)$.
    The solution is thus indeed $x equiv 1 (mod 6)$.
