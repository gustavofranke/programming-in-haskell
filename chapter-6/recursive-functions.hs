myProduct         :: Num a => [a ] -> a
myProduct [ ]      = 1
myProduct (n : ns) = n * myProduct ns

myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = 1 + myLength xs

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ££ [x]

(££) :: [a] -> [a] -> [a]
[] ££ ys = ys
(x:xs) ££ ys = x:(xs ££ ys)

insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys) | x <= y = x:y:ys
                | otherwise = y:insert x ys

isort :: Ord a => [a] -> [a]
isort [] = []
isort (x:xs) = insert x (isort xs)

myZip :: [a] -> [b] -> [(a, b)]
myZip [] _ = []
myZip _ [] = []
myZip (x:xs) (y:ys) = (x, y): myZip xs ys
