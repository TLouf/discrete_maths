#import "../../../assets/exam_template.typ": *

#show: doc => exam(
  [Discrete Mathematics],
  [Bachelor in Artificial Intelligence],
  datetime(year: 2026, month: 4, day: 10),
  is_final: false,
  checksum: false,
  doc,
)

_Explain all the answers and counting principles used. Answers can be written as products of powers, factorials and binomial coefficients. No need to compute their final numerical value. You have a maximum of 90 minutes to hand in your exam._


=

A robot moves on a table, making a sequence of 5 moves, each move being one of:
```
Up (U), Down (D), Left (L), Right (R)
```

#q(5)[How many sequences can the robot perform without going left?]

#q(5)[
  How many sequences end at the starting position?
]

#q(10)[
  How many sequences contain exactly two changes of direction
  (for instance: `UUU RR U` has two changes)?
]

#q(15)[
  Let's now assume the table is 90cm long along the left-right axis, and 70cm long along the up-down axis.
  Knowing that each move is 10cm long and that the robot always starts a sequence from the centre of the table, how many distinct sequences which do not make it fall off the table can it perform?
]

=

#q(15)[
  Considering a fixed $n in NN$, prove that the number of non-negative integer solutions to
  $
    x_1 + x_2 + dots + x_k = n
  $
  is $binom(n+k−1, k-1)$, using an induction on $k$.
  _Hint_: you can use the following identity without proving it:
  $
    sum_(i=0)^n binom(n - i + k - 1, k - 1) = binom(n+k, k)
  $
]

#q(15)[
  There are 9 questions on a discrete mathematics exam. How many ways are there to assign scores to the questions if the sum of the scores is 100 and each question is worth a non-zero multiple of 5 points?
]

=

A sequence $(a_n)_(n in NN)$ models the number of persons involved in a pyramid scheme on each day $n$ as
$
  forall n >=2, a_n = 4 a_(n-1) - 3 a_(n-2) + n (-1)^n.
$
Also, on day 0, no one was involved, and on day 1, only two were.

#q(5)[
  Give an interpretation of each component of the recurrence relation, in plain words.
]

#q(10)[
  Find the constants $A$ and $B$ such that $a_n^((p)) = (A n + B) (-1)^n$ is a solution of this equation.
]

#q(20)[
  Solve the recurrence relation.
]
