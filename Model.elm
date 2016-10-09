module Model exposing (..)


type alias Character =
    { name : String
    , ressources : Int
    , fluff : String
    , strengh : Int
    , speed : Int
    , health : Float
    , focus : Float
    }


type alias Card =
    { name : String
    , cardType : CardType
    , cost : Int
    , fluff : String
    }


type CardType
    = Gear
    | Ability
    | Special


type Special
    = Attack
    | Buff


type Ability
    = Offensive
    | Defensive
    | Passive


type Gear
    = Weapon
    | Armor
    | Tool
    | Utility
    | Vanity
