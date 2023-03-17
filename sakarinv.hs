module Sakarinv where

import System.IO
import System.Console.ANSI --clearScreen
import Control.Monad -- when
import Data.Char --toLower
import Control.Exception --catch
import System.Random

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
                    sx <- randomRIO (0,10) :: IO Int
                    sy <- randomRIO (0,10) :: IO Int
                    c <- getChar
                    when (c /= 'q') $ do
                    case (toLower c) of
                        'y' -> trackShit 0 0 sx sy
                        'n' -> havisitPelin
                        _   -> putStrLn "Ei noin"
      
trackShit x y sx sy =
    do  
        clearScreen
        putStrLn (show x ++ " " ++ show y ++ " " ++ show sx ++ " " ++ show sy)
        putView x y sx sy
        if (x == sx && y == sy) then hihihi
        else
            do
               -- hSetBuffering stdin NoBuffering
                c <- getChar
                case (toLower c) of
                    'h' -> trackShit (x-1) y sx sy 
                    'j' -> trackShit x (y-1) sx sy 
                    'k' -> trackShit x (y+1) sx sy 
                    'l' -> trackShit (x+1) y sx sy 
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

putView :: Int -> Int -> Int -> Int -> IO ()
putView x y sx sy = 
        do contents <- readFile "test"
           villapaita <- readFile "test2"
           let positionedContents = 
                merge (lines positionedVillapaita) (lines (addRows (y) (addColumns x contents)))
                where positionedVillapaita = addRows sy (addColumns sx villapaita)
                in putStrLn (unlines positionedContents)
           return ()

merge [] [] = []
merge [] bot = bot 
merge top [] = top 
merge (toprow:top) (botrow:bot) = mergeRow toprow botrow : merge top bot 

mergeRow [] [] = []
mergeRow [] botrow = botrow
mergeRow toprow [] = toprow
mergeRow (t:toprow) (b:botrow) = if t > b then t:mergeRow toprow botrow else b:mergeRow toprow botrow

emptyLengthAtRowBeginning row = length (dropWhile (\x -> not $ elem x " ") . takeWhile (\x -> elem x " ") $ row)
emptyLengthAtRowEnd row = emptyLengthAtRowBeginning (reverse row)

addColumns 0 contents = contents
addColumns n contents = addColumns (n-1) (unlines (map (\x -> " " ++ x) (lines contents)))

addRows n contents = case n of _
                                | n < 0 -> addRowsBefore (-n) contents
                                | n > 0 -> addRowsAfter n contents
                                | n == 0 -> contents

addRowsBefore 0 contents = contents
addRowsBefore n contents = addRowsBefore (n-1) (unlines ("" : lines contents))

addRowsAfter 0 contents = contents
addRowsAfter n contents = addRowsAfter (n-1) (unlines (reverse ("" : reverse (lines contents))))

handler :: IOError -> IO ()
handler e = putStrLn "File errorr"



-- readPlayer :: IO ()
-- readPlayer = do
--     c <- input
--     show c
    
input = do
        ch <- getChar
        if ch `elem` ['h','j','k','l','q'] then do
            return ch else
            input
