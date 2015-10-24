module TickSpec where

import String
import ElmTest.Test exposing (test, Test, suite)
import ElmTest.Assertion exposing (assert, assertEqual)

import Debug
import GameOfLife exposing (tick)

firstTestInput = [(0, 0), (0, 1), (0, 2)]
firstTestOutput = [(0, 1), (-1, 1), (1, 1)]

tests : Test
tests =
    suite "#tick"
        [ test "given overcrowded board"
            (assertEqual firstTestOutput (tick firstTestInput))
        ]
