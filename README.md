__UI for [auth.fission.codes](https://auth.fission.codes)__



## How does it work?

⚗️ _This SPA allows you to:_

* Create a Fission account
* Link a Fission account from another device/browser
* Authorise an application


🔑 _For each of those, you have to pass the required query parameters:_

* `did`, the did of the user on the domain you'll be redirect to
* `redirectTo`, the url the user will redirected to

You can define some optional parameters as well:
* `lifetimeInSeconds`, how long an action should be authorised for. The default is one month.
* `newUser`, `t` or `f`, if this parameter is given and the user has not signed in before, this will pre-select the appropriate screen for the user. If `newUser` is set to `t`, it'll show the create-account screen, and if set to `f`, it'll show the sign-in (aka. link) screen. If this parameter is not given at all, the user will be able to chose themselves.
* `resource`, the resources that should be authorised. The default is everything `*`.


🎒 _When redirecting back it'll add the query params:_

* `newUser`, `t` or `f`, whether the user has just created an account or not
* `ucan`, a token authorising the application to perform actions
* `username`, the username that was chosen by the user

When the user decides to go back to the app for some reason (eg. not agreeing  
with the authorisation), the query parameter `cancelled=reason` will be added.

Possible cancellation reasons:
* `DENIED`, user chose to cancel the authorization



## Development

This project uses Nix to manage the project's environment. If you'd like to build this project without Nix, check out the dependencies in the `shell.nix` file (most are available through Homebrew as well).

```shell
# Install javascript dependencies
just install-deps

# Build, serve, watch
just

# Production build
# (see Justfile for details)
just production-build

# Use a different config
just config=production
```
