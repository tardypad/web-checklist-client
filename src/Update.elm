module Update exposing (update)

import Model exposing (Model)
import Messages exposing (Msg(..))
import Navigation exposing (Location)
import Routing exposing (route)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            let
                r =
                    route location
            in
                ( { model | route = r }
                , Cmd.none
                )
