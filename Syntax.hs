{-# OPTIONS_GHC -w #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE RankNTypes #-}

module Syntax where
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
	| HappyAbsSyn11 (((Prgm, Prgm), [Prgm]))
	| HappyAbsSyn15 (forall expr. PascalExpr expr => expr ())
	| HappyAbsSyn22 (forall expr. PascalExpr expr => [expr ()])

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
 action_178 :: () => Prelude.Int -> ({-HappyReduction (HappyIdentity) = -}
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
 happyReduce_76 :: () => ({-HappyReduction (HappyIdentity) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (HappyIdentity) HappyAbsSyn)

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,408) ([0,32768,13,0,0,0,2,0,0,0,192,0,0,0,0,0,16,0,0,0,0,0,13312,0,0,0,4096,0,0,0,0,3,0,0,4096,0,0,0,0,6088,0,1,0,0,0,4,0,0,0,16,0,2,0,0,0,8,0,0,0,8192,0,0,0,1024,0,0,0,16384,0,0,0,2048,0,0,0,8192,0,0,0,32768,0,0,0,0,2,0,0,0,11,768,1856,0,44,3072,7424,0,0,2048,0,0,32768,1,0,0,0,0,0,0,0,24352,0,4,0,64,0,0,0,61952,5,64,0,512,0,0,0,0,0,1024,0,512,0,0,0,8192,0,0,0,0,4,0,0,0,24320,0,4,0,0,0,16,0,1,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,16384,0,0,0,0,6088,0,1,0,32,0,0,0,16,0,0,0,256,0,0,0,51200,23,256,0,44,3072,7424,0,0,512,252,0,0,49152,10240,0,0,0,4156,0,0,0,0,0,0,0,0,0,0,0,0,0,0,11,768,1856,0,44,3072,7424,0,176,12288,29696,0,704,49152,53248,1,2048,0,0,0,0,0,0,0,0,0,0,0,0,0,61442,3,0,11,768,1856,0,44,3072,7424,0,176,12288,29696,0,704,49152,53248,1,0,0,0,0,0,24320,0,4,0,16,0,0,0,4,0,64,0,0,0,256,0,128,0,0,0,256,0,0,0,4096,0,0,0,4096,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,0,16,49152,15,0,64,0,63,0,256,0,252,0,1024,0,1008,0,0,6084,0,1,11264,0,12,29,45056,0,48,116,49152,2,192,464,0,11,768,1856,0,44,3072,7424,0,176,12288,29696,0,704,49152,53248,1,0,0,0,0,0,0,0,0,0,0,0,0,0,4,61440,3,0,11,768,1856,0,44,3072,7424,0,176,12288,29696,0,704,49152,53248,1,2816,0,16387,7,11264,0,12,29,45056,0,48,116,49152,2,192,464,0,11,768,1856,0,0,256,0,0,16384,380,4096,0,0,0,1008,0,0,8,0,0,0,1,0,0,0,31872,1,16,0,0,0,0,0,256,0,0,0,8192,0,0,0,4096,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,8,0,0,0,1,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,95,1024,0,0,0,0,0,0,1521,16384,0,0,0,4156,0,0,0,16624,0,0,0,960,1,0,0,3840,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,64512,0,0,4,0,0,0,0,768,160,0,0,3072,640,0,0,12288,2560,0,0,49152,10240,0,0,0,40963,0,0,0,32780,2,0,0,0,0,0,61440,5,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,32768,0,0,0,0,0,0,16,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,49152,2,192,464,0,0,0,0,0,0,95,1024,0,32768,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseProgram","Program","DefVarBlocks","DefVarBlock","DefVar","Variables","Functions","Function","DefFunction","Arguments","Argument","Operators","Operator","ThenPart","ElsePart","Expression","SumSubOrXor","MulDivAnd","Unary","PassedArgs","qstring","bool","type","\"(\"","\")\"","\":\"","\";\"","\",\"","\".\"","\"var\"","\"begin\"","\"end\"","\"function\"","\"procedure\"","\"read\"","\"readln\"","\"write\"","\"writeln\"","\"while\"","\"do\"","\"if\"","\"then\"","\"else\"","\":=\"","\"+\"","\"-\"","\"*\"","\"/\"","\"div\"","\"mod\"","\"<\"","\">\"","\"<=\"","\">=\"","\"=\"","\"<>\"","\"and\"","\"or\"","\"not\"","\"xor\"","variable","real","int","%eof"]
        bit_start = st Prelude.* 66
        bit_end = (st Prelude.+ 1) Prelude.* 66
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..65]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (32) = happyShift action_3
action_0 (33) = happyShift action_9
action_0 (35) = happyShift action_10
action_0 (36) = happyShift action_11
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_5
action_0 (9) = happyGoto action_6
action_0 (10) = happyGoto action_7
action_0 (11) = happyGoto action_8
action_0 _ = happyReduce_9

action_1 (32) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (35) = happyShift action_10
action_2 (36) = happyShift action_11
action_2 (9) = happyGoto action_33
action_2 (10) = happyGoto action_7
action_2 (11) = happyGoto action_8
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (63) = happyShift action_32
action_3 (6) = happyGoto action_29
action_3 (7) = happyGoto action_30
action_3 (8) = happyGoto action_31
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (66) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (33) = happyShift action_28
action_5 (35) = happyShift action_10
action_5 (36) = happyShift action_11
action_5 (9) = happyGoto action_27
action_5 (10) = happyGoto action_7
action_5 (11) = happyGoto action_8
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (33) = happyShift action_26
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (35) = happyShift action_10
action_7 (36) = happyShift action_11
action_7 (9) = happyGoto action_25
action_7 (10) = happyGoto action_7
action_7 (11) = happyGoto action_8
action_7 _ = happyReduce_18

action_8 (29) = happyShift action_24
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (34) = happyShift action_16
action_9 (37) = happyShift action_17
action_9 (38) = happyShift action_18
action_9 (39) = happyShift action_19
action_9 (40) = happyShift action_20
action_9 (41) = happyShift action_21
action_9 (43) = happyShift action_22
action_9 (63) = happyShift action_23
action_9 (14) = happyGoto action_14
action_9 (15) = happyGoto action_15
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (63) = happyShift action_13
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (63) = happyShift action_12
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (26) = happyShift action_69
action_12 _ = happyReduce_26

action_13 (26) = happyShift action_68
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (34) = happyShift action_67
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (29) = happyShift action_66
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (31) = happyShift action_65
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (26) = happyShift action_64
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (26) = happyShift action_63
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (26) = happyShift action_62
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (26) = happyShift action_61
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (23) = happyShift action_51
action_21 (24) = happyShift action_52
action_21 (26) = happyShift action_53
action_21 (47) = happyShift action_54
action_21 (48) = happyShift action_55
action_21 (61) = happyShift action_56
action_21 (63) = happyShift action_57
action_21 (64) = happyShift action_58
action_21 (65) = happyShift action_59
action_21 (18) = happyGoto action_60
action_21 (19) = happyGoto action_48
action_21 (20) = happyGoto action_49
action_21 (21) = happyGoto action_50
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (23) = happyShift action_51
action_22 (24) = happyShift action_52
action_22 (26) = happyShift action_53
action_22 (47) = happyShift action_54
action_22 (48) = happyShift action_55
action_22 (61) = happyShift action_56
action_22 (63) = happyShift action_57
action_22 (64) = happyShift action_58
action_22 (65) = happyShift action_59
action_22 (18) = happyGoto action_47
action_22 (19) = happyGoto action_48
action_22 (20) = happyGoto action_49
action_22 (21) = happyGoto action_50
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (46) = happyShift action_46
action_23 _ = happyReduce_41

action_24 (32) = happyShift action_3
action_24 (33) = happyShift action_45
action_24 (5) = happyGoto action_44
action_24 _ = happyFail (happyExpListPerState 24)

action_25 _ = happyReduce_17

action_26 (34) = happyShift action_43
action_26 (37) = happyShift action_17
action_26 (38) = happyShift action_18
action_26 (39) = happyShift action_19
action_26 (40) = happyShift action_20
action_26 (41) = happyShift action_21
action_26 (43) = happyShift action_22
action_26 (63) = happyShift action_23
action_26 (14) = happyGoto action_42
action_26 (15) = happyGoto action_15
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (33) = happyShift action_41
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (34) = happyShift action_40
action_28 (37) = happyShift action_17
action_28 (38) = happyShift action_18
action_28 (39) = happyShift action_19
action_28 (40) = happyShift action_20
action_28 (41) = happyShift action_21
action_28 (43) = happyShift action_22
action_28 (63) = happyShift action_23
action_28 (14) = happyGoto action_39
action_28 (15) = happyGoto action_15
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (32) = happyShift action_3
action_29 (5) = happyGoto action_38
action_29 _ = happyReduce_11

action_30 (63) = happyShift action_32
action_30 (6) = happyGoto action_37
action_30 (7) = happyGoto action_30
action_30 (8) = happyGoto action_31
action_30 _ = happyReduce_13

action_31 (28) = happyShift action_36
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (30) = happyShift action_35
action_32 _ = happyReduce_16

action_33 (33) = happyShift action_34
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (37) = happyShift action_17
action_34 (38) = happyShift action_18
action_34 (39) = happyShift action_19
action_34 (40) = happyShift action_20
action_34 (41) = happyShift action_21
action_34 (43) = happyShift action_22
action_34 (63) = happyShift action_23
action_34 (14) = happyGoto action_110
action_34 (15) = happyGoto action_15
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (63) = happyShift action_32
action_35 (8) = happyGoto action_115
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (25) = happyShift action_114
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_12

action_38 _ = happyReduce_10

action_39 (34) = happyShift action_113
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (31) = happyShift action_112
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (34) = happyShift action_111
action_41 (37) = happyShift action_17
action_41 (38) = happyShift action_18
action_41 (39) = happyShift action_19
action_41 (40) = happyShift action_20
action_41 (41) = happyShift action_21
action_41 (43) = happyShift action_22
action_41 (63) = happyShift action_23
action_41 (14) = happyGoto action_110
action_41 (15) = happyGoto action_15
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (34) = happyShift action_109
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (31) = happyShift action_108
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (33) = happyShift action_107
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (34) = happyShift action_106
action_45 (37) = happyShift action_17
action_45 (38) = happyShift action_18
action_45 (39) = happyShift action_19
action_45 (40) = happyShift action_20
action_45 (41) = happyShift action_21
action_45 (43) = happyShift action_22
action_45 (63) = happyShift action_23
action_45 (14) = happyGoto action_105
action_45 (15) = happyGoto action_15
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (23) = happyShift action_51
action_46 (24) = happyShift action_52
action_46 (26) = happyShift action_53
action_46 (47) = happyShift action_54
action_46 (48) = happyShift action_55
action_46 (61) = happyShift action_56
action_46 (63) = happyShift action_57
action_46 (64) = happyShift action_58
action_46 (65) = happyShift action_59
action_46 (18) = happyGoto action_104
action_46 (19) = happyGoto action_48
action_46 (20) = happyGoto action_49
action_46 (21) = happyGoto action_50
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (44) = happyShift action_103
action_47 (53) = happyShift action_82
action_47 (54) = happyShift action_83
action_47 (55) = happyShift action_84
action_47 (56) = happyShift action_85
action_47 (57) = happyShift action_86
action_47 (58) = happyShift action_87
action_47 (16) = happyGoto action_102
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (47) = happyShift action_98
action_48 (48) = happyShift action_99
action_48 (60) = happyShift action_100
action_48 (62) = happyShift action_101
action_48 _ = happyReduce_52

action_49 (49) = happyShift action_93
action_49 (50) = happyShift action_94
action_49 (51) = happyShift action_95
action_49 (52) = happyShift action_96
action_49 (59) = happyShift action_97
action_49 _ = happyReduce_57

action_50 _ = happyReduce_63

action_51 _ = happyReduce_71

action_52 _ = happyReduce_72

action_53 (23) = happyShift action_51
action_53 (24) = happyShift action_52
action_53 (26) = happyShift action_53
action_53 (47) = happyShift action_54
action_53 (48) = happyShift action_55
action_53 (61) = happyShift action_56
action_53 (63) = happyShift action_57
action_53 (64) = happyShift action_58
action_53 (65) = happyShift action_59
action_53 (18) = happyGoto action_92
action_53 (19) = happyGoto action_48
action_53 (20) = happyGoto action_49
action_53 (21) = happyGoto action_50
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (23) = happyShift action_51
action_54 (24) = happyShift action_52
action_54 (26) = happyShift action_53
action_54 (47) = happyShift action_54
action_54 (48) = happyShift action_55
action_54 (61) = happyShift action_56
action_54 (63) = happyShift action_57
action_54 (64) = happyShift action_58
action_54 (65) = happyShift action_59
action_54 (21) = happyGoto action_91
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (23) = happyShift action_51
action_55 (24) = happyShift action_52
action_55 (26) = happyShift action_53
action_55 (47) = happyShift action_54
action_55 (48) = happyShift action_55
action_55 (61) = happyShift action_56
action_55 (63) = happyShift action_57
action_55 (64) = happyShift action_58
action_55 (65) = happyShift action_59
action_55 (21) = happyGoto action_90
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (23) = happyShift action_51
action_56 (24) = happyShift action_52
action_56 (26) = happyShift action_53
action_56 (47) = happyShift action_54
action_56 (48) = happyShift action_55
action_56 (61) = happyShift action_56
action_56 (63) = happyShift action_57
action_56 (64) = happyShift action_58
action_56 (65) = happyShift action_59
action_56 (21) = happyGoto action_89
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (26) = happyShift action_88
action_57 _ = happyReduce_68

action_58 _ = happyReduce_69

action_59 _ = happyReduce_70

action_60 (42) = happyShift action_81
action_60 (53) = happyShift action_82
action_60 (54) = happyShift action_83
action_60 (55) = happyShift action_84
action_60 (56) = happyShift action_85
action_60 (57) = happyShift action_86
action_60 (58) = happyShift action_87
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (23) = happyShift action_51
action_61 (24) = happyShift action_52
action_61 (26) = happyShift action_53
action_61 (47) = happyShift action_54
action_61 (48) = happyShift action_55
action_61 (61) = happyShift action_56
action_61 (63) = happyShift action_57
action_61 (64) = happyShift action_58
action_61 (65) = happyShift action_59
action_61 (18) = happyGoto action_80
action_61 (19) = happyGoto action_48
action_61 (20) = happyGoto action_49
action_61 (21) = happyGoto action_50
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (23) = happyShift action_51
action_62 (24) = happyShift action_52
action_62 (26) = happyShift action_53
action_62 (47) = happyShift action_54
action_62 (48) = happyShift action_55
action_62 (61) = happyShift action_56
action_62 (63) = happyShift action_57
action_62 (64) = happyShift action_58
action_62 (65) = happyShift action_59
action_62 (18) = happyGoto action_79
action_62 (19) = happyGoto action_48
action_62 (20) = happyGoto action_49
action_62 (21) = happyGoto action_50
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (23) = happyShift action_51
action_63 (24) = happyShift action_52
action_63 (26) = happyShift action_53
action_63 (47) = happyShift action_54
action_63 (48) = happyShift action_55
action_63 (61) = happyShift action_56
action_63 (63) = happyShift action_57
action_63 (64) = happyShift action_58
action_63 (65) = happyShift action_59
action_63 (18) = happyGoto action_78
action_63 (19) = happyGoto action_48
action_63 (20) = happyGoto action_49
action_63 (21) = happyGoto action_50
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (23) = happyShift action_51
action_64 (24) = happyShift action_52
action_64 (26) = happyShift action_53
action_64 (47) = happyShift action_54
action_64 (48) = happyShift action_55
action_64 (61) = happyShift action_56
action_64 (63) = happyShift action_57
action_64 (64) = happyShift action_58
action_64 (65) = happyShift action_59
action_64 (18) = happyGoto action_77
action_64 (19) = happyGoto action_48
action_64 (20) = happyGoto action_49
action_64 (21) = happyGoto action_50
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_8

action_66 (37) = happyShift action_17
action_66 (38) = happyShift action_18
action_66 (39) = happyShift action_19
action_66 (40) = happyShift action_20
action_66 (41) = happyShift action_21
action_66 (43) = happyShift action_22
action_66 (63) = happyShift action_23
action_66 (14) = happyGoto action_76
action_66 (15) = happyGoto action_15
action_66 _ = happyReduce_31

action_67 (31) = happyShift action_75
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (27) = happyShift action_74
action_68 (63) = happyShift action_32
action_68 (8) = happyGoto action_70
action_68 (12) = happyGoto action_73
action_68 (13) = happyGoto action_72
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (63) = happyShift action_32
action_69 (8) = happyGoto action_70
action_69 (12) = happyGoto action_71
action_69 (13) = happyGoto action_72
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (28) = happyShift action_157
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (27) = happyShift action_156
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (29) = happyShift action_155
action_72 _ = happyReduce_28

action_73 (27) = happyShift action_154
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (28) = happyShift action_153
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_5

action_76 _ = happyReduce_30

action_77 (27) = happyShift action_152
action_77 (53) = happyShift action_82
action_77 (54) = happyShift action_83
action_77 (55) = happyShift action_84
action_77 (56) = happyShift action_85
action_77 (57) = happyShift action_86
action_77 (58) = happyShift action_87
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (27) = happyShift action_151
action_78 (53) = happyShift action_82
action_78 (54) = happyShift action_83
action_78 (55) = happyShift action_84
action_78 (56) = happyShift action_85
action_78 (57) = happyShift action_86
action_78 (58) = happyShift action_87
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (27) = happyShift action_150
action_79 (53) = happyShift action_82
action_79 (54) = happyShift action_83
action_79 (55) = happyShift action_84
action_79 (56) = happyShift action_85
action_79 (57) = happyShift action_86
action_79 (58) = happyShift action_87
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (27) = happyShift action_149
action_80 (53) = happyShift action_82
action_80 (54) = happyShift action_83
action_80 (55) = happyShift action_84
action_80 (56) = happyShift action_85
action_80 (57) = happyShift action_86
action_80 (58) = happyShift action_87
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (33) = happyShift action_148
action_81 (37) = happyShift action_17
action_81 (38) = happyShift action_18
action_81 (39) = happyShift action_19
action_81 (40) = happyShift action_20
action_81 (41) = happyShift action_21
action_81 (43) = happyShift action_22
action_81 (63) = happyShift action_23
action_81 (15) = happyGoto action_147
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (23) = happyShift action_51
action_82 (24) = happyShift action_52
action_82 (26) = happyShift action_53
action_82 (47) = happyShift action_54
action_82 (48) = happyShift action_55
action_82 (61) = happyShift action_56
action_82 (63) = happyShift action_57
action_82 (64) = happyShift action_58
action_82 (65) = happyShift action_59
action_82 (19) = happyGoto action_146
action_82 (20) = happyGoto action_49
action_82 (21) = happyGoto action_50
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (23) = happyShift action_51
action_83 (24) = happyShift action_52
action_83 (26) = happyShift action_53
action_83 (47) = happyShift action_54
action_83 (48) = happyShift action_55
action_83 (61) = happyShift action_56
action_83 (63) = happyShift action_57
action_83 (64) = happyShift action_58
action_83 (65) = happyShift action_59
action_83 (19) = happyGoto action_145
action_83 (20) = happyGoto action_49
action_83 (21) = happyGoto action_50
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (23) = happyShift action_51
action_84 (24) = happyShift action_52
action_84 (26) = happyShift action_53
action_84 (47) = happyShift action_54
action_84 (48) = happyShift action_55
action_84 (61) = happyShift action_56
action_84 (63) = happyShift action_57
action_84 (64) = happyShift action_58
action_84 (65) = happyShift action_59
action_84 (19) = happyGoto action_144
action_84 (20) = happyGoto action_49
action_84 (21) = happyGoto action_50
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (23) = happyShift action_51
action_85 (24) = happyShift action_52
action_85 (26) = happyShift action_53
action_85 (47) = happyShift action_54
action_85 (48) = happyShift action_55
action_85 (61) = happyShift action_56
action_85 (63) = happyShift action_57
action_85 (64) = happyShift action_58
action_85 (65) = happyShift action_59
action_85 (19) = happyGoto action_143
action_85 (20) = happyGoto action_49
action_85 (21) = happyGoto action_50
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (23) = happyShift action_51
action_86 (24) = happyShift action_52
action_86 (26) = happyShift action_53
action_86 (47) = happyShift action_54
action_86 (48) = happyShift action_55
action_86 (61) = happyShift action_56
action_86 (63) = happyShift action_57
action_86 (64) = happyShift action_58
action_86 (65) = happyShift action_59
action_86 (19) = happyGoto action_142
action_86 (20) = happyGoto action_49
action_86 (21) = happyGoto action_50
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (23) = happyShift action_51
action_87 (24) = happyShift action_52
action_87 (26) = happyShift action_53
action_87 (47) = happyShift action_54
action_87 (48) = happyShift action_55
action_87 (61) = happyShift action_56
action_87 (63) = happyShift action_57
action_87 (64) = happyShift action_58
action_87 (65) = happyShift action_59
action_87 (19) = happyGoto action_141
action_87 (20) = happyGoto action_49
action_87 (21) = happyGoto action_50
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (23) = happyShift action_51
action_88 (24) = happyShift action_52
action_88 (26) = happyShift action_53
action_88 (47) = happyShift action_54
action_88 (48) = happyShift action_55
action_88 (61) = happyShift action_56
action_88 (63) = happyShift action_57
action_88 (64) = happyShift action_58
action_88 (65) = happyShift action_59
action_88 (18) = happyGoto action_139
action_88 (19) = happyGoto action_48
action_88 (20) = happyGoto action_49
action_88 (21) = happyGoto action_50
action_88 (22) = happyGoto action_140
action_88 _ = happyReduce_76

action_89 _ = happyReduce_64

action_90 _ = happyReduce_65

action_91 _ = happyReduce_66

action_92 (27) = happyShift action_138
action_92 (53) = happyShift action_82
action_92 (54) = happyShift action_83
action_92 (55) = happyShift action_84
action_92 (56) = happyShift action_85
action_92 (57) = happyShift action_86
action_92 (58) = happyShift action_87
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (23) = happyShift action_51
action_93 (24) = happyShift action_52
action_93 (26) = happyShift action_53
action_93 (47) = happyShift action_54
action_93 (48) = happyShift action_55
action_93 (61) = happyShift action_56
action_93 (63) = happyShift action_57
action_93 (64) = happyShift action_58
action_93 (65) = happyShift action_59
action_93 (21) = happyGoto action_137
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (23) = happyShift action_51
action_94 (24) = happyShift action_52
action_94 (26) = happyShift action_53
action_94 (47) = happyShift action_54
action_94 (48) = happyShift action_55
action_94 (61) = happyShift action_56
action_94 (63) = happyShift action_57
action_94 (64) = happyShift action_58
action_94 (65) = happyShift action_59
action_94 (21) = happyGoto action_136
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (23) = happyShift action_51
action_95 (24) = happyShift action_52
action_95 (26) = happyShift action_53
action_95 (47) = happyShift action_54
action_95 (48) = happyShift action_55
action_95 (61) = happyShift action_56
action_95 (63) = happyShift action_57
action_95 (64) = happyShift action_58
action_95 (65) = happyShift action_59
action_95 (21) = happyGoto action_135
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (23) = happyShift action_51
action_96 (24) = happyShift action_52
action_96 (26) = happyShift action_53
action_96 (47) = happyShift action_54
action_96 (48) = happyShift action_55
action_96 (61) = happyShift action_56
action_96 (63) = happyShift action_57
action_96 (64) = happyShift action_58
action_96 (65) = happyShift action_59
action_96 (21) = happyGoto action_134
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (23) = happyShift action_51
action_97 (24) = happyShift action_52
action_97 (26) = happyShift action_53
action_97 (47) = happyShift action_54
action_97 (48) = happyShift action_55
action_97 (61) = happyShift action_56
action_97 (63) = happyShift action_57
action_97 (64) = happyShift action_58
action_97 (65) = happyShift action_59
action_97 (21) = happyGoto action_133
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (23) = happyShift action_51
action_98 (24) = happyShift action_52
action_98 (26) = happyShift action_53
action_98 (47) = happyShift action_54
action_98 (48) = happyShift action_55
action_98 (61) = happyShift action_56
action_98 (63) = happyShift action_57
action_98 (64) = happyShift action_58
action_98 (65) = happyShift action_59
action_98 (20) = happyGoto action_132
action_98 (21) = happyGoto action_50
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (23) = happyShift action_51
action_99 (24) = happyShift action_52
action_99 (26) = happyShift action_53
action_99 (47) = happyShift action_54
action_99 (48) = happyShift action_55
action_99 (61) = happyShift action_56
action_99 (63) = happyShift action_57
action_99 (64) = happyShift action_58
action_99 (65) = happyShift action_59
action_99 (20) = happyGoto action_131
action_99 (21) = happyGoto action_50
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (23) = happyShift action_51
action_100 (24) = happyShift action_52
action_100 (26) = happyShift action_53
action_100 (47) = happyShift action_54
action_100 (48) = happyShift action_55
action_100 (61) = happyShift action_56
action_100 (63) = happyShift action_57
action_100 (64) = happyShift action_58
action_100 (65) = happyShift action_59
action_100 (20) = happyGoto action_130
action_100 (21) = happyGoto action_50
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (23) = happyShift action_51
action_101 (24) = happyShift action_52
action_101 (26) = happyShift action_53
action_101 (47) = happyShift action_54
action_101 (48) = happyShift action_55
action_101 (61) = happyShift action_56
action_101 (63) = happyShift action_57
action_101 (64) = happyShift action_58
action_101 (65) = happyShift action_59
action_101 (20) = happyGoto action_129
action_101 (21) = happyGoto action_50
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (45) = happyShift action_128
action_102 (17) = happyGoto action_127
action_102 _ = happyReduce_40

action_103 (33) = happyShift action_126
action_103 (37) = happyShift action_17
action_103 (38) = happyShift action_18
action_103 (39) = happyShift action_19
action_103 (40) = happyShift action_20
action_103 (41) = happyShift action_21
action_103 (43) = happyShift action_22
action_103 (63) = happyShift action_23
action_103 (15) = happyGoto action_125
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (53) = happyShift action_82
action_104 (54) = happyShift action_83
action_104 (55) = happyShift action_84
action_104 (56) = happyShift action_85
action_104 (57) = happyShift action_86
action_104 (58) = happyShift action_87
action_104 _ = happyReduce_32

action_105 (34) = happyShift action_124
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (29) = happyShift action_123
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (34) = happyShift action_122
action_107 (37) = happyShift action_17
action_107 (38) = happyShift action_18
action_107 (39) = happyShift action_19
action_107 (40) = happyShift action_20
action_107 (41) = happyShift action_21
action_107 (43) = happyShift action_22
action_107 (63) = happyShift action_23
action_107 (14) = happyGoto action_121
action_107 (15) = happyGoto action_15
action_107 _ = happyFail (happyExpListPerState 107)

action_108 _ = happyReduce_6

action_109 (31) = happyShift action_120
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (34) = happyShift action_119
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (31) = happyShift action_118
action_111 _ = happyFail (happyExpListPerState 111)

action_112 _ = happyReduce_7

action_113 (31) = happyShift action_117
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (29) = happyShift action_116
action_114 _ = happyFail (happyExpListPerState 114)

action_115 _ = happyReduce_15

action_116 _ = happyReduce_14

action_117 _ = happyReduce_2

action_118 _ = happyReduce_4

action_119 (31) = happyShift action_171
action_119 _ = happyFail (happyExpListPerState 119)

action_120 _ = happyReduce_3

action_121 (34) = happyShift action_170
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (29) = happyShift action_169
action_122 _ = happyFail (happyExpListPerState 122)

action_123 _ = happyReduce_22

action_124 (29) = happyShift action_168
action_124 _ = happyFail (happyExpListPerState 124)

action_125 _ = happyReduce_43

action_126 (37) = happyShift action_17
action_126 (38) = happyShift action_18
action_126 (39) = happyShift action_19
action_126 (40) = happyShift action_20
action_126 (41) = happyShift action_21
action_126 (43) = happyShift action_22
action_126 (63) = happyShift action_23
action_126 (14) = happyGoto action_167
action_126 (15) = happyGoto action_15
action_126 _ = happyFail (happyExpListPerState 126)

action_127 _ = happyReduce_39

action_128 (33) = happyShift action_166
action_128 (37) = happyShift action_17
action_128 (38) = happyShift action_18
action_128 (39) = happyShift action_19
action_128 (40) = happyShift action_20
action_128 (41) = happyShift action_21
action_128 (43) = happyShift action_22
action_128 (63) = happyShift action_23
action_128 (15) = happyGoto action_165
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (49) = happyShift action_93
action_129 (50) = happyShift action_94
action_129 (51) = happyShift action_95
action_129 (52) = happyShift action_96
action_129 (59) = happyShift action_97
action_129 _ = happyReduce_56

action_130 (49) = happyShift action_93
action_130 (50) = happyShift action_94
action_130 (51) = happyShift action_95
action_130 (52) = happyShift action_96
action_130 (59) = happyShift action_97
action_130 _ = happyReduce_55

action_131 (49) = happyShift action_93
action_131 (50) = happyShift action_94
action_131 (51) = happyShift action_95
action_131 (52) = happyShift action_96
action_131 (59) = happyShift action_97
action_131 _ = happyReduce_54

action_132 (49) = happyShift action_93
action_132 (50) = happyShift action_94
action_132 (51) = happyShift action_95
action_132 (52) = happyShift action_96
action_132 (59) = happyShift action_97
action_132 _ = happyReduce_53

action_133 _ = happyReduce_62

action_134 _ = happyReduce_61

action_135 _ = happyReduce_60

action_136 _ = happyReduce_59

action_137 _ = happyReduce_58

action_138 _ = happyReduce_73

action_139 (30) = happyShift action_164
action_139 (53) = happyShift action_82
action_139 (54) = happyShift action_83
action_139 (55) = happyShift action_84
action_139 (56) = happyShift action_85
action_139 (57) = happyShift action_86
action_139 (58) = happyShift action_87
action_139 _ = happyReduce_75

action_140 (27) = happyShift action_163
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (47) = happyShift action_98
action_141 (48) = happyShift action_99
action_141 (60) = happyShift action_100
action_141 (62) = happyShift action_101
action_141 _ = happyReduce_51

action_142 (47) = happyShift action_98
action_142 (48) = happyShift action_99
action_142 (60) = happyShift action_100
action_142 (62) = happyShift action_101
action_142 _ = happyReduce_50

action_143 (47) = happyShift action_98
action_143 (48) = happyShift action_99
action_143 (60) = happyShift action_100
action_143 (62) = happyShift action_101
action_143 _ = happyReduce_49

action_144 (47) = happyShift action_98
action_144 (48) = happyShift action_99
action_144 (60) = happyShift action_100
action_144 (62) = happyShift action_101
action_144 _ = happyReduce_48

action_145 (47) = happyShift action_98
action_145 (48) = happyShift action_99
action_145 (60) = happyShift action_100
action_145 (62) = happyShift action_101
action_145 _ = happyReduce_47

action_146 (47) = happyShift action_98
action_146 (48) = happyShift action_99
action_146 (60) = happyShift action_100
action_146 (62) = happyShift action_101
action_146 _ = happyReduce_46

action_147 _ = happyReduce_38

action_148 (37) = happyShift action_17
action_148 (38) = happyShift action_18
action_148 (39) = happyShift action_19
action_148 (40) = happyShift action_20
action_148 (41) = happyShift action_21
action_148 (43) = happyShift action_22
action_148 (63) = happyShift action_23
action_148 (14) = happyGoto action_162
action_148 (15) = happyGoto action_15
action_148 _ = happyFail (happyExpListPerState 148)

action_149 _ = happyReduce_36

action_150 _ = happyReduce_35

action_151 _ = happyReduce_34

action_152 _ = happyReduce_33

action_153 (25) = happyShift action_161
action_153 _ = happyFail (happyExpListPerState 153)

action_154 (28) = happyShift action_160
action_154 _ = happyFail (happyExpListPerState 154)

action_155 (63) = happyShift action_32
action_155 (8) = happyGoto action_70
action_155 (12) = happyGoto action_159
action_155 (13) = happyGoto action_72
action_155 _ = happyFail (happyExpListPerState 155)

action_156 _ = happyReduce_25

action_157 (25) = happyShift action_158
action_157 _ = happyFail (happyExpListPerState 157)

action_158 _ = happyReduce_29

action_159 _ = happyReduce_27

action_160 (25) = happyShift action_177
action_160 _ = happyFail (happyExpListPerState 160)

action_161 _ = happyReduce_24

action_162 (34) = happyShift action_176
action_162 _ = happyFail (happyExpListPerState 162)

action_163 _ = happyReduce_67

action_164 (23) = happyShift action_51
action_164 (24) = happyShift action_52
action_164 (26) = happyShift action_53
action_164 (47) = happyShift action_54
action_164 (48) = happyShift action_55
action_164 (61) = happyShift action_56
action_164 (63) = happyShift action_57
action_164 (64) = happyShift action_58
action_164 (65) = happyShift action_59
action_164 (18) = happyGoto action_139
action_164 (19) = happyGoto action_48
action_164 (20) = happyGoto action_49
action_164 (21) = happyGoto action_50
action_164 (22) = happyGoto action_175
action_164 _ = happyReduce_76

action_165 _ = happyReduce_45

action_166 (37) = happyShift action_17
action_166 (38) = happyShift action_18
action_166 (39) = happyShift action_19
action_166 (40) = happyShift action_20
action_166 (41) = happyShift action_21
action_166 (43) = happyShift action_22
action_166 (63) = happyShift action_23
action_166 (14) = happyGoto action_174
action_166 (15) = happyGoto action_15
action_166 _ = happyFail (happyExpListPerState 166)

action_167 (34) = happyShift action_173
action_167 _ = happyFail (happyExpListPerState 167)

action_168 _ = happyReduce_20

action_169 _ = happyReduce_21

action_170 (29) = happyShift action_172
action_170 _ = happyFail (happyExpListPerState 170)

action_171 _ = happyReduce_1

action_172 _ = happyReduce_19

action_173 _ = happyReduce_42

action_174 (34) = happyShift action_178
action_174 _ = happyFail (happyExpListPerState 174)

action_175 _ = happyReduce_74

action_176 _ = happyReduce_37

action_177 _ = happyReduce_23

action_178 _ = happyReduce_44

happyReduce_1 = happyReduce 6 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
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
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Program happy_var_1 [] happy_var_3
	) `HappyStk` happyRest

happyReduce_3 = happyReduce 5 4 happyReduction_3
happyReduction_3 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
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
	(HappyAbsSyn5  happy_var_2) `HappyStk`
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
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Function happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 6 10 happyReduction_20
happyReduction_20 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
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
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Function happy_var_1 happy_var_3 []
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 5 10 happyReduction_22
happyReduction_22 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
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
	 = HappyAbsSyn11
		 (((Var happy_var_2, Type happy_var_7), happy_var_4)
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 6 11 happyReduction_24
happyReduction_24 ((HappyTerminal (TType happy_var_6)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVariable happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (((Var happy_var_2, Type happy_var_6), [])
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 5 11 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVariable happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (((Var happy_var_2, Type ""), happy_var_4)
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_2  11 happyReduction_26
happyReduction_26 (HappyTerminal (TVariable happy_var_2))
	_
	 =  HappyAbsSyn11
		 (((Var happy_var_2, Type ""), [])
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
happyReduction_30 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn5
		 ((Operator happy_var_1) : happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_2  14 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn5
		 ([Operator happy_var_1]
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  15 happyReduction_32
happyReduction_32 (HappyAbsSyn15  happy_var_3)
	_
	(HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn15
		 (peAssign (Var happy_var_1) happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happyReduce 4 15 happyReduction_33
happyReduction_33 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (peRead happy_var_3
	) `HappyStk` happyRest

happyReduce_34 = happyReduce 4 15 happyReduction_34
happyReduction_34 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (peReadln happy_var_3
	) `HappyStk` happyRest

happyReduce_35 = happyReduce 4 15 happyReduction_35
happyReduction_35 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (peWrite happy_var_3
	) `HappyStk` happyRest

happyReduce_36 = happyReduce 4 15 happyReduction_36
happyReduction_36 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (peWriteln happy_var_3
	) `HappyStk` happyRest

happyReduce_37 = happyReduce 6 15 happyReduction_37
happyReduction_37 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (peWhile happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_38 = happyReduce 4 15 happyReduction_38
happyReduction_38 ((HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (peWhile happy_var_2 [Operator happy_var_4]
	) `HappyStk` happyRest

happyReduce_39 = happyReduce 4 15 happyReduction_39
happyReduction_39 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	(HappyAbsSyn15  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (peIf happy_var_2 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_40 = happySpecReduce_3  15 happyReduction_40
happyReduction_40 (HappyAbsSyn5  happy_var_3)
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (peIf happy_var_2 happy_var_3 []
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  15 happyReduction_41
happyReduction_41 (HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn15
		 (peFunApply (Var happy_var_1) []
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happyReduce 4 16 happyReduction_42
happyReduction_42 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (happy_var_3
	) `HappyStk` happyRest

happyReduce_43 = happySpecReduce_2  16 happyReduction_43
happyReduction_43 (HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn5
		 ([Operator happy_var_2]
	)
happyReduction_43 _ _  = notHappyAtAll 

happyReduce_44 = happyReduce 4 17 happyReduction_44
happyReduction_44 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (happy_var_3
	) `HappyStk` happyRest

happyReduce_45 = happySpecReduce_2  17 happyReduction_45
happyReduction_45 (HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn5
		 ([Operator happy_var_2]
	)
happyReduction_45 _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  18 happyReduction_46
happyReduction_46 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (peLT happy_var_1 happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  18 happyReduction_47
happyReduction_47 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (peGT happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  18 happyReduction_48
happyReduction_48 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (peLTE happy_var_1 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  18 happyReduction_49
happyReduction_49 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (peGTE happy_var_1 happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  18 happyReduction_50
happyReduction_50 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (peEq happy_var_1 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  18 happyReduction_51
happyReduction_51 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (peNotEq happy_var_1 happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_1  18 happyReduction_52
happyReduction_52 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_52 _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  19 happyReduction_53
happyReduction_53 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (peSum happy_var_1 happy_var_3
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  19 happyReduction_54
happyReduction_54 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (peSub happy_var_1 happy_var_3
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_3  19 happyReduction_55
happyReduction_55 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (peOr happy_var_1 happy_var_3
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  19 happyReduction_56
happyReduction_56 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (peXor happy_var_1 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  19 happyReduction_57
happyReduction_57 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  20 happyReduction_58
happyReduction_58 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (peMul happy_var_1 happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_3  20 happyReduction_59
happyReduction_59 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (peDivide happy_var_1 happy_var_3
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  20 happyReduction_60
happyReduction_60 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (peDiv happy_var_1 happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  20 happyReduction_61
happyReduction_61 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (peMod happy_var_1 happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  20 happyReduction_62
happyReduction_62 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (peAnd happy_var_1 happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  20 happyReduction_63
happyReduction_63 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_2  21 happyReduction_64
happyReduction_64 (HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (peNot happy_var_2
	)
happyReduction_64 _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_2  21 happyReduction_65
happyReduction_65 (HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (peNeg happy_var_2
	)
happyReduction_65 _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_2  21 happyReduction_66
happyReduction_66 (HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (pePos happy_var_2
	)
happyReduction_66 _ _  = notHappyAtAll 

happyReduce_67 = happyReduce 4 21 happyReduction_67
happyReduction_67 (_ `HappyStk`
	(HappyAbsSyn22  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVariable happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (peFunApply (Var happy_var_1) happy_var_3
	) `HappyStk` happyRest

happyReduce_68 = happySpecReduce_1  21 happyReduction_68
happyReduction_68 (HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn15
		 (peVar happy_var_1
	)
happyReduction_68 _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_1  21 happyReduction_69
happyReduction_69 (HappyTerminal (TRealNum happy_var_1))
	 =  HappyAbsSyn15
		 (peReal happy_var_1
	)
happyReduction_69 _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_1  21 happyReduction_70
happyReduction_70 (HappyTerminal (TIntNum happy_var_1))
	 =  HappyAbsSyn15
		 (peInt happy_var_1
	)
happyReduction_70 _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_1  21 happyReduction_71
happyReduction_71 (HappyTerminal (TStr happy_var_1))
	 =  HappyAbsSyn15
		 (peStr happy_var_1
	)
happyReduction_71 _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_1  21 happyReduction_72
happyReduction_72 (HappyTerminal (TBool happy_var_1))
	 =  HappyAbsSyn15
		 (peBool happy_var_1
	)
happyReduction_72 _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_3  21 happyReduction_73
happyReduction_73 _
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (peBr happy_var_2
	)
happyReduction_73 _ _ _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_3  22 happyReduction_74
happyReduction_74 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1 : happy_var_3
	)
happyReduction_74 _ _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_1  22 happyReduction_75
happyReduction_75 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn22
		 ([happy_var_1]
	)
happyReduction_75 _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_0  22 happyReduction_76
happyReduction_76  =  HappyAbsSyn22
		 ([]
	)

happyNewToken action sts stk [] =
	action 66 66 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TStr happy_dollar_dollar -> cont 23;
	TBool happy_dollar_dollar -> cont 24;
	TType happy_dollar_dollar -> cont 25;
	TLeftParen -> cont 26;
	TRightParen -> cont 27;
	TColon -> cont 28;
	TSemicolon -> cont 29;
	TComma -> cont 30;
	TDot -> cont 31;
	TVar -> cont 32;
	TBegin -> cont 33;
	TEnd -> cont 34;
	TFunction -> cont 35;
	TProcedure -> cont 36;
	TRead -> cont 37;
	TReadln -> cont 38;
	TWrite -> cont 39;
	TWriteln -> cont 40;
	TWhile -> cont 41;
	TDo -> cont 42;
	TIf -> cont 43;
	TThen -> cont 44;
	TElse -> cont 45;
	TAssign -> cont 46;
	TSum -> cont 47;
	TSub -> cont 48;
	TMul -> cont 49;
	TDivide -> cont 50;
	TDiv -> cont 51;
	TMod -> cont 52;
	TLT -> cont 53;
	TGT -> cont 54;
	TLTE -> cont 55;
	TGTE -> cont 56;
	TEq -> cont 57;
	TNotEq -> cont 58;
	TAnd -> cont 59;
	TOr -> cont 60;
	TNot -> cont 61;
	TXor -> cont 62;
	TVariable happy_dollar_dollar -> cont 63;
	TRealNum happy_dollar_dollar -> cont 64;
	TIntNum happy_dollar_dollar -> cont 65;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 66 tk tks = happyError' (tks, explist)
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


data Prgm =
  Program [Prgm] [Prgm] [Prgm]
  | VarBlock [Prgm]
  | VarLine ([Prgm], Prgm)
  | Function ((Prgm, Prgm), [Prgm]) [Prgm] [Prgm]
  | FunArg ([Prgm], Prgm)
  | Operator (forall expr. PascalExpr expr => expr ())
  | Var String
  | Type String

class PascalExpr expr where
  peAssign   :: Prgm -> expr () -> expr ()
  peRead     :: expr t -> expr t
  peReadln   :: expr t -> expr t
  peWrite    :: expr t -> expr t
  peWriteln  :: expr t -> expr t
  peWhile    :: expr t -> [Prgm] -> expr ()
  peIf       :: expr t -> [Prgm] -> [Prgm] -> expr ()
  peFunApply :: Prgm -> [expr t] -> expr ()
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
