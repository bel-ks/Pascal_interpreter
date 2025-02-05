{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE DeriveFunctor #-}

module PrettyPrinter
  ( prettyPrint
  ) where

import Syntax
  ( Operator (..)
  , PascalExpr (..)
  , Prgm (..)
  )

import Control.Monad.State
  ( evalState
  , gets
  , modify
  , State
  )

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
  peAssign _ _ = OpToString "Incorrect constructor."
  peReadln (Var v) = OpToString "readln(" <> OpToString v <> OpToString ")"
  peReadln _ = OpToString "Incorrect constructor."
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
  peFunApply (Var f) vs = OpToString f <> OpToString "("
                          <> (foldl (<>) (OpToString "") $ fmap (<> OpToString ", ") (init vs))
                          <> (last vs) <> OpToString ")"
  peFunApply _ _ = OpToString "Incorrect constructor."
  peLT a b = castST a <> OpToString " < " <> castST b
  peGT a b = castST a <> OpToString " > " <> castST b
  peLTE a b = castST a <> OpToString " <= " <> castST b
  peGTE a b = castST a <> OpToString " >= " <> castST b
  peEq a b = castST a <> OpToString " = " <> castST b
  peNotEq a b = castST a <> OpToString " <> " <> castST b
  peSum a b = a <> OpToString " + " <> b
  peSub a b = a <> OpToString " - " <> b
  peOr a b = castST a <> OpToString " or " <> castST b
  peXor a b = castST a <> OpToString " xor " <> castST b
  peMul a b = a <> OpToString " * " <> b
  peDivide a b = a <> OpToString " / " <> b
  peDiv a b = castST a <> OpToString " div " <> castST b
  peMod a b = castST a <> OpToString " mod " <> castST b
  peAnd a b = castST a <> OpToString " and " <> castST b
  peNot e = OpToString "not " <> castST e
  peNeg e = OpToString "-" <> e
  pePos e = OpToString "+" <> e
  peVar = OpToString
  peReal = OpToString . show
  peInt = OpToString . show
  peStr s = OpToString "\"" <> OpToString s <> OpToString "\""
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
  _ <- prettyPrintPrgm p
  modify (\(tc, r) -> (tc, r ++ sep))
  prettyPrintList sep ps

prettyPrintPrgm :: Prgm -> State PrEnv String
prettyPrintPrgm (Program vb fb ob) = do
  _ <- prettyPrintList "\n" vb
  if null vb
    then return ()
    else modify (\(tc, r) -> (tc, r ++ ";\n\n"))
  _ <- prettyPrintList "\n" fb
  if null fb
    then modify (\(tc, r) -> (tc + 1, r ++ "begin\n"))
    else modify (\(tc, r) -> (tc + 1, r ++ "\nbegin\n"))
  _ <- prettyPrintOperators ob
  if null ob
    then modify (\(tc, r) -> (tc - 1, r ++ "end."))
    else modify (\(tc, r) -> (tc - 1, r ++ ";\nend."))
  gets (\(_, r) -> r)
prettyPrintPrgm (VarBlock vl) = do
  modify (\(tc, r) -> (tc, r ++ "var "))
  prettyPrintList ";\n    " vl
prettyPrintPrgm (VarLine (vs, t)) = do
  _ <- prettyPrintList comma vs
  modify (\(tc, r) -> (tc, r ++ ": "))
  prettyPrintPrgm t
prettyPrintPrgm (Var v) = do
  modify (\(tc, r) -> (tc, r ++ v))
  gets (\(_, r) -> r)
prettyPrintPrgm (Type t) = do
  modify (\(tc, r) -> (tc, r ++ t))
  gets (\(_, r) -> r)
prettyPrintPrgm (Function def vb ob) = do
  _ <- prettyPrintPrgm def
  modify (\(tc, r) -> (tc, r ++ ";\n"))
  _ <- prettyPrintList ";\n    " vb
  if null vb
    then return ()
    else modify (\(tc, r) -> (tc, r ++ ";\n"))
  modify (\(tc, r) -> (tc + 1, r ++ "begin\n"))
  _ <- prettyPrintOperators ob
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
  _ <- prettyPrintPrgm n
  if null ars
    then if isProcedure
      then gets (\(_, r) -> r)
      else do
        modify (\(tc, r) -> (tc, r ++ "(): "))
        prettyPrintPrgm t
    else do
      modify (\(tc, r) -> (tc, r ++ "("))
      _ <- prettyPrintList "; " ars
      if isProcedure
        then do
          modify (\(tc, r) -> (tc, r ++ ")"))
          gets (\(_, r) -> r)
        else do
          modify (\(tc, r) -> (tc, r ++ "): "))
          prettyPrintPrgm t

-- | Function gets Token tree with parsed Pascal program
--   and returns string with it in a pretty form.
prettyPrint :: Prgm -> String
prettyPrint p = evalState (prettyPrintPrgm p) (0, "")

instance Show Operator where
  show (Operator op) = toString op
