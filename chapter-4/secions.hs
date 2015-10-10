myAnd :: [Bool] -> Bool
myAnd = foldr (&&) True
