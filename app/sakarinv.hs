module Main where

import System.IO
import System.Console.ANSI (clearScreen, hideCursor, showCursor, cursorBackward, clearFromCursorToLineBeginning, setTitle)
import Control.Monad (when)
import Data.Char (toLower)
import Control.Exception (catch)
import System.Random (randomRIO)
import System.IO.NoBufferingWorkaround
import System.Console.Terminal.Size (size, Window (..))

-- sakarin villapaitapeli cli 2023 remix
--
-- todo:
-- pään pudistus?
-- artin luku erikseen alukss etteio liikaa io
-- artin vakiointi? offset-luvut .arttiin?
-- terminaalin koon asettamat rajat funktioihin

main :: IO ()
main =
    do
        initGetCharNoBuffering
        hSetBuffering stdin NoBuffering
        hideCursor
        setTitle "Sakarin villapaitapelin kosto"
        sakari <- readFile "sakari.art"
        villapaita <- readFile "villapai.art"
        intro sakari
        loop sakari villapaita
            where
            loop sakari villapaita = do
                    -- set sakari position
                    termXY <- size
                    sx <- randomRIO (6,((getTermX termXY) - 11)) :: IO Int
                    sy <- randomRIO (0 - (getTermY termXY) + 3,0) :: IO Int
                    --let sx = (5) -- debug sakari position
                    --    sy = (-41)
                    c <- getCharNoBuffering
                    clearFromCursorToLineBeginning
                    cursorBackward 1
                    when (c /= 'q') $ do
                        case (toLower c) of
                            'y' -> trackShit 0 0 sx sy sakari villapaita
                            'n' -> havisitPelin
                            _   -> do eiNoin

trackShit x y sx sy sakari villapaita =
    do
        clearScreen
        putStrLn (show x ++ " " ++ show y ++ " " ++ show sx ++ " " ++ show sy) -- debug movement/position
        putView x y sx sy sakari villapaita
        if (x == sx && y == sy) then hiHiHi
        else
            do
                c <- getCharNoBuffering
                case (toLower c) of
                    'h' -> if x == 0 
                      then trackShit x y sx sy sakari villapaita 
                      else trackShit (x-1) y sx sy sakari villapaita
                    'j' -> trackShit x (y-1) sx sy sakari villapaita
                    'k' -> trackShit x (y+1) sx sy sakari villapaita
                    'l' -> trackShit (x+1) y sx sy sakari villapaita
                    'q' -> return ()
                    _   -> eiNoin
intro sakari =
    do  clearScreen
        putStrLn "Sakarin villapaitapelin kosto"
        putStrLn ""
        putStrLn ""
        putStrLn sakari
        putStrLn "Pue sakarille villapaita y/n"
        putStrLn ""
        putStrLn ""

havisitPelin =
    do  lose <- readFile "lose.art"
        clearScreen
        putStrLn lose
        putStrLn "Hävisit pelin"
        putStrLn ""
        putStrLn ""
        showCursor

hiHiHi =
    do  win <- readFile "win.art"
        clearScreen
        putStrLn win
        putStrLn "\"Hihihi, kutittaa!\""
        putStrLn ""
        putStrLn "Voitit pelin"
        putStrLn ""
        putStrLn ""
        showCursor

eiNoin =
    do  putStrLn "Ei noin!"
        putStrLn ""
        putStrLn ""
        putStrLn ""
        showCursor

putView :: Int -> Int -> Int -> Int -> String -> String -> IO ()
putView x y sx sy sakari villapaita =
           let positionedContents =
                merge (lines positionedVillapaita) (lines (addRows (sy) (addColumns sx sakari)))
                where positionedVillapaita = addRows y (addColumns x villapaita)
                in putStrLn (unlines positionedContents)

--merging arts one row at a time
merge [] [] = []
merge [] bot = bot
merge top [] = top
merge (toprow:top) (botrow:bot) = mergeRow toprow botrow : merge top bot

--merging rows by comparing chars
mergeRow [] [] = []
mergeRow [] botrow = botrow
mergeRow toprow [] = toprow
mergeRow (t:toprow) (b:botrow) = if t > b then t:mergeRow toprow botrow else b:mergeRow toprow botrow

addColumns 0 contents = contents
addColumns n contents = addColumns (n-1) (unlines (map (\x -> " " ++ x) (lines contents)))

addRows n contents
    | n < 0  = addRowsBefore (-n) contents
    | n > 0  = addRowsAfter n contents
    | n == 0 = contents

addRowsBefore 0 contents = contents
addRowsBefore n contents = addRowsBefore (n-1) ("\n" ++ contents)

addRowsAfter 0 contents = contents
addRowsAfter n contents = addRowsAfter (n-1) (contents ++ "\n")

getTermX (Just (Window _ x)) = x
getTermX _ = 80

getTermY (Just (Window y _)) = y
getTermY _ = 24

handler :: IOError -> IO ()
handler e = putStrLn "File errorr"
