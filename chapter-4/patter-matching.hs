myNot :: Bool -> Bool
myNot False = True
myNot True  = False

first :: (a, b) -> a
first (x, _) = x
second :: (a, b) -> b
second (_, y) = y

threeCharsBeginsWithA :: [Char] -> Bool
threeCharsBeginsWithA ['a', _, _] = True
threeCharsBeginsWithA _ = False

anyNbrBeginsWithA :: [Char] -> Bool
anyNbrBeginsWithA ('a' : _) = True
anyNbrBeginsWithA _ = False

myNull :: [a] -> Bool
myNull [] = True
myNull (_:_) = False

myHead :: [a] -> a
myHead (x:_) = x

myTail :: [a] -> [a]
myTail (_:xs) = xs

