twice :: (a -> a) -> a -> a
twice f x = f (f x)

-- processing lists
myMap :: (a -> b) -> [a] -> [b]
myMap f xs = [f x | x <- xs]

myMap' :: (a -> b) -> [a] -> [b]
myMap' f [] = []
myMap' f (x:xs) = f x:map f xs

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p xs = [x | x <- xs, p x]

myFilter' :: (a -> Bool) -> [a] -> [a]
myFilter' p [] = []
myFilter' p (x:xs) | p x = x:myFilter' p xs
                   | otherwise = myFilter' p xs

sumSqrEven :: [Int] -> Int
sumSqrEven ns = sum (map (^2) (myFilter' even ns))
