module Types exposing (..)


type alias Model =
    { count : Int
    }


type Msg
    = Increment
    | Decrement
