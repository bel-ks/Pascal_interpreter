{
module Lexer where
}

%wrapper "basic"

$alpha = [A-Za-z]
$digit = [0-9]

tokens :-
  \" [^\"]* \"                              { \str -> TStr $ tail $ init str }
  "True"                                    { \_ -> TBool True }
  "False"                                   { \_ -> TBool False }
  "integer" | "real" | "boolean" | "string" { \str -> TType str }
  "("                                       { \_ -> TLeftParen }
  ")"                                       { \_ -> TRightParen }
  ":"                                       { \_ -> TColon }
  ";"                                       { \_ -> TSemicolon }
  ","                                       { \_ -> TComma }
  "."                                       { \_ -> TDot }
  "var"                                     { \_ -> TVar }
  "begin"                                   { \_ -> TBegin }
  "end"                                     { \_ -> TEnd }
  "function"                                { \_ -> TFunction }
  "procedure"                               { \_ -> TProcedure }
  "readln"                                  { \_ -> TReadln }
  "write"                                   { \_ -> TWrite }
  "writeln"                                 { \_ -> TWriteln }
  "while"                                   { \_ -> TWhile }
  "do"                                      { \_ -> TDo }
  "if"                                      { \_ -> TIf }
  "then"                                    { \_ -> TThen }
  "else"                                    { \_ -> TElse }
  ":="                                      { \_ -> TAssign }
  "+"                                       { \_ -> TSum }
  "-"                                       { \_ -> TSub }
  "*"                                       { \_ -> TMul }
  "/"                                       { \_ -> TDivide }
  "div"                                     { \_ -> TDiv }
  "mod"                                     { \_ -> TMod }
  "<"                                       { \_ -> TLT }
  ">"                                       { \_ -> TGT }
  "<="                                      { \_ -> TLTE }
  ">="                                      { \_ -> TGTE }
  "="                                       { \_ -> TEq }
  "<>"                                      { \_ -> TNotEq }
  "and"                                     { \_ -> TAnd }
  "or"                                      { \_ -> TOr }
  "not"                                     { \_ -> TNot }
  "xor"                                     { \_ -> TXor }
  $alpha [$alpha $digit \_ \-]*             { \str -> TVariable str }
  ([1-9] $digit* | 0) \. $digit+            { \str -> TRealNum ((read str) :: Float) }
  ([1-9] $digit* | 0)                       { \str -> TIntNum ((read str) :: Integer) }
  $white                                    ;

{
data Token =
  TVariable String |
  TRealNum Float |
  TIntNum Integer |
  TStr String |
  TBool Bool |
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