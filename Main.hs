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
  interpret parseResult
