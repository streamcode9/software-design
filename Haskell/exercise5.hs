data BTree a = BList a | BNode a (BTree a) (BTree a)

instance Show a => Show (BTree a) where
  show (BList a) = "[list " ++ show a ++ "]"
  show (BNode a t1 t2) = "[node " ++ show a ++ ", " ++ show t1 ++ ", " ++ show t2 ++ "]"

liftTree :: Num a => a -> (a -> b) -> BTree b
liftTree a f = BList (f a)

liftTree2 :: Num a => a -> (a -> b) -> BTree b
liftTree2 a f = BNode (f a) (BList (f (a+1))) (BList (f (a+2)))

foo = \a -> liftTree2 a (\x -> x + 2)
goo = \a -> liftTree2 a (\x -> x + 3)

class Kleisli m where
  idK :: a -> m a 
  (*>) :: (a -> m b) -> (b -> m c) -> (a -> m c) 

class Monad m where
  return  :: a -> m a
  (>>=)   :: m a -> (a -> m b) -> m b

runTree :: BTree a -> a
runTree (BList a) = a
runTree (BNode a _ _) = a

applyToTree :: BTree a -> (a -> BTree b) -> BTree b
applyToTree (BList a) mf = mf a
applyToTree (BNode a t1 t2) mf = BNode (runTree $ mf a) (applyToTree t1 mf) (applyToTree t2 mf)

instance Kleisli (BTree) where
  idK a = BList a
  ft *> gt = \a -> applyToTree (ft a) gt

instance Monad (BTree) where
  return = idK
  tree >>= f = applyToTree tree f

main = (foo *> goo) 1
main = (BNode 1 (BList 1) (BList 1)) >>= foo

--------------------------------------------------------------------------------------------------

data Tree a = Node a [Tree a]

instance Show a => Show (Tree a) where
  show (Node a []) = show a
  show (Node a t) = show a ++ show t

liftTree :: Num a => a -> (a -> b) -> Tree b
liftTree a f = Node (f a) []

liftTree2 :: Num a => a -> (a -> b) -> Tree b
liftTree2 a f = Node (f a) [Node (f (a+1)) [], Node (f (a+2)) []] 

foo = \a -> liftTree a (\x -> x + 2)
goo = \a -> liftTree2 a (\x -> x + 3)

runTree :: Tree a -> a
runTree (Node a _) = a

applyToTree :: Tree a -> (a -> Tree b) -> Tree b
applyToTree (Node a []) mf = mf a
applyToTree (Node a t) mf = Node (runTree $ mf a) (map (\leaf -> applyToTree leaf mf) t)

class Kleisli m where
  idK :: a -> m a 
  (*>) :: (a -> m b) -> (b -> m c) -> (a -> m c) 

instance Kleisli (Tree) where
  idK a = Node a []
  ft *> gt = \a -> applyToTree (ft a) gt

class Monad m where
  return  :: a -> m a
  (>>=)   :: m a -> (a -> m b) -> m b

instance Monad (Tree) where
  return = idK
  tree >>= f = applyToTree tree f

main = (Node 1 [Node 10 [], Node 100 []]) >>= foo
main = (foo *> goo) 1
