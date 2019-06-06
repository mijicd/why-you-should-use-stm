#!/usr/bin/env stack
-- stack --resolver lts-13.21 script
import Control.Concurrent.STM

main :: IO ()
main = do
  var <- newTVarIO "Hello"

  newVal <- atomically $ do
    origVal <- readTVar var
    writeTVar var (origVal ++ " World")
    readTVar var

  putStrLn newVal
