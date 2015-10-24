module CoordinatesSpec where

import String
import ElmTest.Test exposing (test, Test, suite)
import ElmTest.Assertion exposing (assert, assertEqual)

import GameOfLife exposing (minimumCoordinates, maximumCoordinates)

cells = [(-1, 2), (-2, 3), (2, 4), (3, -1), (0, 0) ]

tests : Test
tests =
    suite "Coordinates"
        [ test "it finds the min X and Y for a given board of cells"
            (assertEqual (-2, -1) (minimumCoordinates cells)),
          test "it finds the max X and Y for a given board of cells"
            (assertEqual (3, 4) (maximumCoordinates cells))
        ]
