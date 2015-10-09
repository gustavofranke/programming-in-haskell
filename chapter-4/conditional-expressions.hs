myAbs :: Int -> Int
myAbs n = if n >= 0 then n else -n

mySignum :: Int -> Int
mySignum n = if n < 0 then -1 else
             if n == 0 then 0 else 1

-- Guarded Equations
myAbsGuarded :: Int -> Int
myAbsGuarded n | n >= 0    = n
               | otherwise = -n

mySignumGuarded :: Int -> Int
mySignumGuarded n | n < 0     = -1
                  | n == 0    = 0
                  | otherwise = 1
