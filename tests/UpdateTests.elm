module UpdateTests exposing (all)

import Test exposing (..)
import Expect
import Helpers
import Update exposing (..)
import Routing exposing (Route(..))
import Messages exposing (Msg(..))


all : Test
all =
    describe "Update"
        [ updateTest
        ]


updateTest : Test
updateTest =
    describe "update"
        [ test "Model route is updated on url change to new route" <|
            \_ ->
                let
                    initialModel =
                        { route = NotFound }

                    urlChangeMsg =
                        UrlChange (Helpers.location "lists")

                    expectedModel =
                        { route = Overview }
                in
                    initialModel
                        |> update urlChangeMsg
                        |> Expect.equal ( expectedModel, Cmd.none )
        , test "Model route stays the same on url change to same route" <|
            \_ ->
                let
                    initialModel =
                        { route = NotFound }

                    urlChangeMsg =
                        UrlChange (Helpers.location "unknown")
                in
                    initialModel
                        |> update urlChangeMsg
                        |> Expect.equal ( initialModel, Cmd.none )
        ]
