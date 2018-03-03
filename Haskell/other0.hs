-- (*>) :: (a -> m b) -> (b -> m c) -> (a -> m c)
instance Monoid msg => Kleisli (Writer msg) where 
  idK a = Writer (a, mempty) 
  f *> g = \a -> Writer $ case runWriter (f a) of
    (b, msgF) -> case runWriter (g b) of
      (c, msgG) -> (c, mappend msgF msgG)

(>>) :: (a -> b) -> (b -> c) -> (a -> c)
f >> g = \x -> g (f x)

const :: a -> b -> a
const a _ = a

($) :: (a -> b) -> a -> b
f $ a = (const a >> f) ()

(+>) :: Monoid msg => (a -> Writer msg b) -> (b -> c) -> (a -> Writer msg c)
f +> g = f *> (g >> idK)

(*$) :: Monoid msg => (a -> Writer msg b) -> Writer msg a -> Writer msg b
f *$ a = (const a *> f) ()

($$) :: Monoid msg => (Writer msg (a -> b)) -> Writer msg a -> Writer msg b
mf $$ ma = ( +$ ma) *$ mf

data Writer msg b = Writer (b, msg)

runWriter :: Writer msg b -> (b, msg)
runWriter (Writer a) = a

class Kleisli m where
  idK  :: a -> m a
  (*>) :: (a -> m b) -> (b -> m c) -> (a -> m c) 

class Monad m where
  return  :: a -> m a
  (>>=)   :: m a -> (a -> m b) -> m b

liftWriter :: Monoid msg => a -> (a -> b) -> msg -> Writer msg b
liftWriter a f m = Writer (f a, m)

foo :: (Num t, Num b) => b -> Writer [t] b
foo = \a -> liftWriter a (\x -> x + 2) [1]

goo :: (Num t, Num b) => b -> Writer [t] b
goo = \a -> liftWriter a (\x -> x * 2) [2]

instance Monoid msg => Monad (Writer msg) where
  return a = Writer (a, mempty)
  wtr >>= func = case (runWriter wtr) of
    (a, msg) -> (func a)

-- fmap :: (a -> b) -> f a -> f b
instance Monoid msg => Functor (Writer msg) where
  fmap f fa = fa >>= (\a -> return $ f a)

-- <*> :: f (a -> b) -> f a -> f b
instance Monoid msg => Applicative (Writer msg) where
  pure = return
  ff <*> fa = ( +$ fa) *$ ff

main = runWriter ((foo 100) >>= goo)

-- ------------------------------------------------------------------------------

Холомьёв - монады - линзы - схемы рекурсии - свободные конструкции - Generic/Typable - Template Haskell

------------------------------------------------------

ghci: перекомпиляцию или типы смотрю (:i Category) или быстрее пробовать несколько вариантов

можно одну функцию на исполнение запустить, не дергая весь проект

------------------------------------------------------

рекурсии и паттернах и дырках

------------------------------------------------------

слева же у нас деконструкторы синонимов (паттерны) а справа их конструкторы (конструкторы данных)

------------------------------------------------------

рекурсия - это стиль "паттерны текущего уровня слева"
```hs
fac 0 = 1
fac n = n * fac (n-1)
```
------------------------------------------------------

а корекурсия - это стиль "конструкторы текущего справа"
```hs
map f (h:t) = f h : map f t
map f [] = []
```
------------------------------------------------------
```hs
foo = 1 : foo


data Stream a = Stream a (Stream a)

data St a b = St (a -> b) (Stream a)

toList :: Stream a -> [a]
toList (Stream a b) = a : toList b

foo = Stream 9 foo



main :: IO ()
main = putStrLn (show (take 5 $ toList foo))
```

------------------------------------------------------
```hs
data Stream a = Stream a (Stream a)

data St a b = St (a -> b) (Stream a)

toList :: Stream a -> [a]
toList (Stream a b) = a : toList b

fromList :: [a] -> Stream a
fromList (x : xs) = Stream x (fromList xs)

foo = Stream 9 foo



main :: IO ()
main = putStrLn (show (take 5 $ toList (fromList [99..])))
```

видно что `fromList` и `toList` это рекурсия и корекурсия одновременно

в `toList` справа не все альтернативы для списка. только `(:)` а `[]` нет

----

корекурсивное создание стрима

```hs
foo = go _ where
   go _ = Stream _ $ go _

foo = go _ where
   go _ = (:) _ $ go _
```

----

```hs
foo = go _ where
   go _ =  _ : go _
-- Exersise: generate list 1.. and Stream with this skeleton

foo = go 0 where go x = x : go (x + 1)
foo = go 0 where go a = Stream a (go (a + 1))
```

----

```hs
-- lib co-recursion
foo = ana go _ where
   go _ = Cons _ _

-- recursion
foo x = go x where
   go (h : t) = _ (go t)
   go [] = _

-- lib recursion
foo x = cata go x where
   go (Cons h t) = _
   go Nil  = _
```

----
```hs
-- 1. Переписать через fix
fix f = f (fix f)
fix1 f = \x -> f (fix f) x
fix2 f x = f (\x1 -> fix2 f x1) x
--sumInt :: Int -> Int
--sumInt 0 = 0
--sumInt n = n + sumInt (n-1)
-- if is a bad style use case..of or local equation system (where)
sumInt n = fix (\f x acc -> if x == 0 then acc else f (x - 1) (x + acc)) n 0

-- sumInt n = fix sum n 0 where
-- а саму sum можно уже либо лямбдой и кейсом, либо функцией и кейсом, либо системой уравнений

-- Вариант с лямбдой и кейсом
sumInt n = fix sum n 0 where
  sum = \f x acc -> case x of
    0 -> acc
    _ -> f (x - 1) (x + acc)

-- Вариант с ф-цией и кейсом
sum = \f x acc -> case x of
  0 -> acc
  _ -> f (x - 1) (x + acc)

-- Вариант с локальным уравнением
sumInt n = fix sum n 0 where
  sum f 0 acc = acc
  sum f x acc = f (x - 1) (x + acc)


-- 2. Написать инстанс функтора
data NatF a = ZeroF | SuccF a

instance Functor NatF where
  fmap f ZeroF = ZeroF
  fmap f (SuccF a) = SuccF (f a)


-- 3. Реализовать map для списков через foldr
map :: (a -> a) -> [a] -> [a]
map f xs = foldr (\x y -> f x : y) [] xs


-- 4. Cумма элементов списка фолдром
sum :: Num a => [a] -> a
sum xs = foldr (\x y -> x + y) 0 xs

```

----

когда у нас сигнатура Nat a - это на самом деле forall a . Nat a

или вот map :: a -> b -> [a] -> [a]

это forall a . forall b . a -> b -> [a] -> [a]

а forall это дженерики, типа

template <typename a, typename b> ...

```hs
data NatF a = ZeroF | SuccF a

-- bad
instance Show (NatF Num) where
  show ZeroF = "0"
  show (SuccF x) = "1"

-- good
instance (Show a) => Show (NatF a) where
  show ZeroF = "0"
  show (SuccF x) = "1" ++ show x
```

Num это же тайпкласс - его нельзя параметром в конструктор типа передавать.

`instance Num a => Show (NatF a) where`

`а` это не `Num`, а тип для которого определен инстанс `Num`. `a` is a member of `Num`. входит в класс типов Num

но можно реализовать интерфейс для типа отдельно от определения типа, хоть в другом модуле
в C# всё же если класс реализует интерфейс, то это видно в определении класса, а тут они отвязаны друг от друга.
Т.е. ты можешь свой класс типов определить и например написать инстанс для Int.
ну в С# допустим есть библиотечный класс String и ты не можешь реализовать для него новый интерфейс, а в хаскеле запросто.

```hs
class ISome a where 
    foo :: a -> Int

instance ISome String where
    foo = length
```

классы типов в хаскеле.
называть их классами не стоит так же как не стоит джаваскрипт джавой называть.
класс типов = множество типов.
Логически тип является членом такого-то множества, а методы это типа доказательство, что аксиомы множества выполняются для этого типа и значит он является членом.

----

`data Nat a = Zero | Succ a (Nat a)`

* Nat - type constructor
* Zero и Succ - value constructors

тут важно что слева у нас всегда value constructor, а справа может быть как value constructor так и type constructor

`data Nat a = Zero | Nat a (Nat a)`

`data Nat a = Zero | Nat a`

в первом случае у нас справа 2 разных Nat - один это объявление конструктора, имя которого просто случайно совпадает с именем типа, а второй это имя типа. Первый Nat это value constructor c двумя аргументами, а второй type constructor с одним.

Т.е. справа в первом случае есть два ната, один из которых type constructor а другой value constructor,
а во втором случае у нас справа Nat один, но это не тот же Nat что слева, т.к. слева type, а справа value. 
Поэтому второй тип нерекурсивный, хоть Nat там с двух сторон



----

