{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}

module PascalInterpreter where

import Control.Exception
import Control.Lens
import Control.Monad
import Control.Monad.Trans
import Control.Monad.Trans.State
import Data.Bits
import qualified Data.Map as Map
import Lexer
import MyExceptions
import PrettyPrinter
import Syntax

type VarTypes = Map.Map Var Type
type VarBoolValues = Map.Map Var Bool
type VarStrValues = Map.Map Var String
type VarIntValues = Map.Map Var Integer
type VarFloatValues = Map.Map Var Float
type Args = [Prgm]
type Funs = Map.Map Name (Type, Args)
type FunVars = Map.Map Name VarTypes
type FunOps = Map.Map Name [Operator]
type Procs = Map.Map Name Args
type ProcVars = Map.Map Name VarTypes
type ProcOps = Map.Map Name [Operator]

data InEnv = InEnv
  { _varTypes :: VarTypes
  , _varBVals :: VarBoolValues
  , _varSVals :: VarStrValues
  , _varIVals :: VarIntValues
  , _varFVals :: VarFloatValues
  , _funs     :: Funs
  , _funVars  :: FunVars
  , _funOps   :: FunOps
  , _procs    :: Procs
  , _procVars :: ProcVars
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
  , _funVars  = Map.empty
  , _funOps   = Map.empty
  , _procs    = Map.empty
  , _procVars = Map.empty
  , _procOps  = Map.empty
  }

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
      (Just "real")    ->
        modify (\env -> over varFVals (Map.insert v $ getFloat $ getNum e) env)
      Nothing          -> lift $ throwIO $ NoSuchVarException v
  peReadln (Var v) = do
    env <- get
    val <- lift $ getLine
    let t = Map.lookup v (view varTypes env)
    case t of
      (Just "boolean") ->
        modify (\env -> over varBVals (Map.insert v ((read val) :: Bool)) env)
      (Just "string")  ->
        modify (\env -> over varSVals (Map.insert v val) env)
      (Just "integer") ->
        modify (\env -> over varIVals (Map.insert v ((read val) :: Integer)) env)
      (Just "real")    ->
        modify (\env -> over varFVals (Map.insert v ((read val) :: Float)) env)
      Nothing          -> lift $ throwIO $ NoSuchVarException v
  peWrite e = do
    expr <- e
    lift $ putStr $ case expr of
                      (BoolCons b) -> show b
                      (StrCons s)  -> s
                      (NumCons (IntCons i)) -> show i
                      (NumCons (FloatCons f)) -> show f
  peWriteln e = do
    expr <- e
    lift $ putStrLn $ case expr of
                        (BoolCons b) -> show b
                        (StrCons s) -> s
                        (NumCons (IntCons i)) -> show i
                        (NumCons (FloatCons f)) -> show f
  peWhile cond ops = do
    c <- cond
    if c
      then do
        interpretOperators ops
        peWhile cond ops
      else return ()
  peIf cond t e = do
    c <- cond
    if c
      then interpretOperators t
      else interpretOperators e
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
  peOr a b = fmap IntCons $ (fmap (.|.) a) <*> b
  peBXor a b = (fmap (xor) a) <*> b
  peXor a b = fmap IntCons $ (fmap (xor) a) <*> b
  peMul a b = (fmap (*) a) <*> b
  peDivide a b = (fmap (/) a) <*> b
  peDiv a b = fmap IntCons $ (fmap (div) a) <*> b
  peMod a b = fmap IntCons $ (fmap (mod) a) <*> b
  peBAnd a b = (fmap (&&) a) <*> b
  peAnd a b = fmap IntCons $ (fmap (.&.) a) <*> b
  peBNot e = fmap not e
  peNot e = fmap IntCons $ fmap complement e
  peNeg e = fmap negate e
  pePos = id
  peVar v = do
    env <- get
    let t = Map.lookup v (view varTypes env)
    case t of
      (Just "boolean") ->
        lift $ return $ BoolCons $ (view varBVals env) Map.! v
      (Just "string")  ->
        lift $ return $ StrCons $ (view varSVals env) Map.! v
      (Just "integer") ->
        lift $ return $ NumCons $ IntCons $ (view varIVals env) Map.! v
      (Just "real")    ->
        lift $ return $ NumCons $ FloatCons $ (view varFVals env) Map.! v
      Nothing          ->
        lift $ throwIO $ NoSuchVarException v
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

checkLocalVariables :: [Prgm] -> Prgm -> Name -> StateT InEnv IO()
checkLocalVariables vs (Type t) n = do
  env <- get
  return ()

collectLocalVariables :: [Prgm] -> Prgm -> StateT InEnv IO()
collectLocalVariables [] def = return ()
collectLocalVariables ((VarLine (vs, t)) : []) (FunDef (Var n, _) ars) =
  checkLocalVariables vs t n
collectLocalVariables ((VarLine (vs, t)) : ps) def@(FunDef (Var n, _) ars) = do
  checkLocalVariables vs t n
  collectLocalVariables ps def

collectFunsAndProcs :: [Prgm] -> StateT InEnv IO()
collectFunsAndProcs [] = return ()
collectFunsAndProcs ((Function def vb ops) : []) = do
  checkFunDef def ops
  forM_ vb (\(VarBlock vl) -> collectLocalVariables vl def)
collectFunsAndProcs ((Function def vb ops) : fps) = do
  checkFunDef def ops
  forM_ vb (\(VarBlock vl) -> collectLocalVariables vl def)
  collectFunsAndProcs fps

interpretOperators :: [Operator] -> StateT InEnv IO()
interpretOperators [] = return ()
interpretOperators ((Operator op) : []) = op
interpretOperators ((Operator op) : ops) = do
  op
  interpretOperators ops

interpretPrgm :: Prgm -> StateT InEnv IO()
interpretPrgm (Program vb fb ob) = do
  forM_ vb (\(VarBlock vl) -> collectVariables vl)
  collectFunsAndProcs fb
  interpretOperators ob
  lift $ putStrLn "Process finished."

interpret :: Prgm -> IO()
interpret p = evalStateT (interpretPrgm p) dummyEnv