import Random
import Html exposing (Html, Attribute, h1, span, input, button, div, text, p, br)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


main =
  Html.beginnerProgram
    { model = secretCode
    , view = view
    , update = update
    }

-- MODEL


type alias SecretCode =
    { value_1 : Int
    , value_2 : Int
    , value_3 : Int
    , value_4 : Int
    , value_5 : Int
    , check : String
    }

secretCode : SecretCode
secretCode = 
    SecretCode 4 5 3 5 2 ""

type alias GuessedCode =
    { value_1 : Int
    , value_2 : Int
    , value_3 : Int
    , value_4 : Int
    , value_5 : Int
    }


type Msg
    = Guess


update : Msg -> SecretCode -> SecretCode
update msg secretCode =
    case msg of
        Guess ->
            secretCode



-- { secretCode | check = crack guessedCode  }
-- VIEW


view : SecretCode -> Html Msg
view secretCode =
    div []
        [ h1 [] [ text "Mastermind" ]
        , p [] [ text "guess the code" ]
        , span [] [ text ("Secret code: " ++ (printSecretCode secretCode)) ]
        , br [] []
        , input [ placeholder "First Value", id "value_1" ] []
        , input [ placeholder "Second Value", id "value_2", style [("margin-left", "4px")] ] []
        -- , button [ onClick Guess ] [ text "Guess" ]
        ]

printSecretCode : SecretCode -> String
printSecretCode code =
    joinList (stringifyList (listifySecretCode code))

stringifyList : List Int -> List String
stringifyList list =
    List.map(toString) list

listifySecretCode : SecretCode -> List Int
listifySecretCode code =
    [code.value_1, code.value_2, code.value_3, code.value_4, code.value_5]

joinList : List String -> String
joinList list =
    List.foldr (++) "" (List.intersperse " " list)

whiteText : Attribute msg
whiteText =
    style
    [ ("color", "#FFF")
    ]
-- crackResult : secretCodeCharacter -> guessCharacter -> String
-- crackResult secretCodeCharacter guessCharacter =
-- if (secretCodeCharacter == guessCharacter) then
-- -- Match character and position
-- "🎯"
-- else
-- ""
-- crack : secretCode -> guess -> String
-- crack secretCode guess =
-- let
-- target =
-- [ secretCode.value_1, secretCode.value_2 ]
-- in
-- if (target == guess) then
-- "Success! 🏆"
-- else
-- List.map (crackResult) target guess
-- initCode : SecretCode
-- initCode =
-- SecretCode 4 3 2 1 5 ""
