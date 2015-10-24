import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style, class)
import StartApp.Simple as StartApp
import ConsoleLog exposing (log)
import String
import GameOfLife exposing (Cell, tick, minimumCoordinates)

main : Signal Html
main =
  StartApp.start { model = initialModel, view = view, update = update }

type alias Model =
  { cells: List Cell }

initialModel =
  { cells = [(0, 0), (0, 1), (0, 2)] }

topForCell: Cell -> String
topForCell cell =
  case cell of
    (_, y) ->
      String.append (toString (y * 50)) "px"

leftForCell: Cell -> String
leftForCell cell =
  case cell of
    (x, _) ->
      String.append (toString (x * 50)) "px"

mainLeftMargin : List Cell -> String
mainLeftMargin cells =
  case minimumCoordinates cells of
    (x, _) ->
      String.append (toString (abs (x * 50))) "px"

mainTopMargin : List Cell -> String
mainTopMargin cells =
  case minimumCoordinates cells of
    (_, y) ->
      String.append (toString (abs (y * 50))) "px"

styleForCell : Cell -> Attribute
styleForCell cell =
  style [
    ("width", "20px"),
    ("height", "20px"),
    ("list-style", "none"),
    ("top", topForCell cell),
    ("left", leftForCell cell),
    ("background", "red"),
    ("position", "absolute")]

cellToListItem : Cell -> Html
cellToListItem cell =
  li
    [ styleForCell cell ]
    [
      text ""
    ]

renderBoard : List Cell -> Html
renderBoard cells =
  ul
    [
      style [
        ("margin-top", mainTopMargin cells),
        ("margin-left", mainLeftMargin cells),
        ("position", "relative")]
    ]
    (List.map cellToListItem cells)

view : Signal.Address Action -> Model -> Html
view address model =
  div
    [ style [("margin", "50px auto")] ]
    [
      text "Game Of Life",
      button [ onClick address Tick ] [ text "Tick" ],
      renderBoard model.cells
    ]

type Action = Tick

update : Action -> Model -> Model
update action model =
  case action of
    Tick -> { model | cells <- (log "cells" (tick model.cells)) }

