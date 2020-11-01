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

instance Show Prgm where
  show = prettyPrint

data InEnv = InEnv
  { _varTypes :: VarTypes
  , _varBVals :: VarBoolValues
  , _varSVals :: VarStrValues
  , _varIVals :: VarIntValues
  , _varFVals :: VarFloatValues
  , _funs     :: Funs
  , _funVars  :: FunVars
  , _funOps   :: FunOps
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
  }

instance PascalExpr (StateT InEnv IO) where
  peAssign (Var v) expr = do
    env <- get
    e <- expr
    let t = Map.lookup v (view varTypes env)
    case t of
      (Just "boolean") ->
        modify (\envL -> over varBVals (Map.insert v $ getBool e) envL)
      (Just "string")  ->
        modify (\envL -> over varSVals (Map.insert v $ getStr e) envL)
      (Just "integer") ->
        modify (\envL -> over varIVals (Map.insert v $ getInt $ getNum e) envL)
      (Just "real")    ->
        modify (\envL -> over varFVals (Map.insert v $ getFloat $ getNum e) envL)
      (Just _)         -> undefined
      Nothing          -> lift $ throwIO $ NoSuchVarException v
  peAssign c _ = lift $ throwIO $ IncorrectConstructorException (show c) "(Var)" "peAssign"
  peReadln (Var v) = do
    env <- get
    val <- lift $ getLine
    let t = Map.lookup v (view varTypes env)
    case t of
      (Just "boolean") ->
        modify (\envL -> over varBVals (Map.insert v ((read val) :: Bool)) envL)
      (Just "string")  ->
        modify (\envL -> over varSVals (Map.insert v val) envL)
      (Just "integer") ->
        modify (\envL -> over varIVals (Map.insert v ((read val) :: Integer)) envL)
      (Just "real")    ->
        modify (\envL -> over varFVals (Map.insert v ((read val) :: Float)) envL)
      (Just _)         -> undefined
      Nothing          -> lift $ throwIO $ NoSuchVarException v
  peReadln c = lift $ throwIO $ IncorrectConstructorException (show c) "(Var)" "peReadln"
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
    case c of
      (BoolCons cn) ->
        if cn
          then do
            interpretOperators ops
            peWhile cond ops
          else return ()
      _ -> lift $ throwIO NotBoolTypeException
  peIf cond t e = do
    c <- cond
    case c of
      (BoolCons cn) ->
        if cn
          then interpretOperators t
          else interpretOperators e
      _ -> lift $ throwIO NotBoolTypeException
  peProcApply = undefined
  peFunApply = undefined
  peLT ma mb = do
    a <- ma
    b <- mb
    lift $ case (a, b) of
             ((NumCons an), (NumCons bn)) -> return $ BoolCons $ an < bn
             ((StrCons an), (StrCons bn)) -> return $ BoolCons $ an < bn
             ((BoolCons an), (BoolCons bn)) -> return $ BoolCons $ an < bn
             (_, _) -> throwIO DifferentTypesException
  peGT ma mb = do
    a <- ma
    b <- mb
    lift $ case (a, b) of
             ((NumCons an), (NumCons bn)) -> return $ BoolCons $ an > bn
             ((StrCons an), (StrCons bn)) -> return $ BoolCons $ an > bn
             ((BoolCons an), (BoolCons bn)) -> return $ BoolCons $ an > bn
             (_, _) -> throwIO DifferentTypesException
  peLTE ma mb = do
    a <- ma
    b <- mb
    lift $ case (a, b) of
             ((NumCons an), (NumCons bn)) -> return $ BoolCons $ an <= bn
             ((StrCons an), (StrCons bn)) -> return $ BoolCons $ an <= bn
             ((BoolCons an), (BoolCons bn)) -> return $ BoolCons $ an <= bn
             (_, _) -> throwIO DifferentTypesException
  peGTE ma mb = do
    a <- ma
    b <- mb
    lift $ case (a, b) of
             ((NumCons an), (NumCons bn)) -> return $ BoolCons $ an >= bn
             ((StrCons an), (StrCons bn)) -> return $ BoolCons $ an >= bn
             ((BoolCons an), (BoolCons bn)) -> return $ BoolCons $ an >= bn
             (_, _) -> throwIO DifferentTypesException
  peEq ma mb = do
    a <- ma
    b <- mb
    lift $ case (a, b) of
             ((NumCons an), (NumCons bn)) -> return $ BoolCons $ an == bn
             ((StrCons an), (StrCons bn)) -> return $ BoolCons $ an == bn
             ((BoolCons an), (BoolCons bn)) -> return $ BoolCons $ an == bn
             (_, _) -> throwIO DifferentTypesException
  peNotEq ma mb = do
    a <- ma
    b <- mb
    lift $ case (a, b) of
             ((NumCons an), (NumCons bn)) -> return $ BoolCons $ an /= bn
             ((StrCons an), (StrCons bn)) -> return $ BoolCons $ an /= bn
             ((BoolCons an), (BoolCons bn)) -> return $ BoolCons $ an /= bn
             (_, _) -> throwIO DifferentTypesException
  peSum ma mb = do
    a <- ma
    b <- mb
    lift $ case (a, b) of
             ((NumCons an), (NumCons bn)) -> return $ NumCons $ an + bn
             ((StrCons an), (StrCons bn)) -> return $ StrCons $ an ++ bn
             (_, _) -> throwIO DifferentTypesException
  peSub ma mb = do
    a <- ma
    b <- mb
    lift $ case (a, b) of
             ((NumCons an), (NumCons bn)) -> return $ NumCons $ an - bn
             (_, _) -> throwIO DifferentTypesException
  peOr ma mb = do
    a <- ma
    b <- mb
    lift $ case (a, b) of
             ((NumCons (IntCons an)), (NumCons (IntCons bn))) ->
               return $ NumCons $ IntCons $ an .|. bn
             ((BoolCons an), (BoolCons bn)) -> return $ BoolCons $ an || bn
             (_, _) -> throwIO DifferentTypesException
  peXor ma mb = do
    a <- ma
    b <- mb
    lift $ case (a, b) of
             ((NumCons (IntCons an)), (NumCons (IntCons bn))) ->
               return $ NumCons $ IntCons $ xor an bn
             ((BoolCons an), (BoolCons bn)) -> return $ BoolCons $ xor an bn
             (_, _) -> throwIO DifferentTypesException
  peMul ma mb = do
    a <- ma
    b <- mb
    lift $ case (a, b) of
             ((NumCons an), (NumCons bn)) -> return $ NumCons $ an * bn
             (_, _) -> throwIO DifferentTypesException
  peDivide ma mb = do
    a <- ma
    b <- mb
    lift $ case (a, b) of
             ((NumCons an), (NumCons bn)) -> return $ NumCons $ an / bn
             (_, _) -> throwIO DifferentTypesException
  peDiv ma mb = do
    a <- ma
    b <- mb
    lift $ case (a, b) of
             ((NumCons (IntCons an)), (NumCons (IntCons bn))) ->
               return $ NumCons $ IntCons $ div an bn
             (_, _) -> throwIO DifferentTypesException
  peMod ma mb = do
    a <- ma
    b <- mb
    lift $ case (a, b) of
             ((NumCons (IntCons an)), (NumCons (IntCons bn))) ->
               return $ NumCons $ IntCons $ mod an bn
             (_, _) -> throwIO DifferentTypesException
  peAnd ma mb = do
    a <- ma
    b <- mb
    lift $ case (a, b) of
             ((NumCons (IntCons an)), (NumCons (IntCons bn))) ->
               return $ NumCons $ IntCons $ an .&. bn
             ((BoolCons an), (BoolCons bn)) -> return $ BoolCons $ an && bn
             (_, _) -> throwIO DifferentTypesException
  peNot me = do
    e <- me
    lift $ case e of
             (NumCons (IntCons en)) ->
               return $ NumCons $ IntCons $ complement en
             (BoolCons en) -> return $ BoolCons $ not en
             _ -> throwIO DifferentTypesException
  peNeg me = do
    e <- me
    lift $ case e of
             (NumCons (IntCons en)) ->
               return $ NumCons $ IntCons $ negate en
             _ -> throwIO DifferentTypesException
  pePos me = do
    e <- me
    lift $ case e of
             (NumCons (IntCons _)) -> return e
             _ -> throwIO DifferentTypesException
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
      (Just _)         -> undefined
      Nothing          ->
        lift $ throwIO $ NoSuchVarException v
  peReal r = lift $ return $ NumCons $ FloatCons r
  peInt i = lift $ return $ NumCons $ IntCons i
  peStr s = lift $ return $ StrCons s
  peBool b = lift $ return $ BoolCons b
  peBr = id

checkVariables :: [Prgm] -> Prgm -> StateT InEnv IO()
checkVariables vs (Type t) = do
  env <- get
  forM_ vs (\(Var v) ->
    if Map.member v (view varTypes env)
      then lift $ throwIO $ AlreadyUsedVarException v ((view varTypes env) Map.! v)
      else modify (\envL -> over varTypes (Map.insert v t) envL))
checkVariables _ c = lift $ throwIO $ IncorrectConstructorException (show c) "(Type)" "checkVariables"

collectVariables :: [Prgm] -> StateT InEnv IO()
collectVariables [] = return ()
collectVariables ((VarLine (vs, t)) : []) =
  checkVariables vs t
collectVariables ((VarLine (vs, t)) : ps) = do
  checkVariables vs t
  collectVariables ps
collectVariables c = lift $ throwIO $ IncorrectConstructorException (show c) "[VarLine]" "collectVariables"

checkFunDef :: Prgm -> [Operator] -> StateT InEnv IO()
checkFunDef (FunDef (Var n, Type t) ars) ops = do
  env <- get
  if (Map.member n (view funs env))
      || (Map.member n (view varTypes env))
    then lift $ throwIO $ AlreadyUsedFunctionNameException n
    else do
      modify (\envL -> over funs (Map.insert n (t, ars)) envL)
      modify (\envL -> over funOps (Map.insert n ops) envL)
checkFunDef c _ = lift $ throwIO $ IncorrectConstructorException (show c) "(FunDef)" "checkFunDef"

checkLocalVariables :: [Prgm] -> Prgm -> Name -> StateT InEnv IO()
checkLocalVariables = undefined

collectLocalVariables :: [Prgm] -> Prgm -> StateT InEnv IO()
collectLocalVariables [] _ = return ()
collectLocalVariables ((VarLine (vs, t)) : []) (FunDef (Var n, _) _) =
  checkLocalVariables vs t n
collectLocalVariables ((VarLine (vs, t)) : ps) def@(FunDef (Var n, _) _) = do
  checkLocalVariables vs t n
  collectLocalVariables ps def
collectLocalVariables c _ = lift $ throwIO $ IncorrectConstructorException (show c) "[VarLine]" "collectLocalVariables"

collectFunsAndProcs :: [Prgm] -> StateT InEnv IO()
collectFunsAndProcs [] = return ()
collectFunsAndProcs ((Function def vb ops) : []) = do
  checkFunDef def ops
--  forM_ vb (\(VarBlock vl) -> collectLocalVariables vl def)
collectFunsAndProcs ((Function def vb ops) : fps) = do
  checkFunDef def ops
--  forM_ vb (\(VarBlock vl) -> collectLocalVariables vl def)
  collectFunsAndProcs fps
collectFunsAndProcs c = lift $ throwIO $ IncorrectConstructorException (show c) "[Function]" "collectFunsAndProcs"

interpretOperators :: [Operator] -> StateT InEnv IO()
interpretOperators [] = return ()
interpretOperators ((Operator o) : []) = o
interpretOperators ((Operator o) : ops) = do
  o
  interpretOperators ops

interpretPrgm :: Prgm -> StateT InEnv IO()
interpretPrgm (Program vb fb ob) = do
  forM_ vb (\(VarBlock vl) -> collectVariables vl)
  collectFunsAndProcs fb
  interpretOperators ob
  lift $ putStrLn "Process finished."
interpretPrgm c = lift $ throwIO $ IncorrectConstructorException (show c) "Program" "interpretPrgm"

interpret :: Prgm -> IO()
interpret p = evalStateT (interpretPrgm p) dummyEnv