-- See exercise0.hs

(=<<)  :: Monad m => (a -> m b) -> m a -> m b
(=<<) = flip (>>=)

------------------------------------------------------------

data Writer msg b = Writer (b, msg)

runWriter :: Writer msg b -> (b, msg)
runWriter (Writer a) = a

instance Monoid msg => Monad (Writer msg) where
  return a = Writer (a, mempty)
  wtr >>= func = case (runWriter wtr) of
    (a, msg) -> (func a)

instance Monoid msg => Functor (Writer msg) where
 fmap f fa = case (runWriter fa) of
   (a, msg) -> Writer (f a, msg)

instance Monoid msg => Functor (Writer msg) where
  fmap f fa = fa >>= (\a -> return $ f a)

instance Monoid msg => Applicative (Writer msg) where
  pure = return
  ff <*> fa = case (runWriter ff) of
    (f, msgF) -> case (runWriter fa) of
      (a, msgA) -> Writer (f a, mappend msgF msgA)

instance Monoid msg => Applicative (Writer msg) where
  pure = return
  ff <*> fa = (`fmap` fa) =<< ff

main = runWriter $ (pure (\x -> x + 10)) <*> (foo 100)
main = runWriter $ fmap (\x -> x + 100) (return 200)
main = runWriter ((return (\x -> x + 10)) <*> (return 100))

------------------------------------------------------------

data Reader env b = Reader (env -> b)

runReader :: Reader env b -> (env -> b)
runReader (Reader f) = f

instance Monad (Reader b) where
  return b = Reader (\env -> b) 
  rdr >>= func = Reader $ \env ->
    case runReader rdr env of
      b -> runReader (func b) env

instance Functor (Reader b) where
    fmap f rdr = Reader $ \env ->
      case runReader rdr env of
        a -> (f a)

instance Functor (Reader b) where
    fmap f rdr = rdr >>= (\a -> return $ f a)

instance Applicative (Reader b) where
  pure = return
  ff <*> fb = Reader $ \env ->
    case runReader ff env of
      f -> case runReader fb env of
        b -> (f b)

instance Applicative (Reader b) where
  pure = return
  ff <*> fb = (`fmap` fb) =<< ff

main = runReader ((pure (\x -> x + 10)) <*> (pure 100)) 1000
main = runReader (fmap (\x -> x + 10) (pure 2)) 100

------------------------------------------------------------

data State s a = State (s -> (a, s))

runState :: State s a -> s -> (a, s)
runState (State f) = f

instance Monad (State s) where
  return a = State (\s -> (a, s)) 
  sa >>= fs = State $ \s ->
    case runState sa s of
      (a, s') -> runState (fs a) s'

instance Functor (State s) where
  fmap f sa = State $ \s ->
    case runState sa s of
      (a, s') -> ((f a), s')

instance Functor (State s) where
    fmap f st = st >>= (\a -> return $ f a)

instance Applicative (State s) where
  pure = return
  ff <*> fa = State $ \s ->
    case runState ff s of
      (f, s') -> case runState fa s' of
        (a, s'') -> (f a, s'')

instance Applicative (State s) where
  pure = return
  ff <*> fa = (`fmap` fa) =<< ff

main = runState (fmap (\x -> x + 10) (return 2)) 1000
main = runState ((pure (\x -> x + 10)) <*> (pure 100)) 1000
