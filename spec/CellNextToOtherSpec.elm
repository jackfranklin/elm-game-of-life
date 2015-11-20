module CellNextToOtherSpec where

import String
import ElmTest exposing (..)

import GameOfLife exposing (cellNextToOther)


givenCell = (2, 1)

tests : Test
tests =
    suite "#cellNextToOther"
        [ test "When the cell is to the left"
            (assert (cellNextToOther givenCell (1, 1))),
          test "when the cell is to the right"
            (assert (cellNextToOther givenCell (3, 1))),
          test "When the cell is not next"
            (assert (not (cellNextToOther givenCell (4, 1)))),
          test "When the cell is close on X but far on Y"
            (assert (not (cellNextToOther givenCell (3, 5)))),
          test "When the cell is above"
            (assert (cellNextToOther givenCell (2, 2))),
          test "When the cell is below"
            (assert (cellNextToOther givenCell (2, 0))),
          test "When the cell is diagonally top left"
            (assert (cellNextToOther givenCell (1, 2))),
          test "When the cell is diagonally bottom left"
            (assert (cellNextToOther givenCell (1, 0))),
          test "When the cell is diagonally top right"
            (assert (cellNextToOther givenCell (3, 2))),
          test "when the cell is diagonally bottom right"
            (assert (cellNextToOther givenCell (3, 0))),
          test "when the cell is a negative X"
            (assert (cellNextToOther (0, 0) (-1, 0)))

        ]
