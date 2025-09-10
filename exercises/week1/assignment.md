Q: The first of the expressions contains a multiplication, addition, and a subtraction operator. In which order are these operators applied? Which numbers are multiplied, added, and subtracted?
A: Following "normal" math rules". Parentheses first, then multiplication and division and last subtraction and addition.

Q: What will the result be if we take away the parentheses in the first expression, i.e. 4*8-5+3?
A: That is equal to doing 4*8=32, then -5, then +3, which equals to 30.

Q: In which order are the operators applied in the second expression?
A: Multiplication, then subtraction then addition. (Addition and subtraction is interchangeable in order)

Q: The sell rate for the English pound was 12.7775 SEK on the 20th of October 2008. How many pounds did one get for 1000 SEK that day?
A: According to: pounds kr = kr/12.7775 answer is 78.2625709254549

Q: In some countries people use the Fahrenheit temperature scale. 0° Celsius (C) corresponds to 32° Fahrenheit (F), and an increase of 5° C corresponds to an increase of 9° F. How many Fahrenheit degrees is 28° C?
A: According to: farenheit c = (c * (9/5)) + 32 82.4

Q: Define a function that converts temperatures in °C to °F. Add this function to ex1.hs. Load the file and test your function.
A: farenheit c = (c * (9/5)) + 32

Q: We will now introduce a new kind of error. What happens if one writes pount 10 (note the spelling error)? What happens if one writes: pounds kr?
A: pount 10 gives: ghci> pount 10 <interactive>:38:1: error: [GHC-88464] Variable not in scope: pount :: t0 -> t. Which says that pount is not a defined function.
pounds kr gives: ghci> pounds kr <interactive>:39:8: error: [GHC-88464] Variable not in scope: kr Suggested fix: Perhaps use ‘or’ (imported from Prelude). Says that kr is not defined in the scope type fractional.

Q: Change the last of the definitions to:

What is the result of applying the function to 9.5, 10.5 and 11.5, respectively?
A: 9.5 will give 9.5*3.5, 10.5 and 11.5 will be times 3. This redefines v, so it will never allow for a specific price per range of v. Example 3kr/kg after 10 kg.

Q: The sale of potatoes has been so successful that the shop now can offer a price of 2.50 SEK/kilo for quantities exceeding 20 KG (with the same prices for other amounts). Change the function to to calculate the correct price.
A:

Q: Is otherwise a Haskell keyword? What does hoogle say?
A: From hoogle: otherwise :: Bool
otherwise is defined as the value True. It helps to make guards more readable. For example:

Q: What is 5 mod 0?
A: mod is short for modular arithmetic and calculates the rest in a division. (rest division)
But division by 0 is not possible thus mod as well.

Q: Is 107139224 divisible by 11731?
A: If the rest is 0 then yes. Mod 1, thus it will not be an integer, instead being a float. It is not divisible without a remainder.