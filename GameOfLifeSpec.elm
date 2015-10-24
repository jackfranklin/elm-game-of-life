import String
import Graphics.Element exposing (Element)

import ElmTest.Test exposing (test, Test, suite)
import ElmTest.Assertion exposing (assert, assertEqual)
import ElmTest.Runner.Element exposing (runDisplay)

import GameOfLife exposing (cellNextToOther)


givenCell = (2, 1)

tests : Test
tests =
    suite "#cellNextToOther"
        [ test "When the cell is to the left"
            (assert (cellNextToOther givenCell (1, 1)))
        ]


main = runDisplay tests
