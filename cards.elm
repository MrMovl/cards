port module Cards exposing (..)

import Html exposing (..)
import Html.App as App
import Html.Events as Events
import CardLibrary as Cards
import Random


port currentTime : (Int -> msg) -> Sub msg


type Msg
    = NoOp
    | NewRandom Int
    | GenInt


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
    , random : Int
    }


initialModel : ( Model, Cmd Msg )
initialModel =
    ( { playerHand = []
      , playerDeck = []
      , playerBoard = []
      , opponentHand = []
      , opponentDeck = []
      , opponentBoard = []
      , gameState = Pause
      , random = 0
      }
    , Cmd.none
    )


view : ( Model, Cmd Msg ) -> Html Msg
view ( model, _ ) =
    div []
        [ Html.button [ Events.onClick GenInt ]
            [ Html.text "Generate" ]
        , model.random
            |> toString
            |> Html.text
        ]


update : Msg -> ( Model, Cmd Msg ) -> ( Model, Cmd Msg )
update msg ( model, _ ) =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        GenInt ->
            ( model, Random.generate NewRandom (Random.int 1 10) )

        NewRandom new ->
            ( { model | random = new }, Cmd.none )


main : Program Never
main =
    App.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
