module Main exposing (main, view)

import State exposing (init, update, subscriptions)
import View as View
import Types exposing (Model, Msg(..))
import Html exposing (Html, program)


main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , view = View.view
        , subscriptions = subscriptions
        }


view : Html Msg
view =
    let
        ( initModel, _ ) =
            init
    in
        View.view initModel
