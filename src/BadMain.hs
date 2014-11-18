{-# LANGUAGE Trustworthy #-}
module BadMain where

import Restricted
import safe BadUser

data Actions = Actions

main :: IO ()
main = runRIO (\_ -> Actions) badUser
