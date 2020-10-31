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
type Name = String
type VarTypes = Map.Map Var Type
type VarBoolValues = Map.Map Var Bool
type VarStrValues = Map.Map Var String
type VarIntValues = Map.Map Var Integer
type VarFloatValues = Map.Map Var Float
type Args = [Prgm]
type Funs = Map.Map Name (Type, Args)
type FunOps = Map.Map Name [Operator]
type Procs = Map.Map Name Args
type ProcOps = Map.Map Name [Operator]

data InEnv = InEnv
  { _varTypes :: VarTypes
  , _varBVals :: VarBoolValues
  , _varSVals :: VarStrValues
  , _varIVals :: VarIntValues
  , _varFVals :: VarFloatValues
  , _funs     :: Funs
  , _funOps   :: FunOps
  , _procs    :: Procs
  , _procOps  :: ProcOps
  }
  deriving Show

makeLenses ''InEnv

data AlreadyUsedVarException =
  AlreadyUsedVarException Var Type

instance Exception AlreadyUsedVarException

instance Show AlreadyUsedVarException where
  show (AlreadyUsedVarException v t) =
    "AlreadyUsedVarException: Variable \"" ++ v
    ++ "\" is already used with type " ++ t ++ "."

data AlreadyUsedFunctionNameException =
  AlreadyUsedFunctionNameException Name

instance Exception AlreadyUsedFunctionNameException

instance Show AlreadyUsedFunctionNameException where
  show (AlreadyUsedFunctionNameException n) =
    "AlreadyUsedFunctionNameException: Function name \"" ++ n
    ++ "\" is already used."

data AlreadyUsedProcedureNameException =
  AlreadyUsedProcedureNameException Name

instance Exception AlreadyUsedProcedureNameException

instance Show AlreadyUsedProcedureNameException where
  show (AlreadyUsedProcedureNameException n) =
    "AlreadyUsedProcedureNameException: Procedure name \"" ++ n
    ++ "\" is already used."

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
      then lift $ throwIO $ AlreadyUsedVarException v ((view varTypes env) Map.! v)
      else modify (\env -> over varTypes (Map.insert v t) env))

collectVariables :: [Prgm] -> StateT InEnv IO()
collectVariables [] = return ()
collectVariables ((VarLine (vs, t)) : []) =
  checkVariables vs t
collectVariables ((VarLine (vs, t)) : ps) = do
  checkVariables vs t
  collectVariables ps

checkFunDef :: Prgm -> [Operator] -> StateT InEnv IO()
checkFunDef (FunDef (Var n, Type t) ars) ops
  | t == "" = do
    env <- get
    if (Map.member n (view procs env))
        || (Map.member n (view funs env))
        || (Map.member n (view varTypes env))
      then lift $ throwIO $ AlreadyUsedProcedureNameException n
      else do
        modify (\env -> over procs (Map.insert n ars) env)
        modify (\env -> over procOps (Map.insert n ops) env)
  | otherwise = do
    env <- get
    if (Map.member n (view funs env))
        || (Map.member n (view procs env))
        || (Map.member n (view varTypes env))
      then lift $ throwIO $ AlreadyUsedFunctionNameException n
      else do
        modify (\env -> over funs (Map.insert n (t, ars)) env)
        modify (\env -> over funOps (Map.insert n ops) env)

collectFunsAndProcs :: [Prgm] -> StateT InEnv IO()
collectFunsAndProcs [] = return ()
collectFunsAndProcs ((Function def vb ops) : []) = do
  checkFunDef def ops
collectFunsAndProcs ((Function def vb ops) : fps) = do
  checkFunDef def ops
  collectFunsAndProcs fps

prgmInterpret :: Prgm -> StateT InEnv IO()
prgmInterpret (Program vb fb ob) = do
  forM_ vb (\(VarBlock vl) -> collectVariables vl)
  collectFunsAndProcs fb

main :: IO()
main = do
  inh <- openFile "in.txt" ReadMode
  input <- hGetContents inh
  let parseResult = parseProgram (alexScanTokens input)
  putStrLn ""
