module View exposing (view)

import Html exposing (..)
import Routing exposing (Route(..))
import Model exposing (Model)


view : Model -> Html msg
view model =
    let
        url =
            case model.route of
                Overview ->
                    "overview"

                Item id ->
                    "item " ++ toString id

                NotFound ->
                    "not found"
    in
        div []
            [ h1 [] [ text url ]
            ]
