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
        , map Overview top
        ]


route : Location -> Route
route location =
    parseHash routeParser location
        |> Maybe.withDefault NotFound
