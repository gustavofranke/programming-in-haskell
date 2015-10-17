-- 1. Define the exponentiation operator ↑ for non-negative integers using the
-- same pattern of recursion as the multiplication operator ∗, and show
-- how 2 ↑ 3 is evaluated using your definition.
(^^^) :: (Integral b, Num a) => a -> b -> a
a ^^^ 0 = 1
a ^^^ b = a * a ^^^ (b - 1)

-- 4. Define a recursive function merge :: Ord a ⇒ [a ] → [a ] → [a ] that
-- merges two sorted lists to give a single sorted list. For example:
-- > merge [2, 5, 6] [1, 3, 4]
-- [1, 2, 3, 4, 5, 6]
-- Note: your definition should not use other functions on sorted lists such
-- as insert or isort , but should be defined using explicit recursion.
merge      :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs 
merge [] ys = ys
merge (x:xs)(y:ys) | x <= y = x:merge xs (y:ys)
                   | x > y  = y:merge ys (x:xs)

-- 5. Using merge, define a recursive function msort :: Ord a ⇒ [a ] → [a ]
-- that implements merge sort, in which the empty list and singleton lists
-- are already sorted, and any other list is sorted by merging together the
-- two lists that result from sorting the two halves of the list separately.
-- Hint: first define a function halve :: [a ] → [([a ], [a ])] that splits a list
-- into two halves whose length differs by at most one.
halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort ys) (msort zs)
           where (ys, zs) = halve xs
