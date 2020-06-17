module Account.Linking.State exposing (..)

import Account.Linking.Context as Context exposing (Context)
import Page
import Ports
import Radix exposing (..)
import Return exposing (return)



-- 📣


gotUsernameInput : String -> Manager
gotUsernameInput input =
    adjustContext
        (\c -> { c | username = input })


linkAccount : Context -> Manager
linkAccount context model =
    return
        { model | page = Page.LinkAccount { context | requestOtherDevice = True } }
        (Ports.openSecureChannel ())



-- 🛠


adjustContext : (Context -> Context) -> Manager
adjustContext mapFn model =
    case model.page of
        Page.LinkAccount context ->
            Return.singleton { model | page = Page.LinkAccount (mapFn context) }

        _ ->
            Return.singleton model
