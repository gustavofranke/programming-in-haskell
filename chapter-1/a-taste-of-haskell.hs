mySum :: Num a => [a] -> a
mySum [] = 0
mySum (x : xs) = x + mySum xs

qsort :: Ord a => [a] -> [a]
qsort[] = []
qsort(x:xs) = qsort smaller ++ [x] ++ qsort larger
              where
                smaller = [a | a <- xs, a <= x]
                larger  = [b | b <- xs, b > x]
