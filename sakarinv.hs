module Sakarinv where

import System.IO
-- import System.IO.Unsafe

import Control.Monad
-- tällä "when"

--import Data.Char
--import Data.List
--import Data.Either

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
main = do
       intro
       loop
            where
            loop = do
                c <- getChar
                when (c /= 'q') $ do
                    case c of
                        'y' -> trackShit 0 0
                        'n' -> havisitPelin
                        _   -> putStrLn "Ei noin"
      
trackShit x y =
    do
        putStrLn ("todo")

intro = do putStrLn "Sakarin villapaitapelin kosto"
           putStrLn ""
           putStrLn "Pue sakarille villapaita y/n"
havisitPelin = do putStrLn "Hävisit pelin"
                  putStrLn ""


-- readPlayer :: IO ()
-- readPlayer = do
--     c <- input
--     show c
    
input = do
        ch <- getChar
        if ch `elem` ['h','j','k','l','q'] then do
            return ch else
            input
