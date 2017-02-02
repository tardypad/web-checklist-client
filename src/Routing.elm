module Routing exposing (Route(..), route)

import Navigation exposing (Location)
import UrlParser exposing (Parser, (</>), s, int, map, top, oneOf, parseHash)


type Route
    = Overview
    | Item Int
    | NotFound


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Overview (s "lists" </> top)
        , map Item (s "lists" </> int)
        ]


route : Location -> Route
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
