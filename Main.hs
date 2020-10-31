{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}

module Main where

import Control.Exception
import Control.Monad
import Control.Monad.Trans
import Control.Monad.Trans.State
import Control.Lens
import Data.Bits
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

dummyEnv :: InEnv
dummyEnv = InEnv
  { _varTypes = Map.empty
  , _varBVals = Map.empty
  , _varSVals = Map.empty
  , _varIVals = Map.empty
  , _varFVals = Map.empty
  , _funs     = Map.empty
  , _funOps   = Map.empty
  , _procs    = Map.empty
  , _procOps  = Map.empty
  }

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

data NoSuchVarException =
  NoSuchVarException Var

instance Exception NoSuchVarException

instance Show NoSuchVarException where
  show (NoSuchVarException v) =
    "NoSuchVarException: There is no variable \"" ++ v
    ++ "\" in program."

newtype Interpret a = Interpret {opsInterpret :: a}
  deriving Functor

instance PascalExpr (StateT InEnv IO) where
  peAssign (Var v) expr = do
    env <- get
    e <- expr
    let t = Map.lookup v (view varTypes env)
    case t of
      (Just "boolean") ->
        modify (\env -> over varBVals (Map.insert v $ getBool e) env)
      (Just "string")  ->
        modify (\env -> over varSVals (Map.insert v $ getStr e) env)
      (Just "integer") ->
        modify (\env -> over varIVals (Map.insert v $ getInt $ getNum e) env)
      (Just "float")   ->
        modify (\env -> over varFVals (Map.insert v $ getFloat $ getNum e) env)
      Nothing          -> lift $ throwIO $ NoSuchVarException v
  peRead e = undefined
  peReadln e = undefined
  peWrite e = undefined
  peWriteln e = undefined
  peWhile c ops = undefined
  peIf c t e = undefined
  peProcApply f vs isPr = undefined
  peFunApply f vs = undefined
  peLT a b = (fmap (<) a) <*> b
  peGT a b = (fmap (>) a) <*> b
  peLTE a b = (fmap (<=) a) <*> b
  peGTE a b = (fmap (>=) a) <*> b
  peEq a b = (fmap (==) a) <*> b
  peNotEq a b = (fmap (/=) a) <*> b
  peStrSum a b = (fmap (++) a) <*> b
  peSum a b = (fmap (+) a) <*> b
  peSub a b = (fmap (-) a) <*> b
  peBOr a b = (fmap (||) a) <*> b
  peOr a b = (fmap (.|.) a) <*> b
  peBXor a b = undefined
  peXor a b = (fmap (xor) a) <*> b
  peMul a b = (fmap (*) a) <*> b
  peDivide a b = (fmap (/) a) <*> b
  peDiv a b = fmap IntCons $ (fmap (div) a) <*> b
  peMod a b = fmap IntCons $ (fmap (mod) a) <*> b
  peBAnd a b = (fmap (&&) a) <*> b
  peAnd a b = (fmap (.&.) a) <*> b
  peBNot e = fmap not e
  peNot e = fmap complement e
  peNeg e = fmap negate e
  pePos = id
  peVar v = do
    env <- get
    let t = Map.lookup v (view varTypes env)
    lift $ case t of
             (Just "boolean") ->
               return $ BoolCons $ (view varBVals env) Map.! v
             (Just "string")  ->
               return $ StrCons $ (view varSVals env) Map.! v
             (Just "integer") ->
               return $ NumCons $ IntCons $ (view varIVals env) Map.! v
             (Just "float")   ->
               return $ NumCons $ FloatCons $ (view varFVals env) Map.! v
             Nothing  -> throwIO $ NoSuchVarException v
  peReal r = lift $ return $ FloatCons r
  peInt i = lift $ return $ IntCons i
  peStr s = lift $ return s
  peBool b = lift $ return b
  peBr = id

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
  lift $ putStrLn "Process finished."

interpret :: Prgm -> IO()
interpret p = evalStateT (prgmInterpret p) dummyEnv

main :: IO()
main = do
  inh <- openFile "in.txt" ReadMode
  input <- hGetContents inh
  let parseResult = parseProgram (alexScanTokens input)
  interpret parseResult
