module GoodUser
    ( goodUser
    , HasPutStrLn (..)
    ) where

import Restricted

class HasPutStrLn actions where
    getPutStrLn :: actions -> String -> IO ()

goodUser :: HasPutStrLn actions => RIO actions ()
goodUser = act1 getPutStrLn "I'm a good, safe user of Restricted!"
