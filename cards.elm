port module Cards exposing (..)

import Html exposing (..)
import Html.App as App
import Html.Events as Events
import CardLibrary as Cards
import Random exposing (Seed, initialSeed)


port currentTime : (Int -> msg) -> Sub msg


type Msg
    = NoOp


type GameState
    = Pause
    | PlayerTurn
    | OpponentTurn


type alias Model =
    { playerHand : List Cards.Card
    , playerDeck : List Cards.Card
    , playerBoard : List Cards.Card
    , opponentHand : List Cards.Card
    , opponentDeck : List Cards.Card
    , opponentBoard : List Cards.Card
    , gameState : GameState
    , seed : Seed
    }


initialModel : Model
initialModel =
    { playerHand = []
    , playerDeck = []
    , playerBoard = []
    , opponentHand = []
    , opponentDeck = []
    , opponentBoard = []
    , gameState = Pause
    , seed = initialSeed 42
    }


view : Model -> Html Msg
view model =
    div [ Events.onClick NoOp ] [ Html.text "Test" ]


update : Msg -> Model -> Model
update msg model =
    model


main : Program Never
main =
    App.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
