module PotentialNeighbouringCellsForCellSpec where

import String
import ElmTest.Test exposing (test, Test, suite)
import ElmTest.Assertion exposing (assert, assertEqual)

import GameOfLife exposing (potentialNeighbouringCellsForCell)


cell = (0, 0)
expected = [(-1, -1), (-1, 0), (-1, 1),
            (0, -1), (0, 1),
            (1, -1), (1, 0), (1, 1)]


tests : Test
tests =
    suite "#potentialNeighbouringCellsForCell"
        [ test "it returns the potential neighbours"
            (assertEqual expected (potentialNeighbouringCellsForCell cell))
        ]
