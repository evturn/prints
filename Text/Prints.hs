module Text.Prints
  ( module Text.Prints.Printers.Color
  , module Text.Prints.Printers.Simple
  , prints
  ) where

import           Text.Prints.Printers.Color
import           Text.Prints.Printers.Simple

prints :: Show a => a -> IO ()
prints x = colorPrints x
