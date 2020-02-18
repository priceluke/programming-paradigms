import Data.List

step :: [ Int ] -> String -> [ Int ]
step ( x2 : x1 : xs ) "+" = x1 + x2 : xs
step ( x2 : x1 : xs ) "-" = x1 - x2 : xs
step ( x2 : x1 : xs ) "*" = x1 * x2 : xs
step xs t = ((read t) :: Int) : xs


rpn :: [String] -> Int
rpn = head . foldl' step []

pn :: [ String ] -> Int
pn = head . foldr pn_step []

pn_step "+" ( x1 : x2 : xs ) = x1 + x2 : xs
pn_step "-" ( x1 : x2 : xs ) = x1 - x2 : xs
pn_step "*" ( x1 : x2 : xs ) = x1 * x2 : xs
pn_step num xs = ((read num) :: Int) : xs

recursive_rpn :: String -> Int
recursive_rpn = head . foldl' step [] . words


custom_fold f z [] = z
custom_fold f z ( x : xs ) = custom_fold f ( f z x ) xs

rpnRec :: [ String ] -> Int
rpnRec = head . custom_fold step []

step3 :: [ Int ] -> String -> Maybe [ Int ]
step3 ( b : a : xs ) "+" = Just ( a + b : xs )
step3 ( b : a : xs ) "-" = Just ( a - b : xs )
step3 ( b : a : xs ) "*" = Just ( a * b : xs )
step3 _ "+" = Nothing
step3 _ "-" = Nothing
step3 _ "*" = Nothing
step3 xs num = Just (read num : xs)

rpn3:: [String] -> RPNOut
rpn3 = rpn_state []


rpn_state [x] [] = Success x
rpn_state [] [] = Stuck [] []
rpn_state stack [] = Incomplete stack
rpn_state stack input@ ( x : xs ) =
  case step3 stack x of
    Nothing -> Stuck stack input
    Just stack -> rpn_state stack xs

data RPNOut = Success Int  | Stuck [Int] [String]  | Incomplete [Int]  deriving (Show)

summation :: [Int] -> [Int]
summation stack = [sum stack]

product_function :: [Int] -> [Int]
product_function stack = [product stack]

fib_function :: [Int] -> [Int]
fib_function = map fib

fact_function :: [Int] -> [Int]
fact_function = map fac

exts :: String -> Maybe ([ Int ] -> [ Int ])
exts "sum" = Just (summation)
exts "prod" = Just (product_function)
exts "fib" = Just (fib_function)
exts "fact" = Just (fact_function)

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

fac :: Int -> Int
fac n = foldl(*) 1 [1..n]

rpn4 :: ( String -> Maybe ([ Int ] -> [ Int ])) -> [ String ] -> Int
rpn4 user_bool = head . foldl step4 []

step4 stack user_defined_string =
  if (user_defined_string `elem` ["sum", "prod", "fact", "fib"]) then
    case exts user_defined_string of
    Just user_defined_function -> user_defined_function stack
  else
    step stack user_defined_string
