#import "../assets/theory_template.typ": *
#show: theory


= Relations

#fa-book() This chapter overlaps with sections 9.1, 9.5, 9.6, 5.1 and 5.2 of Rosen.

#slidebreak()

== Binary relations on a set

While we previously introduced relations $R$ from a set $A$ to a set $B$, here we'll be particularly interested in the case where $A = B$, that is relations on a single set.

#definition(title: [Binary relation on a set])[
  A *binary relation* $R$ on the set $A$ is a subset of $A times A$, so:
  $
    R subset.eq A times A.
  $
]

In the following, unless otherwise specified, "a relation $R$" refers to a relation on a single set $A$.

#slidebreak()

Let's now see some properties which will allow us to define two particular kinds of relations which are useful to compare elements of a set.

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
    forall (a,b) in A^2 "such that" a != b, a rel b => b cancel(rel) a
  $
  which is equivalent to
  $
    forall (a,b) in A^2, (a rel b) and (b rel a) => a = b
  $
]

#remark[
  The absence of symmetry is called _asymmetry_, which is not antisymmetry!
]


#definition(title: [Transitive relations])[
  A relation $R$ is transitive if
  $
    forall (a,b,c) in A^3, (a rel b) and (b rel c) => a rel c
  $
]

#slidebreak()

This looks a lot like what we saw in compositions: in fact if $(a,b) in R$ and $(b,c) in R$, then by @def-rel-compo, $(a,c) in rel circle.small rel$, hence:

#lemma(slide-break: false)[
  A relation $R$ is transitive if and only if $(rel circle.small rel) subset.eq rel$.
]

#slidebreak()

This lemma can then be used to prove the following by induction.

#theorem(slide-break: false)[
  A relation $R$ is transitive if and only if $R^n subset.eq R$ for all $n in NN$. The $n$-th power $R^n$ of the relation $R$ is recursively defined as follows:
  $ R^1 = R, quad R^n = rel circle.small rel^(n-1) $
]
// proof that uses induction in Rosen p.608

#slidebreak()


== Equivalence relations
<sec-equiv-rels>

#definition(title: [Equivalence relations])[
  A relation $R$ on a set $A$ is an equivalence relation if it is reflexive, symmetric and transitive.
]

#notation[
  If $R$ is an equivalence relation, $a rel b$ is usually denoted as $a scripts(equiv)_R b$ or $a scripts(~)_R b$.\
  The $R$ subscript can be dropped when there is no ambiguity on which equivalence relation we're dealing with.
]

#question-box[
  What is the simplest equivalence relation that you know?
]

#slidebreak()

#example[
  Is the following relation on the set $P$ of all people an equivalence relation?
  $
    R_P = {(a,b) in P^2 | a "is the brother of" b}
  $
  If not, what's the closest relation you can think of that's actually an equivalence?
  // no because if $b$ is female, then no symmetry: need to replace brother with sibling
]

#definition(title: [Equivalence classes])[
  Let $R$ be an equivalence relation on a set $A$.
  The set of all the elements of $A$ related to a certain element $a in A$ is called the *equivalence class* of $a$ with respect to $R$, and it is denoted as $[a]_R$, or simply as $[a]$.
  Therefore,
  $ [a]_R = {b in A | a rel b} $
  Any element $b in [a]_R$ is called a *representative* of the equivalence class of $a$.
]
// mention why we use the word representative: because all elements in the class are equivalent. and some representatives are better than others!

#theorem[
  Let $R$ be an equivalence relation on $A$. Then,
  1. $[a]_R$ is non-empty for all $a in A$.
  2. For any two elements $a, b in A$, either $[a]_R = [b]_R$ (and $a rel b$), or $[a]_R inter [b]_R = emptyset$.
  // simply saying: either they are related, or not
  3. The equivalence classes determine the relation uniquely.
]

#slidebreak()

Equivalence classes are useful because they allow us to partition a set.
But first, what does that even mean?

#definition(title: [Set partition])[
  A partition of a set $A$ is a set of disjoint nonempty subsets of $A$ whose union form $A$.\
  In other words, a set of subsets ${A_i}_(i in I)$ such that:

  #math.equation(block: false)[
    $
        "(i)" & forall i in I \, A_i != emptyset, \
       "(ii)" & forall (i, j) in I^2 \, A_i inter A_j = emptyset "if" i!= j, \
      "(iii)" & limits(union.big)_(i in I) A_i = A,
    $
  ]

  and where $I$ is a (potentially infinite!) set of indices.
] <def-partition>


#theorem[
  Let $R$ be an equivalence relation on $A$.\
  Then the set of all equivalence classes of $R$ form a partition of $A$.\
  Conversely, given a partition ${A_i}$ of $A$, there exists an equivalence relation $R$ such that its equivalence classes are the sets $A_i$.
] <thm-equiv-classes-partition>

#slidebreak()

#question-box[
  If there exists $a,b in A$ such that $a equiv b$, then $[ a ]_R = [ b ]_R$, which means $[ a ]_R inter [ b ]_R != emptyset$.
  Since equivalence classes partition a set, doesn't that contradict the fact that the subsets composing a partition should be disjoint?
]
// clarify that the set of subsets contains in fact the equivalence classes after de-duplicating them, since it's a set!

#slidebreak()

#example[
  From the equivalence relation you defined in the example above, translate in plain words what its associated equivalence classes represent.
  Then also explain in plain words why they do form a partition of the set of all people, that is how they fulfill each condition of @def-partition.
]

#definition(title: [Quotient set])[
  Let $R$ be an equivalence relation on $A$. The set of all the equivalence classes of $R$ is called the *quotient set* of $A$ by $R$, and it is denoted by $A\/R$:
  $ A\/R = {[a]_R | a in A} $
] <def-quotient-set>

Following @thm-equiv-classes-partition, the quotient set $A \/ R$ can also be called the *partition* of $A$ by $R$.

== Order relations

=== Partial and total orders

#definition(title: [Partial order relation], slide-break: false)[
  A relation on a set $A$ is called a *partial order* if it is reflexive, antisymmetric, and transitive.
]

#notation[
  Order relations are usually denoted by the symbol $prec.curly.eq$.\
  We write $a prec b$ to denote that $a prec.curly.eq b$ and $a != b$, and then say that "$a$ precedes $b$".
]

#definition(title: [Posets])[
  A set $A$ equipped with an order relation $prec.curly.eq$ is called a *partially ordered set*, or poset, and is denoted by $(A, prec.curly.eq)$.
]

#example[
  Are the following posets?
  + $(ZZ, >=)$
  + $(NN^*, divides)$, where $divides$ is the "divides" relation:
    $ a divides b <=> exists q in NN "such that" b = q dot a. $
  // a divides itself: q=1, a divides b and b divides c implies a divides c, and a divides b implies b does not divide a, except if a=b, because a <= b, so antisym
  // + $(P, {(a,b) in P | a "is older than" b})$, where $P$ is the set of all people.
  // yes!
]

#slidebreak()

Since a partial order is a relation, by definition it does not impose any constraint between unrelated elements.
It is therefore useful to distinguish between elements which can be compared using an ordering, and those which cannot.

#definition(title: [Comparability])[
  Let $(A, prec.curly.eq)$ be a partially ordered set.
  Two elements $a, b in A$ are said to be *comparable* if either $a prec.curly.eq b$ or $b prec.curly.eq a$.
  If neither of these conditions holds, such elements are said to be incomparable.
]

#slidebreak()

The adjective "partial" in "partial ordering" thus refers to the fact that the ordering does not necessarily order all elements of its associated set.
But if it is the case, the poset has some interesting properties, and so we have a special term to refer to them.

#definition(title: [Total order], slide-break: false)[
  A partially ordered set $(A, prec.curly.eq)$ is said to be *totally ordered* when any two elements of $A$ are comparable.
]

=== Representing posets: Hasse diagrams

We saw in @sec-rels-sets that relations can be represented by a directed graph, by drawing an arrow from $a in A$ to $b in B$ if $a rel b$.
A poset can therefore also be represented as a directed graph, but with several simplifications due to its properties.

#slidebreak()

+ It is a relation on a single set ($A = B$), so elements only need to be represented once.
#pause
+ It is antisymmetric, so we can fix a convention such as "if $a prec b$, then $a$ will be represented below $b$". This implies that all arrows point in the same direction, upwards, so they can be omitted.
#pause
+ It is reflexive, so the loops corresponding to $a prec.curly.eq a$ do not need to be represented.
#pause
+ It is transitive, so the edge corresponding to $a prec c$ does not need to be represented if there exists $b$ such that $a prec b$ and $b prec c$.

#pause

All these lead to a representation known as a *Hasse diagram*.

#slidebreak()

#example[
  Draw the Hasse diagram of $({1,2,3,4}, <=)$.
]


=== Extremal elements

// mention simplification when set is finite
#definition(title: [Extremal elements], slide-break: false)[
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
  - $M^* in A$ is *the maximum (or greatest element)* of $A$ if all elements precede or are equal to it:
    $
      forall a in A, a prec.curly.eq M^*
    $
  - $m^* in A$ is *the minimum (or least element)* if it precedes or is equal to all elements:
    $
      forall a in A, m^* prec.curly.eq a
    $
  In other words, in the Hasse diagram associated to $(A, prec.curly.eq)$, $M^*$ is above all the others, and $m^*$ is below them.
]

#notation[
  The maximum and minimum of $(A, prec.curly.eq)$ are denoted by $max(A)$ and $min(A)$, respectively.
]

#slidebreak()

#remark[
  The greatest (maximum) and least (minimum) elements might not exist for a given $(A, prec.curly.eq)$.
]

#example[
  What extremal elements do the following posets have? Do they have a maximum and minimum?
  + $({2, 5, 3, 7}, divides)$, // nothing because all unrelated
  + $({2, 3, 4, 9}, divides)$, // only extremal elements
  + $({2, 4, 6, 8}, divides)$, // no maximum because 6 divides.not 8
  ("$divides$" is the "divides" relation from the example above).
]

#theorem[
  The maximum $M^*$ of a partially ordered set $(A, prec.curly.eq)$, if it exists, is unique. In addition, the maximum of $(A, prec.curly.eq)$ is also a maximal element of it.
]

#remark[
  To be the maximum, a maximal element needs to be comparable to all other elements!
]

// bounds not strictly necessary to introduce
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

#remark[
  It may happen that $"major"(B) = emptyset$, $"minor"(B) = emptyset$ and/or $sup(B)$ and $inf(B)$ do not exist.
]


=== Well-ordering and induction

#definition(title: [Well-ordered sets], slide-break: false)[
  $(A, prec.curly.eq)$ is a well-ordered set if it is totally ordered and all nonempty subsets of $A$ have a minimum.
]

#slidebreak()

#proposition[
  - The set of natural numbers with the usual order $(NN, <=)$ is a well-ordered set.
  - The totally-ordered set $(ZZ, <=)$ is not a well-ordered set; but as $ZZ$ is isomorphic to $NN$, we can choose another order $prec.curly.eq$ such that $(ZZ, prec.curly.eq)$ is a well-ordered set.
  // why not: because any subset that goes to -infinity does not have a minimum. well-ordered with $prec.curly$ such that $0 prec.curly 1 prec.curly -1 prec.curly 2 prec.curly -2 prec.curly dots$
]

#slidebreak()

The well-ordering of natural numbers then explains the validity of proofs by induction!

#theorem(title: "Induction principle: weak version", slide-break: false)[
  Let $P$ be some predicate on the positive integers.
  If the following conditions are fulfilled:
  / Basis step: We can show that $P(n_0)$ is true for a fixed $n_0 in NN$.
  / Inductive step: If we assume that $P(k)$ is true for some unspecified $k >= n_0$, then we can show that $P(k + 1)$ is true.

  Then $P(n)$ is true for every $n >= n_0$.
]

#theorem(title: "Induction principle: strong version")[
  Let $P$ be some predicate on the positive integers.
  If the following conditions are fulfilled:
  / Basis step: We can show that $P(n_0)$ is true for a fixed $n_0 in NN$.
  / Inductive step: If we assume that for some unspecified $k >= n_0$, $P(j)$ is true for any $n_0 <= j <= k$, then we can show that $P(k + 1)$ is true.

  Then $P(n)$ is true for every $n >= n_0$.
] <thm-strong-induction>

#remark[
  $n_0$ is very often $0$ or $1$, but not always!
]

#example[
  Find $n_0$ such that $2^n >= n + 5$ for all $n >= n_0$.
]


== Summary: types of relations

#table(
  columns: 6,
  row-gutter: .8em,
  align: center,
  toprule(),
  table.header(
    [*Relation*], [*Reflexive*], [*Symmetric*], [*Anti-\symmetric*], [*Transitive*], [*Additional\ Properties*]
  ),
  midrule(), [Equivalence], [✅], [✅], [❌], [✅],
  [], [Order], [✅], [❌], [✅], [✅],
  [], [Total order], [✅], [❌], [✅], [✅],
  [Every pair comparable], [Well-ordered set], [✅], [❌], [✅], [✅],
  [Every subset $!= emptyset$ has a minimum], bottomrule(),
)

#slidebreak()

You will see different kinds of relations again in a more or less close future.
- In *relational databases*, each table defines a relation between $n$ sets of attributes, where the values for each set are stored in a column (see Rosen 9.2 for further reading).
- A particular case of equivalence relation related to *modular arithmetic* and its associated classes will be studied in @sec-mod-arithmetic.
- Order relations constitute the *formalism* on which all *sorting algorithms* are built, whether they concern numbers or strings of text.
