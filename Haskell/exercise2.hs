-- This type stores function for value stream transformation
data St a b = St (a -> (b, St a b))

class Category cat where
  id  :: cat a a
  (.) :: cat b c -> cat a b -> cat a c

instance Category (St) where
  id = St (\a -> (a, id))
  (.) g f = liftSt (\x -> unliftSt g $ unliftSt f x)

ap :: St a b -> [a] -> [b]
ap (St f) [] = []
ap (St f) (h : t) = case (f h) of (b, _) -> b : ap (St f) t

liftSt :: (a -> b) -> St a b
liftSt f = St (\x -> (f x, liftSt f))

unliftSt :: St a b -> a -> b
unliftSt (St f) = \x -> case (f x) of (y, _) -> y

(!!!) s 0 = \x -> x
(!!!) s n = \x -> (!!!) s (n - 1) (unliftSt s x)
  
take' 0 _ = \x -> []
take' n (St f) = \x -> case (f x) of (y, _) -> y : take' (n - 1) (St f) y

main = ap (liftSt (\x -> x + 10)) [0, 1, 2] 
