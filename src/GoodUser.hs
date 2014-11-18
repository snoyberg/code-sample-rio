module GoodUser
    ( goodUser
    , HasPutStrLn (..)
    ) where

import Restricted

class HasPutStrLn actions where
    getPutStrLn :: actions -> String -> RIO actions ()

goodUser :: HasPutStrLn actions => RIO actions ()
goodUser = do
    actions <- askActions
    getPutStrLn actions "I'm a good, safe user of Restricted!"
