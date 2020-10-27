{-# OPTIONS_GHC -w #-}
module Syntax where
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21
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

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,336) ([0,8192,0,0,0,8192,0,0,0,0,3,0,0,0,0,4096,0,0,0,0,0,8192,0,0,0,0,0,4096,0,512,0,0,0,2048,0,0,0,16384,0,0,0,0,3,0,0,1024,0,0,0,0,0,4096,0,0,0,4096,0,128,0,0,0,128,0,0,0,8192,0,0,0,0,0,0,0,0,380,4096,0,0,0,4096,0,64,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,32768,0,0,0,1024,0,0,0,128,0,0,0,128,0,0,0,128,0,0,0,128,0,0,0,160,12288,29696,0,160,12288,29696,0,0,2048,0,0,16384,0,0,0,256,0,4096,0,0,0,4096,0,512,0,0,0,256,0,0,0,1024,0,0,0,256,0,0,0,512,0,0,0,0,380,4096,0,160,12288,29696,0,0,512,252,0,0,12288,2560,0,0,49152,259,0,0,0,0,0,0,0,0,0,160,12288,29696,0,160,12288,29696,0,160,12288,29696,0,160,12288,29696,0,128,0,0,0,0,0,0,0,0,0,0,0,0,128,252,0,160,12288,29696,0,160,12288,29696,0,160,12288,29696,0,160,12288,29696,0,0,380,4096,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,252,0,256,0,252,0,256,0,252,0,256,0,252,0,16384,380,4096,0,160,12288,29696,0,160,12288,29696,0,160,12288,29696,0,160,12288,29696,0,160,12288,29696,0,160,12288,29696,0,160,12288,29696,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,252,0,160,12288,29696,0,160,12288,29696,0,160,12288,29696,0,160,12288,29696,0,160,12288,29696,0,160,12288,29696,0,160,12288,29696,0,160,12288,29696,0,160,12288,29696,0,16384,380,4096,0,0,0,252,0,32768,0,0,0,64,0,0,0,512,0,0,0,0,0,4096,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,380,4096,0,0,49152,259,0,0,49152,259,0,0,49152,259,0,0,49152,259,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,252,0,256,0,0,0,0,12288,2560,0,0,12288,2560,0,0,12288,2560,0,0,12288,2560,0,0,12288,2560,0,0,12288,2560,0,0,0,0,0,0,380,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,0,0,160,12288,29696,0,32768,0,0,0,0,0,0,0,16384,380,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,380,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseProgram","Program","DefVars","DefVar","DefVarBlock","Variables","Functions","Function","DefFunction","Arguments","Argument","Operators","Operator","ElsePart","Expression","SumSubOrXor","MulDivAnd","Unary","PassedArgs","bool","type","\"(\"","\")\"","\":\"","\";\"","\",\"","\".\"","\"var\"","\"begin\"","\"end\"","\"function\"","\"procedure\"","\"read\"","\"readln\"","\"write\"","\"writeln\"","\"while\"","\"do\"","\"if\"","\"then\"","\"else\"","\":=\"","\"+\"","\"-\"","\"*\"","\"/\"","\"div\"","\"mod\"","\"<\"","\">\"","\"<=\"","\">=\"","\"=\"","\"<>\"","\"and\"","\"or\"","\"not\"","\"xor\"","variable","number","qstring","%eof"]
        bit_start = st Prelude.* 64
        bit_end = (st Prelude.+ 1) Prelude.* 64
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..63]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (30) = happyShift action_3
action_0 (64) = happyReduce_2
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_2
action_0 _ = happyReduce_5

action_1 (30) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (33) = happyShift action_12
action_2 (34) = happyShift action_13
action_2 (9) = happyGoto action_9
action_2 (10) = happyGoto action_10
action_2 (11) = happyGoto action_11
action_2 _ = happyReduce_13

action_3 (61) = happyShift action_8
action_3 (6) = happyGoto action_5
action_3 (7) = happyGoto action_6
action_3 (8) = happyGoto action_7
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (64) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (30) = happyShift action_3
action_5 (31) = happyReduce_5
action_5 (33) = happyReduce_5
action_5 (34) = happyReduce_5
action_5 (5) = happyGoto action_22
action_5 _ = happyReduce_5

action_6 (61) = happyShift action_8
action_6 (6) = happyGoto action_21
action_6 (7) = happyGoto action_6
action_6 (8) = happyGoto action_7
action_6 _ = happyReduce_7

action_7 (26) = happyShift action_20
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (28) = happyShift action_19
action_8 _ = happyReduce_10

action_9 (31) = happyShift action_18
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (31) = happyReduce_13
action_10 (33) = happyShift action_12
action_10 (34) = happyShift action_13
action_10 (9) = happyGoto action_17
action_10 (10) = happyGoto action_10
action_10 (11) = happyGoto action_11
action_10 _ = happyReduce_13

action_11 (27) = happyShift action_16
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (61) = happyShift action_15
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (61) = happyShift action_14
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (24) = happyShift action_36
action_14 _ = happyReduce_18

action_15 (24) = happyShift action_35
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (30) = happyShift action_3
action_16 (5) = happyGoto action_34
action_16 _ = happyReduce_5

action_17 _ = happyReduce_11

action_18 (35) = happyShift action_27
action_18 (36) = happyShift action_28
action_18 (37) = happyShift action_29
action_18 (38) = happyShift action_30
action_18 (39) = happyShift action_31
action_18 (41) = happyShift action_32
action_18 (61) = happyShift action_33
action_18 (14) = happyGoto action_25
action_18 (15) = happyGoto action_26
action_18 _ = happyReduce_24

action_19 (61) = happyShift action_8
action_19 (8) = happyGoto action_24
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (23) = happyShift action_23
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_6

action_22 _ = happyReduce_3

action_23 (27) = happyShift action_63
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_9

action_25 (32) = happyShift action_62
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (27) = happyShift action_61
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (24) = happyShift action_60
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (24) = happyShift action_59
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (24) = happyShift action_58
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (24) = happyShift action_57
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (22) = happyShift action_48
action_31 (24) = happyShift action_49
action_31 (45) = happyShift action_50
action_31 (46) = happyShift action_51
action_31 (59) = happyShift action_52
action_31 (61) = happyShift action_53
action_31 (62) = happyShift action_54
action_31 (63) = happyShift action_55
action_31 (17) = happyGoto action_56
action_31 (18) = happyGoto action_45
action_31 (19) = happyGoto action_46
action_31 (20) = happyGoto action_47
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (22) = happyShift action_48
action_32 (24) = happyShift action_49
action_32 (45) = happyShift action_50
action_32 (46) = happyShift action_51
action_32 (59) = happyShift action_52
action_32 (61) = happyShift action_53
action_32 (62) = happyShift action_54
action_32 (63) = happyShift action_55
action_32 (17) = happyGoto action_44
action_32 (18) = happyGoto action_45
action_32 (19) = happyGoto action_46
action_32 (20) = happyGoto action_47
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (44) = happyShift action_43
action_33 _ = happyReduce_34

action_34 (31) = happyShift action_42
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (25) = happyShift action_41
action_35 (61) = happyShift action_8
action_35 (8) = happyGoto action_37
action_35 (12) = happyGoto action_40
action_35 (13) = happyGoto action_39
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (61) = happyShift action_8
action_36 (8) = happyGoto action_37
action_36 (12) = happyGoto action_38
action_36 (13) = happyGoto action_39
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (26) = happyShift action_98
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (25) = happyShift action_97
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (27) = happyShift action_96
action_39 _ = happyReduce_20

action_40 (25) = happyShift action_95
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (26) = happyShift action_94
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (35) = happyShift action_27
action_42 (36) = happyShift action_28
action_42 (37) = happyShift action_29
action_42 (38) = happyShift action_30
action_42 (39) = happyShift action_31
action_42 (41) = happyShift action_32
action_42 (61) = happyShift action_33
action_42 (14) = happyGoto action_93
action_42 (15) = happyGoto action_26
action_42 _ = happyReduce_24

action_43 (22) = happyShift action_48
action_43 (24) = happyShift action_49
action_43 (45) = happyShift action_50
action_43 (46) = happyShift action_51
action_43 (59) = happyShift action_52
action_43 (61) = happyShift action_53
action_43 (62) = happyShift action_54
action_43 (63) = happyShift action_55
action_43 (17) = happyGoto action_92
action_43 (18) = happyGoto action_45
action_43 (19) = happyGoto action_46
action_43 (20) = happyGoto action_47
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (42) = happyShift action_91
action_44 (51) = happyShift action_71
action_44 (52) = happyShift action_72
action_44 (53) = happyShift action_73
action_44 (54) = happyShift action_74
action_44 (55) = happyShift action_75
action_44 (56) = happyShift action_76
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (45) = happyShift action_87
action_45 (46) = happyShift action_88
action_45 (58) = happyShift action_89
action_45 (60) = happyShift action_90
action_45 _ = happyReduce_44

action_46 (47) = happyShift action_82
action_46 (48) = happyShift action_83
action_46 (49) = happyShift action_84
action_46 (50) = happyShift action_85
action_46 (57) = happyShift action_86
action_46 _ = happyReduce_49

action_47 _ = happyReduce_55

action_48 _ = happyReduce_63

action_49 (22) = happyShift action_48
action_49 (24) = happyShift action_49
action_49 (45) = happyShift action_50
action_49 (46) = happyShift action_51
action_49 (59) = happyShift action_52
action_49 (61) = happyShift action_53
action_49 (62) = happyShift action_54
action_49 (63) = happyShift action_55
action_49 (17) = happyGoto action_81
action_49 (18) = happyGoto action_45
action_49 (19) = happyGoto action_46
action_49 (20) = happyGoto action_47
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (22) = happyShift action_48
action_50 (24) = happyShift action_49
action_50 (45) = happyShift action_50
action_50 (46) = happyShift action_51
action_50 (59) = happyShift action_52
action_50 (61) = happyShift action_53
action_50 (62) = happyShift action_54
action_50 (63) = happyShift action_55
action_50 (20) = happyGoto action_80
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (22) = happyShift action_48
action_51 (24) = happyShift action_49
action_51 (45) = happyShift action_50
action_51 (46) = happyShift action_51
action_51 (59) = happyShift action_52
action_51 (61) = happyShift action_53
action_51 (62) = happyShift action_54
action_51 (63) = happyShift action_55
action_51 (20) = happyGoto action_79
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (22) = happyShift action_48
action_52 (24) = happyShift action_49
action_52 (45) = happyShift action_50
action_52 (46) = happyShift action_51
action_52 (59) = happyShift action_52
action_52 (61) = happyShift action_53
action_52 (62) = happyShift action_54
action_52 (63) = happyShift action_55
action_52 (20) = happyGoto action_78
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (24) = happyShift action_77
action_53 _ = happyReduce_60

action_54 _ = happyReduce_61

action_55 _ = happyReduce_62

action_56 (40) = happyShift action_70
action_56 (51) = happyShift action_71
action_56 (52) = happyShift action_72
action_56 (53) = happyShift action_73
action_56 (54) = happyShift action_74
action_56 (55) = happyShift action_75
action_56 (56) = happyShift action_76
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (22) = happyShift action_48
action_57 (24) = happyShift action_49
action_57 (45) = happyShift action_50
action_57 (46) = happyShift action_51
action_57 (59) = happyShift action_52
action_57 (61) = happyShift action_53
action_57 (62) = happyShift action_54
action_57 (63) = happyShift action_55
action_57 (17) = happyGoto action_69
action_57 (18) = happyGoto action_45
action_57 (19) = happyGoto action_46
action_57 (20) = happyGoto action_47
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (22) = happyShift action_48
action_58 (24) = happyShift action_49
action_58 (45) = happyShift action_50
action_58 (46) = happyShift action_51
action_58 (59) = happyShift action_52
action_58 (61) = happyShift action_53
action_58 (62) = happyShift action_54
action_58 (63) = happyShift action_55
action_58 (17) = happyGoto action_68
action_58 (18) = happyGoto action_45
action_58 (19) = happyGoto action_46
action_58 (20) = happyGoto action_47
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (22) = happyShift action_48
action_59 (24) = happyShift action_49
action_59 (45) = happyShift action_50
action_59 (46) = happyShift action_51
action_59 (59) = happyShift action_52
action_59 (61) = happyShift action_53
action_59 (62) = happyShift action_54
action_59 (63) = happyShift action_55
action_59 (17) = happyGoto action_67
action_59 (18) = happyGoto action_45
action_59 (19) = happyGoto action_46
action_59 (20) = happyGoto action_47
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (22) = happyShift action_48
action_60 (24) = happyShift action_49
action_60 (45) = happyShift action_50
action_60 (46) = happyShift action_51
action_60 (59) = happyShift action_52
action_60 (61) = happyShift action_53
action_60 (62) = happyShift action_54
action_60 (63) = happyShift action_55
action_60 (17) = happyGoto action_66
action_60 (18) = happyGoto action_45
action_60 (19) = happyGoto action_46
action_60 (20) = happyGoto action_47
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (32) = happyReduce_24
action_61 (35) = happyShift action_27
action_61 (36) = happyShift action_28
action_61 (37) = happyShift action_29
action_61 (38) = happyShift action_30
action_61 (39) = happyShift action_31
action_61 (41) = happyShift action_32
action_61 (61) = happyShift action_33
action_61 (14) = happyGoto action_65
action_61 (15) = happyGoto action_26
action_61 _ = happyReduce_24

action_62 (29) = happyShift action_64
action_62 _ = happyFail (happyExpListPerState 62)

action_63 _ = happyReduce_8

action_64 _ = happyReduce_1

action_65 _ = happyReduce_22

action_66 (25) = happyShift action_129
action_66 (51) = happyShift action_71
action_66 (52) = happyShift action_72
action_66 (53) = happyShift action_73
action_66 (54) = happyShift action_74
action_66 (55) = happyShift action_75
action_66 (56) = happyShift action_76
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (25) = happyShift action_128
action_67 (51) = happyShift action_71
action_67 (52) = happyShift action_72
action_67 (53) = happyShift action_73
action_67 (54) = happyShift action_74
action_67 (55) = happyShift action_75
action_67 (56) = happyShift action_76
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (25) = happyShift action_127
action_68 (51) = happyShift action_71
action_68 (52) = happyShift action_72
action_68 (53) = happyShift action_73
action_68 (54) = happyShift action_74
action_68 (55) = happyShift action_75
action_68 (56) = happyShift action_76
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (25) = happyShift action_126
action_69 (51) = happyShift action_71
action_69 (52) = happyShift action_72
action_69 (53) = happyShift action_73
action_69 (54) = happyShift action_74
action_69 (55) = happyShift action_75
action_69 (56) = happyShift action_76
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (31) = happyShift action_125
action_70 (35) = happyShift action_27
action_70 (36) = happyShift action_28
action_70 (37) = happyShift action_29
action_70 (38) = happyShift action_30
action_70 (39) = happyShift action_31
action_70 (41) = happyShift action_32
action_70 (61) = happyShift action_33
action_70 (15) = happyGoto action_124
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (22) = happyShift action_48
action_71 (24) = happyShift action_49
action_71 (45) = happyShift action_50
action_71 (46) = happyShift action_51
action_71 (59) = happyShift action_52
action_71 (61) = happyShift action_53
action_71 (62) = happyShift action_54
action_71 (63) = happyShift action_55
action_71 (18) = happyGoto action_123
action_71 (19) = happyGoto action_46
action_71 (20) = happyGoto action_47
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (22) = happyShift action_48
action_72 (24) = happyShift action_49
action_72 (45) = happyShift action_50
action_72 (46) = happyShift action_51
action_72 (59) = happyShift action_52
action_72 (61) = happyShift action_53
action_72 (62) = happyShift action_54
action_72 (63) = happyShift action_55
action_72 (18) = happyGoto action_122
action_72 (19) = happyGoto action_46
action_72 (20) = happyGoto action_47
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (22) = happyShift action_48
action_73 (24) = happyShift action_49
action_73 (45) = happyShift action_50
action_73 (46) = happyShift action_51
action_73 (59) = happyShift action_52
action_73 (61) = happyShift action_53
action_73 (62) = happyShift action_54
action_73 (63) = happyShift action_55
action_73 (18) = happyGoto action_121
action_73 (19) = happyGoto action_46
action_73 (20) = happyGoto action_47
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (22) = happyShift action_48
action_74 (24) = happyShift action_49
action_74 (45) = happyShift action_50
action_74 (46) = happyShift action_51
action_74 (59) = happyShift action_52
action_74 (61) = happyShift action_53
action_74 (62) = happyShift action_54
action_74 (63) = happyShift action_55
action_74 (18) = happyGoto action_120
action_74 (19) = happyGoto action_46
action_74 (20) = happyGoto action_47
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (22) = happyShift action_48
action_75 (24) = happyShift action_49
action_75 (45) = happyShift action_50
action_75 (46) = happyShift action_51
action_75 (59) = happyShift action_52
action_75 (61) = happyShift action_53
action_75 (62) = happyShift action_54
action_75 (63) = happyShift action_55
action_75 (18) = happyGoto action_119
action_75 (19) = happyGoto action_46
action_75 (20) = happyGoto action_47
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (22) = happyShift action_48
action_76 (24) = happyShift action_49
action_76 (45) = happyShift action_50
action_76 (46) = happyShift action_51
action_76 (59) = happyShift action_52
action_76 (61) = happyShift action_53
action_76 (62) = happyShift action_54
action_76 (63) = happyShift action_55
action_76 (18) = happyGoto action_118
action_76 (19) = happyGoto action_46
action_76 (20) = happyGoto action_47
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (22) = happyShift action_48
action_77 (24) = happyShift action_49
action_77 (45) = happyShift action_50
action_77 (46) = happyShift action_51
action_77 (59) = happyShift action_52
action_77 (61) = happyShift action_53
action_77 (62) = happyShift action_54
action_77 (63) = happyShift action_55
action_77 (17) = happyGoto action_116
action_77 (18) = happyGoto action_45
action_77 (19) = happyGoto action_46
action_77 (20) = happyGoto action_47
action_77 (21) = happyGoto action_117
action_77 _ = happyReduce_67

action_78 _ = happyReduce_56

action_79 _ = happyReduce_57

action_80 _ = happyReduce_58

action_81 (25) = happyShift action_115
action_81 (51) = happyShift action_71
action_81 (52) = happyShift action_72
action_81 (53) = happyShift action_73
action_81 (54) = happyShift action_74
action_81 (55) = happyShift action_75
action_81 (56) = happyShift action_76
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (22) = happyShift action_48
action_82 (24) = happyShift action_49
action_82 (45) = happyShift action_50
action_82 (46) = happyShift action_51
action_82 (59) = happyShift action_52
action_82 (61) = happyShift action_53
action_82 (62) = happyShift action_54
action_82 (63) = happyShift action_55
action_82 (20) = happyGoto action_114
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (22) = happyShift action_48
action_83 (24) = happyShift action_49
action_83 (45) = happyShift action_50
action_83 (46) = happyShift action_51
action_83 (59) = happyShift action_52
action_83 (61) = happyShift action_53
action_83 (62) = happyShift action_54
action_83 (63) = happyShift action_55
action_83 (20) = happyGoto action_113
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (22) = happyShift action_48
action_84 (24) = happyShift action_49
action_84 (45) = happyShift action_50
action_84 (46) = happyShift action_51
action_84 (59) = happyShift action_52
action_84 (61) = happyShift action_53
action_84 (62) = happyShift action_54
action_84 (63) = happyShift action_55
action_84 (20) = happyGoto action_112
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (22) = happyShift action_48
action_85 (24) = happyShift action_49
action_85 (45) = happyShift action_50
action_85 (46) = happyShift action_51
action_85 (59) = happyShift action_52
action_85 (61) = happyShift action_53
action_85 (62) = happyShift action_54
action_85 (63) = happyShift action_55
action_85 (20) = happyGoto action_111
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (22) = happyShift action_48
action_86 (24) = happyShift action_49
action_86 (45) = happyShift action_50
action_86 (46) = happyShift action_51
action_86 (59) = happyShift action_52
action_86 (61) = happyShift action_53
action_86 (62) = happyShift action_54
action_86 (63) = happyShift action_55
action_86 (20) = happyGoto action_110
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (22) = happyShift action_48
action_87 (24) = happyShift action_49
action_87 (45) = happyShift action_50
action_87 (46) = happyShift action_51
action_87 (59) = happyShift action_52
action_87 (61) = happyShift action_53
action_87 (62) = happyShift action_54
action_87 (63) = happyShift action_55
action_87 (19) = happyGoto action_109
action_87 (20) = happyGoto action_47
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (22) = happyShift action_48
action_88 (24) = happyShift action_49
action_88 (45) = happyShift action_50
action_88 (46) = happyShift action_51
action_88 (59) = happyShift action_52
action_88 (61) = happyShift action_53
action_88 (62) = happyShift action_54
action_88 (63) = happyShift action_55
action_88 (19) = happyGoto action_108
action_88 (20) = happyGoto action_47
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (22) = happyShift action_48
action_89 (24) = happyShift action_49
action_89 (45) = happyShift action_50
action_89 (46) = happyShift action_51
action_89 (59) = happyShift action_52
action_89 (61) = happyShift action_53
action_89 (62) = happyShift action_54
action_89 (63) = happyShift action_55
action_89 (19) = happyGoto action_107
action_89 (20) = happyGoto action_47
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (22) = happyShift action_48
action_90 (24) = happyShift action_49
action_90 (45) = happyShift action_50
action_90 (46) = happyShift action_51
action_90 (59) = happyShift action_52
action_90 (61) = happyShift action_53
action_90 (62) = happyShift action_54
action_90 (63) = happyShift action_55
action_90 (19) = happyGoto action_106
action_90 (20) = happyGoto action_47
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (31) = happyShift action_105
action_91 (35) = happyShift action_27
action_91 (36) = happyShift action_28
action_91 (37) = happyShift action_29
action_91 (38) = happyShift action_30
action_91 (39) = happyShift action_31
action_91 (41) = happyShift action_32
action_91 (61) = happyShift action_33
action_91 (15) = happyGoto action_104
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (51) = happyShift action_71
action_92 (52) = happyShift action_72
action_92 (53) = happyShift action_73
action_92 (54) = happyShift action_74
action_92 (55) = happyShift action_75
action_92 (56) = happyShift action_76
action_92 _ = happyReduce_25

action_93 (32) = happyShift action_103
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (23) = happyShift action_102
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (26) = happyShift action_101
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (61) = happyShift action_8
action_96 (8) = happyGoto action_37
action_96 (12) = happyGoto action_100
action_96 (13) = happyGoto action_39
action_96 _ = happyFail (happyExpListPerState 96)

action_97 _ = happyReduce_17

action_98 (23) = happyShift action_99
action_98 _ = happyFail (happyExpListPerState 98)

action_99 _ = happyReduce_21

action_100 _ = happyReduce_19

action_101 (23) = happyShift action_137
action_101 _ = happyFail (happyExpListPerState 101)

action_102 _ = happyReduce_16

action_103 (27) = happyShift action_136
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (43) = happyShift action_135
action_104 (16) = happyGoto action_134
action_104 _ = happyReduce_37

action_105 (35) = happyShift action_27
action_105 (36) = happyShift action_28
action_105 (37) = happyShift action_29
action_105 (38) = happyShift action_30
action_105 (39) = happyShift action_31
action_105 (41) = happyShift action_32
action_105 (61) = happyShift action_33
action_105 (14) = happyGoto action_133
action_105 (15) = happyGoto action_26
action_105 _ = happyReduce_24

action_106 (47) = happyShift action_82
action_106 (48) = happyShift action_83
action_106 (49) = happyShift action_84
action_106 (50) = happyShift action_85
action_106 (57) = happyShift action_86
action_106 _ = happyReduce_48

action_107 (47) = happyShift action_82
action_107 (48) = happyShift action_83
action_107 (49) = happyShift action_84
action_107 (50) = happyShift action_85
action_107 (57) = happyShift action_86
action_107 _ = happyReduce_47

action_108 (47) = happyShift action_82
action_108 (48) = happyShift action_83
action_108 (49) = happyShift action_84
action_108 (50) = happyShift action_85
action_108 (57) = happyShift action_86
action_108 _ = happyReduce_46

action_109 (47) = happyShift action_82
action_109 (48) = happyShift action_83
action_109 (49) = happyShift action_84
action_109 (50) = happyShift action_85
action_109 (57) = happyShift action_86
action_109 _ = happyReduce_45

action_110 _ = happyReduce_54

action_111 _ = happyReduce_53

action_112 _ = happyReduce_52

action_113 _ = happyReduce_51

action_114 _ = happyReduce_50

action_115 _ = happyReduce_64

action_116 (28) = happyShift action_132
action_116 (51) = happyShift action_71
action_116 (52) = happyShift action_72
action_116 (53) = happyShift action_73
action_116 (54) = happyShift action_74
action_116 (55) = happyShift action_75
action_116 (56) = happyShift action_76
action_116 _ = happyReduce_66

action_117 (25) = happyShift action_131
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (45) = happyShift action_87
action_118 (46) = happyShift action_88
action_118 (58) = happyShift action_89
action_118 (60) = happyShift action_90
action_118 _ = happyReduce_43

action_119 (45) = happyShift action_87
action_119 (46) = happyShift action_88
action_119 (58) = happyShift action_89
action_119 (60) = happyShift action_90
action_119 _ = happyReduce_42

action_120 (45) = happyShift action_87
action_120 (46) = happyShift action_88
action_120 (58) = happyShift action_89
action_120 (60) = happyShift action_90
action_120 _ = happyReduce_41

action_121 (45) = happyShift action_87
action_121 (46) = happyShift action_88
action_121 (58) = happyShift action_89
action_121 (60) = happyShift action_90
action_121 _ = happyReduce_40

action_122 (45) = happyShift action_87
action_122 (46) = happyShift action_88
action_122 (58) = happyShift action_89
action_122 (60) = happyShift action_90
action_122 _ = happyReduce_39

action_123 (45) = happyShift action_87
action_123 (46) = happyShift action_88
action_123 (58) = happyShift action_89
action_123 (60) = happyShift action_90
action_123 _ = happyReduce_38

action_124 _ = happyReduce_31

action_125 (35) = happyShift action_27
action_125 (36) = happyShift action_28
action_125 (37) = happyShift action_29
action_125 (38) = happyShift action_30
action_125 (39) = happyShift action_31
action_125 (41) = happyShift action_32
action_125 (61) = happyShift action_33
action_125 (14) = happyGoto action_130
action_125 (15) = happyGoto action_26
action_125 _ = happyReduce_24

action_126 _ = happyReduce_29

action_127 _ = happyReduce_28

action_128 _ = happyReduce_27

action_129 _ = happyReduce_26

action_130 (32) = happyShift action_142
action_130 _ = happyFail (happyExpListPerState 130)

action_131 _ = happyReduce_59

action_132 (22) = happyShift action_48
action_132 (24) = happyShift action_49
action_132 (45) = happyShift action_50
action_132 (46) = happyShift action_51
action_132 (59) = happyShift action_52
action_132 (61) = happyShift action_53
action_132 (62) = happyShift action_54
action_132 (63) = happyShift action_55
action_132 (17) = happyGoto action_116
action_132 (18) = happyGoto action_45
action_132 (19) = happyGoto action_46
action_132 (20) = happyGoto action_47
action_132 (21) = happyGoto action_141
action_132 _ = happyReduce_67

action_133 (32) = happyShift action_140
action_133 _ = happyFail (happyExpListPerState 133)

action_134 _ = happyReduce_33

action_135 (31) = happyShift action_139
action_135 (35) = happyShift action_27
action_135 (36) = happyShift action_28
action_135 (37) = happyShift action_29
action_135 (38) = happyShift action_30
action_135 (39) = happyShift action_31
action_135 (41) = happyShift action_32
action_135 (61) = happyShift action_33
action_135 (15) = happyGoto action_138
action_135 _ = happyFail (happyExpListPerState 135)

action_136 _ = happyReduce_14

action_137 _ = happyReduce_15

action_138 _ = happyReduce_36

action_139 (35) = happyShift action_27
action_139 (36) = happyShift action_28
action_139 (37) = happyShift action_29
action_139 (38) = happyShift action_30
action_139 (39) = happyShift action_31
action_139 (41) = happyShift action_32
action_139 (61) = happyShift action_33
action_139 (14) = happyGoto action_144
action_139 (15) = happyGoto action_26
action_139 _ = happyReduce_24

action_140 (43) = happyShift action_135
action_140 (16) = happyGoto action_143
action_140 _ = happyReduce_37

action_141 _ = happyReduce_65

action_142 _ = happyReduce_30

action_143 _ = happyReduce_32

action_144 (32) = happyShift action_145
action_144 _ = happyFail (happyExpListPerState 144)

action_145 _ = happyReduce_35

happyReduce_1 = happyReduce 6 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Program happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_0  4 happyReduction_2
happyReduction_2  =  HappyAbsSyn4
		 (Program [] [] []
	)

happyReduce_3 = happySpecReduce_3  5 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2 : happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_2  5 happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 ([happy_var_2]
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_0  5 happyReduction_5
happyReduction_5  =  HappyAbsSyn5
		 ([]
	)

happyReduce_6 = happySpecReduce_2  6 happyReduction_6
happyReduction_6 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 : happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  6 happyReduction_7
happyReduction_7 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happyReduce 4 7 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyTerminal (TType happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 ((happy_var_1, Type happy_var_3)
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_3  8 happyReduction_9
happyReduction_9 (HappyAbsSyn8  happy_var_3)
	_
	(HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn8
		 ((Var happy_var_1) : happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  8 happyReduction_10
happyReduction_10 (HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn8
		 ([Var happy_var_1]
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  9 happyReduction_11
happyReduction_11 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 : happy_var_2
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  9 happyReduction_12
happyReduction_12 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_0  9 happyReduction_13
happyReduction_13  =  HappyAbsSyn9
		 ([]
	)

happyReduce_14 = happyReduce 7 10 happyReduction_14
happyReduction_14 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Function happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 7 11 happyReduction_15
happyReduction_15 ((HappyTerminal (TType happy_var_7)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVariable happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (((Var happy_var_2, Type happy_var_7), happy_var_4)
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 6 11 happyReduction_16
happyReduction_16 ((HappyTerminal (TType happy_var_6)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVariable happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (((Var happy_var_2, Type happy_var_6), [])
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 5 11 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVariable happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (((Var happy_var_2, Type ""), happy_var_4)
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_2  11 happyReduction_18
happyReduction_18 (HappyTerminal (TVariable happy_var_2))
	_
	 =  HappyAbsSyn11
		 (((Var happy_var_2, Type ""), [])
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  12 happyReduction_19
happyReduction_19 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  12 happyReduction_20
happyReduction_20 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 ([happy_var_1]
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  13 happyReduction_21
happyReduction_21 (HappyTerminal (TType happy_var_3))
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn13
		 ((happy_var_1, Type happy_var_3)
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  14 happyReduction_22
happyReduction_22 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 ((Operator happy_var_1) : happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_2  14 happyReduction_23
happyReduction_23 _
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 ([Operator happy_var_1]
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_0  14 happyReduction_24
happyReduction_24  =  HappyAbsSyn14
		 ([]
	)

happyReduce_25 = happySpecReduce_3  15 happyReduction_25
happyReduction_25 (HappyAbsSyn17  happy_var_3)
	_
	(HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn15
		 (Assign (Var happy_var_1) happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happyReduce 4 15 happyReduction_26
happyReduction_26 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (Read happy_var_3
	) `HappyStk` happyRest

happyReduce_27 = happyReduce 4 15 happyReduction_27
happyReduction_27 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (Readln happy_var_3
	) `HappyStk` happyRest

happyReduce_28 = happyReduce 4 15 happyReduction_28
happyReduction_28 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (Write happy_var_3
	) `HappyStk` happyRest

happyReduce_29 = happyReduce 4 15 happyReduction_29
happyReduction_29 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (Writeln happy_var_3
	) `HappyStk` happyRest

happyReduce_30 = happyReduce 6 15 happyReduction_30
happyReduction_30 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (While happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_31 = happyReduce 4 15 happyReduction_31
happyReduction_31 ((HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (While happy_var_2 [Operator happy_var_4]
	) `HappyStk` happyRest

happyReduce_32 = happyReduce 7 15 happyReduction_32
happyReduction_32 ((HappyAbsSyn16  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (If happy_var_2 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_33 = happyReduce 5 15 happyReduction_33
happyReduction_33 ((HappyAbsSyn16  happy_var_5) `HappyStk`
	(HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (If happy_var_2 [Operator happy_var_4] happy_var_5
	) `HappyStk` happyRest

happyReduce_34 = happySpecReduce_1  15 happyReduction_34
happyReduction_34 (HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn15
		 (Var happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happyReduce 4 16 happyReduction_35
happyReduction_35 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (happy_var_3
	) `HappyStk` happyRest

happyReduce_36 = happySpecReduce_2  16 happyReduction_36
happyReduction_36 (HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn16
		 ([Operator happy_var_2]
	)
happyReduction_36 _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_0  16 happyReduction_37
happyReduction_37  =  HappyAbsSyn16
		 ([]
	)

happyReduce_38 = happySpecReduce_3  17 happyReduction_38
happyReduction_38 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (LT_ happy_var_1 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  17 happyReduction_39
happyReduction_39 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (GT_ happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  17 happyReduction_40
happyReduction_40 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (LTE_ happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  17 happyReduction_41
happyReduction_41 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (GTE_ happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  17 happyReduction_42
happyReduction_42 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (Eq happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  17 happyReduction_43
happyReduction_43 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (NotEq happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  17 happyReduction_44
happyReduction_44 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  18 happyReduction_45
happyReduction_45 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (Sum happy_var_1 happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  18 happyReduction_46
happyReduction_46 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  18 happyReduction_47
happyReduction_47 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (Or happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  18 happyReduction_48
happyReduction_48 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (Xor happy_var_1 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  18 happyReduction_49
happyReduction_49 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  19 happyReduction_50
happyReduction_50 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (Mul happy_var_1 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  19 happyReduction_51
happyReduction_51 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (Divide happy_var_1 happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  19 happyReduction_52
happyReduction_52 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (Div happy_var_1 happy_var_3
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  19 happyReduction_53
happyReduction_53 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (Mod happy_var_1 happy_var_3
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  19 happyReduction_54
happyReduction_54 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (And happy_var_1 happy_var_3
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  19 happyReduction_55
happyReduction_55 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_2  20 happyReduction_56
happyReduction_56 (HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (Not happy_var_2
	)
happyReduction_56 _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_2  20 happyReduction_57
happyReduction_57 (HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (Neg happy_var_2
	)
happyReduction_57 _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_2  20 happyReduction_58
happyReduction_58 (HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (Pos happy_var_2
	)
happyReduction_58 _ _  = notHappyAtAll 

happyReduce_59 = happyReduce 4 20 happyReduction_59
happyReduction_59 (_ `HappyStk`
	(HappyAbsSyn21  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVariable happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (Fun (Var happy_var_1) happy_var_3
	) `HappyStk` happyRest

happyReduce_60 = happySpecReduce_1  20 happyReduction_60
happyReduction_60 (HappyTerminal (TVariable happy_var_1))
	 =  HappyAbsSyn20
		 (Var happy_var_1
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  20 happyReduction_61
happyReduction_61 (HappyTerminal (TNumber happy_var_1))
	 =  HappyAbsSyn20
		 (Num happy_var_1
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  20 happyReduction_62
happyReduction_62 (HappyTerminal (TStr happy_var_1))
	 =  HappyAbsSyn20
		 (Str happy_var_1
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  20 happyReduction_63
happyReduction_63 (HappyTerminal (TBool happy_var_1))
	 =  HappyAbsSyn20
		 (Bool happy_var_1
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  20 happyReduction_64
happyReduction_64 _
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (happy_var_2
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  21 happyReduction_65
happyReduction_65 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_1 : happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_1  21 happyReduction_66
happyReduction_66 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn21
		 ([happy_var_1]
	)
happyReduction_66 _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_0  21 happyReduction_67
happyReduction_67  =  HappyAbsSyn21
		 ([]
	)

happyNewToken action sts stk [] =
	action 64 64 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TBool happy_dollar_dollar -> cont 22;
	TType happy_dollar_dollar -> cont 23;
	TLeftParen -> cont 24;
	TRightParen -> cont 25;
	TColon -> cont 26;
	TSemicolon -> cont 27;
	TComma -> cont 28;
	TDot -> cont 29;
	TVar -> cont 30;
	TBegin -> cont 31;
	TEnd -> cont 32;
	TFunction -> cont 33;
	TProcedure -> cont 34;
	TRead -> cont 35;
	TReadln -> cont 36;
	TWrite -> cont 37;
	TWriteln -> cont 38;
	TWhile -> cont 39;
	TDo -> cont 40;
	TIf -> cont 41;
	TThen -> cont 42;
	TElse -> cont 43;
	TAssign -> cont 44;
	TSum -> cont 45;
	TSub -> cont 46;
	TMul -> cont 47;
	TDivide -> cont 48;
	TDiv -> cont 49;
	TMod -> cont 50;
	TLT -> cont 51;
	TGT -> cont 52;
	TLTE -> cont 53;
	TGTE -> cont 54;
	TEq -> cont 55;
	TNotEq -> cont 56;
	TAnd -> cont 57;
	TOr -> cont 58;
	TNot -> cont 59;
	TXor -> cont 60;
	TVariable happy_dollar_dollar -> cont 61;
	TNumber happy_dollar_dollar -> cont 62;
	TStr happy_dollar_dollar -> cont 63;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 64 tk tks = happyError' (tks, explist)
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
