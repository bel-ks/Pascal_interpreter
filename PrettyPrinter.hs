{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE DeriveFunctor #-}

module PrettyPrinter where

import Control.Monad.State
import Lexer
import Syntax

type TabCount = Int
type PrEnv = (TabCount, String)

tab :: String
tab = "  "

comma :: String
comma = ", "

newtype OpToString a = OpToString {toString :: String}
  deriving (Show, Semigroup, Functor)

castST :: OpToString a -> OpToString b
castST (OpToString s) = OpToString s

instance PascalExpr OpToString where
  peAssign v e = castST v <> OpToString " := " <> castST e
  peRead e = OpToString "read(" <> e <> OpToString ")"
  peReadln e = OpToString "readln(" <> e <> OpToString ")"
  peWrite e = OpToString "write(" <> e <> OpToString ")"
  peWriteln e = OpToString "writeln(" <> e <> OpToString ")"
  peWhile c ops = OpToString "while " <> castST c <> OpToString " do\n"
                  <> (if (length ops > 1)
                        then OpToString "  begin\n"
                             <> (OpToString (evalState (prettyPrintOperators ops) (2, "")))
                             <> OpToString ";\n  end"
                        else OpToString (evalState (prettyPrintOperators ops) (2, "")))
  peIf c t e = OpToString "if " <> castST c <> OpToString " then\n"
               <> (if (length t > 1)
                     then OpToString "  begin\n"
                          <> (OpToString (evalState (prettyPrintOperators t) (2, "")))
                          <> OpToString ";\n  end"
                     else OpToString (evalState (prettyPrintOperators t) (2, "")))
               <> (if null e
                     then OpToString ""
                     else OpToString "\n  else\n"
                          <> (if (length e > 1)
                                then OpToString "  begin\n"
                                     <> (OpToString (evalState (prettyPrintOperators e) (2, "")))
                                     <> OpToString ";\n  end"
                                else OpToString (evalState (prettyPrintOperators e) (2, ""))))
  peProcApply f vs isPr
    | isPr && (null vs) = f
    | otherwise = f <> OpToString "("
                    <> (foldl (<>) (OpToString "") $ fmap (<> OpToString ", ") (init vs))
                    <> (last vs) <> OpToString ")"
  peFunApply f vs = f <> OpToString "("
                    <> (foldl (<>) (OpToString "") $ fmap (<> OpToString ", ") (init vs))
                    <> (last vs) <> OpToString ")"
  peLT a b = castST a <> OpToString " < " <> castST b
  peGT a b = castST a <> OpToString " > " <> castST b
  peLTE a b = castST a <> OpToString " <= " <> castST b
  peGTE a b = castST a <> OpToString " >= " <> castST b
  peEq a b = castST a <> OpToString " = " <> castST b
  peNotEq a b = castST a <> OpToString " <> " <> castST b
  peSum a b = a <> OpToString " + " <> b
  peSub a b = a <> OpToString " - " <> b
  peOr a b = a <> OpToString " or " <> b
  peXor a b = a <> OpToString " xor " <> b
  peMul a b = a <> OpToString " * " <> b
  peDivide a b = a <> OpToString " / " <> b
  peDiv a b = a <> OpToString " div " <> b
  peMod a b = a <> OpToString " mod " <> b
  peAnd a b = a <> OpToString " and " <> b
  peNot e = OpToString "not " <> e
  peNeg e = OpToString "-" <> e
  pePos e = OpToString "+" <> e
  peVar = OpToString
  peReal = OpToString . show
  peInt = OpToString . show
  peStr = OpToString
  peBool = OpToString . show
  peBr e = OpToString "(" <> e <> OpToString ")"

prettyPrintOperators :: [Operator] -> State PrEnv String
prettyPrintOperators [] =
  gets (\(_, r) -> r)
prettyPrintOperators ((Operator op) : []) = do
  modify (\(tc, r) -> (tc, r ++ (concat $ replicate tc tab) ++ (toString op)))
  gets (\(_, r) -> r)
prettyPrintOperators ((Operator op) : ops) = do
  modify (\(tc, r) -> (tc, r ++ (concat $ replicate tc tab) ++ (toString op) ++ ";\n"))
  prettyPrintOperators ops

prettyPrintList :: String -> [Prgm] -> State PrEnv String
prettyPrintList _ [] =
  gets (\(_, r) -> r)
prettyPrintList _ (p : []) =
  prettyPrintPrgm p
prettyPrintList sep (p : ps) = do
  prettyPrintPrgm p
  modify (\(tc, r) -> (tc, r ++ sep))
  prettyPrintList sep ps

prettyPrintPrgm :: Prgm -> State PrEnv String
prettyPrintPrgm (Program vb fb ob) = do
  prettyPrintList "\n" vb
  if null vb
    then return ()
    else modify (\(tc, r) -> (tc, r ++ ";\n\n"))
  prettyPrintList "\n" fb
  if null fb
    then modify (\(tc, r) -> (tc + 1, r ++ "begin\n"))
    else modify (\(tc, r) -> (tc + 1, r ++ "\nbegin\n"))
  prettyPrintOperators ob
  if null ob
    then modify (\(tc, r) -> (tc - 1, r ++ "end."))
    else modify (\(tc, r) -> (tc - 1, r ++ ";\nend."))
  gets (\(_, r) -> r)
prettyPrintPrgm (VarBlock vl) = do
  modify (\(tc, r) -> (tc, r ++ "var "))
  prettyPrintList ";\n    " vl
prettyPrintPrgm (VarLine (vs, t)) = do
  prettyPrintList comma vs
  modify (\(tc, r) -> (tc, r ++ ": "))
  prettyPrintPrgm t
prettyPrintPrgm (Var v) = do
  modify (\(tc, r) -> (tc, r ++ v))
  gets (\(_, r) -> r)
prettyPrintPrgm (Type t) = do
  modify (\(tc, r) -> (tc, r ++ t))
  gets (\(_, r) -> r)
prettyPrintPrgm (Function ((n, t), ars) vb ob) = do
  let isProcedure = case t of
                      (Type "") -> True
                      _         -> False
  let funType = if isProcedure
                  then "procedure "
                  else "function "
  modify (\(tc, r) -> (tc, r ++ funType))
  prettyPrintPrgm n
  if null ars
    then if isProcedure
      then gets (\(_, r) -> r)
      else do
        modify (\(tc, r) -> (tc, r ++ "(): "))
        prettyPrintPrgm t
    else do
      modify (\(tc, r) -> (tc, r ++ "("))
      prettyPrintList "; " ars
      if isProcedure
        then do
          modify (\(tc, r) -> (tc, r ++ ")"))
          gets (\(_, r) -> r)
        else do
          modify (\(tc, r) -> (tc, r ++ "): "))
          prettyPrintPrgm t
  modify (\(tc, r) -> (tc, r ++ ";\n"))
  prettyPrintList ";\n    " vb
  if null vb
    then return ()
    else modify (\(tc, r) -> (tc, r ++ ";\n"))
  modify (\(tc, r) -> (tc + 1, r ++ "begin\n"))
  prettyPrintOperators ob
  if null ob
    then modify (\(tc, r) -> (tc - 1, r ++ "end;\n"))
    else modify (\(tc, r) -> (tc - 1, r ++ ";\nend;\n"))
  gets (\(_, r) -> r)
prettyPrintPrgm (FunArg (vs, t)) = do
  prettyPrintList comma vs
  modify (\(tc, r) -> (tc, r ++ ": "))
  prettyPrintPrgm t

prettyPrint :: Prgm -> String
prettyPrint p = evalState (prettyPrintPrgm p) (0, "")