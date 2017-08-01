module View exposing (view)

import Array exposing (Array)
import Bitwise
import Html exposing (..)
import Html.Attributes exposing (style)
import List.Extra exposing (groupsOf)
import Tuple exposing (first, second)
import Types exposing (..)
import State exposing (..)


view : State -> Html Msg
view state =
    div []
        [ boardView state.board
        ]


boardView : Types.ChessBoard -> Html Types.Msg
boardView board =
    let
        rows =
            Array.toIndexedList board
                |> List.partition (\x -> (Bitwise.and (first x) 136) == 0)
                |> first
                -- Take the list of valid squares
                |> List.map second
                -- Get the squares
                |> groupsOf 8

        -- Group the squares into rows of 8
    in
        table [] (List.indexedMap boardRowView rows)


boardRowView : Int -> List Types.ChessBoardSquare -> Html Types.Msg
boardRowView rowNumber row =
    let
        styles =
            style [ ( "height", "50px" ) ]
    in
        tr [] (List.indexedMap (\x sq -> squareView (x + (1 + rowNumber % 2))) row)


squareView : Int -> Html Msg
squareView squareIndex =
    let
        color =
            if squareIndex % 2 == 0 then
                "black"
            else
                "white"

        styles =
            style
                [ ( "backgroundColor", color )
                , ( "width", "50px" )
                , ( "height", "50px" )
                ]
    in
        td [ styles ] []
