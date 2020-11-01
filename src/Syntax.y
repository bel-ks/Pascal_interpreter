{
{-# LANGUAGE GADTs #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE DeriveAnyClass #-}

module Syntax where

import Lexer
}

%name parseProgram
%tokentype { Token }
%error { parseError }

%token
  qstring     { TStr $$ }
  bool        { TBool $$ }
  type        { TType $$ }
  "("         { TLeftParen }
  ")"         { TRightParen }
  ":"         { TColon }
  ";"         { TSemicolon }
  ","         { TComma }
  "."         { TDot }
  "var"       { TVar }
  "begin"     { TBegin }
  "end"       { TEnd }
  "function"  { TFunction }
  "readln"    { TReadln }
  "write"     { TWrite }
  "writeln"   { TWriteln }
  "while"     { TWhile }
  "do"        { TDo }
  "if"        { TIf }
  "then"      { TThen }
  "else"      { TElse }
  ":="        { TAssign }
  "+"         { TSum }
  "-"         { TSub }
  "*"         { TMul }
  "/"         { TDivide }
  "div"       { TDiv }
  "mod"       { TMod }
  "<"         { TLT }
  ">"         { TGT }
  "<="        { TLTE }
  ">="        { TGTE }
  "="         { TEq }
  "<>"        { TNotEq }
  "and"       { TAnd }
  "or"        { TOr }
  "not"       { TNot }
  "xor"       { TXor }
  variable    { TVariable $$ }
  real        { TRealNum $$ }
  int         { TIntNum $$ }

%right "if" "then" "else"

%%

Program :: { Prgm }
Program:
  DefVarBlocks Functions "begin" Operators "end" "."        { Program $1 $2 $4 }
  | DefVarBlocks "begin" Operators "end" "."                { Program $1 [] $3 }
  | Functions "begin" Operators "end" "."                   { Program [] $1 $3 }
  | DefVarBlocks Functions "begin" "end" "."                { Program $1 $2 [] }
  | "begin" Operators "end" "."                             { Program [] [] $2 }
  | Functions "begin" "end" "."                             { Program [] $1 [] }
  | DefVarBlocks "begin" "end" "."                          { Program $1 [] [] }
  | "begin" "end" "."                                       { Program [] [] [] }
  |                                                         { Program [] [] [] }

DefVarBlocks :: { [Prgm] }
DefVarBlocks:
  "var" DefVarBlock DefVarBlocks                            { (VarBlock $2) : $3 }
  | "var" DefVarBlock                                       { [VarBlock $2] }

DefVarBlock :: { [Prgm] }
DefVarBlock:
  DefVar DefVarBlock                                        { (VarLine $1) : $2 }
  | DefVar                                                  { [VarLine $1] }

DefVar :: { ([Prgm], Prgm) }
DefVar:
  Variables ":" type ";"                                    { ($1, Type $3) }
  | Variables ":" type                                      { ($1, Type $3) }

Variables :: { [Prgm] }
Variables:
  variable "," Variables                                    { (Var $1) : $3 }
  | variable                                                { [Var $1] }

Functions :: { [Prgm] }
Functions:
  Function Functions                                        { $1 : $2 }
  | Function                                                { [$1] }

Function :: { Prgm }
Function:
  DefFunction ";" DefVarBlocks "begin" Operators "end" ";"  { Function $1 $3 $5 }
  | DefFunction ";" "begin" Operators "end" ";"             { Function $1 [] $4 }
  | DefFunction ";" DefVarBlocks "begin" "end" ";"          { Function $1 $3 [] }
  | DefFunction ";" "begin" "end" ";"                       { Function $1 [] [] }

DefFunction :: { Prgm }
DefFunction:
  "function" variable "(" DefVarBlock ")" ":" type          { FunDef (Var $2, Type $7) $4 }
  | "function" variable "(" ")" ":" type                    { FunDef (Var $2, Type $6) [] }

Operators :: { [Operator] }
Operators:
  Operator ";" Operators                                    { (Operator $1) : $3 }
  | Operator ";"                                            { [Operator $1] }

Operator :: { forall expr. PascalExpr expr => expr () }
Operator:
  variable ":=" Expr                                        { peAssign (Var $1) $3 }
  | "readln" "(" variable ")"                               { peReadln $ Var $3 }
  | "write" "(" Expr ")"                                    { peWrite $3 }
  | "writeln" "(" Expr ")"                                  { peWriteln $3 }
  | "while" Expr "do" "begin" Operators "end"               { peWhile $2 $5 }
  | "while" Expr "do" Operator                              { peWhile $2 [Operator $4] }
  | "if" Expr ThenPart ElsePart                             { peIf $2 $3 $4 }
  | "if" Expr ThenPart                                      { peIf $2 $3 [] }

ThenPart :: { [Operator] }
ThenPart:
  "then" "begin" Operators "end"                            { $3 }
  | "then" Operator                                         { [Operator $2] }

ElsePart :: { [Operator] }
ElsePart:
  "else" "begin" Operators "end"                            { $3 }
  | "else" Operator                                         { [Operator $2] }

Expr :: { forall expr. PascalExpr expr => expr Variable }
Expr:
  ExprOrd                                                   { $1 }

ExprOrd :: { forall expr. PascalExpr expr => expr Variable }
ExprOrd:
  ExprOrd "<" SumSubOrXor                                   { peLT $1 $3 }
  | ExprOrd ">" SumSubOrXor                                 { peGT $1 $3 }
  | ExprOrd "<=" SumSubOrXor                                { peLTE $1 $3 }
  | ExprOrd ">=" SumSubOrXor                                { peGTE $1 $3 }
  | ExprOrd "=" SumSubOrXor                                 { peEq $1 $3 }
  | ExprOrd "<>" SumSubOrXor                                { peNotEq $1 $3 }
  | SumSubOrXor                                             { $1 }

SumSubOrXor :: { forall expr. PascalExpr expr => expr Variable }
SumSubOrXor:
  SumSubOrXor "+" MulDivAnd                                 { peSum $1 $3 }
  | SumSubOrXor "-" MulDivAnd                               { peSub $1 $3 }
  | SumSubOrXor "or" MulDivAnd                              { peOr $1 $3 }
  | SumSubOrXor "xor" MulDivAnd                             { peXor $1 $3 }
  | MulDivAnd                                               { $1 }

MulDivAnd :: { forall expr. PascalExpr expr => expr Variable }
MulDivAnd:
  MulDivAnd "*" Unary                                       { peMul $1 $3 }
  | MulDivAnd "/" Unary                                     { peDivide $1 $3 }
  | MulDivAnd "div" Unary                                   { peDiv $1 $3 }
  | MulDivAnd "mod" Unary                                   { peMod $1 $3 }
  | MulDivAnd "and" Unary                                   { peAnd $1 $3 }
  | Unary                                                   { $1 }

Unary :: { forall expr. PascalExpr expr => expr Variable }
Unary:
  "not" Unary                                               { peNot $2 }
  | "-" Unary                                               { peNeg $2 }
  | "+" Unary                                               { pePos $2 }
  | Atom                                                    { $1 }

Atom :: { forall expr. PascalExpr expr => expr Variable }
Atom:
  real                                                      { peReal $1 }
  | int                                                     { peInt $1 }
  | qstring                                                 { peStr $1 }
  | bool                                                    { peBool $1 }
  | variable "(" Expr "," Expr ")"                          { peFunApply (Var $1) [$3, $5] }
  | variable "(" Expr ")"                                   { peFunApply (Var $1) [$3] }
  | variable "(" ")"                                        { peFunApply (Var $1) [] }
  | variable                                                { peVar $1 }
  | "(" Expr ")"                                            { peBr $2 }

{
newtype Operator = Operator (forall expr. PascalExpr expr => expr ())

data Prgm =
  Program [Prgm] [Prgm] [Operator]
  | VarBlock [Prgm]
  | VarLine ([Prgm], Prgm)
  | Function Prgm [Prgm] [Operator]
  | FunDef (Prgm, Prgm) [Prgm]
  | Var String
  | Type String

data Number =
  IntCons { getInt :: Integer }
  | FloatCons { getFloat :: Float }
  deriving (Show, Fractional)

instance Eq Number where
  (IntCons a) == (IntCons b) = a == b
  (IntCons a) == (FloatCons b) = ((fromInteger a) :: Float) == b
  (FloatCons a) == (IntCons b) = a == ((fromInteger b) :: Float)
  (FloatCons a) == (FloatCons b) = a == b

instance Ord Number where
  (IntCons a) < (IntCons b) = a < b
  (IntCons a) < (FloatCons b) = ((fromInteger a) :: Float) < b
  (FloatCons a) < (IntCons b) = a < ((fromInteger b) :: Float)
  (FloatCons a) < (FloatCons b) = a < b
  (IntCons a) > (IntCons b) = a > b
  (IntCons a) > (FloatCons b) = ((fromInteger a) :: Float) > b
  (FloatCons a) > (IntCons b) = a > ((fromInteger b) :: Float)
  (FloatCons a) > (FloatCons b) = a > b
  (IntCons a) <= (IntCons b) = a <= b
  (IntCons a) <= (FloatCons b) = ((fromInteger a) :: Float) <= b
  (FloatCons a) <= (IntCons b) = a <= ((fromInteger b) :: Float)
  (FloatCons a) <= (FloatCons b) = a <= b
  (IntCons a) >= (IntCons b) = a >= b
  (IntCons a) >= (FloatCons b) = ((fromInteger a) :: Float) >= b
  (FloatCons a) >= (IntCons b) = a >= ((fromInteger b) :: Float)
  (FloatCons a) >= (FloatCons b) = a >= b

instance Num Number where
  (IntCons a) + (IntCons b) = IntCons (a + b)
  (IntCons a) + (FloatCons b) = FloatCons (((fromInteger a) :: Float) + b)
  (FloatCons a) + (IntCons b) = FloatCons (a + ((fromInteger b) :: Float))
  (FloatCons a) + (FloatCons b) = FloatCons (a + b)
  (IntCons a) * (IntCons b) = IntCons (a * b)
  (IntCons a) * (FloatCons b) = FloatCons (((fromInteger a) :: Float) * b)
  (FloatCons a) * (IntCons b) = FloatCons (a * ((fromInteger b) :: Float))
  (FloatCons a) * (FloatCons b) = FloatCons (a * b)
  abs (IntCons a) = IntCons (abs a)
  abs (FloatCons a) = FloatCons (abs a)
  signum (IntCons a) = IntCons (signum a)
  signum (FloatCons a) = FloatCons (signum a)
  negate (IntCons a) = IntCons (negate a)
  negate (FloatCons a) = FloatCons (negate a)

data Variable =
  StrCons { getStr :: String }
  | NumCons { getNum :: Number }
  | BoolCons { getBool :: Bool }
  deriving Show

class Functor expr => PascalExpr expr where
  peAssign    :: Prgm -> expr Variable -> expr ()
  peReadln    :: Prgm -> expr ()
  peWrite     :: expr Variable -> expr ()
  peWriteln   :: expr Variable -> expr ()
  peWhile     :: expr Variable -> [Operator] -> expr ()
  peIf        :: expr Variable -> [Operator] -> [Operator] -> expr ()
  peFunApply  :: Prgm -> [expr Variable] -> expr Variable
  peLT        :: expr Variable -> expr Variable -> expr Variable
  peGT        :: expr Variable -> expr Variable -> expr Variable
  peLTE       :: expr Variable -> expr Variable -> expr Variable
  peGTE       :: expr Variable -> expr Variable -> expr Variable
  peEq        :: expr Variable -> expr Variable -> expr Variable
  peNotEq     :: expr Variable -> expr Variable -> expr Variable
  peSum       :: expr Variable -> expr Variable -> expr Variable
  peSub       :: expr Variable -> expr Variable -> expr Variable
  peOr        :: expr Variable -> expr Variable -> expr Variable
  peXor       :: expr Variable -> expr Variable -> expr Variable
  peMul       :: expr Variable -> expr Variable -> expr Variable
  peDivide    :: expr Variable -> expr Variable -> expr Variable
  peDiv       :: expr Variable -> expr Variable -> expr Variable
  peMod       :: expr Variable -> expr Variable -> expr Variable
  peAnd       :: expr Variable -> expr Variable -> expr Variable
  peNot       :: expr Variable -> expr Variable
  peNeg       :: expr Variable -> expr Variable
  pePos       :: expr Variable -> expr Variable
  peVar       :: String -> expr Variable
  peReal      :: Float -> expr Variable
  peInt       :: Integer -> expr Variable
  peStr       :: String -> expr Variable
  peBool      :: Bool -> expr Variable
  peBr        :: expr t -> expr t

parseError :: [Token] -> e
parseError _ = error "Error while parsing"
}
