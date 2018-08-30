module ShouldComeToLifeSpec exposing (deadCell, tests)

import Expect
import GameOfLife exposing (shouldComeToLife)
import String
import Test exposing (..)


deadCell =
    ( 1, 1 )


tests : Test
tests =
    describe "#comeToLife"
        [ test "when the cell is actually alive it is false" <|
            \() ->
                Expect.true "" (not (shouldComeToLife deadCell [ ( 1, 1 ), ( 2, 1 ) ]))
        , test "when the cell should come to life" <|
            \() ->
                Expect.true "" (shouldComeToLife deadCell [ ( 0, 0 ), ( 0, 1 ), ( 1, 0 ) ])
        , test "when the cell only has two neighbours" <|
            \() ->
                Expect.true "" (not (shouldComeToLife deadCell [ ( 0, 0 ), ( 0, 1 ) ]))
        ]
