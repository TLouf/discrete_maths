#import "assets/theory_template.typ": *
#show: theory


= Set theory

#fa-book() This chapter overlaps with sections 2.1, 2.2, 2.3, 9.1 and 9.3 of Rosen.

#slidebreak()

== Sets

=== Definitions

#definition(title: [Set and elements], slide-break: false)[
  A set is a collection of objects which are called elements of the set.
  A set is fully determined by _which_ elements compose it.
] <def-set>

#notation[
  - If $a$ is an element of the set $A$, we write $a in A$.
  - If an object $a$ is not an element of the set $A$, we write $a in.not A$.
]

#slidebreak()

How to describe a set?

- By using a roster, listing all elements of the set, either explicitly like:
  $ S_1 = {1, 2, 3, 4, 5, 6} $
  or implicitly, using an ellipsis:
  $
    S_1 = {1, 2, dots, 6}
  $

#slidebreak()
- By using a defining predicate:
  $ S = {y in S_0 | P(y)} $
  where $P(y)$ is a condition on the elements $y$ of another set $S_0$. Then $S$ is the set of all elements $y$ of $S_0$ such that $P(y)$ is true.
  For instance:
  $
    S_2 = { y in S_1 | y < 3 }
  $

#slidebreak()
- Through a transformation $f$ of the elements $y$ of another set $S_0$:
  $
    S = { f(y) | y in S_0 }
  $
  For instance:
  $
    S_3 = {n^3 | n in S_1}
  $

The notation "$|$" is read as "such that".
It can also be written with a colon "`:`".

You may also combine the predicate and transformation methods, but it's very rarely necessary.

#slidebreak()

#remark[
  Note that there is often more than one way to define the same set.
  However, there is often a better choice, at least in terms of clarity.
]


#example[
  For instance, how would you write $S_3$ above using a predicate on the set of natural numbers?
]

#pause

#solution[
  $
    S_3 = {m in NN | exists k in NN "such that" m = k^3}
  $
  which is equally valid but probably less clear.
]

#slidebreak()

#question-box[
  From @def-set, especially its second part, can you guess the condition for two sets to be equal?
  For instance, are $A = {1, 2}$, $B= {2, 1}$ and $C = {1, 1, 2}$ equal?
]

#pause

#solution[
  Yes they are! This means that the order of the elements in a set is irrelevant, as well as the number of occurrences of an element in the list.
]

#slidebreak()

#definition(title: [Sets equality])[
  Two sets are equal if and only if they have the same elements.
]

This definition of sets equality actually also indirectly defines what a set is.


#definition(title: [Empty set $emptyset$])[
  The *empty set* $emptyset$ is the set with no elements: $emptyset = {}$.
]

#definition(title: [Universal set $U$])[
  The *universal set* $U$ is the set containing all objects under consideration.
]

This concept can be useful to keep notation consistent. For instance, to formally write sets equality: two sets $A$ and $B$ are equal iff
$
  forall x in U, x in A <=> x in B,
$
instead of
$
  forall x mathc(in ?, #red), x in A <=> x in B.
$
Most of the time, and in the following of this course, $x in U$ can be omitted for convenience, though.


#definition(title: [Set finiteness and cardinality])[
  If there are exactly $n in NN$ distinct elements in a set $S$, we say that $S$ is a *finite set*, and that $|S| = n$ is the *cardinality* of $S$.
]


=== Examples: some already-known sets

#definition(title: [Natural numbers], slide-break: false)[
  The set of natural numbers $NN$ is defined by the following conditions:
  1. $0 in NN$.
  2. If $n in NN$, then the successor of $n$ (i.e., the number $n + 1$) belongs to $NN$.
  3. Every $n in NN$ except 0 is the successor of some number in $NN$.
  4. Every non-empty subset of $NN$ has a minimum element. //(well-ordering property).
]

#remark[
  - Some define the natural numbers starting from one, thus excluding zero.
    To avoid any ambiguity, one can respectively use the terms "non-negative" or "positive" integers to distinguish between the definition of natural numbers including or excluding zero.
    Here, we will denote the set ${n in NN | n != 0}$ as $NN^*$.
  - We can informally "define" the following sets of numbers:
    - Integer numbers: $ZZ = {0, plus.minus 1, plus.minus 2, ...}$
    - Rational numbers: $QQ = {p/q | p, q in ZZ, q != 0}$
  - These sets are discrete yet infinite: their cardinality is undefined (or infinite).
]


=== Subsets

#definition(title: [Subset], slide-break: false)[
  The set $B$ is a *subset* of the set $A$ ($B subset.eq A$) if and only if every element of $B$ is also an element of $A$:
  $
    B subset.eq A <=> (b in B => b in A).
  $

  The set $B$ is a *proper subset* of $A$ ($B subset A$) if $B$ is a subset of $A$, and $A$ contains at least an element not in $B$:
  $
    B subset A <=> (b in B => b in A) and (exists a in A, a in.not B).
  $
]

#slidebreak()

We can represent $B subset.eq A$, with a *Venn diagram*:
#figure(
  image("assets/A_sub_B.svg", height: 6em),
)

#property[
  - The empty set $emptyset$ is a subset of every set $A$: $emptyset subset.eq A$.
  - Every set $A$ satisfies $A subset.eq A subset.eq U$.
]

#important[
  The latter implies that $A = B <=> (A subset.eq B) and (B subset.eq A$).
  This is the basis for how we usually prove the equality of two sets:
  + Consider $x in A$, prove it is also in $B$.
  + Consider $x in B$, prove it is also in $A$.
]

#definition(title: [Power set])[
  The *power set* of the set $A$, denoted as $cal(P)(A)$, is the set of all subsets of $A$:
  $ cal(P)(A) = {B | B subset.eq A} $
]


== Set operations

Given two sets $A$ and $B$ we can define a number of operations.

#definition(title: [Sets union], slide-break: false)[
  The union of two sets $A$ and $B$ is the set of all elements that are in $A$, in $B$, or in both:
  $
    A union B = {x | (x in A) or (x in B)}
  $
]

#definition(title: [Sets intersection], slide-break: false)[
  The intersection of two sets $A$ and $B$ is the set of all elements that are in both $A$ and $B$:
  $
    A inter B = {x | (x in A) and (x in B)}
  $
]

#slidebreak()

#notation[
  These two operations can be chained an arbitrary number of times.\
  For example we can perform the union of $n$ sets $A_1, A_2, dots, A_n$:
  $
    A_1 union A_2 union dots union A_n = limits(union.big)_(i=1)^n A_i,
  $
  or perform the intersection of the same sets:
  $
    A_1 inter A_2 inter dots inter A_n = limits(inter.big)_(i=1)^n A_i.
  $
  These two notations are the respective equivalents of the sum $sum$ and product $product$ notations that you already knew.
]

#definition(title: [Set complement])[
  The complement of a set $A$ is the set of all elements that are not in $A$:
  $
    overline(A) = {x | x in.not A} = U without A
  $
]

#definition(title: [Sets difference])[
  The difference of two sets $A$ and $B$ is the set of all elements that are in $A$ but not in $B$:
  $
    A without B = {x | (x in A) and (x in.not B)}
  $
]

#definition(title: [Sets symmetric difference])[
  The symmetric difference of two sets $A$ and $B$ is the set of all elements that are in $A$ or in $B$ but not in both:
  $
    A triangle.t B = {x | (x in A union B) and (x in.not A inter B)}
  $
]

#slidebreak()

A set can therefore be defined as the result of operations involving other sets. For instance,
$
  ZZ = NN union {-n | n in NN}, quad NN^* = NN without {0}
$

You can represent these operations with a Venn diagram too. For instance:
#figure(
  grid(
    columns: 2,
    gutter: 1em,
    image("assets/A_union_B.svg", height: 6em), image("assets/A_inter_B.svg", height: 6em),
  ),
)

#slidebreak()

#question-box[
  How would you represent the other operations?
  Then, using these representations, how would you write the difference operations as combinations of the union, intersection and complement operations?
]

#pause

#solution[
  $
       A without B & = A inter (overline(B)), \
    A triangle.t B & = (A union B) without (A inter B).
  $
]

#slidebreak()

#property[
  - *Distributive laws*:
    - $A union (B inter C) = (A union B) inter (A union C)$
    - $A inter (B union C) = (A inter B) union (A inter C)$
  - *De Morgan's laws*:
    - $overline(A union B) = overline(A) inter overline(B)$
    - $overline(A inter B) = overline(A) union overline(B)$
  - $A triangle.t B = (A without B) union (B without A)$
]

You can check these laws hold with Venn diagrams too.


#definition(title: [Disjoint sets])[
  Two sets $A$ and $B$ are *disjoint* if $A inter B = emptyset$.
]

== Applications

=== Data types as sets

The very concept of a datatype in computer science is built upon the definition of a set. For instance, a boolean is an element of the set ${0,1}$, or, equivalently, `{False, True}`. A datatype is more than a set though, as it also defines the operations which are allowed on the elements of the set.

#question-box[
  Note that all data types which can be defined on computers correspond to a set which is _necessarily_ finite. Can you guess why?
]

// To check that an object is of a given type, so to check it belongs to the corresponding set, you can run #link("https://docs.python.org/3/library/functions.html#isinstance")[`isinstance(object, type)`].

=== Sets as a data type

Most programming languages define a set datatype. #link("https://docs.python.org/3/library/stdtypes.html#set")[python is no exception]: you can define a set with a syntax that is very similar to the notation we have seen until now:
```python
S = {'a', 1, {'b'}}
```

#slidebreak()

#home[
  Find the equivalents of the set operations we saw above in the #link("https://docs.python.org/3/library/stdtypes.html#set")[python documentation], and try them out! Also check that sets in python have the properties listed above, in particular that the ordering of elements does not matter.
]


== Relations
<sec-rels-sets>

#definition(title: [Tuple])[
  An $n$-tuple is an ordered collection of $n$ objects, of the form $(a_1, a_2, dots, a_n)$.
  A 2-tuple is often called an ordered pair.
]

This means that, contrary to sets, for tuples the ordering of elements matters.
Thus, while ${a_1, a_2} = {a_2, a_1}$, for tuples $(a_1, a_2) != (a_2, a_1)$ if $a_1 != a_2$.

#definition(title: [Cartesian product])[
  Given two sets $A$ and $B$, the *Cartesian product* $A times B$ is the set of all ordered pairs $(a, b)$ where $a in A$ and $b in B$.
  Formally, that is:
  $ A times B = {(a, b) | (a in A) and (b in B)} $
]

#slidebreak()

#remark[
  A Cartesian product gives you all the possible combinations involving one element from each set.
  If $A = B$, it gives all the possible combinations of two elements in this set.

  You already saw Cartesian products in calculus, when you wrote, for instance: $forall (x, y) in RR^2$: these are all the possible pairs of real numbers.
  Then, you used the notation $RR^2 = RR times RR$.
]

The Cartesian product allows us to introduce a fundamental concept of discrete mathematics: relations.

#definition(title: [Binary relations])[
  A *binary relation* $R$ from the set $A$ to the set $B$ is a set of ordered pairs from the two sets. Said differently, $R$ is a subset of $A times B$, so:
  $
    R subset.eq A times B.
  $

  $A$ is then called the *domain* of $R$, while $B$ is called its *codomain*.

  If $a in A$ is related to $b in B$ by $R$, we therefore have $(a, b) in R$, which we can also write $a rel b$.
  If they are not related, we have $(a, b) in.not R$, which we can also write $a cancel(rel) b$.
]

// TODO: examples

#slidebreak()

How can we represent binary relations graphically?

What we want is to show each set on a separate "side", and link related elements together.
Here we'll see three options, which are the directed graph, Cartesian and adjacency matrix representations.

#slidebreak()

#example[
  #let names = ("Alice", "Bob", "Eve")
  #let ages = (28, 20, 22)
  Let's consider that we know three persons, called Alice, Bob and Eve, who are respectively 28, 20 and 22 years-old.
  We want to represent this information as a binary relation.
  We can then consider the set $A={"Alice", "Bob", "Eve"}$ of people's names and the set $B = {20, 22, 28}$ of some ages.
  We can thus define the relation $R$ as $a rel b$ if person $a in A$ has the age $b in B$, and represent it as:
  #figure(
    grid(
      columns: 3,
      gutter: 3em,
      align: horizon,
      cetz.canvas({
        import cetz.draw: *
        for (i, (n, a)) in names.sorted().zip(ages.sorted()).rev().enumerate() {
          content((0, i), n, name: n, padding: 0.2)
          content((3, i), [#a], name: str(a), padding: 0.2)
        }
        for (n, a) in names.zip(ages) {
          line(n + ".mid-east", str(a) + ".mid-west", mark: (end: ">"))
        }
      }),
      [
        #set math.equation(numbering: none)
        $
          mat(0, 0, 1; 1, 0, 0; 0, 1, 0;)
        $
      ],
      lq.diagram(
        lq.scatter(range(names.len()), ages, size: 12pt),
        xaxis: (ticks: names.enumerate()),
        yaxis: (ticks: ages),
      ),
    ),
  )
]

#slidebreak()

#question-box[
  - When is the Cartesian representation preferable?
    Hint: imagine if we took $B = NN$.
  - Imagine other relations in which the individual relations are not one-to-one, but one-to-many, many-to-one or many-to-many.
]
// Give more examples with non one-to-one,, show how full cartesian product looks like...

#slidebreak()

To be more formal:

#definition(title: [Adjacency matrix], slide-break: false)[
  Let's consider a relation $R$ from the set $A$ to the set $B$, and the orderings $a_1, a_2, ..., a_(|A|)$ and $b_1, b_2, ..., b_(|B|)$ of these two sets.
  The *adjacency matrix* of $R$ associated to these orderings is the $|A| times |B|$ matrix $M$ whose entries satisfy
  $
    M_(i j) = cases(
      1 "if" a_i rel b_j,
      0 "if" a_i cancel(rel) b_j,
    )
  $
]

#slidebreak()

We clearly saw graphically that relations have a direction, that one can naturally reverse.

#definition(title: [Inverse relations], slide-break: false)[
  Let $R$ be a relation from the set $A$ to the set $B$.
  The inverse relation of $R$ is the relation that assigns to each element $b in B$ an element $a in A$.
  We denote the inverse by $R^(-1)$, so that
  $
    forall (a, b) in A times B, a rel b <=> b rel^(-1) a
  $
]

#remark[
  All relations have an inverse.
]

#definition(title: [Composition of relations])[
  Let $R$ be a relation from the set $A$ to the set $B$, and let $S$ be a relation from the set $B$ to the set $C$.
  The composition of the relation $S$ and $R$ is a relation from $A$ to $C$ denoted as $S circle.small R$.
  In particular, $S circle.small R$ is a subset of the Cartesian product $A times C$ such that, given any $a in A$ and $c in C$, $a (S circle.small R) c$ if and only if there exists some $b in B$ satisfying $a rel b$ and $b op("" S "") c$.
  // is read as "S composed with R", or "S of R" (more for functions)
]

#example[
  We can consider a set $A$ corresponding to the members of your family from your generation, a set $B$ corresponding to the previous generation, and $C$ to two generation ago.
  We can introduce the relations
  $
    R & = { (a,b) in A times B | a "is the child of" b}, \
    S & = { (b,c) in B times C | b "is the child of" c},
  $
  whose composition gives
  $
    S circle.small R & = {(a,c) in A times C | "a parent of" a "is the child of" c} \
                     & = {(a,c) in A times C | a "is the grandchild of" c}.
  $
]

#proposition[
  Let $M_R$ be the adjacency matrix of the relation $R$ from the set $A$ to the set $B$, and let $M_S$ be the adjacency matrix of the relation $S$ from the set $B$ to the set $C$.
  Then, the adjacency matrix $M_(S circle.small R)$ of the composition of the relations $S circle.small R$ from $A$ to $C$ is given by:
  $ M_(S circle.small R) = M_R dot.o M_S $
  where the product $dot.o$ is the Boolean product of matrices.
]

Using Boolean operations (instead of regular ones) guarantees that $M_(S circle.small R)$ is an adjacency matrix associated to a binary relation.


== Defining functions as relations

#definition(title: "Functions")[
  A binary relation $f$ with a domain $X$ and codomain $Y$ is said to be a *function* if it assigns exactly one element of $Y$ to each element of $X$.
]

#slidebreak()

#notation[
  A function $f subset.eq X times Y$ is usually defined with the notation $f: X -> Y$, to signify that it maps each element of $X$ to a unique element of $Y$.

  Also, we write $f(x) = y$ if $y$ is the unique element of $Y$ assigned by $f$ to the element $x$ of $X$.
]

#definition(title: [Function images and range])[
  Let's consider $f: X -> Y$ and $(x,y) in X times Y$ such that $f(x) = y$.
  We then say that $y$ is the *image* of $x$ under the function, and that $x$ is the *preimage* of $y$.
  We also define the *range* of the function as the set of images of every element in the domain $X$, and often write this range as $f(X)$.
  The range is therefore a subset of the codomain: $f(X) subset.eq Y$.
]

// TODO: question: is this a function? like with a circle.


#definition[
  Given a function $f : X -> Y$, we say that
  - $f$ is *injective* or *one-to-one* if each element of $Y$ is mapped to at most one element of $X$, or equivalently, if $x_1 != x_2$ implies $f(x_1) != f(x_2)$.
  - $f$ is *surjective* if it maps every element of $Y$ to at least one element of $X$, that is, if for every $y in Y$, there exists at least an element $x in X$ such that $y = f(x)$.
  - $f$ is *bijective* if it is injective and surjective.
]

// summary: is function by drawing vertical lines and checking intersect exactly one point, is injective if drawing horizontal lines they never intersect two points, and is surjective if all values of y are covered.

// TODO (graphical) examples

#definition(title: "Inverse function")[
  If $f : X -> Y$ is bijective, we can define its *inverse function* $f^(-1) : Y -> X$ by the well-defined rule:
  $ f^(-1)(y) = x <==> y = f(x) $
]

#question-box[
  While all relations have an inverse, a function, which is a particular kind of relation, only has an inverse if it is bijective.
  How come?
]

// mention kinda like reversibility, like in directed graph, is invertible if can go and come back unambiguously

#definition(title: "Composition of functions")[
  Given two functions $f : X -> Y$, $g : Y -> Z$, we can define a new function $g compose f : X -> Z$ by the following rule:
  $ (g compose f)(x) = g(f(x)) $
  The function $g compose f$ is the *composition* of $f$ and $g$.
]
