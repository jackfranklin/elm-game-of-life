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

shouldDie: Cell -> List Cell -> Bool
shouldDie cell cells =
  case List.length (neighboursForCell cell cells) of
    2 -> False
    3 -> False
    _ -> True

shouldComeToLife: Cell -> List Cell -> Bool
shouldComeToLife cell cells =
  case List.member cell cells of
    -- in case the cell is actually alive, it shouldn't come back to life
    True -> False
    False ->
      case List.length (neighboursForCell cell cells) of
        3 -> True
        _ -> False




