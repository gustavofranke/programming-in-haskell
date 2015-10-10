myConst :: a -> b -> a
myConst x _ = x

-- same one using lambdas
myConst' :: a -> (b -> a)
myConst' x = \_ -> x

odds :: Int -> [Int]
odds n = map f [0..n - 1]
         where f x = x * 2 + 1

-- same one using lambdas
odds' n = map (\x -> x * 2 + 1) [0..n - 1]
