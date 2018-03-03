import Types
import Control.Monad
import Data.Map
import Data.STRef
import Control.Monad.ST

-- ~~~ ~~~ ~~~ ~~~ ~~~ ~~~ ~~~ ~~~ ~~~

type Mem a = Map a Int

new :: Int -> State (Map String Int) String
new a = State $ \s -> ("memory", fromList [("memory", a)])

write :: String -> Int -> State (Map String Int) ()
write k v =
    let f x = Just v        
    in (State $ \s -> ((), update f k s))

read' :: String -> State (Map String Int) Int
read' k = State $ \s -> (s ! k, s)

fun :: Int -> State (Map String Int) Int
fun arg = State $ \s0 -> 
    let (mem, s1)   = runState (new arg)          s0
        ((),  s2)   = runState (write mem arg)    s1
        (x,   s3)   = runState (read' mem)        s2   
        y           = x + 100        
        ((),  s4)   = runState (write mem y)      s3
        (z,   s5)   = runState (read' mem)        s4
    in (z, s5)

-- ~~~ ~~~ ~~~ ~~~ ~~~ ~~~ ~~~ ~~~ ~~~

result = runST $ do
    ref <- newSTRef 5
    writeSTRef ref 10
    readSTRef ref

result2 = runST $ newSTRef 5 >>= (\ref -> writeSTRef ref 10 >> readSTRef ref)

-- ~~~ ~~~ ~~~ ~~~ ~~~ ~~~ ~~~ ~~~ ~~~

main = print $ runState (fun 1) (fromList [])
