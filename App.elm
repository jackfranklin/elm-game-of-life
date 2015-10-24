import Html exposing (..)
import StartApp.Simple as StartApp
import GameOfLife exposing (Cell)

main =
  StartApp.start { model = model, view = view, update = update }

type alias Model =
  { cells: List Cell }

model = { cells = [] }

view address model =
  div [] [ text "Hello World" ]

type Action = NoOp

update action model =
  case action of
    NoOp -> model

