{
{-# LANGUAGE GADTs #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE RankNTypes #-}

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

Operator :: { forall expr. PascalExpr expr => expr Variable }
Operator:
  Assign                                                    { $1 }
  | ReadOps                                                 { $1 }
  | WriteOps                                                { $1 }
  | WhileCycle                                              { $1 }
  | IfOp                                                    { $1 }
  | FunApply                                                { $1 }

Assign :: { forall expr. PascalExpr expr => expr Variable }
Assign:
  variable ":=" Expr                                        { peAssign (peVar $1) $3 }

ReadOps :: { forall expr. PascalExpr expr => expr Variable }
ReadOps:
  "read" "(" Expr ")"                                       { peRead $3 }
  | "readln" "(" Expr ")"                                   { peReadln $3 }

WriteOps :: { forall expr. PascalExpr expr => expr Variable }
WriteOps:
  "write" "(" Expr ")"                                      { peWrite $3 }
  | "writeln" "(" Expr ")"                                  { peWriteln $3 }

WhileCycle :: { forall expr. PascalExpr expr => expr Variable }
WhileCycle:
  "while" ExprOrd "do" "begin" Operators "end"              { peWhile $2 $5 }
  | "while" ExprOrd "do" Operator                           { peWhile $2 [Operator $4] }
  | "while" BoolExpr "do" "begin" Operators "end"           { peWhile $2 $5 }
  | "while" BoolExpr "do" Operator                          { peWhile $2 [Operator $4] }

IfOp :: { forall expr. PascalExpr expr => expr Variable }
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

FunApply :: { forall expr. PascalExpr expr => expr Variable }
FunApply:
  variable "(" PassedArgs ")"                               { peProcApply (peVar $1) $3 False }
  | variable "(" ")"                                        { peProcApply (peVar $1) [] False }
  | variable                                                { peProcApply (peVar $1) [] True }

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
  BoolOrXor "or" BoolAnd                                    { peOr $1 $3 }
  | BoolOrXor "xor" BoolAnd                                 { peXor $1 $3 }
  | BoolAnd                                                 { $1 }

BoolAnd :: { forall expr. PascalExpr expr => expr Bool }
BoolAnd:
  BoolAnd "and" BoolUnary                                   { peAnd $1 $3 }
  | BoolUnary                                               { $1 }

BoolUnary :: { forall expr. PascalExpr expr => expr Bool }
BoolUnary:
  "not" BoolUnary                                           { peNot $2 }
  | BoolAtom                                                { $1 }

BoolAtom :: { forall expr. PascalExpr expr => expr Bool }
BoolAtom:
  bool                                                      { peBool $1 }
  | variable                                                { fmap getBool $ peVar $1 }
  | variable "(" PassedArgs ")"                             { fmap getBool $ peFunApply (peVar $1) $3 }
  | variable "(" ")"                                        { fmap getBool $ peFunApply (peVar $1) [] }
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
  | NumMulDivAnd "div" NumUnary                             { peDiv $1 $3 }
  | NumMulDivAnd "mod" NumUnary                             { peMod $1 $3 }
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
  | variable "(" PassedArgs ")"                             { fmap getNum $ peFunApply (peVar $1) $3 }
  | variable "(" ")"                                        { fmap getNum $ peFunApply (peVar $1) [] }
  | "(" NumExpr ")"                                         { peBr $2 }

StrExpr :: { forall expr. PascalExpr expr => expr String }
StrExpr:
  StrSum                                                    { $1 }

StrSum :: { forall expr. PascalExpr expr => expr String }
StrSum:
  StrSum "+" StrAtom                                        { peSum $1 $3 }
  | StrAtom                                                 { $1 }

StrAtom :: { forall expr. PascalExpr expr => expr String }
StrAtom:
  qstring                                                   { peStr $1 }
  | variable                                                { fmap getStr $ peVar $1 }
  | variable "(" PassedArgs ")"                             { fmap getStr $ peFunApply (peVar $1) $3 }
  | variable "(" ")"                                        { fmap getStr $ peFunApply (peVar $1) [] }
  | "(" StrExpr ")"                                         { peBr $2 }

PassedArgs :: { forall expr. PascalExpr expr => [expr Variable] }
PassedArgs:
  Expr "," PassedArgs                                       { $1 : $3 }
  | Expr                                                    { [$1] }

{
newtype Operator = Operator (forall expr. PascalExpr expr => expr Variable)

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
  deriving Show

data Variable =
  StrCons { getStr :: String }
  | NumCons { getNum :: Number }
  | BoolCons { getBool :: Bool }
  deriving Show

class Functor expr => PascalExpr expr where
  peAssign    :: expr t -> expr t -> expr Variable
  peRead      :: expr Variable -> expr Variable
  peReadln    :: expr Variable -> expr Variable
  peWrite     :: expr Variable -> expr Variable
  peWriteln   :: expr Variable -> expr Variable
  peWhile     :: expr Bool -> [Operator] -> expr Variable
  peIf        :: expr Bool -> [Operator] -> [Operator] -> expr Variable
  peProcApply :: expr Variable -> [expr Variable] -> Bool -> expr Variable
  peFunApply  :: expr Variable -> [expr Variable] -> expr Variable
  peLT        :: expr t -> expr t -> expr Bool
  peGT        :: expr t -> expr t -> expr Bool
  peLTE       :: expr t -> expr t -> expr Bool
  peGTE       :: expr t -> expr t -> expr Bool
  peEq        :: expr t -> expr t -> expr Bool
  peNotEq     :: expr t -> expr t -> expr Bool
  peSum       :: expr t -> expr t -> expr t
  peSub       :: expr t -> expr t -> expr t
  peOr        :: expr t -> expr t -> expr t
  peXor       :: expr t -> expr t -> expr t
  peMul       :: expr t -> expr t -> expr t
  peDivide    :: expr t -> expr t -> expr t
  peDiv       :: expr t -> expr t -> expr t
  peMod       :: expr t -> expr t -> expr t
  peAnd       :: expr t -> expr t -> expr t
  peNot       :: expr t -> expr t
  peNeg       :: expr t -> expr t
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
