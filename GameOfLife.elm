module GameOfLife where

import Maybe exposing (Maybe(..))
import Debug exposing (log)

import Set

type alias Cell = (Int, Int)

myLog: String -> a -> a
myLog taggedString thing =
  let
    stringThing = (toString thing)
  in
   case (log taggedString stringThing) of
     _ -> thing

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

neighbouringCellsForCell: Cell -> List Cell
neighbouringCellsForCell cell =
  case cell of
    (x, y) ->
      [(x - 1, y - 1),
       (x - 1, y),
       (x - 1, y + 1),
       (x, y - 1),
       (x, y + 1),
       (x + 1, y - 1),
       (x + 1, y),
       (x + 1, y + 1)]


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


minOrMaxCoordinates: List Cell -> (List comparable -> Maybe comparable) -> Cell
minOrMaxCoordinates cells f =
  (
    Maybe.withDefault 0 (f (fst (List.unzip cells))),
    Maybe.withDefault 0 (f (snd (List.unzip cells)))
  )

minimumCoordinates: List Cell -> Cell
minimumCoordinates cells =
  minOrMaxCoordinates cells List.minimum

maximumCoordinates: List Cell -> Cell
maximumCoordinates cells =
  minOrMaxCoordinates cells List.maximum

cellIsAlive: Cell -> List Cell -> Bool
cellIsAlive cell cells =
  List.member cell cells

isNothingCell: (Maybe Cell) -> Bool
isNothingCell cell =
  case cell of
    Just _ -> True
    Nothing -> False

isJustCell: (Maybe Cell) -> Bool
isJustCell cell =
  (not (isNothingCell cell))

processCell: Cell -> List Cell -> Maybe Cell
processCell cell cells =
  case shouldDie cell cells of
    True -> Nothing
    _ -> Just cell


reincarnateDeadNeighours: Cell -> List Cell -> List Cell
reincarnateDeadNeighours cell cells =
  (neighbouringCellsForCell cell)
    |> List.filter (\cell -> (shouldComeToLife cell cells))

bringBackDeadCells: List Cell -> List Cell
bringBackDeadCells cells =
  cells
    |> List.map (\c -> (reincarnateDeadNeighours c cells))
    |> List.concat
    |> Set.fromList
    |> Set.toList

getNewLiveCells: List Cell -> List Cell
getNewLiveCells cells =
  (List.filterMap (\cell -> (processCell cell cells)) cells)

tick: List Cell -> List Cell
tick cells =
  List.append (getNewLiveCells cells) (bringBackDeadCells cells)
