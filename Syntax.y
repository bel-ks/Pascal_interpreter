{
{-# LANGUAGE GADTs #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE DeriveAnyClass #-}

module Syntax where

import Data.Bits
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
  "procedure" { TProcedure }
  "read"      { TRead }
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
  "function" variable "(" Arguments ")" ":" type            { FunDef (Var $2, Type $7) $4 }
  | "function" variable "(" ")" ":" type                    { FunDef (Var $2, Type $6) [] }
  | "procedure" variable "(" Arguments ")"                  { FunDef (Var $2, Type "") $4 }
  | "procedure" variable                                    { FunDef (Var $2, Type "") [] }

Arguments :: { [Prgm] }
Arguments:
  Argument ";" Arguments                                    { (FunArg $1) : $3 }
  | Argument                                                { [FunArg $1] }

Argument :: { ([Prgm], Prgm) }
Argument:
  Variables ":" type                                        { ($1, Type $3) }

Operators :: { [Operator] }
Operators:
  Operator ";" Operators                                    { (Operator $1) : $3 }
  | Operator ";"                                            { [Operator $1] }

Operator :: { forall expr. PascalExpr expr => expr () }
Operator:
  Assign                                                    { $1 }
  | ReadOps                                                 { $1 }
  | WriteOps                                                { $1 }
  | WhileCycle                                              { $1 }
  | IfOp                                                    { $1 }
  | FunApply                                                { $1 }

Assign :: { forall expr. PascalExpr expr => expr () }
Assign:
  variable ":=" Expr                                        { peAssign (Var $1) $3 }

ReadOps :: { forall expr. PascalExpr expr => expr () }
ReadOps:
  "read" "(" Expr ")"                                       { peRead $3 }
  | "readln" "(" Expr ")"                                   { peReadln $3 }

WriteOps :: { forall expr. PascalExpr expr => expr () }
WriteOps:
  "write" "(" Expr ")"                                      { peWrite $3 }
  | "writeln" "(" Expr ")"                                  { peWriteln $3 }

WhileCycle :: { forall expr. PascalExpr expr => expr () }
WhileCycle:
  "while" ExprOrd "do" "begin" Operators "end"              { peWhile $2 $5 }
  | "while" ExprOrd "do" Operator                           { peWhile $2 [Operator $4] }
  | "while" BoolExpr "do" "begin" Operators "end"           { peWhile $2 $5 }
  | "while" BoolExpr "do" Operator                          { peWhile $2 [Operator $4] }

IfOp :: { forall expr. PascalExpr expr => expr () }
IfOp:
  "if" ExprOrd ThenPart ElsePart                            { peIf $2 $3 $4 }
  | "if" ExprOrd ThenPart                                   { peIf $2 $3 [] }
  | "if" BoolExpr ThenPart ElsePart                         { peIf $2 $3 $4 }
  | "if" BoolExpr ThenPart                                  { peIf $2 $3 [] }

ThenPart :: { [Operator] }
ThenPart:
  "then" "begin" Operators "end"                            { $3 }
  | "then" Operator                                         { [Operator $2] }

ElsePart :: { [Operator] }
ElsePart:
  "else" "begin" Operators "end"                            { $3 }
  | "else" Operator                                         { [Operator $2] }

FunApply :: { forall expr. PascalExpr expr => expr () }
FunApply:
  variable "(" PassedArgs ")"                               { peProcApply (Var $1) $3 False }
  | variable "(" ")"                                        { peProcApply (Var $1) [] False }
  | variable                                                { peProcApply (Var $1) [] True }

Expr :: { forall expr. PascalExpr expr => expr Variable }
Expr:
  ExprOrd                                                   { fmap BoolCons $1 }
  | BoolExpr                                                { fmap BoolCons $1 }
  | NumExpr                                                 { fmap NumCons $1 }
  | StrExpr                                                 { fmap StrCons $1 }

ExprOrd :: { forall expr. PascalExpr expr => expr Bool }
ExprOrd:
  BoolOrd                                                   { $1 }
  | NumOrd                                                  { $1 }
  | StrOrd                                                  { $1 }

BoolOrd :: { forall expr. PascalExpr expr => expr Bool }
BoolOrd:
  BoolExpr "<" BoolExpr                                     { peLT $1 $3 }
  | BoolExpr ">" BoolExpr                                   { peGT $1 $3 }
  | BoolExpr "<=" BoolExpr                                  { peLTE $1 $3 }
  | BoolExpr ">=" BoolExpr                                  { peGTE $1 $3 }
  | BoolExpr "=" BoolExpr                                   { peEq $1 $3 }
  | BoolExpr "<>" BoolExpr                                  { peNotEq $1 $3 }

NumOrd :: { forall expr. PascalExpr expr => expr Bool }
NumOrd:
  NumExpr "<" NumExpr                                       { peLT $1 $3 }
  | NumExpr ">" NumExpr                                     { peGT $1 $3 }
  | NumExpr "<=" NumExpr                                    { peLTE $1 $3 }
  | NumExpr ">=" NumExpr                                    { peGTE $1 $3 }
  | NumExpr "=" NumExpr                                     { peEq $1 $3 }
  | NumExpr "<>" NumExpr                                    { peNotEq $1 $3 }

StrOrd :: { forall expr. PascalExpr expr => expr Bool }
StrOrd:
  StrExpr "<" StrExpr                                       { peLT $1 $3 }
  | StrExpr ">" StrExpr                                     { peGT $1 $3 }
  | StrExpr "<=" StrExpr                                    { peLTE $1 $3 }
  | StrExpr ">=" StrExpr                                    { peGTE $1 $3 }
  | StrExpr "=" StrExpr                                     { peEq $1 $3 }
  | StrExpr "<>" StrExpr                                    { peNotEq $1 $3 }

BoolExpr :: { forall expr. PascalExpr expr => expr Bool }
BoolExpr:
  BoolOrXor                                                 { $1 }

BoolOrXor :: { forall expr. PascalExpr expr => expr Bool }
BoolOrXor:
  BoolOrXor "or" BoolAnd                                    { peBOr $1 $3 }
  | BoolOrXor "xor" BoolAnd                                 { peBXor $1 $3 }
  | BoolAnd                                                 { $1 }

BoolAnd :: { forall expr. PascalExpr expr => expr Bool }
BoolAnd:
  BoolAnd "and" BoolUnary                                   { peBAnd $1 $3 }
  | BoolUnary                                               { $1 }

BoolUnary :: { forall expr. PascalExpr expr => expr Bool }
BoolUnary:
  "not" BoolUnary                                           { peBNot $2 }
  | BoolAtom                                                { $1 }

BoolAtom :: { forall expr. PascalExpr expr => expr Bool }
BoolAtom:
  bool                                                      { peBool $1 }
  | variable                                                { fmap getBool $ peVar $1 }
  | variable "(" PassedArgs ")"                             { fmap getBool $ peFunApply (Var $1) $3 }
  | variable "(" ")"                                        { fmap getBool $ peFunApply (Var $1) [] }
  | "(" ExprOrd ")"                                         { peBr $2 }
  | "(" BoolExpr ")"                                        { peBr $2 }

NumExpr :: { forall expr. PascalExpr expr => expr Number }
NumExpr:
  NumSumSubOrXor                                            { $1 }

NumSumSubOrXor :: { forall expr. PascalExpr expr => expr Number }
NumSumSubOrXor:
  NumSumSubOrXor "+" NumMulDivAnd                           { peSum $1 $3 }
  | NumSumSubOrXor "-" NumMulDivAnd                         { peSub $1 $3 }
  | NumSumSubOrXor "or" NumMulDivAnd                        { peOr $1 $3 }
  | NumSumSubOrXor "xor" NumMulDivAnd                       { peXor $1 $3 }
  | NumMulDivAnd                                            { $1 }

NumMulDivAnd :: { forall expr. PascalExpr expr => expr Number }
NumMulDivAnd:
  NumMulDivAnd "*" NumUnary                                 { peMul $1 $3 }
  | NumMulDivAnd "/" NumUnary                               { peDivide $1 $3 }
  | NumMulDivAnd "div" NumUnary                             { peDiv (fmap getInt $1) (fmap getInt $3) }
  | NumMulDivAnd "mod" NumUnary                             { peMod (fmap getInt $1) (fmap getInt $3) }
  | NumMulDivAnd "and" NumUnary                             { peAnd $1 $3 }
  | NumUnary                                                { $1 }

NumUnary :: { forall expr. PascalExpr expr => expr Number }
NumUnary:
  "not" NumUnary                                            { peNot $2 }
  | "-" NumUnary                                            { peNeg $2 }
  | "+" NumUnary                                            { pePos $2 }
  | NumAtom                                                 { $1 }

NumAtom :: { forall expr. PascalExpr expr => expr Number }
NumAtom:
  real                                                      { peReal $1 }
  | int                                                     { peInt $1 }
  | variable                                                { fmap getNum $ peVar $1 }
  | variable "(" PassedArgs ")"                             { fmap getNum $ peFunApply (Var $1) $3 }
  | variable "(" ")"                                        { fmap getNum $ peFunApply (Var $1) [] }
  | "(" NumExpr ")"                                         { peBr $2 }

StrExpr :: { forall expr. PascalExpr expr => expr String }
StrExpr:
  StrSum                                                    { $1 }

StrSum :: { forall expr. PascalExpr expr => expr String }
StrSum:
  StrSum "+" StrAtom                                        { peStrSum $1 $3 }
  | StrAtom                                                 { $1 }

StrAtom :: { forall expr. PascalExpr expr => expr String }
StrAtom:
  qstring                                                   { peStr $1 }
  | variable                                                { fmap getStr $ peVar $1 }
  | variable "(" PassedArgs ")"                             { fmap getStr $ peFunApply (Var $1) $3 }
  | variable "(" ")"                                        { fmap getStr $ peFunApply (Var $1) [] }
  | "(" StrExpr ")"                                         { peBr $2 }

PassedArgs :: { forall expr. PascalExpr expr => [expr Variable] }
PassedArgs:
  Expr "," PassedArgs                                       { $1 : $3 }
  | Expr                                                    { [$1] }

{
newtype Operator = Operator (forall expr. PascalExpr expr => expr ())

data Prgm =
  Program [Prgm] [Prgm] [Operator]
  | VarBlock [Prgm]
  | VarLine ([Prgm], Prgm)
  | Function Prgm [Prgm] [Operator]
  | FunDef (Prgm, Prgm) [Prgm]
  | FunArg ([Prgm], Prgm)
  | Var String
  | Type String

data Number =
  IntCons { getInt :: Integer }
  | FloatCons { getFloat :: Float }
  deriving (Show, Eq, Ord, Num, Bits, Fractional)

data Variable =
  StrCons { getStr :: String }
  | NumCons { getNum :: Number }
  | BoolCons { getBool :: Bool }
  deriving Show

class Functor expr => PascalExpr expr where
  peAssign    :: Prgm -> expr Variable -> expr ()
  peRead      :: expr Variable -> expr ()
  peReadln    :: expr Variable -> expr ()
  peWrite     :: expr Variable -> expr ()
  peWriteln   :: expr Variable -> expr ()
  peWhile     :: expr Bool -> [Operator] -> expr ()
  peIf        :: expr Bool -> [Operator] -> [Operator] -> expr ()
  peProcApply :: Prgm -> [expr Variable] -> Bool -> expr ()
  peFunApply  :: Prgm -> [expr Variable] -> expr Variable
  peLT        :: Ord t => expr t -> expr t -> expr Bool
  peGT        :: Ord t => expr t -> expr t -> expr Bool
  peLTE       :: Ord t => expr t -> expr t -> expr Bool
  peGTE       :: Ord t => expr t -> expr t -> expr Bool
  peEq        :: Ord t => expr t -> expr t -> expr Bool
  peNotEq     :: Ord t => expr t -> expr t -> expr Bool
  peStrSum    :: expr String -> expr String -> expr String
  peSum       :: Num t => expr t -> expr t -> expr t
  peSub       :: Num t => expr t -> expr t -> expr t
  peBOr       :: expr Bool -> expr Bool -> expr Bool
  peOr        :: expr Number -> expr Number -> expr Number
  peBXor      :: expr Bool -> expr Bool -> expr Bool
  peXor       :: expr Number -> expr Number -> expr Number
  peMul       :: Num t => expr t -> expr t -> expr t
  peDivide    :: Fractional t => expr t -> expr t -> expr t
  peDiv       :: expr Integer -> expr Integer -> expr Number
  peMod       :: expr Integer -> expr Integer -> expr Number
  peBAnd      :: expr Bool -> expr Bool -> expr Bool
  peAnd       :: expr Number -> expr Number -> expr Number
  peBNot      :: expr Bool -> expr Bool
  peNot       :: expr Number -> expr Number
  peNeg       :: Num t => expr t -> expr t
  pePos       :: expr t -> expr t
  peVar       :: String -> expr Variable
  peReal      :: Float -> expr Number
  peInt       :: Integer -> expr Number
  peStr       :: String -> expr String
  peBool      :: Bool -> expr Bool
  peBr        :: expr t -> expr t

parseError :: [Token] -> e
parseError _ = error "Error while parsing"
}
