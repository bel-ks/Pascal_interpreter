{-# OPTIONS_GHC -w #-}
module Syntax where
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,346) ([0,16384,0,0,0,32768,0,0,0,0,24,0,0,0,2,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,16,0,4,0,0,0,32,0,0,0,0,0,0,0,1024,0,0,0,24576,0,0,0,2048,0,0,0,0,0,2048,0,0,0,4096,0,2304,0,0,0,512,0,0,0,0,2,0,0,0,0,0,0,0,12160,0,2,0,0,0,4,8192,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,1024,0,0,0,64,0,0,0,16,0,0,0,32,0,0,0,64,0,0,0,128,0,0,0,320,24576,59392,0,640,49152,53248,1,0,16384,0,0,0,6080,0,1,8192,0,0,2,0,0,0,4,0,0,0,0,0,2,0,0,0,2,0,0,0,16,0,0,0,8,0,0,0,32,0,0,0,4096,0,0,0,40,3072,7424,0,0,256,126,0,0,12288,2560,0,0,32768,519,0,0,0,0,0,0,0,0,0,2560,0,16387,7,5120,0,32774,14,10240,0,12,29,20480,0,24,58,32768,0,0,0,0,0,0,0,0,0,0,0,0,0,57348,7,0,10,768,1856,0,20,1536,3712,0,40,3072,7424,0,80,6144,14848,0,0,380,4096,0,8192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,8064,0,16384,0,16128,0,32768,0,32256,0,0,1,64512,0,0,63616,2,32,32768,2,192,464,0,5,384,928,0,10,768,1856,0,20,1536,3712,0,40,3072,7424,0,80,6144,14848,0,160,12288,29696,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,4032,0,5120,0,32774,14,10240,0,12,29,20480,0,24,58,40960,0,48,116,16384,1,96,232,32768,2,192,464,0,5,384,928,0,10,768,1856,0,20,1536,3712,0,4096,95,1024,0,0,0,126,0,1024,0,0,0,128,0,0,0,2048,0,0,0,0,0,32768,0,16384,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,32768,47,512,0,0,61440,64,0,0,57344,129,0,0,49152,259,0,0,32768,519,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,64512,0,0,2,0,0,0,0,192,40,0,0,384,80,0,0,768,160,0,0,1536,320,0,0,3072,640,0,0,6144,1280,0,0,0,0,0,0,760,8192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,40960,0,48,116,0,256,0,0,0,0,0,0,0,57856,11,128,0,0,0,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,380,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseProgram","Program","DefVars","DefVar","DefVarLines","DefVarLine","Variables","Functions","Function","DefFunction","Arguements","Arguement","Operators","Operator","ElsePart","Expression","SumSubOrXor","MulDivAnd","Unary","PassedArgs","bool","type","\"(\"","\")\"","\":\"","\";\"","\",\"","\".\"","\"var\"","\"begin\"","\"end\"","\"function\"","\"procedure\"","\"read\"","\"readln\"","\"write\"","\"writeln\"","\"while\"","\"do\"","\"if\"","\"then\"","\"else\"","\":=\"","\"+\"","\"-\"","\"*\"","\"/\"","\"div\"","\"mod\"","\"<\"","\">\"","\"<=\"","\">=\"","\"=\"","\"<>\"","\"and\"","\"or\"","\"not\"","\"xor\"","variable","number","qstring","%eof"]
        bit_start = st Prelude.* 65
        bit_end = (st Prelude.+ 1) Prelude.* 65
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..64]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (31) = happyShift action_4
action_0 (65) = happyReduce_2
action_0 (4) = happyGoto action_5
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 _ = happyReduce_5

action_1 (31) = happyShift action_4
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (34) = happyShift action_14
action_2 (35) = happyShift action_15
action_2 (10) = happyGoto action_11
action_2 (11) = happyGoto action_12
action_2 (12) = happyGoto action_13
action_2 _ = happyReduce_14

action_3 (31) = happyShift action_4
action_3 (32) = happyReduce_5
action_3 (34) = happyReduce_5
action_3 (35) = happyReduce_5
action_3 (5) = happyGoto action_10
action_3 (6) = happyGoto action_3
action_3 _ = happyReduce_5

action_4 (62) = happyShift action_9
action_4 (7) = happyGoto action_6
action_4 (8) = happyGoto action_7
action_4 (9) = happyGoto action_8
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (65) = happyAccept
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_6

action_7 (62) = happyShift action_9
action_7 (7) = happyGoto action_23
action_7 (8) = happyGoto action_7
action_7 (9) = happyGoto action_8
action_7 _ = happyReduce_8

action_8 (27) = happyShift action_22
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (29) = happyShift action_21
action_9 _ = happyReduce_11

action_10 _ = happyReduce_3

action_11 (32) = happyShift action_20
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (32) = happyReduce_14
action_12 (34) = happyShift action_14
action_12 (35) = happyShift action_15
action_12 (10) = happyGoto action_19
action_12 (11) = happyGoto action_12
action_12 (12) = happyGoto action_13
action_12 _ = happyReduce_14

action_13 (31) = happyShift action_4
action_13 (5) = happyGoto action_18
action_13 (6) = happyGoto action_3
action_13 _ = happyReduce_5

action_14 (62) = happyShift action_17
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (62) = happyShift action_16
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (25) = happyShift action_37
action_16 (28) = happyShift action_38
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (25) = happyShift action_36
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (32) = happyShift action_35
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_12

action_20 (36) = happyShift action_28
action_20 (37) = happyShift action_29
action_20 (38) = happyShift action_30
action_20 (39) = happyShift action_31
action_20 (40) = happyShift action_32
action_20 (42) = happyShift action_33
action_20 (62) = happyShift action_34
action_20 (15) = happyGoto action_26
action_20 (16) = happyGoto action_27
action_20 _ = happyReduce_25

action_21 (62) = happyShift action_9
action_21 (9) = happyGoto action_25
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (24) = happyShift action_24
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_7

action_24 (28) = happyShift action_65
action_24 _ = happyFail (happyExpListPerState 24)

action_25 _ = happyReduce_10

action_26 (33) = happyShift action_64
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (28) = happyShift action_63
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (25) = happyShift action_62
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (25) = happyShift action_61
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (25) = happyShift action_60
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (25) = happyShift action_59
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (23) = happyShift action_50
action_32 (25) = happyShift action_51
action_32 (46) = happyShift action_52
action_32 (47) = happyShift action_53
action_32 (60) = happyShift action_54
action_32 (62) = happyShift action_55
action_32 (63) = happyShift action_56
action_32 (64) = happyShift action_57
action_32 (18) = happyGoto action_58
action_32 (19) = happyGoto action_47
action_32 (20) = happyGoto action_48
action_32 (21) = happyGoto action_49
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (23) = happyShift action_50
action_33 (25) = happyShift action_51
action_33 (46) = happyShift action_52
action_33 (47) = happyShift action_53
action_33 (60) = happyShift action_54
action_33 (62) = happyShift action_55
action_33 (63) = happyShift action_56
action_33 (64) = happyShift action_57
action_33 (18) = happyGoto action_46
action_33 (19) = happyGoto action_47
action_33 (20) = happyGoto action_48
action_33 (21) = happyGoto action_49
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (45) = happyShift action_45
action_34 _ = happyReduce_35

action_35 (36) = happyShift action_28
action_35 (37) = happyShift action_29
action_35 (38) = happyShift action_30
action_35 (39) = happyShift action_31
action_35 (40) = happyShift action_32
action_35 (42) = happyShift action_33
action_35 (62) = happyShift action_34
action_35 (15) = happyGoto action_44
action_35 (16) = happyGoto action_27
action_35 _ = happyReduce_25

action_36 (26) = happyShift action_43
action_36 (62) = happyShift action_9
action_36 (9) = happyGoto action_39
action_36 (13) = happyGoto action_42
action_36 (14) = happyGoto action_41
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (62) = happyShift action_9
action_37 (9) = happyGoto action_39
action_37 (13) = happyGoto action_40
action_37 (14) = happyGoto action_41
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_19

action_39 (27) = happyShift action_100
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (26) = happyShift action_99
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (28) = happyShift action_98
action_41 _ = happyReduce_21

action_42 (26) = happyShift action_97
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (27) = happyShift action_96
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (33) = happyShift action_95
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (23) = happyShift action_50
action_45 (25) = happyShift action_51
action_45 (46) = happyShift action_52
action_45 (47) = happyShift action_53
action_45 (60) = happyShift action_54
action_45 (62) = happyShift action_55
action_45 (63) = happyShift action_56
action_45 (64) = happyShift action_57
action_45 (18) = happyGoto action_94
action_45 (19) = happyGoto action_47
action_45 (20) = happyGoto action_48
action_45 (21) = happyGoto action_49
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (43) = happyShift action_93
action_46 (52) = happyShift action_73
action_46 (53) = happyShift action_74
action_46 (54) = happyShift action_75
action_46 (55) = happyShift action_76
action_46 (56) = happyShift action_77
action_46 (57) = happyShift action_78
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (46) = happyShift action_89
action_47 (47) = happyShift action_90
action_47 (59) = happyShift action_91
action_47 (61) = happyShift action_92
action_47 _ = happyReduce_45

action_48 (48) = happyShift action_84
action_48 (49) = happyShift action_85
action_48 (50) = happyShift action_86
action_48 (51) = happyShift action_87
action_48 (58) = happyShift action_88
action_48 _ = happyReduce_50

action_49 _ = happyReduce_56

action_50 _ = happyReduce_64

action_51 (23) = happyShift action_50
action_51 (25) = happyShift action_51
action_51 (46) = happyShift action_52
action_51 (47) = happyShift action_53
action_51 (60) = happyShift action_54
action_51 (62) = happyShift action_55
action_51 (63) = happyShift action_56
action_51 (64) = happyShift action_57
action_51 (18) = happyGoto action_83
action_51 (19) = happyGoto action_47
action_51 (20) = happyGoto action_48
action_51 (21) = happyGoto action_49
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (23) = happyShift action_50
action_52 (25) = happyShift action_51
action_52 (46) = happyShift action_52
action_52 (47) = happyShift action_53
action_52 (60) = happyShift action_54
action_52 (62) = happyShift action_55
action_52 (63) = happyShift action_56
action_52 (64) = happyShift action_57
action_52 (21) = happyGoto action_82
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (23) = happyShift action_50
action_53 (25) = happyShift action_51
action_53 (46) = happyShift action_52
action_53 (47) = happyShift action_53
action_53 (60) = happyShift action_54
action_53 (62) = happyShift action_55
action_53 (63) = happyShift action_56
action_53 (64) = happyShift action_57
action_53 (21) = happyGoto action_81
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (23) = happyShift action_50
action_54 (25) = happyShift action_51
action_54 (46) = happyShift action_52
action_54 (47) = happyShift action_53
action_54 (60) = happyShift action_54
action_54 (62) = happyShift action_55
action_54 (63) = happyShift action_56
action_54 (64) = happyShift action_57
action_54 (21) = happyGoto action_80
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (25) = happyShift action_79
action_55 _ = happyReduce_61

action_56 _ = happyReduce_62

action_57 _ = happyReduce_63

action_58 (41) = happyShift action_72
action_58 (52) = happyShift action_73
action_58 (53) = happyShift action_74
action_58 (54) = happyShift action_75
action_58 (55) = happyShift action_76
action_58 (56) = happyShift action_77
action_58 (57) = happyShift action_78
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (23) = happyShift action_50
action_59 (25) = happyShift action_51
action_59 (46) = happyShift action_52
action_59 (47) = happyShift action_53
action_59 (60) = happyShift action_54
action_59 (62) = happyShift action_55
action_59 (63) = happyShift action_56
action_59 (64) = happyShift action_57
action_59 (18) = happyGoto action_71
action_59 (19) = happyGoto action_47
action_59 (20) = happyGoto action_48
action_59 (21) = happyGoto action_49
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (23) = happyShift action_50
action_60 (25) = happyShift action_51
action_60 (46) = happyShift action_52
action_60 (47) = happyShift action_53
action_60 (60) = happyShift action_54
action_60 (62) = happyShift action_55
action_60 (63) = happyShift action_56
action_60 (64) = happyShift action_57
action_60 (18) = happyGoto action_70
action_60 (19) = happyGoto action_47
action_60 (20) = happyGoto action_48
action_60 (21) = happyGoto action_49
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (23) = happyShift action_50
action_61 (25) = happyShift action_51
action_61 (46) = happyShift action_52
action_61 (47) = happyShift action_53
action_61 (60) = happyShift action_54
action_61 (62) = happyShift action_55
action_61 (63) = happyShift action_56
action_61 (64) = happyShift action_57
action_61 (18) = happyGoto action_69
action_61 (19) = happyGoto action_47
action_61 (20) = happyGoto action_48
action_61 (21) = happyGoto action_49
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (23) = happyShift action_50
action_62 (25) = happyShift action_51
action_62 (46) = happyShift action_52
action_62 (47) = happyShift action_53
action_62 (60) = happyShift action_54
action_62 (62) = happyShift action_55
action_62 (63) = happyShift action_56
action_62 (64) = happyShift action_57
action_62 (18) = happyGoto action_68
action_62 (19) = happyGoto action_47
action_62 (20) = happyGoto action_48
action_62 (21) = happyGoto action_49
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (33) = happyReduce_25
action_63 (36) = happyShift action_28
action_63 (37) = happyShift action_29
action_63 (38) = happyShift action_30
action_63 (39) = happyShift action_31
action_63 (40) = happyShift action_32
action_63 (42) = happyShift action_33
action_63 (62) = happyShift action_34
action_63 (15) = happyGoto action_67
action_63 (16) = happyGoto action_27
action_63 _ = happyReduce_25

action_64 (30) = happyShift action_66
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_9

action_66 _ = happyReduce_1

action_67 _ = happyReduce_23

action_68 (26) = happyShift action_132
action_68 (52) = happyShift action_73
action_68 (53) = happyShift action_74
action_68 (54) = happyShift action_75
action_68 (55) = happyShift action_76
action_68 (56) = happyShift action_77
action_68 (57) = happyShift action_78
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (26) = happyShift action_131
action_69 (52) = happyShift action_73
action_69 (53) = happyShift action_74
action_69 (54) = happyShift action_75
action_69 (55) = happyShift action_76
action_69 (56) = happyShift action_77
action_69 (57) = happyShift action_78
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (26) = happyShift action_130
action_70 (52) = happyShift action_73
action_70 (53) = happyShift action_74
action_70 (54) = happyShift action_75
action_70 (55) = happyShift action_76
action_70 (56) = happyShift action_77
action_70 (57) = happyShift action_78
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (26) = happyShift action_129
action_71 (52) = happyShift action_73
action_71 (53) = happyShift action_74
action_71 (54) = happyShift action_75
action_71 (55) = happyShift action_76
action_71 (56) = happyShift action_77
action_71 (57) = happyShift action_78
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (32) = happyShift action_128
action_72 (36) = happyShift action_28
action_72 (37) = happyShift action_29
action_72 (38) = happyShift action_30
action_72 (39) = happyShift action_31
action_72 (40) = happyShift action_32
action_72 (42) = happyShift action_33
action_72 (62) = happyShift action_34
action_72 (16) = happyGoto action_127
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (23) = happyShift action_50
action_73 (25) = happyShift action_51
action_73 (46) = happyShift action_52
action_73 (47) = happyShift action_53
action_73 (60) = happyShift action_54
action_73 (62) = happyShift action_55
action_73 (63) = happyShift action_56
action_73 (64) = happyShift action_57
action_73 (19) = happyGoto action_126
action_73 (20) = happyGoto action_48
action_73 (21) = happyGoto action_49
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (23) = happyShift action_50
action_74 (25) = happyShift action_51
action_74 (46) = happyShift action_52
action_74 (47) = happyShift action_53
action_74 (60) = happyShift action_54
action_74 (62) = happyShift action_55
action_74 (63) = happyShift action_56
action_74 (64) = happyShift action_57
action_74 (19) = happyGoto action_125
action_74 (20) = happyGoto action_48
action_74 (21) = happyGoto action_49
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (23) = happyShift action_50
action_75 (25) = happyShift action_51
action_75 (46) = happyShift action_52
action_75 (47) = happyShift action_53
action_75 (60) = happyShift action_54
action_75 (62) = happyShift action_55
action_75 (63) = happyShift action_56
action_75 (64) = happyShift action_57
action_75 (19) = happyGoto action_124
action_75 (20) = happyGoto action_48
action_75 (21) = happyGoto action_49
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (23) = happyShift action_50
action_76 (25) = happyShift action_51
action_76 (46) = happyShift action_52
action_76 (47) = happyShift action_53
action_76 (60) = happyShift action_54
action_76 (62) = happyShift action_55
action_76 (63) = happyShift action_56
action_76 (64) = happyShift action_57
action_76 (19) = happyGoto action_123
action_76 (20) = happyGoto action_48
action_76 (21) = happyGoto action_49
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (23) = happyShift action_50
action_77 (25) = happyShift action_51
action_77 (46) = happyShift action_52
action_77 (47) = happyShift action_53
action_77 (60) = happyShift action_54
action_77 (62) = happyShift action_55
action_77 (63) = happyShift action_56
action_77 (64) = happyShift action_57
action_77 (19) = happyGoto action_122
action_77 (20) = happyGoto action_48
action_77 (21) = happyGoto action_49
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (23) = happyShift action_50
action_78 (25) = happyShift action_51
action_78 (46) = happyShift action_52
action_78 (47) = happyShift action_53
action_78 (60) = happyShift action_54
action_78 (62) = happyShift action_55
action_78 (63) = happyShift action_56
action_78 (64) = happyShift action_57
action_78 (19) = happyGoto action_121
action_78 (20) = happyGoto action_48
action_78 (21) = happyGoto action_49
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (23) = happyShift action_50
action_79 (25) = happyShift action_51
action_79 (46) = happyShift action_52
action_79 (47) = happyShift action_53
action_79 (60) = happyShift action_54
action_79 (62) = happyShift action_55
action_79 (63) = happyShift action_56
action_79 (64) = happyShift action_57
action_79 (18) = happyGoto action_119
action_79 (19) = happyGoto action_47
action_79 (20) = happyGoto action_48
action_79 (21) = happyGoto action_49
action_79 (22) = happyGoto action_120
action_79 _ = happyReduce_68

action_80 _ = happyReduce_57

action_81 _ = happyReduce_58

action_82 _ = happyReduce_59

action_83 (26) = happyShift action_118
action_83 (52) = happyShift action_73
action_83 (53) = happyShift action_74
action_83 (54) = happyShift action_75
action_83 (55) = happyShift action_76
action_83 (56) = happyShift action_77
action_83 (57) = happyShift action_78
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (23) = happyShift action_50
action_84 (25) = happyShift action_51
action_84 (46) = happyShift action_52
action_84 (47) = happyShift action_53
action_84 (60) = happyShift action_54
action_84 (62) = happyShift action_55
action_84 (63) = happyShift action_56
action_84 (64) = happyShift action_57
action_84 (21) = happyGoto action_117
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (23) = happyShift action_50
action_85 (25) = happyShift action_51
action_85 (46) = happyShift action_52
action_85 (47) = happyShift action_53
action_85 (60) = happyShift action_54
action_85 (62) = happyShift action_55
action_85 (63) = happyShift action_56
action_85 (64) = happyShift action_57
action_85 (21) = happyGoto action_116
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (23) = happyShift action_50
action_86 (25) = happyShift action_51
action_86 (46) = happyShift action_52
action_86 (47) = happyShift action_53
action_86 (60) = happyShift action_54
action_86 (62) = happyShift action_55
action_86 (63) = happyShift action_56
action_86 (64) = happyShift action_57
action_86 (21) = happyGoto action_115
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (23) = happyShift action_50
action_87 (25) = happyShift action_51
action_87 (46) = happyShift action_52
action_87 (47) = happyShift action_53
action_87 (60) = happyShift action_54
action_87 (62) = happyShift action_55
action_87 (63) = happyShift action_56
action_87 (64) = happyShift action_57
action_87 (21) = happyGoto action_114
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (23) = happyShift action_50
action_88 (25) = happyShift action_51
action_88 (46) = happyShift action_52
action_88 (47) = happyShift action_53
action_88 (60) = happyShift action_54
action_88 (62) = happyShift action_55
action_88 (63) = happyShift action_56
action_88 (64) = happyShift action_57
action_88 (21) = happyGoto action_113
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (23) = happyShift action_50
action_89 (25) = happyShift action_51
action_89 (46) = happyShift action_52
action_89 (47) = happyShift action_53
action_89 (60) = happyShift action_54
action_89 (62) = happyShift action_55
action_89 (63) = happyShift action_56
action_89 (64) = happyShift action_57
action_89 (20) = happyGoto action_112
action_89 (21) = happyGoto action_49
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (23) = happyShift action_50
action_90 (25) = happyShift action_51
action_90 (46) = happyShift action_52
action_90 (47) = happyShift action_53
action_90 (60) = happyShift action_54
action_90 (62) = happyShift action_55
action_90 (63) = happyShift action_56
action_90 (64) = happyShift action_57
action_90 (20) = happyGoto action_111
action_90 (21) = happyGoto action_49
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (23) = happyShift action_50
action_91 (25) = happyShift action_51
action_91 (46) = happyShift action_52
action_91 (47) = happyShift action_53
action_91 (60) = happyShift action_54
action_91 (62) = happyShift action_55
action_91 (63) = happyShift action_56
action_91 (64) = happyShift action_57
action_91 (20) = happyGoto action_110
action_91 (21) = happyGoto action_49
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (23) = happyShift action_50
action_92 (25) = happyShift action_51
action_92 (46) = happyShift action_52
action_92 (47) = happyShift action_53
action_92 (60) = happyShift action_54
action_92 (62) = happyShift action_55
action_92 (63) = happyShift action_56
action_92 (64) = happyShift action_57
action_92 (20) = happyGoto action_109
action_92 (21) = happyGoto action_49
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (32) = happyShift action_108
action_93 (36) = happyShift action_28
action_93 (37) = happyShift action_29
action_93 (38) = happyShift action_30
action_93 (39) = happyShift action_31
action_93 (40) = happyShift action_32
action_93 (42) = happyShift action_33
action_93 (62) = happyShift action_34
action_93 (16) = happyGoto action_107
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (52) = happyShift action_73
action_94 (53) = happyShift action_74
action_94 (54) = happyShift action_75
action_94 (55) = happyShift action_76
action_94 (56) = happyShift action_77
action_94 (57) = happyShift action_78
action_94 _ = happyReduce_26

action_95 (28) = happyShift action_106
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (24) = happyShift action_105
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (27) = happyShift action_104
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (62) = happyShift action_9
action_98 (9) = happyGoto action_39
action_98 (13) = happyGoto action_103
action_98 (14) = happyGoto action_41
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (28) = happyShift action_102
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (24) = happyShift action_101
action_100 _ = happyFail (happyExpListPerState 100)

action_101 _ = happyReduce_22

action_102 _ = happyReduce_18

action_103 _ = happyReduce_20

action_104 (24) = happyShift action_140
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (28) = happyShift action_139
action_105 _ = happyFail (happyExpListPerState 105)

action_106 _ = happyReduce_15

action_107 (44) = happyShift action_138
action_107 (17) = happyGoto action_137
action_107 _ = happyReduce_38

action_108 (36) = happyShift action_28
action_108 (37) = happyShift action_29
action_108 (38) = happyShift action_30
action_108 (39) = happyShift action_31
action_108 (40) = happyShift action_32
action_108 (42) = happyShift action_33
action_108 (62) = happyShift action_34
action_108 (15) = happyGoto action_136
action_108 (16) = happyGoto action_27
action_108 _ = happyReduce_25

action_109 (48) = happyShift action_84
action_109 (49) = happyShift action_85
action_109 (50) = happyShift action_86
action_109 (51) = happyShift action_87
action_109 (58) = happyShift action_88
action_109 _ = happyReduce_49

action_110 (48) = happyShift action_84
action_110 (49) = happyShift action_85
action_110 (50) = happyShift action_86
action_110 (51) = happyShift action_87
action_110 (58) = happyShift action_88
action_110 _ = happyReduce_48

action_111 (48) = happyShift action_84
action_111 (49) = happyShift action_85
action_111 (50) = happyShift action_86
action_111 (51) = happyShift action_87
action_111 (58) = happyShift action_88
action_111 _ = happyReduce_47

action_112 (48) = happyShift action_84
action_112 (49) = happyShift action_85
action_112 (50) = happyShift action_86
action_112 (51) = happyShift action_87
action_112 (58) = happyShift action_88
action_112 _ = happyReduce_46

action_113 _ = happyReduce_55

action_114 _ = happyReduce_54

action_115 _ = happyReduce_53

action_116 _ = happyReduce_52

action_117 _ = happyReduce_51

action_118 _ = happyReduce_65

action_119 (29) = happyShift action_135
action_119 (52) = happyShift action_73
action_119 (53) = happyShift action_74
action_119 (54) = happyShift action_75
action_119 (55) = happyShift action_76
action_119 (56) = happyShift action_77
action_119 (57) = happyShift action_78
action_119 _ = happyReduce_67

action_120 (26) = happyShift action_134
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (46) = happyShift action_89
action_121 (47) = happyShift action_90
action_121 (59) = happyShift action_91
action_121 (61) = happyShift action_92
action_121 _ = happyReduce_44

action_122 (46) = happyShift action_89
action_122 (47) = happyShift action_90
action_122 (59) = happyShift action_91
action_122 (61) = happyShift action_92
action_122 _ = happyReduce_43

action_123 (46) = happyShift action_89
action_123 (47) = happyShift action_90
action_123 (59) = happyShift action_91
action_123 (61) = happyShift action_92
action_123 _ = happyReduce_42

action_124 (46) = happyShift action_89
action_124 (47) = happyShift action_90
action_124 (59) = happyShift action_91
action_124 (61) = happyShift action_92
action_124 _ = happyReduce_41

action_125 (46) = happyShift action_89
action_125 (47) = happyShift action_90
action_125 (59) = happyShift action_91
action_125 (61) = happyShift action_92
action_125 _ = happyReduce_40

action_126 (46) = happyShift action_89
action_126 (47) = happyShift action_90
action_126 (59) = happyShift action_91
action_126 (61) = happyShift action_92
action_126 _ = happyReduce_39

action_127 _ = happyReduce_32

action_128 (36) = happyShift action_28
action_128 (37) = happyShift action_29
action_128 (38) = happyShift action_30
action_128 (39) = happyShift action_31
action_128 (40) = happyShift action_32
action_128 (42) = happyShift action_33
action_128 (62) = happyShift action_34
action_128 (15) = happyGoto action_133
action_128 (16) = happyGoto action_27
action_128 _ = happyReduce_25

action_129 _ = happyReduce_30

action_130 _ = happyReduce_29

action_131 _ = happyReduce_28

action_132 _ = happyReduce_27

action_133 (33) = happyShift action_146
action_133 _ = happyFail (happyExpListPerState 133)

action_134 _ = happyReduce_60

action_135 (23) = happyShift action_50
action_135 (25) = happyShift action_51
action_135 (46) = happyShift action_52
action_135 (47) = happyShift action_53
action_135 (60) = happyShift action_54
action_135 (62) = happyShift action_55
action_135 (63) = happyShift action_56
action_135 (64) = happyShift action_57
action_135 (18) = happyGoto action_119
action_135 (19) = happyGoto action_47
action_135 (20) = happyGoto action_48
action_135 (21) = happyGoto action_49
action_135 (22) = happyGoto action_145
action_135 _ = happyReduce_68

action_136 (33) = happyShift action_144
action_136 _ = happyFail (happyExpListPerState 136)

action_137 _ = happyReduce_34

action_138 (32) = happyShift action_143
action_138 (36) = happyShift action_28
action_138 (37) = happyShift action_29
action_138 (38) = happyShift action_30
action_138 (39) = happyShift action_31
action_138 (40) = happyShift action_32
action_138 (42) = happyShift action_33
action_138 (62) = happyShift action_34
action_138 (16) = happyGoto action_142
action_138 _ = happyFail (happyExpListPerState 138)

action_139 _ = happyReduce_17

action_140 (28) = happyShift action_141
action_140 _ = happyFail (happyExpListPerState 140)

action_141 _ = happyReduce_16

action_142 _ = happyReduce_37

action_143 (36) = happyShift action_28
action_143 (37) = happyShift action_29
action_143 (38) = happyShift action_30
action_143 (39) = happyShift action_31
action_143 (40) = happyShift action_32
action_143 (42) = happyShift action_33
action_143 (62) = happyShift action_34
action_143 (15) = happyGoto action_148
action_143 (16) = happyGoto action_27
action_143 _ = happyReduce_25

action_144 (44) = happyShift action_138
action_144 (17) = happyGoto action_147
action_144 _ = happyReduce_38

action_145 _ = happyReduce_66

action_146 _ = happyReduce_31

action_147 _ = happyReduce_33

action_148 (33) = happyShift action_149
action_148 _ = happyFail (happyExpListPerState 148)

action_149 _ = happyReduce_36

happyReduce_1 = happyReduce 6 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Program happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_0  4 happyReduction_2
happyReduction_2  =  HappyAbsSyn4
		 (Program [] [] []
	)

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 : happy_var_2
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  5 happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_0  5 happyReduction_5
happyReduction_5  =  HappyAbsSyn5
		 ([]
	)

happyReduce_6 = happySpecReduce_2  6 happyReduction_6
happyReduction_6 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_2  7 happyReduction_7
happyReduction_7 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 : happy_var_2
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  7 happyReduction_8
happyReduction_8 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happyReduce 4 8 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyTerminal (TType happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 ((happy_var_1, Type happy_var_3)
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_3  9 happyReduction_10
happyReduction_10 (HappyAbsSyn9  happy_var_3)
	_
	(HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn9
		 ((Var happy_var_1) : happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  9 happyReduction_11
happyReduction_11 (HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn9
		 ([Var happy_var_1]
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_2  10 happyReduction_12
happyReduction_12 (HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1 : happy_var_2
	)
happyReduction_12 _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  10 happyReduction_13
happyReduction_13 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 ([happy_var_1]
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_0  10 happyReduction_14
happyReduction_14  =  HappyAbsSyn10
		 ([]
	)

happyReduce_15 = happyReduce 6 11 happyReduction_15
happyReduction_15 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	(HappyAbsSyn12  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Function happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 8 12 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyTerminal (TType happy_var_7)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVariable happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (((Var happy_var_2, Type happy_var_7), happy_var_4)
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 7 12 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyTerminal (TType happy_var_6)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVariable happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (((Var happy_var_2, Type happy_var_6), [])
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 6 12 happyReduction_18
happyReduction_18 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVariable happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (((Var happy_var_2, Type ""), happy_var_4)
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_3  12 happyReduction_19
happyReduction_19 _
	(HappyTerminal (TVariable happy_var_2))
	_
	 =  HappyAbsSyn12
		 (((Var happy_var_2, Type ""), [])
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  13 happyReduction_20
happyReduction_20 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1 : happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  13 happyReduction_21
happyReduction_21 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 ([happy_var_1]
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  14 happyReduction_22
happyReduction_22 (HappyTerminal (TType happy_var_3))
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn14
		 ((happy_var_1, Type happy_var_3)
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  15 happyReduction_23
happyReduction_23 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 ((Operator happy_var_1) : happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  15 happyReduction_24
happyReduction_24 _
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 ([Operator happy_var_1]
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_0  15 happyReduction_25
happyReduction_25  =  HappyAbsSyn15
		 ([]
	)

happyReduce_26 = happySpecReduce_3  16 happyReduction_26
happyReduction_26 (HappyAbsSyn18  happy_var_3)
	_
	(HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn16
		 (Assign (Var happy_var_1) happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happyReduce 4 16 happyReduction_27
happyReduction_27 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (Read happy_var_3
	) `HappyStk` happyRest

happyReduce_28 = happyReduce 4 16 happyReduction_28
happyReduction_28 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (Readln happy_var_3
	) `HappyStk` happyRest

happyReduce_29 = happyReduce 4 16 happyReduction_29
happyReduction_29 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (Write happy_var_3
	) `HappyStk` happyRest

happyReduce_30 = happyReduce 4 16 happyReduction_30
happyReduction_30 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (Writeln happy_var_3
	) `HappyStk` happyRest

happyReduce_31 = happyReduce 6 16 happyReduction_31
happyReduction_31 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (While happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_32 = happyReduce 4 16 happyReduction_32
happyReduction_32 ((HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (While happy_var_2 [Operator happy_var_4]
	) `HappyStk` happyRest

happyReduce_33 = happyReduce 7 16 happyReduction_33
happyReduction_33 ((HappyAbsSyn17  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (If happy_var_2 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_34 = happyReduce 5 16 happyReduction_34
happyReduction_34 ((HappyAbsSyn17  happy_var_5) `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (If happy_var_2 [Operator happy_var_4] happy_var_5
	) `HappyStk` happyRest

happyReduce_35 = happySpecReduce_1  16 happyReduction_35
happyReduction_35 (HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn16
		 (Var happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happyReduce 4 17 happyReduction_36
happyReduction_36 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (happy_var_3
	) `HappyStk` happyRest

happyReduce_37 = happySpecReduce_2  17 happyReduction_37
happyReduction_37 (HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn17
		 ([Operator happy_var_2]
	)
happyReduction_37 _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_0  17 happyReduction_38
happyReduction_38  =  HappyAbsSyn17
		 ([]
	)

happyReduce_39 = happySpecReduce_3  18 happyReduction_39
happyReduction_39 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (LT_ happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  18 happyReduction_40
happyReduction_40 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (GT_ happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  18 happyReduction_41
happyReduction_41 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (LTE_ happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  18 happyReduction_42
happyReduction_42 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (GTE_ happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  18 happyReduction_43
happyReduction_43 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (Eq happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  18 happyReduction_44
happyReduction_44 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (NotEq happy_var_1 happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  18 happyReduction_45
happyReduction_45 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  19 happyReduction_46
happyReduction_46 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (Sum happy_var_1 happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  19 happyReduction_47
happyReduction_47 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  19 happyReduction_48
happyReduction_48 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (Or happy_var_1 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  19 happyReduction_49
happyReduction_49 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (Xor happy_var_1 happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_1  19 happyReduction_50
happyReduction_50 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_50 _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  20 happyReduction_51
happyReduction_51 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (Mul happy_var_1 happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  20 happyReduction_52
happyReduction_52 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (Divide happy_var_1 happy_var_3
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  20 happyReduction_53
happyReduction_53 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (Div happy_var_1 happy_var_3
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  20 happyReduction_54
happyReduction_54 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (Mod happy_var_1 happy_var_3
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_3  20 happyReduction_55
happyReduction_55 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (And happy_var_1 happy_var_3
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  20 happyReduction_56
happyReduction_56 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn20
		 (happy_var_1
	)
happyReduction_56 _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_2  21 happyReduction_57
happyReduction_57 (HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn21
		 (Not happy_var_2
	)
happyReduction_57 _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_2  21 happyReduction_58
happyReduction_58 (HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn21
		 (Neg happy_var_2
	)
happyReduction_58 _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_2  21 happyReduction_59
happyReduction_59 (HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn21
		 (Pos happy_var_2
	)
happyReduction_59 _ _  = notHappyAtAll 

happyReduce_60 = happyReduce 4 21 happyReduction_60
happyReduction_60 (_ `HappyStk`
	(HappyAbsSyn22  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVariable happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (Fun (Var happy_var_1) happy_var_3
	) `HappyStk` happyRest

happyReduce_61 = happySpecReduce_1  21 happyReduction_61
happyReduction_61 (HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn21
		 (Var happy_var_1
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  21 happyReduction_62
happyReduction_62 (HappyTerminal (TNumber happy_var_1))
	 =  HappyAbsSyn21
		 (Num happy_var_1
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  21 happyReduction_63
happyReduction_63 (HappyTerminal (TStr happy_var_1))
	 =  HappyAbsSyn21
		 (Str happy_var_1
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_1  21 happyReduction_64
happyReduction_64 (HappyTerminal (TBool happy_var_1))
	 =  HappyAbsSyn21
		 (Bool happy_var_1
	)
happyReduction_64 _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  21 happyReduction_65
happyReduction_65 _
	(HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn21
		 (happy_var_2
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_3  22 happyReduction_66
happyReduction_66 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1 : happy_var_3
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_1  22 happyReduction_67
happyReduction_67 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn22
		 ([happy_var_1]
	)
happyReduction_67 _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_0  22 happyReduction_68
happyReduction_68  =  HappyAbsSyn22
		 ([]
	)

happyNewToken action sts stk [] =
	action 65 65 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TBool happy_dollar_dollar -> cont 23;
	TType happy_dollar_dollar -> cont 24;
	TLeftParen -> cont 25;
	TRightParen -> cont 26;
	TColon -> cont 27;
	TSemicolon -> cont 28;
	TComma -> cont 29;
	TDot -> cont 30;
	TVar -> cont 31;
	TBegin -> cont 32;
	TEnd -> cont 33;
	TFunction -> cont 34;
	TProcedure -> cont 35;
	TRead -> cont 36;
	TReadln -> cont 37;
	TWrite -> cont 38;
	TWriteln -> cont 39;
	TWhile -> cont 40;
	TDo -> cont 41;
	TIf -> cont 42;
	TThen -> cont 43;
	TElse -> cont 44;
	TAssign -> cont 45;
	TSum -> cont 46;
	TSub -> cont 47;
	TMul -> cont 48;
	TDivide -> cont 49;
	TDiv -> cont 50;
	TMod -> cont 51;
	TLT -> cont 52;
	TGT -> cont 53;
	TLTE -> cont 54;
	TGTE -> cont 55;
	TEq -> cont 56;
	TNotEq -> cont 57;
	TAnd -> cont 58;
	TOr -> cont 59;
	TNot -> cont 60;
	TXor -> cont 61;
	TVariable happy_dollar_dollar -> cont 62;
	TNumber happy_dollar_dollar -> cont 63;
	TStr happy_dollar_dollar -> cont 64;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 65 tk tks = happyError' (tks, explist)
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
