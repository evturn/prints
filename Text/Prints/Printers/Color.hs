{-# LANGUAGE OverloadedStrings #-}

module Text.Prints.Printers.Color
    ( colorPrints
    ) where

import qualified Language.Haskell.HsColour           as HSC
import qualified Language.Haskell.HsColour.Colourise as HSC
import qualified Language.Haskell.HsColour.Output    as HSC
import           Text.Show.Pretty                    (ppShow)

colorPrints :: Show a => a -> IO ()
colorPrints = putStrLn . format . ppShow

prefs :: HSC.ColourPrefs
prefs = HSC.defaultColourPrefs
  { HSC.keyword          = [HSC.Foreground HSC.Yellow]
  , HSC.comment          = [HSC.Foreground HSC.Yellow]
  , HSC.varid            = [HSC.Foreground HSC.Yellow]
  , HSC.varop            = [HSC.Foreground HSC.Yellow]
  , HSC.selection        = [HSC.Foreground HSC.Yellow]
  , HSC.variantselection = [HSC.Foreground HSC.Yellow]
  , HSC.definition       = [HSC.Foreground HSC.Yellow]
  , HSC.conid            = [HSC.Foreground (HSC.Rgb 95 95 255)]
  , HSC.conop            = [HSC.Foreground HSC.Yellow]
  , HSC.string           = [HSC.Foreground HSC.Green]
  , HSC.char             = [HSC.Foreground HSC.Green]
  , HSC.number           = [HSC.Foreground (HSC.Rgb 175 0 215)]
  , HSC.layout           = [HSC.Foreground HSC.Red]
  , HSC.keyglyph         = [HSC.Foreground HSC.Red]
  }

output :: HSC.Output
output = HSC.TTYg HSC.XTerm256Compatible

format :: String -> String
format = HSC.hscolour output prefs False False "" False
