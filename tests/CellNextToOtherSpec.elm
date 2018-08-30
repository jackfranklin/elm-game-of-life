module CellNextToOtherSpec exposing (givenCell, tests)

import Expect exposing (..)
import GameOfLife exposing (cellNextToOther)
import String
import Test exposing (..)


givenCell =
    ( 2, 1 )


tests : Test
tests =
    describe "cellNextToOther"
        [ test "When the cell is to the left" <|
            \() ->
                Expect.true "" (cellNextToOther givenCell ( 1, 1 ))
        , test "when the cell is to the right" <|
            \() ->
                Expect.true "" (cellNextToOther givenCell ( 3, 1 ))
        , test "When the cell is not next" <|
            \() ->
                Expect.true "" (not (cellNextToOther givenCell ( 4, 1 )))
        , test "When the cell is close on X but far on Y" <|
            \() ->
                Expect.true "" (not (cellNextToOther givenCell ( 3, 5 )))
        , test "When the cell is above" <|
            \() ->
                Expect.true "" (cellNextToOther givenCell ( 2, 2 ))
        , test "When the cell is below" <|
            \() ->
                Expect.true "" (cellNextToOther givenCell ( 2, 0 ))
        , test "When the cell is diagonally top left" <|
            \() ->
                Expect.true "" (cellNextToOther givenCell ( 1, 2 ))
        , test "When the cell is diagonally bottom left" <|
            \() ->
                Expect.true "" (cellNextToOther givenCell ( 1, 0 ))
        , test "When the cell is diagonally top right" <|
            \() ->
                Expect.true "" (cellNextToOther givenCell ( 3, 2 ))
        , test "when the cell is diagonally bottom right" <|
            \() ->
                Expect.true "" (cellNextToOther givenCell ( 3, 0 ))
        , test "when the cell is a negative X" <|
            \() ->
                Expect.true "" (cellNextToOther ( 0, 0 ) ( -1, 0 ))
        ]
