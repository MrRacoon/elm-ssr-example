module State exposing (init, update, subscriptions)

import Types exposing (Model, Msg(..))


init : ( Model, Cmd Msg )
init =
    { count = 0
    }
        ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1 } ! []

        Decrement ->
            { model | count = model.count - 1 } ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
