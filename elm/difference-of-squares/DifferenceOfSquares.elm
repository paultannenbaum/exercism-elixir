module DifferenceOfSquares exposing (difference, squareOfSum, sumOfSquares)
import List exposing (range, sum)

squareOfSum : Int -> Int
squareOfSum n =
  l = range 1 n
  s = sum l
  s * s

sumOfSquares : Int -> Int
sumOfSquares n =
    l = range 1 (n*n)
    sum l

difference : Int -> Int
difference n =
    squareOfSum(n) - sumOfSquares(n)
