module Radix exposing (..)

{-| Our top-level state.

“Radix”
A root or point of origin.

-}

import Account.Creation.Context as Creation
import Account.Linking.Context as Linking
import Account.Linking.Exchange as Linking
import Browser
import Browser.Navigation as Nav
import Debouncer.Messages as Debouncer exposing (Debouncer)
import External.Context as External
import Json.Decode as Json
import Page exposing (Page)
import RemoteData exposing (RemoteData)
import Url exposing (Url)



-- 🧩


type alias Model =
    { dataRootDomain : String
    , externalContext : External.ParsedContext
    , page : Page
    , navKey : Nav.Key
    , url : Url
    , usedUsername : Maybe String
    , version : String

    -----------------------------------------
    -- Debouncers
    -----------------------------------------
    , usernameAvailabilityDebouncer : Debouncer Msg

    -----------------------------------------
    -- Remote Data
    -----------------------------------------
    , reCreateAccount : RemoteData String ()
    }



-- 📣


type Msg
    = Bypassed
      -----------------------------------------
      -- Authorisation
      -----------------------------------------
    | AllowAuthorisation
    | DenyAuthorisation
    | GotUcansForApplication { readKey : String, ucans : List String }
      -----------------------------------------
      -- Create
      -----------------------------------------
    | CheckIfUsernameIsAvailable
    | CreateAccount Creation.Context
    | GotCreateAccountFailure String
    | GotCreateAccountSuccess
    | GotCreateEmailInput String
    | GotCreateUsernameInput String
    | GotUsernameAvailability { available : Bool, valid : Bool }
    | SkipLinkDuringSetup
      -----------------------------------------
      -- Debouncers
      -----------------------------------------
    | UsernameAvailabilityDebouncerMsg (Debouncer.Msg Msg)
      -----------------------------------------
      -- Linking
      -----------------------------------------
    | CancelLink { onBothSides : Bool }
    | GotLinked { username : String }
    | GotLinkExchangeError String
    | GotLinkUsernameInput String
    | LinkAccount Linking.Context
    | SendLinkingUcan Linking.Exchange
      -----------------------------------------
      -- Routing
      -----------------------------------------
    | GoToPage Page
    | UrlChanged Url
    | UrlRequested Browser.UrlRequest
      -----------------------------------------
      -- Channel
      -----------------------------------------
    | GotInvalidRootDid
    | GotChannelMessage Json.Value
      -----------------------------------------
      -- 🧿 Other things
      -----------------------------------------
    | CopyToClipboard String
    | Leave


type alias Manager =
    Model -> ( Model, Cmd Msg )
