{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "ps-ts-js-interop"
, dependencies = [ "console", "effect", "ohyes", "psci-support" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
