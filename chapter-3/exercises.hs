-- 1. What are the types of the following values?
-- ['a', 'b', 'c'] :: [Char]
-- ('a', 'b', 'c') :: (Char, Char, Char)
-- [(False , 'O'), (True, '1')] :: [(Bool, Char)]
-- ([False , True ], ['0', '1']) :: ([Bool], [Char])
-- [tail , init , reverse ] :: [[a] -> [a]]

-- 2. What are the types of the following functions?
second xs = head (tail xs) -- second :: [a] -> a
swap (x , y) = (y, x)      -- swap :: (t1, t) -> (t, t1)
pair x y = (x , y)         -- pair :: t -> t1 -> (t, t1)
double x = x * 2           -- double :: Num a => a -> a
palindrome xs = reverse xs == xs -- palindrome :: Eq a => [a] -> Bool
twice f x = f (f x )       -- twice :: (t -> t) -> t -> t
-- Hint: take care to include the necessary class constraints if the functions
-- are defined using overloaded operators.

-- 3. Check your answers to the preceding two questions using Hugs.

-- 4. Why is it not feasible in general for function types to be instances of the
-- Eq class? When is it feasible? Hint: two functions of the same type are
-- equal if they always return equal results for equal arguments.
