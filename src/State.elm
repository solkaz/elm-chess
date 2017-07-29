module State exposing (init)

import Array exposing (Array)
import Types exposing (ChessPlayerColor, ChessBoard, ChessBoardSquare)


type alias State =
    { toMove : ChessPlayerColor
    , board : ChessBoard
    }


init : State
init =
    { toMove = Types.White
    , board = Array.repeat 128 Types.Empty
    }
