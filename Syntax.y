{
module Syntax where
import Lexer
}

%name parseProgram
%tokentype { Token }
%error { parseError }

%token
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
  qstring     { TStr $$ }

%%

Program:
  DefVars Functions "begin" Operators "end" "."               { Program $1 $2 $4 }
  |                                                           { Program [] [] [] }

DefVars:
  DefVar DefVars                                              { $1 : $2 }
  | DefVar                                                    { [$1] }
  |                                                           { [] }

DefVar:
  "var" DefVarLines                                           { $2 }

DefVarLines:
  DefVarLine DefVarLines                                      { $1 : $2 }
  | DefVarLine                                                { [$1] }

DefVarLine:
  Variables ":" type ";"                                      { ($1, Type $3) }

Variables:
  variable "," Variables                                      { (Var $1) : $3 }
  | variable                                                  { [Var $1] }

Functions:
  Function Functions                                          { $1 : $2 }
  | Function                                                  { [$1] }
  |                                                           { [] }

Function:
  DefFunction DefVars "begin" Operators "end" ";"             { Function $1 $2 $4 }

DefFunction:
  "function" variable "(" Arguements ")" ":" type ";"         { ((Var $2, Type $7), $4) }
  | "function" variable "(" ")" ":" type ";"                  { ((Var $2, Type $6), []) }
  | "procedure" variable "(" Arguements ")" ";"               { ((Var $2, Type ""), $4) }
  | "procedure" variable ";"                                  { ((Var $2, Type ""), []) }

Arguements:
  Arguement ";" Arguements                                    { $1 : $3 }
  | Arguement                                                 { [$1] }

Arguement:
  Variables ":" type                                          { ($1, Type $3) }

Operators:
  Operator ";" Operators                                      { (Operator $1) : $3 }
  | Operator ";"                                              { [Operator $1] }
  |                                                           { [] }

Operator:
  variable ":=" Expression                                    { Assign (Var $1) $3 }
  | "read" "(" Expression ")"                                 { Read $3 }
  | "readln" "(" Expression ")"                               { Readln $3 }
  | "write" "(" Expression ")"                                { Write $3 }
  | "writeln" "(" Expression ")"                              { Writeln $3 }
  | "while" Expression "do" "begin" Operators "end"           { While $2 $5 }
  | "while" Expression "do" Operator                          { While $2 [Operator $4] }
  | "if" Expression "then" "begin" Operators "end" ElsePart   { If $2 $5 $7 }
  | "if" Expression "then" Operator ElsePart                  { If $2 [Operator $4] $5 }
  | variable                                                  { Var $1 }

ElsePart:
  "else" "begin" Operators "end"                              { $3 }
  | "else" Operator                                           { [Operator $2] }
  |                                                           { [] }

Expression:
  Expression "<" SumSubOrXor                                 { LT_ $1 $3 }
  | Expression ">" SumSubOrXor                               { GT_ $1 $3 }
  | Expression "<=" SumSubOrXor                              { LTE_ $1 $3 }
  | Expression ">=" SumSubOrXor                              { GTE_ $1 $3 }
  | Expression "=" SumSubOrXor                               { Eq $1 $3 }
  | Expression "<>" SumSubOrXor                              { NotEq $1 $3 }
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
