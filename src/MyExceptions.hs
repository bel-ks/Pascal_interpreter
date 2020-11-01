module MyExceptions
  ( AlreadyUsedVarException (..)
  , AlreadyUsedLocalVarException (..)
  , AlreadyUsedFunctionNameException (..)
  , ArgumentsException (..)
  , DifferentTypesException (..)
  , IncorrectConstructorException (..)
  , Name
  , NotBoolTypeException (..)
  , NoSuchVarException (..)
  , NoSuchTypeException (..)
  , NoSuchFunException (..)
  , Type
  , UndefinedActionException (..)
  , Var
  ) where

import Control.Exception
  ( Exception (..)
  )

type Var = String
type Type = String
type Name = String
type Expected = String
type Actual = String
type Place = String

-- | Exception type.
--   Is thrown when you choose action not from initial list.
data UndefinedActionException = UndefinedActionException

instance Exception UndefinedActionException

instance Show UndefinedActionException where
  show _ = "UndefinedActionException: Choose one of defined actions."

-- | Exception type.
--   Is thrown when there are not comparable or evaluatable types.
data DifferentTypesException = DifferentTypesException

instance Exception DifferentTypesException

instance Show DifferentTypesException where
  show _ = "DifferentTypesException: Expressions should have same types."

-- | Exception type.
--   Is thrown when there expression type is not bool.
data NotBoolTypeException = NotBoolTypeException

instance Exception NotBoolTypeException

instance Show NotBoolTypeException where
  show _ = "NotBoolTypeException: Expression should have bool type."

-- | Exception type. Gets expected constructor, actual constructor
--   and place where this exception was thrown.
--   Is thrown when constructor does not match with expected.
data IncorrectConstructorException =
  IncorrectConstructorException Expected Actual Place

instance Exception IncorrectConstructorException

instance Show IncorrectConstructorException where
  show (IncorrectConstructorException e a p) =
    "IncorrectConstructorException: expected conctructor \""
    ++ e ++ "\" instead of \"" ++ a ++ "\" in \""
    ++ p ++ "\" function."

-- | Exception type. Gets var name and type of var.
--   Is thrown when variable is already used with type.
data AlreadyUsedVarException =
  AlreadyUsedVarException Var Type

instance Exception AlreadyUsedVarException

instance Show AlreadyUsedVarException where
  show (AlreadyUsedVarException v t) =
    "AlreadyUsedVarException: Variable \"" ++ v
    ++ "\" is already used with type " ++ t ++ "."

-- | Exception type. Gets var name.
--   Is thrown when variable from function is already
--   used in global or in this function.
data AlreadyUsedLocalVarException =
  AlreadyUsedLocalVarException Var

instance Exception AlreadyUsedLocalVarException

instance Show AlreadyUsedLocalVarException where
  show (AlreadyUsedLocalVarException v) =
    "AlreadyUsedLocalVarException: Variable name \"" ++ v
    ++ "\" is already used."

-- | Exception type. Gets function name.
--   Is thrown when function name is already
--   used by variable or by another function.
data AlreadyUsedFunctionNameException =
  AlreadyUsedFunctionNameException Name

instance Exception AlreadyUsedFunctionNameException

instance Show AlreadyUsedFunctionNameException where
  show (AlreadyUsedFunctionNameException n) =
    "AlreadyUsedFunctionNameException: Function name \"" ++ n
    ++ "\" is already used."

-- | Exception type. Gets var name.
--   Is thrown when variable does not exist.
data NoSuchVarException =
  NoSuchVarException Var

instance Exception NoSuchVarException

instance Show NoSuchVarException where
  show (NoSuchVarException v) =
    "NoSuchVarException: There is no variable \"" ++ v
    ++ "\" in program."

-- | Exception type. Gets function name.
--   Is thrown when function does not exist.
data NoSuchFunException =
  NoSuchFunException Name

instance Exception NoSuchFunException

instance Show NoSuchFunException where
  show (NoSuchFunException n) =
    "NoSuchFunException: There is no function \"" ++ n
    ++ "\" in program."

-- | Exception type. Gets function name.
--   Is thrown when there is something wrong with
--   arguments passed to function.
data ArgumentsException =
  ArgumentsException Name

instance Exception ArgumentsException

instance Show ArgumentsException where
  show (ArgumentsException n) =
    "ArgumentsException: There is not enough or "
    ++ "too much arguments in function \"" ++ n ++ "\"."

-- | Exception type. Gets type name.
--   Is thrown when unknown type was used.
data NoSuchTypeException =
  NoSuchTypeException Type

instance Exception NoSuchTypeException

instance Show NoSuchTypeException where
  show (NoSuchTypeException t) =
    "NoSuchTypeException: Unknown type \"" ++ t
    ++ "\"."