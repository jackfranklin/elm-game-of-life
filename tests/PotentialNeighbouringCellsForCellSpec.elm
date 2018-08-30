module PotentialNeighbouringCellsForCellSpec exposing (cellOne, cellTwo, expectedOne, expectedTwo, tests)

import Expect
import GameOfLife exposing (potentialNeighbouringCellsForCell)
import String
import Test exposing (..)


cellOne =
    ( 0, 0 )


expectedOne =
    [ ( -1, -1 )
    , ( -1, 0 )
    , ( -1, 1 )
    , ( 0, -1 )
    , ( 0, 1 )
    , ( 1, -1 )
    , ( 1, 0 )
    , ( 1, 1 )
    ]


cellTwo =
    ( 1, -1 )


expectedTwo =
    [ ( 0, -2 )
    , ( 0, -1 )
    , ( 0, 0 )
    , ( 1, -2 )
    , ( 1, 0 )
    , ( 2, -2 )
    , ( 2, -1 )
    , ( 2, 0 )
    ]


tests : Test
tests =
    describe "#potentialNeighbouringCellsForCell"
        [ test "it returns the potential neighbours" <|
            \() ->
                Expect.equal expectedOne (potentialNeighbouringCellsForCell cellOne)
        , test "it deals with a negative cell" <|
            \() ->
                Expect.equal expectedTwo (potentialNeighbouringCellsForCell cellTwo)
        ]
