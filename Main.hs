module Main where

import Lexer
import PrettyPrinter
import Syntax
import System.IO

newtype Interpret a = Interpret {interpret :: a}

instance PascalExpr Interpret where
  peAssign v e = undefined
  peRead e = undefined
  peReadln e = undefined
  peWrite e = undefined
  peWriteln e = undefined
  peWhile c ops = undefined
  peIf c t e = undefined
  peFunApply f vs isPr = undefined
  peLT a b = undefined
  peGT a b = undefined
  peLTE a b = undefined
  peGTE a b = undefined
  peEq a b = undefined
  peNotEq a b = undefined
  peSum a b = undefined
  peSub a b = undefined
  peOr a b = undefined
  peXor a b = undefined
  peMul a b = undefined
  peDivide a b = undefined
  peDiv a b = undefined
  peMod a b = undefined
  peAnd a b = undefined
  peNot e = undefined
  peNeg e = undefined
  pePos e = undefined
  peVar = undefined
  peReal = undefined
  peInt = undefined
  peStr = undefined
  peBool = undefined
  peBr e = undefined

main :: IO()
main = do
  inh <- openFile "in.txt" ReadMode
  input <- hGetContents inh
  let parseResult = parseProgram (alexScanTokens input)
  putStrLn $ prettyPrint parseResult
