module Main where

import Lexer
  ( alexScanTokens
  )
import PascalInterpreter
  ( dummyEnv
  , InEnv (..)
  , interpretPrgm
  )
import PrettyPrinter
  ( prettyPrint
  )
import Syntax
  ( parseProgram
  )

import Control.Monad.Trans.State
  ( execStateT
  )
import Data.Map
  ( fromList
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

interpreterTestFiles :: [String]
interpreterTestFiles =
  [ "boolOpTests.pas"
  , "numOpTests.pas"
  , "strTests.pas"
  , "ifTests.pas"
  , "whileTests.pas"
  , "funTests.pas"
  ]

interpreterRess :: [InEnv]
interpreterRess =
  [ InEnv
  { _varTypes = fromList [("a","integer"),("b","integer"),("c","string"),("d","string"),("f_And","boolean"),("f_Eq","boolean"),("f_GT","boolean"),("f_GTE","boolean"),("f_LT","boolean"),("f_LTE","boolean"),("f_NEq","boolean"),("f_Not","boolean"),("f_Or","boolean"),("f_Xor","boolean"),("r","real"),("t","real")]
  , _varBVals = fromList [("f_And",False),("f_Eq",True),("f_GT",True),("f_GTE",True),("f_LT",False),("f_LTE",False),("f_NEq",True),("f_Not",False),("f_Or",True),("f_Xor",True)]
  , _varSVals = fromList [("c","abc"),("d","abacaba")]
  , _varIVals = fromList [("a",3),("b",6)]
  , _varFVals = fromList [("r",7.9),("t",2.4)]
  , _funs = fromList [], _funVars = fromList [], _funOps = fromList []
  }
  , InEnv
  { _varTypes = fromList [("a","integer"),("b","integer"),("c","integer"),("d","integer"),("e","real"),("f","real"),("g","real"),("h","real")]
  , _varBVals = fromList [], _varSVals = fromList [], _varIVals = fromList [("a",-3),("b",4),("c",-2),("d",0)]
  , _varFVals = fromList [("e",3.67),("f",-7.34),("g",-7.34),("h",-3.4299974)], _funs = fromList []
  , _funVars = fromList [], _funOps = fromList []
  }
  , InEnv
  { _varTypes = fromList [("a","string"),("b","string"),("c","string")]
  , _varBVals = fromList [], _varSVals = fromList [("a","aba"),("b","caba"),("c","abacaba")]
  , _varIVals = fromList [], _varFVals = fromList [], _funs = fromList []
  , _funVars = fromList [], _funOps = fromList []
  }
  , InEnv 
  { _varTypes = fromList [("a","integer"),("b","integer")], _varBVals = fromList []
  , _varSVals = fromList [], _varIVals = fromList [("a",0),("b",6)], _varFVals = fromList []
  , _funs = fromList [], _funVars = fromList [], _funOps = fromList []
  }
  , InEnv
  { _varTypes = fromList [("a","integer"),("b","integer")], _varBVals = fromList []
  , _varSVals = fromList [], _varIVals = fromList [("a",22),("b",40)], _varFVals = fromList []
  , _funs = fromList [], _funVars = fromList [], _funOps = fromList []
  }
  ]

interpreterFunRes :: String
interpreterFunRes =
  "InEnv {_varTypes = fromList [(\"a\",\"integer\"),(\"b\",\"integer\")], _varBVals = fromList [], _varSVals = fromList []"
  ++ ", _varIVals = fromList [(\"a\",5),(\"b\",25)], _varFVals = fromList [], _funs = fromList [(\"foo\",(\"integer\",[])),"
  ++ "(\"foo2\",(\"integer\",[(\"b\",\"integer\")])),(\"foo3\",(\"integer\",[])),(\"foo4\",(\"integer\",[(\"b\",\"integer\"),"
  ++ "(\"c\",\"integer\")]))], _funVars = fromList [(\"foo2\",fromList [(\"b\",\"integer\")]),(\"foo3\",fromList [(\"t\",\"integer\")])"
  ++ ",(\"foo4\",fromList [(\"c\",\"integer\")])], _funOps = fromList [(\"foo\",[foo := a]),(\"foo2\",[foo2 := 5]),(\"foo3\","
  ++ "[t := a * b,foo3 := t - 11]),(\"foo4\",[foo4 := b * a])]}"

interpreterSpec :: Spec
interpreterSpec =
  describe "interpreter" $ do
    context "bool operations" $ do
      let curFile = interpreterTestFiles !! 0
      let curRes = show $ interpreterRess !! 0
      input <- runIO $ readFile $ "tests/src/interpreterTests/" ++ curFile
      let parseResult = parseProgram (alexScanTokens input)
      env <- runIO $ execStateT (interpretPrgm parseResult) dummyEnv
      it curFile $ show env `shouldBe` curRes
    context "num operations" $ do
      let curFile = interpreterTestFiles !! 1
      let curRes = show $ interpreterRess !! 1
      input <- runIO $ readFile $ "tests/src/interpreterTests/" ++ curFile
      let parseResult = parseProgram (alexScanTokens input)
      env <- runIO $ execStateT (interpretPrgm parseResult) dummyEnv
      it curFile $ show env `shouldBe` curRes
    context "str operations" $ do
      let curFile = interpreterTestFiles !! 2
      let curRes = show $ interpreterRess !! 2
      input <- runIO $ readFile $ "tests/src/interpreterTests/" ++ curFile
      let parseResult = parseProgram (alexScanTokens input)
      env <- runIO $ execStateT (interpretPrgm parseResult) dummyEnv
      it curFile $ show env `shouldBe` curRes
    context "if operator" $ do
      let curFile = interpreterTestFiles !! 3
      let curRes = show $ interpreterRess !! 3
      input <- runIO $ readFile $ "tests/src/interpreterTests/" ++ curFile
      let parseResult = parseProgram (alexScanTokens input)
      env <- runIO $ execStateT (interpretPrgm parseResult) dummyEnv
      it curFile $ show env `shouldBe` curRes
    context "while operator" $ do
      let curFile = interpreterTestFiles !! 4
      let curRes = show $ interpreterRess !! 4
      input <- runIO $ readFile $ "tests/src/interpreterTests/" ++ curFile
      let parseResult = parseProgram (alexScanTokens input)
      env <- runIO $ execStateT (interpretPrgm parseResult) dummyEnv
      it curFile $ show env `shouldBe` curRes
    context "functions" $ do
      let curFile = interpreterTestFiles !! 5
      let curRes = interpreterFunRes
      input <- runIO $ readFile $ "tests/src/interpreterTests/" ++ curFile
      let parseResult = parseProgram (alexScanTokens input)
      env <- runIO $ execStateT (interpretPrgm parseResult) dummyEnv
      it curFile $ show env `shouldBe` curRes

main :: IO ()
main = do
  hspec prettyPrinterSpec
  hspec interpreterSpec