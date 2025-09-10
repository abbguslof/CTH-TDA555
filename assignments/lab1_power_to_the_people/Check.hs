module Check where

import Test.Hspec
import Test.QuickCheck

-- Import the student's code
import Lab1 (power1, power2, comparePower1, comparePower2, testAll)

power :: Int -> Int -> Int
power x n = x^n

main :: IO ()
main = hspec $ do
  describe "power1" $ do
    it "calculates power correctly" $
      property $ \x (NonNegative n) -> power1 x n === power x n

  describe "power2" $ do
    it "calculates power correctly" $
      property $ \x (NonNegative n) -> power2 x n === power x n

  describe "comparePower1" $ do
    it "compares powers correctly" $
      property $ \x (NonNegative n) -> comparePower1 x n

  describe "comparePower2" $ do
    it "compares powers correctly" $
      property $ \x (NonNegative n) -> comparePower2 x n

  describe "testAll" $ do
    it "runs all tests successfully" testAll
