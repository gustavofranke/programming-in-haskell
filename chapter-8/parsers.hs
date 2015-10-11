type Parser a = String -> [(a, String)]

-- the parser myReturn v 
-- always succeeds with the result value v, 
-- without consuming any of the input string
-- usage: parse (myReturn 1) "abc"
-- returns: [(1,"abc")]
myReturn :: a -> Parser a
myReturn v = \inp -> [(v, inp)]

-- the dual parser failure always fails,
-- regardless of the contents of the input string
-- usage: parse failure "abc"
-- returns: []
failure :: Parser a
failure = \inp -> []

-- the parser item, fails if the input string is empty, and
-- succeeds with the first character as the result value otherwise
-- usage: parse item "abc"
-- returns: [('a',"bc")]
-- usage: parse item ""
-- returns: []
item :: Parser Char
item = \inp -> case inp of
                    [] -> []
                    (x:xs) -> [(x, xs)]

parse :: Parser a -> String -> [(a, String)]
parse p inp = p inp

(>>=) :: Parser a -> (a -> Parser b) -> Parser b
p >>= f = \inp -> case parse p inp of
                       [] -> []
                       [(v, out)] -> parse (f v) out
