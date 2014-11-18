{-# LANGUAGE DeriveFunctor #-}
module Restricted
    ( RIO
    , act
    , act1
    , runRIO
    ) where

import Control.Applicative

newtype RIO actions a = RIO { unRIO :: actions -> IO a }
    deriving (Functor)
instance Applicative (RIO actions) where
    pure = RIO . const . return
    RIO f <*> RIO x = RIO $ \actions -> f actions <*> x actions
instance Monad (RIO actions) where
    return = pure
    RIO x >>= f = RIO $ \actions -> x actions >>= flip unRIO actions . f

act :: (actions -> IO a) -> RIO actions a
act = RIO

act1 :: (actions -> arg1 -> IO a) -> arg1 -> RIO actions a
act1 f x = RIO $ \actions -> f actions x

runRIO :: actions -> RIO actions a -> IO a
runRIO = flip unRIO
