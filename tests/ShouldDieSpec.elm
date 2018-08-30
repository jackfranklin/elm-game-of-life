module ShouldDieSpec exposing (tests)

import Expect
import GameOfLife exposing (shouldDie)
import String
import Test exposing (..)


tests : Test
tests =
    describe "#shouldDie"
        [ test "when the cell has less than two neighbours" <|
            \() ->
                Expect.true "" (shouldDie ( 1, 1 ) [ ( 1, 1 ) ])
        , test "when the cell has two neighbours" <|
            \() ->
                Expect.true "" (not (shouldDie ( 1, 1 ) [ ( 1, 1 ), ( 2, 1 ), ( 1, 2 ) ]))
        , test "when the cell has three neighbours" <|
            \() ->
                Expect.true "" (not (shouldDie ( 1, 1 ) [ ( 0, 1 ), ( 1, 1 ), ( 2, 1 ), ( 1, 2 ) ]))
        , test "when the cell has four neighbours" <|
            \() ->
                Expect.true "" (shouldDie ( 1, 1 ) [ ( 1, 0 ), ( 0, 1 ), ( 1, 1 ), ( 2, 1 ), ( 1, 2 ) ])
        ]
