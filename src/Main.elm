module Main exposing (..)

import Html exposing (..)
import Types exposing (Msg)
import State exposing (State, init, update, subscriptions)
import View exposing (view)


--import Html.Attributes exposing (..)
--import Html.Events exposing (onClick)


main : Program Never State Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
