{-# OPTIONS_GHC -Wno-x-partial #-}

module CheckPartB where

import Control.Exception (evaluate)
import Data.List (group, sort)
import qualified Test.QuickCheck as QC
import Test.QuickCheck hiding (shuffle)
import Test.Hspec

-- Import the student's code
import Cards
import RunGame
import Blackjack (fullDeck, draw, playBank, value, pick, shuffle, prop_shuffle, prop_size_shuffle)

ac, ah, kh, kd, qc :: Card
ac = Card Ace Clubs
ah = Card Ace Hearts
kh = Card King Hearts
kd = Card King Diamonds
qc = Card Queen Clubs

deriving instance Ord Rank
deriving instance Ord Suit
deriving instance Ord Card

main :: IO ()
main = hspec $ do
  describe "Task B1: fullDeck" $ do
    it "should have 52 cards:"    $ length fullDeck `shouldBe` 52
    it "should have 13 hearts:"   $ length [r | Card r Hearts   <- fullDeck] == 13
    it "should have 13 clubs:"    $ length [r | Card r Clubs    <- fullDeck] == 13
    it "should have 13 diamonds:" $ length [r | Card r Diamonds <- fullDeck] == 13
    it "should have 13 spades:"   $ length [r | Card r Spades   <- fullDeck] == 13
    let fours = map length $ group $ sort $ map rank fullDeck
    it "should have 4 cards of each rank:" $ all (== 4) fours

  describe "Task B2: draw" $ do
    it "should throw an error on an empty deck:" $ 
      evaluate (draw [] []) `shouldThrow` anyErrorCall

    it "should move a card from the deck to the hand:" $ 
      property $ \(NonEmpty deck) hand -> let (d, cs) = draw deck hand in 
        d == tail deck && head cs == head deck

  describe "Task B3: playBank" $ do
    it "should always draw a card if the value is below 16" $
      property $ forAll (QC.shuffle fullDeck) $ \deck -> 
        value (playBank deck) >= 16

    it "should not draw a card if the value is over 16" $ do
      value (playBank [kh, kd, qc]) `shouldBe` 20
      value (playBank [kh, Card (Numeric 6) Hearts]) `shouldBe` 16

  describe "Task B4: pick and shuffle" $ do
    it "pick 0.0 should select the first card of a non-empty deck" $
      property $ \(NonEmpty deck) -> pick 0 deck == head deck
    it "pick 1.0 should select the last card of a non-empty deck" $
      property $ \(NonEmpty deck) -> pick 1 deck == last deck
    it "the picked card should be in the deck" $ 
      property $ \(NonEmpty deck) x -> pick (getZeroOne x) deck `elem` deck
    
    it "shuffle should not add or remove cards" $
      property $ \(NonEmpty deck) (Rand ds) -> sort deck == sort (shuffle ds deck)
    it "shuffle should change the order" $ let deck = sort fullDeck in 
      property $ \(Rand ds) -> length (runs (shuffle ds deck)) > 12  -- a rudimentary measure of randomness

  describe "Task B5: properties" $ do
    it "validate prop_shuffle"      $ property prop_shuffle
    it "validate prop_size_shuffle" $ property prop_size_shuffle 

runs :: Ord a => [a] -> [[a]]
runs []  = []
runs [x] = [[x]]
runs (a:b:xs)
  | a > b     = dsc b [a]  xs
  | otherwise = asc b (a:) xs
 where
  dsc a as (b:bs)
    | a > b   = dsc b (a:as) bs
  dsc a as bs = (a:as) : runs bs

  asc a as (b:bs)
    | a <= b  = asc b (\ys -> as (a:ys)) bs
  asc a as bs = let !x = as [a] in x : runs bs

