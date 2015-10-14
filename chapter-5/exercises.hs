-- 1. Using a list comprehension, give an expression that calculates the sum
-- 1^2 + 2^2 + . . . 100^2 of the first one hundred integer squares.
sqUpTo100 :: [Int]
sqUpTo100 = [x^2 | x <- [1 .. 100]]

-- 2. In a similar way to the function length, show how the library function
-- replicate :: Int → a → [a ] that produces a list of identical elements can
-- be defined using a list comprehension. For example:
-- > replicate 3 True
-- [True, True, True ]
myReplicate :: Int -> a -> [a]
myReplicate n z = [z | x <- [1 .. n]]

-- 3. A triple (x, y, z) of positive integers can be termed pythagorean if x^2 +
-- y^2 = z^2 . Using a list comprehension, define a function pyths :: Int →
-- [(Int, Int, Int )] that returns the list of all pythagorean triples whose
-- components are at most a given limit. For example:
-- > pyths 10
-- [(3, 4, 5), (4, 3, 5), (6, 8, 10), (8, 6, 10)]
pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x,y,z) | x <- [1 .. n], y <- [1 .. n], z <- [1 .. n], x^2 + y^2 == z^2]

-- 4. A positive integer is perfect if it equals the sum of its factors, excluding
-- the number itself. Using a list comprehension and the function factors,
-- define a function perfects :: Int → [Int ] that returns the list of all perfect
-- numbers up to a given limit. For example:
-- > perfects 500
-- [6, 28, 496 ]
factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

perfects :: Int -> [Int ]
perfects n = [x | x <- [1 .. n], sum (init (factors x)) == x]

-- 5. Show how the single comprehension [(x , y) | x ← [1, 2, 3], y ← [4, 5, 6]]
-- with two generators can be re-expressed using two comprehensions with
-- single generators. Hint: make use of the library function concat and nest
-- one comprehension within the other.
a = concat [[(x , y) | y <- [4, 5, 6]] | x <- [1, 2, 3]]

-- 6. Redefine the function positions using the function find .

-- 7. The scalar product of two lists of integers xs and ys of length n is given
-- by the sum of the products of corresponding integers: 
--
-- n−1
-- sigma (xs i ∗ ys i )
-- i=0
--
-- In a similar manner to the function chisqr , show how a list comprehen-
-- sion can be used to define a function scalarproduct :: [Int ] → [Int ] → Int
-- that returns the scalar product of two lists. For example:
-- > scalarproduct [1, 2, 3] [4, 5, 6]
-- 32
--
scalarproduct :: [Int] -> [Int] -> Int
scalarproduct xs ys = sum [(x * y) | x <- xs, y <- ys]

-- 8. Modify the Caesar cipher program to also handle upper-case letters.
