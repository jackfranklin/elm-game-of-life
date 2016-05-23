module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style, class)
import Html.App as Html
import String
import GameOfLife exposing (Cell, tick, minimumCoordinates)


main =
    Html.beginnerProgram { model = initialModel, view = view, update = update }


type alias Model =
    { cells : List Cell }


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
            String.append (toString (y * -1 * 50)) "px"


leftForCell : Cell -> String
leftForCell cell =
    case cell of
        ( x, _ ) ->
            String.append (toString (x * 50)) "px"


mainLeftMargin : List Cell -> String
mainLeftMargin cells =
    case minimumCoordinates cells of
        ( x, _ ) ->
            String.append (toString (100 + (abs (x * 50)))) "px"


mainTopMargin : List Cell -> String
mainTopMargin cells =
    case minimumCoordinates cells of
        ( _, y ) ->
            String.append (toString (100 + (abs (y * 50)))) "px"


styleForCell : Cell -> Attribute msg
styleForCell cell =
    style
        [ ( "width", "20px" )
        , ( "height", "20px" )
        , ( "list-style", "none" )
        , ( "top", topForCell cell )
        , ( "left", leftForCell cell )
        , ( "background", "red" )
        , ( "position", "absolute" )
        ]


cellToListItem : Cell -> Html Msg
cellToListItem cell =
    li [ styleForCell cell ] []


renderBoard : List Cell -> Html Msg
renderBoard cells =
    ul
        [ style
            [ ( "margin-top", mainTopMargin cells )
            , ( "margin-left", mainLeftMargin cells )
            , ( "position", "relative" )
            ]
        ]
        (List.map cellToListItem cells)


view : Model -> Html Msg
view model =
    div [ style [ ( "margin", "50px 0 0 50px" ) ] ]
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
