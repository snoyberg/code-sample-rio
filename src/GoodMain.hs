{-# LANGUAGE Safe #-}
module GoodMain where

import Restricted
import safe GoodUser

data Actions = Actions (String -> RIO Actions ())
instance HasPutStrLn Actions where
    getPutStrLn (Actions f) = f

main :: IO ()
main = runRIO (\f -> Actions (f . putStrLn)) goodUser
