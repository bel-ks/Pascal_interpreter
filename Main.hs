module Main where
import Lexer
import Syntax
import System.IO

main :: IO()
main = do
    inh <- openFile "in.txt" ReadMode
    input <- hGetContents inh
    let parseResult = parseProgram (alexScanTokens input)
    putStrLn (show parseResult)
