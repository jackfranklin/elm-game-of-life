import String
import Graphics.Element exposing (Element)

import ElmTest.Test exposing (test, Test, suite)
import ElmTest.Assertion exposing (assert, assertEqual)
import ElmTest.Runner.Element exposing (runDisplay)

import GameOfLife exposing (cellNextToOther)

import CellNextToOtherSpec
import NeighboursForCellSpec


givenCell = (2, 1)

tests : Test
tests =
    suite "GameOfLife"
      [
        CellNextToOtherSpec.tests,
        NeighboursForCellSpec.tests
      ]


main = runDisplay tests
