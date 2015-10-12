-- 1. Parenthesise the following arithmetic expressions:
-- 2 ↑ 3 ∗ 4 :::: 2^3 * 4
-- 2 ∗ 3+4 ∗ 5 :::: (2 * 3) + ( 4 * 5)
-- 2+3 ∗ 4 ↑ 5 :::: 2 + (3 * 4^5)

-- 2. Work through the examples from this chapter using Hugs.
-- Done!

-- 3. The script below contains three syntactic errors. Correct these errors
-- and then check that your script works properly using Hugs.
n :: Int
n = a `div` length xs
    where
      a = 10
      xs = [1, 2, 3, 4, 5]

-- 4. Show how the library function last that selects the last element of a non-
-- empty list could be defined in terms of the library functions introduced
-- in this chapter. Can you think of another possible definition?
myLast :: [Int] -> Int
myLast as = head (reverse as)

-- 5. Show how the library function init that removes the last element from
-- a non-empty list could similarly be defined in two different ways.
myInit :: [Int] -> [Int]
myInit xs = reverse (tail (reverse xs))
