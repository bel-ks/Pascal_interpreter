module Main where
import Control.Monad.State
import Lexer
import Syntax
import System.IO

prettyPrinting :: Prgm -> State Integer String
prettyPrinting (Program vb fb ob) = do
  return ""

main :: IO()
main = do
  inh <- openFile "in.txt" ReadMode
  input <- hGetContents inh
  let parseResult = parseProgram (alexScanTokens input)
  putStrLn $ evalState (prettyPrinting parseResult) 0
