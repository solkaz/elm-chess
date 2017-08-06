module State exposing (State, init, update, subscriptions)

import Types exposing (ChessPlayerColor, ChessBoard, ChessBoardSquare, Msg)


type alias State =
    { toMove : ChessPlayerColor
    , board : ChessBoard
    }


initialState : State
initialState =
    { toMove = Types.White
    , board =
        List.concat
            [ backRow Types.White
            , emptyRow
            , frontRow Types.White
            , emptyRow
            , List.concat (List.repeat 8 emptyRow)
            , frontRow Types.Black
            , emptyRow
            , backRow Types.Black
            , emptyRow
            ]
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


{-| Creates a row of pawns with the given color
-}
frontRow : Types.ChessPlayerColor -> List Types.ChessBoardSquare
frontRow color =
    List.repeat 8 (Types.Occupied { color = color, type_ = Types.Pawn })


{-| Creates a row of major pieces with the given color
-}
backRow : Types.ChessPlayerColor -> List Types.ChessBoardSquare
backRow color =
    [ Types.Occupied { color = color, type_ = Types.Rook }
    , Types.Occupied { color = color, type_ = Types.Knight }
    , Types.Occupied { color = color, type_ = Types.Bishop }
    , Types.Occupied { color = color, type_ = Types.Queen }
    , Types.Occupied { color = color, type_ = Types.King }
    , Types.Occupied { color = color, type_ = Types.Bishop }
    , Types.Occupied { color = color, type_ = Types.Knight }
    , Types.Occupied { color = color, type_ = Types.Rook }
    ]


emptyRow : List Types.ChessBoardSquare
emptyRow =
    List.repeat 8 Types.Empty
