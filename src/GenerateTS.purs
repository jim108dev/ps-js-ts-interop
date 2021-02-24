module GenerateTS where

import Prelude
import Data.Array (intercalate)
import Effect (Effect)
import Effect.Class.Console (log)
import Node.Encoding (Encoding(..))
import Node.FS.Sync (writeTextFile)
import OhYes (generateTS)
import People (Person)
import Text.Prettier (defaultOptions, format)
import Type.Prelude (Proxy(..))

dest :: String
dest = "./generated/Types.ts"

main :: Effect Unit
main = do
  writeTextFile UTF8 dest contents
  log $ "Generated types to " <> dest
  where
  contents =
    format defaultOptions
      $ intercalate "\n"
          [ generateTS "Person" (Proxy :: Proxy Person)
          ]
