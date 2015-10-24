module GameOfLife where

type alias Cell = (Int, Int)

cellNextToOther: Cell -> Cell -> Bool
cellNextToOther cellOne cellTwo =
  case cellOne of
    (x1, y1) ->
      case cellTwo of
        (x2, y2) ->
          (abs (x1 - x2) <= 1) &&
          (abs (y1 - y2) <= 1) &&
          -- make sure that we're not dealing with the same cell twice
          (not (x1 == x2 && y1 == y2))

neighboursForCell: Cell -> List Cell -> List Cell
neighboursForCell cell cells =
  List.filter (cellNextToOther cell) cells

-- shouldDie: Cell -> Bool
-- shouldDie cell =

