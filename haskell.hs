--------------------------------------
-- Header

module SomeModuleName(someMethodDefinition, OutputTypeName) where

import SomeImportedModuleName0
import SomeImportedModuleName1(someImportedMethodName)


---------------------------------------
-- Definitions (types, values, type classes, type class instances) 

-- Alternatives enumeration = types sum
data OutputTypeName = Up | Down

data [a] = [] | a : [a]

someMethodDefinition :: InputTypeName -> OutputTypeName
someMethodDefinition x = Up 

data Day = Day Int

-- Type consist of sub types -> constructor at first place and then sub types = types product
data Date = Date Year Month Day

-- Notice: if type has two sub types, we can give symbolic name to constructor instead of letter,
-- but it must start from (:) symbol
data MyType = Sub1 :+ Sub2

-- Combined type with sum and product
data Type = Name1  Sub11  Sub12 | Name2  Sub21  Sub22

class Group a where
    e   :: a
    (+) :: a -> a -> a
    inv :: a -> a

instance Group Bool where
    e       = True
    (+) a b = and a b
    inv a   = not a

twice :: Group a => a -> a
twice a = a + a

-- (Group a, Eq a) is type definition/decclaration context
isE :: (Group a, Eq a) => a -> Bool
isE x = (x == e)

-- 'a' is a type class context
class IsPerson a
-- IsPerson is super class for HasName
class IsPerson a => HasName a where
    name :: a -> String


--------------------------------------
-- Control.Monad.Except

throwError :: e -> m a
catchError :: m a -> (e -> m a) -> m a

catchError foo throwError = foo


--------------------------------------
-- Control.Monad

(>=>) :: Monad m => (a -> m b) -> (b -> m c) -> a -> m c
(<=<) :: Monad m => (b -> m c) -> (a -> m b) -> a -> m c


--------------------------------------
-- Code style

-- Use (>=>), (<=<) and (.) to build one-directional stream (produce eta reduction)
-- It assumes using compositional style instead of applicative
-- более модульно писать = именовать промежуточные операции (вместо именования промежуточных значений)
-- не лепить одну большую непонятную операцию там, где можно сделать композицию двух маленьких понятных
-- если левая и правая половина (например списка таплов) обрабатывеются единообразно, то из кода этого должно быть видно (не смешивать единообразную часть с отличающейся)
-- Get rid of the parentheses where it is possible
-- The equation style sometimes is better than case..of
-- Try to avoid recursion it it is possible to use map or other functions
-- Use monoids for accumulation
-- Use MonadError to report errors
-- Keep abstract parts of program in the library (src folder)

--------------------------------------
-- Anti-patterns

-- If you know that there are Right values only use specific function like mapMaybe instead of manual map
map (\(Right x) -> x) xs


--------------------------------------
-- Patterns

-- Go pattern for the cycles
foo bar baz quux = go where
    go = ... >> go


--------------------------------------
-- Partial application = currying
fun :: a1 -> a2 -> a3 -> a4 -> res = fun :: a1 -> (a2 -> (a3 -> (a4 -> res)))
fun a b c d                        = (((fun a) b) c) d

-- Partial application for infix style functions
let minus = (-)
(2 `minus` ) 1 =  1 -- right section
( `minus` 2) 1 = -1 -- left  section

-- Recursive types
data Nat = Zero | Succ Nat

data [a] = [] | a : [a]


--------------------------------------
-- Элиминаторы (они же катаморфизмы или свёртки)

either :: (a -> c) -> (b -> c) -> Either a b -> c

maybe :: b -> (a -> b) -> Maybe a -> b

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f z []     = z 
foldr f z (x:xs) = f x (foldr f z xs)

foldl :: (a -> b -> b) -> b -> [a] -> b
foldl f z []     = z                  
foldl f z (x:xs) = foldl f (f z x) xs


--------------------------------------
-- Равенства

fmap == (<$>) == map
foo >>= return . bar == bar <$> foo
\bar -> foo bar >>= baz = foo >=> baz

-- Desugar 'do notation'
do { foo <- bar ; baz } = bar >>= \foo -> baz 

-- Eta-reduce
\foo -> bar foo = bar 

--------------------------------------
-- Project structure
-- Stack creates next folders struture:
-- app 
-- src - the idea of the library is that it's the code which is tested (and thus shared between exe and test suite)
-- test


--------------------------------------
-- Functions composition

(.) :: (b -> c) -> (a -> b) -> (a -> c)
f . g = \x -> f (g x)

(>>) :: (a -> b) -> (b -> c) -> (a -> c)
f >> g = \x -> g (f x)

-- To generalize the function definition like (a -> b)
class Category cat where
    id   :: cat a a
    (>>) :: cat a b -> cat b c -> cat a c

instance Category (->) where
    id      = \x -> x
    f >> g  = \x -> g (f x)

-- Kleisli category for special functions like (a -> m b)
class Kleisli m where
    idK  :: a -> m a
    (*>) :: (a -> m b) -> (b -> m c) -> (a -> m c) 

instance Kleisli Maybe where
    idK    = Just
    f *> g = f >> maybe Nothing g

instance Kleisli [] where
    idK     = \a -> [a]
    f *> g  = f >> map g >> concat

(+>) :: Kleisli m => (a -> m b) -> (b -> c) -> (a -> m c)
f +> g = f *> (g >> idK)


--------------------------------------
-- Functions apptrlication

($)  :: (a ->   b) ->   a ->   b
(*$) :: (a -> m b) -> m a -> m b
(+$) :: (a ->   b) -> m a -> m b
(+$) = lift1

($$) :: Kleisli m => m (a -> b) -> m a -> m b
mf $$ ma = ( +$ ma) *$ mf

lift2 :: Kleisli m => (a -> b -> c) -> m a -> m b -> m c
lift2 f a b = lift1 f a $$ b

class Functor f where
    fmap :: (a -> b) -> f a -> f b

class Functor f => Applicative f where
    pure    :: a -> f a
    (<*>)   :: f (a -> b) -> f a -> f b

class Monad m where
  return :: a -> m a
  (>>=)  :: m a -> (a -> m b) -> m b


