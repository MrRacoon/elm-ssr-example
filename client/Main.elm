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



-- elm-static-html requires a `view` variable at the root of the project.
-- We're simply going to give our view the initial state.


view : Html Msg
view =
    View.view <| Tuple.first init
