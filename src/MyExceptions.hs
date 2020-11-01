module MyExceptions where

import Control.Exception

type Var = String
type Type = String
type Name = String
type Expected = String
type Actual = String
type Place = String

data UndefinedActionException = UndefinedActionException

instance Exception UndefinedActionException

instance Show UndefinedActionException where
  show _ = "UndefinedActionException: Choose one of defined actions."

data DifferentTypesException = DifferentTypesException

instance Exception DifferentTypesException

instance Show DifferentTypesException where
  show _ = "DifferentTypesException: Expressions should have same types."

data NotBoolTypeException = NotBoolTypeException

instance Exception NotBoolTypeException

instance Show NotBoolTypeException where
  show _ = "NotBoolTypeException: Expression should have bool type."

data IncorrectConstructorException =
  IncorrectConstructorException Expected Actual Place

instance Exception IncorrectConstructorException

instance Show IncorrectConstructorException where
  show (IncorrectConstructorException e a p) =
    "IncorrectConstructorException: expected conctructor \""
    ++ e ++ "\" instead of \"" ++ a ++ "\" in \""
    ++ p ++ "\" function."

data AlreadyUsedVarException =
  AlreadyUsedVarException Var Type

instance Exception AlreadyUsedVarException

instance Show AlreadyUsedVarException where
  show (AlreadyUsedVarException v t) =
    "AlreadyUsedVarException: Variable \"" ++ v
    ++ "\" is already used with type " ++ t ++ "."

data AlreadyUsedLocalVarException =
  AlreadyUsedLocalVarException Var

instance Exception AlreadyUsedLocalVarException

instance Show AlreadyUsedLocalVarException where
  show (AlreadyUsedLocalVarException v) =
    "AlreadyUsedLocalVarException: Variable name \"" ++ v
    ++ "\" is already used."

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

data NoSuchFunException =
  NoSuchFunException Name

instance Exception NoSuchFunException

instance Show NoSuchFunException where
  show (NoSuchFunException n) =
    "NoSuchFunException: There is no function or procedure \"" ++ n
    ++ "\" in program."

data ArgumentsException =
  ArgumentsException Name

instance Exception ArgumentsException

instance Show ArgumentsException where
  show (ArgumentsException n) =
    "ArgumentsException: There is not enough or "
    ++ "too much arguments in function or procedure \"" ++ n ++ "\"."