module Main where

import Lexer
  ( alexScanTokens
  )
import PrettyPrinter
  ( prettyPrint
  )
import Syntax
  ( parseProgram
  )

import Test.Hspec

prettyPrinterTestFiles :: [String]
prettyPrinterTestFiles =
  [ "varBlockTest.pas"
  , "funBlockTest.pas"
  , "mainBlockTest.pas"
  , "commonTest.pas"
  ]

prettyPrinterRess :: [String]
prettyPrinterRess =
  [  "var a, b: integer;\n"
  ++ "    r: real;\n"
  ++ "    s: string;\n"
  ++ "    f, f2: boolean;\n\n"
  ++ "begin\nend."
  ,  "function foo(b: integer): integer;\n"
  ++ "begin\n"
  ++ "  b := b - 1;\n"
  ++ "  foo := b + 5;\n"
  ++ "end;\n\n"
  ++ "begin\nend."
  ,  "begin\n"
  ++ "  readln(a);\n"
  ++ "  b := 10;\n"
  ++ "  a := foo(4);\n"
  ++ "  if a = 10 then\n"
  ++ "    a := 100\n"
  ++ "  else\n"
  ++ "  begin\n"
  ++ "    b := 100;\n"
  ++ "    b := b + a;\n"
  ++ "  end;\n"
  ++ "  write(\"a: \");\n"
  ++ "  writeln(a);\n"
  ++ "  write(\"b: \");\n"
  ++ "  writeln(b);\n"
  ++ "end."
  ,  "var a, b: integer;\n"
  ++ "    r: real;\n"
  ++ "    s: string;\n"
  ++ "    f, f2: boolean;\n\n"
  ++ "function foo(b: integer): integer;\n"
  ++ "begin\n"
  ++ "  b := b - 1;\n"
  ++ "  foo := b + 5;\n"
  ++ "end;\n\n"
  ++ "begin\n"
  ++ "  readln(a);\n"
  ++ "  b := 10;\n"
  ++ "  while a <= 10 do\n"
  ++ "  begin\n"
  ++ "    a := a + b;\n"
  ++ "    b := (b - 1);\n"
  ++ "  end;\n"
  ++ "  write(\"a: \");\n"
  ++ "  writeln(a);\n"
  ++ "  r := True;\n"
  ++ "  s := \"test\";\n"
  ++ "end."
  ]

prettyPrinterSpec :: Spec
prettyPrinterSpec =
  describe "prettyPrinter" $ do
    context "varBlock" $ do
      let curFile = prettyPrinterTestFiles !! 0
      let curRes = prettyPrinterRess !! 0
      input <- runIO $ readFile $ "tests/src/prettyPrinterTests/" ++ curFile
      let parseResult = parseProgram (alexScanTokens input)
      it curFile $ (prettyPrint parseResult) `shouldBe` curRes
    context "funBlock" $ do
      let curFile = prettyPrinterTestFiles !! 1
      let curRes = prettyPrinterRess !! 1
      input <- runIO $ readFile $ "tests/src/prettyPrinterTests/" ++ curFile
      let parseResult = parseProgram (alexScanTokens input)
      it curFile $ (prettyPrint parseResult) `shouldBe` curRes
    context "mainBlock with operators" $ do
      let curFile = prettyPrinterTestFiles !! 2
      let curRes = prettyPrinterRess !! 2
      input <- runIO $ readFile $ "tests/src/prettyPrinterTests/" ++ curFile
      let parseResult = parseProgram (alexScanTokens input)
      it curFile $ (prettyPrint parseResult) `shouldBe` curRes
    context "common test" $ do
      let curFile = prettyPrinterTestFiles !! 3
      let curRes = prettyPrinterRess !! 3
      input <- runIO $ readFile $ "tests/src/prettyPrinterTests/" ++ curFile
      let parseResult = parseProgram (alexScanTokens input)
      it curFile $ (prettyPrint parseResult) `shouldBe` curRes

interpreterSpec :: Spec
interpreterSpec = undefined

main :: IO ()
main = do
  hspec prettyPrinterSpec
  hspec interpreterSpec