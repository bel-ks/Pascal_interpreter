module MyExceptions where

import Control.Exception

type Var = String
type Type = String
type Name = String

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