module Text.Prints
  ( prints
  ) where

import           Control.Monad.IO.Class            (MonadIO)
import           Data.Text.Lazy.Builder            (Builder)
import           Text.Pretty.Simple
import           Text.Pretty.Simple.Internal
import           Text.Pretty.Simple.Internal.Color

prints :: (MonadIO m, Show a) => a -> m ()
prints = pPrintOpt OutputOptions
  { outputOptionsIndentAmount = 2
  , outputOptionsColorOptions = Just $ colors
  }

colors :: ColorOptions
colors = ColorOptions
  { colorQuote         = colorDullGreenBold
  , colorString        = colorVividGreen
  , colorError         = colorVividRedBold
  , colorNum           = colorVividBlue
  , colorRainbowParens = colorPar
  }

colorPar :: [Builder]
colorPar =
  [ colorVividCyan
  , colorVividBlue
  , colorVividRed
  , colorVividYellow
  , colorVividMagenta
  , colorVividGreen
  , colorDullCyanBold
  , colorDullBlueBold
  , colorDullRedBold
  , colorDullYellowBold
  , colorDullMagentaBold
  , colorDullGreenBold
  ]
