module Main exposing (main, tests)

import CellNextToOtherSpec
import CoordinatesSpec
import NeighboursForCellSpec
import PotentialNeighbouringCellsForCellSpec
import ShouldComeToLifeSpec
import ShouldDieSpec
import String
import Test exposing (..)
import TickSpec


tests : Test
tests =
    describe "GameOfLife"
        [ CellNextToOtherSpec.tests
        , NeighboursForCellSpec.tests
        , ShouldDieSpec.tests
        , ShouldComeToLifeSpec.tests
        , CoordinatesSpec.tests
        , TickSpec.tests
        , PotentialNeighbouringCellsForCellSpec.tests
        ]


main =
    runSuiteHtml tests
