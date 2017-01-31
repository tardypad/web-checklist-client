module App exposing (main)

import Model exposing (Model, init)
import Update exposing (update)
import Messages exposing (Msg(..))
import View exposing (view)
import Navigation exposing (program)


main : Program Never Model Msg
main =
    program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }
