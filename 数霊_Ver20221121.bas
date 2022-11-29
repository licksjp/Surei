100 '数霊(かずたま) 製作開始日:2021.07.28
110 '2021年度
120 'Version 0.0.1_2021.07.28 テスト版１
130 'Version 0.0.2_2021.11.27 テスト版２
140 'Version 0.0.3_2021.11.29 テスト版3
150 'Version 0.0.4_2021.11.30 - 12.01 α1
160 'Version 0.0.5_2021.12.02 - 12.03 α2
170 'Version 0.0.6_2021.12.10 (α3)
180 'Version 0.0.7_2021.12.11 (α4)
190 'Version 0.0.8_2021.12.13 (α5)
200 'Version 0.0.9_2021.12.16 -2021.12.18 (α6)
210 'Version 0.1.0_2021.12.19 -2021.12.23 (β1)
220 'Version 0.1.1_2021.12.24 -2021.12.27 (β2)
230 'Version 0.1.2_2021.12.27 -2021.12.31 (β3)
240 '2022年度
250 'Version 0.1.3_2021.12.31 -2022.01.03 (β4)
260 'Version 0.1.4_2022.01.09 -2022.01.15 (β5)
270 'Version 0.1.5_2022.01.26 -2022.01.30 (Release1):R1
280 'Version 1.0.1_2022.02.12(Release2):R3
290 'Version 1.0.2_2022.02.20(Release):正式版
300 'Version 1.0.3_2022.03.27(Release)  正式版
310 'Version 1.0.9_2022.10.20(Release):正式版
320 'Version 1.1.1_2022.11.04(Release):正式版
330 'Version 1.1.2_2022.11.05(Release):正式版
340 'Version 1.1.3_2022.11.06(Release):正式版
350 'Version 1.1.4_2022.11.09(Release):正式版
360 'Version 1.1.6_2022.11.12(Release):正式版)
370 'Version 1.1.7_2022.11.16(Release):正式版)
380 'Version 1.1.8_2022.11.23(Release):正式版)
390 Version$ = "1.1.9_2022.11.22(正式版)"
400 'csvファイル 1.数霊 ベースファイル
410 FILE_csv$ = "data/Kazutama.csv"
420 'csvファイル 2.数霊 ベースファイル 2
430 FILE_csv2$ = "data/Surei_chart_20211207.csv"
440 'Save ファイル
450 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
460 'gazo ファイル
470 Gazo$ = "data/Gazo/"
480 'Sound File(Voice)
490 '1.ボイス TopScreen
500 Voice_File_TopScreen$ = "data/Sound_data/"
510 '変数領域
520 'vcount:バーチャルパッド下の変数
530 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50):c=1:vcount=0:timer=0
540 count2 = 0:N=0:N2=0:m2 = 0
550 'ファイルの有無チェック
560 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
570 '1.ファイルが無いとき
580 cls :print "依存ファイルが見つかりません":
590 print "エンターキーを押してください" + chr$(13)
600 key$ = input$(1)
610 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
620 else
630 '2.ファイルが有るとき
640 cls:print "csv:file ok." + chr$(13)
650 n=0
660 open FILE_csv$ for input as #1
670 while eof(1) = 0
680 input #1,line$
690 'print line$
700 bufline$(n) = line$
710 'Print n;chr$(13)
720 n = n + 1
730 wend
740 close #1
750 N=n
760 '2つ目のファイル読み込み
770 'n = 0
780 open FILE_csv2$ for input as #2
790 for n=3 to 181
800 for i=0 to 1
810 input #2,line$
820 bufline2$(n,i) = line$
830 next i
840 next n
850 close #2
860 N2 = n
870 '
880 endif
890 'or j = 3 to 181+3
900 'ufline3$(j - 3,n) = bufline2$(i,n)
910 'next j
920 'moji$ = Kotodama$(bufline3$(16))
930 'erase bufline2$
940 '2022.11.23----------------------
950 '端末言語のチェック
960 '日本語端末かチェックをして日本語以外なら英語で表示する
970 'lang flag:0:日本語 1:英語(日本語以外)
980 '--------------------------------
990 lang_flag = 0
1000 if ex_info$(1) <> "JP" then
1010 lang_flag = 1
1020 endif
1030 'Top画面
1040 TopScreen:
1050 'バーチャルパッドを表示
1060 cls 3:font 48:screen 1,1,1:init"kb:4"
1070 'play ""
1080 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
1090 gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
1100 '選択肢 1
1110 gload Gazo$ + "Selection.png",1,5,200
1120 '選択肢 2
1130 gload Gazo$ + "Selection.png",1,5,300
1140 '選択肢 3
1150 gload Gazo$ + "Selection.png",1,5,400
1160 '選択肢 4
1170 gload Gazo$ + "Selection.png",1,5,500
1180 color rgb(0,0,255)
1190 print chr$(13)
1200 if lang_flag = 1 then
1210 color rgb(255,255,255)
1220 print "Select Number" + chr$(13)
1230 print " :1.Kazutama check" + chr$(13)
1240 print " :2.Setting" + chr$(13)
1250 print " :3.Help" + chr$(13)
1260 print " :4.End Program" + chr$(13)
1270 color rgb(255,255,255)
1280 else
1290 color rgb(255,255,255)
1300 print "番号を選んでください" + chr$(13)
1310 print " :1.数霊(かずたま)チェック" + chr$(13)
1320 print " :2.設定" + chr$(13)
1330 print " :3.ヘルプ" + chr$(13)
1340 print " :4.終　了" + chr$(13)
1350 color rgb(0,0,0)
1360 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
1370 'バーチャルパッドを表示
1380 No=1:
1390 'lang_flag:1 外国語,0:日本語
1400 if lang_flag = 1 then
1410 'lang_flag=1 英語
1420 else
1430 'lang_flag=0 日本語
1440 locate 0,12:color rgb(0,0,0):print "1.数霊(かずたま)チェックを選択";chr$(13)
1450 endif
1460 endif
1470 'スプライト
1480 '選択肢 1 On
1490 sp_def 0,(5,200),32,32
1500 sp_on 0,1
1510 sp_put 0,(5,200),0,0
1520 '選択肢 2 Off
1530 sp_def 1,(5,300),32,32
1540 sp_on 1,0
1550 sp_put 1,(5,300),0,0
1560 '選択肢 3 Off
1570 sp_def 2,(5,400),32,32
1580 sp_on 2,0
1590 sp_put 2,(5,400),0,0
1600 '選択肢 4 Off
1610 sp_def 3,(5,500),32,32
1620 sp_on 3,0
1630 sp_put 3,(5,500),0,0
1640 color rgb(0,0,0)
1650 Main_Select:
1660 'y:バーチャルパッドの処理
1670 'key$:カーソルの処理
1680 y = 0:key$ = "":bg = 0
1690 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
1700 y = stick(1)
1710 key$ = inkey$
1720 bg = strig(1)
1730 pause 2
1740 wend
1750 'if y=1 then
1760 'select case (No Mod 4)
1770 'ase 0:
1780 '     c=1:No=c:sp_on 0,1:sp_on 1,0 :sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print " 数霊(かずたま)チェックを選択":beep:goto Main_Select:
1790 'case 1:
1800 '       =2:No=c:sp_on 0,0:
1810 '"ase 2:
1820 'ase 3:
1830 'nd select
1840 'ndif
1850 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
1860 '1.バーチャルパッドの処理
1870 'バーチャルパッド下を押した時
1880 if y = 1 then
1890 select case No
1900 'No の初期値：No=1
1910 case 1:
1920 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":
1930 if lang_flag = 1 then
1940 'lang_flag=1 英語
1950 else
1960 'lang_flag=0 日本語
1970 locate 0,12:print "2.設定を選択":goto Main_Select:
1980 endif
1990 'デバッグライン　ここから
2000 '0のとき
2010 'デバッグライン　ここまで
2020 'デバッグライン　ここから
2030 'バーチャルパッド　下
2040 case 2:
2050 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:
2060 if lang_flag = 1 then
2070 else
2080 print "                                         ":
2090 color rgb(0,0,0):locate 0,12:
2100 print "3.ヘルプを選択":No=3:goto Main_Select:
2110 endif
2120 'cls:color rgb(255,255,255):print"ok"
2130 'デバッグライン　ここまで
2140 case 3:
2150 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                               "
2160 if lang_flag = 1 then
2170 else
2180 locate 0,12:print "4.終了を選択":No=0:goto Main_Select:
2190 endif
2200 'デバッグライン　ここから
2210 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
2220 'デバッグライン　ここまで
2230 case 0:
2240 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1
2250 if lang_flag = 1 then
2260 'lang_flag=1:英語
2270 else
2280 'lang_flag=0:日本語
2290 locate 0,12:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
2300 'endif
2310 endif
2320 'デバッグライン　ここから
2330 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
2340 'デバッグライン　ここまで
2350 end select
2360 endif
2370 'バーチャルパッド　上 ここから
2380 if y = -1 then
2390 select case No
2400 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
2410 case 1:
2420 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       "
2430 if lang_flag = 1 then
2440 'lang_flag=1 英語
2450 else
2460 'lang_flag=0 日本語
2470 locate 0,12:print "4.終了を選択":goto Main_Select:
2480 endif
2490 'endif
2500 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
2510 case 0:
2520 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":
2530 if lang_flag = 1 then
2540 '1:英語
2550 else
2560 '0:日本語
2570 locate 0,12:print "3.ヘルプを選択":goto Main_Select:
2580 endif
2590 'No:3 3.Help→2.設定 No:2
2600 case 3:
2610 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      "
2620 if lang_flag = 1 then
2630 '1:英語
2640 else
2650 '0:日本語
2660 locate 0,12:print"2.設定を選択":goto Main_Select:
2670 endif
2680 case 2:
2690 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":
2700 if lang_flag = 1 then
2710 'lang_flag 1 英語
2720 else
2730 'lang_flag 0 日本語
2740 locate 0,12:print"1.数霊(かずたま)チェックを選択":goto Main_Select:
2750 endif
2760 end select
2770 endif
2780 if bg=1 then
2790 select case No
2800 '1.数霊チェックを選択  パッドの右キー
2810 case 1:
2820 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
2830 '2.設定を選択    パッドの右キー
2840 case 2:
2850 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
2860 '3.ヘルプを選択 パッドの右
2870 case 3:
2880 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
2890 'プログラムの終了を選択
2900 case 0:
2910 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:
2920 if lang_flag = 1 then
2930 'lang_flag = 1 英語
2940 else
2950 'lang_flag = 0 日本語
2960 ui_msg "プログラムを終了します":color rgb(255,255,255):end
2970 endif
2980 end select
2990 '4.終了するを選択  パッドの右
3000 endif
3010 'バーチャルパッド　上　ここまで
3020 '2.カーソルの処理
3030 'カーソル　下 chr$(31)
3040 if (key$ = chr$(31)) then
3050 select case (No)
3060 '4
3070 '0 選択肢4 => 選択肢1
3080 case 0:
3090 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "              ":color rgb(0,0,0):
3100 if lang_flag = 1 then
3110 'lang flag:1 英語
3120 else
3130 'lang flag:0 日本語
3140 color rgb(0,0,0):locate 0,12:print "1.数霊(かずたま)チェックを選択":beep:goto Main_Select:
3150 endif
3160 '1 選択肢1 => 選択肢2
3170 case 1:
3180 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":
3190 if lang_flag = 1 then
3200 'lang_flag:1 英語
3210 else
3220 'lang_flag:0 日本語
3230 color rgb(0,0,0):locate 0,12:print "2.設定を選択":beep:goto Main_Select:
3240 endif
3250 '2 選択肢2 => 選択肢3
3260 case 2:
3270 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "               ":
3280 if lang_flag = 1 then
3290 'lang flag:1 英語
3300 else
3310 'lang flang:0 日本語
3320 color rgb(0,0,0):locate 0,12:print "3.ヘルプを選択":beep:goto Main_Select:
3330 endif
3340 '3 選択肢３ => 選択肢4
3350 case 3:
3360 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "               ":color rgb(0,0,0)
3370 if lang_flag = 1 then
3380 'lang_flag = 1 英語
3390 else
3400 'lang_flag = 0 日本語
3410 color rgb(0,0,0):locate 0,12:print "4.終 了を選択":beep:goto Main_Select:
3420 endif
3430 case else:
3440 goto Main_Select:
3450 end select
3460 endif
3470 'カーソル　上
3480 if key$=chr$(30) then
3490 select case (No)
3500 '選択肢1 => 選択肢4
3510 case 1:
3520 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:PRINT "                      ":
3530 if lang_flag = 1 then
3540 'lang_flag=1:英語
3550 else
3560 'lang_flag = 0:日本語
3570 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
3580 endif
3590 '選択肢2 => 選択肢1
3600 case 2:
3610 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                 ":locate 1,12:beep:print "2.設 定を選択":beep:goto Main_Select:
3620 '選択肢3　=> 選択肢2
3630 case 3:
3640 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0
3650 if lang_flag = 1 then
3660 'lang_flag = 1:英語
3670 else
3680 'lang_flag = 0:日本語
3690 locate 0,12:beep:print "3.ヘルプを選択":goto Main_Select:
3700 endif
3710 '選択肢4 => 選択肢3
3720 case 0:
3730 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 1,12:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
3740 if lang_flag = 1 then
3750 'lang flag=1 英語
3760 else
3770 'lang flag=0 日本語
3780 locate 1,12:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
3790 endif
3800 end select
3810 endif
3820 'Input "番号:",No
3830 'エンターキー入力:決定
3840 if key$ = chr$(13) then
3850 select case No
3860 case 1:
3870 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
3880 case 3:
3890 Color rgb(255,255,255):goto Help:
3900 case 0:
3910 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
3920 case 2:
3930 color rgb(255,255,255):goto Setting:
3940 'else
3950 'goto Main_Select:
3960 end select
3970 endif
3980 'ndif
3990 'if N0=0 or No>4 then goto TopScreen:
4000 '1-1.数霊チェック
4010 Surei_Check:
4020 cls 3:Font 48:
4030 'gload Gazo$ + "Screen4.png"
4040 gload Gazo$ + "Screen1_Sureicheck_Top20211226.png"
4050 play ""
4060 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
4070 color rgb(255,0,0)
4080 'print "●数霊(かずたま)チェックトップ" + chr$(13)
4090 sp_on 0,1:sp_put 0,(5,200),0,0:screen 1,1,1
4100 if lang_flag = 1 then
4110 'lang_flag=1 英語
4120 else
4130 'lang_flag=0 日本語
4140 print chr$(13)
4150 color rgb(255,255,255)
4160 print "番号を選んでください" + chr$(13)
4170 print " :1.数霊(かずたま)1人用" + chr$(13)
4180 print " :2.数霊(かずたま)2人用" + chr$(13)
4190 print " :3.前の画面に戻る" + chr$(13)
4200 print " :4.終 了" + chr$(13)
4210 color rgb(0,0,0):No = 1
4220 locate 0,12
4230 print "1.数霊1人用を選択"
4240 endif
4250 Kazutama_main:
4260 'y:バーチャルパッドの処理
4270 'key$:カーソルの処理
4280 'bg:バーチャルパッドの右のボタン
4290 y = 0:key$ = "":bg=0
4300 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
4310 y = stick(1)
4320 key$ = inkey$
4330 bg=strig(1)
4340 pause 2
4350 wend
4360 'key$ = input$(1)
4370 if y = 1 then
4380 select case No
4390 'No の初期値：No=1
4400 case 1:
4410 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":
4420 if lang_flag=1 then
4430 else
4440 locate 0,12
4450 print"2.数霊(かずたま)2人用を選択":goto Kazutama_main:
4460 endif
4470 'デバッグライン　ここから
4480 '0のとき
4490 'デバッグライン　ここまで
4500 'デバッグライン　ここから
4510 case 2:
4520 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                               "
4530 color rgb(0,0,0):locate 1,12:print "3.前の画面に戻るを選択":No=3:goto Kazutama_main:
4540 'cls:color rgb(255,255,255):print"ok"
4550 'デバッグライン　ここまで
4560 case 3:
4570 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Kazutama_main:
4580 'デバッグライン　ここから
4590 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
4600 'デバッグライン　ここまで
4610 case 0:
4620 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.数霊(かずたま)1人用を選択":goto Kazutama_main:
4630 'デバッグライン　ここから
4640 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
4650 'デバッグライン　ここまで
4660 end select
4670 endif
4680 'バーチャルパッド　上 ここから
4690 if y = -1 then
4700 select case No
4710 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
4720 case 1:
4730 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択":goto Kazutama_main:
4740 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
4750 case 0:
4760 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.ヘルプを選択":goto Kazutama_main:
4770 'No:3 3.Help→2.設定 No:2
4780 case 3:
4790 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.設定を選択":goto Kazutama_main:
4800 case 2:
4810 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.数霊(かずたま)チェックを選択":goto Kazutama_main:
4820 end select
4830 endif
4840 if bg=1 then
4850 select case No
4860 '1.数霊チェックを選択  パッドの右キー
4870 case 1:
4880 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
4890 '2.設定を選択    パッドの右キー
4900 case 2:
4910 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
4920 '3.ヘルプを選択 パッドの右
4930 case 3:
4940 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
4950 'プログラムの終了を選択
4960 case 0:
4970 cls 3:cls 4:ui_msg "プログラムを終了します":color rgb(255,255,255):end
4980 end select
4990 '4.終了するを選択  パッドの右
5000 endif
5010 'バーチャルパッド　上　ここまで
5020 if key$ = chr$(31) then
5030 select case No
5040 case 0:
5050 No=1:sp_on 0,0:sp_on 1,1:sp_put 0,(5,300),0,0:locate 1,12:print "                                                          ":
5060 if lang_flag = 1 then
5070 Else
5080 locate 0,12:print "2.数霊(かずたま)2人用を選択":goto Kazutama_main:
5090 endif
5100 case 1:
5110 No=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                                          ":
5120 if lang_flag = 1 then
5130 Else
5140 locate 1,12:print"3.前の画面に戻るを選択":goto Kazutama_main:
5150 endif
5160 case 2:
5170 No=3:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print"                                       ":
5180 if lang_flag = 1 then
5190 Else
5200 locate 1,12:print"4.終了を選択":goto Kazutama_main:
5210 endif
5220 case 3:
5230 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":
5240 if lang_flag = 1 then
5250 Else
5260 locate 1,12:print"1.数霊（かずたま)1人用を選択":goto Kazutama_main:
5270 endif
5280 end select
5290 endif
5300 if key$=chr$(13) then
5310 select case No
5320 case 1:
5330 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_Input:
5340 case 2:
5350 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
5360 case 3:
5370 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
5380 case 0:
5390 cls 4:cls 3:talk"プログラムを終了します":ui_text"プログラムを終了します":end
5400 end select
5410 endif
5420 'Input "番号:",No
5430 '前の画面に戻る
5440 'if No = 3 then goto TopScreen:
5450 'プログラムの終了
5460 'if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":COLOR rgb(255,255,255):end
5470 '1人用
5480 'if No = 1 then goto Surei_Input:
5490 '2人用
5500 'if No = 2 then goto Surei_twoParson:
5510 'if No > 4 or No=0 then ui_msg"もう一度入れてください":goto Surei_Check:
5520 '数霊(かずたま) 文字入力  1人用
5530 Surei_Input:
5540 if mode = 0 then
5550 cls 3:font 32:init"kb:2"
5560 gload Gazo$ + "InputKotodama_20211226.png"
5570 play""
5580 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
5590 color rgb(255,0,0)
5600 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
5610 if lang_flag=1 then
5620 else
5630 print chr$(13)
5640 color rgb(0,0,0)
5650 print "文字を入れてください" + chr$(13)
5660 color rgb(255,0,0)
5670 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
5680 print chr$(13)
5690 color rgb(0,0,0)
5700 Input "入力文字:",buffer_moji$
5710 if buffer_moji$ = "" then
5720 ui_msg "未入力です":goto Surei_Input:
5730 endif
5740 else
5750 goto Surei_Result:
5760 endif
5770 else
5780 if mode = 1 then
5790 cls 3:Font 32:
5800 gload Gazo$ + "InputKotodama.png"
5810 color rgb(255,0,0)
5820 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
5830 color rgb(255,255,255)
5840 print "文字を入れてください" + chr$(13)
5850 color rgb(255,0,0)
5860 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
5870 print "大文字のみ)" + chr$(13)
5880 color rgb(0,0,0)
5890 Input "文字入力:",buffer_moji2$
5900 goto Surei_Result3:
5910 endif
5920 endif
5930 '数霊(かずたま)文字入力　2人用
5940 Surei_twoParson:
5950 cls 3:Font 32:init"kb:2"
5960 gload Gazo$ + "InputKotodama_20211226.png"
5970 '1人目入力
5980 if lang_flag = 1 then
5990 'color rgb(255,0,0)
6000 else
6010 print ""+chr$(13)
6020 'print "●数霊(かずたま) 1人目 入力" + chr$(13)
6030 color rgb(255,0,0)
6040 print "1人目の文字を入れてください" + chr$(13)
6050 color rgb(255,0,0)
6060 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
6070 color rgb(0,0,0)
6080 print chr$(13)
6090 Input "1人目文字入力:",buf_Parson1$
6100 endif
6110 Surei_twoParson2:
6120 cls 3:Font 32:init"kb:2"
6130 '2人目入力
6140 gload Gazo$ + "InputKotodama_20211226.png"
6150 'color rgb(255,0,0)
6160 'print "●数霊(かずたま) 2人目 入力" + chr$(13)
6170 if lang_falg = 1 then
6180 else
6190 print ""+chr$(13)
6200 print "2人目の文字を入れてください" + chr$(13)
6210 color rgb(255,0,0)
6220 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
6230 color rgb(0,0,0)
6240 Input "2人目の文字入力:",buf_Parson2$
6250 goto Surei_Result2:
6260 endif
6270 '数霊　計算 パート
6280 '文字の計算関数
6290 'moji$:1文字を入れる
6300 func Complate(moji$)
6310 for n = 1 to 116
6320 if moji$ = bufline$(2*n) then
6330 buffcount = val(bufline$(2 * n + 1))
6340 endif
6350 next n
6360 endfunc buffcount
6370 '数霊　結果表示
6380 Surei_Result:
6390 cls 3:Font 32
6400 'ゼロカウント:zcount
6410 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
6420 '例 アカい:"い"の文字は無効な文字なので、はじく
6430 zcount=0
6440 'mojicount:入力文字数
6450 mojicount = len(buffer_moji$)
6460 for n=1 to mojicount
6470 for j=1 to 118
6480 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
6490 if bufcount$(n - 1) = bufline$(2 * j) then
6500 zcount = zcount + 1
6510 endif
6520 next j
6530 next n
6540 if mojicount > zcount then
6550 cls 3:ui_msg "無効な文字です":talk"無効な文字があります。":zcount = 0:goto Surei_Input:
6560 endif
6570 for i = 1 to mojicount
6580 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
6590 n1 = Complate(bufcount$(i - 1))
6600 count = count + n1
6610 next i
6620 '182以上のとき,181を引く
6630 if (count > 181) then count = count - 181
6640 cls 3:Font 48+16
6650 gload Gazo$ + "Result_Screen3_20211226.png"
6660 if lang_flag = 1 then
6670 else
6680 color rgb(255,0,0)
6690 print "入力文字:" + buffer_moji$ + chr$(13)
6700 endif
6710 'print chr$(13)
6720 if lang_flag = 1 then
6730 else
6740 color rgb(0,0,255)
6750 print "数霊(かずたま):";count;chr$(13)
6760 endif
6770 if lang_flag = 1 then
6780 else
6790 color rgb(0,0,0)
6800 print "エンターキー:トップ" + chr$(13)
6810 print "スペース:次 へ" + chr$(13)
6820 endif
6830 key$ = input$(1)
6840 if key$ = " " then goto Surei_Result4:
6850 if key$ = chr$(13) then
6860 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
6870 for i=0 to 9
6880 bufcount$(i) = " "
6890 next i
6900 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
6910 'else
6920 'if key$ = " " then
6930 '２回めの入力に行く
6940 'mode = 1:goto Surei_Input:
6950 'else
6960 'if key$ = "s" or key$ = "S" then
6970 'ファイルを保存する
6980 's = Save()
6990 'ui_msg"保存しました"
7000 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
7010 else
7020 goto Surei_Result:
7030 'endif
7040 endif
7050 '3-1 バージョン情報
7060 Version:
7070 cls 3:Font 32
7080 gload Gazo$ + "Screen1_Version.png"
7090 play ""
7100 play Voice_File_TopScreen$ + "Voice_Version.mp3"
7110 color rgb(255,0,0)
7120 'print"●バージョン情報"+chr$(13)
7130 print chr$(13)
7140 color rgb(255,255,255)
7150 if lang_flag = 1 then
7160 else
7170 print "Ver:";Version$ + chr$(13)
7180 print "アプリ名:数霊"+ chr$(13)
7190 print "Basic for Android Runtime" + chr$(13)
7200 print "Author:licksjp" + chr$(13)
7210 print "制作開始:2021.7.28" + chr$(13)
7220 print chr$(13)
7230 print "(C)Copy right licksjp " + chr$(13)
7240 print "All rights reserved" + chr$(13)
7250 color rgb(0,0,0)
7260 print "パッドの右を押してください" + chr$(13)
7270 endif
7280 'key$ = input$(1)
7290 bg=0:key$=""
7300 while (bg <> 1 and key$ <> chr$(13))
7310 bg = strig(1)
7320 key$ = inkey$
7330 pause 2
7340 wend
7350 if key$ = chr$(13) then
7360 goto TopScreen:
7370 'else
7380 'talk "無効なキーです":goto Version:
7390 else
7400 if bg=1 then
7410 goto TopScreen:
7420 else
7430 if lang_flag = 1 then
7440 else
7450 talk "無効なキーです":goto Version:
7460 endif
7470 endif
7480 endif
7490 '3-2 参考文献
7500 Reference_Book:
7510 cls 3:Font 48:play""
7520 gload Gazo$ + "Screen1_Reference.png"
7530 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
7540 color rgb(255,0,0)
7550 'print"●参考文献" + chr$(13)
7560 print chr$(13)
7570 if lang_flag = 1 then
7580 else
7590 color rgb(255,255,255)
7600 print "書名:数霊" + chr$(13)
7610 print "出版社:徳間書店" + chr$(13)
7620 print "ISBN:978-4-19-" + chr$(13)
7630 print "         865309-5" + chr$(13)
7640 print "定価:2300円 + 税" + chr$(13)
7650 color rgb(0,0,0)
7660 print "パッドの右を押してください"
7670 endif
7680 bg = 0:key$ = ""
7690 while (bg <> 1 and key$ <> chr$(13))
7700 bg = strig(1)
7710 key$ = inkey$
7720 pause 2
7730 wend
7740 if key$ = chr$(13) then
7750 goto TopScreen:
7760 'else
7770 'talk "無効なキーです":goto Reference_Book:
7780 else
7790 if bg = 1 then
7800 goto TopScreen:
7810 else
7820 talk "無効なキーです":goto Reference_Book:
7830 endif
7840 endif
7850 'key$=input$(1)
7860 'if key$=chr$(13) then
7870 'goto TopScreen:
7880 'else
7890 'talk"無効なキーです":goto Reference_Book:
7900 'endif
7910 'ヘルプ画面　トップ画面
7920 Help:
7930 No=1:c=0
7940 play ""
7950 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
7960 cls 3:Font 48:
7970 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
7980 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0
7990 color rgb(255,0,0)
8000 'print "●3.ヘルプ　トップ画面" + chr$(13)
8010 print chr$(13)
8020 color rgb(255,255,255)
8030 print "番号を選んでください" + chr$(13)
8040 print " :1.バージョン" + chr$(13)
8050 print " :2.参考文献" + chr$(13)
8060 print " :3.トップ画面" + chr$(13)
8070 print " :4.終 了" + chr$(13)
8080 color rgb(0,0,0)
8090 if No = 1 then print " バージョンを選択"
8100 'y:バーチャルパッドの処理
8110 'key$:カーソルの処理
8120 'bg:バーチャルパッドの右ボタン
8130 Help_key:
8140 y = 0:key$ = "":bg=0
8150 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
8160 y = stick(1)
8170 key$ = inkey$
8180 bg=strig(1)
8190 pause 2
8200 wend
8210 'バーチャルパッド　ここから'
8220 if y = 1 then
8230 select case No
8240 'No の初期値：No=1
8250 case 1:
8260 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.参考文献を選択":goto Help_key:
8270 if lang_flag = 1 then
8280 else
8290 locate 1,12:print"2.参考文献を選択":goto Help_key:
8300 endif
8310 'デバッグライン　ここから
8320 '0のとき
8330 'デバッグライン　ここまで
8340 'デバッグライン　ここから
8350 case 2:
8360 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 1,12:print "                  "
8370 color rgb(0,0,0):locate 1,12:print "3.トップ画面に行くを選択":No=3:goto Help_key:
8380 'cls:color rgb(255,255,255):print"ok"
8390 'デバッグライン　ここまで
8400 case 3:
8410 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print "                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Help_key:
8420 'デバッグライン　ここから
8430 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
8440 'デバッグライン　ここまで
8450 case 0:
8460 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.バージョンを選択":goto Help_key:
8470 'デバッグライン　ここから
8480 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
8490 'デバッグライン　ここまで
8500 end select
8510 endif
8520 'バーチャルパッド　上 ここから
8530 if y = -1 then
8540 select case No
8550 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
8560 case 1:
8570 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Kazutama_main:
8580 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
8590 case 0:
8600 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面に行くを選択":goto Kazutama_main:
8610 'No:3 3.Help→2.設定 No:2
8620 case 3:
8630 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.参考文献を選択":goto Kazutama_main:
8640 case 2:
8650 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.バージョンを選択":goto Kazutama_main:
8660 end select
8670 endif
8680 if bg = 1 then
8690 select case No
8700 '1.数霊チェックを選択  パッドの右キー
8710 case 1:
8720 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
8730 '2.設定を選択    パッドの右キー
8740 case 2:
8750 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
8760 '3.ヘルプを選択 パッドの右
8770 case 3:
8780 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
8790 'プログラムの終了を選択
8800 case 0:
8810 cls 3:cls 4:color rgb(255,255,255):end
8820 if lang_flag = 1 then
8830 'lang_flag = 1:英語
8840 Else
8850 'lang_flag = 0:日本語
8860 print "プログラムを終了します"
8870 endif
8880 end select
8890 '4.終了するを選択  パッドの右
8900 endif
8910 'バーチャルパッド　上　ここまで
8920 'バーチャルパッド　ここまで'
8930 'key$ = input$(1)
8940 'カーソルの下
8950 if key$ = chr$(31) then
8960 select case (No Mod 4)
8970 'バージョンから参考文献
8980 case 0:
8990 c=1:No=c:locate 0,12:Print "           ":locate 0,12:print " 参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
9000 '参考文献からトップ画面
9010 case 1:
9020 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "            ":locate 0,12:print " トップ画面を選択":goto Help_key:
9030 'トップ画面から終了
9040 case 2:
9050 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 0,12:print " 終 了を選択":goto Help_key:
9060 '終了からバージョン
9070 case 3:
9080 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                     ":locate 0,12:print " バージョンを選択":goto Help_key:
9090 case else:
9100 goto Help_key:
9110 end select
9120 endif
9130 'カーソル　上
9140 if key$ = chr$(30) then
9150 select case (c Mod 4)
9160 'バージョンから終了
9170 case 0:
9180 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:locate 0,12:print "                   ":locate 0,12:print " 終 了を選択":goto Help_key:
9190 '参考文献からバージョン
9200 case 1:
9210 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                   ":locate 0,12:print " バージョンを選択":goto Help_key:
9220 'トップ画面から参考文献
9230 case 2:
9240 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":locate 0,12:print " 参考文献を選択":goto Help_key:
9250 '終了からトップ画面を選択
9260 case 3:
9270 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print"                      ":locate 0,12:print " トップ画面を選択":goto Help_key:
9280 case else:
9290 goto Help_key:
9300 end select
9310 endif
9320 'Input "番号:",No
9330 'sp_def 0,(5,200),32,32
9340 'エンターキー：決定
9350 if key$=chr$(13) then
9360 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
9370 if No=3 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
9380 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
9390 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
9400 else
9410 goto Help_key:
9420 endif
9430 'if (No = 0 or No > 4) then ui_msg"もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
9440 '登録文字の確認
9450 '文字を1文字入れて登録されているか調べるメニュー
9460 '設定項目
9470 Setting:
9480 cls 3:Font 48
9490 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
9500 play ""
9510 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
9520 No=1
9530 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
9540 color rgb(0,0,255)
9550 'print "●設定項目" + chr$(13)
9560 print chr$(13)
9570 if lang_flag = 1 then
9580 'lang_flag = 1:英語
9590 else
9600 'lang_flag = 0:日本語
9610 color rgb(255,255,255)
9620 print "番号を選んでください" + chr$(13)
9630 print " :1.登録文字の確認" + chr$(13)
9640 print " :2.数霊文字確認" + chr$(13)
9650 print " :3.トップ画面に行く" + chr$(13)
9660 print " :4.終 了" + chr$(13)
9670 endif
9680 color rgb(0,0,0)
9690 locate 1,12
9700 if No=1 then print "1.登録文字の確認を選択"
9710 'y:バーチャルパッドの処理
9720 'key$:カーソルの処理
9730 'bg:バーチャルパッドの右ボタン
9740 SettingScreen:
9750 y = 0:key$ = "":bg=0
9760 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
9770 y = stick(1)
9780 key$ = inkey$
9790 bg=strig(1)
9800 pause 2
9810 wend
9820 'バーチャルパッド　ここから'
9830 'バーチャルパッド　ここから'
9840 if y = 1 then
9850 select case No
9860 'No の初期値：No=1
9870 case 1:
9880 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
9890 'デバッグライン　ここから
9900 '0のとき
9910 'デバッグライン　ここまで
9920 'デバッグライン　ここから
9930 case 2:
9940 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
9950 color rgb(0,0,0)::No=3:goto SettingScreen:
9960 if lang_flag = 1 then
9970 else
9980 locate 1,12:print "3.トップ画面に行くを選択"
9990 endif
10000 'cls:color rgb(255,255,255):print"ok"
10010 'デバッグライン　ここまで
10020 case 3:
10030 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
10040 'デバッグライン　ここから
10050 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
10060 'デバッグライン　ここまで
10070 case 0:
10080 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
10090 'デバッグライン　ここから
10100 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
10110 'デバッグライン　ここまで
10120 end select
10130 endif
10140 'バーチャルパッド　上 ここから
10150 if y = -1 then
10160 select case No
10170 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
10180 case 1:
10190 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
10200 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
10210 case 0:
10220 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
10230 'No:3 3.Help→2.設定 No:2
10240 case 3:
10250 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
10260 case 2:
10270 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
10280 end select
10290 endif
10300 if bg=1 then
10310 select case No
10320 '1.数霊チェックを選択  パッドの右キー
10330 case 1:
10340 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
10350 '2.設定を選択    パッドの右キー
10360 case 2:
10370 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
10380 '3.ヘルプを選択 パッドの右
10390 case 3:
10400 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
10410 'プログラムの終了を選択
10420 case 0:
10430 cls 3:cls 4::color rgb(255,255,255):pause 2.052*1000:end
10440 if lang_flag = 1 then
10450 Else
10460 ui_msg "プログラムを終了します"
10470 endif
10480 end select
10490 endif
10500 '4.終了するを選択  パッドの右
10510 'バーチャルパッド　ここまで'
10520 'SettingScreen:
10530 'key$ = input$(1)
10540 'カーソル下'
10550 if key$ = chr$(31) then
10560 select case (No Mod 4)
10570 '登録文字から数霊文字の確認
10580 case 1:
10590 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
10600 '数霊文字の確認からトップ画面に行く
10610 case 2:
10620 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
10630 'トップ画面に行くから終了
10640 case 3:
10650 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
10660 '終了から登録文字
10670 case 0:
10680 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
10690 end select
10700 endif
10710 'カーソル　上
10720 if key$ = chr$(30) then
10730 select case (No Mod 4)
10740 case 1:
10750 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
10760 case 2:
10770 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
10780 case 3:
10790 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
10800 case 0:
10810 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
10820 end select
10830 endif
10840 'エンターキーを押したとき
10850 if key$ = chr$(13) then
10860 if No=3 then goto TopScreen:
10870 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
10880 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
10890 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:color rgb(255,255,255):pause 3*120:end
10900 'lse
10910 'o'o SettingScreen:
10920 endif
10930 'endif
10940 'endif
10950 '文字検索項目  ここから
10960 Moji_Search:
10970 cls 4:cls 3:Font 32+16:init"kb:2"
10980 gload Gazo$ + "Moji_Search_Result.png"
10990 play ""
11000 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
11010 print "" + chr$(13)
11020 color rgb(255,0,0)
11030 if lang_flag = 1 then
11040 Else
11050 print "文字を一文字入れてください" + chr$(13)
11060 endif
11070 color rgb(0,0,0)
11080 if lang_flag=1 then
11090 Else
11100 Input "登録文字:",moji$
11110 endif
11120 moji_count = len(moji$)
11130 if moji_count > 1 then
11140 if lang_flag = 1 then
11150 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
11160 Else
11170 endif
11180 else
11190 count=0
11200 for n = 0 to 116
11210 if bufline$(2*n) = moji$ then
11220 cls 3:font 48:init"kb:4"
11230 gload Gazo$ + "Moji_Search_Result.png"
11240 'talk"この文字は登録されています"
11250 play ""
11260 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
11270 if lang_flag = 1 then
11280 Else
11290 print chr$(13)
11300 color rgb(255,0,0)
11310 print moji$;"は、登録されています。" + chr$(13)
11320 color rgb(0,0,0)
11330 print "エンターキーを押してください"
11340 endif
11350 bg = 0:key$ = ""
11360 while (bg <> 1 and key$ <> chr$(13))
11370 key$ = inkey$
11380 bg = strig(1)
11390 pause 2
11400 wend
11410 'y$=input$(1)
11420 if key$ = chr$(13) then goto TopScreen:
11430 if bg=1 then goto TopScreen:
11440 count = count + 1
11450 endif
11460 next n
11470 if count = 0 then
11480 cls 3:font 48:init "kb:2"
11490 gload Gazo$ + "Moji_check.png"
11500 play ""
11510 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
11520 print chr$(13)
11530 if lang_flag = 1 then
11540 Else
11550 color rgb(255,0,0)
11560 print moji$;"は、登録されていません。" + chr$(13)
11570 color rgb(0,0,0)
11580 print "エンターキーを押してください" + chr$(13)
11590 endif
11600 kg = 0:key$ = ""
11610 while (kg <> 1 and key$ <> chr$(13))
11620 key$ = inkey$
11630 kg = strig(1)
11640 pause 2
11650 wend
11660 if key$ = chr$(13) then goto TopScreen:
11670 endif
11680 endif
11690 Surei_Result2:
11700 cls 3:Font 48
11710 zcount1=0:zcount2=0:count1=0:count2=0
11720 '1人目
11730 mojicount1=len(buf_Parson1$)
11740 '2人目
11750 mojicount2 = len(buf_Parson2$)
11760 '1人目
11770 for n = 1 to mojicount1
11780 for j = 1 to 116
11790 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
11800 if bufcount1$(n-1) = bufline$(2*j) then
11810 zcount1 = zcount1 + 1
11820 endif
11830 next j
11840 next n
11850 '2人目
11860 for n = 1 to mojicount2
11870 for j = 1 to 116
11880 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
11890 if bufcount2$(n-1) = bufline$(2*j) then
11900 zount2 = zcount2 + 1
11910 endif
11920 next j
11930 next n
11940 '1人目
11950 for i=1 to mojicount1
11960 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
11970 p1 = Complate(bufcount1$(i-1))
11980 count1 = count1 + p1
11990 next i
12000 '2人目
12010 for i = 1 to mojicount2
12020 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
12030 p2 = Complate(bufcount2$(i-1))
12040 count2 = count2 + p2
12050 next i
12060 cls 3:
12070 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
12080 color rgb(255,0,0)
12090 'print "数霊 2人用 結果表示"+chr$(13)
12100 print ""+chr$(13)
12110 if lang_flag = 1 then
12120 else
12130 color rgb(255,255,255)
12140 print "1人目:";buf_Parson1$;chr$(13)
12150 print "数霊1:";count1;chr$(13)
12160 print "2人目:";buf_Parson2$;chr$(13)
12170 print "数霊2:";count2;chr$(13)
12180 print "数霊(合計):";count1 + count2;chr$(13)
12190 color rgb(0,0,0)
12200 print "エンターキーを押してください" + chr$(13)
12210 endif
12220 key$ = "":bg = 0
12230 'ey$=input$(1)
12240 while (bg <> 1 and key$ <> chr$(13))
12250 bg = strig(1)
12260 key$ = inkey$
12270 pause 2
12280 wend
12290 if (bg = 1 or key$ = chr$(13))  then goto TopScreen:
12300 Surei_Result3:
12310 cls 3:Font 48
12320 zcount2 = 0:count2 = 0
12330 mojicount2 = len(buffer_moji2$)
12340 for n = 1 to mojicount2
12350 for j = 1 to 116
12360 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
12370 if bufcount2$(n - 1) = bufline$(2 * j) then
12380 zcount2 = zcount2 + 1
12390 endif
12400 next j
12410 next n
12420 for i = 1 to mojicount2
12430 n2 = Complate(bufcount2$(i-1))
12440 count2 = count2 + n2
12450 next i
12460 gload Gazo$ + "Screen5.png"
12470 if lang_flag = 1 then
12480 else
12490 color rgb(255,0,0)
12500 print "数霊の結果表示" + chr$(13)
12510 color rgb(255,255,255)
12520 print "１回目回の文字入力:";buffer_moji$;chr$(13)
12530 print "１回目の数霊(かずたま)";count;chr$(13)
12540 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
12550 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
12560 color rgb(0,0,0)
12570 print "エンターキー:トップ画面";chr$(13)
12580 print "c or C キー:数霊の比較";chr$(13)
12590 endif
12600 key$ = "":bg = 0
12610 while (key$ <> chr$(13) and bg <> 1)
12620 bg = strig(1)
12630 key$ = inkey$
12640 pause 2
12650 wend
12660 'key$ = input$(1)
12670 if bg = 1 then goto TopScreen:
12680 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
12690 if key$ = "c" or key$ = "C" then
12700 if count = count2 then
12710 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
12720 else
12730 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
12740 endif
12750 endif
12760 Moji_Count_Check:
12770 cls 3:Font 48
12780 gload Gazo$ + "Moji_check.png"
12790 n = 0
12800 open FILE_csv$ for input as #1
12810 while eof(1) = 0
12820 line input #1, line$
12830 n = n + 1
12840 wend
12850 close #1
12860 'n = n - 1
12870 'talk "登録文字数は"+str$(n)+"文字です"
12880 play ""
12890 if n = 118 then
12900 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
12910 else
12920 if lang_flag = 1 then
12930 else
12940 talk"登録文字数は、"+str$(n)+"文字です"
12950 endif
12960 print "" + chr$(13)
12970 color rgb(255,0,0)
12980 print "文字の登録文字数は";n;"文字" + chr$(13)
12990 color rgb(0,0,0)
13000 print "パッドの右を押してください" + chr$(13)
13010 endif
13020 'key$ = input$(1)
13030 key$="":bg=0
13040 while (key$ <> chr$(13) and bg <> 1)
13050 key$=inkey$
13060 bg=strig(1)
13070 pause 2
13080 wend
13090 if bg = 1 then goto TopScreen:
13100 if key$ = chr$(13) then
13110 goto TopScreen:
13120 else
13130 goto Moji_Count_Check:
13140 endif
13150 'Save 関数
13160 file_kazutama = 0
13170 file_kazutama = Save_File()
13180 func Save_File()
13190 open SAVE_DATA1$  for output as #1
13200 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
13210 close #1
13220 endfunc
13230 Select_moji:
13240 cls 3:font 48:No = 1
13250 gload Gazo$ + "Screen1_mojicheck.png"
13260 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
13270 color rgb(255,0,0)
13280 'print "文字の確認" + chr$(13)
13290 if lang_flag = 1 then
13300 else
13310 print chr$(13)
13320 color rgb(255,255,255)
13330 print "番号を選んでください" + chr$(13)
13340 print " :1.登録文字検索"+ chr$(13)
13350 print " :2.登録文字数の確認" + chr$(13)
13360 print " :3.前の画面に戻る" + chr$(13)
13370 print " :4.終　了" + chr$(13)
13380 color rgb(0,0,0)
13390 if No = 1 then print "1.登録文字の確認を選択"
13400 endif
13410 Entry_check_key:
13420 y = 0:key$ = "":bg=0
13430 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
13440 y = stick(1)
13450 key$ = inkey$
13460 bg=strig(1)
13470 pause 2
13480 wend
13490 'バーチャルパッド　ここから'
13500 'バーチャルパッド　ここから'
13510 if y = 1 then
13520 select case No
13530 'No の初期値：No=1
13540 case 1:
13550 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.登録文字数の確認":goto Entry_check_key:
13560 'デバッグライン　ここから
13570 '0のとき
13580 'デバッグライン　ここまで
13590 'デバッグライン　ここから
13600 case 2:
13610 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                       "
13620 :No=3:goto Entry_check_key:
13630 if lang_flag = 1 then
13640 Else
13650 color rgb(0,0,0):locate 0,12:print " 3.トップ画面に行く"
13660 endif
13670 'cls:color rgb(255,255,255):print"ok"
13680 'デバッグライン　ここまで
13690 case 3:
13700 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Entry_check_key:
13710 'デバッグライン　ここから
13720 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
13730 'デバッグライン　ここまで
13740 case 0:
13750 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_check_key:
13760 'デバッグライン　ここから
13770 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
13780 'デバッグライン　ここまで
13790 end select
13800 endif
13810 'バーチャルパッド　上 ここから
13820 if y = -1 then
13830 select case No
13840 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
13850 case 1:
13860 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Entry_check_key:
13870 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
13880 case 0:
13890 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                      ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
13900 'No:3 3.Help→2.設定 No:2
13910 case 3:
13920 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
13930 case 2:
13940 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_check_key:
13950 end select
13960 endif
13970 if bg=1 then
13980 select case No
13990 '1.数霊チェックを選択  パッドの右キー
14000 case 1:
14010 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
14020 '2.設定を選択    パッドの右キー
14030 case 2:
14040 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
14050 '3.ヘルプを選択 パッドの右
14060 case 3:
14070 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
14080 'プログラムの終了を選択
14090 case 0:
14100 cls 3:cls 4::color rgb(255,255,255):pause 2.052*1000:end
14110 if lang_flag = 1 then
14120 else
14130 ui_msg "プログラムを終了します"
14140 endif
14150 end select
14160 endif
14170 '4.終了するを選択  パッドの右
14180 'バーチャルパッド　ここまで'
14190 'key$ = input$(1)
14200 'カーソルの下
14210 if key$ = chr$(31) then
14220 select case (No Mod 4)
14230 case 0:
14240 c=1:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
14250 case 1:
14260 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:sp_on 3,0:goto Entry_check_key:
14270 case 2:
14280 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:goto Entry_check_key:
14290 case 3:
14300 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
14310 end select
14320 endif
14330 'カーソル　上
14340 if key$ = chr$(30) then
14350 select case (No Mod 4)
14360 case 0:
14370 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
14380 case 1:
14390 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
14400 case 2:
14410 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
14420 case 3:
14430 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
14440 end select
14450 endif
14460 'エンターキーを押す
14470 if key$ = chr$(13) then
14480 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
14490 if No = 2 then goto Moji_Count_Check:
14500 if No = 3 then goto TopScreen:
14510 if No = 0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg
14520 endif
14530 '
14540 Kakunin_Surei_count:
14550 cls 3:font 48:No=1
14560 gload Gazo$ + "Kazutama_List_Top.png"
14570 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
14580 color rgb(255,0,0)
14590 print chr$(13)
14600 color rgb(255,255,255)
14610 if lang_flag = 1 then
14620 else
14630 print "番号を選んでください" + chr$(13)
14640 print " :1.数霊リスト 1人用" + chr$(13)
14650 print " :2.トップ画面に行く" + chr$(13)
14660 print " :3.終 了" + chr$(13)
14670 print ""+chr$(13)
14680 endif
14690 color rgb(0,0,0)
14700 locate 0,12:print"                                                         "
14710 if No = 1 then locate 1,12:print "1.数霊リスト　1人用を選択"
14720 Entry_List:
14730 y = 0:key$ = "":bg=0
14740 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
14750 y = stick(1)
14760 key$ = inkey$
14770 bg=strig(1)
14780 pause 2
14790 wend
14800 'バーチャルパッド　ここから'
14810 'バーチャルパッド　ここから'
14820 if y = 1 then
14830 select case No
14840 'No の初期値：No=1
14850 case 1:
14860 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.トップ画面に行く":goto Entry_List:
14870 'デバッグライン　ここから
14880 '0のとき
14890 'デバッグライン　ここまで
14900 'デバッグライン　ここから
14910 case 2:
14920 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                       "
14930 color rgb(0,0,0):locate 1,12:print "3.終 了を選択":No=0:goto Entry_List:
14940 'cls:color rgb(255,255,255):print"ok"
14950 'デバッグライン　ここまで
14960 case 0:
14970 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,200),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "1.数霊リスト 1人用を選択":No=1:goto Entry_List:
14980 'デバッグライン　ここから
14990 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
15000 'デバッグライン　ここまで
15010 'case 0:
15020 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_List:
15030 'デバッグライン　ここから
15040 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
15050 'デバッグライン　ここまで
15060 end select
15070 endif
15080 'バーチャルパッド　上 ここから
15090 if y = -1 then
15100 select case No
15110 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15120 case 1:
15130 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 1,12:print "                                       ":locate 1,12:print "4.終了を選択"::goto Entry_List:
15140 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15150 case 0:
15160 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                      ":locate 1,12:print"2.トップ画面に行くを選択":goto Entry_List:
15170 'No:3 3.Help→2.設定 No:2
15180 case 2:
15190 sp_on 1,0:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.数霊リスト 1人用を選択":goto Entry_List:
15200 'case 2:
15210 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_List:
15220 end select
15230 endif
15240 if bg = 1 then
15250 select case No
15260 '1.数霊リスト 一人用を選択を選択  パッドの右キー
15270 case 1:
15280 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
15290 '2.設定を選択  パッドの右キー
15300 case 2:
15310 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15320 '3.終了を選択 パッドの右
15330 case 0:
15340 cls 3:cls 4:color rgb(255,255,255):
15350 if lang_flag = 1 then
15360 Else
15370 ui_msg"プログラムを終了します":end
15380 endif
15390 'プログラムの終了を選択
15400 end select
15410 endif
15420 '4.終了するを選択  パッドの右
15430 'バーチャルパッド　ここまで'
15440 'Input "番号:",No
15450 'if No=2 then goto TopScreen:
15460 'if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
15470 'if No=1 then goto Surei_List1:
15480 'if No > 3 or No=0 then ui_msg"無効な数字です、入れ直してください":talk"無効な数字です":goto Kakunin_Surei_count:
15490 'if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
15500 Surei_List1:
15510 cls 3:font 48
15520 file$ = dir$(SAVE_DATA1$,0)
15530 'ファイルが無いときの画面
15540 if file$ = ""  then
15550 gload "./data/Gazo/" + "KazutamaList1.png",0
15560 print chr$(13)
15570 color rgb(255,0,0):print "登録ファイルはございません" + chr$(13)
15580 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
15590 'else
15600 'endif
15610 bg = 0:key$ = ""
15620 while (key$ <> chr$(13) and bg<>1)
15630 key$ = inkey$
15640 bg = strig(1)
15650 pause 2
15660 wend
15670 'エンターキーもしくはバーチャルパッドの右でトップに行く
15680 if (bg = 1 or key$ = chr$(13)) then goto TopScreen:
15690 else
15700 cls 3:buffer_list_count = Loadcount()
15710 if lang_flag = 1 then
15720 Else
15730 talk"登録件数は" + str$(buffer_list_count) + "件です"
15740 gload Gazo$ + "KazutamaList1_Entry.png",0
15750 color rgb(0,0,255)
15760 print chr$(13)
15770 color rgb(255,0,0)
15780 print "登録件数:";buffer_list_count;"件";chr$(13)
15790 color rgb(0,0,0)
15800 print "パッドの右を押してください" + chr$(13)
15810 endif
15820 bg = 0:key$ = ""
15830 while (key$ <> chr$(13) and bg <> 1)
15840 key$ = inkey$
15850 bg = strig(1)
15860 pause 2
15870 wend
15880 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
15890 if (key$ = chr$(13) or bg = 1) then pause 2:goto KotodamaList_page:
15900 endif
15910 func Loadcount()
15920 n = 0
15930 open SAVE_DATA1$  for input as #1
15940 while eof(1) = 0
15950 line input #1,line$
15960 n = n + 1
15970 wend
15980 close #1
15990 count_line = n
16000 endfunc count_line
16010 func Kotodama$(buf$)
16020 color rgb(255,255,255)
16030 b = len("数霊:")
16040 a$ = Mid$(buf$,b+1,len(buf$))
16050 for i=0 to 118
16060 color rgb(255,255,255)
16070 if bufline3$(2 * i) ="数霊:" + a$  then
16080 moji_$ = bufline3$(2*i + 1)
16090 'moji_$ = bufline3$(21)
16100 'moji$ = a$
16110 endif
16120 next i
16130 'kotodama$ = a$
16140 kotodama$ = moji_$
16150 endfunc kotodama$
16160 KotodamaList_page:
16170 cls 3:font 48:m = 0:
16180 gload Gazo$ + "Screen5_Surei_List.png"
16190 if SAVE_DATA1$ = "" then
16200 cls 3:print"ファイルがありません"
16210 else
16220 open SAVE_DATA1$  for input as #1
16230 while 2*buffer_list_count > m
16240 input #1,line$
16250 bufKaztama$(m) = line$
16260 m = m + 1
16270 wend
16280 close #1
16290 endif
16300 l = 0
16310 gload Gazo$ + "Screen5_Surei_List.png"
16320 while buffer_list_count > l
16330 cls
16340 color rgb(255,0,0)
16350 'print "数霊　リスト" + chr$(13)
16360 print chr$(13)
16370 color rgb(255,255,255)
16380 'n3 = l:l = l + 1
16390 print "番号:";l+1;chr$(13)
16400 print bufKaztama$(l) + chr$(13)
16410 print bufKaztama$(l + 1) + chr$(13)
16420 'n3 = l:l = l + 1
16430 Kmoji$ = moji$
16440 print chr$(13) + chr$(13)
16450 color rgb(0,0,0)
16460 print "パッドの左:トップ画面" + chr$(13)
16470 print "パッドの右:次へ行く" + chr$(13)
16480 key$="":bg=0:bg2=0
16490 while (key$ <> chr$(13) and bg <> 1 and bg2 <> 1)
16500 key$ = inkey$
16510 bg = strig(1)
16520 bg2 = strig(0)
16530 pause 2
16540 wend
16550 'key$ = input$(1)
16560 if (key$ = " " or bg2 = 1) then
16570 l = ((l + 1) Mod buffer_list_count):pause 1.58*1000
16580 else
16590 if (key$ = chr$(13) or bg = 1) then
16600 goto TopScreen:
16610 else
16620 goto KotodamaList_page:
16630 endif
16640 endif
16650 wend
16660 '
16670 '結果表示２ Menu1
16680 Surei_Result4:
16690 cls 3:font (48-16):init"kb:4"
16700 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
16710 for i=0 to 181 + 3 - 1
16720 if i = count  then
16730 buffer$ = bufline2$(count + 4,0)
16740 endif
16750 next i
16760 if len(buffer$) > 23 and len(buffer$) <= 45 then
16770 buffer2$ = Mid$(buffer$,1,24)
16780 buffer3$ = Mid$(buffer$,25,(len(buffer$) - 25))
16790 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)
16800 else
16810 if len(buffer$) <= 23 then
16820 buffer2$ = Mid$(buffer$,1,22)
16830 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
16840 else
16850 if len(buffer$) > 45 and len(buffer$) <= 64 then
16860 buffer2$ = Mid$(buffer$,1,22)
16870 buffer3$ = Mid$(buffer$,23,20)
16880 buffer4$ = Mid$(buffer$,43,(len(buffer$)-43))
16890 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)+chr$(13)
16900 else
16910 if len(buffer$) > 64 and len(buffer$) <= 81 then
16920 buffer2$ = Mid$(buffer$,1,23)
16930 buffer3$ = Mid$(buffer$,24,20)
16940 buffer4$ = Mid$(buffer$,42,20)
16950 buffer5$ = Mid$(buffer$,63,(len(buffer$)-62))
16960 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13) + chr$(13) + chr$(13)
16970 if len(buffer$) > 81 and len(buffer$) <= 110 then
16980 buffer2$ = Mid$(buffer$,1,21)
16990 buffer3$ = Mid$(buffer$,22,20)
17000 buffer4$ = Mid$(buffer$,42,20)
17010 buffer5$ = Mid$(buffer$,62,20)
17020 buffer6$ = Mid$(buffer$,82,(len(buffer$) - 82))
17030 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13) + chr$(13) + chr$(13)
17040 endif
17050 endif
17060 endif
17070 endif
17080 endif
17090 Surei_Result4_2:
17100 gload Gazo$ + "Screen1_Result2.png"
17110 cls
17120 color rgb(255,0,0)
17130 'print "診断結果 2" + chr$(13)
17140 print chr$(13)
17150 if lang_flag = 1 then
17160 else
17170 color rgb(127,255,212)
17180 print "入力文字:";buffer_moji$;chr$(13)
17190 print "数霊:";count;chr$(13)
17200 color rgb(255,255,255)
17210 print "数霊の説明:"+chr$(13)
17220 print buffer$
17230 color rgb(0,0,0)
17240 print "(パッド 左):保存,S(パッド 右):トップ画面" + chr$(13)
17250 endif
17260 key$ = "":bg = 0:bg2 = 0
17270 while (key$<>chr$(13) and bg<>1 and bg2<>1)
17280 key$=inkey$
17290 bg=strig(1)
17300 bg2=strig(0)
17310 pause 2
17320 wend
17330 if bg=1 then buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
17340 if key$ = chr$(13) then
17350 buffer$ = "":buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
17360 endif
17370 if bg2=1 then
17380 'ファイルがない時
17390 if dir$(SAVE_DATA1$) = "" then
17400 open SAVE_DATA1$ for output as #1
17410 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
17420 close #1
17430 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
17440 'ファイルが有る時
17450 else
17460 open SAVE_DATA1$ for append as #1
17470 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
17480 close #1
17490 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
17500 endif
17510 endif
17520 if key$="s" or key$="S" then
17530 if dir$(SAVE_DATA1$) = "" then
17540 open SAVE_DATA1$ for output as #1
17550 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
17560 close #1
17570 ui_msg"保存しました":talk"保存しました":goto Surei_Result4_2:
17580 else
17590 open SAVE_DATA1$ for append as #1
17600 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
17610 close #1
17620 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
17630 endif
17640 else
17650 talk "無効な文字です":goto Surei_Result4_2:
17660 endif
17670 'endif
17680 func All_clear()
17690 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
17700 endfunc
