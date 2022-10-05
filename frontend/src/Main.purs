module Main where

import Prelude

import Effect (Effect)
import Lorem as Lorem
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)

main :: Effect Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody
  runUI Lorem.component unit body
