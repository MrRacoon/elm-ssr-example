module Main exposing (main)

import State exposing (init, update, subscriptions)
import View exposing (view)
import Types exposing (Model, Msg(..))
import Html exposing (program)


main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
