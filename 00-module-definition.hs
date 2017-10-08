--------------------------------------
-- Header

module SomeModuleName(someMethodDefinition, OutputTypeName) where

import SomeImportedModuleName0
import SomeImportedModuleName1(someImportedMethodName)

---------------------------------------
-- Definitions (types, values, type classes, type class instances) 

data OutputTypeName = Up | Down

data [a] = [] | a : [a]

someMethodDefinition :: InputTypeName -> OutputTypeName
someMethodDefinition x = Up 

data Day = Day Int

data Date = Date Year Month Day


--------------------------------------
-- Control.Monad.Except

throwError :: e -> m a
catchError :: m a -> (e -> m a) -> m a

catchError foo throwError = foo


-- Desugar 'do notation'
do { foo <- bar ; baz } = bar >>= \foo -> baz


-- Eta-reduce
\foo -> bar foo = bar


--------------------------------------
-- Control.Monad

(>=>) :: Monad m => (a -> m b) -> (b -> m c) -> a -> m c
(<=<) :: Monad m => (b -> m c) -> (a -> m b) -> a -> m c


--------------------------------------
-- Code style

-- 1) Use (>=>), (<=<) and (.) to build one-directional stream






