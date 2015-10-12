-- 1. Give another possible calculation for the result of double (double 2).
myDouble :: Int -> Int
myDouble x = 2 * x

-- 2. Show that sum [x ] = x for any number x .
sumShow :: Int -> Bool
sumShow x | sum [x] == x = True
          | otherwise = False

-- 3. Define a function product that produces the product of a list of numbers,
-- and show using your definition that product [2, 3, 4] = 24.
prod :: [Int] -> Int
prod [] = 1
prod (x:xs) = x * prod xs

-- 4. How should the definition of the function qsort be modified so that it
-- produces a reverse sorted version of a list?
qsort :: Ord a => [a] -> [a]
qsort[] = []
qsort(x:xs) = qsort larger ++ [x] ++ qsort smaller 
              where
                smaller = [a | a <- xs, a <= x]
                larger  = [b | b <- xs, b > x]
-- 5. What would be the effect of replacing by < in the definition of qsort?
-- Hint: consider the example qsort [2, 2, 3, 1, 1].
-- Answer: it will eliminate dups
