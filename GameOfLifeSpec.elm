import String
import Graphics.Element exposing (Element)

import ElmTest.Test exposing (test, Test, suite)
import ElmTest.Assertion exposing (assert, assertEqual)
import ElmTest.Runner.Element exposing (runDisplay)

import CellNextToOtherSpec
import NeighboursForCellSpec
import ShouldDieSpec
import ShouldComeToLifeSpec
import CoordinatesSpec
import TickSpec

tests : Test
tests =
    suite "GameOfLife"
      [
        CellNextToOtherSpec.tests,
        NeighboursForCellSpec.tests,
        ShouldDieSpec.tests,
        ShouldComeToLifeSpec.tests,
        CoordinatesSpec.tests,
        TickSpec.tests
      ]


main = runDisplay tests
