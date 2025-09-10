module CheckPartA where

import Data.List (isInfixOf)
import Test.QuickCheck
import Test.Hspec

-- Import the student's code
import Cards
import RunGame
import Blackjack (sizeSteps, display, value, gameOver, winner)

power :: Int -> Int -> Int
power x n = x^n

ac, ah, kh, kd, qc :: Card
ac = Card Ace Clubs
ah = Card Ace Hearts
a3 = Card (Numeric 3) Hearts
a4 = Card (Numeric 4) Hearts
kh = Card King Hearts
kd = Card King Diamonds
qc = Card Queen Clubs

h1 :: Hand
h1 = [ac, qc, ah, a3, a4]

main :: IO ()
main = hspec $ do
  describe "Task A1: sizeSteps" $ do
    it "Should have 7 rewrite steps, i.e., the list should have 7 elements." $ 
      length sizeSteps `shouldBe` 7

    it "Every element should evaluate to 2." $ 
      all (== 2) sizeSteps

  describe "Task A2: display" $ do
    it "Should not show constructor names" $ 
      property $ \h -> let s = display h in 
        not ("Card" `isInfixOf` s) && not ("Numeric" `isInfixOf` s)

  describe "Task A3: value" $ do
    it "Aces have the same value:"      $ do value [ac, ah] `shouldBe` 2
    it "An ace and king should be 21:"  $ do value [ac, kd] `shouldBe` 21
    it "A single ace is 11:"            $ do value [ac] `shouldBe` 11
    it (display h1 ++ " should be 19:") $ do value h1 `shouldBe` 19

  describe "Task A4: gameOver and winner" $ do
    it "A value over 21 should be bust, otherwise not:" $ 
      property $ \h -> case () of 
        _ | value h > 21 -> gameOver h 
          | otherwise    -> not (gameOver h)

    it "Test winner" $ 
      property $ \guest bank -> case winner guest bank of
        Bank  -> value bank >= value guest || gameOver guest
        Guest -> value bank <  value guest || gameOver bank

