module Main where

import Control.Exception
import Lexer
import MyExceptions
import PascalInterpreter
import PrettyPrinter
import Syntax
import System.IO

main :: IO()
main = do
  inh <- openFile "program.pas" ReadMode
  input <- hGetContents inh
  let parseResult = parseProgram (alexScanTokens input)
  putStrLn "Choose action: 1 - prettyPrint, 2 - interpret"
  action <- getLine
  case action of
    "1" -> putStrLn $ prettyPrint parseResult
    "2" -> interpret parseResult
    _   -> throwIO UndefinedActionException 
