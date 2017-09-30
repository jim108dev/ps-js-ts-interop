module GenerateTS where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Eff.Exception (EXCEPTION)
import Data.Array (intercalate)
import Node.Encoding (Encoding(..))
import Node.FS (FS)
import Node.FS.Sync (writeTextFile)
import OhYes (generateTS)
import People (Person)
import Text.Prettier (defaultOptions, format)
import Type.Prelude (Proxy(..))

dest :: String
dest = "./generated/Types.ts"

main :: forall e.
  Eff
    ( fs :: FS
    , exception :: EXCEPTION
    , console :: CONSOLE
    | e
    )
  Unit

main = do
  writeTextFile UTF8 dest contents
  log $ "Generated types to " <> dest
  where
    contents = format defaultOptions $ intercalate "\n"
      [ generateTS "Person" (Proxy :: Proxy Person)
      ]
