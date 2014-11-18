{-# LANGUAGE Safe #-}
module GoodMain where

import Restricted
import safe GoodUser

data Actions = Actions (String -> IO ())
instance HasPutStrLn Actions where
    getPutStrLn (Actions f) = f

main :: IO ()
main = runRIO (Actions putStrLn) goodUser
