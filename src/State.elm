module State exposing (State, init, update, subscriptions)

import Types exposing (ChessPlayerColor, ChessBoard, ChessBoardSquare, Msg)


type alias State =
    { toMove : ChessPlayerColor
    , board : ChessBoard
    }


initialState : State
initialState =
    { toMove = Types.White
    , board = List.repeat 128 Types.Empty
    }


init : ( State, Cmd Msg )
init =
    ( initialState, Cmd.none )


update : Msg -> State -> ( State, Cmd Msg )
update msg state =
    case msg of
        Types.Noop ->
            ( state, Cmd.none )


subscriptions : State -> Sub Msg
subscriptions state =
    Sub.none
