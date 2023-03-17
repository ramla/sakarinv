module Sakarinv where

import System.IO
import System.Console.ANSI --clearScreen
import Control.Monad -- when
import Data.Char --toLower

-- sakarin villapaitapeli cli 2023 remix
--
-- oisko komentoja
-- h,j,k,l,enter
--
-- todo: 
-- sakari artti
-- villapaita artti
-- artin printtaus
-- arttien overlay
-- ruudun tyhjennys ennen printtii?
-- interact (unlines . interpreter . lines) mutta sisäänleivottuna

main :: IO ()
main = 
    do
        hSetBuffering stdin NoBuffering
        intro
        loop
            where
            loop = do
                    c <- getChar
                    when (c /= 'q') $ do
                    case (toLower c) of
                        'y' -> trackShit 0 0
                        'n' -> havisitPelin
                        _   -> putStrLn "Ei noin"
      
trackShit x y =
    do  
        clearScreen
        putStrLn ("-- trackShit"++(show x)++(show y))
        if (x == 5) then hihihi
        else
            do
               -- hSetBuffering stdin NoBuffering
                c <- getChar
                case (toLower c) of
                    'h' -> trackShit (x-1) y
                    'j' -> trackShit x (y-1)
                    'k' -> trackShit x (y+1)
                    'l' -> trackShit (x+1) y
                    'q' -> return ()
                    _   -> havisitPelin
intro = 
    do  putStrLn "Sakarin villapaitapelin kosto"
        putStrLn ""
        putStrLn "Pue sakarille villapaita y/n"
havisitPelin = 
    do  putStrLn "Hävisit pelin"
        putStrLn ""
hihihi =
    do  putStrLn "Hihihi, kutittaa!"
        putStrLn ""
        putStrLn "Voitit pelin"

-- readPlayer :: IO ()
-- readPlayer = do
--     c <- input
--     show c
    
input = do
        ch <- getChar
        if ch `elem` ['h','j','k','l','q'] then do
            return ch else
            input
