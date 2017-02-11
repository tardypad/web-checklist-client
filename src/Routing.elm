module Routing exposing (Route(..), route)

import Navigation exposing (Location)
import UrlParser exposing (Parser, (</>), s, int, map, top, oneOf, parseHash)


type Route
    = Collection
    | Checklist Int
    | NotFound


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Collection (s "lists" </> top)
        , map Checklist (s "lists" </> int)
        , map Collection top
        ]


route : Location -> Route
route location =
    parseHash routeParser location
        |> Maybe.withDefault NotFound
