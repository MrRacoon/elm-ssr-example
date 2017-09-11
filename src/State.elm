module State exposing (init, update, subscriptions)

import Types exposing (Model, Msg(..))


init : ( Model, Cmd Msg )
init =
    {} ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msg ->
            model ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
