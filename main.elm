import Html exposing (Html, button, div, text, table, tbody, thead, tr, td, th)
import Html.App as Html
import Html.Events exposing (onClick)

main =
  Html.beginnerProgram { model = model, view = view, update = update}

type alias Team = String

teams : List Team
teams = [ "England", "Wales", "Slovakia", "Russia" ]

type alias Listing =
  { name : Team,
    goalsFor : Int,
    goalsAgainst : Int,
    points : Int
  }

type alias Group = List Listing

initialGroup : Group
initialGroup =
  [
    { name = "England"
    , goalsFor = 4
    , goalsAgainst = 1
    , points = 7
    },
    { name = "Wales"
    , goalsFor = 5
    , goalsAgainst = 2
    , points = 6
    },
    { name = "Slovakia"
    , goalsFor = 1
    , goalsAgainst = 1
    , points = 2
    },
    { name = "Russia"
    , goalsFor = 1
    , goalsAgainst = 1
    , points = 1
    }
  ]

type alias Result =
  { home : Team
  , homeResult: Int
  , away : Team
  , awayResult: Int
  }

type alias Model =
  { league : Group
  , results: List Result
  }

model : Model
model =
  { league = initialGroup
  , results = []
  }

type Msg = Reset

update : Msg -> Model -> Model
update msg model =
  case msg of
    Reset ->
      model

view : Model -> Html Msg
view model =
  let headers field = th [] [ text field ]
      rows i = tr [] [ td [] [ text <| i.name ]
                    , td [] [ text <| toString i.goalsFor ]
                    , td [] [ text <| toString i.goalsAgainst ]
                    , td [] [ text <| toString i.points ]
                    ]
  in
    div []
    [ button [ onClick Reset ] [ text "x" ]
    , table []
      [ thead [] [tr [] (List.map headers ["Team", "For", "Against", "Points"])]
      , tbody [] (List.map rows model.league )
      ]
    ]
