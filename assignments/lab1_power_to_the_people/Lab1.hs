{- |
Module      : Lab1
Description : Skeleton for lab 1: Power to the People
Copyright   : (c) TDA555/DIT441, Introduction to Functional Programming
License     : BSD
Maintainer  : alexg@chalmers.se
Stability   : experimental

Authors     : Bakr Al-Rubaye, Gustav Löfqvist, William Brantebäck
Lab group   : 23
-}

module Lab1 where

-- The power function uses explicit recursion to calculate n^k. We developed
-- this function during a lecture.
power :: Int -> Int -> Int
power n k
 | k < 0  = error "power: negative argument"
power n 0 = 1
power n k = n * power n (k-1)

-- Part A ----------------------------------------------------------------------
-- Evaluate the expression `power 3 2` by hand. Write the evaluation steps in
-- the comment below by replacing the dots. We have already done the first step
-- for you.

-- power 3 2
-- => { use the third case: power n k = n * power n (k-1), with n=3, k=2 }
-- 3 * power 3 (2 - 1)
-- => { simplify 2 - 1 }
-- 3 * power 3 1
-- => { use the third case again: power n k = n * power n (k-1), with n=3, k=1 }
-- 3 * (3 * power 3 (1 - 1))
-- => { simplify 1 - 1 }
-- 3 * (3 * power 3 0)
-- => { use the second case: power n 0 = 1 }
-- 3 * (3 * 1)
-- => { multiply 3 * 1 }
-- 3 * 3
-- => { multiply 3 * 3 }
-- 9

-- Part B ----------------------------------------------------------------------
-- Calculate power n k using a list.
-- List using k elements, all being n,

-- Take k amount of copies and repeat number n
-- Creates a list of n with k amount of elements.
-- Multiply everything in the list.

power1 :: Int -> Int -> Int
power1 n k
 | k < 0  = error "power: negative argument"
 | otherwise = product (replicate k n)

-- Part C ----------------------------------------------------------------------
-- Even k => n^k = (n^2)^k/2
-- Odd  k => n * (n^k-1)

power2 :: Int -> Int -> Int
power2 n 0 = 1
power2 n k
 | k < 0    = error "power: negative argument"
 | even k   = power2 (n * n) (k `div` 2)
 | otherwise = n * power2 n (k - 1)
-- Part D ----------------------------------------------------------------------
-- Small numbers, easy to check by hand
test1  = comparePower1 2 3 && comparePower2 2 3 -- 2^3
test2  = comparePower1 3 4 && comparePower2 3 4 -- 3^4

-- Edge cases (make sure power function follows math rules)
test3  = comparePower1 0 0 && comparePower2 0 0         -- 0^0 should be 1
test4  = comparePower1 2 0 && comparePower2 2 0         -- n^0 should be 1
test5  = comparePower1 0 5 && comparePower2 0 5         -- 0^k should be 0 for k > 0
test6  = comparePower1 1 100 && comparePower2 1 100     -- 1^k should be 1

-- Larger numbers
test7  = comparePower1 2 10 && comparePower2 2 10
test8  = comparePower1 9 6 && comparePower2 9 6
test9  = comparePower1 7 8 && comparePower2 7 8
test10 = comparePower1 4 12 && comparePower2 4 12

-- Part D.2
comparePower1 :: Int -> Int -> Bool
comparePower1 n k = power n k == power1 n k   -- compare result of power with power1

comparePower2 :: Int -> Int -> Bool
comparePower2 n k = power n k == power2 n k   -- compare result of power with power2

-- Part D.3
testCases :: [(Int, Int)]
testCases =
    [ (2,3), (3,4), (0,0), (2,0), (0,5), (1,100), (2,10), (9,6), (7,8), (4,12) ]

testAll :: Bool
testAll = and [comparePower1 n k && comparePower2 n k | (n, k) <- testCases]
