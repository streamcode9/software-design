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
-- Desugar 'do notation'
do { foo <- bar ; baz } = bar >>= \foo -> baz


--------------------------------------
-- Eta-reduce
\foo -> bar foo = bar


--------------------------------------
-- Control.Monad

(>=>) :: Monad m => (a -> m b) -> (b -> m c) -> a -> m c
(<=<) :: Monad m => (b -> m c) -> (a -> m b) -> a -> m c


--------------------------------------
-- Code style

-- 1) Use (>=>), (<=<) and (.) to build one-directional stream
-- 2) более модульно писать = именовать промежуточные операции (вместо именования промежуточных значений)
-- 3) не лепить одну большую непонятную операцию там, где можно сделать композицию двух маленьких понятных


--------------------------------------
-- Anti-patterns

-- If you know that there are Right values only use specific function like mapMaybe instead of manual map
map (\(Right x) -> x) xs


--------------------------------------
-- Partial application = currying
fun :: a1 -> a2 -> a3 -> a4 -> res = fun :: a1 -> (a2 -> (a3 -> (a4 -> res)))
fun a b c d                        = (((fun a) b) c) d


