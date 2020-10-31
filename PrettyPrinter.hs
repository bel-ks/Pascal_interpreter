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
  peAssign (Var v) e = OpToString v <> OpToString " := " <> castST e
  peRead e = OpToString "read(" <> castST e <> OpToString ")"
  peReadln e = OpToString "readln(" <> castST e <> OpToString ")"
  peWrite e = OpToString "write(" <> castST e <> OpToString ")"
  peWriteln e = OpToString "writeln(" <> castST e <> OpToString ")"
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
  peProcApply (Var f) vs isPr
    | isPr && (null vs) = OpToString f
    | otherwise = OpToString f <> OpToString "("
                    <> (foldl (<>) (OpToString "") $ fmap (<> OpToString ", ") (init (fmap castST vs)))
                    <> castST (last vs) <> OpToString ")"
  peFunApply (Var f) vs = OpToString f <> OpToString "("
                    <> (foldl (<>) (OpToString "") $ fmap (<> OpToString ", ") (init vs))
                    <> (last vs) <> OpToString ")"
  peLT a b = castST a <> OpToString " < " <> castST b
  peGT a b = castST a <> OpToString " > " <> castST b
  peLTE a b = castST a <> OpToString " <= " <> castST b
  peGTE a b = castST a <> OpToString " >= " <> castST b
  peEq a b = castST a <> OpToString " = " <> castST b
  peNotEq a b = castST a <> OpToString " <> " <> castST b
  peStrSum a b = a <> OpToString " + " <> b
  peSum a b = a <> OpToString " + " <> b
  peSub a b = a <> OpToString " - " <> b
  peBOr a b = a <> OpToString " or " <> b
  peOr a b = a <> OpToString " or " <> b
  peBXor a b = a <> OpToString " xor " <> b
  peXor a b = a <> OpToString " xor " <> b
  peMul a b = a <> OpToString " * " <> b
  peDivide a b = a <> OpToString " / " <> b
  peDiv a b = castST a <> OpToString " div " <> castST b
  peMod a b = castST a <> OpToString " mod " <> castST b
  peBAnd a b = a <> OpToString " and " <> b
  peAnd a b = a <> OpToString " and " <> b
  peBNot e = OpToString "not " <> e
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
prettyPrintPrgm (Function def vb ob) = do
  prettyPrintPrgm def
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
prettyPrintPrgm (FunDef (n, t)  ars) = do
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
prettyPrintPrgm (FunArg (vs, t)) = do
  prettyPrintList comma vs
  modify (\(tc, r) -> (tc, r ++ ": "))
  prettyPrintPrgm t

prettyPrint :: Prgm -> String
prettyPrint p = evalState (prettyPrintPrgm p) (0, "")

instance Show Operator where
  show (Operator op) = toString op

instance Show Prgm where
  show = prettyPrint