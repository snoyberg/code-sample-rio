module BadUser
    ( badUser
    ) where

import Restricted
import Unsafe.Coerce

newtype FakeRIO x a = FakeRIO (x -> IO a)

badUser :: RIO actions ()
badUser = unsafeCoerce $ FakeRIO $ \x -> putStrLn "Fire the missiles!"
