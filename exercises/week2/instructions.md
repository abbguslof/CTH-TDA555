Here are some exercises designed to help you practice writing and reasoning about recursive functions. The exercises are divided into three groups: self-check, basic, and challenging.

The self-check exercises are essential: they ensure that you’ve understood last week’s material.

The basic exercises give you more practice if you feel you need it.

The challenging exercises are meant to stretch you—don’t worry if you can’t solve them all. They’re there to keep even the most experienced students busy.

You can download a zip file(https://git.chalmers.se/alex.gerdes/introfp-exercises/-/archive/main/introfp-exercises-main.zip?ref_type=heads) Links to an external site. containing a folder that opens in Visual Studio Code, allowing you to run GHCi in the Docker development container.

We also provide suggested solutions Download suggested solutions(https://chalmers.instructure.com/courses/35910/files/4194182?wrap=1), but resist the temptation to peek right away! Try to solve the problems on your own first—even when it feels difficult. Struggling is a valuable part of the learning process. If you get stuck, talk it over with a TA, a group member, or other students before consulting the solutions.

Good luck, and enjoy the challenge!

Self check
Average
Write a function that calculates the average of two numbers. This function will have two parameters. Write down the type signature (that is, the type of the function) first, such that you can validate that your implementation has the expected type. The types signature will look as follows: avg :: TYPE -> TYPE -> TYPE.

The median Function
Define the function median, which takes three arguments and returns the median of the three. Begin by writing a type signature for median, and let the definition of the function to be undefined. Before you write the definition, think of a number of test cases for testing your code. Implement the function and test your code!

Exclusive or (XOR)
Write a function that models an exclusive OR gate (https://en.wikipedia.org/wiki/XOR_gate Links to an external site.):

xor :: Bool -> Bool -> Bool
use pattern matching on boolean values.

Greatest common divisor
The greatest common divisor (gcd) can be calculated using the Euclidian algorithm Links to an external site., which works as follows: start with the pair of numbers  and repeatedly replace this by  until the pair is , where  is the greatest common divisor. For example:



so the gcd of 9 and 6 is 3. Note that the modulo operator (mod) returns the remainder of an integer division. Write a function that returns the greatest common divisor of two given integers:

gcdiv :: Int -> Int -> Int
Dice
Write a function that takes an integer as input calculates all possible casts with two dice that sum upp to the given input:

dice :: Int -> [(Int, Int)]
For example, dice 4 should give [(1,3),(2,2),(3,1)]. You can use list comprehensions to implement this functions. You can read more about them here Links to an external site..

Basic questions
Price calculation
Suppose we need to solve the following problem:

The price of prawns: 270/Kg. Define a function price to calculate the cost of a given weight of prawns. Moreover, suppose price gets cheaper if we buy more: unit price/Kg up to 50 kg, and a discount of 20% per Kg for everything above 50kg, plus an additional 10% above 100 kg.

Write a priceDiscount function, that implements the above description.

Sum of squares

Define a function which computes the sum of the squares of the numbers from 1 to n.

-- sumsq n returns 1*1 + 2*2 + ... + n*n
Hint: use recursion to compute sumsq n from sumsq (n-1); do not use a formula (such as the one below) to compute this without recursion.

Some say that sumsq n is equal to n (n+1) (2n + 1) / 6. Use QuickCheck to investigate whether this holds.

More challenging questions
The Towers of Hanoi
The Towers of Hanoi is an ancient puzzle, consisting of a collection of rings of different sizes, and three posts mounted on a base. At the beginning all the rings are on the left-most post as shown, and the goal is to move them all to the rightmost post, by moving one ring at a time from one post to another. But, at no time may a larger ring be placed on top of a smaller one!

[Towers of Hanoi: one peg with 8 rings, two empty pegs]

Can you find a strategy for solving the puzzle based on recursion? That is, if you already know how to move n-1 rings from one post to another, can you find a way to move n rings? If you try out your strategy, you will quickly discover that quite a large number of moves are needed to solve the puzzle with, say, five rings. Can you define a Haskell function

hanoi n
which computes the number of moves needed to move n rings from one post to another using your strategy? How many moves would be needed to solve the puzzle with ten rings?
Legend has it that the original version of the puzzle has 32 rings, and is being solved at this very moment by Bhuddist monks in a monastery. When the puzzle is complete, the world will end.

Fibonacci Numbers
The Fibonacci numbers are defined by

F0	=	1
F1	=	1
Fn+2	=	Fn+1 + Fn
so the sequence of values begins 1, 1, 2, 3, 5, 8...

Write a recursive function

-- fib n computes the nth Fibonacci number
based on the mathematical definition above (we already had a go at it during the lecture, but try to do it on your own now). Use it to compute the 10th, 15th, 20th, 25th, and 30th Fibonacci number. What do you notice? Can you explain this behaviour?
More Difficult: There is a faster way to compute Fibonacci numbers. Suppose we define a function fibAux which satisfies the property

fibAux i (fib n) (fib (n+1)) == fib (n+i)
Notice that this is not a definition, it is a property!

From this property can you see how we might redefine fib by using fibAux? (Hint: try setting n to 0 in the property).

It is possible to derive a recursive definition of fibAux from this property just using algebra: the two cases we want are

fibAux 0 a b = ...
fibAux i a b | i>0 = ...
See if you can use the property to figure out what the right hand sides should be.

Use QuickCheck to test whether the new definition of fib (in terms of fibAux) satisfies the property above.

Use the new version of fib to compute the 10th, 15th, 20th, 25th, and 30th Fibonacci number. What do you notice?

Calculate fibAux 4 1 1 by hand. If you have programmed before, then observe the way the values of i, a, and b change in successive recursive calls. Does it remind you of anything?

Factors
A prime number p has only two factors, 1 and p itself. A composite number has more than two factors. Define a function

smallestFactor n
which returns the smallest factor of n larger than one. For example,

smallestFactor 14 == 2
smallestFactor 15 == 3
Before you program smallestFactor, write at least two QuickCheck properties that it should satisfy. You will need functions for integer division and remainder: investigate the standard functions div and mod for this purpose.