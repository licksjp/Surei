100 '数霊(かずたま) 製作開始日:2021.07.28
110 'Version 0.0.1_2021.07.28 テスト版１
120 'Version 0.0.2_2021.11.27 テスト版２
130 'Version 0.0.3_2021.11.29 テスト版3
140 'Version 0.0.4_2021.11.30 - 12.01 α1
150 'Version 0.0.5_2021.12.02 - 12.03 α2
160 'Version 0.0.6_2021.12.10 (α3)
170 'Version 0.0.7_2021.12.11 (α4)
180 'Version 0.0.8_2021.12.13 (α5)
190 'Version 0.0.9_2021.12.16 -2021.12.18 (α6)
200 'Version 0.1.0_2021.12.19 -2021.12.23 (β1)
210 'Version 0.1.1_2021.12.24 -2021.12.27 (β2)
220 'Version 0.1.2_2021.12.27 -2021.12.31 (β3)
230 '2022年度
240 'Version 0.1.3_2021.12.31 -2022.01.03 (β4)
250 'Version 0.1.4_2022.01.09 -2022.01.15 (β5)
260 'Version 0.1.5_2022.01.26 -2022.01.30 (Release1):R1
270 'Version 1.0.1_2022.02.12(Release2):R3
280 'Version 1.0.2_2022.02.20(Release):正式版
290 'Version 1.0.3_2022.03.27(Release)  正式版
300 'Version 1.0.9_2022.10.20(Release):正式版
310 'Version 1.1.1_2022.11.04(Release):正式版
320 'Version 1.1.2_2022.11.05(Release):正式版
330 'Version 1.1.3_2022.11.06(Release):正式版
340 'Version 1.1.4_2022.11.09(Release):正式版
350 'Version 1.1.6_2022.11.12(Release):正式版
360 'Version 1.1.7_2022.11.16(Release):正式版
370 'Version 1.1.8_2022.11.23(Release):正式版
380 'Version 1.2.0_2022.11.30-2022.11.02(Release):正式版
390 'Version 1.2.1_2022.12.06-2022.12.10(Release):正式版
400 'Version 1.2.2_2022.12.17-2022.12.20(Release):正式版
410 '2023年度
420 'Version 1.2.7_2023.01.03-2023.01.06(Release):正式版
430 'version 1.2.8_2023.01.07-2023.01.14(Release):正式版
440 '現在のバージョン
450 Version$ = "1.2.8_2023.01.14(正式版)"
460 'csvファイル 1.数霊 ベースファイル
470 FILE_csv$ = "data/Kazutama.csv"
480 'csvファイル 2.数霊 ベースファイル 2
490 FILE_csv2$ = "data/Surei_chart_20211207.csv"
500 'Save ファイル
510 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
520 'gazo ファイル
530 Gazo$ = "data/Gazo/"
540 'System フォルダ:設定ファイルを保存するところ
550 System$ = "System/config.sys"
560 '設定ファイル名:config.sys
570 'Sound File(Voice)
580 '1.ボイス TopScreen
590 Voice_File_TopScreen$ = "data/Sound_data/"
600 '変数領域
610 'vcount:バーチャルパッド下の変数
620 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(3)
630 count2 = 0:N=0:N2=0:m2 = 0
640 dim list$(4),moji_List$(2)
650 'ファイルの有無チェック
660 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
670 '1.ファイルが無いとき
680 cls :print "依存ファイルが見つかりません":
690 print "エンターキーを押してください" + chr$(13)
700 key$ = input$(1)
710 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
720 else
730 '2.ファイルが有るとき
740 cls:print "csv:file ok." + chr$(13)
750 n=0
760 open FILE_csv$ for input as #1
770 while eof(1) = 0
780 input #1,line$
790 'print line$
800 bufline$(n) = line$
810 'Print n;chr$(13)
820 n = n + 1
830 wend
840 close #1
850 N=n
860 '2つ目のファイル読み込み
870 'n = 0
880 open FILE_csv2$ for input as #2
890 for n=3 to 181
900 for i=0 to 1
910 input #2,line$
920 bufline2$(n,i) = line$
930 next i
940 next n
950 close #2
960 N2 = n
970 '
980 endif
990 '設定ファイルの読み込み
1000 'open System$ for input as #1
1010 'line input #1,buf_line$
1020  'if len(buf_line$) = 10 then
1030   'if left$(buf_line$,9)="config_r=" then
1040   ' buf$ = right$(buf_line$,1)
1050    'if buf$ = "1" then
1060    '   buf_config_r = 1
1070   ' else
1080   '    buf_config_r = 0
1090   ' endif
1100  ' endif
1110 'endif
1120 'close #1
1130 'or j = 3 to 181+3
1140 'ufline3$(j - 3,n) = bufline2$(i,n)
1150 'next j
1160 'moji$ = Kotodama$(bufline3$(16))
1170 'erase bufline2$
1180 '2022.11.23----------------------
1190 '端末言語のチェック
1200 '日本語端末かチェックをして日本語以外なら英語で表示する
1210 'lang flag:0:日本語 1:英語(日本語以外)
1220 '--------------------------------
1230 lang_flag = 0
1240 if ex_info$(1) <> "JP" then
1250 lang_flag = 1
1260 endif
1270 'Top画面
1280 TopScreen:
1290 'バーチャルパッドを表示
1300 cls 3:font 48:screen 1,1,1:init"kb:4"
1310 'play ""
1320 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
1330 gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
1340 '選択肢 1
1350 gload Gazo$ + "Selection.png",1,5,200
1360 '選択肢 2
1370 gload Gazo$ + "Selection.png",1,5,300
1380 '選択肢 3
1390 gload Gazo$ + "Selection.png",1,5,400
1400 '選択肢 4
1410 gload Gazo$ + "Selection.png",1,5,500
1420 color rgb(0,0,255)
1430 print chr$(13)
1440 if lang_flag = 1 then
1450 color rgb(255,255,255)
1460 print "Select Number" + chr$(13)
1470 print " :1.Kazutama check" + chr$(13)
1480 print " :2.Setting" + chr$(13)
1490 print " :3.Help" + chr$(13)
1500 print " :4.End Program" + chr$(13)
1510 color rgb(255,255,255)
1520 else
1530 color rgb(255,255,255)
1540 print "番号を選んでください" + chr$(13)
1550 print " :1.数霊(かずたま)チェック" + chr$(13)
1560 print " :2.設定" + chr$(13)
1570 print " :3.ヘルプ" + chr$(13)
1580 print " :4.終　了" + chr$(13)
1590 color rgb(0,0,0)
1600 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
1610 'バーチャルパッドを表示
1620 No=1:
1630 'lang_flag:1 外国語,0:日本語
1640 if lang_flag = 1 then
1650 'lang_flag=1 英語
1660 locate 0,12:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
1670 else
1680 'lang_flag=0 日本語
1690 locate 0,12:color rgb(0,0,0):print "1.数霊(かずたま)チェックを選択";chr$(13)
1700 endif
1710 endif
1720 'スプライト
1730 '選択肢 1 On
1740 sp_def 0,(5,200),32,32
1750 sp_on 0,1
1760 sp_put 0,(5,200),0,0
1770 '選択肢 2 Off
1780 sp_def 1,(5,300),32,32
1790 sp_on 1,0
1800 sp_put 1,(5,300),0,0
1810 '選択肢 3 Off
1820 sp_def 2,(5,400),32,32
1830 sp_on 2,0
1840 sp_put 2,(5,400),0,0
1850 '選択肢 4 Off
1860 sp_def 3,(5,500),32,32
1870 sp_on 3,0
1880 sp_put 3,(5,500),0,0
1890 color rgb(0,0,0)
1900 Main_Select:
1910 'y:バーチャルパッドの処理
1920 'key$:カーソルの処理
1930 y = 0:key$ = "":bg = 0
1940 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
1950 y = stick(1)
1960 key$ = inkey$
1970 bg = strig(1)
1980 pause 2
1990 wend
2000 'if y=1 then
2010 'select case (No Mod 4)
2020 'ase 0:
2030 '     c=1:No=c:sp_on 0,1:sp_on 1,0 :sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print " 数霊(かずたま)チェックを選択":beep:goto Main_Select:
2040 'case 1:
2050 '       =2:No=c:sp_on 0,0:
2060 '"ase 2:
2070 'ase 3:
2080 'nd select
2090 'ndif
2100 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
2110 '1.バーチャルパッドの処理
2120 'バーチャルパッド下を押した時
2130 if y = 1 then
2140 select case No
2150 'No の初期値：No=1
2160 case 1:
2170 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":
2180 if lang_flag = 1 then
2190 'lang_flag=1 英語
2200 else
2210 'lang_flag=0 日本語
2220 locate 0,12:print "2.設定を選択":goto Main_Select:
2230 endif
2240 'デバッグライン　ここから
2250 '0のとき
2260 'デバッグライン　ここまで
2270 'デバッグライン　ここから
2280 'バーチャルパッド　下
2290 case 2:
2300 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:
2310 if lang_flag = 1 then
2320 else
2330 print "                                         ":
2340 color rgb(0,0,0):locate 0,12:
2350 print "3.ヘルプを選択":No=3:goto Main_Select:
2360 endif
2370 'cls:color rgb(255,255,255):print"ok"
2380 'デバッグライン　ここまで
2390 case 3:
2400 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                               "
2410 if lang_flag = 1 then
2420 else
2430 locate 0,12:print "4.終了を選択":No=0:goto Main_Select:
2440 endif
2450 'デバッグライン　ここから
2460 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
2470 'デバッグライン　ここまで
2480 case 0:
2490 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1
2500 if lang_flag = 1 then
2510 'lang_flag=1:英語
2520 else
2530 'lang_flag=0:日本語
2540 locate 0,12:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
2550 'endif
2560 endif
2570 'デバッグライン　ここから
2580 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
2590 'デバッグライン　ここまで
2600 end select
2610 endif
2620 'バーチャルパッド　上 ここから
2630 if y = -1 then
2640 select case No
2650 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
2660 case 1:
2670 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       "
2680 if lang_flag = 1 then
2690 'lang_flag=1 英語
2700 else
2710 'lang_flag=0 日本語
2720 locate 0,12:print "4.終了を選択":goto Main_Select:
2730 endif
2740 'endif
2750 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
2760 case 0:
2770 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":
2780 if lang_flag = 1 then
2790 '1:英語
2800 else
2810 '0:日本語
2820 locate 0,12:print "3.ヘルプを選択":goto Main_Select:
2830 endif
2840 'No:3 3.Help→2.設定 No:2
2850 case 3:
2860 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      "
2870 if lang_flag = 1 then
2880 '1:英語
2890 else
2900 '0:日本語
2910 locate 0,12:print"2.設定を選択":goto Main_Select:
2920 endif
2930 case 2:
2940 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":
2950 if lang_flag = 1 then
2960 'lang_flag 1 英語
2970 else
2980 'lang_flag 0 日本語
2990 locate 0,12:print"1.数霊(かずたま)チェックを選択":goto Main_Select:
3000 endif
3010 end select
3020 endif
3030 if bg=1 then
3040 select case No
3050 '1.数霊チェックを選択  パッドの右キー(決定)
3060 case 1:
3070 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
3080 '2.設定を選択  パッドの右キー(決定)
3090 case 2:
3100 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
3110 '3.ヘルプを選択 パッドの右(決定)
3120 case 3:
3130 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
3140 'プログラムの終了を選択(決定)
3150 case 0:
3160 cls 3:cls 4:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:
3170 'if lang_flag = 1 then
3180 'lang_flag = 1 英語
3190 'else
3200 'lang_flag = 0 日本語
3210 ui_msg "プログラムを終了します":color rgb(255,255,255):end
3220 'endif
3230 end select
3240 '4.終了するを選択  パッドの右
3250 endif
3260 'バーチャルパッド　上　ここまで
3270 '2.カーソルの処理
3280 'カーソル　下 chr$(31)
3290 if (key$ = chr$(31)) then
3300 select case (No)
3310 '4
3320 '0 選択肢4 => 選択肢1
3330 case 0:
3340 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "              ":color rgb(0,0,0):
3350 if lang_flag = 1 then
3360 'lang flag:1 英語
3370 else
3380 'lang flag:0 日本語
3390 color rgb(0,0,0):locate 0,12:print "1.数霊(かずたま)チェックを選択":beep:goto Main_Select:
3400 endif
3410 '1 選択肢1 => 選択肢2
3420 case 1:
3430 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":
3440 if lang_flag = 1 then
3450 'lang_flag:1 英語
3460 else
3470 'lang_flag:0 日本語
3480 color rgb(0,0,0):locate 0,12:print "2.設定を選択":beep:goto Main_Select:
3490 endif
3500 '2 選択肢2 => 選択肢3
3510 case 2:
3520 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "               ":
3530 if lang_flag = 1 then
3540 'lang flag:1 英語
3550 else
3560 'lang flang:0 日本語
3570 color rgb(0,0,0):locate 0,12:print "3.ヘルプを選択":beep:goto Main_Select:
3580 endif
3590 '3 選択肢３ => 選択肢4
3600 case 3:
3610 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "               ":color rgb(0,0,0)
3620 if lang_flag = 1 then
3630 'lang_flag = 1 英語
3640 else
3650 'lang_flag = 0 日本語
3660 color rgb(0,0,0):locate 0,12:print "4.終 了を選択":beep:goto Main_Select:
3670 endif
3680 case else:
3690 goto Main_Select:
3700 end select
3710 endif
3720 'カーソル　上
3730 if key$=chr$(30) then
3740 select case (No)
3750 '選択肢1 => 選択肢4
3760 case 1:
3770 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:PRINT "                      ":
3780 if lang_flag = 1 then
3790 'lang_flag=1:英語
3800 else
3810 'lang_flag = 0:日本語
3820 else
3830 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
3840 endif
3850 '選択肢2 => 選択肢1
3860 case 2:
3870 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                 ":locate 1,12:beep:print "2.設 定を選択":beep:goto Main_Select:
3880 '選択肢3　=> 選択肢2
3890 case 3:
3900 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0
3910 if lang_flag = 1 then
3920 'lang_flag = 1:英語
3930 else
3940 'lang_flag = 0:日本語
3950 locate 0,12:beep:print "3.ヘルプを選択":goto Main_Select:
3960 endif
3970 '選択肢4 => 選択肢3
3980 case 0:
3990 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 1,12:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
4000 if lang_flag = 1 then
4010 'lang flag=1 英語
4020 else
4030 'lang flag=0 日本語
4040 locate 1,12:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
4050 endif
4060 end select
4070 endif
4080 'Input "番号:",No
4090 'エンターキー入力:決定
4100 if key$ = chr$(13) then
4110 select case No
4120 case 1:
4130 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4140 case 3:
4150 Color rgb(255,255,255):goto Help:
4160 case 0:
4170 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
4180 case 2:
4190 color rgb(255,255,255):goto Setting:
4200 'else
4210 'goto Main_Select:
4220 end select
4230 endif
4240 'ndif
4250 'if N0=0 or No>4 then goto TopScreen:
4260 '1-1.数霊チェック
4270 Surei_Check:
4280 cls 3:Font 48:
4290 'gload Gazo$ + "Screen4.png"
4300 gload Gazo$ + "Screen1_Sureicheck_Top20211226.png"
4310 play ""
4320 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
4330 color rgb(255,0,0)
4340 'print "●数霊(かずたま)チェックトップ" + chr$(13)
4350 sp_on 0,1:sp_put 0,(5,200),0,0:screen 1,1,1
4360 if lang_flag = 1 then
4370 'lang_flag=1 英語
4380 else
4390 'lang_flag=0 日本語
4400 print chr$(13)
4410 color rgb(255,255,255)
4420 print "番号を選んでください" + chr$(13)
4430 print " :1.数霊(かずたま)1人用" + chr$(13)
4440 print " :2.数霊(かずたま)2人用" + chr$(13)
4450 print " :3.トップ画面に行く" + chr$(13)
4460 print " :4.終 了" + chr$(13)
4470 color rgb(0,0,0):No = 1
4480 locate 0,12
4490 print " 1.数霊(かずたま)1人用を選択"
4500 endif
4510 Kazutama_main:
4520 'y:バーチャルパッドの処理
4530 'key$:カーソルの処理
4540 'bg:バーチャルパッドの右のボタン
4550 y = 0:key$ = "":bg=0
4560 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
4570 y = stick(1)
4580 key$ = inkey$
4590 bg=strig(1)
4600 y=stick(-1)
4610 pause 2
4620 wend
4630 'key$ = input$(1)
4640 if y = 1 then
4650 select case No
4660 'No の初期値：No=1
4670 case 1:
4680 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":
4690 'if lang_flag=1 then
4700 'else
4710 locate 0,12
4720 print" 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
4730 'endif
4740 'デバッグライン　ここから
4750 '0のとき
4760 'デバッグライン　ここまで
4770 'デバッグライン　ここから
4780 case 2:
4790 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                               "
4800 color rgb(0,0,0):locate 0,12:print " 3.トップ画面に行くを選択":No=3:goto Kazutama_main:
4810 'cls:color rgb(255,255,255):print"ok"
4820 'デバッグライン　ここまで
4830 case 3:
4840 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 0,12:print " 4.終 了を選択":No=0:goto Kazutama_main:
4850 'デバッグライン　ここから
4860 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
4870 'デバッグライン　ここまで
4880 case 0:
4890 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 0,12:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
4900 'デバッグライン　ここから
4910 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
4920 'デバッグライン　ここまで
4930 end select
4940 endif
4950 'バーチャルパッド　上 ここから
4960 if y = -1 then
4970 select case No
4980 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
4990 case 1:
5000 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 0,12:print" 4.終了を選択":goto Kazutama_main:
5010 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
5020 case 0:
5030 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 0,12:print" 3.トップ画面に行くを選択":goto Kazutama_main:
5040 'No:3 3.Help→2.設定 No:2
5050 case 3:
5060 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 0,12:print" 2.数霊（かずたま）2人用を選択":goto Kazutama_main:
5070 case 2:
5080 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 0,12:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5090 end select
5100 endif
5110 if bg=1 then
5120 select case No
5130 '1.数霊チェックを選択  パッドの右キー
5140 case 1:
5150 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
5160 '2.設定を選択    パッドの右キー
5170 case 2:
5180 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
5190 '3.ヘルプを選択 パッドの右
5200 case 3:
5210 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
5220 'プログラムの終了を選択
5230 case 0:
5240 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.05*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
5250 end select
5260 '4.終了するを選択  パッドの右
5270 endif
5280 'バーチャルパッド　上　ここまで
5290 if key$ = chr$(31) then
5300 select case No
5310 case 0:
5320 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                                          ":
5330 if lang_flag = 1 then
5340 Else
5350 No=2:locate 0,12:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
5360 endif
5370 case 1:
5380 No=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                                          ":
5390 if lang_flag = 1 then
5400 Else
5410 locate 0,12:print" 3.トップ画面に行くを選択":goto Kazutama_main:
5420 endif
5430 case 2:
5440 No=3:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print"                                       ":
5450 if lang_flag = 1 then
5460 Else
5470 locate 0,12:print" 4.終了を選択":goto Kazutama_main:
5480 endif
5490 case 3:
5500 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":
5510 if lang_flag = 1 then
5520 Else
5530 No=1:locate 0,12:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
5540 endif
5550 end select
5560 endif
5570 if key$=chr$(13) then
5580 select case No
5590 case 1:
5600 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
5610 case 2:
5620 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
5630 case 3:
5640 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
5650 case 0:
5660 cls 4:cls 3:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
5670 end select
5680 endif
5690 'Input "番号:",No
5700 '前の画面に戻る
5710 'if No = 3 then goto TopScreen:
5720 'プログラムの終了
5730 'if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":COLOR rgb(255,255,255):end
5740 '1人用
5750 'if No = 1 then goto Surei_Input:
5760 '2人用
5770 'if No = 2 then goto Surei_twoParson:
5780 'if No > 4 or No=0 then ui_msg"もう一度入れてください":goto Surei_Check:
5790 '数霊(かずたま) 文字入力  1人用
5800 Surei_Input:
5810 if mode = 0 then
5820 cls 3:font 32:init"kb:2"
5830 gload Gazo$ + "InputKotodama_20211226.png"
5840 play""
5850 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
5860 color rgb(255,0,0)
5870 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
5880 if lang_flag=1 then
5890 '英語
5900 else
5910 print chr$(13)
5920 color rgb(0,0,0)
5930 print "文字を入れてください" + chr$(13)
5940 color rgb(255,0,0)
5950 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
5960 print chr$(13)
5970 color rgb(0,0,0)
5980 Input "入力文字:",buffer_moji$
5990 if buffer_moji$ = "" then
6000 ui_msg "未入力です":goto Surei_Input:
6010 'endif
6020 else
6030 goto Surei_Result:
6040 endif
6050 endif
6060 endif
6070 'else
6080 if mode = 1 then
6090 cls 3:Font 32:
6100 gload Gazo$ + "InputKotodama.png"
6110 color rgb(255,0,0)
6120 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
6130 color rgb(255,255,255)
6140 print "文字を入れてください" + chr$(13)
6150 color rgb(255,0,0)
6160 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
6170 print "大文字のみ)" + chr$(13)
6180 color rgb(0,0,0)
6190 Input "文字入力:",buffer_moji2$
6200 goto Surei_Result3:
6210 'endif
6220 endif
6230 '数霊(かずたま)文字入力　2人用
6240 Surei_twoParson:
6250 cls 3:Font 32:init"kb:2"
6260 gload Gazo$ + "InputKotodama_20211226.png"
6270 '1人目入力
6280 if lang_flag = 1 then
6290 'color rgb(255,0,0)
6300 else
6310 print ""+chr$(13)
6320 'print "●数霊(かずたま) 1人目 入力" + chr$(13)
6330 color rgb(255,0,0)
6340 print "1人目の文字を入れてください" + chr$(13)
6350 color rgb(255,0,0)
6360 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
6370 color rgb(0,0,0)
6380 print chr$(13)
6390 Input "1人目文字入力:",buf_Parson1$
6400 endif
6410 Surei_twoParson2:
6420 cls 3:Font 32:init"kb:2"
6430 '2人目入力
6440 gload Gazo$ + "InputKotodama_20211226.png"
6450 'color rgb(255,0,0)
6460 'print "●数霊(かずたま) 2人目 入力" + chr$(13)
6470 if lang_falg = 1 then
6480 else
6490 print ""+chr$(13)
6500 print "2人目の文字を入れてください" + chr$(13)
6510 color rgb(255,0,0)
6520 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
6530 color rgb(0,0,0)
6540 Input "2人目の文字入力:",buf_Parson2$
6550 goto Surei_Result2:
6560 endif
6570 '数霊　計算 パート
6580 '文字の計算関数
6590 'moji$:1文字を入れる
6600 func Complate(moji$)
6610 for n = 1 to 116
6620 if moji$ = bufline$(2*n) then
6630 buffcount = val(bufline$(2 * n + 1))
6640 endif
6650 next n
6660 endfunc buffcount
6670 '数霊　結果表示
6680 Surei_Result:
6690 cls 3:Font 32
6700 'ゼロカウント:zcount
6710 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
6720 '例 アカい:"い"の文字は無効な文字なので、はじく
6730 zcount=0
6740 'mojicount:入力文字数
6750 mojicount = len(buffer_moji$)
6760 for n=1 to mojicount
6770 for j=1 to 118
6780 if (bufcount$(n - 1) = bufline$(2 * j)) then
6790   bufcount$(n-1) = Mid$(buffer_moji$,n,1)
6800 endif
6810 next j
6820 next n
6830 'if mojicount > zcount then
6840 'cls 3:ui_msg "無効な文字です":talk "無効な文字があります。":zcount = 0:goto Surei_Input:
6850 ncount=0:count=0
6860    for i = 1 to mojicount
6870     bufcount$(i-1)=Mid$(buffer_moji$,i,1)
6880   'ンのカウント
6890    if (bufcount$(i-1) = "ン") then ncount = ncount + 1
6900     'bufcount$(i-1)=Mid$(buffer_moji$,i,1)
6910    next i
6920    if (ncount > 0) then
6930    'Listを表示する
6940    moji_List$(0) = "この単語は目に見える物です"
6950    moji_List$(1) = "この単語は目に見えない物です"
6960    num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
6970    if (num2 = 0) then
6980      ' n1 = n1 + 0
6990    else
7000    if (num2 = 1) then
7010       n1 = 9 * ncount
7020       'buf_count = 9 * ncount
7030    endif
7040    endif
7050    endif
7060 'else
7070    for j=1 to mojicount
7080    bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7090    count = count + Complate(bufcount$(j - 1))
7100   ' count = count + n1:count2 = count
7110 'endif
7120    'count = count + buf_count:
7130    next j
7140    count = count + n1
7150 if (ncount > 0) then count = count
7160 '182以上のとき,181を引く
7170 if buf_cofig_r = 0 then
7180      if (count > 181) then
7190 'if buf_config_r = 0 then
7200         count = count - 181
7210 'else
7220 'if buf_config_r = 1 then
7230 '   count=Single_Complate(count2)
7240 'endif
7250      else
7260      if (buf_config_r = 1) then
7270        'count2 = count - 180
7280        buf_count = Single_Complate(count)
7290      endif
7300 endif
7310 endif
7320 'if config_r = 0 then
7330 cls 3:Font 48+16
7340 gload Gazo$ + "Result_Screen3_20211226.png"
7350 if buf_config_r = 1 then
7360    print "入力文字:" + buffer_moji$ + chr$(13)
7370    print "数霊(かずたま):";buf_count;chr$(13)
7380 endif
7390 if lang_flag = 1 then
7400 else
7410 color rgb(255,0,0)
7420 print "入力文字:" + buffer_moji$ + chr$(13)
7430 endif
7440 'print chr$(13)
7450 if lang_flag = 1 then
7460 else
7470 color rgb(0,0,255)
7480 print "数霊(かずたま):";count;chr$(13)
7490 endif
7500 if lang_flag = 1 then
7510 else
7520 color rgb(0,0,0)
7530 print "エンター or スペース" + chr$(13)
7540 print  chr$(13)
7550 'endif
7560 endif
7570 key$ = input$(1)
7580 if ((key$ = chr$(13)) or (key$=" ")) then
7590 List$(0)="もう一度数霊を見る"
7600 List$(1)="トップ画面に行く"
7610 List$(2)="次に行く"
7620 num=ui_select("List$","番号を選んでください")
7630 select case num
7640   case 0:
7650          goto Surei_Input:
7660   case 1:
7670        n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
7680          for i=0 to 9
7690             bufcount$(i)=""
7700          next i
7710          goto TopScreen:
7720   case 2:
7730        goto Surei_Result4:
7740   case -1:
7750        goto Surei_Result:
7760   case else:
7770        goto Surei_Result:
7780 end select
7790 'endif
7800 'if key$ = " " then
7810 '２回めの入力に行く
7820 'mode = 1:goto Surei_Input:
7830 'else
7840 'if key$ = "s" or key$ = "S" then
7850 'ファイルを保存する
7860 's = Save()
7870 'ui_msg"保存しました"
7880 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
7890 else
7900 goto Surei_Result:
7910 'endif
7920 endif
7930 '3-1 バージョン情報
7940 Version:
7950 cls 3:Font 32
7960 gload Gazo$ + "Screen1_Version.png"
7970 play ""
7980 play Voice_File_TopScreen$ + "Voice_Version.mp3"
7990 color rgb(255,0,0)
8000 'print"●バージョン情報"+chr$(13)
8010 print chr$(13)
8020 color rgb(255,255,255)
8030 if lang_flag = 1 then
8040 else
8050 print "Ver:";Version$ + chr$(13)
8060 print "アプリ名:数霊"+ chr$(13)
8070 print "Basic for Android Runtime" + chr$(13)
8080 print "Author:licksjp" + chr$(13)
8090 print "制作開始:2021.7.28" + chr$(13)
8100 print chr$(13)
8110 print "(C)Copy right licksjp " + chr$(13)
8120 print "All rights reserved" + chr$(13)
8130 color rgb(0,0,0)
8140 print "パッドの右を押してください" + chr$(13)
8150 endif
8160 'key$ = input$(1)
8170 bg=0:key$=""
8180 while (bg <> 1 and key$ <> chr$(13))
8190 bg = strig(1)
8200 key$ = inkey$
8210 pause 2
8220 wend
8230 if key$ = chr$(13) then
8240 goto TopScreen:
8250 'else
8260 'talk "無効なキーです":goto Version:
8270 else
8280 if bg=1 then
8290 goto TopScreen:
8300 else
8310 if lang_flag = 1 then
8320 else
8330 talk "無効なキーです":goto Version:
8340 endif
8350 endif
8360 endif
8370 '3-2 参考文献
8380 Reference_Book:
8390 cls 3:Font 48-16:play""
8400 gload Gazo$ + "Screen1_Reference.png"
8410 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
8420 color rgb(255,0,0)
8430 'print"●参考文献" + chr$(13)
8440 print chr$(13)
8450 if lang_flag = 1 then
8460 else
8470 color rgb(255,255,255)
8480 print "書名:数霊" + chr$(13)
8490 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
8500 print "出版社:徳間書店" + chr$(13)
8510 print "ISBN:978-4-19-" + chr$(13)
8520 print "         865309-5" + chr$(13)
8530 print "定価:2300円 + 税" + chr$(13)
8540 print chr$(13);chr$(13);chr$(13)
8550 color rgb(0,0,0)
8560 print "パッドの右を押してください"
8570 endif
8580 bg = 0:key$ = ""
8590 while (bg <> 1 and key$ <> chr$(13))
8600 bg = strig(1)
8610 key$ = inkey$
8620 pause 2
8630 wend
8640 if key$ = chr$(13) then
8650 goto TopScreen:
8660 'else
8670 'talk "無効なキーです":goto Reference_Book:
8680 else
8690 if bg = 1 then
8700 goto TopScreen:
8710 else
8720 talk "無効なキーです":goto Reference_Book:
8730 endif
8740 endif
8750 'key$=input$(1)
8760 'if key$=chr$(13) then
8770 'goto TopScreen:
8780 'else
8790 'talk"無効なキーです":goto Reference_Book:
8800 'endif
8810 'ヘルプ画面　トップ画面
8820 Help:
8830 No=1:c=0
8840 play ""
8850 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
8860 cls 3:Font 48:
8870 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
8880 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0
8890 color rgb(255,0,0)
8900 'print "●3.ヘルプ　トップ画面" + chr$(13)
8910 print chr$(13)
8920 color rgb(255,255,255)
8930 print "番号を選んでください" + chr$(13)
8940 print " :1.バージョン" + chr$(13)
8950 print " :2.参考文献" + chr$(13)
8960 print " :3.トップ画面に行く" + chr$(13)
8970 print " :4.終 了" + chr$(13)
8980 color rgb(0,0,0)
8990 if No = 1 then print " 1.バージョンを選択"
9000 'y:バーチャルパッドの処理
9010 'key$:カーソルの処理
9020 'bg:バーチャルパッドの右ボタン
9030 Help_key:
9040 y = 0:key$ = "":bg=0
9050 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
9060 y = stick(1)
9070 key$ = inkey$
9080 bg=strig(1)
9090 pause 2
9100 wend
9110 'バーチャルパッド　ここから'
9120 if y = 1 then
9130 select case No
9140 'No の初期値：No=1
9150 case 1:
9160 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.参考文献を選択":goto Help_key:
9170 if lang_flag = 1 then
9180 else
9190 locate 1,12:print"2.参考文献を選択":goto Help_key:
9200 endif
9210 'デバッグライン　ここから
9220 '0のとき
9230 'デバッグライン　ここまで
9240 'デバッグライン　ここから
9250 case 2:
9260 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 1,12:print "                  "
9270 color rgb(0,0,0):locate 1,12:print "3.トップ画面に行くを選択":No=3:goto Help_key:
9280 'cls:color rgb(255,255,255):print"ok"
9290 'デバッグライン　ここまで
9300 case 3:
9310 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print "                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Help_key:
9320 'デバッグライン　ここから
9330 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
9340 'デバッグライン　ここまで
9350 case 0:
9360 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.バージョンを選択":goto Help_key:
9370 'デバッグライン　ここから
9380 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
9390 'デバッグライン　ここまで
9400 end select
9410 endif
9420 'バーチャルパッド　上 ここから
9430 if y = -1 then
9440 select case No
9450 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
9460 case 1:
9470 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Help_key:
9480 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
9490 case 0:
9500 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面に行くを選択":goto Help_key
9510 'No:3 3.Help→2.設定 No:2
9520 case 3:
9530 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.参考文献を選択":goto Help_key:
9540 case 2:
9550 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.バージョンを選択":goto Help_key:
9560 end select
9570 endif
9580 if bg = 1 then
9590 select case No
9600 '1.数霊チェックを選択  パッドの右キー
9610 case 1:
9620 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
9630 '2.設定を選択    パッドの右キー
9640 case 2:
9650 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
9660 '3.ヘルプを選択 パッドの右
9670 case 3:
9680 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
9690 'プログラムの終了を選択
9700 case 0:
9710 cls 3:cls 4:color rgb(255,255,255):play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
9720 'if lang_flag = 1 then
9730 'lang_flag = 1:英語
9740 'Else
9750 'lang_flag = 0:日本語
9760 'endif
9770 end select
9780 '4.終了するを選択  パッドの右
9790 endif
9800 'バーチャルパッド　上　ここまで
9810 'バーチャルパッド　ここまで'
9820 'key$ = input$(1)
9830 'カーソルの下
9840 if key$ = chr$(31) then
9850 select case (No Mod 4)
9860 'バージョンから参考文献
9870 case 0:
9880 c=1:No=c:locate 0,12:Print "             ":locate 0,12:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
9890 '参考文献からトップ画面
9900 case 1:
9910 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "            ":locate 0,12:print " 3.トップ画面に行くを選択":goto Help_key:
9920 'トップ画面から終了
9930 case 2:
9940 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 0,12:print " 4.終 了を選択":goto Help_key:
9950 '終了からバージョン
9960 case 3:
9970 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                     ":locate 0,12:print " 1.バージョンを選択":goto Help_key:
9980 case else:
9990 goto Help_key:
10000 end select
10010 endif
10020 'カーソル　上
10030 if key$ = chr$(30) then
10040 select case (c Mod 4)
10050 'バージョンから終了
10060 case 0:
10070 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:locate 0,12:print "                   ":locate 0,12:print " 4.終 了を選択":goto Help_key:
10080 '参考文献からバージョン
10090 case 1:
10100 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                   ":locate 0,12:print " 1.バージョンを選択":goto Help_key:
10110 'トップ画面から参考文献
10120 case 2:
10130 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":locate 0,12:print " 2.参考文献を選択":goto Help_key:
10140 '終了からトップ画面を選択
10150 case 3:
10160 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print"                      ":locate 0,12:print "3.トップ画面に行くを選択":goto Help_key:
10170 case else:
10180 goto Help_key:
10190 end select
10200 endif
10210 'Input "番号:",No
10220 'sp_def 0,(5,200),32,32
10230 'エンターキー：決定
10240 if key$=chr$(13) then
10250 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10260 if No=3 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10270 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10280 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg "プログラムを終了します":cls 3:cls 4:end
10290 else
10300 goto Help_key:
10310 endif
10320 'if (No = 0 or No > 4) then ui_msg "もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
10330 '登録文字の確認
10340 '文字を1文字入れて登録されているか調べるメニュー
10350 '設定項目
10360 Setting:
10370 cls 3:Font 48
10380 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
10390 play ""
10400 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
10410 No=1
10420 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
10430 color rgb(0,0,255)
10440 'print "●設定項目" + chr$(13)
10450 print chr$(13)
10460 if lang_flag = 1 then
10470 'lang_flag = 1:英語
10480 else
10490 'lang_flag = 0:日本語
10500 color rgb(255,255,255)
10510 print "番号を選んでください" + chr$(13)
10520 '-------コメント----------------
10530 'print " :1.登録文字の確認" + chr$(13)
10540 'print " :2.数霊文字確認" + chr$(13)
10550 '-------コメント----------------
10560 print " :1.文字の項目" + chr$(13)
10570 print " :2.結果表示設定" + chr$(13)
10580 print " :3.トップ画面に行く" + chr$(13)
10590 print " :4.終 了" + chr$(13)
10600 endif
10610 color rgb(0,0,0)
10620 locate 0,12
10630 if No=1 then print " 1.文字の項目を選択"
10640 'y:バーチャルパッドの処理
10650 'key$:カーソルの処理
10660 'bg:バーチャルパッドの右ボタン
10670 SettingScreen:
10680 y = 0:key$ = "":bg=0
10690 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
10700 y = stick(1)
10710 key$ = inkey$
10720 bg=strig(1)
10730 pause 2
10740 wend
10750 'バーチャルパッド　ここから'
10760 'バーチャルパッド　ここから'
10770 if y = 1 then
10780 select case No
10790 'No の初期値：No=1
10800 case 1:
10810 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":color rgb(0,0,0):locate 1,12:print "2.結果表示設定を選択":goto SettingScreen:
10820 'デバッグライン　ここから
10830 '0のとき
10840 'デバッグライン　ここまで
10850 'デバッグライン　ここから
10860 case 2:
10870 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                         "
10880 color rgb(0,0,0)::No=3
10890 if lang_flag = 1 then
10900 else
10910 locate 1,12:print "3.トップ画面に行くを選択":goto SettingScreen:
10920 endif
10930 'cls:color rgb(255,255,255):print"ok"
10940 'デバッグライン　ここまで
10950 case 3:
10960 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                              ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
10970 'デバッグライン　ここから
10980 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
10990 'デバッグライン　ここまで
11000 case 0:
11010 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.文字の項目を選択":goto SettingScreen:
11020 'デバッグライン　ここから
11030 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11040 'デバッグライン　ここまで
11050 end select
11060 endif
11070 'バーチャルパッド　上 ここから
11080 if y = -1 then
11090 select case No
11100 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11110 case 1:
11120 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択":goto SettingScreen:
11130 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11140 case 0:
11150 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
11160 'No:3 3.Help→2.設定 No:2
11170 case 3:
11180 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.結果表示設定を選択":goto SettingScreen:
11190 case 2:
11200 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.文字の項目を選択":goto SettingScreen:
11210 end select
11220 endif
11230 if bg=1 then
11240 select case No
11250 '1.数霊チェックを選択  パッドの右キー
11260 case 1:
11270 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
11280 '2.設定を選択    パッドの右キー
11290 case 2:
11300 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
11310 '3.ヘルプを選択 パッドの右
11320 case 3:
11330 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
11340 'プログラムの終了を選択
11350 case 0:
11360 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":ui_msg "プログラムを終了します":color rgb(255,255,255):pause 2.052*1000:end
11370 'if lang_flag = 1 then
11380 'Else
11390 'ui_msg "プログラムを終了します"
11400 'endif
11410 end select
11420 endif
11430 '4.終了するを選択  パッドの右
11440 'バーチャルパッド　ここまで'
11450 'SettingScreen:
11460 'key$ = input$(1)
11470 'カーソル下'
11480 if key$ = chr$(31) then
11490 select case (No Mod 4)
11500 '登録文字から数霊文字の確認
11510 case 1:
11520 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.結果表示設定を選択":goto SettingScreen:
11530 '数霊文字の確認からトップ画面に行く
11540 case 2:
11550 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
11560 'トップ画面に行くから終了
11570 case 3:
11580 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
11590 '終了から登録文字
11600 case 0:
11610 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.文字の項目を選択":goto SettingScreen:
11620 end select
11630 endif
11640 'カーソル　上
11650 if key$ = chr$(30) then
11660 select case (No Mod 4)
11670 case 1:
11680 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
11690 case 2:
11700 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
11710 case 3:
11720 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
11730 case 0:
11740 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
11750 end select
11760 endif
11770 'エンターキーを押したとき
11780 if key$ = chr$(13) then
11790 if No=3 then goto TopScreen:
11800 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
11810 'if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji1:
11820 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
11830 if No=0 then color rgb(255,255,255):play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":cls 3:cls 4:color rgb(255,255,255):end
11840 'lse
11850 'o'o SettingScreen:
11860 endif
11870 'endif
11880 'endif
11890 '文字検索項目  ここから
11900 Moji_Search:
11910 cls 4:cls 3:Font 32+16:init"kb:2"
11920 gload Gazo$ + "Moji_Search_Result.png"
11930 play ""
11940 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
11950 print "" + chr$(13)
11960 color rgb(255,0,0)
11970 if lang_flag = 1 then
11980 Else
11990 print "文字を一文字入れてください" + chr$(13)
12000 endif
12010 color rgb(0,0,0)
12020 if lang_flag=1 then
12030 Else
12040 Input "登録文字:",moji$
12050 endif
12060 moji_count = len(moji$)
12070 if moji_count > 1 then
12080 if lang_flag = 1 then
12090 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
12100 Else
12110 endif
12120 else
12130 count=0
12140 for n = 0 to 116
12150 if bufline$(2*n) = moji$ then
12160 cls 3:font 48:init"kb:4"
12170 gload Gazo$ + "Moji_Search_Result.png"
12180 'talk"この文字は登録されています"
12190 play ""
12200 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12210 if lang_flag = 1 then
12220 Else
12230 print chr$(13)
12240 color rgb(255,0,0)
12250 print moji$;"は、登録されています。" + chr$(13)
12260 color rgb(0,0,0)
12270 print "ジョイパッドの右を押してください"
12280 endif
12290 bg = 0:key$ = ""
12300 while (bg <> 1 and key$ <> chr$(13))
12310 key$ = inkey$
12320 bg = strig(1)
12330 pause 2
12340 wend
12350 'y$=input$(1)
12360 if key$ = chr$(13) then goto TopScreen:
12370 if bg=1 then goto TopScreen:
12380 count = count + 1
12390 endif
12400 next n
12410 if count = 0 then
12420 cls 3:font 48:init "kb:2"
12430 gload Gazo$ + "Moji_check.png"
12440 play ""
12450 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
12460 print chr$(13)
12470 if lang_flag = 1 then
12480 Else
12490 color rgb(255,0,0)
12500 print moji$;"は、登録されていません。" + chr$(13)
12510 color rgb(0,0,0)
12520 print "パッドの右を押してください" + chr$(13)
12530 endif
12540 kg = 0:key$ = ""
12550 while (kg <> 1 and key$ <> chr$(13))
12560 key$ = inkey$
12570 kg = strig(1)
12580 pause 2
12590 wend
12600 if key$ = chr$(13) then goto TopScreen:
12610 endif
12620 endif
12630 Surei_Result2:
12640 cls 3:Font 48
12650 zcount1=0:zcount2=0:count1=0:count2=0
12660 '1人目
12670 mojicount1=len(buf_Parson1$)
12680 '2人目
12690 mojicount2 = len(buf_Parson2$)
12700 '1人目
12710 for n = 1 to mojicount1
12720 for j = 1 to 116
12730 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
12740 if bufcount1$(n-1) = bufline$(2*j) then
12750 zcount1 = zcount1 + 1
12760 endif
12770 next j
12780 next n
12790 '2人目
12800 for n = 1 to mojicount2
12810 for j = 1 to 116
12820 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
12830 if bufcount2$(n-1) = bufline$(2*j) then
12840 zount2 = zcount2 + 1
12850 endif
12860 next j
12870 next n
12880 '1人目
12890 for i=1 to mojicount1
12900 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
12910 p1 = Complate(bufcount1$(i-1))
12920 count1 = count1 + p1
12930 next i
12940 '2人目
12950 for i = 1 to mojicount2
12960 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
12970 p2 = Complate(bufcount2$(i-1))
12980 count2 = count2 + p2
12990 next i
13000 cls 3:
13010 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
13020 color rgb(255,0,0)
13030 'print "数霊 2人用 結果表示"+chr$(13)
13040 print ""+chr$(13)
13050 if lang_flag = 1 then
13060 else
13070 color rgb(255,255,255)
13080 print "1人目:";buf_Parson1$;chr$(13)
13090 print "数霊1:";count1;chr$(13)
13100 print "2人目:";buf_Parson2$;chr$(13)
13110 print "数霊2:";count2;chr$(13)
13120 print "数霊(合計):";count1 + count2;chr$(13)
13130 color rgb(0,0,0)
13140 print "エンターキーを押してください" + chr$(13)
13150 endif
13160 key$ = "":bg = 0
13170 'ey$=input$(1)
13180 while (bg <> 1 and key$ <> chr$(13))
13190 bg = strig(1)
13200 key$ = inkey$
13210 pause 2
13220 wend
13230 if (bg = 1 or key$ = chr$(13))  then goto TopScreen:
13240 Surei_Result3:
13250 cls 3:Font 48
13260 zcount2 = 0:count2 = 0
13270 mojicount2 = len(buffer_moji2$)
13280 for n = 1 to mojicount2
13290 for j = 1 to 116
13300 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
13310 if bufcount2$(n - 1) = bufline$(2 * j) then
13320 zcount2 = zcount2 + 1
13330 endif
13340 next j
13350 next n
13360 for i = 1 to mojicount2
13370 n2 = Complate(bufcount2$(i-1))
13380 count2 = count2 + n2
13390 next i
13400 gload Gazo$ + "Screen5.png"
13410 if lang_flag = 1 then
13420 else
13430 color rgb(255,0,0)
13440 print "数霊の結果表示" + chr$(13)
13450 color rgb(255,255,255)
13460 print "１回目回の文字入力:";buffer_moji$;chr$(13)
13470 print "１回目の数霊(かずたま)";count;chr$(13)
13480 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
13490 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
13500 color rgb(0,0,0)
13510 print "エンターキー:トップ画面";chr$(13)
13520 print "c or C キー:数霊の比較";chr$(13)
13530 endif
13540 key$ = "":bg = 0
13550 while (key$ <> chr$(13) and bg <> 1)
13560 bg = strig(1)
13570 key$ = inkey$
13580 pause 2
13590 wend
13600 'key$ = input$(1)
13610 if bg = 1 then goto TopScreen:
13620 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
13630 if key$ = "c" or key$ = "C" then
13640 if count = count2 then
13650 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
13660 else
13670 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
13680 endif
13690 endif
13700 Moji_Count_Check:
13710 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
13720 cls 3:Font 48
13730 gload Gazo$ + "Moji_check.png"
13740 n = 0
13750 open FILE_csv$ for input as #1
13760 while eof(1) = 0
13770 line input #1, line$
13780 n = n + 1
13790 wend
13800 close #1
13810 'n = n - 1
13820 'talk "登録文字数は"+str$(n)+"文字です"
13830 play ""
13840 if n = 118 then
13850 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
13860 if lang_flag = 1 then
13870 else
13880 'talk "登録文字数は、" + str$(n) + "文字です"
13890 print "" + chr$(13)
13900 color rgb(255,0,0)
13910 print "文字の登録文字数は";n;"文字" + chr$(13)
13920 color rgb(0,0,0)
13930 print "パッドの右を押してください" + chr$(13)
13940 endif
13950 endif
13960 'key$ = input$(1)
13970 key$ = "":bg = 0
13980 while (key$ <> chr$(13) and bg <> 1)
13990 key$=inkey$
14000 bg=strig(1)
14010 pause 2
14020 wend
14030 if bg = 1 then goto TopScreen:
14040 if key$ = chr$(13) then
14050 goto TopScreen:
14060 else
14070 goto Moji_Count_Check:
14080 endif
14090 'Save 関数
14100 file_kazutama = 0
14110 file_kazutama = Save_File()
14120 func Save_File()
14130 open SAVE_DATA1$  for output as #1
14140 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
14150 close #1
14160 endfunc
14170 Select_moji:
14180 cls 3:font 48:No = 1
14190 gload Gazo$ + "Screen1_mojicheck.png"
14200 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
14210 color rgb(255,0,0)
14220 'print "文字の確認" + chr$(13)
14230 if lang_flag = 1 then
14240 else
14250 print chr$(13)
14260 color rgb(255,255,255)
14270 print "番号を選んでください" + chr$(13)
14280 print " :1.登録文字検索"+ chr$(13)
14290 print " :2.登録文字数の確認" + chr$(13)
14300 print " :3.トップ画面に戻る" + chr$(13)
14310 print " :4.終　了" + chr$(13)
14320 color rgb(0,0,0)
14330 if No = 1 then print " 1.登録文字検索を選択"
14340 endif
14350 Entry_check_key:
14360 y = 0:key$ = "":bg=0
14370 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
14380 y = stick(1)
14390 key$ = inkey$
14400 bg=strig(1)
14410 pause 2
14420 wend
14430 'バーチャルパッド　ここから'
14440 'バーチャルパッド　ここから'
14450 if y = 1 then
14460 select case No
14470 'No の初期値：No=1
14480 case 1:
14490 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
14500 'デバッグライン　ここから
14510 '0のとき
14520 'デバッグライン　ここまで
14530 'デバッグライン　ここから
14540 case 2:
14550 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                       "
14560 :No=3
14570 'if lang_flag = 1 then
14580 'Else
14590 color rgb(0,0,0):locate 0,12:print " 3.トップ画面に戻るを選択":goto Entry_check_key:
14600 'endif
14610 'cls:color rgb(255,255,255):print"ok"
14620 'デバッグライン　ここまで
14630 case 3:
14640 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 0,12:print " 4.終 了を選択":No=0:goto Entry_check_key:
14650 'デバッグライン　ここから
14660 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
14670 'デバッグライン　ここまで
14680 case 0:
14690 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 0,12:print " 1.登録文字数の確認を選択":goto Entry_check_key:
14700 'デバッグライン　ここから
14710 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
14720 'デバッグライン　ここまで
14730 end select
14740 endif
14750 'バーチャルパッド　上 ここから
14760 if y = -1 then
14770 select case No
14780 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
14790 case 1:
14800 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 0,12:print" 4.終了を選択"::goto Entry_check_key:
14810 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
14820 case 0:
14830 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                      ":locate 1,12:print"3.トップ画面に戻るを選択":goto Entry_check_key:
14840 'No:3 3.Help→2.設定 No:2
14850 case 3:
14860 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
14870 case 2:
14880 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_check_key:
14890 end select
14900 endif
14910 if bg=1 then
14920 select case No
14930 '1.数霊チェックを選択  パッドの右キー
14940 case 1:
14950 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
14960 '2.設定を選択    パッドの右キー
14970 case 2:
14980 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
14990 '3.ヘルプを選択 パッドの右
15000 case 3:
15010 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
15020 'プログラムの終了を選択
15030 case 0:
15040 cls 3:cls 4::play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":ui_msg "プログラムを終了します":color rgb(255,255,255):pause 2.052 * 1000:end
15050 'if lang_flag = 1 then
15060 'else
15070 'endif
15080 end select
15090 endif
15100 '4.終了するを選択  パッドの右
15110 'バーチャルパッド　ここまで'
15120 'key$ = input$(1)
15130 'カーソルの下
15140 if key$ = chr$(31) then
15150 select case (No Mod 4)
15160 case 0:
15170 c=1:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
15180 case 1:
15190 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:sp_on 3,0:goto Entry_check_key:
15200 case 2:
15210 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:goto Entry_check_key:
15220 case 3:
15230 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
15240 end select
15250 endif
15260 'カーソル　上
15270 if key$ = chr$(30) then
15280 select case (No Mod 4)
15290 case 0:
15300 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
15310 case 1:
15320 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
15330 case 2:
15340 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
15350 case 3:
15360 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
15370 end select
15380 endif
15390 'エンターキーを押す
15400 if key$ = chr$(13) then
15410 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15420 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15430 if No = 3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15440 if No = 0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
15450 endif
15460 '
15470 Kakunin_Surei_count:
15480 cls 3:font 48:No=1
15490 gload Gazo$ + "Kazutama_List_Top.png"
15500 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
15510 color rgb(255,0,0)
15520 print chr$(13)
15530 color rgb(255,255,255)
15540 'if lang_flag = 1 then
15550 'else
15560 print "番号を選んでください" + chr$(13)
15570 print " :1.数霊リスト 1人用" + chr$(13)
15580 print " :2.結果表示設定" + chr$(13)
15590 print " :3.トップ画面に行く" + chr$(13)
15600 print " :4.終 了" + chr$(13)
15610 print "" + chr$(13)
15620 'endif
15630 color rgb(0,0,0)
15640 locate 0,12:print"                                                         "
15650 if No = 1 then locate 1,12:print "1.数霊リスト　1人用を選択"
15660 Entry_List:
15670 y = 0:key$ = "":bg=0
15680 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
15690 y = stick(1)
15700 key$ = inkey$
15710 bg = strig(1)
15720 pause 2
15730 wend
15740 'バーチャルパッド　ここから'
15750 'バーチャルパッド　ここから'
15760 'バーチャルパッド　下
15770 if y = 1 then
15780 select case No
15790 'No の初期値：No=1
15800 case 1:
15810 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.結果表示設定を選択":goto Entry_List:
15820 'デバッグライン　ここから
15830 '0のとき
15840 'デバッグライン　ここまで
15850 'デバッグライン　ここから
15860 case 3:
15870 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:No=0:pause 200:locate 0,12:print "                                       "
15880 color rgb(0,0,0):locate 0,12:print " 4.終了を選択":goto Entry_List:
15890 'cls:color rgb(255,255,255):print"ok"
15900 'デバッグライン　ここまで
15910 case 0:
15920 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,200),0,0:pause 200:locate 0,12:print"                                       ":locate 0,12:print " 1.数霊リスト 1人用を選択":No=1:goto Entry_List:
15930 case 2:
15940 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                      ":No=3:locate 1,12:print "3．トップ画面に行くを選択":goto Entry_List:
15950 'sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print "                                      "
15960 'case 1:
15970 'デバッグライン　ここから
15980 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
15990 'デバッグライン　ここまで
16000 'case 0:
16010 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_List:
16020 'デバッグライン　ここから
16030 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
16040 'デバッグライン　ここまで
16050 end select
16060 endif
16070 'バーチャルパッド　上 ここから
16080 if y = -1 then
16090 select case No
16100 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
16110 case 3:
16120 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,300),0,0:pause 200:No=2:locate 0,12:print "                                      ":locate 0,12:print " 2.結果表示設定を選択":goto Entry_List:
16130 case 1:
16140 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 0,12:print " 4.終了を選択":goto Entry_List:
16150 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
16160 case 0:
16170 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,400),0,0:pause 200:No=3:locate 0,12:print "                                      ":locate 1,12:print"3.トップ画面に行くを選択":goto Entry_List:
16180 'No:3 3.Help→2.設定 No:2
16190 case 2:
16200 sp_on 1,1:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 1,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.数霊リスト 1人用を選択":goto Entry_List:
16210 'case 2:
16220 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_List:
16230 end select
16240 endif
16250 if bg = 1 then
16260 select case No
16270 '1.数霊リスト 一人用を選択を選択  パッドの右キー
16280 case 1:
16290 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16300 '2.設定を選択  パッドの右キー
16310 case 2:
16320 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16330 case 3:
16340  sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16350 '4.終了を選択 パッドの右
16360 case 0:
16370 cls 3:cls 4:color rgb(255,255,255):
16380 play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:
16390 'Else
16400 ui_msg "プログラムを終了します":end
16410 'endif
16420 'プログラムの終了を選択
16430 end select
16440 endif
16450 if key$=chr$(13) then
16460 select case No
16470 case 0:
16480       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":end
16490 case 1:
16500       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16510 case 2:
16520       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16530 case 3:
16540       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16550 end select
16560 endif
16570 '4.終了するを選択  パッドの右
16580 'バーチャルパッド　ここまで'
16590 'Input "番号:",No
16600 'if No=2 then goto TopScreen:
16610 'if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
16620 'if No=1 then goto Surei_List1:
16630 'if No > 3 or No=0 then ui_msg"無効な数字です、入れ直してください":talk"無効な数字です":goto Kakunin_Surei_count:
16640 'if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
16650 Surei_List1:
16660 cls 3:font 48
16670 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
16680 file$ = dir$(SAVE_DATA1$,0)
16690 'ファイルが無いときの画面
16700 if file$ = ""  then
16710 gload "./data/Gazo/" + "KazutamaList1.png",0
16720 print chr$(13)
16730 color rgb(255,0,0):print "登録ファイルはございません" + chr$(13)
16740 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
16750 'else
16760 'endif
16770 bg = 0:key$ = ""
16780 while (key$ <> chr$(13) and bg<>1)
16790 key$ = inkey$
16800 bg = strig(1)
16810 pause 2
16820 wend
16830 'エンターキーもしくはバーチャルパッドの右でトップに行く
16840 if (bg = 1  or key$ = chr$(13)) then goto TopScreen:
16850 else
16860 cls 3:buffer_list_count = Loadcount()
16870 color rgb(255,255,255)
16880 if lang_flag = 1 then
16890 Else
16900 talk "登録件数は" + str$(buffer_list_count) + "件です"
16910 gload Gazo$ + "KazutamaList1_Entry.png",0
16920 color rgb(0,0,255)
16930 print chr$(13)
16940 color rgb(255,0,0)
16950 print "登録件数:";buffer_list_count;"件";chr$(13)
16960 color rgb(0,0,0)
16970 print "パッドの右を押してください" + chr$(13)
16980 endif
16990 bg = 0:key$ = "":bg2 = 0
17000 while (key$ <> chr$(13) and bg <> 1)
17010 key$ = inkey$
17020 bg = strig(1)
17030 bg2=strig(0)
17040 pause 2
17050 wend
17060 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
17070 if (key$ = chr$(13) or bg = 1) then pause 2:goto KotodamaList_page:
17080 endif
17090 if (bg2 = 1) then pause 2:goto TopScreen:
17100 func Loadcount()
17110 n = 0
17120 'while eof(1)=-1
17130 open SAVE_DATA1$  for input as #1
17140 while eof(1) <> -1
17150 line input #1,line$
17160 n = n + 1
17170 wend
17180 close #1
17190 count = n
17200 endfunc count
17210 count_line = Loadcount()
17220 func Kotodama$(buf$)
17230 color rgb(255,255,255)
17240 b = len("数霊:")
17250 a$ = Mid$(buf$,b+1,len(buf$))
17260 for i=0 to 118
17270 color rgb(255,255,255)
17280 if bufline3$(2 * i) ="数霊:" + a$  then
17290 moji_$ = bufline3$(2*i + 1)
17300 'moji_$ = bufline3$(21)
17310 'moji$ = a$
17320 endif
17330 next i
17340 'kotodama$ = a$
17350 kotodama$ = moji_$
17360 endfunc kotodama$
17370 KotodamaList_page:
17380 cls 3:font 48:m = 0:
17390 gload Gazo$ + "Screen5_Surei_List.png"
17400 if SAVE_DATA1$ = "" then
17410 cls 3:print"ファイルがありません"
17420 else
17430 a = Loadcount()
17440 open SAVE_DATA1$  for input as #1
17450 for i=0 to a-1
17460 for n=0 to 1
17470 input #1,line$
17480 bufKaztama$(i,n) = line$
17490 next n
17500 next i
17510 close #1
17520 'endif
17530 l = 0:n=0
17540 gload Gazo$ + "Screen5_Surei_List.png"
17550 while (buffer_list_count >= l)
17560 'while (l<=a)
17570 cls
17580 color rgb(255,0,0)
17590 'print "数霊　リスト" + chr$(13)
17600 print chr$(13)
17610 color rgb(255,255,255)
17620 n=n+1
17630 'while (n <= a)
17640 print "番号:";l+1;chr$(13)
17650 print bufKaztama$(l,0) + chr$(13)
17660 print bufKaztama$(l,1) + chr$(13)
17670 'n=n+1
17680 Kmoji$ = moji$
17690 print chr$(13) + chr$(13)
17700 color rgb(0,0,0)
17710 print " :パッドの左:トップ画面" + chr$(13)
17720 print " :パッドの右:次へ行く" + chr$(13)
17730 'wend
17740 key$ = "":bg = 0:bg2 = 0
17750 while (key$ <> chr$(13) and bg <> 1 and bg2 <> 1)
17760 key$ = inkey$
17770 bg = strig(1)
17780 bg2 = strig(0)
17790 pause 2
17800 wend
17810 'key$ = input$(1)
17820 if (key$ = " " OR bg = 1) then
17830 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
17840 else
17850 if ((bg2 = 1) or (key$=chr$(13))) then
17860    goto TopScreen:
17870 endif
17880 else
17890 goto KotodamaList_page:
17900 endif
17910 wend
17920 'wend
17930 endif
17940 '結果表示２ Menu1
17950 Surei_Result4:
17960 cls 3:font (48-16):init"kb:4"
17970 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
17980 for i=0 to 181 + 3 - 1
17990 if i = count  then
18000 buffer$ = bufline2$(count + 4,0)
18010 endif
18020 next i
18030 if len(buffer$) > 23 and len(buffer$) <= 45 then
18040 buffer2$ = Mid$(buffer$,1,24)
18050 buffer3$ = Mid$(buffer$,25,(len(buffer$) - 25))
18060 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)
18070 else
18080 if len(buffer$) <= 23 then
18090 buffer2$ = Mid$(buffer$,1,22)
18100 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
18110 else
18120 if len(buffer$) > 45 and len(buffer$) <= 64 then
18130 buffer2$ = Mid$(buffer$,1,22)
18140 buffer3$ = Mid$(buffer$,23,20)
18150 buffer4$ = Mid$(buffer$,43,(len(buffer$)-43))
18160 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)+chr$(13)
18170 else
18180 if len(buffer$) > 64 and len(buffer$) <= 81 then
18190 buffer2$ = Mid$(buffer$,1,23)
18200 buffer3$ = Mid$(buffer$,24,20)
18210 buffer4$ = Mid$(buffer$,42,20)
18220 buffer5$ = Mid$(buffer$,63,(len(buffer$)-62))
18230 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13) + chr$(13) + chr$(13)
18240 if len(buffer$) > 81 and len(buffer$) <= 110 then
18250 buffer2$ = Mid$(buffer$,1,21)
18260 buffer3$ = Mid$(buffer$,22,20)
18270 buffer4$ = Mid$(buffer$,42,20)
18280 buffer5$ = Mid$(buffer$,62,20)
18290 buffer6$ = Mid$(buffer$,82,(len(buffer$) - 82))
18300 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13) + chr$(13) + chr$(13)
18310 endif
18320 endif
18330 endif
18340 endif
18350 endif
18360 Surei_Result4_2:
18370 gload Gazo$ + "Screen1_Result2.png"
18380 cls
18390 color rgb(255,0,0)
18400 'print "診断結果 2" + chr$(13)
18410 print chr$(13)
18420 if lang_flag = 1 then
18430 else
18440 color rgb(127,255,212)
18450 print "入力文字:";buffer_moji$;chr$(13)
18460 print "数霊:";count;chr$(13)
18470 color rgb(255,255,255)
18480 print "数霊の説明:"+chr$(13)
18490 print buffer$
18500 color rgb(0,0,0)
18510 print "(パッド 左):保存,S(パッド 右):トップ画面" + chr$(13)
18520 endif
18530 key$ = "":bg = 0:bg2 = 0
18540 while (key$<>chr$(13) and bg<>1 and bg2<>1)
18550 key$=inkey$
18560 bg=strig(1)
18570 bg2=strig(0)
18580 pause 2
18590 wend
18600 if bg=1 then buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
18610 if key$ = chr$(13) then
18620 buffer$ = "":buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
18630 endif
18640 if bg2=1 then
18650 'ファイルがない時
18660 if dir$(SAVE_DATA1$) = "" then
18670 open SAVE_DATA1$ for output as #1
18680 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18690 close #1
18700 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
18710 'ファイルが有る時
18720 else
18730 open SAVE_DATA1$ for append as #1
18740 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18750 close #1
18760 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
18770 endif
18780 endif
18790 if key$="s" or key$="S" then
18800 if dir$(SAVE_DATA1$) = "" then
18810 open SAVE_DATA1$ for output as #1
18820 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18830 close #1
18840 ui_msg"保存しました":talk"保存しました":goto Surei_Result4_2:
18850 else
18860 open SAVE_DATA1$ for append as #1
18870 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18880 close #1
18890 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
18900 endif
18910 else
18920 talk "無効な文字です":goto Surei_Result4_2:
18930 endif
18940 'endif
18950 func All_clear()
18960 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
18970 endfunc
18980 'ここから
18990 Config_moji1:
19000 cls 3:Font 48
19010 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19020 play ""
19030 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
19040 No=1
19050 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19060 color rgb(0,0,255)
19070 'print "●設定項目" + chr$(13)
19080 print chr$(13)
19090 if lang_flag = 1 then
19100 'lang_flag = 1:英語
19110 else
19120 'lang_flag = 0:日本語
19130 color rgb(255,255,255)
19140 print "番号を選んでください" + chr$(13)
19150 'print " :1.文字の項目" + chr$(13)
19160 'print " :2.結果表示設定" + chr$(13)
19170 print " :1.文字の項目" + chr$(13)
19180 print " :2.結果表示設定" + chr$(13)
19190 print " :3.トップ画面に行く" + chr$(13)
19200 print " :4.終 了" + chr$(13)
19210 endif
19220 color rgb(0,0,0)
19230 locate 1,12
19240 if No = 1 then print "1.文字の項目"
19250 'y:バーチャルパッドの処理
19260 'key$:カーソルの処理
19270 'bg:バーチャルパッドの右ボタン
19280 Config_moji1_Screen:
19290 y = 0:key$ = "":bg=0
19300 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
19310 y = stick(1)
19320 key$ = inkey$
19330 bg=strig(1)
19340 pause 2
19350 wend
19360 'バーチャルパッド　ここから'
19370 'バーチャルパッド　ここから'
19380 if y = 1 then
19390 select case No
19400 'No の初期値：No=1
19410 case 1:
19420 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
19430 'デバッグライン　ここから
19440 '0のとき
19450 'デバッグライン　ここまで
19460 'デバッグライン　ここから
19470 case 2:
19480 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
19490 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
19500 'if lang_flag = 1 then
19510 'else
19520 locate 1,12:print "3.トップ画面に行くを選択"
19530 'endif
19540 'cls:color rgb(255,255,255):print"ok"
19550 'デバッグライン　ここまで
19560 case 3:
19570 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
19580 'デバッグライン　ここから
19590 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
19600 'デバッグライン　ここまで
19610 case 0:
19620 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
19630 'デバッグライン　ここから
19640 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
19650 'デバッグライン　ここまで
19660 end select
19670 endif
19680 'バーチャルパッド　上 ここから
19690 if y = -1 then
19700 select case No
19710 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
19720 case 1:
19730 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
19740 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
19750 case 0:
19760 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
19770 'No:3 3.Help→2.設定 No:2
19780 case 3:
19790 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
19800 case 2:
19810 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
19820 end select
19830 endif
19840 if bg=1 then
19850 select case No
19860 '1.数霊チェックを選択  パッドの右キー
19870 case 1:
19880 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
19890 '2.設定を選択    パッドの右キー
19900 case 2:
19910 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
19920 '3.ヘルプを選択 パッドの右
19930 case 3:
19940 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
19950 'プログラムの終了を選択
19960 case 0:
19970 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
19980 'if lang_flag = 1 then
19990 'Else
20000 ui_msg "プログラムを終了します":end
20010 'endif
20020 end select
20030 endif
20040 '4.終了するを選択  パッドの右
20050 'バーチャルパッド　ここまで'
20060 'SettingScreen:
20070 'key$ = input$(1)
20080 'カーソル下'
20090 if key$ = chr$(31) then
20100 select case (No Mod 4)
20110 '登録文字から数霊文字の確認
20120 case 1:
20130 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
20140 '数霊文字の確認からトップ画面に行く
20150 case 2:
20160 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
20170 'トップ画面に行くから終了
20180 case 3:
20190 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
20200 '終了から登録文字
20210 case 0:
20220 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20230 end select
20240 endif
20250 'カーソル　上
20260 if key$ = chr$(30) then
20270 select case (No Mod 4)
20280 case 1:
20290 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
20300 case 2:
20310 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
20320 case 3:
20330 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
20340 case 0:
20350 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
20360 end select
20370 endif
20380 'エンターキーを押したとき
20390 if key$ = chr$(13) then
20400 if No=3 then goto TopScreen:
20410 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
20420 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
20430 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
20440 'lse
20450 'o'o SettingScreen:
20460 endif
20470 'ここまで
20480 Config_moji2:
20490 cls 3:Font 48
20500 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
20510 play ""
20520 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
20530 No=1
20540 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
20550 color rgb(0,0,255)
20560 'print "●設定項目" + chr$(13)
20570 print chr$(13)
20580 if lang_flag = 1 then
20590 'lang_flag = 1:英語
20600 else
20610 'lang_flag = 0:日本語
20620 color rgb(255,255,255)
20630 print "番号を選んでください" + chr$(13)
20640 'print " :1.文字の項目" + chr$(13)
20650 'print " :2.結果表示設定" + chr$(13)
20660 print " :1.文字の項目" + chr$(13)
20670 print " :2.結果表示設定" + chr$(13)
20680 print " :3.トップ画面に行く" + chr$(13)
20690 print " :4.終 了" + chr$(13)
20700 endif
20710 color rgb(0,0,0)
20720 locate 1,12
20730 if No = 1 then print "1.文字の項目"
20740 'y:バーチャルパッドの処理
20750 'key$:カーソルの処理
20760 'bg:バーチャルパッドの右ボタン
20770 config_moji2:
20780 y = 0:key$ = "":bg=0
20790 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
20800 y = stick(1)
20810 key$ = inkey$
20820 bg = strig(1)
20830 pause 2
20840 wend
20850 'バーチャルパッド　ここから'
20860 'バーチャルパッド　ここから'
20870 if y = 1 then
20880 select case No
20890 'No の初期値：No=1
20900 case 1:
20910 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
20920 'デバッグライン　ここから
20930 '0のとき
20940 'デバッグライン　ここまで
20950 'デバッグライン　ここから
20960 case 2:
20970 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
20980 color rgb(0,0,0)::No=2:goto SettingScreen:
20990 if lang_flag = 1 then
21000 else
21010 locate 0,12:print " 3.トップ画面に行くを選択"
21020 endif
21030 'cls:color rgb(255,255,255):print"ok"
21040 'デバッグライン　ここまで
21050 case 3:
21060 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
21070 'デバッグライン　ここから
21080 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
21090 'デバッグライン　ここまで
21100 case 0:
21110 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21120 'デバッグライン　ここから
21130 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
21140 'デバッグライン　ここまで
21150 end select
21160 endif
21170 'バーチャルパッド　上 ここから
21180 if y = -1 then
21190 select case No
21200 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
21210 case 1:
21220 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
21230 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
21240 case 0:
21250 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
21260 'No:3 3.Help→2.設定 No:2
21270 case 3:
21280 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
21290 case 2:
21300 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
21310 end select
21320 endif
21330 '決定ボタン
21340 if bg=1 then
21350 select case No
21360 '1.数霊チェックを選択  パッドの右キー
21370 case 1:
21380 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
21390 '2.設定を選択    パッドの右キー
21400 case 2:
21410 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
21420 '3.ヘルプを選択 パッドの右
21430 case 3:
21440 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
21450 'プログラムの終了を選択
21460 case 0:
21470 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
21480 'if lang_flag = 1 then
21490 'Else
21500 ui_msg "プログラムを終了します":end
21510 'endif
21520 end select
21530 endif
21540 '4.終了するを選択  パッドの右
21550 'バーチャルパッド　ここまで'
21560 'SettingScreen:
21570 'key$ = input$(1)
21580 'カーソル下'
21590 if key$ = chr$(31) then
21600 select case (No Mod 4)
21610 '登録文字から数霊文字の確認
21620 case 1:
21630 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
21640 '数霊文字の確認からトップ画面に行く
21650 case 2:
21660 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
21670 'トップ画面に行くから終了
21680 case 3:
21690 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
21700 '終了から登録文字
21710 case 0:
21720 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21730 end select
21740 endif
21750 'カーソル　上
21760 if key$ = chr$(30) then
21770 select case (No Mod 4)
21780 case 1:
21790 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
21800 case 2:
21810 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
21820 case 3:
21830 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
21840 case 0:
21850 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
21860 end select
21870 endif
21880 'エンターキーを押したとき
21890 if key$ = chr$(13) then
21900 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
21910 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
21920 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
21930 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
21940 'lse
21950 'o'o SettingScreen:
21960 endif
21970 '結果表示設定
21980 Result_Setting:
21990 color rgb(255,255,255)
22000 'dim list$(4)
22010 'ファイル読み込み
22020 '1.ファイルが有るか無いかのチェック
22030 if Dir$(System$) = "" then
22040 '1-1.ファイルがないとき
22050 '上のSystemフォルダを作成
22060 mkdir "./System/"
22070 list$(0) = "●:出た数字から181を引く"
22080 list$(1) = " :出た数字から180を引き単数変換"
22090 open System$ for output as #1
22100 print #1,"config_r=0"
22110 close #1
22120 ui_msg "ファイルを作成しました"
22130 'ファイル作成
22140 else
22150 '1-2.ファイルが有るとき
22160 'config_r:0 出た数字から181を引く
22170 'config_r:1 出た数字から180を引いて単数変換
22180 'open "./System/config.sys" for input as #1
22190 'ファイルが有るときファイルを読み込み
22200 open System$ for input as #1
22210 line input #1,buf_line$
22220 'buf$にデーターをコピーする
22230 buf$ = buf_line$
22240 close #1
22250 if len(buf$) = 10 then
22260  if left$(buf$,9) = "config_r=" then
22270  buf$ = right$(buf_line$,1)
22280  if buf$ = "1" then
22290    '1.System$ ファイルを削除(config.sys)
22300    '2.1行目をconfig_r=1と書き、保存する
22310    buf_config_r = 1
22320    'list$(0) = "●:1.出た数字から180を引いて単数変換"
22330    'list$(1) = " :2.出た数字から181を引く"
22340    else
22350  if buf$ = "0" then
22360    buf_config_r = 0
22370   ' list$(0) = "●:1.出た数字から181を引く"
22380   'list$(1) = " :2.出た数字から180を引いて単数変換"
22390  endif
22400  endif
22410  endif
22420 endif
22430 endif
22440 '"●:1.出た数字から180を引く"をlist$(0)に代入
22450 if buf_config_r =  0 then
22460 list$(0) = "●:1.出た数字から181を引く"
22470 list$(1) = " :2.出た数字から180を引いて単数変換"
22480 else
22490 list$(0) = "●:1.出た数字から180を引いて単数変換"
22500 list$(1) = " :2.出た数字から181を引く"
22510 endif
22520 list$(2) = " :トップ画面に戻る"
22530 list$(3) = " :終 了"
22540 list_num = ui_select("list$","番号を選んでください")
22550 play ""
22560 Select case (list_num)
22570 case 0:
22580        if buf$ = "1" then
22590        buf_config_r = 0:
22600        'データーを変更したのでファイルを削除
22610        kill System$
22620        'ファイルを新しく作成
22630        open System$ for output as #1
22640        print #1,"config_r=0"
22650        close #1
22660        ui_msg "設定を変更しました。"
22670        else
22680        'if buf$ = "0" then
22690        'buf_config_r = 1
22700        'kill System$
22710        'open Syetem$ for output as #1
22720        'print #1,"config_r=1"
22730        'close #1
22740        'ui_msg "設定を変更しました"
22750        'endif
22760        endif
22770        goto config_moji2:
22780 case 1:
22790        if buf$ = "0" then
22800        buf_config_r = 1:
22810        'データーを変更したので、ファイルを削除
22820        kill System$
22830        'ファイルを新しく作成
22840        open System$ for output as #1
22850        print #1,"config_r=1"
22860        close #1
22870        ui_msg "設定を変更しました"
22880        else
22890        kill System$
22900        if buf$ = "1" then
22910        open System$ for output as #1
22920        print #1,"config_r=0"
22930        close #1
22940        ui_msg "設定を変更しました"
22950        endif
22960        endif
22970        goto config_moji2:
22980 case 2:
22990       'トップ画面に飛ぶ
23000        goto TopScreen:
23010 case 3:
23020       'プログラムを終了する
23030       cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
23040 end select
23050 '単数変換
23060 Func Single_Complate(num)
23070 '1.出てきた数字から180を引く
23080 a = num - 180
23090 'a:10〜99
23100 Re1:
23110 if (a > 9 and a < 100) then
23120  b1 = fix(a / 10)
23130  b2 = 10 * a - b1
23140  d1 = b1 + b2
23150 if c>9 then
23160  goto Re1:
23170 else
23180  c=d1:goto Re2:
23190 endif
23200 endif
23210 Re2:
23220 buffer = c
23230 endfunc buffer
