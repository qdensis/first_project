module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--

import Browser
import Html exposing (Html, article, button, div, figure, img, node, p, text)
import Html.Attributes exposing (attribute, class, src)
import Html.Events exposing (onClick)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    Int


init : Model
init =
    0



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ node "link"
            [ attribute "rel" "stylesheet"
            , attribute "href" "https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css"
            ]
            []
        , div []
            [ div [] [ button [ class "button is-warning", onClick Decrement ] [ text "-" ] ]
            , div [ class "title" ] [ text (String.fromInt model) ]
            , div [] [ button [ class "button is-success", onClick Increment ] [ text "+" ] ]
            ]
        , div [ class "tile is-ancestor" ]
            [ div [ class "tile is-vertical is-8" ]
                [ div [ class "tile" ]
                    [ div [ class "tile is-parent is-vertical" ]
                        [ article [ class "tile is-child notification is-primary" ]
                            [ p [ class "title" ]
                                [ text "Vertical..." ]
                            , p [ class "subtitle" ]
                                [ text "Top tile" ]
                            ]
                        , article [ class "tile is-child notification is-warning" ]
                            [ p [ class "title" ]
                                [ text "...tiles" ]
                            , p [ class "subtitle" ]
                                [ text "Bottom tile" ]
                            , div []
                                [ div [] [ button [ class "button is-warning", onClick Decrement ] [ text "-" ] ]
                                , div [ class "title" ] [ text (String.fromInt model) ]
                                , div [] [ button [ class "button is-success", onClick Increment ] [ text "+" ] ]
                                ]
                            ]
                        ]
                    , div [ class "tile is-parent" ]
                        [ article [ class "tile is-child notification is-info" ]
                            [ p [ class "title" ]
                                [ text "Middle tile" ]
                            , p [ class "subtitle" ]
                                [ text "With an image" ]
                            , figure [ class "image is-4by3" ]
                                [ img [ src "https://bulma.io/images/placeholders/640x480.png" ]
                                    []
                                ]
                            ]
                        ]
                    ]
                , div [ class "tile is-parent" ]
                    [ article [ class "tile is-child notification is-danger" ]
                        [ p [ class "title" ]
                            [ text "Wide tile" ]
                        , p [ class "subtitle" ]
                            [ text "Aligned with the right tile" ]
                        , div [ class "content" ]
                            [ text "        " ]
                        ]
                    ]
                ]
            , div [ class "tile is-parent" ]
                [ article [ class "tile is-child notification is-success" ]
                    [ div [ class "content" ]
                        [ p [ class "title" ]
                            [ text "Tall tile" ]
                        , p [ class "subtitle" ]
                            [ text "With even more content" ]
                        , div [ class "content" ]
                            [ text "        " ]
                        ]
                    ]
                ]
            ]
        ]
