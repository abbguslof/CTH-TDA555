This excersise set is designed as very gentle introduction to Haskell and the interactive Haskell interpreter GHCi. You will need to have access a working Haskell system either on your computer or the school's computers. You can download this zip file Links to an external site. containing a folder that you can open with Visual Studio Code and allows you to run GHCi in the Docker development container. From week 2 onwards there are scheduled exercises classes where you can ask questions and get help. Note, that you really don't have to do all exercises! We offer many exercises such that you have the possibility to work on it as much as you like. Don't worry if you don't manage to do all. Just get started and get acquainted with coding, editing and the interpreter. Good luck!

The questions come with a suggested answer that you can see here Download here. Try to answer the questions yourself before looking!

 

GHCi as a simple calculator
GHCi is an Haskell interpreter, i.e. it is a program that evaluates Haskell expressions. You can start GHCi by typing ghci in a terminal.

ghci
We will use this style for the text that you as user of GHCi have to enter. When you start GHCi you will see something like this welcome message:

Loaded package environment from /Users/alex/.ghc/x86_64-darwin-9.2.8/environments/default
GHCi, version 9.2.8: https://www.haskell.org/ghc/  :? for help
ghci>
Right now, we don't care about the precise meaning of the text in the welcome message, but focus on the last line with the > symbol. The > symbol indicates that GHCi is ready to receive a command. The simplest command one can give to GHCi is an Haskell expression, given an Haskell expression GHCi will evaluate it, and write the result on the screen. Try:

ghci> 4+5*6 
34
After that, as indicated by the > symbol, GHCi is ready to take a new command. We can repeat this interaction as many times as we want. Try:

ghci> 4*(8-5)+3 
15 
ghci> 3.5/(3+4)*4.5
2.25 
ghci> sin 1.57
0.9999996829318346
The first of the expressions contains a multiplication-,  addition-,  and a subtraction operator. In which order are these operators applied? Which numbers are multiplied, added, and subtracted?
What will the result be if we take away the parentheses in the first expression, i.e. 4*8-5+3?
In which order are the operators applied in the second expression?
We don't always get a value as result when we give GHCi an expression, it can be the case that our expression contains an error. Try:

ghci> 3+5* 
<interactive>:1:4: parse error (possibly incorrect indentation)
The first expression contains a syntax error; there is no right operand of the multiplication operator (*). Recognizing different kinds of errors and knowing their causes will take some  time to learn!

We use the :q command to finish a GHCi session.

Prelude> :q 
Leaving GHCi.
All GHCi commands Links to an external site. except evaluating an expressions start with a colon :

Two simple examples
The sell rate for the English pound was 12.7775 SEK on the 20th of October 2008. How many pounds did one get for 1000 SEK that day?
In some countries people use the Fahrenheit temperature scale. 0° Celsius (C) corresponds to 32° Fahrenheit (F), and an increase of 5° C corresponds to an increase of 9° F. How many Fahrenheit degrees is 28° C?
 

A programmable pocket calculator
We have seen how we can use GHCi to do simple calculations. But this is just the beginning. To go further we need to define our own functions. As a first example we look at the currency conversion problem described above. If we need to repeatedly convert pounds to SEK we can define a function that does this for us. Defining a function consists of a number of steps.

Decide upon a name for the function. A name should be chosen that is suggestive of it's purpose, and does not have the same name as a function currently in scope. For this example we chose the name pounds.
Decide which arguments (input) the function has, and what the result (output) of the function is. In this case this is simple:
Input: a floating point number representing an amount of crowns.
Output: a floating point number representing an an amount of pounds.
Decide upon a name for the parameters of the function that indicates the usage of the argument. In this case we use the name kr as parameter.
Express the result in terms of the parameters. In this case the result is: kr/12.7775 pound.
Write the complete Haskell function definition. In this case:
pounds kr = kr/12.7775
Before we can use the definition we have to give it to GHCi. Although it is possible to do this directly in GHCi, it is more useful to learn how to do this in a seperate file, since this is what we have to do for larger programs.

Use a text editor (for example Visual Studio Code) to write the function definition in a file. Do this, start your editor and create a new file containing the definition above. Save this to a file with name ex1.hs.
Give GHCi a command to load the file
ghci> :l ex1.hs 
Compiling Main ( ex1.hs, interpreted ) 
Ok, one modules loaded. 
ghi>
We can now use the definition: Try:

ghci> pounds 1000 
78.2626 
ghci> pounds 12345 
966.151 
ghci> pounds 127775 
10000.0
Define a function that converts temperatures in °C to °F. Add this function to ex1.hs. Load the file and test your function.
We will now introduce a new kind of error. What happens if one writes pount 10 (note the spelling error)? What happens if one writes: pounds kr?
 

Comparison and more complex functions
Up till now we have defined functions by equations of the form:

name parameter = an expressions containing the parameter, numbers and arithmetic operations.
It is not always this easy, consider the following example:

A shop sells potatoes for 3.50 SEK/kg. To stimulates large sales, the shop offers a discount of 3 SEK/kg for the quantity exceeding 10kg.
We want to define the function that calculates the price.
Let's call this function price and the parameter v.
When v is at most 10, then the price is 3.50*v. If v is more than 10, the price is 35+3*(v-10) (check this!) which is equal to 5+3*v. So, we have:

price(v) = 3.5*v, if v<=10
price(v) = 5+3*v, if v>10
How does one write this in Haskell? First, notice that GHCi can compare numbers.Try:

ghci> 3 < 6 
True 
ghci> 3.5 <= 3 
False 
ghci> pounds 4000 > 3*100 
True
The result of such a comparison is either True or False. Notice, that smaller than or equal to is written as <=. Now, we can write the definition of price as follows:

price v
  | v <= 10 = 3.5*v
  | v > 10  = 5+3*v
The Boolean expressions between | and = are called guards. When this function is applied to a particular argument, GHCi checks the guards from top to bottom until it finds one that evaluates to True, after that the right-hand side of the expression is used to calculate the result. If all guards evaluate to False GHCi gives an error message.

Load this function into GHCi, and test the function price on different arguments.

8.  Change the last of the definitions to:
   | v > 11  = 5+3*v
What is the result of applying the function to 9.5, 10.5 and 11.5, respectively?
9.  Change the function to:
price v
   | v <= 11 = 3.5*v
   | v > 10  = 5+3*v
What is the now result of applying the function to 9.5, 10.5 and 11.5, respectively?
We can use the keyword otherwise as a guard that is always true. So, if otherwise is used as the last guard, the expression at the right-hand side will be used if none of the other guards evaluates to true.

So, we can write:

price v
  | v <= 10   = 3.5*v
  | otherwise = 5+3*v
10.  The sale of potatoes has been so successful that the shop now can offer a price of 2.50 SEK/kilo for quantities exceeding 20 KG (with the same prices for other amounts). Change the function to to calculate the correct price.
Is otherwise a Haskell keyword? What does hoogle Links to an external site. say?

When a function is applied to a simple argument (like 5) we don't need parentheses. But if the argument is composed (like 4 + 8) parentheses are needed.

ghci> price 7.5 
26.25 
ghci> price 11 
38.5 
ghci> price (4+8) 
41.0
11.  Try to evaluate the last expression without parentheses. Can you explain the result?
Functions with more than one argument
Functions can have more than one argument. As an example we define a function that defines the average of two numbers:

The name of the function: average.
Input: Two floating point numbers.
Output: A floating point number giving the average of the two arguments.
Names of the parameters: x and y.
The result in terms of the parameters: (x+y)/2
The complete definition:
average x y = (x+y)/2
Observe that when a function has multiple arguments the parameters are written after each other separated by spaces. The same holds when the function is applied to parameters.

ghci> average 5 8 
6.5
12.  Define a function that gives the average of three numbers. Load in the function in GHCi and test it.
The Prelude
Some functions are very frequently used and therefore pre-defined in a module (file) called the Prelude, which is loaded automatically every time GHCi is started. An overview of the functions defined can be found in e.g., A Tour of the Haskell Prelude Links to an external site.. To program efficiently in Haskell it is necessary to know which functions are available in the prelude. In the coming weeks you will become more familiar with them.

 

Operators and functions with two arguments
Operators like *,-,+ are written infix, which means that the operator should be between its arguments. Functions are usually written prefix, meaning that they are written in front of their arguments.

However, one can use a function infix by writing it between `  `. An operator can be used prefix by writing it in between parentheses. Try:

ghci> 5 `average` 4 
4.5
ghci> 4 `max` (5 `max` 2) 
5 
ghci> (+) 3 4
7
Integers
The prelude provide the function div for integer division. Try:

Prelude> div 17 5
3 
Prelude> div 34 8 
4 
Prelude> div 5 9 
0 
Prelude> 4 `div` 2 
2
The function mod gives the remainder for integer division:

Prelude> 17 `mod` 5 
2 
Prelude> 34 `mod` 8 
2 
Prelude> 5 `mod` 9 
5 
Prelude> mod 4 2 
0
What is 5 `mod` 0?
Is 107139224 divisible by 11731? Links to an external site.
Define a function that given a year gives the number of days in that year. Used the simplified rule that year numbers divisible by four are leap years (years with 366 days). You will have to use relational operator == which evaluates to True if its arguments are equal.
 

A bigger example
Consider the following game:

Think of an whole number greater than one. If its even, divide it by two, otherwise multiply it by three and add one. Stop if the resulting number is one, otherwise repeat the procedure.
As example, we start width 10.

10 is even, so the next number is: 10/2 = 5
5 is odd so the next number is: 3*5+1=16
16 is even, so the next number is: 16/2 = 8
8 is even, so the next number is: 8/2 = 4
4 is even, so the next number is: 4/2 = 2
2 is even, so the next number is: 1.
If we start with 7 we get: (Check this!)

7, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1.
We are interested in the question: Given a number n, how many numbers are there in the sequence? For n=10, we get 7 numbers (10, 5, 16, 8, 4, 2, 1). For n=7 we get 17 numbers (See above). Note that we include both the number n we start with and the final number 1.

How can GHCi help us to answer the question? We start with defining a function next that given a number computes the next number in the sequence.

Define the function next
What is the length of the sequence for n = 6?
We want to define a function steps that takes a number n as argument and calculates the length of the generated sequence. What is steps 20? And steps 3?
Guided by the previous exercise we observe that the function steps complies with:

steps n
  | n == 1    = 1
  | otherwise = steps(next n)+1
We call this a recursive definition. (You should have met this concept before - otherwise ask for a refund on your undergraduate education!) Write the definition in your file. Load it in to GHCi, and calculate steps n for several different values of n. It all seems to work without any problem. But at the same time one can wonder:

19.  Can you be sure that eventually you will reach the number 1 no matter what number you start with?
Finally, we define the function  numbers that calculates the actual list of numbers generated in the game:

numbers n
     | n==1      = [1]
     | otherwise = n : numbers(next n)
Load the function into GHCi and try:

Main> numbers 10 
[10, 5, 16, 8, 4, 2, 1] 
Main> numbers 17 
[17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1] 
Main> numbers 1 
[1]
Study the function definition: When n=1 the result is the list [1]. Otherwise we use the operator : , named cons, which constructs a list from an element and a list by placing the element at the top of the list. The result of numbers n is n followed by the list numbers(next n).

Now we have defined the function numbers we don't need to define steps anymore because there is a function length in the prelude that calculates the length of a list.

Try:

Main> length [1,6,33,8,7,14] 
6 
Main> length (numbers 10) 
7