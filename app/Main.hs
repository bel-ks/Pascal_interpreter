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
  inh <- openFile "program.pas" ReadMode
  input <- hGetContents inh
  let parseResult = parseProgram (alexScanTokens input)
  putStrLn "Choose action: 1 - prettyPrint, 2 - interpret"
  action <- getLine
  case action of
    "1" -> putStrLn $ prettyPrint parseResult
    "2" -> interpret parseResult
    _   -> throwIO UndefinedActionException 
