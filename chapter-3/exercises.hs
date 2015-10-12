-- 1. What are the types of the following values?
-- ['a', 'b', 'c']
-- ('a', 'b', 'c')
-- [(False , 'O'), (True, '1')]
-- ([False , True ], ['0', '1'])
-- [tail , init , reverse ]

-- 2. What are the types of the following functions?
second xs = head (tail xs)
swap (x , y) = (y, x)
pair x y = (x , y)
double x = x * 2
palindrome xs = reverse xs == xs
twice f x = f (f x )
-- Hint: take care to include the necessary class constraints if the functions
-- are defined using overloaded operators.

-- 3. Check your answers to the preceding two questions using Hugs.

-- 4. Why is it not feasible in general for function types to be instances of the
-- Eq class? When is it feasible? Hint: two functions of the same type are
-- equal if they always return equal results for equal arguments.
