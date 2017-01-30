module Main exposing (..)

import Navigation
import UrlParser exposing (Parser, (</>), s, int, map, top, oneOf, parseHash)
import Html exposing (..)


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }



-- Model


type alias Model =
    { route : Route
    }


type Route
    = Overview
    | Item Int
    | NotFound


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( { route = route location }
    , Cmd.none
    )



-- Update


type Msg
    = UrlChange Navigation.Location


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ UrlParser.map Overview (UrlParser.s "lists" </> top)
        , UrlParser.map Item (UrlParser.s "lists" </> int)
        , UrlParser.map NotFound (UrlParser.s "not-found" </> top)
        ]


route : Navigation.Location -> Route
route location =
    let
        parsedRoute =
            parseHash routeParser location
    in
        case parsedRoute of
            Just Overview ->
                Overview

            Just (Item id) ->
                Item id

            Just NotFound ->
                NotFound

            Nothing ->
                NotFound


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



-- View


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
