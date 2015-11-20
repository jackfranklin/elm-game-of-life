import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style, class)
import StartApp.Simple as StartApp
import String
import GameOfLife exposing (Cell, tick, minimumCoordinates)

main : Signal Html
main =
  StartApp.start { model = initialModel, view = view, update = update }

type alias Model =
  { cells: List Cell }

initialModel =
  { cells = [
    (0, 0), (1, 0), (2, 0),
    (-1, -1), (0, -1), (1, -1)
  ] }

topForCell: Cell -> String
topForCell cell =
  case cell of
    (_, y) ->
      String.append (toString (y * -1 * 50)) "px"

leftForCell: Cell -> String
leftForCell cell =
  case cell of
    (x, _) ->
      String.append (toString (x * 50)) "px"

mainLeftMargin : List Cell -> String
mainLeftMargin cells =
  case minimumCoordinates cells of
    (x, _) ->
      String.append (toString (100 + (abs (x * 50)))) "px"

mainTopMargin : List Cell -> String
mainTopMargin cells =
  case minimumCoordinates cells of
    (_, y) ->
      String.append (toString (100 + (abs (y * 50)))) "px"

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
  li [ styleForCell cell ] []

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
    [ style [("margin", "50px 0 0 50px")] ]
    [
      h1 [] [ text "Elm Game Of Life" ],
      button [ onClick address Tick ] [ text "Tick" ],
      renderBoard model.cells
    ]

-- TODO: to generate a proper board
-- xVals = [-4..2]
-- yVals = [-3..5]

-- List.concatMap (\x -> (List.map (\y -> (x, y)) yVals)) xVals
type Action = Tick

update : Action -> Model -> Model
update action model =
  case action of
    Tick -> { model | cells = tick model.cells }

