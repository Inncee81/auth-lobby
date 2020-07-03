module Account.Linking.State exposing (..)

import Account.Linking.Context as Context exposing (Context)
import Account.Linking.Exchange as Exchange exposing (Exchange)
import Json.Encode
import Page
import Ports
import Radix exposing (..)
import Return exposing (return)



-- 📣


cancel : Manager
cancel model =
    case model.page of
        Page.LinkAccount context ->
            case Maybe.map .side context.exchange of
                Just (Exchange.Inquirer _) ->
                    Return.singleton { model | page = Page.Choose }

                Just (Exchange.Authoriser _) ->
                    ( Nothing, Json.Encode.string Exchange.cancelMessage )
                        |> Ports.publishOnSecureChannel
                        |> return { model | page = Page.SuggestAuthorisation }

                Nothing ->
                    Return.singleton model

        _ ->
            Return.singleton model


gotExchangeError : String -> Manager
gotExchangeError error model =
    let
        context =
            case model.page of
                Page.LinkAccount c ->
                    c

                _ ->
                    Context.default
    in
    context.exchange
        |> Maybe.withDefault Exchange.initialAuthoriserExchange
        |> (\e -> { e | error = Just error })
        |> (\e -> { context | exchange = Just e })
        |> (\c -> { model | page = Page.LinkAccount c })
        |> Return.singleton


gotLinked : { username : String } -> Manager
gotLinked { username } model =
    Return.singleton
        { model
            | page = Page.SuggestAuthorisation
            , usedUsername = Just username
        }


gotUsernameInput : String -> Manager
gotUsernameInput input =
    adjustContext
        (\c -> { c | username = input })


linkAccount : Context -> Manager
linkAccount context model =
    case String.trim context.username of
        "" ->
            Return.singleton model

        username ->
            let
                newContext =
                    { context | username = username, waitingForDevices = True }
            in
            return
                { model | page = Page.LinkAccount newContext }
                (Ports.openSecureChannel <| Just username)


sendUcan : Exchange -> Manager
sendUcan exchange model =
    case exchange.didOtherSide of
        Just didOtherSide ->
            Exchange.ucanResponse
                |> Exchange.encodeUcanResponse
                |> (\r -> ( model.usedUsername, didOtherSide, r ))
                |> Ports.publishEncryptedOnSecureChannel
                |> return { model | page = Page.Note "Device was successfully linked!\nYou can close this window now." }

        Nothing ->
            Return.singleton model


startExchange : Context -> ( String, String ) -> Manager
startExchange context nonces model =
    nonces
        |> Exchange.inquire context.username
        |> Return.map
            (\e ->
                { context | exchange = Just e }
            )
        |> Return.map
            (\c ->
                { model | page = Page.LinkAccount c }
            )



-- 🛠


adjustContext : (Context -> Context) -> Manager
adjustContext mapFn model =
    case model.page of
        Page.LinkAccount context ->
            Return.singleton { model | page = Page.LinkAccount (mapFn context) }

        _ ->
            Return.singleton model