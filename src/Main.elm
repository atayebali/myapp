module Main exposing (..)

import Html exposing (text)
import Set exposing (..)
import Array exposing(..)
import Dict exposing (..)

init =
    { question = "Why did you eat cake?"
    , answer = "To get to dinner"
    }



-- Tuple holds data of various types. Order matters.
-- Records are better because they have keys we can use.
-- Cannot use dyanmic keys and the data struct is type safe.


view { question, answer } =
    text
        ("Question: "
            ++ (question)
            ++ " "
            ++ (answer)
        )


toUpperLambda =
    (\str -> String.toUpper str)


sum a b =
    a + b


sumWithOne =
    sum 1



-- Partial function, -- Final
-- sumWithone 1 = (sum 1)(1) = sum(1 1)


list =
    1 :: [ 2 ] ++ [ 3 ]


set =
    Set.fromList (list ++ [1, 2, 3]) -- only uniq values


transFormList list =
    list
        |> List.map (\a -> a + 1)
        |> List.map toString
        |> String.join " "

transFormSet set = 
    set 
        |> Set.map(\a -> a + 1)
        |> Set.map toString 
        |> Set.toList
        |> String.join ","

array = 
    Array.empty
      |> Array.push 1
      |> Array.push 2
      |> Array.push 3


transFormArray array =
    array
      |> Array.get 1
      |> toString

dict =
    Dict.fromList
      [ ("asdf", "where")
       ,("asdfd", "were")
      ]

transFormDict dict =
    Dict.update
      "asdf"
      (\a -> Maybe.map String.toUpper a)
      dict


main =
    --text (toString (sumWithOne 1 ))
    -- view init
    dict
        |> transFormDict
        |> toString
        |> text



-- module Main exposing (..)
-- import Html exposing (Html, text, div, h1, img)
-- import Html.Attributes exposing (src)
-- ---- MODEL ----
-- type alias Model =
--     {}
-- init : ( Model, Cmd Msg )
-- init =
--     ( {}, Cmd.none )
-- ---- UPDATE ----
-- type Msg
--     = NoOp
-- update : Msg -> Model -> ( Model, Cmd Msg )
-- update msg model =
--     ( model, Cmd.none )
-- ---- VIEW ----
-- view : Model -> Html Msg
-- view model =
--     div []
--         [ img [ src "/logo.svg" ] []
--         , h1 [] [ text "Your Elm App is working!" ]
--         ]
-- ---- PROGRAM ----
-- main : Program Never Model Msg
-- main =
--     Html.program
--         { view = view
--         , init = init
--         , update = update
--         , subscriptions = always Sub.none
--         }
