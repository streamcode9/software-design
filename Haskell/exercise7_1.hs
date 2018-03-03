import Types

nextRandom :: Double -> Double
nextRandom = snd . properFraction . (105.947 * )

type Random a = State Double a

next :: Random Double
next = State $ \s -> (s, nextRandom s)

dropDice :: Random Double
dropDice = fmap drop' next
    where drop' x = realToFrac $ (round $ x * 100) `mod` 6

dropDiceMany :: Random Double
dropDiceMany = fmap sum $ sequence $ replicate 10 dropDice

playGame :: Double -> (Double, Double)
playGame s = (firstPlayerPoints, secondPlayerPoints)
    where
        (firstPlayerPoints, s') = runState dropDiceMany s
        (secondPlayerPoints, s'') = runState dropDiceMany s'

main = print $ playGame
