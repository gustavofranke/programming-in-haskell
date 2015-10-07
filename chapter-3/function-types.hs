add      :: (Int, Int) -> Int
add(x, y) = x + y

-- Curried functions
add'    :: Int -> (Int -> Int) 
add' x y = x + y

zeroto  :: Int -> [Int]
zeroto n = [0..n]
