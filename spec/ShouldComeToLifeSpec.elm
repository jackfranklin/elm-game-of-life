module ShouldComeToLifeSpec where

import String
import ElmTest exposing (..)

import GameOfLife exposing (shouldComeToLife)

deadCell = (1, 1)

tests : Test
tests =
    suite "#comeToLife"
        [ test "when the cell is actually alive it is false"
            (assert (not (shouldComeToLife deadCell [(1, 1), (2, 1)]))),
          test "when the cell should come to life"
            (assert (shouldComeToLife deadCell [(0, 0), (0, 1), (1, 0)])),
          test "when the cell only has two neighbours"
            (assert (not (shouldComeToLife deadCell [(0, 0), (0, 1)])))
        ]
