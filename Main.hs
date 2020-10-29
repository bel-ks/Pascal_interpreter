module Main where
import Control.Monad.State
import Lexer
import Syntax
import System.IO

type TabCount = Int
type PrEnv = (TabCount, String)

tab :: String
tab = "  "

comma :: String
comma = ", "

prettyPrintingList :: String -> [Prgm] -> State PrEnv String
prettyPrintingList _ [] = do
  gets (\(_, r) -> r)
prettyPrintingList _ (p : []) =
  prettyPrintingPrgm p
prettyPrintingList sep (p : ps) = do
  prettyPrintingPrgm p
  modify (\(tc, r) -> (tc, r ++ sep))
  prettyPrintingList sep ps

prettyPrintingPrgm :: Prgm -> State PrEnv String
prettyPrintingPrgm (Program vb fb ob) = do
  prettyPrintingList "\n" vb
  if null vb
    then return ()
    else modify (\(tc, r) -> (tc, r ++ ";\n\n"))
  prettyPrintingList "\n" fb
  if null fb
    then modify (\(tc, r) -> (tc, r ++ "begin\n"))
    else modify (\(tc, r) -> (tc, r ++ "\nbegin\n"))
  prettyPrintingList "\n" ob
  if null ob
    then modify (\(tc, r) -> (tc, r ++ "end."))
    else modify (\(tc, r) -> (tc, r ++ ";\nend."))
  gets (\(_, r) -> r)
prettyPrintingPrgm (VarBlock vl) = do
  modify (\(tc, r) -> (tc, r ++ "var "))
  prettyPrintingList ";\n    " vl
prettyPrintingPrgm (VarLine (vs, t)) = do
  prettyPrintingList comma vs
  modify (\(tc, r) -> (tc, r ++ ": "))
  prettyPrintingPrgm t
prettyPrintingPrgm (Var v) = do
  modify (\(tc, r) -> (tc, r ++ v))
  gets (\(_, r) -> r)
prettyPrintingPrgm (Type t) = do
  modify (\(tc, r) -> (tc, r ++ t))
  gets (\(_, r) -> r)
prettyPrintingPrgm (Function ((n, t), ars) vb ob) = do
  let isProcedure = case t of
                      (Type "") -> True
                      _         -> False
  let funType = if isProcedure
                  then "procedure "
                  else "function "
  modify (\(tc, r) -> (tc, r ++ funType))
  prettyPrintingPrgm n
  if null ars
    then if isProcedure
      then gets (\(_, r) -> r)
      else do
        modify (\(tc, r) -> (tc, r ++ "(): "))
        prettyPrintingPrgm t
    else do
      modify (\(tc, r) -> (tc, r ++ "("))
      prettyPrintingList "; " ars
      if isProcedure
        then do
          modify (\(tc, r) -> (tc, r ++ ")"))
          gets (\(_, r) -> r)
        else do
          modify (\(tc, r) -> (tc, r ++ "): "))
          prettyPrintingPrgm t
  modify (\(tc, r) -> (tc, r ++ ";\n"))
  prettyPrintingList ";\n    " vb
  if null vb
    then return ()
    else modify (\(tc, r) -> (tc, r ++ ";\n"))
  modify (\(tc, r) -> (tc, r ++ "begin\n"))
  prettyPrintingList ";\n" ob
  if null ob
    then modify (\(tc, r) -> (tc, r ++ "end;\n"))
    else modify (\(tc, r) -> (tc, r ++ ";\nend;\n"))
  gets (\(_, r) -> r)
prettyPrintingPrgm (FunArg (vs, t)) = do
  prettyPrintingList comma vs
  modify (\(tc, r) -> (tc, r ++ ": "))
  prettyPrintingPrgm t

prettyPrinting :: Prgm -> String
prettyPrinting p = evalState (prettyPrintingPrgm p) (0, "")

main :: IO()
main = do
  inh <- openFile "in.txt" ReadMode
  input <- hGetContents inh
  let parseResult = parseProgram (alexScanTokens input)
  putStrLn $ prettyPrinting parseResult
