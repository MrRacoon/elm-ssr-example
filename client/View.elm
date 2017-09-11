module View exposing (view)

import Html exposing (Html, div, button, text)
import Html.Attributes exposing (id)
import Html.Events exposing (onClick)
import Types exposing (Model, Msg(..))


view : Model -> Html Msg
view model =
    div [ id "main" ]
        [ div [ onClick Increment ] [ button [] [ text "increment" ] ]
        , div [] [ text <| toString model.count ]
        , div [ onClick Decrement ] [ button [] [ text "decrement" ] ]
        ]
