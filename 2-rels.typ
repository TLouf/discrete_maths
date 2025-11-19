#import "assets/base_template.typ": *

#show: base

= Relations


== Binary relations on a set

While we previously introduced relations $R$ from a set $A$ to a set $B$, here we'll be particularly interested in the case where $A = B$, that is relations on a single set.

#definition(title: [Binary relation on a set])[
  A *binary relation* $R$ on the set $A$ is a subset of $A times A$, so: $R subset.eq A times A$.
]

In the following, unless otherwise specified, "a relation $R$" refers to a relation on a single set $A$.

#definition(title: [Reflexive relations])[
  A relation $R$ is reflexive if all elements of $A$ are related to themselves:
  $
    forall a in A, a rel a
  $

  A relation $R$ is irreflexive if all elements of $A$ are not related to themselves:
  $
    forall a in A, a cancel(rel) a
  $
]


#definition(title: [Symmetric relations])[
  A relation $R$ is symmetric if $R = R^(-1)$, i.e., if
  $
    forall (a, b) in A^2, a rel b => b rel a
  $

  A relation $R$ is antisymmetric if
  $
    forall (a,b) in A^2 "such that" a!=b, a rel b => b cancel(rel) a
  $
]


#definition(title: [Transitive relations])[
  A relation $R$ is transitive if
  $
    forall (a,b,c) in A^3, (a rel b) and (b rel c) => a rel c
  $
]

#proposition[
  A relation $R$ is transitive if and only if $R^n subset.eq R$ for all $n in NN$. The $n$-th power $R^n$ of the relation $R$ is recursively defined as follows:
  $ R^1 = R, quad R^n = R circle R^(n-1) $
]
// proof that uses induction in Rosen p.608

#corollary[
  A relation $R$ is transitive if and only if $R^2 subset.eq R$. In other words, $R$ is transitive if and only if for each nonzero entry $(A_(R^2))_(i,j) = 1$ of the adjacency matrix of $R^2$, the corresponding entry of the adjacency matrix of $R$ is also nonzero $(A_R)_(i,j) = 1$.
]


== Equivalence relations

#definition(title: [Equivalence relations])[
  A relation $R$ on a set $A$ is an equivalence relation if it is reflexive, symmetric and transitive.
]

#notation[
  If $R$ is an equivalence relation, $a rel b$ is usually denoted as $a scripts(equiv)_R b$ or $a scripts(~)_R b$.\
  The $R$ subscript can be dropped when there is no ambiguity on which equivalence relation we're dealing with.
]

#definition(title: [Equivalence classes])[
  Let $R$ be an equivalence relation on a set $A$.
  The set of all the elements of $A$ related to a certain element $a in A$ is called the *equivalence class* of $a$ with respect to $R$, and it is denoted as $[a]_R$, or simply as $[a]$.
  Therefore,
  $ [a]_R = {b in A | a rel b} $
  Any element $b in [a]_R$ is called a *representative* of the equivalence class of $a$.
]
// mention why we use the word representative: because all elements in the class are equivalent

#theorem[
  Let $R$ be an equivalence relation on $A$. Then,
  1. $[a]_R$ is non-empty for all $a in A$.
  2. For any two elements $a, b in A$, either $[a]_R = [b]_R$ (and $a rel b$), or $[a]_R inter [b]_R = emptyset$.
  3. The equivalence classes determine the relation uniquely.
]

Equivalence classes are useful because they allow us to partition a set.
But first, what does that even mean?

#definition(title: [Set partition])[
  A partition of a set $A$ is a set of disjoint nonempty subsets of $A$ whose union form $A$.\
  In other words, a set of $n$ subsets ${A_i}_(i in [|1, n|])$ such that:
  $
    cases(
      forall i in [| 1, n |] \, A_i != emptyset,
      forall (i, j) in [| 1, n |]^2 \, A_i inter A_j = emptyset "if" i!= j,
      limits(union.big)_(i in [| 1, n |]) A_i = A,
    )
  $
]


#theorem[
  Let $R$ be an equivalence relation on $A$.
  Then the set of all equivalence classes of $R$ form a partition of $A$.
  Conversely, given a partition ${A_1, A_2, ...}$ of $A$, there exists an equivalence relation $R$ such that its equivalence classes are the sets $A_i$.
]

#question-box[
  If there exists $a,b in A$ such that $a equiv b$, then $[ a ]_R = [ b ]_R$, which means $[ a ]_R inter [ b ]_R != emptyset$.
  Since equivalence classes partition a set, doesn't that contradict the fact that the subsets composing a partition should be disjoint?
]
// clarify that the set of subsets contains in fact the equivalence classes after de-duplicating them, since it's a set!

#definition(title: [Quotient set])[
  Let $R$ be an equivalence relation on $A$. The set of all the equivalence classes of $R$ is called the quotient set of $A$ by $R$, and it is denoted by $A\/R$:
  $ A\/R = {[a]_R | a in A} $
]


== Order relations

#definition(title: [Partial order relation])[
  A relation on a set $A$ is called a *partial order* if it is reflexive, antisymmetric, and transitive.
]

#notation[
  Order relations are usually denoted by the symbol $prec.curly.eq$.\
  We write $a prec b$ to denote that $a prec.curly.eq b$ and $a != b$, and then say that "$a$ precedes $b$".
]

#definition(title: [Posets])[
  A set $A$ equipped with an order relation $prec.curly.eq$ is called a *partially ordered set*, or poset, and is denoted by $(A, prec.curly.eq)$.
]


#definition(title: [Comparability])[
  Let $(A, prec.curly.eq)$ be a partially ordered set. Two elements $a, b in A$ are said to be *comparable* if either $a prec.curly.eq b$ or $b prec.curly.eq a$.
  This is basically just another word for "related", but which makes more intuitive sense in the context of orderings.
  If neither of these conditions holds, such elements are said to be incomparable.
]

The adjective "partial" above refers to the fact that not all pairs of elements of the poset are necessarily comparable.
But if it is the case, the poset has some interesting properties, and so we have a special term to refer to them.

#definition(title: [Total order])[
  A partially ordered set $(A, prec.curly.eq)$ is said to be *totally ordered* when any two elements of $A$ are comparable.
]

=== Representing posets: Hasse diagrams

We saw in @sec-rels-sets that relations can be represented by a directed graph, by drawing an arrow from $a in A$ to $b in B$ if $a rel b$.
A poset can therefore also be represented as a directed graph, but with several simplifications due to its properties.
+ It is a relation on a single set ($A = B$), so elements only need to be represented once.
+ It is antisymmetric, so we can fix a convention such as "if $a prec.curly.eq b$, then $a$ will be represented below $b$", which implies that all edges point in the same direction, upwards, so the arrows can be omitted.
+ It is reflexive, so the loops corresponding to $a prec.curly.eq a$ do not need to be represented.
+ It is transitive, so the edge corresponding to $a prec.curly.eq c$ does not need to be represented if there exists $b$ such that $a prec.curly.eq b$ and $b prec.curly.eq c$.
All these simplifications lead to a representation known as a *Hasse diagram*.

// TODO: example or by hand? with 1,2,3,4 like in Rosen
// #figure(
//   grid(
//     columns: 3,
//     cetz.canvas({
//       import cetz.draw: *

//     })
//   ),
// )


=== Extremal elements

// mention simplification when set is finite
#definition(title: [Extremal elements])[
  Let $(A, prec.curly.eq)$ be a partially ordered set.
  - $M in A$ is a maximal element if it does not precede any other element:
    $
      forall a in A, M prec.curly.eq a => a = M
    $
  - $m in A$ is a minimal element if no other element precedes it:
    $
      forall a in A, a prec.curly.eq m => a = m
    $
  In other words, in the Hasse diagram associated to $(A, prec.curly.eq)$, there is no element above $M$, and no element below $m$.
]
// why "M does not precede any other element" is not equivalent to "all elements precede M" for posets in general? -> because not all elements are necessarily comparable!

#definition(title: [The maximum and minimum])[
  Let $(A, prec.curly.eq)$ be a partially ordered set.
  - $M^star in A$ is *the maximum (or greatest element)* of $A$ if all elements precede or are equal to it:
    $
      forall a in A, a prec.curly.eq M^star
    $
  - $m^star in A$ is *the minimum (or least element)* if it precedes or is equal to all elements:
    $
      forall a in A, m^star prec.curly.eq a
    $
  In other words, in the Hasse diagram associated to $(A, prec.curly.eq)$, $M^star$ is above all the elements of $A$, and $m^star$ is below all elements of $A$.
  The maximum and minimum of $(A, prec.curly.eq)$ are denoted by $max(A)$ and $min(A)$, respectively.
]

#remark[
  The maximal, minimal, greatest and least elements of $(A, prec.curly.eq)$ might not exist.
]

#theorem[
  The maximum $M^star$ of a partially ordered set $(A, prec.curly.eq)$, if it exists, is unique. In addition, the maximum of $(A, prec.curly.eq)$ is also a maximal element of it.
]

#remark[
  To be the maximum, a maximal element needs to be comparable to all other elements!
]

#definition(title: [Bounds])[
  Let $(A, prec.curly.eq)$ be a partially ordered set, and $B subset A$.
  - $u in A$ is an upper bound of $B$ if $b prec.curly.eq u$ for all $b in B$.
    - The set of the upper bounds of $B$ is denoted by $"major"(B)$.
    - The supremum of $B$, $sup(B)$, is the least upper element of $B$:
      $
        sup(B) = min("major"(B))
      $
  - $l in A$ is a lower bound of $B$ if $l prec.curly.eq b$ for all $b in B$.
    - The set of all the lower bounds of $B$ is denoted by $"minor"(B)$.
    - The infimum of $B$, $inf(B)$, is the greatest lower element of $B$:
      $
        inf(B) = max("minor"(B))
      $
]

// TODO: examples! especially tricky ones where no bound in the subset, or maximal elements but no maximum, etc

*Remark:* It may happen that $"major"(B) = emptyset$, $"minor"(B) = emptyset$ and/or $sup(B)$ and $inf(B)$ do not exist.


=== Well-ordered sets

#definition[
  $(A, prec.curly.eq)$ is a well-ordered set if $(A, prec.curly.eq)$ is a total order and all nonempty subsets of $A$ have a minimum.
]

*Remarks:*
- The set of natural numbers with the usual order $(NN, <=)$ is a well-ordered set. This property is equivalent to the induction principle.
- The totally-ordered set $(ZZ, <=)$ is not a well-ordered set; but as $ZZ$ is isomorphic to $NN$, we can choose another order $prec.curly.eq$ such that $(ZZ, prec.curly.eq)$ is a well-ordered set.


=== The induction principle

#definition(title: "Induction principle: weak version")[
  Let $P$ be some predicate that satisfies the following conditions:
  1. Base step: $P(1)$ is true.
  2. Inductive step: If $P(k)$ is true for an arbitrary and fixed $k$, then $P(k + 1)$ is true.

  Then, $P(n)$ is true for every $n in NN$.
]

*Remark:* The hypothesis in the inductive step ($P(k)$ is true) is called the induction hypothesis. To perform the inductive step, one assumes the induction hypothesis, and then uses this assumption to prove that $P(k + 1)$ is true.

#definition(title: "Induction principle: strong version")[
  Let $P$ be some predicate that satisfies the following conditions:
  1. Base step: $P(1)$ is true.
  2. Inductive step: Given an arbitrary fixed $k$, if $P(m)$ is true for any $1 <= m <= k$, then $P(k + 1)$ is true.

  Then, $P(n)$ is true for every $n in NN$.
]

#proposition(title: "Strong induction principle for well-ordered Sets")[
  Let $(A, prec.curly.eq)$ be a well-ordered set, and $P$ be some predicate that satisfies the following conditions:
  1. Base step: $P(v_0)$ is true for $v_0 = min(A)$.
  2. Inductive step: Let $b$ be an arbitrary fixed element of $A$, and let $a$ be its successor. If $P(x)$ is true for all $v_0 prec.curly.eq x prec.curly.eq b$, then $P(a)$ is true.

  Then, $P(a)$ is true for every $a in A$.
]


== Summary: types of relations

#table(
  columns: 6,
  align: center,
  toprule(),
  table.header(
    [*Relation*], [*Reflexive*], [*Symmetric*], [*Antisymmetric*], [*Transitive*], [*Additional Properties*]
  ),
  midrule(), [Equivalence], [✅], [✅], [❌], [✅],
  [], [Order], [✅], [❌], [✅], [✅],
  [], [Total order], [✅], [❌], [✅], [✅],
  [Every pair is comparable], [Well-ordered set], [✅], [❌], [✅], [✅],
  [Every nonempty subset has a minimum], bottomrule(),
)

You will see different kinds of relations again in a more or less close future.
- In relational databases, each table defines a relation between $n$ sets of attributes, where the values for each set are stored in a column (see Rosen 9.2 for further reading).
- A particular case of equivalence relation and its associated classes will be studied in @sec-mod-arithmetic.
- Order relations constitute the formalism on which all sorting algorithms are built, whether they concern numbers or strings of text.
