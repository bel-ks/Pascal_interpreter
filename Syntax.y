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
  DefVarBlocks Functions "begin" Operators "end" "."          { Program $1 $2 $4 }
  | DefVarBlocks "begin" Operators "end" "."                  { Program $1 [] $3 }
  | Functions "begin" Operators "end" "."                     { Program [] $1 $3 }
  | DefVarBlocks Functions "begin" "end" "."                  { Program $1 $2 [] }
  | "begin" Operators "end" "."                               { Program [] [] $2 }
  | Functions "begin" "end" "."                               { Program [] $1 [] }
  | DefVarBlocks "begin" "end" "."                            { Program $1 [] [] }
  | "begin" "end" "."                                         { Program [] [] [] }
  |                                                           { Program [] [] [] }

DefVarBlocks :: { [Prgm] }
DefVarBlocks:
  "var" DefVarBlock DefVarBlocks                              { (VarBlock $2) : $3 }
  | "var" DefVarBlock                                         { [VarBlock $2] }

DefVarBlock :: { [Prgm] }
DefVarBlock:
  DefVar DefVarBlock                                          { (VarLine $1) : $2 }
  | DefVar                                                    { [VarLine $1] }

DefVar :: { ([Prgm], Prgm) }
DefVar:
  Variables ":" type ";"                                      { ($1, Type $3) }

Variables :: { [Prgm] }
Variables:
  variable "," Variables                                      { (Var $1) : $3 }
  | variable                                                  { [Var $1] }

Functions :: { [Prgm] }
Functions:
  Function Functions                                          { $1 : $2 }
  | Function                                                  { [$1] }

Function :: { Prgm }
Function:
  DefFunction ";" DefVarBlocks "begin" Operators "end" ";"    { Function $1 $3 $5 }
  | DefFunction ";" "begin" Operators "end" ";"               { Function $1 [] $4 }
  | DefFunction ";" DefVarBlocks "begin" "end" ";"            { Function $1 $3 [] }
  | DefFunction ";" "begin" "end" ";"                         { Function $1 [] [] }

DefFunction :: { ((Prgm, Prgm), [Prgm]) }
DefFunction:
  "function" variable "(" Arguments ")" ":" type              { ((Var $2, Type $7), $4) }
  | "function" variable "(" ")" ":" type                      { ((Var $2, Type $6), []) }
  | "procedure" variable "(" Arguments ")"                    { ((Var $2, Type ""), $4) }
  | "procedure" variable                                      { ((Var $2, Type ""), []) }

Arguments :: { [Prgm] }
Arguments:
  Argument ";" Arguments                                      { (FunArg $1) : $3 }
  | Argument                                                  { [FunArg $1] }

Argument :: { ([Prgm], Prgm) }
Argument:
  Variables ":" type                                          { ($1, Type $3) }

Operators :: { [Operator] }
Operators:
  Operator ";" Operators                                      { (Operator $1) : $3 }
  | Operator ";"                                              { [Operator $1] }

Operator :: { forall expr. PascalExpr expr => expr () }
Operator:
  variable ":=" Expression                                    { peAssign (peVar $1) $3 }
  | "read" "(" Expression ")"                                 { peRead $3 }
  | "readln" "(" Expression ")"                               { peReadln $3 }
  | "write" "(" Expression ")"                                { peWrite $3 }
  | "writeln" "(" Expression ")"                              { peWriteln $3 }
  | "while" Expression "do" "begin" Operators "end"           { peWhile $2 $5 }
  | "while" Expression "do" Operator                          { peWhile $2 [Operator $4] }
  | "if" Expression ThenPart ElsePart                         { peIf $2 $3 $4 }
  | "if" Expression ThenPart                                  { peIf $2 $3 [] }
  | variable "(" PassedArgs ")"                               { peFunApply (peVar $1) $3 }
  | variable                                                  { peFunApply (peVar $1) [] }

ThenPart :: { [Operator] }
ThenPart:
  "then" "begin" Operators "end"                              { $3 }
  | "then" Operator                                           { [Operator $2] }

ElsePart :: { [Operator] }
ElsePart:
  "else" "begin" Operators "end"                              { $3 }
  | "else" Operator                                           { [Operator $2] }

Expression :: { forall expr. PascalExpr expr => expr () }
Expression:
  Expression "<" SumSubOrXor                                  { peLT $1 $3 }
  | Expression ">" SumSubOrXor                                { peGT $1 $3 }
  | Expression "<=" SumSubOrXor                               { peLTE $1 $3 }
  | Expression ">=" SumSubOrXor                               { peGTE $1 $3 }
  | Expression "=" SumSubOrXor                                { peEq $1 $3 }
  | Expression "<>" SumSubOrXor                               { peNotEq $1 $3 }
  | SumSubOrXor                                               { $1 }

SumSubOrXor :: { forall expr. PascalExpr expr => expr () }
SumSubOrXor:
  SumSubOrXor "+" MulDivAnd                                   { peSum $1 $3 }
  | SumSubOrXor "-" MulDivAnd                                 { peSub $1 $3 }
  | SumSubOrXor "or" MulDivAnd                                { peOr $1 $3 }
  | SumSubOrXor "xor" MulDivAnd                               { peXor $1 $3 }
  | MulDivAnd                                                 { $1 }

MulDivAnd :: { forall expr. PascalExpr expr => expr () }
MulDivAnd:
  MulDivAnd "*" Unary                                         { peMul $1 $3 }
  | MulDivAnd "/" Unary                                       { peDivide $1 $3 }
  | MulDivAnd "div" Unary                                     { peDiv $1 $3 }
  | MulDivAnd "mod" Unary                                     { peMod $1 $3 }
  | MulDivAnd "and" Unary                                     { peAnd $1 $3 }
  | Unary                                                     { $1 }

Unary :: { forall expr. PascalExpr expr => expr () }
Unary:
  "not" Unary                                                 { peNot $2 }
  | "-" Unary                                                 { peNeg $2 }
  | "+" Unary                                                 { pePos $2 }
  | variable "(" PassedArgs ")"                               { peFunApply (peVar $1) $3 }
  | variable                                                  { peVar $1 }
  | real                                                      { peReal $1 }
  | int                                                       { peInt $1 }
  | qstring                                                   { peStr $1 }
  | bool                                                      { peBool $1 }
  | "(" Expression ")"                                        { peBr $2 }

PassedArgs :: { forall expr. PascalExpr expr => [expr ()] }
PassedArgs:
  Expression "," PassedArgs                                   { $1 : $3 }
  | Expression                                                { [$1] }
  |                                                           { [] }

{
newtype Operator = Operator (forall expr. PascalExpr expr => expr ())

data Prgm =
  Program [Prgm] [Prgm] [Operator]
  | VarBlock [Prgm]
  | VarLine ([Prgm], Prgm)
  | Function ((Prgm, Prgm), [Prgm]) [Prgm] [Operator]
  | FunArg ([Prgm], Prgm)
  | Var String
  | Type String

class PascalExpr expr where
  peAssign   :: expr () -> expr () -> expr ()
  peRead     :: expr t -> expr t
  peReadln   :: expr t -> expr t
  peWrite    :: expr t -> expr t
  peWriteln  :: expr t -> expr t
  peWhile    :: expr t -> [Operator] -> expr ()
  peIf       :: expr t -> [Operator] -> [Operator] -> expr ()
  peFunApply :: expr () -> [expr t] -> expr ()
  peLT       :: expr t -> expr t -> expr t
  peGT       :: expr t -> expr t -> expr t
  peLTE      :: expr t -> expr t -> expr t
  peGTE      :: expr t -> expr t -> expr t
  peEq       :: expr t -> expr t -> expr t
  peNotEq    :: expr t -> expr t -> expr t
  peSum      :: expr t -> expr t -> expr t
  peSub      :: expr t -> expr t -> expr t
  peOr       :: expr t -> expr t -> expr t
  peXor      :: expr t -> expr t -> expr t
  peMul      :: expr t -> expr t -> expr t
  peDivide   :: expr t -> expr t -> expr t
  peDiv      :: expr t -> expr t -> expr t
  peMod      :: expr t -> expr t -> expr t
  peAnd      :: expr t -> expr t -> expr t
  peNot      :: expr t -> expr t
  peNeg      :: expr t -> expr t
  pePos      :: expr t -> expr t
  peVar      :: String -> expr ()
  peReal     :: Float -> expr ()
  peInt      :: Integer -> expr ()
  peStr      :: String -> expr ()
  peBool     :: Bool -> expr ()
  peBr       :: expr t -> expr t

parseError :: [Token] -> e
parseError _ = error "Error while parsing"
}
