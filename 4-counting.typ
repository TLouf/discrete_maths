#import "assets/theory_template.typ": *
#show: theory


= Counting

#fa-book() This chapter overlaps with sections 6.1, 6.2, 6.3, 6.4, 6.5 of Rosen.

#slidebreak()

The *goal of counting* is basically to determine the cardinality of certain finite sets.
This is much more useful than it sounds.
For instance, a fundamental way to compute discrete probabilities is to count in how many ways a given event can occur, and divide it by the total number of possible alternatives.

#definition[
  Two sets $A$ and $B$ have the same cardinality if and only if there exists a bijective function $f : A -> B$.
] <def-same-card-bij>

#definition(title: [Countable sets])[
  A set that is either finite or has the same cardinality as the set $NN$ is called *countable*.
]


== Fundamental counting principles

=== The product rule

Suppose that a meal can be broken down into a first and second course.
Let's assume we have $n_1$ recipes for the first course and $n_2$ for the second.
If any combination of first and second course is deemed acceptable, then we have $n_1 dot n_2$ ways to prepare a whole meal.

// represent graphically by drawing the two sets and, for each element of the first set, all the links to all elements of the second.

#slidebreak()

#remark[
  The condition above can be rephrased as "if the choice of second course is independent from the choice of first course".
  "Independent" is a word you'll hear again in probability theory.
  This is no coincidence!
]

#slidebreak()

The recipes for the first and second course can be seen as the members of two sets, which can be combined together through the Cartesian product of these two sets.
This is the idea behind the product rule stated below.

#proposition(title: "The basic product rule")[
  If $A$ and $B$ are two finite sets, then
  $ abs(A times B) = abs(A) dot abs(B) $
]

This can be directly generalised to an arbitrary number of sets.

#proposition(title: "The generalised product rule")[
  If $A_1, A_2, ..., A_m$ are finite sets, then
  $ abs(A_1 times A_2 times ... times A_m) = abs(A_1) dot abs(A_2) dot dots dot abs(A_m) = product_(k=1)^m abs(A_k) $
]

#slidebreak()

#example[
  How many functions are there from a set with $m$ elements to a set with $n$ elements?
  // draw graph, for each $m$ can choose $n$ options, so result is $n^m$.
]

=== The division rule

Still with our recipes, imagine that to prepare the same meal, you have $N$ different recipes, but for each of those, you find $d-1$ others which taste the same.
Then the number of actually different recipes you can taste is $N / d$.
In terms of sets, this gives

#proposition(title: "The division rule")[
  If a finite set $A$ is the union of $n$ pairwise disjoint subsets, each of cardinality $d$, then $abs(A) = n dot d$.
]

which is called the division rule, because most often, the unknown is $n = abs(A) / d$, as we'll see later on.

#slidebreak()

#example[
  How many different ways are there to seat four people around a circular table, where two seatings are considered the same when each person has the same neighbors?
]

// We arbitrarily select a seat at the table and label it seat 1. We number the rest of the seats in numerical order, proceeding clockwise around the table. Note that are four ways to select the person for seat 1, three ways to select the person for seat 2, two ways to select the person for seat 3, and one way to select the person for seat 4. Thus, by the product rule there are 4! = 24 ways to order the given four people for these seats.
// better than below: start choosing neighbours at seat 2, doesn't matter what choice we make for seat 1
// However, each of the four choices for seat 1 leads to the same arrangement, as we distinguish two arrangements only when one of the people has a different immediate left or immediate right neighbor. Because there are four ways to choose the person for seat 1, by the division rule there are 24∕4 = 6 different seating arrangements of four people around the circular table.

=== The sum rule

Let's consider the cuisines of two different countries.
Let's assume a given ingredient can be prepared in $n_1$ recipes in the first, and in $n_2$ recipes in the second.
If the two countries do not share a single recipe in common, then someone who knows both cuisines can prepare $n_1 + n_2$ different recipes with this ingredient.

#proposition(title: "The basic sum rule")[
  If $A$ and $B$ are two finite and disjoint sets ($A inter B = emptyset$), then
  $ abs(A union B) = abs(A) + abs(B) $
]

This can be directly generalised to an arbitrary number of sets.

#proposition(title: "The generalised sum rule")[
  If $A_1, A_2, ..., A_m$ are a sequence of finite and pairwise disjoint sets $A_i inter A_j = emptyset$ for all $i != j$, then
  $
    abs(limits(union.big)_(i=1)^m A_i) = abs(A_1 union A_2 union ... union A_m) = abs(A_1) + abs(A_2) + ... + abs(A_m) = sum_(i=1)^m abs(A_i)
  $
]


=== The principle of inclusion-exclusion

We can generalise the sum rule by relaxing the assumption we made that the two cuisines do not share a single recipe in common.
So let's be more agnostic and consider the possibility that they might.
This leads to the principle of inclusion-exclusion.

#proposition(title: "The basic principle of inclusion-exclusion")[
  If $A$ and $B$ are two finite sets, then
  $ abs(A union B) = abs(A) + abs(B) - abs(A inter B) $
]

You may see this graphically by drawing a Venn diagram.

#slidebreak()

#question-box[
  Now, what happens if we add another set $C$ to the mix?
  Try to answer by drawing another diagram.
]

#slidebreak()

The generalisation is less obvious than before, but as hinted by our iterative approach of adding one subset at a time, by induction we get

#proposition(title: "The generalised principle of inclusion-exclusion", slide-break: false)[
  If $A_1, A_2, ..., A_m$ are finite sets, then
  $
    abs(limits(union.big)_(i=1)^m A_i) & = sum_(1 <= i <= m) abs(A_i) - sum_(1 <= i < j <= m) abs(A_i inter A_j) + sum_(1 <= i < j < k <= m) abs(A_i inter A_j inter A_k) \
    & quad ... + (-1)^(m+1) abs(A_1 inter A_2 inter ... inter A_m)
    // & quad - sum_(1 <= i < j <= m) |A_i inter A_j| \
    // & quad + sum_(1 <= i < j < k <= m) |A_i inter A_j inter A_k| \
    // & quad ... \
    // & quad + (-1)^(m+1) |A_1 inter A_2 inter ... inter A_m|
  $
]

=== The pigeonhole principle

Imagine that $n$ pigeons try to land into $n-1$ pigeonholes.
Clearly, there are not enough pigeonholes for every pigeon to have its own, which implies that at least two of them will share a pigeonhole.
In terms of objects and boxes, this gives

// TODO: trees as in end of 6.1?
#proposition(title: [The pigeonhole principle])[
  If $k + 1$ or more objects are placed into $k$ boxes, then there is at least one box containing two or more of the objects.
]

Apart from its funny name, the pigeonhole principle has useful implications, especially when generalised.

#slidebreak()

#proposition(title: [The generalised pigeonhole principle])[
  If $N$ or more objects are placed into $k$ boxes, then there is at least one box containing at least $ceil(N∕k)$ objects.
]

#pause

#proof[
  Suppose that none of the boxes contains more than $ceil(N∕k) − 1$ objects. Then, the total number of objects is at most
  $
    k (ceil(N / k) - 1) < k ((N / k + 1) - 1) = N.
  $
  This proves the principle by contraposition.
]

#slidebreak()

#example[
  Among $100$ people, how many are born in the same month?
  // $ceil(100 / 12) = 9$
]

#slidebreak()

#example[
  How many cards must be selected from a standard deck of 52 cards to guarantee that at least three cards of the same suit are selected?
  // $N$ such that $ceil(N / 4) >= 3$, which gives $N=9$.
]

== Combinatorics
// https://www.youtube.com/watch?v=VJkvPTY6kZw

// *Remarks.*
// - $overline(A) = S without A => |overline(A)| = |S| - |A|$

=== Permutations

A permutation is basically a way in which elements of a set can be ordered.

#example[
  Let's consider the set containing the first four letters of the alphabet: $S = {A, B, C, D}$.
  In how many ways can we order them, or, in other words, in how many ways can we permute the elements of this set, or, even, how many permutations does this set have?
]

#slidebreak()

#solution[
  To see how to answer that, let's think about the very process of ordering.
  We first choose the element that should come first: at this stage we have 4 different choices.
  Once this choice is made, we have 3 choices left for the second, then after that, 2 choices for the third, and finally, only one.
  By the product rule we thus have $4 dot 3 dot 2 dot 1 = 24$ ways to order these elements.
]
// illustrate with 4 letters on top, and 4 numbered boxes below, then progressively write number of choices left in each.

#proposition(title: [Permutations of $n$ distinct objects])[
  Given $n$ distinct objects, there are $n!$ distinct ordered arrangements (= permutations) of these objects.
] <prop-n-permut-distinct>

#remark[
  For a set $A$, we can directly say that it has $abs(A)!$ permutations, since its elements are distinct by definition.
]

#slidebreak()

We just involved the factorial, that we now properly define.

#definition(title: [Factorial], slide-break: false)[
  For all $n in NN$, we define the *factorial* of $n$ as
  $
    n! = n dot (n-1) dot (n-2) dot dots dot 2 dot 1 = product_(k=1)^n k
  $
]

#remark[
  By convention, $0! = 1$.
]

Let us generalise the concept of a permutation by also considering we want to form orderings of size $r <= n$.

#definition(title: [Permutation])[
  Given a set of cardinality $n$ and a natural number $r <= n$, an *$r$-permutation* of elements of this set is an ordered arrangement of $r$ elements of this set.
]

#notation[
  The number of such arrangements is denoted $P(n,r)$.
]

The result above can then be directly extended, as we simply stop making choices after $r$ steps.

#proposition[
  Given a set of cardinality $n$ and a natural number $r <= n$, the number of $r$-permutations we can form from this set is:
  $
    P(n,r) = n dot (n-1) dot dots dot (n-r+1) = n! / (n-r)!
  $
]

#remark[
  We can get back the result of @prop-n-permut-distinct for $n$-permutations using the convention $0! = 1$.
]

#slidebreak()

If we tweak the permutation process by considering that each choice is independent from the others, we're now allowed to pick any element from the set at every step, even those we've already picked before.
We're thus allowing repetitions in our permutation, and the number of such permutations is even more straightforward to obtain.

#proposition[
  The number of $r$-permutations of a set of $n$ objects with repetition allowed is $n^r$.
]

#slidebreak()

Now what happens if our objects are not necessarily distinguishable anymore?
Let's say we now want to know in how many ways we can the shuffle the string $A B B C C C$.

#slidebreak()

#solution[
  If we attached labels to each letter to keep track of them, like such: $A_1 B_1 B_2 C_1 C_2 C_3$, then as above, we would have $(1 + 2 + 3)! = 6!$ permutations.
  But notice that if we remove the labels, the two following permutations
  $
    A_1 B_1 B_2 C_1 C_2 C_3\
    A_1 B_2 B_1 C_1 C_2 C_3
  $
  in which we permuted the $B$'s, would look exactly the same!
  So for each labeled permutation, two unlabeled ones would have the same ordering for the $B$'s.
  Similarly, the $C$'s can be reordered in $3!$ ways in each labeled permutation.

  Therefore, all in all, each labeled permutation has $2! dot 3! = 12$ equivalent unlabeled ones.
  We can thus get the number of ways we can shuffle this string as:
  $
    6! / (2! dot 3!) = (6 dot 5 dot 4) / 2 = 60
  $
]

#proposition(title: "Permutations with indistinguishable objects")[
  Given $n$ objects that can classified into $k$ groups of indistinguishable elements, and such that the first group contains $n_1$ indistinguishable elements of type 1, the second group contains $n_2$ indistinguishable elements of type 2, etc, then the number of distinct ordered arrangements of these objects is
  $ n! / (n_1 ! dot n_2 ! dot dots dot n_k !) $
] <prop-permut_w_rep>

#slidebreak()

#remark[
  By definition of the $n_i$ above, $sum_(i=1)^k n_i = n$.
]


=== Combinations

What if we now count distinct unordered selections of objects from a set, that is, how many distinct subsets of the same size we can form?

This is called a combination.
If we simply combine all the elements from a set with $n$ elements, by definition of a set there is only one such combination of $n$ elements.
What's interesting is if we wonder how many combinations of $r < n$ elements from this set of $n$ elements we can form.

#definition(title: [Combination])[
  Given a set of cardinality $n$ and $r <= n$, an *$r$-combination* of elements of this set is one of its subsets of cardinality $r$.
] <def-combination>

#notation[
  The number of such subsets is denoted $C(n,r)$.
]

#slidebreak()

As we've seen above, a set of size $n$ admits $n! / (n-r)!$ permutations of size $r$.
But, once we have an $r$-permutation, this new arrangement itself can be permuted in $P(r,r) = r!$ ways, each of which corresponds to the same subset.
That's how we can see by the division rule that

#proposition(slide-break: false)[
  Given a set of cardinality $n$ and a natural number $r <= n$, the number of $r$-combinations we can form from this set is:
  $
    C(n,r) = P(n,r) / r! = n! / (r! (n-r)!)
  $
] <prop-r-comb-count>

#remark[
  Notice how this does give us $C(n, n) = 1$, using again the convention $0! = 1$.
]

#slidebreak()

This leads us to introduce some particular integers: the binomial coefficients.

#definition(title: "Binomial coefficients", slide-break: false)[
  For all non-negative integers $n, r in ZZ^+$ such that $0 <= r <= n$, we define the *binomial coefficient* as follows:
  $ binom(n, r) = frac(n!, r!(n-r)!) $
]

#slidebreak()

#question-box[
  Rewrite $C(n, r)$ and $P(n, r)$ using a binomial coefficient.
]

#remark[
  The symbol $binom(n, r)$ is read "$n$ choose $r$", as it gives us the number of ways we can choose $r$ distinct elements from a set of size $n$.
  Forming an $r$-combination is thus equivalent to sampling without replacement, to translate our combinatorics approach to the language of statistics.
]

=== Distributions

Many counting problems can be solved by mapping them to a process of distributing objects into boxes.
Same as above, the objects can be considered distinguishable ($~$ labeled), or not.
The distinction could also be made for the boxes, but in this course we will only consider distinguishable boxes.

#slidebreak()

Let's first consider $n$ distinguishable objects to be placed into $k$ boxes through an example.

#example[
  How many ways are there to distribute hands of 5 cards to each of four players from a deck of 52 cards?
]

#slidebreak()

#solution[
  This problem does correspond to the general one stated above, because all cards and players are distinct.
  We can notice that once we dealt cards to a player $i$, it is as if we created a group, or box, of $n_i=5$ cards.
  We thus create one of these groups for each of the four players, and a final group with the remaining $52 - 4 dot 5 = 32$ cards.
  This amounts to creating $k=5$ groups, within each of which we can shuffle the cards without changing the distribution.

  #slidebreak()

  We can thus form a bijective function between the distributions of cards to the players and permutations with indistinguishable objects from @prop-permut_w_rep!
  From @def-same-card-bij, we can therefore use the previous result to get that the total number of ways to distribute the hands is
  $
    52! / ((5!)^4 dot 32!)
  $
  // Let's assume we order the 52 cards in some way, assigning them a label that goes from 1 to 52.
]

We thus get the same result as in @prop-permut_w_rep.
#proposition(title: "Distributions of distinguishable objects")[
  The number of distributions of $n$ distinguishable objects into $k$ distinguishable boxes so that each box $i$ receives $n_i$ objects is
  $
    n! / (n_1 ! dot n_2 ! dot dots dot n_k !)
  $
]

#slidebreak()

Let's now consider we have $n$ indistinguishable objects.
- Since objects are indistinguishable, they can be represented by any same symbol, such as a star $*$, which is conventionally used as a placeholder.
- The assignment to $k$ boxes can then be represented by separating these stars with $k-1$ bars.
We thus use a *"stars and bars"* representation, which is very commonly used to solve this kind of problems.

#slidebreak()

#example[
  For $n=8$ and $k=3$, two example distributions can thus be visualised as:
  $
    underbracket(* * *, A) | underbracket(* * * *, B) | underbracket(*, C) quad quad quad underbracket(, A)| underbracket(* * * *, B) | underbracket(* * * *, C)
  $
  So the $n+k-1 = 10$ stars and bars are to be arranged in as many slots, so, for instance, we can first choose $n$ of these spots for our $n$ stars, and fill the remaining ones with bars.
]

This is thus a "$(n + k - 1)$ choose $n$" combination!

#proposition(title: "Distributions of indistinguishable objects")[
  The number of distributions of $n$ indistinguishable objects into $k$ distinguishable boxes is
  $
    binom(n+k-1, n)
  $
]

#slidebreak()

Another parallel with combinations can be established.
Counting the number of ways of placing $n$ indistinguishable objects into $k$ boxes turns out to be the same as counting the number of $n$-combinations for a set with $k$ elements when repetitions are allowed.
These are slightly different from @def-combination, since we allow to redraw the same element from the input set.
The combination with repetition is thus not a subset, but a collection of elements with potential repetitions.
The processes behind the distribution and the combination with repetition can be directly mapped by imagining that each time the $i^"th"$ element of the input set is included in the combination, we put a ball in the $i^"th"$ box of the distribution.

#slidebreak()

#proposition(title: [$r$-combinations with repetition])[
  Given a set of cardinality $n$ and a natural number $r <= n$, the number of $r$-combinations with repetition that we can form from this set is:
  $
    binom(r+n-1, n-1)
  $
]

=== Binomial coefficients

There are many useful identities related to these coefficients.
One of the most important is Pascal's.

#theorem(title: "Pascal's identity", slide-break: false)[
  $ forall r in ZZ^+, n >= r,binom(n+1, r) = binom(n, r) + binom(n, r-1) $
] <thm-pascal-identity>

#slidebreak()

Using this identity, the binomial coefficients can be visualised by arranging them such that
$
  binom(n, r) equiv binom("row number", "column number")
$
Starting with the initial conditions $binom(n, 0) = binom(n, n) = 1$, we thus form Pascal's triangle, expanding it downwards using @thm-pascal-identity.
Pascal's triangle can then be drawn left or centre-aligned, as preferred:

#slidebreak()

#figure(
  grid(
    columns: 2,
    column-gutter: 4em,
    row-gutter: 1em,
    align: center,
    grid(
      columns: 6,
      column-gutter: 2em,
      row-gutter: 1em,
      align: center,
      [1], [], [], [], [], [],
      [1], [1], [], [], [], [],
      [1], [2], [1], [], [], [],
      [1], [3], [3], [1], [], [],
      [1], [4], [6], [4], [1], [],
      [1], [5], [10], [10], [5], [1],
    ),
    grid(
      columns: 11,
      gutter: 1em,
      align: center,
      [], [], [], [], [], [1], [], [], [], [], [],
      [], [], [], [], [1], [], [1], [], [], [], [],
      [], [], [], [1], [], [2], [], [1], [], [], [],
      [], [], [1], [], [3], [], [3], [], [1], [], [],
      [], [1], [], [4], [], [6], [], [4], [], [1], [],
      [1], [], [5], [], [10], [], [10], [], [5], [], [1],
    ),

    // @typstyle off
    $
      #pin(1) binom(n, r-1)#pin(2) quad & quad #pin(3)binom(n, r)#pin(4) #v(5em) \
      & #pin(10)binom(n+1, r)#pin(11)

      #pinit-line((1, 2), 10, start-dy: 15pt, end-dy: -15pt)
      #pinit-line((3, 4), (10, 11), start-dy: 15pt, end-dy: -15pt)
    $,
    // @typstyle off
    $
      binom(n, r-1)#pin(12) quad & & quad #pin(13)binom(n, r)#v(5em) \
      & #pin(20)binom(n+1, r)#pin(21)
      #pinit-line(12, 20, start-dy: 15pt, end-dy: -15pt)
      #pinit-line(13, 21, start-dy: 15pt, end-dy: -15pt)
    $,
  ),
)

This also allows us to see the symmetry in the binomial coefficients, especially using the centre-aligned representation.

#theorem(title: "Symmetry")[
  $ forall r in NN, n >= r, binom(n, r) = binom(n, n-r) = frac(n!, r!(n-r)!) $
]

#slidebreak()

The binomial coefficients also appear in the expansion of some polynomials.

#example[
  Let's take the example of the expansion of $(x+y)^3$.
  Its expansion can be seen as a combinatorics problem in which we repeatedly pick either $x$ or $y$ from each parenthesised term of $(x+y)^3 = (x+y)(x+y)(x+y)$ to form a product.

  #slidebreak()

  This gives us $2^3$ products of the form $x^alpha y^beta$ with $0<= alpha, beta <= 3$, which we then sum.
  We can thus simply count the number of ways to choose $alpha$ times $x$  from the 3 parenthesised terms, which is $binom(3, alpha)$!
  Then, $beta = 3 - alpha$.
  Explicitly, here:
  // @typstyle off
  $
    (x+y)^3 = #pin(1)x x x#pin(2) + #pin(11)x x y#pin(12) + #pin(13)x y x#pin(14) + #pin(21)x y y#pin(22) + #pin(15)y x x#pin(16) + #pin(23)y x y#pin(24) + #pin(25)y y x#pin(26) + #pin(31)y y y#pin(32),
    // #pinit-highlight(1, 2)
    // #pinit-highlight(11, 12, fill: yellow.transparentize(80%))
    // #pinit-highlight(13, 14, fill: yellow.transparentize(80%))
    // #pinit-highlight(15, 16, fill: yellow.transparentize(80%))
    // #pinit-highlight(21, 22, fill: blue.transparentize(80%))
    // #pinit-highlight(23, 24, fill: blue.transparentize(80%))
    // #pinit-highlight(25, 26, fill: blue.transparentize(80%))
    // #pinit-highlight(31, 32, fill: olive.transparentize(80%))
  $
  so the number of ways we can put two $x$ in three slots is $binom(3, 2)$, to put only 1 is $binom(3, 1)$ and only $binom(3, 3)=binom(3, 0)=1$ way to put either three or zero of them.
]

This leads to the binomial theorem.

#theorem(title: "Newton's binomial theorem")[
  Let $x$ and $y$ be two variables, and $n in NN$. Then
  $
    (x + y)^n = sum_(k=0)^n binom(n, k) x^k y^(n-k)
  $
] <thm-binomial>
// TODO: https://www.youtube.com/watch?v=6agQBHWP8IE ?

#slidebreak()

#corollary[
  $ (1 + x)^n = sum_(k=0)^n binom(n, k) x^k $
]

#corollary[
  $ sum_(k=0)^n binom(n, k) = 2^n, quad sum_(k=0)^n (-1)^k binom(n, k) = 0 $
]

#slidebreak()

Finally, the binomial theorem together with @prop-r-comb-count enables us the determine the cardinality of the power set.

#corollary[
  Given a finite set $A$ of cardinality $n$,
  $ |cal(P)(A)| = sum_(r=0)^n C(n,r) = 2^n $
]

// TODO: multinomial theorem?
#slidebreak()

#remark[
  You will find again the binomial coefficients in the binomial distribution and other distributions in probability theory.
]


// == Set Partitions

// Let us now count partitions: sets of a fixed number of disjoint subsets whose union form the whole set.
// These are the same objects we defined in @def-partition in the context of equivalence relations, only this time we want to count how many partitions of a finite set we can form, given different constraints.

// Let's start with the most constrained case: we want a partition by $k$ subsets of given sizes ${n_i}_(1<=i<=k)$.

// #example[
//   Let's consider the set $S = {A,B,C,D,E,F}$ of cardinality $n=6$, that we want to partition in $k=3$ subsets of sizes $1$, $2$ and $3$.
//   One such partition is
//   $
//     A quad B C quad D E F
//   $
//   As with permutations, we can rearrange these $6$ letters in $6!$ ways.
//   However, some arrangements are redundant, such as:
//   $
//     A quad B C quad D E F\
//     A quad C B quad D E F
//   $
//   where we reordered $B$ and $C$, but the second subset is invariant.
//   We already know that we permute the second subset in $2!$ ways, and the third in $3!$ ways.
//   All in all, each subset has $n_i !$ equivalent arrangements.
//   So the number of partitions here is
//   $
//     6! / (2! dot 3!) = (6 dot 5 dot 4) / 2 = 60
//   $
// ]

// #proposition(title: [Fully-constrained partitions])[
//   The number of ways to partition a set of cardinality $n$ into $k$ subsets of cardinalities ${n_i}_(1<=i<=k)$ is
//   $ n! / (n_1 ! n_2 ! dots n_k !) $
// ]

// #remark[
//   You might have noticed by now that this problem is exactly the same as the one of permutations with repetition from @prop-permut_w_rep!
//   The two problems can be matched by making the following equivalences:
//   #figure(
//     table(
//       columns: 3,
//       toprule(),
//       table.header([Fully-constrained partitions], [], [Permutations with repetition]),
//       midrule(), [Number of subsets], [$<->$],
//       [Number of unique objects], [Subset sizes], [$<->$],
//       [Counts of unique objects], bottomrule(),
//     ),
//   )
// ]


// // Now what if we remove the constraint on the exact size of each subset, and only consider how many partitions of size $k$ we can form?
// // The sizes of each subset ${n_i}$ are now free, but from the sum rule we still have the marginal constraint:
// // $
// //   sum_(i=1)^k n_i = n
// // $
// // Since we already know the number of partitions when we have given values of ${n_i}$ from before, what we can do is count how many possible arrangements of subset sizes there are!

// // this leads to bell numbers... maybe avoid
