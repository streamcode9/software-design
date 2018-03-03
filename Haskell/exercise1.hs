data Nat = Zero | Succ Nat

instance Show Nat where
    show Zero = "0"
    show (Succ x) = "1" ++ show x

data Stream a = a :& Stream a

instance Show a => Show (Stream a) where
  show (h0 :& (h1 :& (h2 :& t))) = show h0 ++ "->" ++ show h1 ++ "->" ++ show h2

liftStream :: Int -> Stream Int
liftStream a = a :& foo a

unliftStream :: Stream Int -> Int
unliftStream (a :& b) = a

nats :: Nat -> Stream Nat
nats a = a :& nats (Succ a) 

constStream :: a -> Stream a
constStream a = a :& constStream a 

head' :: Stream a -> a
head' (h :& t) = h

tail' :: Stream a -> Stream a
tail' (h :& t) = t

(!!!) :: Stream a -> Int -> a
(!!!) (h :& t) 0 = h
(!!!) (h :& t) n = (!!!) t (n - 1)

take' :: Int -> Stream a -> [a]
take' 0 (h :& t) = []
take' n (h :& t) = h : (take' (n - 1) t)

map' :: (a -> b) -> Stream a -> Stream b
map' f (h :& t) = (f h) :& map' f t

filter' :: (a -> Bool) -> Stream a -> Stream a
filter' f (h :& t) = case (f h) of
  True -> h :& filter' f t
  _    -> filter' f t

zip' :: Stream a -> Stream b -> Stream (a, b)
zip' (h1 :& t1) (h2 :& t2) = (h1, h2) :& zip' t1 t2

zipWith' :: (a -> b -> c) -> Stream a -> Stream b -> Stream c 
zipWith' f (h1 :& t1) (h2 :& t2) = (f h1 h2) :& zipWith' f t1 t2
