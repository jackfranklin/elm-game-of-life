import String
import Graphics.Element exposing (Element)

import ElmTest exposing (..)

import CellNextToOtherSpec
import NeighboursForCellSpec
import ShouldDieSpec
import ShouldComeToLifeSpec
import CoordinatesSpec
import TickSpec
import PotentialNeighbouringCellsForCellSpec

tests : Test
tests =
    suite "GameOfLife"
      [
        CellNextToOtherSpec.tests,
        NeighboursForCellSpec.tests,
        ShouldDieSpec.tests,
        ShouldComeToLifeSpec.tests,
        CoordinatesSpec.tests,
        TickSpec.tests,
        PotentialNeighbouringCellsForCellSpec.tests
      ]


main : Element
main =
  elementRunner tests
