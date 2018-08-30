module Main exposing (Model, Msg(..), cellToListItem, initialModel, leftForCell, main, mainLeftMargin, mainTopMargin, renderBoard, styleForCell, topForCell, update, view)

import Browser
import GameOfLife exposing (Cell, minimumCoordinates, tick)
import Html exposing (..)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import String


main =
    Browser.sandbox { init = initialModel, view = view, update = update }


type alias Model =
    { cells : List Cell }


initialModel : Model
initialModel =
    { cells =
        [ ( 0, 0 )
        , ( 1, 0 )
        , ( 2, 0 )
        , ( -1, -1 )
        , ( 0, -1 )
        , ( 1, -1 )
        , ( 3, 1 )
        ]
    }


topForCell : Cell -> String
topForCell cell =
    case cell of
        ( _, y ) ->
            String.append (String.fromInt (y * -1 * 50)) "px"


leftForCell : Cell -> String
leftForCell cell =
    case cell of
        ( x, _ ) ->
            String.append (String.fromInt (x * 50)) "px"


mainLeftMargin : List Cell -> String
mainLeftMargin cells =
    case minimumCoordinates cells of
        ( x, _ ) ->
            String.append (String.fromInt (100 + abs (x * 50))) "px"


mainTopMargin : List Cell -> String
mainTopMargin cells =
    case minimumCoordinates cells of
        ( _, y ) ->
            String.append (String.fromInt (100 + abs (y * 50))) "px"


styleForCell : Cell -> List (Attribute Msg)
styleForCell cell =
    [ style "width" "20px"
    , style "height" "20px"
    , style "list-style" "none"
    , style "top" <| topForCell cell
    , style "left" <| leftForCell cell
    , style "background" "red"
    , style "position" "absolute"
    ]


cellToListItem : Cell -> Html Msg
cellToListItem cell =
    li (styleForCell cell) []


renderBoard : List Cell -> Html Msg
renderBoard cells =
    ul
        [ style "margin-top" (mainTopMargin cells)
        , style "margin-left" (mainLeftMargin cells)
        , style "position" "relative"
        ]
        (List.map cellToListItem cells)


view : Model -> Html Msg
view model =
    div [ style "margin" "50px 0 0 50px" ]
        [ h1 [] [ text "Elm Game Of Life" ]
        , button [ onClick Tick ] [ text "Tick" ]
        , renderBoard model.cells
        ]



-- TODO: to generate a proper board
-- xVals = [-4..2]
-- yVals = [-3..5]
-- List.concatMap (\x -> (List.map (\y -> (x, y)) yVals)) xVals


type Msg
    = Tick


update : Msg -> Model -> Model
update action model =
    case action of
        Tick ->
            { model | cells = tick model.cells }
