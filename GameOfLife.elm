module GameOfLife where

type alias Cell = (Int, Int)

cellNextToOther: Cell -> Cell -> Bool
cellNextToOther cellOne cellTwo =
  True

neighboursForCell: Cell -> List Cell -> List Cell
neighboursForCell cell cells =
  List.filter (cellNextToOther cell) cells

-- shouldDie: Cell -> Bool
-- shouldDie cell =

