module NeighboursForCellSpec exposing (cells, expectedCells, givenCell, tests)

import Expect
import GameOfLife exposing (neighboursForCell)
import String
import Test exposing (..)


givenCell =
    ( 2, 1 )


cells =
    [ ( 2, 1 ), ( 3, 1 ), ( 2, 2 ), ( 4, 4 ) ]


expectedCells =
    [ ( 3, 1 ), ( 2, 2 ) ]


tests : Test
tests =
    describe "#neighboursForCell"
        [ test "when given other cells" <|
            \() ->
                Expect.equal expectedCells (neighboursForCell givenCell cells)
        ]
