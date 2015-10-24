data Op = Add | Sub | Mul | Div
          deriving Show

validOld :: Op -> Int -> Int -> Bool
validOld Add _ _ = True
validOld Sub x y = x > y
validOld Mul _ _ = True
validOld Div x y = x `mod` y == 0

valid :: Op -> Int -> Int -> Bool
valid Add x y = x <= y
valid Sub x y = x > y
valid Mul x y = x /= 1 && y /= 1 && x <= y
valid Div x y = y /= 1 && x `mod` y == 0


apply :: Op -> Int -> Int -> Int
apply Add x y = x + y
apply Sub x y = x - y
apply Mul x y = x * y
apply Div x y = x `div` y

data Expr = Val Int | App Op Expr Expr
            deriving Show

values :: Expr -> [Int]
values (Val n)  = [n]
values (App _ l r) = values l ++ values r

eval :: Expr -> [Int]
eval (Val n) = [n | n > 0]
eval (App o l r) = [apply o x y | x <- eval l,
                                  y <- eval r,
                                  valid o x y]

-- usage:  eval (App Add (Val 2) (Val 3))
-- returns: [5]
-- usage: eval (App Sub (Val 2) (Val 3))
-- returns: []

-- subs returns all subsequences of a list
subs :: [a] -> [[a]]
subs [] = [[]]
subs (x:xs) = yss ++ map (x:) yss
              where yss = subs xs

-- interleave returns all possible ways of inserting a new element into a list
interleave :: a -> [a] -> [[a]]
interleave x [] = [[x]]
interleave x (y:ys) = (x:y:ys) : map (y:) (interleave x ys)

-- perms returns all permutations of a list
perms ::  [a] -> [[a]]
perms [] = [[]]
perms (x:xs) = concat (map (interleave x) (perms xs))

-- usage: subs [1,2,3]
-- returns: [[],[3],[2],[2,3],[1],[1,3],[1,2],[1,2,3]]
-- usage: interleave 1 [2,3,4]
-- returns: [[1,2,3,4],[2,1,3,4],[2,3,1,4],[2,3,4,1]]
-- usage: perms [1,2,3]
-- returns: [[1,2,3],[2,1,3],[2,3,1],[1,3,2],[3,1,2],[3,2,1]]

choices :: [a] -> [[a]]
choices xs = concat (map perms (subs xs))

-- usage: choices [1,2,3]
-- returns: [[],[3],[2],[2,3],[3,2],[1],[1,3],[3,1],[1,2],[2,1],[1,2,3],[2,1,3],[2,3,1],[1,3,2],[3,1,2],[3,2,1]]

solution :: Expr -> [Int] -> Int -> Bool
solution e ns n = elem (values e) (choices ns) && eval e == [n]

-- usage: solution (App Add (Val 2) (Val 3)) [1,3,7,10,25,50] 765
-- returns: False


-- Brute force solution
split :: [a] -> [([a], [a])]
split [] = []
split [_] = []
split (x:xs) = ([x], xs):[(x:ls,rs) | (ls, rs) <- split xs]

-- usage: split [1,2,3,4]
-- returns: [([1],[2,3,4]),([1,2],[3,4]),([1,2,3],[4])]

-- exprs, which returns all possible expressions whose list of values is precisely a given list
exprs :: [Int] -> [Expr]
exprs [] = []
exprs [n] = [Val n]
exprs ns = [e | (ls, rs) <- split ns,
                l <- exprs ls,
                r <- exprs rs,
                e <- combine l r]

combine :: Expr -> Expr -> [Expr]
combine l r = [App o l r | o <- ops]

ops :: [Op]
ops = [Add, Sub, Mul, Div]

solutions :: [Int] -> Int -> [Expr]
solutions ns n = [e | ns' <- choices ns,
                      e <- exprs ns',
                      eval e == [n]]

-- Combining generation and evaluation
type Result = (Expr, Int)
results :: [Int] -> [Result]
results [] = []
results [n] = [(Val n, n) | n > 0]
results ns = [res | (ls, rs) <- split ns,
                    lx <- results ls,
                    ry <- results rs,
                    res <- combine' lx ry]

combine' :: Result -> Result -> [Result]
combine' (l, x) (r,y) = [(App o l r, apply o x y) | o <- ops, valid o x y]

solutions' :: [Int] -> Int -> [Expr]
solutions' ns n = [e | ns' <- choices ns,
                       (e, m) <- results ns',
                       m == n]
-- usage:  solutions [1, 3, 7, 10, 25, 50] 765
-- returns: a very big list!!
