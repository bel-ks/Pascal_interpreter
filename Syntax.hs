{-# OPTIONS_GHC -w #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE DeriveAnyClass #-}

module Syntax where

import Data.Bits
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn 
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 (Prgm)
	| HappyAbsSyn5 ([Prgm])
	| HappyAbsSyn7 (([Prgm], Prgm))
	| HappyAbsSyn14 ([Operator])
	| HappyAbsSyn15 (forall expr. PascalExpr expr => expr ())
	| HappyAbsSyn24 (forall expr. PascalExpr expr => expr Variable)
	| HappyAbsSyn25 (forall expr. PascalExpr expr => expr Bool)
	| HappyAbsSyn34 (forall expr. PascalExpr expr => expr Number)
	| HappyAbsSyn39 (forall expr. PascalExpr expr => expr String)
	| HappyAbsSyn43 (forall expr. PascalExpr expr => [expr Variable])

{- to allow type-synonyms as our monads (likely
 - with explicitly-specified bind and return)
 - in Haskell98, it seems that with
 - /type M a = .../, then /(HappyReduction M)/
 - is not allowed.  But Happy is a
 - code-generator that can just substitute it.
type HappyReduction m = 
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> m HappyAbsSyn
-}

action_0,
 action_1,
 action_2,
 action_3,
 action_4,
 action_5,
 action_6,
 action_7,
 action_8,
 action_9,
 action_10,
 action_11,
 action_12,
 action_13,
 action_14,
 action_15,
 action_16,
 action_17,
 action_18,
 action_19,
 action_20,
 action_21,
 action_22,
 action_23,
 action_24,
 action_25,
 action_26,
 action_27,
 action_28,
 action_29,
 action_30,
 action_31,
 action_32,
 action_33,
 action_34,
 action_35,
 action_36,
 action_37,
 action_38,
 action_39,
 action_40,
 action_41,
 action_42,
 action_43,
 action_44,
 action_45,
 action_46,
 action_47,
 action_48,
 action_49,
 action_50,
 action_51,
 action_52,
 action_53,
 action_54,
 action_55,
 action_56,
 action_57,
 action_58,
 action_59,
 action_60,
 action_61,
 action_62,
 action_63,
 action_64,
 action_65,
 action_66,
 action_67,
 action_68,
 action_69,
 action_70,
 action_71,
 action_72,
 action_73,
 action_74,
 action_75,
 action_76,
 action_77,
 action_78,
 action_79,
 action_80,
 action_81,
 action_82,
 action_83,
 action_84,
 action_85,
 action_86,
 action_87,
 action_88,
 action_89,
 action_90,
 action_91,
 action_92,
 action_93,
 action_94,
 action_95,
 action_96,
 action_97,
 action_98,
 action_99,
 action_100,
 action_101,
 action_102,
 action_103,
 action_104,
 action_105,
 action_106,
 action_107,
 action_108,
 action_109,
 action_110,
 action_111,
 action_112,
 action_113,
 action_114,
 action_115,
 action_116,
 action_117,
 action_118,
 action_119,
 action_120,
 action_121,
 action_122,
 action_123,
 action_124,
 action_125,
 action_126,
 action_127,
 action_128,
 action_129,
 action_130,
 action_131,
 action_132,
 action_133,
 action_134,
 action_135,
 action_136,
 action_137,
 action_138,
 action_139,
 action_140,
 action_141,
 action_142,
 action_143,
 action_144,
 action_145,
 action_146,
 action_147,
 action_148,
 action_149,
 action_150,
 action_151,
 action_152,
 action_153,
 action_154,
 action_155,
 action_156,
 action_157,
 action_158,
 action_159,
 action_160,
 action_161,
 action_162,
 action_163,
 action_164,
 action_165,
 action_166,
 action_167,
 action_168,
 action_169,
 action_170,
 action_171,
 action_172,
 action_173,
 action_174,
 action_175,
 action_176,
 action_177,
 action_178,
 action_179,
 action_180,
 action_181,
 action_182,
 action_183,
 action_184,
 action_185,
 action_186,
 action_187,
 action_188,
 action_189,
 action_190,
 action_191,
 action_192,
 action_193,
 action_194,
 action_195,
 action_196,
 action_197,
 action_198,
 action_199,
 action_200,
 action_201,
 action_202,
 action_203,
 action_204,
 action_205,
 action_206,
 action_207,
 action_208,
 action_209,
 action_210,
 action_211,
 action_212,
 action_213,
 action_214,
 action_215,
 action_216,
 action_217,
 action_218,
 action_219,
 action_220,
 action_221,
 action_222,
 action_223,
 action_224,
 action_225,
 action_226,
 action_227,
 action_228,
 action_229,
 action_230,
 action_231,
 action_232,
 action_233,
 action_234,
 action_235,
 action_236,
 action_237,
 action_238,
 action_239,
 action_240,
 action_241,
 action_242,
 action_243,
 action_244,
 action_245,
 action_246,
 action_247,
 action_248,
 action_249,
 action_250,
 action_251,
 action_252,
 action_253,
 action_254,
 action_255,
 action_256,
 action_257,
 action_258,
 action_259,
 action_260,
 action_261,
 action_262 :: () => Prelude.Int -> ({-HappyReduction (HappyIdentity) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (HappyIdentity) HappyAbsSyn)

happyReduce_1,
 happyReduce_2,
 happyReduce_3,
 happyReduce_4,
 happyReduce_5,
 happyReduce_6,
 happyReduce_7,
 happyReduce_8,
 happyReduce_9,
 happyReduce_10,
 happyReduce_11,
 happyReduce_12,
 happyReduce_13,
 happyReduce_14,
 happyReduce_15,
 happyReduce_16,
 happyReduce_17,
 happyReduce_18,
 happyReduce_19,
 happyReduce_20,
 happyReduce_21,
 happyReduce_22,
 happyReduce_23,
 happyReduce_24,
 happyReduce_25,
 happyReduce_26,
 happyReduce_27,
 happyReduce_28,
 happyReduce_29,
 happyReduce_30,
 happyReduce_31,
 happyReduce_32,
 happyReduce_33,
 happyReduce_34,
 happyReduce_35,
 happyReduce_36,
 happyReduce_37,
 happyReduce_38,
 happyReduce_39,
 happyReduce_40,
 happyReduce_41,
 happyReduce_42,
 happyReduce_43,
 happyReduce_44,
 happyReduce_45,
 happyReduce_46,
 happyReduce_47,
 happyReduce_48,
 happyReduce_49,
 happyReduce_50,
 happyReduce_51,
 happyReduce_52,
 happyReduce_53,
 happyReduce_54,
 happyReduce_55,
 happyReduce_56,
 happyReduce_57,
 happyReduce_58,
 happyReduce_59,
 happyReduce_60,
 happyReduce_61,
 happyReduce_62,
 happyReduce_63,
 happyReduce_64,
 happyReduce_65,
 happyReduce_66,
 happyReduce_67,
 happyReduce_68,
 happyReduce_69,
 happyReduce_70,
 happyReduce_71,
 happyReduce_72,
 happyReduce_73,
 happyReduce_74,
 happyReduce_75,
 happyReduce_76,
 happyReduce_77,
 happyReduce_78,
 happyReduce_79,
 happyReduce_80,
 happyReduce_81,
 happyReduce_82,
 happyReduce_83,
 happyReduce_84,
 happyReduce_85,
 happyReduce_86,
 happyReduce_87,
 happyReduce_88,
 happyReduce_89,
 happyReduce_90,
 happyReduce_91,
 happyReduce_92,
 happyReduce_93,
 happyReduce_94,
 happyReduce_95,
 happyReduce_96,
 happyReduce_97,
 happyReduce_98,
 happyReduce_99,
 happyReduce_100,
 happyReduce_101,
 happyReduce_102,
 happyReduce_103,
 happyReduce_104,
 happyReduce_105,
 happyReduce_106,
 happyReduce_107,
 happyReduce_108,
 happyReduce_109,
 happyReduce_110,
 happyReduce_111,
 happyReduce_112,
 happyReduce_113,
 happyReduce_114,
 happyReduce_115,
 happyReduce_116,
 happyReduce_117,
 happyReduce_118,
 happyReduce_119,
 happyReduce_120,
 happyReduce_121,
 happyReduce_122,
 happyReduce_123,
 happyReduce_124 :: () => ({-HappyReduction (HappyIdentity) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (HappyIdentity) HappyAbsSyn)

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,894) ([0,0,0,432,0,0,0,0,1024,0,0,0,0,0,24,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,104,0,0,0,0,512,0,0,0,0,0,6,0,0,0,0,2,0,0,0,0,36864,23,256,0,0,0,0,16384,0,0,0,0,0,16,0,0,64,0,0,0,0,4096,0,0,0,0,0,1024,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,256,0,0,0,0,16384,0,0,0,0,0,16,0,0,0,0,1408,49152,53248,1,0,24576,1,48,116,0,0,64,512,0,0,0,0,12,0,0,0,0,0,0,0,0,0,0,377,4096,0,0,0,32,0,0,0,0,36864,23,256,0,0,0,1,0,0,0,0,0,0,16,0,0,256,0,0,0,0,0,1,0,0,0,0,512,0,0,0,0,0,376,4096,0,0,0,0,0,4,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,2,0,0,0,0,58368,5,64,0,0,0,1,0,0,0,0,8,0,0,0,0,2048,0,0,0,0,0,1508,16384,0,0,24576,3,48,116,0,0,88,3072,7424,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49184,15,0,0,0,0,10240,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61440,3,0,0,0,12288,2560,0,0,0,0,16624,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64512,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,22,768,1856,0,0,1024,49152,53248,1,0,0,1,48,116,0,0,80,3072,7424,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,49160,15,0,0,1408,49152,53248,1,0,24576,1,48,116,0,0,0,0,1024,0,0,0,0,0,0,0,0,57344,5,64,0,0,8192,0,0,0,0,32768,0,0,4,0,0,0,0,256,0,0,4096,0,0,0,0,0,2,0,0,0,0,512,0,0,0,0,8192,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,0,0,63,0,0,0,0,4032,0,0,0,0,61440,3,0,0,512,0,0,0,0,0,24096,0,4,0,0,20,0,320,0,0,1280,0,20480,0,0,16384,1,0,20,0,0,80,0,1280,0,0,5120,0,16384,1,0,0,5,0,80,0,0,32768,376,4096,0,0,55296,0,12,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,88,3072,7424,0,0,0,0,0,0,0,0,0,0,0,0,0,256,12288,29696,0,0,16384,0,12,29,0,0,0,0,0,0,0,2048,0,0,0,0,0,2,64512,0,0,0,128,0,63,0,0,8192,0,4032,0,0,32768,4,0,64,0,0,288,0,4096,0,0,18432,0,0,4,0,0,18,0,256,0,0,1152,0,16384,0,0,8192,1,0,16,0,0,72,0,1024,0,0,4096,0,16387,7,0,0,4,192,464,0,0,256,12288,29696,0,0,16384,0,12,29,0,0,16,768,1856,0,0,1024,49152,53248,1,0,0,1,48,116,0,0,64,3072,7424,0,0,4096,0,16387,7,0,0,4,192,464,0,0,256,12288,29696,0,0,16384,0,12,29,0,0,16,768,1856,0,0,1024,49152,53248,1,0,0,1,48,116,0,0,80,0,1280,0,0,5120,0,16384,1,0,0,5,0,80,0,0,0,1024,0,0,0,0,24096,0,4,0,0,0,64,0,0,0,0,0,0,0,0,0,16,0,0,0,0,128,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,2048,0,0,0,0,0,24128,0,4,0,0,0,0,0,0,0,32768,0,0,0,0,0,256,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,0,0,24576,1,48,116,0,0,0,0,0,0,0,0,6024,0,1,0,0,0,0,0,0,0,0,376,4096,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,24576,1,48,116,0,0,80,0,1280,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4156,0,0,0,0,3840,4,0,0,0,49152,259,0,0,0,0,16624,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,18432,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,376,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,376,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,256,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,512,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,1504,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseProgram","Program","DefVarBlocks","DefVarBlock","DefVar","Variables","Functions","Function","DefFunction","Arguments","Argument","Operators","Operator","Assign","ReadOps","WriteOps","WhileCycle","IfOp","ThenPart","ElsePart","FunApply","Expr","ExprOrd","BoolOrd","NumOrd","StrOrd","BoolExpr","BoolOrXor","BoolAnd","BoolUnary","BoolAtom","NumExpr","NumSumSubOrXor","NumMulDivAnd","NumUnary","NumAtom","StrExpr","StrSum","StrAtom","VarAtom","PassedArgs","qstring","bool","type","\"(\"","\")\"","\":\"","\";\"","\",\"","\".\"","\"var\"","\"begin\"","\"end\"","\"function\"","\"procedure\"","\"readln\"","\"write\"","\"writeln\"","\"while\"","\"do\"","\"if\"","\"then\"","\"else\"","\":=\"","\"+\"","\"-\"","\"*\"","\"/\"","\"div\"","\"mod\"","\"<\"","\">\"","\"<=\"","\">=\"","\"=\"","\"<>\"","\"and\"","\"or\"","\"not\"","\"xor\"","variable","real","int","%eof"]
        bit_start = st Prelude.* 86
        bit_end = (st Prelude.+ 1) Prelude.* 86
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..85]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (53) = happyShift action_3
action_0 (54) = happyShift action_9
action_0 (56) = happyShift action_10
action_0 (57) = happyShift action_11
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_5
action_0 (9) = happyGoto action_6
action_0 (10) = happyGoto action_7
action_0 (11) = happyGoto action_8
action_0 _ = happyReduce_9

action_1 (53) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (56) = happyShift action_10
action_2 (57) = happyShift action_11
action_2 (9) = happyGoto action_38
action_2 (10) = happyGoto action_7
action_2 (11) = happyGoto action_8
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (83) = happyShift action_37
action_3 (6) = happyGoto action_34
action_3 (7) = happyGoto action_35
action_3 (8) = happyGoto action_36
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (86) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (54) = happyShift action_33
action_5 (56) = happyShift action_10
action_5 (57) = happyShift action_11
action_5 (9) = happyGoto action_32
action_5 (10) = happyGoto action_7
action_5 (11) = happyGoto action_8
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (54) = happyShift action_31
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (56) = happyShift action_10
action_7 (57) = happyShift action_11
action_7 (9) = happyGoto action_30
action_7 (10) = happyGoto action_7
action_7 (11) = happyGoto action_8
action_7 _ = happyReduce_18

action_8 (50) = happyShift action_29
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (55) = happyShift action_22
action_9 (58) = happyShift action_23
action_9 (59) = happyShift action_24
action_9 (60) = happyShift action_25
action_9 (61) = happyShift action_26
action_9 (63) = happyShift action_27
action_9 (83) = happyShift action_28
action_9 (14) = happyGoto action_14
action_9 (15) = happyGoto action_15
action_9 (16) = happyGoto action_16
action_9 (17) = happyGoto action_17
action_9 (18) = happyGoto action_18
action_9 (19) = happyGoto action_19
action_9 (20) = happyGoto action_20
action_9 (23) = happyGoto action_21
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (83) = happyShift action_13
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (83) = happyShift action_12
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (47) = happyShift action_89
action_12 _ = happyReduce_26

action_13 (47) = happyShift action_88
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (55) = happyShift action_87
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (50) = happyShift action_86
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_32

action_17 _ = happyReduce_33

action_18 _ = happyReduce_34

action_19 _ = happyReduce_35

action_20 _ = happyReduce_36

action_21 _ = happyReduce_37

action_22 (52) = happyShift action_85
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (47) = happyShift action_84
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (47) = happyShift action_83
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (47) = happyShift action_82
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (44) = happyShift action_71
action_26 (45) = happyShift action_72
action_26 (47) = happyShift action_73
action_26 (67) = happyShift action_74
action_26 (68) = happyShift action_75
action_26 (81) = happyShift action_76
action_26 (83) = happyShift action_77
action_26 (84) = happyShift action_78
action_26 (85) = happyShift action_79
action_26 (25) = happyGoto action_80
action_26 (26) = happyGoto action_54
action_26 (27) = happyGoto action_55
action_26 (28) = happyGoto action_56
action_26 (29) = happyGoto action_81
action_26 (30) = happyGoto action_58
action_26 (31) = happyGoto action_59
action_26 (32) = happyGoto action_60
action_26 (33) = happyGoto action_61
action_26 (34) = happyGoto action_62
action_26 (35) = happyGoto action_63
action_26 (36) = happyGoto action_64
action_26 (37) = happyGoto action_65
action_26 (38) = happyGoto action_66
action_26 (39) = happyGoto action_67
action_26 (40) = happyGoto action_68
action_26 (41) = happyGoto action_69
action_26 (42) = happyGoto action_70
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (44) = happyShift action_71
action_27 (45) = happyShift action_72
action_27 (47) = happyShift action_73
action_27 (67) = happyShift action_74
action_27 (68) = happyShift action_75
action_27 (81) = happyShift action_76
action_27 (83) = happyShift action_77
action_27 (84) = happyShift action_78
action_27 (85) = happyShift action_79
action_27 (25) = happyGoto action_53
action_27 (26) = happyGoto action_54
action_27 (27) = happyGoto action_55
action_27 (28) = happyGoto action_56
action_27 (29) = happyGoto action_57
action_27 (30) = happyGoto action_58
action_27 (31) = happyGoto action_59
action_27 (32) = happyGoto action_60
action_27 (33) = happyGoto action_61
action_27 (34) = happyGoto action_62
action_27 (35) = happyGoto action_63
action_27 (36) = happyGoto action_64
action_27 (37) = happyGoto action_65
action_27 (38) = happyGoto action_66
action_27 (39) = happyGoto action_67
action_27 (40) = happyGoto action_68
action_27 (41) = happyGoto action_69
action_27 (42) = happyGoto action_70
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (47) = happyShift action_51
action_28 (66) = happyShift action_52
action_28 _ = happyReduce_56

action_29 (53) = happyShift action_3
action_29 (54) = happyShift action_50
action_29 (5) = happyGoto action_49
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_17

action_31 (55) = happyShift action_48
action_31 (58) = happyShift action_23
action_31 (59) = happyShift action_24
action_31 (60) = happyShift action_25
action_31 (61) = happyShift action_26
action_31 (63) = happyShift action_27
action_31 (83) = happyShift action_28
action_31 (14) = happyGoto action_47
action_31 (15) = happyGoto action_15
action_31 (16) = happyGoto action_16
action_31 (17) = happyGoto action_17
action_31 (18) = happyGoto action_18
action_31 (19) = happyGoto action_19
action_31 (20) = happyGoto action_20
action_31 (23) = happyGoto action_21
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (54) = happyShift action_46
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (55) = happyShift action_45
action_33 (58) = happyShift action_23
action_33 (59) = happyShift action_24
action_33 (60) = happyShift action_25
action_33 (61) = happyShift action_26
action_33 (63) = happyShift action_27
action_33 (83) = happyShift action_28
action_33 (14) = happyGoto action_44
action_33 (15) = happyGoto action_15
action_33 (16) = happyGoto action_16
action_33 (17) = happyGoto action_17
action_33 (18) = happyGoto action_18
action_33 (19) = happyGoto action_19
action_33 (20) = happyGoto action_20
action_33 (23) = happyGoto action_21
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (53) = happyShift action_3
action_34 (5) = happyGoto action_43
action_34 _ = happyReduce_11

action_35 (83) = happyShift action_37
action_35 (6) = happyGoto action_42
action_35 (7) = happyGoto action_35
action_35 (8) = happyGoto action_36
action_35 _ = happyReduce_13

action_36 (49) = happyShift action_41
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (51) = happyShift action_40
action_37 _ = happyReduce_16

action_38 (54) = happyShift action_39
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (58) = happyShift action_23
action_39 (59) = happyShift action_24
action_39 (60) = happyShift action_25
action_39 (61) = happyShift action_26
action_39 (63) = happyShift action_27
action_39 (83) = happyShift action_28
action_39 (14) = happyGoto action_163
action_39 (15) = happyGoto action_15
action_39 (16) = happyGoto action_16
action_39 (17) = happyGoto action_17
action_39 (18) = happyGoto action_18
action_39 (19) = happyGoto action_19
action_39 (20) = happyGoto action_20
action_39 (23) = happyGoto action_21
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (83) = happyShift action_37
action_40 (8) = happyGoto action_168
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (46) = happyShift action_167
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_12

action_43 _ = happyReduce_10

action_44 (55) = happyShift action_166
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (52) = happyShift action_165
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (55) = happyShift action_164
action_46 (58) = happyShift action_23
action_46 (59) = happyShift action_24
action_46 (60) = happyShift action_25
action_46 (61) = happyShift action_26
action_46 (63) = happyShift action_27
action_46 (83) = happyShift action_28
action_46 (14) = happyGoto action_163
action_46 (15) = happyGoto action_15
action_46 (16) = happyGoto action_16
action_46 (17) = happyGoto action_17
action_46 (18) = happyGoto action_18
action_46 (19) = happyGoto action_19
action_46 (20) = happyGoto action_20
action_46 (23) = happyGoto action_21
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (55) = happyShift action_162
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (52) = happyShift action_161
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (54) = happyShift action_160
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (55) = happyShift action_159
action_50 (58) = happyShift action_23
action_50 (59) = happyShift action_24
action_50 (60) = happyShift action_25
action_50 (61) = happyShift action_26
action_50 (63) = happyShift action_27
action_50 (83) = happyShift action_28
action_50 (14) = happyGoto action_158
action_50 (15) = happyGoto action_15
action_50 (16) = happyGoto action_16
action_50 (17) = happyGoto action_17
action_50 (18) = happyGoto action_18
action_50 (19) = happyGoto action_19
action_50 (20) = happyGoto action_20
action_50 (23) = happyGoto action_21
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (44) = happyShift action_71
action_51 (45) = happyShift action_72
action_51 (47) = happyShift action_73
action_51 (48) = happyShift action_157
action_51 (67) = happyShift action_74
action_51 (68) = happyShift action_75
action_51 (81) = happyShift action_76
action_51 (83) = happyShift action_77
action_51 (84) = happyShift action_78
action_51 (85) = happyShift action_79
action_51 (24) = happyGoto action_155
action_51 (25) = happyGoto action_99
action_51 (26) = happyGoto action_54
action_51 (27) = happyGoto action_55
action_51 (28) = happyGoto action_56
action_51 (29) = happyGoto action_100
action_51 (30) = happyGoto action_58
action_51 (31) = happyGoto action_59
action_51 (32) = happyGoto action_60
action_51 (33) = happyGoto action_61
action_51 (34) = happyGoto action_101
action_51 (35) = happyGoto action_63
action_51 (36) = happyGoto action_64
action_51 (37) = happyGoto action_65
action_51 (38) = happyGoto action_66
action_51 (39) = happyGoto action_102
action_51 (40) = happyGoto action_68
action_51 (41) = happyGoto action_69
action_51 (42) = happyGoto action_70
action_51 (43) = happyGoto action_156
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (44) = happyShift action_71
action_52 (45) = happyShift action_72
action_52 (47) = happyShift action_73
action_52 (67) = happyShift action_74
action_52 (68) = happyShift action_75
action_52 (81) = happyShift action_76
action_52 (83) = happyShift action_77
action_52 (84) = happyShift action_78
action_52 (85) = happyShift action_79
action_52 (24) = happyGoto action_154
action_52 (25) = happyGoto action_99
action_52 (26) = happyGoto action_54
action_52 (27) = happyGoto action_55
action_52 (28) = happyGoto action_56
action_52 (29) = happyGoto action_100
action_52 (30) = happyGoto action_58
action_52 (31) = happyGoto action_59
action_52 (32) = happyGoto action_60
action_52 (33) = happyGoto action_61
action_52 (34) = happyGoto action_101
action_52 (35) = happyGoto action_63
action_52 (36) = happyGoto action_64
action_52 (37) = happyGoto action_65
action_52 (38) = happyGoto action_66
action_52 (39) = happyGoto action_102
action_52 (40) = happyGoto action_68
action_52 (41) = happyGoto action_69
action_52 (42) = happyGoto action_70
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (64) = happyShift action_152
action_53 (21) = happyGoto action_153
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_61

action_55 _ = happyReduce_62

action_56 _ = happyReduce_63

action_57 (64) = happyShift action_152
action_57 (73) = happyShift action_105
action_57 (74) = happyShift action_106
action_57 (75) = happyShift action_107
action_57 (76) = happyShift action_108
action_57 (77) = happyShift action_109
action_57 (78) = happyShift action_110
action_57 (21) = happyGoto action_151
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (80) = happyShift action_149
action_58 (82) = happyShift action_150
action_58 _ = happyReduce_82

action_59 (79) = happyShift action_148
action_59 _ = happyReduce_85

action_60 _ = happyReduce_87

action_61 _ = happyReduce_89

action_62 (73) = happyShift action_142
action_62 (74) = happyShift action_143
action_62 (75) = happyShift action_144
action_62 (76) = happyShift action_145
action_62 (77) = happyShift action_146
action_62 (78) = happyShift action_147
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (67) = happyShift action_138
action_63 (68) = happyShift action_139
action_63 (80) = happyShift action_140
action_63 (82) = happyShift action_141
action_63 _ = happyReduce_94

action_64 (69) = happyShift action_133
action_64 (70) = happyShift action_134
action_64 (71) = happyShift action_135
action_64 (72) = happyShift action_136
action_64 (79) = happyShift action_137
action_64 _ = happyReduce_99

action_65 _ = happyReduce_105

action_66 _ = happyReduce_109

action_67 (73) = happyShift action_127
action_67 (74) = happyShift action_128
action_67 (75) = happyShift action_129
action_67 (76) = happyShift action_130
action_67 (77) = happyShift action_131
action_67 (78) = happyShift action_132
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (67) = happyShift action_126
action_68 _ = happyReduce_114

action_69 _ = happyReduce_116

action_70 (48) = happyReduce_118
action_70 (50) = happyReduce_118
action_70 (51) = happyReduce_118
action_70 (65) = happyReduce_118
action_70 (67) = happyReduce_118
action_70 (68) = happyReduce_112
action_70 (69) = happyReduce_112
action_70 (70) = happyReduce_112
action_70 (71) = happyReduce_112
action_70 (72) = happyReduce_112
action_70 (73) = happyReduce_118
action_70 (74) = happyReduce_118
action_70 (75) = happyReduce_118
action_70 (76) = happyReduce_118
action_70 (77) = happyReduce_118
action_70 (78) = happyReduce_118
action_70 (79) = happyReduce_112
action_70 (80) = happyReduce_112
action_70 (82) = happyReduce_112
action_70 _ = happyReduce_91

action_71 _ = happyReduce_117

action_72 _ = happyReduce_90

action_73 (44) = happyShift action_71
action_73 (45) = happyShift action_72
action_73 (47) = happyShift action_73
action_73 (67) = happyShift action_74
action_73 (68) = happyShift action_75
action_73 (81) = happyShift action_76
action_73 (83) = happyShift action_77
action_73 (84) = happyShift action_78
action_73 (85) = happyShift action_79
action_73 (25) = happyGoto action_122
action_73 (26) = happyGoto action_54
action_73 (27) = happyGoto action_55
action_73 (28) = happyGoto action_56
action_73 (29) = happyGoto action_123
action_73 (30) = happyGoto action_58
action_73 (31) = happyGoto action_59
action_73 (32) = happyGoto action_60
action_73 (33) = happyGoto action_61
action_73 (34) = happyGoto action_124
action_73 (35) = happyGoto action_63
action_73 (36) = happyGoto action_64
action_73 (37) = happyGoto action_65
action_73 (38) = happyGoto action_66
action_73 (39) = happyGoto action_125
action_73 (40) = happyGoto action_68
action_73 (41) = happyGoto action_69
action_73 (42) = happyGoto action_70
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (47) = happyShift action_119
action_74 (67) = happyShift action_74
action_74 (68) = happyShift action_75
action_74 (81) = happyShift action_120
action_74 (83) = happyShift action_77
action_74 (84) = happyShift action_78
action_74 (85) = happyShift action_79
action_74 (37) = happyGoto action_121
action_74 (38) = happyGoto action_66
action_74 (42) = happyGoto action_118
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (47) = happyShift action_119
action_75 (67) = happyShift action_74
action_75 (68) = happyShift action_75
action_75 (81) = happyShift action_120
action_75 (83) = happyShift action_77
action_75 (84) = happyShift action_78
action_75 (85) = happyShift action_79
action_75 (37) = happyGoto action_117
action_75 (38) = happyGoto action_66
action_75 (42) = happyGoto action_118
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (45) = happyShift action_72
action_76 (47) = happyShift action_116
action_76 (67) = happyShift action_74
action_76 (68) = happyShift action_75
action_76 (81) = happyShift action_76
action_76 (83) = happyShift action_77
action_76 (84) = happyShift action_78
action_76 (85) = happyShift action_79
action_76 (32) = happyGoto action_113
action_76 (33) = happyGoto action_61
action_76 (37) = happyGoto action_114
action_76 (38) = happyGoto action_66
action_76 (42) = happyGoto action_115
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (47) = happyShift action_112
action_77 _ = happyReduce_120

action_78 _ = happyReduce_110

action_79 _ = happyReduce_111

action_80 (62) = happyShift action_111
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (62) = happyShift action_104
action_81 (73) = happyShift action_105
action_81 (74) = happyShift action_106
action_81 (75) = happyShift action_107
action_81 (76) = happyShift action_108
action_81 (77) = happyShift action_109
action_81 (78) = happyShift action_110
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (44) = happyShift action_71
action_82 (45) = happyShift action_72
action_82 (47) = happyShift action_73
action_82 (67) = happyShift action_74
action_82 (68) = happyShift action_75
action_82 (81) = happyShift action_76
action_82 (83) = happyShift action_77
action_82 (84) = happyShift action_78
action_82 (85) = happyShift action_79
action_82 (24) = happyGoto action_103
action_82 (25) = happyGoto action_99
action_82 (26) = happyGoto action_54
action_82 (27) = happyGoto action_55
action_82 (28) = happyGoto action_56
action_82 (29) = happyGoto action_100
action_82 (30) = happyGoto action_58
action_82 (31) = happyGoto action_59
action_82 (32) = happyGoto action_60
action_82 (33) = happyGoto action_61
action_82 (34) = happyGoto action_101
action_82 (35) = happyGoto action_63
action_82 (36) = happyGoto action_64
action_82 (37) = happyGoto action_65
action_82 (38) = happyGoto action_66
action_82 (39) = happyGoto action_102
action_82 (40) = happyGoto action_68
action_82 (41) = happyGoto action_69
action_82 (42) = happyGoto action_70
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (44) = happyShift action_71
action_83 (45) = happyShift action_72
action_83 (47) = happyShift action_73
action_83 (67) = happyShift action_74
action_83 (68) = happyShift action_75
action_83 (81) = happyShift action_76
action_83 (83) = happyShift action_77
action_83 (84) = happyShift action_78
action_83 (85) = happyShift action_79
action_83 (24) = happyGoto action_98
action_83 (25) = happyGoto action_99
action_83 (26) = happyGoto action_54
action_83 (27) = happyGoto action_55
action_83 (28) = happyGoto action_56
action_83 (29) = happyGoto action_100
action_83 (30) = happyGoto action_58
action_83 (31) = happyGoto action_59
action_83 (32) = happyGoto action_60
action_83 (33) = happyGoto action_61
action_83 (34) = happyGoto action_101
action_83 (35) = happyGoto action_63
action_83 (36) = happyGoto action_64
action_83 (37) = happyGoto action_65
action_83 (38) = happyGoto action_66
action_83 (39) = happyGoto action_102
action_83 (40) = happyGoto action_68
action_83 (41) = happyGoto action_69
action_83 (42) = happyGoto action_70
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (83) = happyShift action_97
action_84 _ = happyFail (happyExpListPerState 84)

action_85 _ = happyReduce_8

action_86 (58) = happyShift action_23
action_86 (59) = happyShift action_24
action_86 (60) = happyShift action_25
action_86 (61) = happyShift action_26
action_86 (63) = happyShift action_27
action_86 (83) = happyShift action_28
action_86 (14) = happyGoto action_96
action_86 (15) = happyGoto action_15
action_86 (16) = happyGoto action_16
action_86 (17) = happyGoto action_17
action_86 (18) = happyGoto action_18
action_86 (19) = happyGoto action_19
action_86 (20) = happyGoto action_20
action_86 (23) = happyGoto action_21
action_86 _ = happyReduce_31

action_87 (52) = happyShift action_95
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (48) = happyShift action_94
action_88 (83) = happyShift action_37
action_88 (8) = happyGoto action_90
action_88 (12) = happyGoto action_93
action_88 (13) = happyGoto action_92
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (83) = happyShift action_37
action_89 (8) = happyGoto action_90
action_89 (12) = happyGoto action_91
action_89 (13) = happyGoto action_92
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (49) = happyShift action_239
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (48) = happyShift action_238
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (50) = happyShift action_237
action_92 _ = happyReduce_28

action_93 (48) = happyShift action_236
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (49) = happyShift action_235
action_94 _ = happyFail (happyExpListPerState 94)

action_95 _ = happyReduce_5

action_96 _ = happyReduce_30

action_97 (48) = happyShift action_234
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (48) = happyShift action_233
action_98 _ = happyFail (happyExpListPerState 98)

action_99 _ = happyReduce_57

action_100 (73) = happyShift action_105
action_100 (74) = happyShift action_106
action_100 (75) = happyShift action_107
action_100 (76) = happyShift action_108
action_100 (77) = happyShift action_109
action_100 (78) = happyShift action_110
action_100 _ = happyReduce_58

action_101 (73) = happyShift action_142
action_101 (74) = happyShift action_143
action_101 (75) = happyShift action_144
action_101 (76) = happyShift action_145
action_101 (77) = happyShift action_146
action_101 (78) = happyShift action_147
action_101 _ = happyReduce_59

action_102 (73) = happyShift action_127
action_102 (74) = happyShift action_128
action_102 (75) = happyShift action_129
action_102 (76) = happyShift action_130
action_102 (77) = happyShift action_131
action_102 (78) = happyShift action_132
action_102 _ = happyReduce_60

action_103 (48) = happyShift action_232
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (54) = happyShift action_231
action_104 (58) = happyShift action_23
action_104 (59) = happyShift action_24
action_104 (60) = happyShift action_25
action_104 (61) = happyShift action_26
action_104 (63) = happyShift action_27
action_104 (83) = happyShift action_28
action_104 (15) = happyGoto action_230
action_104 (16) = happyGoto action_16
action_104 (17) = happyGoto action_17
action_104 (18) = happyGoto action_18
action_104 (19) = happyGoto action_19
action_104 (20) = happyGoto action_20
action_104 (23) = happyGoto action_21
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (45) = happyShift action_72
action_105 (47) = happyShift action_187
action_105 (81) = happyShift action_188
action_105 (83) = happyShift action_77
action_105 (29) = happyGoto action_229
action_105 (30) = happyGoto action_58
action_105 (31) = happyGoto action_59
action_105 (32) = happyGoto action_60
action_105 (33) = happyGoto action_61
action_105 (42) = happyGoto action_186
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (45) = happyShift action_72
action_106 (47) = happyShift action_187
action_106 (81) = happyShift action_188
action_106 (83) = happyShift action_77
action_106 (29) = happyGoto action_228
action_106 (30) = happyGoto action_58
action_106 (31) = happyGoto action_59
action_106 (32) = happyGoto action_60
action_106 (33) = happyGoto action_61
action_106 (42) = happyGoto action_186
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (45) = happyShift action_72
action_107 (47) = happyShift action_187
action_107 (81) = happyShift action_188
action_107 (83) = happyShift action_77
action_107 (29) = happyGoto action_227
action_107 (30) = happyGoto action_58
action_107 (31) = happyGoto action_59
action_107 (32) = happyGoto action_60
action_107 (33) = happyGoto action_61
action_107 (42) = happyGoto action_186
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (45) = happyShift action_72
action_108 (47) = happyShift action_187
action_108 (81) = happyShift action_188
action_108 (83) = happyShift action_77
action_108 (29) = happyGoto action_226
action_108 (30) = happyGoto action_58
action_108 (31) = happyGoto action_59
action_108 (32) = happyGoto action_60
action_108 (33) = happyGoto action_61
action_108 (42) = happyGoto action_186
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (45) = happyShift action_72
action_109 (47) = happyShift action_187
action_109 (81) = happyShift action_188
action_109 (83) = happyShift action_77
action_109 (29) = happyGoto action_225
action_109 (30) = happyGoto action_58
action_109 (31) = happyGoto action_59
action_109 (32) = happyGoto action_60
action_109 (33) = happyGoto action_61
action_109 (42) = happyGoto action_186
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (45) = happyShift action_72
action_110 (47) = happyShift action_187
action_110 (81) = happyShift action_188
action_110 (83) = happyShift action_77
action_110 (29) = happyGoto action_224
action_110 (30) = happyGoto action_58
action_110 (31) = happyGoto action_59
action_110 (32) = happyGoto action_60
action_110 (33) = happyGoto action_61
action_110 (42) = happyGoto action_186
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (54) = happyShift action_223
action_111 (58) = happyShift action_23
action_111 (59) = happyShift action_24
action_111 (60) = happyShift action_25
action_111 (61) = happyShift action_26
action_111 (63) = happyShift action_27
action_111 (83) = happyShift action_28
action_111 (15) = happyGoto action_222
action_111 (16) = happyGoto action_16
action_111 (17) = happyGoto action_17
action_111 (18) = happyGoto action_18
action_111 (19) = happyGoto action_19
action_111 (20) = happyGoto action_20
action_111 (23) = happyGoto action_21
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (44) = happyShift action_71
action_112 (45) = happyShift action_72
action_112 (47) = happyShift action_73
action_112 (48) = happyShift action_221
action_112 (67) = happyShift action_74
action_112 (68) = happyShift action_75
action_112 (81) = happyShift action_76
action_112 (83) = happyShift action_77
action_112 (84) = happyShift action_78
action_112 (85) = happyShift action_79
action_112 (24) = happyGoto action_155
action_112 (25) = happyGoto action_99
action_112 (26) = happyGoto action_54
action_112 (27) = happyGoto action_55
action_112 (28) = happyGoto action_56
action_112 (29) = happyGoto action_100
action_112 (30) = happyGoto action_58
action_112 (31) = happyGoto action_59
action_112 (32) = happyGoto action_60
action_112 (33) = happyGoto action_61
action_112 (34) = happyGoto action_101
action_112 (35) = happyGoto action_63
action_112 (36) = happyGoto action_64
action_112 (37) = happyGoto action_65
action_112 (38) = happyGoto action_66
action_112 (39) = happyGoto action_102
action_112 (40) = happyGoto action_68
action_112 (41) = happyGoto action_69
action_112 (42) = happyGoto action_70
action_112 (43) = happyGoto action_220
action_112 _ = happyFail (happyExpListPerState 112)

action_113 _ = happyReduce_88

action_114 _ = happyReduce_106

action_115 (48) = happyReduce_112
action_115 (50) = happyReduce_112
action_115 (51) = happyReduce_112
action_115 (65) = happyReduce_112
action_115 (67) = happyReduce_112
action_115 (68) = happyReduce_112
action_115 (69) = happyReduce_112
action_115 (70) = happyReduce_112
action_115 (71) = happyReduce_112
action_115 (72) = happyReduce_112
action_115 (73) = happyReduce_112
action_115 (74) = happyReduce_112
action_115 (75) = happyReduce_112
action_115 (76) = happyReduce_112
action_115 (77) = happyReduce_112
action_115 (78) = happyReduce_112
action_115 (79) = happyReduce_112
action_115 (80) = happyReduce_112
action_115 (82) = happyReduce_112
action_115 _ = happyReduce_91

action_116 (44) = happyShift action_71
action_116 (45) = happyShift action_72
action_116 (47) = happyShift action_73
action_116 (67) = happyShift action_74
action_116 (68) = happyShift action_75
action_116 (81) = happyShift action_76
action_116 (83) = happyShift action_77
action_116 (84) = happyShift action_78
action_116 (85) = happyShift action_79
action_116 (25) = happyGoto action_122
action_116 (26) = happyGoto action_54
action_116 (27) = happyGoto action_55
action_116 (28) = happyGoto action_56
action_116 (29) = happyGoto action_123
action_116 (30) = happyGoto action_58
action_116 (31) = happyGoto action_59
action_116 (32) = happyGoto action_60
action_116 (33) = happyGoto action_61
action_116 (34) = happyGoto action_124
action_116 (35) = happyGoto action_63
action_116 (36) = happyGoto action_64
action_116 (37) = happyGoto action_65
action_116 (38) = happyGoto action_66
action_116 (39) = happyGoto action_67
action_116 (40) = happyGoto action_68
action_116 (41) = happyGoto action_69
action_116 (42) = happyGoto action_70
action_116 _ = happyFail (happyExpListPerState 116)

action_117 _ = happyReduce_107

action_118 _ = happyReduce_112

action_119 (47) = happyShift action_119
action_119 (67) = happyShift action_74
action_119 (68) = happyShift action_75
action_119 (81) = happyShift action_120
action_119 (83) = happyShift action_77
action_119 (84) = happyShift action_78
action_119 (85) = happyShift action_79
action_119 (34) = happyGoto action_219
action_119 (35) = happyGoto action_63
action_119 (36) = happyGoto action_64
action_119 (37) = happyGoto action_65
action_119 (38) = happyGoto action_66
action_119 (42) = happyGoto action_118
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (47) = happyShift action_119
action_120 (67) = happyShift action_74
action_120 (68) = happyShift action_75
action_120 (81) = happyShift action_120
action_120 (83) = happyShift action_77
action_120 (84) = happyShift action_78
action_120 (85) = happyShift action_79
action_120 (37) = happyGoto action_114
action_120 (38) = happyGoto action_66
action_120 (42) = happyGoto action_118
action_120 _ = happyFail (happyExpListPerState 120)

action_121 _ = happyReduce_108

action_122 (48) = happyShift action_218
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (48) = happyShift action_217
action_123 (73) = happyShift action_105
action_123 (74) = happyShift action_106
action_123 (75) = happyShift action_107
action_123 (76) = happyShift action_108
action_123 (77) = happyShift action_109
action_123 (78) = happyShift action_110
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (48) = happyShift action_216
action_124 (73) = happyShift action_142
action_124 (74) = happyShift action_143
action_124 (75) = happyShift action_144
action_124 (76) = happyShift action_145
action_124 (77) = happyShift action_146
action_124 (78) = happyShift action_147
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (48) = happyShift action_215
action_125 (73) = happyShift action_127
action_125 (74) = happyShift action_128
action_125 (75) = happyShift action_129
action_125 (76) = happyShift action_130
action_125 (77) = happyShift action_131
action_125 (78) = happyShift action_132
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (44) = happyShift action_71
action_126 (47) = happyShift action_208
action_126 (83) = happyShift action_77
action_126 (41) = happyGoto action_214
action_126 (42) = happyGoto action_207
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (44) = happyShift action_71
action_127 (47) = happyShift action_208
action_127 (83) = happyShift action_77
action_127 (39) = happyGoto action_213
action_127 (40) = happyGoto action_68
action_127 (41) = happyGoto action_69
action_127 (42) = happyGoto action_207
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (44) = happyShift action_71
action_128 (47) = happyShift action_208
action_128 (83) = happyShift action_77
action_128 (39) = happyGoto action_212
action_128 (40) = happyGoto action_68
action_128 (41) = happyGoto action_69
action_128 (42) = happyGoto action_207
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (44) = happyShift action_71
action_129 (47) = happyShift action_208
action_129 (83) = happyShift action_77
action_129 (39) = happyGoto action_211
action_129 (40) = happyGoto action_68
action_129 (41) = happyGoto action_69
action_129 (42) = happyGoto action_207
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (44) = happyShift action_71
action_130 (47) = happyShift action_208
action_130 (83) = happyShift action_77
action_130 (39) = happyGoto action_210
action_130 (40) = happyGoto action_68
action_130 (41) = happyGoto action_69
action_130 (42) = happyGoto action_207
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (44) = happyShift action_71
action_131 (47) = happyShift action_208
action_131 (83) = happyShift action_77
action_131 (39) = happyGoto action_209
action_131 (40) = happyGoto action_68
action_131 (41) = happyGoto action_69
action_131 (42) = happyGoto action_207
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (44) = happyShift action_71
action_132 (47) = happyShift action_208
action_132 (83) = happyShift action_77
action_132 (39) = happyGoto action_206
action_132 (40) = happyGoto action_68
action_132 (41) = happyGoto action_69
action_132 (42) = happyGoto action_207
action_132 _ = happyFail (happyExpListPerState 132)

action_133 (47) = happyShift action_119
action_133 (67) = happyShift action_74
action_133 (68) = happyShift action_75
action_133 (81) = happyShift action_120
action_133 (83) = happyShift action_77
action_133 (84) = happyShift action_78
action_133 (85) = happyShift action_79
action_133 (37) = happyGoto action_205
action_133 (38) = happyGoto action_66
action_133 (42) = happyGoto action_118
action_133 _ = happyFail (happyExpListPerState 133)

action_134 (47) = happyShift action_119
action_134 (67) = happyShift action_74
action_134 (68) = happyShift action_75
action_134 (81) = happyShift action_120
action_134 (83) = happyShift action_77
action_134 (84) = happyShift action_78
action_134 (85) = happyShift action_79
action_134 (37) = happyGoto action_204
action_134 (38) = happyGoto action_66
action_134 (42) = happyGoto action_118
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (47) = happyShift action_119
action_135 (67) = happyShift action_74
action_135 (68) = happyShift action_75
action_135 (81) = happyShift action_120
action_135 (83) = happyShift action_77
action_135 (84) = happyShift action_78
action_135 (85) = happyShift action_79
action_135 (37) = happyGoto action_203
action_135 (38) = happyGoto action_66
action_135 (42) = happyGoto action_118
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (47) = happyShift action_119
action_136 (67) = happyShift action_74
action_136 (68) = happyShift action_75
action_136 (81) = happyShift action_120
action_136 (83) = happyShift action_77
action_136 (84) = happyShift action_78
action_136 (85) = happyShift action_79
action_136 (37) = happyGoto action_202
action_136 (38) = happyGoto action_66
action_136 (42) = happyGoto action_118
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (47) = happyShift action_119
action_137 (67) = happyShift action_74
action_137 (68) = happyShift action_75
action_137 (81) = happyShift action_120
action_137 (83) = happyShift action_77
action_137 (84) = happyShift action_78
action_137 (85) = happyShift action_79
action_137 (37) = happyGoto action_201
action_137 (38) = happyGoto action_66
action_137 (42) = happyGoto action_118
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (47) = happyShift action_119
action_138 (67) = happyShift action_74
action_138 (68) = happyShift action_75
action_138 (81) = happyShift action_120
action_138 (83) = happyShift action_77
action_138 (84) = happyShift action_78
action_138 (85) = happyShift action_79
action_138 (36) = happyGoto action_200
action_138 (37) = happyGoto action_65
action_138 (38) = happyGoto action_66
action_138 (42) = happyGoto action_118
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (47) = happyShift action_119
action_139 (67) = happyShift action_74
action_139 (68) = happyShift action_75
action_139 (81) = happyShift action_120
action_139 (83) = happyShift action_77
action_139 (84) = happyShift action_78
action_139 (85) = happyShift action_79
action_139 (36) = happyGoto action_199
action_139 (37) = happyGoto action_65
action_139 (38) = happyGoto action_66
action_139 (42) = happyGoto action_118
action_139 _ = happyFail (happyExpListPerState 139)

action_140 (47) = happyShift action_119
action_140 (67) = happyShift action_74
action_140 (68) = happyShift action_75
action_140 (81) = happyShift action_120
action_140 (83) = happyShift action_77
action_140 (84) = happyShift action_78
action_140 (85) = happyShift action_79
action_140 (36) = happyGoto action_198
action_140 (37) = happyGoto action_65
action_140 (38) = happyGoto action_66
action_140 (42) = happyGoto action_118
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (47) = happyShift action_119
action_141 (67) = happyShift action_74
action_141 (68) = happyShift action_75
action_141 (81) = happyShift action_120
action_141 (83) = happyShift action_77
action_141 (84) = happyShift action_78
action_141 (85) = happyShift action_79
action_141 (36) = happyGoto action_197
action_141 (37) = happyGoto action_65
action_141 (38) = happyGoto action_66
action_141 (42) = happyGoto action_118
action_141 _ = happyFail (happyExpListPerState 141)

action_142 (47) = happyShift action_119
action_142 (67) = happyShift action_74
action_142 (68) = happyShift action_75
action_142 (81) = happyShift action_120
action_142 (83) = happyShift action_77
action_142 (84) = happyShift action_78
action_142 (85) = happyShift action_79
action_142 (34) = happyGoto action_196
action_142 (35) = happyGoto action_63
action_142 (36) = happyGoto action_64
action_142 (37) = happyGoto action_65
action_142 (38) = happyGoto action_66
action_142 (42) = happyGoto action_118
action_142 _ = happyFail (happyExpListPerState 142)

action_143 (47) = happyShift action_119
action_143 (67) = happyShift action_74
action_143 (68) = happyShift action_75
action_143 (81) = happyShift action_120
action_143 (83) = happyShift action_77
action_143 (84) = happyShift action_78
action_143 (85) = happyShift action_79
action_143 (34) = happyGoto action_195
action_143 (35) = happyGoto action_63
action_143 (36) = happyGoto action_64
action_143 (37) = happyGoto action_65
action_143 (38) = happyGoto action_66
action_143 (42) = happyGoto action_118
action_143 _ = happyFail (happyExpListPerState 143)

action_144 (47) = happyShift action_119
action_144 (67) = happyShift action_74
action_144 (68) = happyShift action_75
action_144 (81) = happyShift action_120
action_144 (83) = happyShift action_77
action_144 (84) = happyShift action_78
action_144 (85) = happyShift action_79
action_144 (34) = happyGoto action_194
action_144 (35) = happyGoto action_63
action_144 (36) = happyGoto action_64
action_144 (37) = happyGoto action_65
action_144 (38) = happyGoto action_66
action_144 (42) = happyGoto action_118
action_144 _ = happyFail (happyExpListPerState 144)

action_145 (47) = happyShift action_119
action_145 (67) = happyShift action_74
action_145 (68) = happyShift action_75
action_145 (81) = happyShift action_120
action_145 (83) = happyShift action_77
action_145 (84) = happyShift action_78
action_145 (85) = happyShift action_79
action_145 (34) = happyGoto action_193
action_145 (35) = happyGoto action_63
action_145 (36) = happyGoto action_64
action_145 (37) = happyGoto action_65
action_145 (38) = happyGoto action_66
action_145 (42) = happyGoto action_118
action_145 _ = happyFail (happyExpListPerState 145)

action_146 (47) = happyShift action_119
action_146 (67) = happyShift action_74
action_146 (68) = happyShift action_75
action_146 (81) = happyShift action_120
action_146 (83) = happyShift action_77
action_146 (84) = happyShift action_78
action_146 (85) = happyShift action_79
action_146 (34) = happyGoto action_192
action_146 (35) = happyGoto action_63
action_146 (36) = happyGoto action_64
action_146 (37) = happyGoto action_65
action_146 (38) = happyGoto action_66
action_146 (42) = happyGoto action_118
action_146 _ = happyFail (happyExpListPerState 146)

action_147 (47) = happyShift action_119
action_147 (67) = happyShift action_74
action_147 (68) = happyShift action_75
action_147 (81) = happyShift action_120
action_147 (83) = happyShift action_77
action_147 (84) = happyShift action_78
action_147 (85) = happyShift action_79
action_147 (34) = happyGoto action_191
action_147 (35) = happyGoto action_63
action_147 (36) = happyGoto action_64
action_147 (37) = happyGoto action_65
action_147 (38) = happyGoto action_66
action_147 (42) = happyGoto action_118
action_147 _ = happyFail (happyExpListPerState 147)

action_148 (45) = happyShift action_72
action_148 (47) = happyShift action_187
action_148 (81) = happyShift action_188
action_148 (83) = happyShift action_77
action_148 (32) = happyGoto action_190
action_148 (33) = happyGoto action_61
action_148 (42) = happyGoto action_186
action_148 _ = happyFail (happyExpListPerState 148)

action_149 (45) = happyShift action_72
action_149 (47) = happyShift action_187
action_149 (81) = happyShift action_188
action_149 (83) = happyShift action_77
action_149 (31) = happyGoto action_189
action_149 (32) = happyGoto action_60
action_149 (33) = happyGoto action_61
action_149 (42) = happyGoto action_186
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (45) = happyShift action_72
action_150 (47) = happyShift action_187
action_150 (81) = happyShift action_188
action_150 (83) = happyShift action_77
action_150 (31) = happyGoto action_185
action_150 (32) = happyGoto action_60
action_150 (33) = happyGoto action_61
action_150 (42) = happyGoto action_186
action_150 _ = happyFail (happyExpListPerState 150)

action_151 (65) = happyShift action_181
action_151 (22) = happyGoto action_184
action_151 _ = happyReduce_49

action_152 (54) = happyShift action_183
action_152 (58) = happyShift action_23
action_152 (59) = happyShift action_24
action_152 (60) = happyShift action_25
action_152 (61) = happyShift action_26
action_152 (63) = happyShift action_27
action_152 (83) = happyShift action_28
action_152 (15) = happyGoto action_182
action_152 (16) = happyGoto action_16
action_152 (17) = happyGoto action_17
action_152 (18) = happyGoto action_18
action_152 (19) = happyGoto action_19
action_152 (20) = happyGoto action_20
action_152 (23) = happyGoto action_21
action_152 _ = happyFail (happyExpListPerState 152)

action_153 (65) = happyShift action_181
action_153 (22) = happyGoto action_180
action_153 _ = happyReduce_47

action_154 _ = happyReduce_38

action_155 (51) = happyShift action_179
action_155 _ = happyReduce_124

action_156 (48) = happyShift action_178
action_156 _ = happyFail (happyExpListPerState 156)

action_157 _ = happyReduce_55

action_158 (55) = happyShift action_177
action_158 _ = happyFail (happyExpListPerState 158)

action_159 (50) = happyShift action_176
action_159 _ = happyFail (happyExpListPerState 159)

action_160 (55) = happyShift action_175
action_160 (58) = happyShift action_23
action_160 (59) = happyShift action_24
action_160 (60) = happyShift action_25
action_160 (61) = happyShift action_26
action_160 (63) = happyShift action_27
action_160 (83) = happyShift action_28
action_160 (14) = happyGoto action_174
action_160 (15) = happyGoto action_15
action_160 (16) = happyGoto action_16
action_160 (17) = happyGoto action_17
action_160 (18) = happyGoto action_18
action_160 (19) = happyGoto action_19
action_160 (20) = happyGoto action_20
action_160 (23) = happyGoto action_21
action_160 _ = happyFail (happyExpListPerState 160)

action_161 _ = happyReduce_6

action_162 (52) = happyShift action_173
action_162 _ = happyFail (happyExpListPerState 162)

action_163 (55) = happyShift action_172
action_163 _ = happyFail (happyExpListPerState 163)

action_164 (52) = happyShift action_171
action_164 _ = happyFail (happyExpListPerState 164)

action_165 _ = happyReduce_7

action_166 (52) = happyShift action_170
action_166 _ = happyFail (happyExpListPerState 166)

action_167 (50) = happyShift action_169
action_167 _ = happyFail (happyExpListPerState 167)

action_168 _ = happyReduce_15

action_169 _ = happyReduce_14

action_170 _ = happyReduce_2

action_171 _ = happyReduce_4

action_172 (52) = happyShift action_255
action_172 _ = happyFail (happyExpListPerState 172)

action_173 _ = happyReduce_3

action_174 (55) = happyShift action_254
action_174 _ = happyFail (happyExpListPerState 174)

action_175 (50) = happyShift action_253
action_175 _ = happyFail (happyExpListPerState 175)

action_176 _ = happyReduce_22

action_177 (50) = happyShift action_252
action_177 _ = happyFail (happyExpListPerState 177)

action_178 _ = happyReduce_54

action_179 (44) = happyShift action_71
action_179 (45) = happyShift action_72
action_179 (47) = happyShift action_73
action_179 (67) = happyShift action_74
action_179 (68) = happyShift action_75
action_179 (81) = happyShift action_76
action_179 (83) = happyShift action_77
action_179 (84) = happyShift action_78
action_179 (85) = happyShift action_79
action_179 (24) = happyGoto action_155
action_179 (25) = happyGoto action_99
action_179 (26) = happyGoto action_54
action_179 (27) = happyGoto action_55
action_179 (28) = happyGoto action_56
action_179 (29) = happyGoto action_100
action_179 (30) = happyGoto action_58
action_179 (31) = happyGoto action_59
action_179 (32) = happyGoto action_60
action_179 (33) = happyGoto action_61
action_179 (34) = happyGoto action_101
action_179 (35) = happyGoto action_63
action_179 (36) = happyGoto action_64
action_179 (37) = happyGoto action_65
action_179 (38) = happyGoto action_66
action_179 (39) = happyGoto action_102
action_179 (40) = happyGoto action_68
action_179 (41) = happyGoto action_69
action_179 (42) = happyGoto action_70
action_179 (43) = happyGoto action_251
action_179 _ = happyFail (happyExpListPerState 179)

action_180 _ = happyReduce_46

action_181 (54) = happyShift action_250
action_181 (58) = happyShift action_23
action_181 (59) = happyShift action_24
action_181 (60) = happyShift action_25
action_181 (61) = happyShift action_26
action_181 (63) = happyShift action_27
action_181 (83) = happyShift action_28
action_181 (15) = happyGoto action_249
action_181 (16) = happyGoto action_16
action_181 (17) = happyGoto action_17
action_181 (18) = happyGoto action_18
action_181 (19) = happyGoto action_19
action_181 (20) = happyGoto action_20
action_181 (23) = happyGoto action_21
action_181 _ = happyFail (happyExpListPerState 181)

action_182 _ = happyReduce_51

action_183 (58) = happyShift action_23
action_183 (59) = happyShift action_24
action_183 (60) = happyShift action_25
action_183 (61) = happyShift action_26
action_183 (63) = happyShift action_27
action_183 (83) = happyShift action_28
action_183 (14) = happyGoto action_248
action_183 (15) = happyGoto action_15
action_183 (16) = happyGoto action_16
action_183 (17) = happyGoto action_17
action_183 (18) = happyGoto action_18
action_183 (19) = happyGoto action_19
action_183 (20) = happyGoto action_20
action_183 (23) = happyGoto action_21
action_183 _ = happyFail (happyExpListPerState 183)

action_184 _ = happyReduce_48

action_185 (79) = happyShift action_148
action_185 _ = happyReduce_84

action_186 _ = happyReduce_91

action_187 (44) = happyShift action_71
action_187 (45) = happyShift action_72
action_187 (47) = happyShift action_73
action_187 (67) = happyShift action_74
action_187 (68) = happyShift action_75
action_187 (81) = happyShift action_76
action_187 (83) = happyShift action_77
action_187 (84) = happyShift action_78
action_187 (85) = happyShift action_79
action_187 (25) = happyGoto action_122
action_187 (26) = happyGoto action_54
action_187 (27) = happyGoto action_55
action_187 (28) = happyGoto action_56
action_187 (29) = happyGoto action_123
action_187 (30) = happyGoto action_58
action_187 (31) = happyGoto action_59
action_187 (32) = happyGoto action_60
action_187 (33) = happyGoto action_61
action_187 (34) = happyGoto action_62
action_187 (35) = happyGoto action_63
action_187 (36) = happyGoto action_64
action_187 (37) = happyGoto action_65
action_187 (38) = happyGoto action_66
action_187 (39) = happyGoto action_67
action_187 (40) = happyGoto action_68
action_187 (41) = happyGoto action_69
action_187 (42) = happyGoto action_70
action_187 _ = happyFail (happyExpListPerState 187)

action_188 (45) = happyShift action_72
action_188 (47) = happyShift action_187
action_188 (81) = happyShift action_188
action_188 (83) = happyShift action_77
action_188 (32) = happyGoto action_113
action_188 (33) = happyGoto action_61
action_188 (42) = happyGoto action_186
action_188 _ = happyFail (happyExpListPerState 188)

action_189 (79) = happyShift action_148
action_189 _ = happyReduce_83

action_190 _ = happyReduce_86

action_191 _ = happyReduce_75

action_192 _ = happyReduce_74

action_193 _ = happyReduce_73

action_194 _ = happyReduce_72

action_195 _ = happyReduce_71

action_196 _ = happyReduce_70

action_197 (69) = happyShift action_133
action_197 (70) = happyShift action_134
action_197 (71) = happyShift action_135
action_197 (72) = happyShift action_136
action_197 (79) = happyShift action_137
action_197 _ = happyReduce_98

action_198 (69) = happyShift action_133
action_198 (70) = happyShift action_134
action_198 (71) = happyShift action_135
action_198 (72) = happyShift action_136
action_198 (79) = happyShift action_137
action_198 _ = happyReduce_97

action_199 (69) = happyShift action_133
action_199 (70) = happyShift action_134
action_199 (71) = happyShift action_135
action_199 (72) = happyShift action_136
action_199 (79) = happyShift action_137
action_199 _ = happyReduce_96

action_200 (69) = happyShift action_133
action_200 (70) = happyShift action_134
action_200 (71) = happyShift action_135
action_200 (72) = happyShift action_136
action_200 (79) = happyShift action_137
action_200 _ = happyReduce_95

action_201 _ = happyReduce_104

action_202 _ = happyReduce_103

action_203 _ = happyReduce_102

action_204 _ = happyReduce_101

action_205 _ = happyReduce_100

action_206 _ = happyReduce_81

action_207 _ = happyReduce_118

action_208 (44) = happyShift action_71
action_208 (47) = happyShift action_208
action_208 (83) = happyShift action_77
action_208 (39) = happyGoto action_247
action_208 (40) = happyGoto action_68
action_208 (41) = happyGoto action_69
action_208 (42) = happyGoto action_207
action_208 _ = happyFail (happyExpListPerState 208)

action_209 _ = happyReduce_80

action_210 _ = happyReduce_79

action_211 _ = happyReduce_78

action_212 _ = happyReduce_77

action_213 _ = happyReduce_76

action_214 _ = happyReduce_115

action_215 _ = happyReduce_119

action_216 _ = happyReduce_113

action_217 _ = happyReduce_93

action_218 _ = happyReduce_92

action_219 (48) = happyShift action_216
action_219 _ = happyFail (happyExpListPerState 219)

action_220 (48) = happyShift action_246
action_220 _ = happyFail (happyExpListPerState 220)

action_221 _ = happyReduce_122

action_222 _ = happyReduce_43

action_223 (58) = happyShift action_23
action_223 (59) = happyShift action_24
action_223 (60) = happyShift action_25
action_223 (61) = happyShift action_26
action_223 (63) = happyShift action_27
action_223 (83) = happyShift action_28
action_223 (14) = happyGoto action_245
action_223 (15) = happyGoto action_15
action_223 (16) = happyGoto action_16
action_223 (17) = happyGoto action_17
action_223 (18) = happyGoto action_18
action_223 (19) = happyGoto action_19
action_223 (20) = happyGoto action_20
action_223 (23) = happyGoto action_21
action_223 _ = happyFail (happyExpListPerState 223)

action_224 _ = happyReduce_69

action_225 _ = happyReduce_68

action_226 _ = happyReduce_67

action_227 _ = happyReduce_66

action_228 _ = happyReduce_65

action_229 _ = happyReduce_64

action_230 _ = happyReduce_45

action_231 (58) = happyShift action_23
action_231 (59) = happyShift action_24
action_231 (60) = happyShift action_25
action_231 (61) = happyShift action_26
action_231 (63) = happyShift action_27
action_231 (83) = happyShift action_28
action_231 (14) = happyGoto action_244
action_231 (15) = happyGoto action_15
action_231 (16) = happyGoto action_16
action_231 (17) = happyGoto action_17
action_231 (18) = happyGoto action_18
action_231 (19) = happyGoto action_19
action_231 (20) = happyGoto action_20
action_231 (23) = happyGoto action_21
action_231 _ = happyFail (happyExpListPerState 231)

action_232 _ = happyReduce_41

action_233 _ = happyReduce_40

action_234 _ = happyReduce_39

action_235 (46) = happyShift action_243
action_235 _ = happyFail (happyExpListPerState 235)

action_236 (49) = happyShift action_242
action_236 _ = happyFail (happyExpListPerState 236)

action_237 (83) = happyShift action_37
action_237 (8) = happyGoto action_90
action_237 (12) = happyGoto action_241
action_237 (13) = happyGoto action_92
action_237 _ = happyFail (happyExpListPerState 237)

action_238 _ = happyReduce_25

action_239 (46) = happyShift action_240
action_239 _ = happyFail (happyExpListPerState 239)

action_240 _ = happyReduce_29

action_241 _ = happyReduce_27

action_242 (46) = happyShift action_261
action_242 _ = happyFail (happyExpListPerState 242)

action_243 _ = happyReduce_24

action_244 (55) = happyShift action_260
action_244 _ = happyFail (happyExpListPerState 244)

action_245 (55) = happyShift action_259
action_245 _ = happyFail (happyExpListPerState 245)

action_246 _ = happyReduce_121

action_247 (48) = happyShift action_215
action_247 _ = happyFail (happyExpListPerState 247)

action_248 (55) = happyShift action_258
action_248 _ = happyFail (happyExpListPerState 248)

action_249 _ = happyReduce_53

action_250 (58) = happyShift action_23
action_250 (59) = happyShift action_24
action_250 (60) = happyShift action_25
action_250 (61) = happyShift action_26
action_250 (63) = happyShift action_27
action_250 (83) = happyShift action_28
action_250 (14) = happyGoto action_257
action_250 (15) = happyGoto action_15
action_250 (16) = happyGoto action_16
action_250 (17) = happyGoto action_17
action_250 (18) = happyGoto action_18
action_250 (19) = happyGoto action_19
action_250 (20) = happyGoto action_20
action_250 (23) = happyGoto action_21
action_250 _ = happyFail (happyExpListPerState 250)

action_251 _ = happyReduce_123

action_252 _ = happyReduce_20

action_253 _ = happyReduce_21

action_254 (50) = happyShift action_256
action_254 _ = happyFail (happyExpListPerState 254)

action_255 _ = happyReduce_1

action_256 _ = happyReduce_19

action_257 (55) = happyShift action_262
action_257 _ = happyFail (happyExpListPerState 257)

action_258 _ = happyReduce_50

action_259 _ = happyReduce_42

action_260 _ = happyReduce_44

action_261 _ = happyReduce_23

action_262 _ = happyReduce_52

happyReduce_1 = happyReduce 6 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Program happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_2 = happyReduce 5 4 happyReduction_2
happyReduction_2 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Program happy_var_1 [] happy_var_3
	) `HappyStk` happyRest

happyReduce_3 = happyReduce 5 4 happyReduction_3
happyReduction_3 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Program [] happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 5 4 happyReduction_4
happyReduction_4 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Program happy_var_1 happy_var_2 []
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 4 4 happyReduction_5
happyReduction_5 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Program [] [] happy_var_2
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 4 4 happyReduction_6
happyReduction_6 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Program [] happy_var_1 []
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 4 4 happyReduction_7
happyReduction_7 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Program happy_var_1 [] []
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_3  4 happyReduction_8
happyReduction_8 _
	_
	_
	 =  HappyAbsSyn4
		 (Program [] [] []
	)

happyReduce_9 = happySpecReduce_0  4 happyReduction_9
happyReduction_9  =  HappyAbsSyn4
		 (Program [] [] []
	)

happyReduce_10 = happySpecReduce_3  5 happyReduction_10
happyReduction_10 (HappyAbsSyn5  happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 ((VarBlock happy_var_2) : happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  5 happyReduction_11
happyReduction_11 (HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 ([VarBlock happy_var_2]
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_2  6 happyReduction_12
happyReduction_12 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn5
		 ((VarLine happy_var_1) : happy_var_2
	)
happyReduction_12 _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  6 happyReduction_13
happyReduction_13 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn5
		 ([VarLine happy_var_1]
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happyReduce 4 7 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyTerminal (TType happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 ((happy_var_1, Type happy_var_3)
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_3  8 happyReduction_15
happyReduction_15 (HappyAbsSyn5  happy_var_3)
	_
	(HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn5
		 ((Var happy_var_1) : happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  8 happyReduction_16
happyReduction_16 (HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn5
		 ([Var happy_var_1]
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  9 happyReduction_17
happyReduction_17 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 : happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  9 happyReduction_18
happyReduction_18 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happyReduce 7 10 happyReduction_19
happyReduction_19 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Function happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 6 10 happyReduction_20
happyReduction_20 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Function happy_var_1 [] happy_var_4
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 6 10 happyReduction_21
happyReduction_21 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Function happy_var_1 happy_var_3 []
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 5 10 happyReduction_22
happyReduction_22 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Function happy_var_1 [] []
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 7 11 happyReduction_23
happyReduction_23 ((HappyTerminal (TType happy_var_7)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVariable happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (FunDef (Var happy_var_2, Type happy_var_7) happy_var_4
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 6 11 happyReduction_24
happyReduction_24 ((HappyTerminal (TType happy_var_6)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVariable happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (FunDef (Var happy_var_2, Type happy_var_6) []
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 5 11 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVariable happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (FunDef (Var happy_var_2, Type "") happy_var_4
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_2  11 happyReduction_26
happyReduction_26 (HappyTerminal (TVariable happy_var_2))
	_
	 =  HappyAbsSyn4
		 (FunDef (Var happy_var_2, Type "") []
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  12 happyReduction_27
happyReduction_27 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn5
		 ((FunArg happy_var_1) : happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  12 happyReduction_28
happyReduction_28 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn5
		 ([FunArg happy_var_1]
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  13 happyReduction_29
happyReduction_29 (HappyTerminal (TType happy_var_3))
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn7
		 ((happy_var_1, Type happy_var_3)
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  14 happyReduction_30
happyReduction_30 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 ((Operator happy_var_1) : happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_2  14 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 ([Operator happy_var_1]
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  15 happyReduction_32
happyReduction_32 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  15 happyReduction_33
happyReduction_33 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  15 happyReduction_34
happyReduction_34 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  15 happyReduction_35
happyReduction_35 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  15 happyReduction_36
happyReduction_36 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  15 happyReduction_37
happyReduction_37 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  16 happyReduction_38
happyReduction_38 (HappyAbsSyn24  happy_var_3)
	_
	(HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn15
		 (peAssign (Var happy_var_1) happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happyReduce 4 17 happyReduction_39
happyReduction_39 (_ `HappyStk`
	(HappyTerminal (TVariable happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (peReadln $ Var happy_var_3
	) `HappyStk` happyRest

happyReduce_40 = happyReduce 4 18 happyReduction_40
happyReduction_40 (_ `HappyStk`
	(HappyAbsSyn24  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (peWrite happy_var_3
	) `HappyStk` happyRest

happyReduce_41 = happyReduce 4 18 happyReduction_41
happyReduction_41 (_ `HappyStk`
	(HappyAbsSyn24  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (peWriteln happy_var_3
	) `HappyStk` happyRest

happyReduce_42 = happyReduce 6 19 happyReduction_42
happyReduction_42 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn25  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (peWhile happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_43 = happyReduce 4 19 happyReduction_43
happyReduction_43 ((HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn25  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (peWhile happy_var_2 [Operator happy_var_4]
	) `HappyStk` happyRest

happyReduce_44 = happyReduce 6 19 happyReduction_44
happyReduction_44 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn25  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (peWhile happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_45 = happyReduce 4 19 happyReduction_45
happyReduction_45 ((HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn25  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (peWhile happy_var_2 [Operator happy_var_4]
	) `HappyStk` happyRest

happyReduce_46 = happyReduce 4 20 happyReduction_46
happyReduction_46 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	(HappyAbsSyn25  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (peIf happy_var_2 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_47 = happySpecReduce_3  20 happyReduction_47
happyReduction_47 (HappyAbsSyn14  happy_var_3)
	(HappyAbsSyn25  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (peIf happy_var_2 happy_var_3 []
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happyReduce 4 20 happyReduction_48
happyReduction_48 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	(HappyAbsSyn25  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (peIf happy_var_2 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_49 = happySpecReduce_3  20 happyReduction_49
happyReduction_49 (HappyAbsSyn14  happy_var_3)
	(HappyAbsSyn25  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (peIf happy_var_2 happy_var_3 []
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happyReduce 4 21 happyReduction_50
happyReduction_50 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (happy_var_3
	) `HappyStk` happyRest

happyReduce_51 = happySpecReduce_2  21 happyReduction_51
happyReduction_51 (HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn14
		 ([Operator happy_var_2]
	)
happyReduction_51 _ _  = notHappyAtAll 

happyReduce_52 = happyReduce 4 22 happyReduction_52
happyReduction_52 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (happy_var_3
	) `HappyStk` happyRest

happyReduce_53 = happySpecReduce_2  22 happyReduction_53
happyReduction_53 (HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn14
		 ([Operator happy_var_2]
	)
happyReduction_53 _ _  = notHappyAtAll 

happyReduce_54 = happyReduce 4 23 happyReduction_54
happyReduction_54 (_ `HappyStk`
	(HappyAbsSyn43  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVariable happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (peProcApply (Var happy_var_1) happy_var_3 False
	) `HappyStk` happyRest

happyReduce_55 = happySpecReduce_3  23 happyReduction_55
happyReduction_55 _
	_
	(HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn15
		 (peProcApply (Var happy_var_1) [] False
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  23 happyReduction_56
happyReduction_56 (HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn15
		 (peProcApply (Var happy_var_1) [] True
	)
happyReduction_56 _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  24 happyReduction_57
happyReduction_57 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn24
		 (fmap BoolCons happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  24 happyReduction_58
happyReduction_58 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn24
		 (fmap BoolCons happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  24 happyReduction_59
happyReduction_59 (HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn24
		 (fmap NumCons happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_1  24 happyReduction_60
happyReduction_60 (HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn24
		 (fmap StrCons happy_var_1
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  25 happyReduction_61
happyReduction_61 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  25 happyReduction_62
happyReduction_62 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  25 happyReduction_63
happyReduction_63 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  26 happyReduction_64
happyReduction_64 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn25
		 (peLT happy_var_1 happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  26 happyReduction_65
happyReduction_65 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn25
		 (peGT happy_var_1 happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_3  26 happyReduction_66
happyReduction_66 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn25
		 (peLTE happy_var_1 happy_var_3
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  26 happyReduction_67
happyReduction_67 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn25
		 (peGTE happy_var_1 happy_var_3
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_3  26 happyReduction_68
happyReduction_68 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn25
		 (peEq happy_var_1 happy_var_3
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_3  26 happyReduction_69
happyReduction_69 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn25
		 (peNotEq happy_var_1 happy_var_3
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_3  27 happyReduction_70
happyReduction_70 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn25
		 (peLT happy_var_1 happy_var_3
	)
happyReduction_70 _ _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_3  27 happyReduction_71
happyReduction_71 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn25
		 (peGT happy_var_1 happy_var_3
	)
happyReduction_71 _ _ _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_3  27 happyReduction_72
happyReduction_72 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn25
		 (peLTE happy_var_1 happy_var_3
	)
happyReduction_72 _ _ _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_3  27 happyReduction_73
happyReduction_73 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn25
		 (peGTE happy_var_1 happy_var_3
	)
happyReduction_73 _ _ _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_3  27 happyReduction_74
happyReduction_74 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn25
		 (peEq happy_var_1 happy_var_3
	)
happyReduction_74 _ _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_3  27 happyReduction_75
happyReduction_75 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn25
		 (peNotEq happy_var_1 happy_var_3
	)
happyReduction_75 _ _ _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_3  28 happyReduction_76
happyReduction_76 (HappyAbsSyn39  happy_var_3)
	_
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn25
		 (peLT happy_var_1 happy_var_3
	)
happyReduction_76 _ _ _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_3  28 happyReduction_77
happyReduction_77 (HappyAbsSyn39  happy_var_3)
	_
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn25
		 (peGT happy_var_1 happy_var_3
	)
happyReduction_77 _ _ _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_3  28 happyReduction_78
happyReduction_78 (HappyAbsSyn39  happy_var_3)
	_
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn25
		 (peLTE happy_var_1 happy_var_3
	)
happyReduction_78 _ _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_3  28 happyReduction_79
happyReduction_79 (HappyAbsSyn39  happy_var_3)
	_
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn25
		 (peGTE happy_var_1 happy_var_3
	)
happyReduction_79 _ _ _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_3  28 happyReduction_80
happyReduction_80 (HappyAbsSyn39  happy_var_3)
	_
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn25
		 (peEq happy_var_1 happy_var_3
	)
happyReduction_80 _ _ _  = notHappyAtAll 

happyReduce_81 = happySpecReduce_3  28 happyReduction_81
happyReduction_81 (HappyAbsSyn39  happy_var_3)
	_
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn25
		 (peNotEq happy_var_1 happy_var_3
	)
happyReduction_81 _ _ _  = notHappyAtAll 

happyReduce_82 = happySpecReduce_1  29 happyReduction_82
happyReduction_82 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1
	)
happyReduction_82 _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_3  30 happyReduction_83
happyReduction_83 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn25
		 (peBOr happy_var_1 happy_var_3
	)
happyReduction_83 _ _ _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_3  30 happyReduction_84
happyReduction_84 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn25
		 (peBXor happy_var_1 happy_var_3
	)
happyReduction_84 _ _ _  = notHappyAtAll 

happyReduce_85 = happySpecReduce_1  30 happyReduction_85
happyReduction_85 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1
	)
happyReduction_85 _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_3  31 happyReduction_86
happyReduction_86 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn25
		 (peBAnd happy_var_1 happy_var_3
	)
happyReduction_86 _ _ _  = notHappyAtAll 

happyReduce_87 = happySpecReduce_1  31 happyReduction_87
happyReduction_87 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1
	)
happyReduction_87 _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_2  32 happyReduction_88
happyReduction_88 (HappyAbsSyn25  happy_var_2)
	_
	 =  HappyAbsSyn25
		 (peBNot happy_var_2
	)
happyReduction_88 _ _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_1  32 happyReduction_89
happyReduction_89 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1
	)
happyReduction_89 _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_1  33 happyReduction_90
happyReduction_90 (HappyTerminal (TBool happy_var_1))
	 =  HappyAbsSyn25
		 (peBool happy_var_1
	)
happyReduction_90 _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_1  33 happyReduction_91
happyReduction_91 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn25
		 (fmap getBool happy_var_1
	)
happyReduction_91 _  = notHappyAtAll 

happyReduce_92 = happySpecReduce_3  33 happyReduction_92
happyReduction_92 _
	(HappyAbsSyn25  happy_var_2)
	_
	 =  HappyAbsSyn25
		 (peBr happy_var_2
	)
happyReduction_92 _ _ _  = notHappyAtAll 

happyReduce_93 = happySpecReduce_3  33 happyReduction_93
happyReduction_93 _
	(HappyAbsSyn25  happy_var_2)
	_
	 =  HappyAbsSyn25
		 (peBr happy_var_2
	)
happyReduction_93 _ _ _  = notHappyAtAll 

happyReduce_94 = happySpecReduce_1  34 happyReduction_94
happyReduction_94 (HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (happy_var_1
	)
happyReduction_94 _  = notHappyAtAll 

happyReduce_95 = happySpecReduce_3  35 happyReduction_95
happyReduction_95 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (peSum happy_var_1 happy_var_3
	)
happyReduction_95 _ _ _  = notHappyAtAll 

happyReduce_96 = happySpecReduce_3  35 happyReduction_96
happyReduction_96 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (peSub happy_var_1 happy_var_3
	)
happyReduction_96 _ _ _  = notHappyAtAll 

happyReduce_97 = happySpecReduce_3  35 happyReduction_97
happyReduction_97 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (peOr (fmap getInt happy_var_1) (fmap getInt happy_var_3)
	)
happyReduction_97 _ _ _  = notHappyAtAll 

happyReduce_98 = happySpecReduce_3  35 happyReduction_98
happyReduction_98 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (peXor (fmap getInt happy_var_1) (fmap getInt happy_var_3)
	)
happyReduction_98 _ _ _  = notHappyAtAll 

happyReduce_99 = happySpecReduce_1  35 happyReduction_99
happyReduction_99 (HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (happy_var_1
	)
happyReduction_99 _  = notHappyAtAll 

happyReduce_100 = happySpecReduce_3  36 happyReduction_100
happyReduction_100 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (peMul happy_var_1 happy_var_3
	)
happyReduction_100 _ _ _  = notHappyAtAll 

happyReduce_101 = happySpecReduce_3  36 happyReduction_101
happyReduction_101 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (peDivide happy_var_1 happy_var_3
	)
happyReduction_101 _ _ _  = notHappyAtAll 

happyReduce_102 = happySpecReduce_3  36 happyReduction_102
happyReduction_102 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (peDiv (fmap getInt happy_var_1) (fmap getInt happy_var_3)
	)
happyReduction_102 _ _ _  = notHappyAtAll 

happyReduce_103 = happySpecReduce_3  36 happyReduction_103
happyReduction_103 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (peMod (fmap getInt happy_var_1) (fmap getInt happy_var_3)
	)
happyReduction_103 _ _ _  = notHappyAtAll 

happyReduce_104 = happySpecReduce_3  36 happyReduction_104
happyReduction_104 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (peAnd (fmap getInt happy_var_1) (fmap getInt happy_var_3)
	)
happyReduction_104 _ _ _  = notHappyAtAll 

happyReduce_105 = happySpecReduce_1  36 happyReduction_105
happyReduction_105 (HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (happy_var_1
	)
happyReduction_105 _  = notHappyAtAll 

happyReduce_106 = happySpecReduce_2  37 happyReduction_106
happyReduction_106 (HappyAbsSyn34  happy_var_2)
	_
	 =  HappyAbsSyn34
		 (peNot (fmap getInt happy_var_2)
	)
happyReduction_106 _ _  = notHappyAtAll 

happyReduce_107 = happySpecReduce_2  37 happyReduction_107
happyReduction_107 (HappyAbsSyn34  happy_var_2)
	_
	 =  HappyAbsSyn34
		 (peNeg happy_var_2
	)
happyReduction_107 _ _  = notHappyAtAll 

happyReduce_108 = happySpecReduce_2  37 happyReduction_108
happyReduction_108 (HappyAbsSyn34  happy_var_2)
	_
	 =  HappyAbsSyn34
		 (pePos happy_var_2
	)
happyReduction_108 _ _  = notHappyAtAll 

happyReduce_109 = happySpecReduce_1  37 happyReduction_109
happyReduction_109 (HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (happy_var_1
	)
happyReduction_109 _  = notHappyAtAll 

happyReduce_110 = happySpecReduce_1  38 happyReduction_110
happyReduction_110 (HappyTerminal (TRealNum happy_var_1))
	 =  HappyAbsSyn34
		 (peReal happy_var_1
	)
happyReduction_110 _  = notHappyAtAll 

happyReduce_111 = happySpecReduce_1  38 happyReduction_111
happyReduction_111 (HappyTerminal (TIntNum happy_var_1))
	 =  HappyAbsSyn34
		 (peInt happy_var_1
	)
happyReduction_111 _  = notHappyAtAll 

happyReduce_112 = happySpecReduce_1  38 happyReduction_112
happyReduction_112 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn34
		 (fmap getNum happy_var_1
	)
happyReduction_112 _  = notHappyAtAll 

happyReduce_113 = happySpecReduce_3  38 happyReduction_113
happyReduction_113 _
	(HappyAbsSyn34  happy_var_2)
	_
	 =  HappyAbsSyn34
		 (peBr happy_var_2
	)
happyReduction_113 _ _ _  = notHappyAtAll 

happyReduce_114 = happySpecReduce_1  39 happyReduction_114
happyReduction_114 (HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn39
		 (happy_var_1
	)
happyReduction_114 _  = notHappyAtAll 

happyReduce_115 = happySpecReduce_3  40 happyReduction_115
happyReduction_115 (HappyAbsSyn39  happy_var_3)
	_
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn39
		 (peStrSum happy_var_1 happy_var_3
	)
happyReduction_115 _ _ _  = notHappyAtAll 

happyReduce_116 = happySpecReduce_1  40 happyReduction_116
happyReduction_116 (HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn39
		 (happy_var_1
	)
happyReduction_116 _  = notHappyAtAll 

happyReduce_117 = happySpecReduce_1  41 happyReduction_117
happyReduction_117 (HappyTerminal (TStr happy_var_1))
	 =  HappyAbsSyn39
		 (peStr happy_var_1
	)
happyReduction_117 _  = notHappyAtAll 

happyReduce_118 = happySpecReduce_1  41 happyReduction_118
happyReduction_118 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn39
		 (fmap getStr happy_var_1
	)
happyReduction_118 _  = notHappyAtAll 

happyReduce_119 = happySpecReduce_3  41 happyReduction_119
happyReduction_119 _
	(HappyAbsSyn39  happy_var_2)
	_
	 =  HappyAbsSyn39
		 (peBr happy_var_2
	)
happyReduction_119 _ _ _  = notHappyAtAll 

happyReduce_120 = happySpecReduce_1  42 happyReduction_120
happyReduction_120 (HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn24
		 (peVar happy_var_1
	)
happyReduction_120 _  = notHappyAtAll 

happyReduce_121 = happyReduce 4 42 happyReduction_121
happyReduction_121 (_ `HappyStk`
	(HappyAbsSyn43  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVariable happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn24
		 (peFunApply (Var happy_var_1) happy_var_3
	) `HappyStk` happyRest

happyReduce_122 = happySpecReduce_3  42 happyReduction_122
happyReduction_122 _
	_
	(HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn24
		 (peFunApply (Var happy_var_1) []
	)
happyReduction_122 _ _ _  = notHappyAtAll 

happyReduce_123 = happySpecReduce_3  43 happyReduction_123
happyReduction_123 (HappyAbsSyn43  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn43
		 (happy_var_1 : happy_var_3
	)
happyReduction_123 _ _ _  = notHappyAtAll 

happyReduce_124 = happySpecReduce_1  43 happyReduction_124
happyReduction_124 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn43
		 ([happy_var_1]
	)
happyReduction_124 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 86 86 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TStr happy_dollar_dollar -> cont 44;
	TBool happy_dollar_dollar -> cont 45;
	TType happy_dollar_dollar -> cont 46;
	TLeftParen -> cont 47;
	TRightParen -> cont 48;
	TColon -> cont 49;
	TSemicolon -> cont 50;
	TComma -> cont 51;
	TDot -> cont 52;
	TVar -> cont 53;
	TBegin -> cont 54;
	TEnd -> cont 55;
	TFunction -> cont 56;
	TProcedure -> cont 57;
	TReadln -> cont 58;
	TWrite -> cont 59;
	TWriteln -> cont 60;
	TWhile -> cont 61;
	TDo -> cont 62;
	TIf -> cont 63;
	TThen -> cont 64;
	TElse -> cont 65;
	TAssign -> cont 66;
	TSum -> cont 67;
	TSub -> cont 68;
	TMul -> cont 69;
	TDivide -> cont 70;
	TDiv -> cont 71;
	TMod -> cont 72;
	TLT -> cont 73;
	TGT -> cont 74;
	TLTE -> cont 75;
	TGTE -> cont 76;
	TEq -> cont 77;
	TNotEq -> cont 78;
	TAnd -> cont 79;
	TOr -> cont 80;
	TNot -> cont 81;
	TXor -> cont 82;
	TVariable happy_dollar_dollar -> cont 83;
	TRealNum happy_dollar_dollar -> cont 84;
	TIntNum happy_dollar_dollar -> cont 85;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 86 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parseProgram tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
  peSum       :: expr Number -> expr Number -> expr Number
  peSub       :: expr Number -> expr Number -> expr Number
  peBOr       :: expr Bool -> expr Bool -> expr Bool
  peOr        :: expr Integer -> expr Integer -> expr Number
  peBXor      :: expr Bool -> expr Bool -> expr Bool
  peXor       :: expr Integer -> expr Integer -> expr Number
  peMul       :: expr Number -> expr Number -> expr Number
  peDivide    :: expr Number -> expr Number -> expr Number
  peDiv       :: expr Integer -> expr Integer -> expr Number
  peMod       :: expr Integer -> expr Integer -> expr Number
  peBAnd      :: expr Bool -> expr Bool -> expr Bool
  peAnd       :: expr Integer -> expr Integer -> expr Number
  peBNot      :: expr Bool -> expr Bool
  peNot       :: expr Integer -> expr Number
  peNeg       :: expr Number -> expr Number
  pePos       :: expr Number -> expr Number
  peVar       :: String -> expr Variable
  peReal      :: Float -> expr Number
  peInt       :: Integer -> expr Number
  peStr       :: String -> expr String
  peBool      :: Bool -> expr Bool
  peBr        :: expr t -> expr t

parseError :: [Token] -> e
parseError _ = error "Error while parsing"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
