{
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
  number      { TNumber $$ }

%right "if" "then" "else"

%%

Program:
  DefVars Functions "begin" Operators "end" "."               { Program $1 $2 $4 }
  | DefVars "begin" Operators "end" "."                       { Program $1 [] $3 }
  | Functions "begin" Operators "end" "."                     { Program [] $1 $3 }
  | DefVars Functions "begin" "end" "."                       { Program $1 $2 [] }
  | "begin" Operators "end" "."                               { Program [] [] $2 }
  | Functions "begin" "end" "."                               { Program [] $1 [] }
  | DefVars "begin" "end" "."                                 { Program $1 [] [] }
  | "begin" "end" "."                                         { Program [] [] [] }
  |                                                           { Program [] [] [] }

DefVars:
  "var" DefVar DefVars                                        { $2 : $3 }
  | "var" DefVar                                              { [$2] }

DefVar:
  DefVarBlock DefVar                                          { $1 : $2 }
  | DefVarBlock                                               { [$1] }

DefVarBlock:
  Variables ":" type ";"                                      { ($1, Type $3) }

Variables:
  variable "," Variables                                      { (Var $1) : $3 }
  | variable                                                  { [Var $1] }

Functions:
  Function Functions                                          { $1 : $2 }
  | Function                                                  { [$1] }

Function:
  DefFunction ";" DefVars "begin" Operators "end" ";"         { Function $1 $3 $5 }
  | DefFunction ";" "begin" Operators "end" ";"               { Function $1 [] $4 }
  | DefFunction ";" DefVars "begin" "end" ";"                 { Function $1 $3 [] }
  | DefFunction ";" "begin" "end" ";"                         { Function $1 [] [] }

DefFunction:
  "function" variable "(" Arguments ")" ":" type              { ((Var $2, Type $7), $4) }
  | "function" variable "(" ")" ":" type                      { ((Var $2, Type $6), []) }
  | "procedure" variable "(" Arguments ")"                    { ((Var $2, Type ""), $4) }
  | "procedure" variable                                      { ((Var $2, Type ""), []) }

Arguments:
  Argument ";" Arguments                                      { $1 : $3 }
  | Argument                                                  { [$1] }

Argument:
  Variables ":" type                                          { ($1, Type $3) }

Operators:
  Operator ";" Operators                                      { (Operator $1) : $3 }
  | Operator ";"                                              { [Operator $1] }

Operator:
  variable ":=" Expression                                    { Assign (Var $1) $3 }
  | "read" "(" Expression ")"                                 { Read $3 }
  | "readln" "(" Expression ")"                               { Readln $3 }
  | "write" "(" Expression ")"                                { Write $3 }
  | "writeln" "(" Expression ")"                              { Writeln $3 }
  | "while" Expression "do" "begin" Operators "end"           { While $2 $5 }
  | "while" Expression "do" Operator                          { While $2 [Operator $4] }
  | "if" Expression ThenPart ElsePart                         { If $2 $3 $4 }
  | "if" Expression ThenPart                                  { If $2 $3 [] }
  | variable                                                  { Var $1 }

ThenPart:
  "then" "begin" Operators "end"                              { $3 }
  | "then" Operator                                           { [Operator $2] }

ElsePart:
  "else" "begin" Operators "end"                              { $3 }
  | "else" Operator                                           { [Operator $2] }

Expression:
  Expression "<" SumSubOrXor                                  { LT_ $1 $3 }
  | Expression ">" SumSubOrXor                                { GT_ $1 $3 }
  | Expression "<=" SumSubOrXor                               { LTE_ $1 $3 }
  | Expression ">=" SumSubOrXor                               { GTE_ $1 $3 }
  | Expression "=" SumSubOrXor                                { Eq $1 $3 }
  | Expression "<>" SumSubOrXor                               { NotEq $1 $3 }
  | SumSubOrXor                                               { $1 }

SumSubOrXor:
  SumSubOrXor "+" MulDivAnd                                   { Sum $1 $3 }
  | SumSubOrXor "-" MulDivAnd                                 { Sub $1 $3 }
  | SumSubOrXor "or" MulDivAnd                                { Or $1 $3 }
  | SumSubOrXor "xor" MulDivAnd                               { Xor $1 $3 }
  | MulDivAnd                                                 { $1 }

MulDivAnd:
  MulDivAnd "*" Unary                                         { Mul $1 $3 }
  | MulDivAnd "/" Unary                                       { Divide $1 $3 }
  | MulDivAnd "div" Unary                                     { Div $1 $3 }
  | MulDivAnd "mod" Unary                                     { Mod $1 $3 }
  | MulDivAnd "and" Unary                                     { And $1 $3 }
  | Unary                                                     { $1 }

Unary:
  "not" Unary                                                 { Not $2 }
  | "-" Unary                                                 { Neg $2 }
  | "+" Unary                                                 { Pos $2 }
  | variable "(" PassedArgs ")"                               { Fun (Var $1) $3 }
  | variable                                                  { Var $1 }
  | number                                                    { Num $1 }
  | qstring                                                   { Str $1 }
  | bool                                                      { Bool $1 }
  | "(" Expression ")"                                        { $2 }

PassedArgs:
  Expression "," PassedArgs                                   { $1 : $3 }
  | Expression                                                { [$1] }
  |                                                           { [] }

{
parseError :: [Token] -> e
parseError _ = error "Error while parsing"

data Prgm =
  Program [[([Prgm], Prgm)]] [Prgm] [Prgm] |
  Var String |
  Type String |
  Function ((Prgm, Prgm), [([Prgm], Prgm)]) [[([Prgm], Prgm)]] [Prgm] |
  Operator Prgm |
  Assign Prgm Prgm |
  Read Prgm |
  Readln Prgm |
  Write Prgm |
  Writeln Prgm |
  While Prgm [Prgm] |
  If Prgm [Prgm] [Prgm] |
  LT_ Prgm Prgm |
  GT_ Prgm Prgm |
  LTE_ Prgm Prgm |
  GTE_ Prgm Prgm |
  Eq Prgm Prgm |
  NotEq Prgm Prgm |
  Sum Prgm Prgm |
  Sub Prgm Prgm |
  Or Prgm Prgm |
  Xor Prgm Prgm |
  Mul Prgm Prgm |
  Divide Prgm Prgm |
  Div Prgm Prgm |
  Mod Prgm Prgm |
  And Prgm Prgm |
  Not Prgm |
  Neg Prgm |
  Pos Prgm |
  Fun Prgm [Prgm] |
  Num String |
  Str String |
  Bool String
  deriving Show
}
