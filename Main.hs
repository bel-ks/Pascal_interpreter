module Main where

import Lexer
import PascalInterpreter
import PrettyPrinter
import Syntax
import System.IO

main :: IO()
main = do
  inh <- openFile "in.txt" ReadMode
  input <- hGetContents inh
  let parseResult = parseProgram (alexScanTokens input)
  putStrLn "Choose action: 1 - prettyPrint, 2 - interpret"
  action <- getLine
  case action of
    "1" -> putStrLn $ prettyPrint parseResult
    "2" -> interpret parseResult
