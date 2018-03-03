fix :: (a -> a) -> a
fix f = let x = f x in x

map' f xs = fix go f xs where
  go f _ [] = []
  go f g (h : t) = (g h) : f g t

fold' f x xs = fix go f x xs where
  go next _ x [] = x
  go next f x (h : t) = f h (next f x t)

main = fold' (\x y -> x + y) 0 [1, 2, 3, 4]
