{-# LANGUAGE ScopedTypeVariables, InstanceSigs #-}

comp :: (a -> s -> (b, s)) -> (b -> s -> (c, s)) -> (a -> s -> (c, s)) 
comp f g a s = case f a s of
  (b, s') -> g b s'

runState (State f) = f
liftState :: (a -> State s b) -> (a -> s -> (b, s))
liftState f a = \s -> runState (f a) s

comp' fs gs = comp (liftState fs) (liftState gs)

unliftState :: (a -> s -> (b, s)) -> (a -> State s b) 
unliftState f a = State $ f a

comp'' fs gs = unliftState $ comp' fs gs

comp''' fs gs = unliftState $ comp (liftState fs) (liftState gs)

comp''' :: (a -> State s a1) -> (a1 -> State s b) -> a -> State s b 
comp''' fs gs = \a -> unliftState (comp (liftState fs) (liftState gs)) a

comp''' :: (a -> State s a1) -> (a1 -> State s b) -> a -> State s b 
comp''' fs gs = \a -> State $ comp (liftState fs) (liftState gs) a

comp''' fs gs a = State $ comp (liftState fs) (liftState gs) a

comp''' fs gs a = State $ comp f g a where
  f = liftState fs 
  g = liftState gs

comp''' fs gs a = State $ \s -> comp f g a s where
  f = liftState fs 
  g = liftState gs

comp''' fs gs a = State $ \s -> (case f a s of
  (b, s') -> g b s') where
    f = liftState fs 
    g = liftState gs
    
comp''' fs gs a = State $ \s -> (case f a s of
  (b, s') -> g b s') where
    f a = liftState fs a 
    g a = liftState gs a
    
comp''' fs gs a = State $ \s -> case runState (fs a) s of
  (b, s') -> runState (gs b) s'
  
----------------------------------------------------

class Kleisli m where
  idK :: a -> m a 
  (*>) :: (a -> m b) -> (b -> m c) -> (a -> m c) 
  
newtype State s a = State { runState :: s -> (a, s) }

instance Kleisli (State s) where 
  idK a = State (\s -> (a, s)) 
  fs *> gs = \a -> State $ \s -> 
    case runState (fs a) s 
      of (b, s') -> runState (gs b) s'

----------------------------------------------------

data State s a = State (s -> (a, s))

runState :: State s a -> s -> (a, s)
runState (State f) = f

class Kleisli m where
  idK :: a -> m a 
  (*>) :: (a -> m b) -> (b -> m c) -> (a -> m c) 

class Monad m where
  return  :: a -> m a
  (>>=)   :: m a -> (a -> m b) -> m b

liftState :: a -> (a -> b) -> State s b
liftState a f = State (\s -> (f a, s))

foo = \a -> liftState a (\x -> x + 2)
bar = \b -> liftState b (\x -> x * 2)
baz = foo *> bar

instance Kleisli (State s) where 
  idK a = State (\s -> (a, s)) 
  fs *> gs = \a -> State $ \s ->
    case runState (fs a) s of
      (b, s') -> runState (gs b) s'

main = (runState $ baz 10) 100

----------------------------------------------------

data State s a = State (s -> (a, s))

runState :: State s a -> s -> (a, s)
runState (State f) = f

class Kleisli m where
  idK :: a -> m a 
  (*>) :: (a -> m b) -> (b -> m c) -> (a -> m c) 

class Monad m where
  return  :: a -> m a
  (>>=)   :: m a -> (a -> m b) -> m b

liftState :: a -> (a -> b) -> State s b
liftState a f = State (\s -> (f a, s))

val = idK 10

double :: Num b => b -> State s b
double = \a -> liftState a (\x -> x * 2)

instance Kleisli (State s) where 
  idK a = State (\s -> (a, s)) 
  fs *> gs = \a -> State $ \s ->
    case runState (fs a) s of
      (b, s') -> runState (gs b) s'

instance Monad (State s) where
  return = idK
  sa >>= fs = State $ \s ->
    case runState sa s of
      (a, s') -> runState (fs a) s'

main = runState (val >>= double) 1000

----------------------------------------------------

data Reader env b = Reader (env -> b)

runReader :: Reader env b -> (env -> b)
runReader (Reader f) = f

class Kleisli m where
  idK :: a -> m a 
  (*>) :: (a -> m b) -> (b -> m c) -> (a -> m c) 

class Monad m where
  return  :: a -> m a
  (>>=)   :: m a -> (a -> m b) -> m b

liftReader :: a -> (a -> b) -> Reader env b
liftReader a f = Reader (\env -> f a)

foo = \a -> liftReader a (\x -> x + 2)
goo = \a -> liftReader a (\x -> x * 2)

instance Kleisli (Reader env) where 
  idK b = Reader (\env -> b) 
  f *> g = \a -> Reader $ \env ->
    case runReader (f a) env of
      b -> runReader (g b) env

instance Monad (Reader b) where
  return = idK
  rdr >>= func = Reader $ \env ->
    case runReader rdr env of
      b -> runReader (func b) env

main = runReader ((return 10) >>= goo) 100

---------------------------------------------------------

data Writer msg b = Writer (b, msg)

runWriter :: Writer msg b -> (b, msg)
runWriter (Writer a) = a

class Kleisli m where
  idK :: a -> m a 
  (*>) :: (a -> m b) -> (b -> m c) -> (a -> m c) 

class Monad m where
  return  :: a -> m a
  (>>=)   :: m a -> (a -> m b) -> m b

liftWriter :: Monoid msg => a -> (a -> b) -> msg -> Writer msg b
liftWriter a f m = Writer (f a, m)

foo = \a -> liftWriter a (\x -> x + 2) [1]
goo = \a -> liftWriter a (\x -> x * 2) [2]

instance Monoid msg => Kleisli (Writer msg) where 
  idK a = Writer (a, mempty) 
  f *> g = \a -> Writer $ case runWriter (f a) of
    (b, msgF) -> case runWriter (g b) of
      (c, msgG) -> (c, mappend msgF msgG)

instance Monoid msg => Monad (Writer msg) where
  return = idK
  wtr >>= func = case (runWriter wtr) of
    (a, msg) -> (func a)

main = runWriter $ (foo 100) >>= goo
--main = runWriter (foo *> goo $ 100)
