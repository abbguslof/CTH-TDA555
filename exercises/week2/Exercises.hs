module Exercises where
import Control.Concurrent (yield)
import Data.List (sort)

avg :: Double -> Double -> Double
avg a b = (a + b) / 2

median :: Int -> Int -> Int -> Int
median x y z = sort [x, y, z] !! 1