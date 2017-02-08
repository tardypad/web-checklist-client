module Tests exposing (all)

import Test exposing (..)
import RoutingTests
import UpdateTests


all : Test
all =
    describe "Checklist client"
        [ RoutingTests.all
        , UpdateTests.all
        ]
