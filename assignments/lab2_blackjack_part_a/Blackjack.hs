{- |
Module      : Lab2
Description : Skeleton for lab 2: Blackjack
Copyright   : (c) TDA555/DIT441, Introduction to Functional Programming
License     : BSD
Maintainer  : alexg@chalmers.se
Stability   : experimental

Authors     : <list your names here>
Lab group   : <group number>
-}
{-# OPTIONS_GHC -Wno-overlapping-patterns #-}

module Blackjack where

-- Import necessary modules
import Cards
import RunGame
import Test.QuickCheck hiding (shuffle)
import Data.Int (Int)
import GHC.Arr (adjust)
import Data.String (String)
import GHC.Base (undefined)
import Cards (Card, Suit (Diamonds))

-- Task A1 --

hand2 :: Hand
hand2 = [Card (Numeric 2) Hearts, Card Jack Spades]
-- = 0 (Card (Numeric 2) Hearts : (Card Jack Spades : []))
-- = 1 (Card Jack Spades : [])
-- = 2 ([])
-- = 2 

-- de som händer nedan varför skrivs det sådär?

sizeSteps :: [Int]
sizeSteps =
  [ size []                                      
  , size [Card (Numeric 2) Hearts, Card Jack Spades]  
  , 1 + size [Card Jack Spades]                 
  , 1 + 1 + size []                             
  , 1 + 1 + 0                                   
  , 2                                           
  ]

-- Task A2 --
displayCard :: Card -> String
displayCard a = show (rank a) ++ " of " ++ show (suit a)

display :: Hand -> String
display hand = unlines (map displayCard hand)

-- Task A3 --
valueRank :: Rank -> Int
valueRank (Numeric r) = r
valueRank face | face `elem` [Jack, Queen, King] = 10
valueRank Ace = 11
valueRank _ = error "Unknown rank"

valueCard :: Card -> Int
valueCard a = valueRank (rank a)

numberOfAces :: Hand -> Int
numberOfAces hand = length (filter (\card -> rank card == Ace) hand)

adjustForAces :: Int -> Int -> Int
adjustForAces handTotal numberOfAces
 | handTotal > 21 && numberOfAces > 0 = adjustForAces (handTotal - 10) (numberOfAces - 1)
 | otherwise = handTotal

value :: Hand -> Int
value hand = adjustForAces (sum (map valueCard hand)) (numberOfAces hand)

-- Task A4 --
gameOver :: Hand -> Bool
gameOver a = value a > 21

-- If value > 21
winner :: Hand -> Hand -> Player
winner a = undefined

--------------------------------------------------------------------------------
-- Part B
---------------------------------------------------------------------------------

-- Task B1 --
fullDeck :: Deck
fullDeck = undefined

prop_size_fullDeck :: Bool
prop_size_fullDeck = size fullDeck == 52

-- Task B2 --

draw :: Deck -> Hand -> (Deck, Hand)
draw = undefined

-- Task B3 --

playBank :: Deck -> Hand
playBank = undefined

-- Task B4 --

pick :: Double -> Deck -> Card
pick = undefined

shuffle :: [Double] -> Deck -> Deck
shuffle = undefined

runShuffle :: IO Deck
runShuffle = do
  Rand ds <- generate arbitrary
  return (shuffle ds fullDeck)

-- Task B5 --

belongsTo :: Card -> Deck -> Bool
c `belongsTo` []      = False
c `belongsTo` (c':cs) = c == c' || c `belongsTo` cs

prop_shuffle :: Card -> Deck -> Rand -> Bool
prop_shuffle card deck (Rand randomlist) = 
  card `belongsTo` deck == card `belongsTo` shuffle randomlist deck

prop_size_shuffle :: Rand -> Deck -> Bool
prop_size_shuffle (Rand randomlist) deck = undefined

-- Task B6 --

-- follow the instructions on Canvas

