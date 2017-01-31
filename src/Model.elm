module Model exposing (Model, init)

import Messages exposing (Msg)
import Routing exposing (Route, route)
import Navigation exposing (Location)


type alias Model =
    { route : Route
    }


init : Location -> ( Model, Cmd Msg )
init location =
    ( { route = route location }
    , Cmd.none
    )
