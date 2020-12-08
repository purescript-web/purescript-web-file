{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "web-file"
, dependencies =
  [ "foreign", "media-types", "psci-support", "web-dom" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
