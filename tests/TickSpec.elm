module TickSpec exposing (firstTestInput, firstTestOutput, tests)

import Debug
import Expect
import GameOfLife exposing (tick)
import String
import Test exposing (..)


firstTestInput =
    [ ( 0, 0 ), ( 0, 1 ), ( 0, 2 ) ]


firstTestOutput =
    [ ( 0, 1 ), ( -1, 1 ), ( 1, 1 ) ]


tests : Test
tests =
    describe "#tick"
        [ test "given overcrowded board" <|
            \() ->
                Expect.equal firstTestOutput (tick firstTestInput)
        ]
