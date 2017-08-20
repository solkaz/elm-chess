module View exposing (view)

import Bitwise
import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
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
            List.indexedMap (,) board
                |> List.partition (\x -> (Bitwise.and (first x) 136) == 0)
                |> first
                -- Take the list of valid squares
                |> List.map second
                -- Get the squares
                |> groupsOf 8

        -- Group the squares into rows of 8
    in
        table [] (List.reverse (List.indexedMap boardRowView rows))


boardRowView : Int -> List Types.ChessBoardSquare -> Html Types.Msg
boardRowView rowNumber row =
    let
        styles =
            style [ ( "height", "50px" ) ]
    in
        tr [] (List.indexedMap (\x sq -> squareView (x + (rowNumber % 2)) sq) row)


squareView : Int -> ChessBoardSquare -> Html Msg
squareView squareIndex square =
    let
        color =
            if squareIndex % 2 == 0 then
                "gray"
            else
                "white"

        styles =
            style
                [ ( "backgroundColor", color )
                , ( "width", "50px" )
                , ( "height", "50px" )
                , ( "text-align", "center" )
                , ( "font-size", "36px" )
                ]
    in
        td [ styles ] [ pieceView square ]


pieceView : ChessBoardSquare -> Html Msg
pieceView square =
    case square of
        Empty ->
            span [] []

        Occupied { color, type_ } ->
            let
                styles =
                    style
                        [ ( "cursor", "pointer" )
                        , ( "user-select", "none" )
                        ]
            in
                case type_ of
                    Pawn ->
                        if color == Black then
                            span [ styles ] [ text "♟" ]
                        else
                            span [ styles ] [ text "♙" ]

                    Knight ->
                        if color == Black then
                            span [ styles ] [ text "♞" ]
                        else
                            span [ styles ] [ text "♘" ]

                    Rook ->
                        if color == Black then
                            span [ styles ] [ text "♜" ]
                        else
                            span [ styles ] [ text "♖" ]

                    Bishop ->
                        if color == Black then
                            span [ styles ] [ text "♝" ]
                        else
                            span [ styles ] [ text "♗" ]

                    Queen ->
                        if color == Black then
                            span [ styles ] [ text "♛" ]
                        else
                            span [ styles ] [ text "♕" ]

                    King ->
                        if color == Black then
                            span [ styles ] [ text "♚" ]
                        else
                            span [ styles ] [ text "♔" ]
