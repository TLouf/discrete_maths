#import "../../../../assets/exam_template.typ": *

#show: doc => exam(
  [Discrete Mathematics],
  [Bachelor in Artificial Intelligence],
  datetime(year: 2026, month: 2, day: 27),
  is_final: false,
  checksum: false,
  doc,
)


=

+ We just have 3 possible moves to choose from, which we can order in any possible way. This is thus a 5-permutation of a set of size 3 with repetitions allowed. The answer is thus $3^5$.

+ None, because to come back to the starting point, for every `U`, we'd need a `D` (and conversely), and the same for `L` and `R`. If we write $y$ the number of `U` and $x$ the number of `L`, the number of moves performed by the robot must thus be $2 x + 2 y$, which is an even number, which $5$ is not.

+ Since there are two changes, there can only be 3 types of move at most, and at least 2. So let's separate between these two options:
  - The sequence involves 3 move types. There are $3! binom(4, 3) = 4 dot 3!$ ways to pick and order those types. Once this is done, we need to pick how many of each move we perform, which amounts to finding the number of solutions of $x_1 + x_2 + x_3 = 5$, where $x_i >= 1$. With the change of variable $y_i = x_i - 1$, using stars and bars we know that there are $binom(2+3-1, 3-1) = binom(4, 2) = 6$ such solutions. For this case, we thus have $24 dot 3! = 144$ possibilities.
  - It involves only 2 move types. There are $binom(4, 2) = 6$ ways to pick two types, and there are only two possible orders: `type1 type2 type1` and `type2 type1 type2`. To pick how many moves we perform in each phase, we have the same reasoning as above. This gives $6 dot 2 dot 6 = 72$ possibilities.

  These two cases being mutually exclusive, by the sum rule we get that there are $144 + 72 = 216$ possible sequences.

  ---

  Alternative reasoning:
  We decompose into two steps:
  - Choose 3 distinct directions for the blocks such that consecutive blocks differ.
    - First block: 4 choices
    - Second block: 3 choices (different from first)
    - Third block: 3 choices (different from second)

    By the product rule, this gives $4 dot 3 dot 3$ possibilities

  - Distribute the 5 positions into 3 nonempty blocks (stars and bars): $binom(5 - 1, 3 - 1) = binom(4, 2) = 6$

  By the product rule, we thus get a total of $4 dot 3 dot 3 dot 6 = 216$ possibilities.


+ First, the total number of sequences it can perform is $4^5$, using the same argument as in (a).
  From this count, we need to exclude the count of sequences which make the robot fall off the table.
  By symmetry, we can limit ourselves to counting the number of ways for the robot to fall off the top and right edge of the table, and multiply the resulting count by 2.
  We now have two cases to study.
  - The robot falls off the right edge if the sequence makes it move rightwards by more than $90 /2 = 45$cm. This can happen in only one way, namely that the robot performed five right moves.
  - The robot falls off the top edge if the sequence makes it move upwards by more than $70/2 = 35$cm. This can happen in two ways:
    - The robot falls at step 4, meaning the sequence starts with `UUUU`, and ends with any move. There are thus $1 dot 4 = 4$ ways for this to happen.
    - The robot falls at step 5, which means the sequence ends with `U`.
      The sequence cannot contain any `D`, because otherwise the robot can only reach $30$cm.
      The first four moves must then contain three `U` and one of `L` or `R`. There are thus $1 dot 2 dot 4! / (3! dot 1!) = 8$ such sequences, where we identified permutations with groups of identical elements.

      By the sum rule, this gives $4 + 8 = 12$ ways to fall off the top edge.

  So, finally, there are $2 dot 1 + 2 dot 12 = 26$ sequences to exclude, so by inclusion-exclusion, the final count is $4^5 - 26$.

=

+
  - Basis step:  for $k=1$, there is only one solution which is $x_1=n$, and $binom(n+1-1, 1-1) = binom(n, 0) = 1$, so ok.
  - Inductive step: let's assume that for a given $k >= 1$, the equation admits $binom(n+k-1, k - 1)$ solutions.
    Let us now consider the equation
    $
      x_1 + x_2 + dots + x_(k+1) = n,
    $
    where $0 <= x_(k+1) <= n$. It is equivalent to
    $
      x_1 + x_2 + dots + x_k = n - x_(k+1)
    $
    So we know, by the inductive hypothesis, that this equation admits $binom(n - x_(k+1) + k - 1, k - 1)$ solutions, for a given $x_(k+1)$.
    By the sum rule, we then know that the equation admits
    $
      sum_(i=0)^n binom(n - i + k - 1, k - 1)
    $
    solutions in total.
    Using the provided identity, we then now that the number of solutions is
    $
      binom(n+k, k) = binom(n + (k+1) - 1, (k+1) - 1).
    $
    So the result holds for $k+1$ variables too.

  By induction, this count thus holds for any $k >= 1$.


+ This is equivalent to solving the following equation:
  $
    5 (x_1 + x_2 + dots + x_9) = 100 <=> x_1 + x_2 + dots + x_9 = 20
  $
  where each $x_i >= 1$.
  We introduce the change of variable $y_i = x_i - 1$ to transform the equation into
  $
    y_1 + dots + y_9 = 20 - 9 = 11
  $
  Using the result from above, the answer is thus
  $
    binom(11 + 9 - 1, 9 - 1) = binom(19, 8).
  $

=

+ The recurrence means that people involved in the scheme quadruple from one day to the next, so for instance, each person invites 3 others on average ($4 a_(n-1)$), but also that each person which has been involved for 2 days already tells 2 others that this is a scam and they should leave, on average ($-3 a_(n-2)$), and finally that on every day $n$, if $n$ is even $n$ new persons join the scheme, but if is odd $n$ persons leave it.

+ We insert $a_n^((p))$ into the recurrence and get that for all $n >= 3$:
  $
    A n + B = -4 (A (n-1) + B) -3 (A (n-2) + B) + n \
    <=> (8 A - 1) n + (8 B - 10 A) = 0 \
    => A = 1/8, B = 5 / 32
  $

+ The whole solution $(a_n)$ is then such that $a_n = a_n^((h)) + a_n^((p))$, where $a_n^((h))$ is the solution of the corresponding homogeneous equation, which has characteristic roots such that:
  $
    x^2 - 4 x + 3 = 0 => x = 1 "or" x=3
  $
  Thus,
  $
    a_n^((h)) = alpha + beta 3^n
  $
  The full solution is therefore
  $
    a_n = alpha + beta 3^n + (n/8 + 5/32) (-1)^n
  $
  in which we plug the initial conditions to get that $alpha = -11/8, beta=39/32$
