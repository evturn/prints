module Text.Prints.Printers.Color
   ( colorPrints
   ) where

import qualified Language.Haskell.HsColour           as HSC
import qualified Language.Haskell.HsColour.Colourise as HSC
import qualified Language.Haskell.HsColour.Output    as HSC
import           Text.Show.Pretty                    (ppShow)

prefs = HSC.defaultColourPrefs
  { HSC.conid =
      [ HSC.Foreground HSC.Yellow
      , HSC.Bold
      ]
  , HSC.conop =
      [ HSC.Foreground HSC.Yellow ]
  , HSC.string =
      [ HSC.Foreground HSC.Green ]
  , HSC.char =
      [ HSC.Foreground HSC.Cyan ]
  , HSC.number =
      [ HSC.Foreground HSC.Red
      , HSC.Bold
      ]
  , HSC.layout =
      [ HSC.Foreground HSC.White ]
  , HSC.keyglyph =
      [ HSC.Foreground HSC.White ]
  }


colorPrints x =
  putStrLn $ HSC.hscolour
    (HSC.TTYg HSC.XTerm256Compatible) prefs False False "" False $ ppShow x
