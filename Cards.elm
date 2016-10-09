port module Cards exposing (..)

import Html exposing (..)
import Html.App as App
import Html.Events as Events
import Model exposing (..)
import Random


port currentTime : (Int -> msg) -> Sub msg


type alias Model =
    { playerHand : List Card
    , playerDeck : List Card
    , playerBoard : List Card
    , opponentHand : List Card
    , opponentDeck : List Card
    , opponentBoard : List Card
    , gameState : GameState
    , random : Int
    }


type Msg
    = NoOp
    | NewRandom Int
    | GenInt


type GameState
    = Pause
    | PlayerTurn
    | OpponentTurn
    | StartScreen


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


view : Model -> Html Msg
view model =
    div []
        [ Html.button [ Events.onClick GenInt ]
            [ Html.text "Generate" ]
        , model.random
            |> toString
            |> Html.text
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        GenInt ->
            ( model, Random.generate NewRandom (Random.int 1 10) )

        NewRandom new ->
            ( { model | random = new }, Cmd.none )


main : Program Never
main =
    App.program
        { init = initialModel
        , view = view
        , subscriptions = \_ -> Sub.none
        , update = update
        }
