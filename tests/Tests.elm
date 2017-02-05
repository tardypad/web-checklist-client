module Tests exposing (all)

import Test exposing (..)
import RoutingTests


all : Test
all =
    describe "Checklist client"
        [ RoutingTests.all
        ]
