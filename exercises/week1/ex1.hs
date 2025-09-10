-- Pounds (kr) outputs pounds converted to swedish crownw. Takes in a Fractional(any rational number) and outputs a rational number.
pounds:: Fractional a => a -> a
pounds kr = kr/12.7775


-- Farenheit (Celcius) outputs farenheit temp in celcius. Takes in a Fractional(any rational number) and outputs a rational number.
farenheit:: Fractional a => a -> a
farenheit c = (c * (9/5)) + 32

-- A shop sells potatoes for 3.50 SEK/kg. To stimulates large sales, the shop offers a discount of 3 SEK/kg for the quantity exceeding 10kg.
-- We want to define the function that calculates the price.
price kg
    | kg > 20 = (10 * 3.5) + (10 * 3) + (kg - 20) * 2.5
    | kg > 10 = (10 * 3.5) + (kg - 10) * 3
    | otherwise = kg * 3.5

-- price 11
-- 11 is bigger than 10 but smaller than 20.
-- (10 * 3.5) = 35
-- 35 + (11-10) * 3
-- 38 
-- Example uses old code/instruction set not up to date with the latest instructions. 11 should be 38 not 38.5


-- The name of the function: average.
-- Input: Two floating point numbers.
-- Output: A floating point number giving the average of the two arguments.
-- Names of the parameters: x and y.
-- The result in terms of the parameters: (x+y)/2
-- The complete definition:

average x y = (x+y)/2

-- Define a function that given a year gives the number of days in that year. Used the simplified rule that year numbers divisible by four are leap years (years with 366 days).
-- You will have to use relational operator == which evaluates to True if its arguments are equal.
daysinyear year
    | year `mod` 4 == 0 = 366
    | otherwise = 365