{
module Lexer where
}

%wrapper "basic"

$alpha = [A-Za-z]
$digit = [0-9]

tokens :-
  \" [^\"]* \"                              { \str -> TStr str }
  "True" | "False"                          { \str -> TBool str }
  "integer" | "real" | "boolean" | "string" { \str -> TType str }
  "("                                       { \str -> TLeftParen }
  ")"                                       { \str -> TRightParen }
  ":"                                       { \str -> TColon }
  ";"                                       { \str -> TSemicolon }
  ","                                       { \str -> TComma }
  "."                                       { \str -> TDot }
  "var"                                     { \str -> TVar }
  "begin"                                   { \str -> TBegin }
  "end"                                     { \str -> TEnd }
  "function"                                { \str -> TFunction }
  "procedure"                               { \str -> TProcedure }
  "read"                                    { \str -> TRead }
  "readln"                                  { \str -> TReadln }
  "write"                                   { \str -> TWrite }
  "writeln"                                 { \str -> TWriteln }
  "while"                                   { \str -> TWhile }
  "do"                                      { \str -> TDo }
  "if"                                      { \str -> TIf }
  "then"                                    { \str -> TThen }
  "else"                                    { \str -> TElse }
  ":="                                      { \str -> TAssign }
  "+"                                       { \str -> TSum }
  "-"                                       { \str -> TSub }
  "*"                                       { \str -> TMul }
  "/"                                       { \str -> TDivide }
  "div"                                     { \str -> TDiv }
  "mod"                                     { \str -> TMod }
  "<"                                       { \str -> TLT }
  ">"                                       { \str -> TGT }
  "<="                                      { \str -> TLTE }
  ">="                                      { \str -> TGTE }
  "="                                       { \str -> TEq }
  "<>"                                      { \str -> TNotEq }
  "and"                                     { \str -> TAnd }
  "or"                                      { \str -> TOr }
  "not"                                     { \str -> TNot }
  "xor"                                     { \str -> TXor }
  $alpha [$alpha $digit \_ \-]*             { \str -> TVariable str }
  ([1-9] $digit* | 0) (\. $digit+)?         { \str -> TNumber str }
  $white                                    ;

{
data Token =
  TVariable String |
  TNumber String |
  TStr String |
  TBool String |
  TType String |
  TLeftParen |
  TRightParen |
  TColon |
  TSemicolon |
  TComma |
  TDot |
  TVar |
  TBegin |
  TEnd |
  TFunction |
  TProcedure |
  TRead |
  TReadln |
  TWrite |
  TWriteln |
  TWhile |
  TDo |
  TIf |
  TThen |
  TElse |
  TAssign |
  TSum |
  TSub |
  TMul |
  TDivide |
  TDiv |
  TMod |
  TLT |
  TGT |
  TLTE |
  TGTE |
  TEq |
  TNotEq |
  TAnd |
  TOr |
  TNot |
  TXor
  deriving (Eq, Show)
}