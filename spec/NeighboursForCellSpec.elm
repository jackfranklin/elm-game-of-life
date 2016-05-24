module NeighboursForCellSpec exposing (..)

import String
import ElmTest exposing (..)
import GameOfLife exposing (neighboursForCell)


givenCell =
    ( 2, 1 )


cells =
    [ ( 2, 1 ), ( 3, 1 ), ( 2, 2 ), ( 4, 4 ) ]


expectedCells =
    [ ( 3, 1 ), ( 2, 2 ) ]


tests : Test
tests =
    suite "#neighboursForCell"
        [ test "when given other cells"
            (assertEqual expectedCells (neighboursForCell givenCell cells))
        ]
