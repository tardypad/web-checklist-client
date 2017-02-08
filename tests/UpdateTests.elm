module UpdateTests exposing (all)

import Test exposing (..)
import Expect
import Update exposing (..)
import Routing exposing (Route(..))
import Messages exposing (Msg(..))
import Navigation exposing (Location)


all : Test
all =
    describe "Update"
        [ updateTest
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


updateTest : Test
updateTest =
    describe "update"
        [ test "Model route is updated on url change to new route" <|
            \_ ->
                let
                    initialModel =
                        { route = NotFound }

                    urlChangeMsg =
                        UrlChange (location "lists")

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
                        UrlChange (location "unknown")
                in
                    initialModel
                        |> update urlChangeMsg
                        |> Expect.equal ( initialModel, Cmd.none )
        ]
