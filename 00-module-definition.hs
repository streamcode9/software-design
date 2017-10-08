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


