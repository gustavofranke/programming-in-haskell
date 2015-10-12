-- 1. Using library functions, define a function halve :: [a ] → ([a ], [a ]) that
-- splits an even-lengthed list into two halves. For example:
-- > halve [1, 2, 3, 4, 5, 6]
-- ([1, 2, 3], [4, 5, 6])
halve :: [a] -> ([a], [a])
halve xs = (take h xs, drop h xs)
             where h = length xs `div` 2

-- 2. Consider a function safetail :: [a ] → [a ] that behaves as the library
-- function tail , except that safetail maps the empty list to itself, whereas
-- tail produces an error in this case. Define safetail using:
-- (a) a conditional expression;
-- (b) guarded equations;
-- (c) pattern matching.
-- Hint: make use of the library function null.

-- 3. In a similar way to ∧, show how the logical disjunction operator ∨ can
-- be defined in four different ways using pattern matching.

-- 4. Redefine the following version of the conjunction operator using condi-
-- tional expressions rather than pattern matching:
-- True ∧ True = True
-- _ ∧ _       = False

-- 5. Do the same for the following version, and note the difference in the
-- number of conditional expressions required:
-- True ∧ b = b
-- False ∧ = False

-- 6. Show how the curried function definition mult x y z = x ∗ y ∗ z can be
-- understood in terms of lambda expressions.
mult :: Int -> (Int -> (Int -> Int))
mult x y z = x * y * z
