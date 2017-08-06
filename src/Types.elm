module Types exposing (..)


type Msg
    = Noop


{-| Represents the color of the player
-}
type ChessPlayerColor
    = Black
    | White


type ChessPieceType
    = Pawn
    | Knight
    | Rook
    | Bishop
    | Queen
    | King


type alias ChessPiece =
    { color : ChessPlayerColor
    , type_ : ChessPieceType
    }


type ChessBoardSquare
    = Empty
    | Occupied ChessPiece


{-| Represents a chess board using the 0x88 method
-}
type alias ChessBoard =
    List ChessBoardSquare
