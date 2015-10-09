isDigit :: Char -> Bool
isDigit c = c >= '0' && c <= '9'

myEven :: Integral a => a -> Bool
myEven n = n `mod` 2 == 0

mySplitAt :: Int -> [a] -> ([a], [a])
mySplitAt n xs = (take n xs, drop n xs)

recip :: Fractional a => a -> a
recip n = 1 / n
