{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE TemplateHaskell #-}

module Main where

import Control.Exception
import Control.Monad
import Control.Monad.Trans
import Control.Monad.Trans.State
import Control.Lens
import qualified Data.Map as Map
import Lexer
import PrettyPrinter
import Syntax
import System.IO

type Var = String
type Type = String
type VarTypes = Map.Map Var Type
type VarBoolValues = Map.Map Var Bool
type VarStrValues = Map.Map Var String
type VarIntValues = Map.Map Var Integer
type VarFloatValues = Map.Map Var Float
type Args = [(Var, Type)]
type Funs = Map.Map Var (Type, Args)
type Procs = Map.Map Var Args

data InEnv = InEnv
  { _varTypes :: VarTypes
  , _varBVals :: VarBoolValues
  , _varSVals :: VarStrValues
  , _varIVals :: VarIntValues
  , _varFVals :: VarFloatValues
  , _funs     :: Funs
  , _procs    :: Procs
  }
  deriving Show

makeLenses ''InEnv

data AlreadyUsedVarException = AlreadyUsedVarException String

instance Exception AlreadyUsedVarException

instance Show AlreadyUsedVarException where
  show (AlreadyUsedVarException e) = "AlreadyUsedVarException: " ++ e

newtype Interpret a = Interpret {interpret :: a}
  deriving Functor

instance PascalExpr Interpret where
  peAssign v e = undefined
  peRead e = undefined
  peReadln e = undefined
  peWrite e = undefined
  peWriteln e = undefined
  peWhile c ops = undefined
  peIf c t e = undefined
  peProcApply f vs isPr = undefined
  peFunApply f vs = undefined
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
  peVar = Interpret . StrCons
  peReal = Interpret . FloatCons
  peInt = Interpret . IntCons
  peStr = Interpret
  peBool = Interpret
  peBr e = undefined

checkVariables :: [Prgm] -> Prgm -> StateT InEnv IO()
checkVariables vs (Type t) = do
  env <- get
  forM_ vs (\(Var v) ->
    if Map.member v (view varTypes env)
      then lift $ throwIO $ AlreadyUsedVarException ("Variable " ++ v ++ " is already used with another or same type.")
      else modify (\env -> over varTypes (Map.insert v t) env))

collectVariables :: [Prgm] -> StateT InEnv IO()
collectVariables [] = return ()
collectVariables ((VarLine (vs, t)) : []) =
  checkVariables vs t
collectVariables ((VarLine (vs, t)) : ps) = do
  checkVariables vs t
  collectVariables ps

collectFunsAndProcs :: [Prgm] -> StateT InEnv IO()
collectFunsAndProcs [] = return ()
collectFunsAndProcs (fp : []) = undefined
collectFunsAndProcs (fp : fps) = undefined

prgmInterpret :: Prgm -> StateT InEnv IO()
prgmInterpret (Program vb fb ob) = do
  forM_ vb (\(VarBlock vl) -> collectVariables vl)

main :: IO()
main = do
  inh <- openFile "in.txt" ReadMode
  input <- hGetContents inh
  let parseResult = parseProgram (alexScanTokens input)
  putStrLn ""
