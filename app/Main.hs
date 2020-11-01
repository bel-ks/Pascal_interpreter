module Main where

import Lexer
  ( alexScanTokens
  )
import MyExceptions
  ( UndefinedActionException (..)
  )
import PascalInterpreter
  ( interpret
  )
import PrettyPrinter
  ( prettyPrint
  )
import Syntax
  ( parseProgram
  )

import Control.Exception
  ( throwIO
  )
import System.IO
  ( IOMode (ReadMode)
  , openFile
  , hGetContents
  )

main :: IO()
main = do
  putStrLn "Choose action: 1 - prettyPrint, 2 - interpret"
  action <- getLine
  putStrLn "Enter file name (program.pas as example):"
  file <- getLine
  inh <- openFile file ReadMode
  input <- hGetContents inh
  let parseResult = parseProgram (alexScanTokens input)
  case action of
    "1" -> putStrLn $ prettyPrint parseResult
    "2" -> interpret parseResult
    _   -> throwIO UndefinedActionException 
