module RoutingTests exposing (all)

import Test exposing (..)
import Expect
import Fuzz exposing (Fuzzer)
import Routing exposing (..)
import Navigation exposing (Location)


all : Test
all =
    describe "Routing"
        [ routeTest
        ]


location : String -> Location
location urlHash =
    { href = "https://elm.lang/checklist#" ++ urlHash
    , host = "elm.lang"
    , hostname = "elm.lang"
    , protocol = "https"
    , origin = "https://elm.lang"
    , port_ = ""
    , pathname = "checklist"
    , search = ""
    , hash = "#" ++ urlHash
    , username = ""
    , password = ""
    }


validListId : Fuzzer Int
validListId =
    Fuzz.int


routeTest : Test
routeTest =
    describe "route"
        [ test "Home is routed to Overview" <|
            \_ ->
                location ""
                    |> route
                    |> Expect.equal Overview
        , test "Lists is routed to Overview" <|
            \_ ->
                location "lists"
                    |> route
                    |> Expect.equal Overview
        , fuzz validListId "Lists/id is routed to Item id if id is valid" <|
            \id ->
                location ("lists/" ++ (toString id))
                    |> route
                    |> Expect.equal (Item id)
        , test "Lists/id is routed to NotFound if id is invalid" <|
            \_ ->
                location "lists/thisisnotanid"
                    |> route
                    |> Expect.equal NotFound
        , test "Unknown url is routed to NotFound" <|
            \_ ->
                location "unknown"
                    |> route
                    |> Expect.equal NotFound
        ]
