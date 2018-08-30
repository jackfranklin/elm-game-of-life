module CoordinatesSpec exposing (cells, tests)

import Expect
import GameOfLife exposing (maximumCoordinates, minimumCoordinates)
import String
import Test exposing (..)


cells =
    [ ( -1, 2 ), ( -2, 3 ), ( 2, 4 ), ( 3, -1 ), ( 0, 0 ) ]


tests : Test
tests =
    describe "Coordinates"
        [ test "it finds the min X and Y for a given board of cells" <|
            \() ->
                Expect.equal ( -2, -1 ) (minimumCoordinates cells)
        , test "it finds the max X and Y for a given board of cells" <|
            \() ->
                Expect.equal ( 3, 4 ) (maximumCoordinates cells)
        ]
