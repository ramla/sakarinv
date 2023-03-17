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
module Sakarinv where

import System.IO

import Control.Monad
-- tällä "when"


main :: IO ()
main = do
    hSetBuffering stdin NoBuffering
    intro
    c <- getChar
    hSetBuffering stdin NoBuffering
    when (c /= 'q') $ do trackShit 0 0 c

trackShit x y c = do
    putStrLn ("todo")

intro = do 
    putStrLn "Sakarin villapaitapelin kosto"
    putStrLn ""
    putStrLn "Pue sakarille villapaita y/n"

havisitPelin = do 
    putStrLn "Hävisit pelin"
    putStrLn ""


-- readPlayer :: IO ()
-- readPlayer = do
--     c <- input
--     show c
    
--input = do
--        ch <- getChar
--        if ch `elem` ['h','j','k','l','q'] then do
--            return ch else
--            input
