module Helpers exposing (location)

import Navigation exposing (Location)


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
