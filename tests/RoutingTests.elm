module RoutingTests exposing (all)

import Test exposing (..)
import Expect
import Helpers
import Fuzz exposing (Fuzzer)
import Routing exposing (..)


all : Test
all =
    describe "Routing"
        [ routeTest
        ]


validListId : Fuzzer Int
validListId =
    Fuzz.int


routeTest : Test
routeTest =
    describe "route"
        [ test "Home is routed to Overview" <|
            \_ ->
                Helpers.location ""
                    |> route
                    |> Expect.equal Overview
        , test "Lists is routed to Overview" <|
            \_ ->
                Helpers.location "lists"
                    |> route
                    |> Expect.equal Overview
        , fuzz validListId "Lists/id is routed to Item id if id is valid" <|
            \id ->
                Helpers.location ("lists/" ++ (toString id))
                    |> route
                    |> Expect.equal (Item id)
        , test "Lists/id is routed to NotFound if id is invalid" <|
            \_ ->
                Helpers.location "lists/thisisnotanid"
                    |> route
                    |> Expect.equal NotFound
        , test "Unknown url is routed to NotFound" <|
            \_ ->
                Helpers.location "unknown"
                    |> route
                    |> Expect.equal NotFound
        ]
