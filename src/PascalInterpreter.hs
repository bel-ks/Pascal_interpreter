{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}

module PascalInterpreter
  ( dummyEnv
  , InEnv (..)
  , interpret
  , interpretPrgm
  ) where

import MyExceptions
  ( AlreadyUsedLocalVarException (..)
  , AlreadyUsedFunctionNameException (..)
  , AlreadyUsedVarException (..)
  , ArgumentsException (..)
  , DifferentTypesException (..)
  , IncorrectConstructorException (..)
  , Name
  , NoSuchFunException (..)
  , NoSuchTypeException (..)
  , NoSuchVarException (..)
  , NotBoolTypeException (..)
  , Type
  , Var
  )
import PrettyPrinter
  ( prettyPrint
  )
import Syntax
  ( Number (..)
  , Operator (..)
  , PascalExpr (..)
  , Prgm (..)
  , Variable (..)
  )

import Control.Exception
  ( throwIO
  )
import Control.Lens
  ( makeLenses
  , over
  , view
  )
import Control.Monad
  ( forM_
  )
import Control.Monad.Trans
  ( lift
  )
import Control.Monad.Trans.State
  ( evalStateT
  , get
  , modify
  , StateT
  )
import Data.Bits
  ( (.|.)
  , (.&.)
  , complement
  , xor
  )
import qualified Data.Map as Map
  ( (!)
  , empty
  , findWithDefault
  , insert
  , lookup
  , Map
  , member
  , union
  )

type VarTypes = Map.Map Var Type
type VarBoolValues = Map.Map Var Bool
type VarStrValues = Map.Map Var String
type VarIntValues = Map.Map Var Integer
type VarFloatValues = Map.Map Var Float
type Args = [(Var, Type)]
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
      (Just st)        -> lift $ throwIO $ NoSuchTypeException st
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
      (Just st)        -> lift $ throwIO $ NoSuchTypeException st
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
  peFunApply (Var n) mars = do
    env <- get
    ars <- (sequenceA mars)
    if Map.member n (view funs env)
      then do
        let needArs = snd ((view funs env) Map.! n)
        if (length needArs == length ars)
          then do
            let check = filter (\((_, t), e) -> do
                                  case (t, e) of
                                    ("boolean", BoolCons _)          -> True
                                    ("string", StrCons _)            -> True
                                    ("integer", NumCons (IntCons _)) -> True
                                    ("real", NumCons (FloatCons _))  -> True
                                    (_, _)                           -> False) (zip needArs ars)
            if (length needArs == length check)
              then do
                modify (\envL -> over varTypes (
                          if Map.member n (view funVars envL)
                            then Map.union ((view funVars envL) Map.! n) 
                            else id) envL)
                let t = fst ((view funs env) Map.! n)
                modify (\envL -> over varTypes (Map.insert n t) envL)
                interpretOperators (Map.findWithDefault [] n (view funOps env))
                nenv <- get
                modify (\_ -> env)
                lift $ return $ case t of
                                  "boolean" ->
                                    BoolCons $ case (Map.lookup n (view varBVals nenv)) of
                                                 (Just r) -> r
                                                 Nothing  -> undefined
                                  "string"  ->
                                    StrCons $ case (Map.lookup n (view varSVals nenv)) of
                                                (Just r) -> r
                                                Nothing  -> undefined
                                  "integer" ->
                                    NumCons $ IntCons $ case (Map.lookup n (view varIVals nenv)) of
                                                          (Just r) -> r
                                                          Nothing  -> undefined
                                  "real"    ->
                                    NumCons $ FloatCons $ case (Map.lookup n (view varFVals nenv)) of
                                                            (Just r) -> r
                                                            Nothing  -> undefined
                                  _         -> undefined
              else lift $ throwIO $ ArgumentsException n
          else lift $ throwIO $ ArgumentsException n
      else lift $ throwIO $ NoSuchFunException n
  peFunApply c _ = lift $ throwIO $ IncorrectConstructorException (show c) "(Var)" "peFunApply"
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
             (NumCons en) ->
               return $ NumCons $ negate en
             _ -> throwIO DifferentTypesException
  pePos me = do
    e <- me
    lift $ case e of
             (NumCons _) -> return e
             _ -> throwIO DifferentTypesException
  peVar v = do
    env <- get
    let t = Map.lookup v (view varTypes env)
    case t of
      (Just "boolean") ->
        lift $ return $ BoolCons $ case (Map.lookup v (view varBVals env)) of
                                     (Just r) -> r
                                     Nothing  -> undefined
      (Just "string")  ->
        lift $ return $ StrCons $ case (Map.lookup v (view varSVals env)) of
                                    (Just r) -> r
                                    Nothing  -> undefined
      (Just "integer") ->
        lift $ return $ NumCons $ IntCons $ case (Map.lookup v (view varIVals env)) of
                                              (Just r) -> r
                                              Nothing  -> undefined
      (Just "real")    ->
        lift $ return $ NumCons $ FloatCons $ case (Map.lookup v (view varFVals env)) of
                                                (Just r) -> r
                                                Nothing  -> undefined
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

checkLocalVariables :: [Prgm] -> Prgm -> Name -> StateT InEnv IO()
checkLocalVariables vs (Type t) n = do
  env <- get
  let fv = if Map.member n (view funVars env)
             then (view funVars env) Map.! n
             else Map.empty
  forM_ vs (\(Var v) ->
    if (Map.member v (view funs env)) || (Map.member v fv)
      then lift $ throwIO $ AlreadyUsedLocalVarException v
      else do
        let fvs = Map.insert v t fv
        modify (\envL -> over funVars (Map.insert n fvs) envL))
checkLocalVariables _ c _ = lift $ throwIO $ IncorrectConstructorException (show c) "(Type)" "checkLocalVariables"

checkArgs :: [Prgm] -> Prgm -> Name -> StateT InEnv IO()
checkArgs vs (Type t) n = do
  env <- get
  forM_ vs (\(Var v) ->
    if (Map.member v (view funs env))
      then lift $ throwIO $ AlreadyUsedLocalVarException v
      else do
        let fvs = Map.insert v t $ if Map.member n (view funVars env)
                                     then (view funVars env) Map.! n
                                     else Map.empty
        modify (\envL -> over funVars (Map.insert n fvs) envL))
checkArgs _ c _ = lift $ throwIO $ IncorrectConstructorException (show c) "(Type)" "checkArgs"

transformArgs :: [Prgm] -> IO Args
transformArgs [] = return []
transformArgs ((VarLine (vs, (Type t))) : []) =
  return $ fmap (\(Var v) -> (v, t)) vs
transformArgs ((VarLine (vs, (Type t))) : ars) = do
  trArs <- transformArgs ars
  return $ (fmap (\(Var v) -> (v, t)) vs) ++ trArs
transformArgs c = throwIO $ IncorrectConstructorException (show c) "[VarLine]" "transformArgs"

checkFunDef :: Prgm -> [Operator] -> StateT InEnv IO()
checkFunDef def@(FunDef (Var n, Type t) ars) ops = do
  env <- get
  if (Map.member n (view funs env))
      || (Map.member n (view varTypes env))
    then lift $ throwIO $ AlreadyUsedFunctionNameException n
    else do
      arsArr <- lift $ transformArgs ars
      modify (\envL -> over funs (Map.insert n (t, arsArr)) envL)
      modify (\envL -> over funOps (Map.insert n ops) envL)
      collectLocalVariables ars def True
checkFunDef c _ = lift $ throwIO $ IncorrectConstructorException (show c) "(FunDef)" "checkFunDef"

collectLocalVariables :: [Prgm] -> Prgm -> Bool -> StateT InEnv IO()
collectLocalVariables [] _ _ = return ()
collectLocalVariables ((VarLine (vs, t)) : []) (FunDef (Var n, _) _) isArgs
  | isArgs = checkArgs vs t n
  | otherwise = checkLocalVariables vs t n
collectLocalVariables ((VarLine (vs, t)) : ps) def@(FunDef (Var n, _) _) isArgs = do
  if isArgs
    then checkArgs vs t n
    else checkLocalVariables vs t n
  collectLocalVariables ps def isArgs
collectLocalVariables c _ _ = lift $ throwIO $ IncorrectConstructorException (show c) "[VarLine]" "collectLocalVariables"

collectFunsAndProcs :: [Prgm] -> StateT InEnv IO()
collectFunsAndProcs [] = return ()
collectFunsAndProcs ((Function def vb ops) : []) = do
  checkFunDef def ops
  forM_ vb (\(VarBlock vl) -> collectLocalVariables vl def False)
collectFunsAndProcs ((Function def vb ops) : fps) = do
  checkFunDef def ops
  forM_ vb (\(VarBlock vl) -> collectLocalVariables vl def False)
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
  lift $ putStrLn "\nProcess finished."
interpretPrgm c = lift $ throwIO $ IncorrectConstructorException (show c) "Program" "interpretPrgm"

-- | Function gets Token tree with parsed Pascal program
--   and evalutes it.
interpret :: Prgm -> IO()
interpret p = evalStateT (interpretPrgm p) dummyEnv