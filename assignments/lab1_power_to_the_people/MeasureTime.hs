{- |
Module      : MeasureTime
Description : A small module to measure the execution time of a function call.
Copyright   : (c) TDA555/DIT441, Introduction to Functional Programming
License     : BSD
Maintainer  : alexg@chalmers.se
Stability   : experimental
-}

module MeasureTime
  ( measureTime, measureTime2
  , showTime, showTime2
  ) where

import Data.Time
import Numeric

-- | Show a time difference using @n@ significant figures
showSignificant :: Int -> NominalDiffTime -> String
showSignificant n a = showFFloat Nothing b "s"
 where
  ae = showEFloat (Just (n-1)) (fromRational (toRational a)) ""
  b  = read ae :: Double

-- | Force the computation of a value
force :: Show a => a -> IO ()
force a = maximum (show a) `seq` return ()

-- | Measure the time it takes for the function to return
measureTime :: Show res => (arg -> res) -> arg -> IO String
measureTime f arg = do
  t1 <- getCurrentTime
  force (f arg)
  t2 <- getCurrentTime
  return $ showSignificant 2 (diffUTCTime t2 t1)

-- | Like @measureTime@ but for functions of two arguments
measureTime2 :: Show res => (a -> b -> res) -> a -> b -> IO String
measureTime2 f a b = measureTime (uncurry f) (a, b)

-- | Print the time for a function call
showTime :: Show res => (arg -> res) -> arg -> IO ()
showTime f arg = do
  putStrLn "Start evaluation"
  time <- measureTime f arg
  putStrLn $ "Done after " ++ time

-- | Like @showTime@ but for functions with two arguments
showTime2 :: Show res => (a -> b -> res) -> a -> b -> IO ()
showTime2 f a b = showTime (uncurry f) (a, b)

-- Use as follows:
--
--     *Main> showTime2 power 10 100000
--     Start evaluation
--     Done after 2.9s
