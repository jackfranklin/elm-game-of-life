module ShouldDieSpec where

import String
import ElmTest.Test exposing (test, Test, suite)
import ElmTest.Assertion exposing (assert, assertEqual)

import GameOfLife exposing (shouldDie)

tests : Test
tests =
    suite "#shouldDie"
        [ test "when the cell has less than two neighbours"
            (assert (shouldDie (1, 1) [(1, 1)])),
          test "when the cell has two neighbours"
            (assert (not (shouldDie (1, 1) [(1, 1), (2, 1), (1, 2)]))),
          test "when the cell has three neighbours"
            (assert (not (shouldDie (1, 1) [(0, 1), (1, 1), (2, 1), (1, 2)]))),
          test "when the cell has four neighbours"
            (assert (shouldDie (1, 1) [(1, 0), (0, 1), (1, 1), (2, 1), (1, 2)]))
        ]
