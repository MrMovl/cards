module CardLibrary exposing (..)


type alias Card =
    { name : String
    , cardType : CardType
    , cost : Int
    , attack : Int
    , defense : Int
    , fluff : String
    , special : SpecialAbility
    , frequency : Frequency
    }


type Frequency
    = Common
    | Uncommon
    | Rare


type SpecialAbility
    = NoAbility
    | Rush
    | Defensive


type CardType
    = Creature
    | Spell
    | Item


goblin : Card
goblin =
    { name = "Goblin"
    , cardType = Creature
    , cost = 1
    , attack = 1
    , defense = 1
    , fluff = "The simplest of all thinking creatures"
    , special = NoAbility
    , frequency = Common
    }


centaur : Card
centaur =
    { name = "Centaur"
    , cardType = Creature
    , cost = 3
    , attack = 3
    , defense = 1
    , fluff = "They don't like to be called 'war pony'."
    , special = Rush
    , frequency = Uncommon
    }


minotaur : Card
minotaur =
    { name = "Minotaur"
    , cardType = Creature
    , cost = 5
    , attack = 3
    , defense = 6
    , fluff = "Does not care for labyrinths"
    , special = Defensive
    , frequency = Rare
    }
