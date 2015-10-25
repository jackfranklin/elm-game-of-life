module PotentialNeighbouringCellsForCellSpec where

import String
import ElmTest.Test exposing (test, Test, suite)
import ElmTest.Assertion exposing (assert, assertEqual)

import GameOfLife exposing (potentialNeighbouringCellsForCell)


cellOne = (0, 0)
expectedOne = [(-1, -1), (-1, 0), (-1, 1),
            (0, -1), (0, 1),
            (1, -1), (1, 0), (1, 1)]

cellTwo = (1, -1)
expectedTwo = [(0, -2), (0, -1), (0, 0),
            (1, -2), (1, 0),
            (2, -2), (2, -1), (2, 0)]


tests : Test
tests =
    suite "#potentialNeighbouringCellsForCell"
        [ test "it returns the potential neighbours"
            (assertEqual expectedOne (potentialNeighbouringCellsForCell cellOne)),
          test "it deals with a negative cell"
            (assertEqual expectedTwo (potentialNeighbouringCellsForCell cellTwo))
        ]
