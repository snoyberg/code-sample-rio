{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE RankNTypes #-}
module Restricted
    ( RIO
    , askActions
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

askActions :: RIO actions actions
askActions = RIO return

runRIO :: ((forall r. IO r -> RIO actions r) -> actions) -> RIO actions a -> IO a
runRIO mkActions (RIO withActions) =
    withActions $ mkActions $ \io -> RIO (const io)
