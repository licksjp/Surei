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
440 'Version 1.2.9_2023.01.15-2023.01.22(Release):正式版
450 '現在のバージョン
460 Version$ = "1.2.9_2023.01.22(正式版)"
470 'csvファイル 1.数霊 ベースファイル
480 FILE_csv$ = "data/Kazutama.csv"
490 'csvファイル 2.数霊 ベースファイル 2
500 FILE_csv2$ = "data/Surei_chart_20211207.csv"
510 'Save ファイル
520 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
530 'gazo ファイル
540 Gazo$ = "data/Gazo/"
550 'System フォルダ:設定ファイルを保存するところ
560 System$ = "System/config.sys"
570 '設定ファイル名:config.sys
580 'Sound File(Voice)
590 '1.ボイス TopScreen
600 Voice_File_TopScreen$ = "data/Sound_data/"
610 '変数領域
620 'vcount:バーチャルパッド下の変数
630 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
640 count2 = 0:N=0:N2=0:m2 = 0
650 dim list$(4),moji_List$(2)
660 'ファイルの有無チェック
670 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
680 '1.ファイルが無いとき
690 cls :print "依存ファイルが見つかりません":
700 print "エンターキーを押してください" + chr$(13)
710 key$ = input$(1)
720 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
730 else
740 '2.ファイルが有るとき
750 cls:print "csv:file ok." + chr$(13)
760 n=0
770 open FILE_csv$ for input as #1
780 while eof(1) = 0
790 input #1,line$
800 'print line$
810 bufline$(n) = line$
820 'Print n;chr$(13)
830 n = n + 1
840 wend
850 close #1
860 N=n
870 '2つ目のファイル読み込み
880 'n = 0
890 open FILE_csv2$ for input as #2
900 for n=3 to 181
910 for i=0 to 1
920 input #2,line$
930 bufline2$(n,i) = line$
940 next i
950 next n
960 close #2
970 N2 = n
980 '
990 endif
1000 '設定ファイルの読み込み
1010 'open System$ for input as #1
1020 'line input #1,buf_line$
1030  'if len(buf_line$) = 10 then
1040   'if left$(buf_line$,9)="config_r=" then
1050   ' buf$ = right$(buf_line$,1)
1060    'if buf$ = "1" then
1070    '   buf_config_r = 1
1080   ' else
1090   '    buf_config_r = 0
1100   ' endif
1110  ' endif
1120 'endif
1130 'close #1
1140 'or j = 3 to 181+3
1150 'ufline3$(j - 3,n) = bufline2$(i,n)
1160 'next j
1170 'moji$ = Kotodama$(bufline3$(16))
1180 'erase bufline2$
1190 '2022.11.23----------------------
1200 '端末言語のチェック
1210 '日本語端末かチェックをして日本語以外なら英語で表示する
1220 'lang flag:0:日本語 1:英語(日本語以外)
1230 '--------------------------------
1240 lang_flag = 0
1250 if ex_info$(1) <> "JP" then
1260 lang_flag = 1
1270 endif
1280 'Top画面
1290 TopScreen:
1300 'バーチャルパッドを表示
1310 cls 3:font 48:screen 1,1,1:init"kb:4"
1320 'play ""
1330 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
1340 gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
1350 '選択肢 1
1360 gload Gazo$ + "Selection.png",1,5,200
1370 '選択肢 2
1380 gload Gazo$ + "Selection.png",1,5,300
1390 '選択肢 3
1400 gload Gazo$ + "Selection.png",1,5,400
1410 '選択肢 4
1420 gload Gazo$ + "Selection.png",1,5,500
1430 color rgb(0,0,255)
1440 print chr$(13)
1450 if lang_flag = 1 then
1460 color rgb(255,255,255)
1470 print "Select Number" + chr$(13)
1480 print " :1.Kazutama check" + chr$(13)
1490 print " :2.Setting" + chr$(13)
1500 print " :3.Help" + chr$(13)
1510 print " :4.End Program" + chr$(13)
1520 color rgb(255,255,255)
1530 else
1540 color rgb(255,255,255)
1550 print "番号を選んでください" + chr$(13)
1560 print " :1.数霊(かずたま)チェック" + chr$(13)
1570 print " :2.設定" + chr$(13)
1580 print " :3.ヘルプ" + chr$(13)
1590 print " :4.終　了" + chr$(13)
1600 color rgb(0,0,0)
1610 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
1620 'バーチャルパッドを表示
1630 No=1:
1640 'lang_flag:1 外国語,0:日本語
1650 if lang_flag = 1 then
1660 'lang_flag=1 英語
1670 locate 0,12:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
1680 else
1690 'lang_flag=0 日本語
1700 locate 0,12:color rgb(0,0,0):print "1.数霊(かずたま)チェックを選択";chr$(13)
1710 endif
1720 endif
1730 'スプライト
1740 '選択肢 1 On
1750 sp_def 0,(5,200),32,32
1760 sp_on 0,1
1770 sp_put 0,(5,200),0,0
1780 '選択肢 2 Off
1790 sp_def 1,(5,300),32,32
1800 sp_on 1,0
1810 sp_put 1,(5,300),0,0
1820 '選択肢 3 Off
1830 sp_def 2,(5,400),32,32
1840 sp_on 2,0
1850 sp_put 2,(5,400),0,0
1860 '選択肢 4 Off
1870 sp_def 3,(5,500),32,32
1880 sp_on 3,0
1890 sp_put 3,(5,500),0,0
1900 color rgb(0,0,0)
1910 Main_Select:
1920 'y:バーチャルパッドの処理
1930 'key$:カーソルの処理
1940 y = 0:key$ = "":bg = 0
1950 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
1960 y = stick(1)
1970 key$ = inkey$
1980 bg = strig(1)
1990 pause 2
2000 wend
2010 'if y=1 then
2020 'select case (No Mod 4)
2030 'ase 0:
2040 '     c=1:No=c:sp_on 0,1:sp_on 1,0 :sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print " 数霊(かずたま)チェックを選択":beep:goto Main_Select:
2050 'case 1:
2060 '       =2:No=c:sp_on 0,0:
2070 '"ase 2:
2080 'ase 3:
2090 'nd select
2100 'ndif
2110 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
2120 '1.バーチャルパッドの処理
2130 'バーチャルパッド下を押した時
2140 if y = 1 then
2150 select case No
2160 'No の初期値：No=1
2170 case 1:
2180 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":
2190 if lang_flag = 1 then
2200 'lang_flag=1 英語
2210 else
2220 'lang_flag=0 日本語
2230 locate 0,12:print "2.設定を選択":goto Main_Select:
2240 endif
2250 'デバッグライン　ここから
2260 '0のとき
2270 'デバッグライン　ここまで
2280 'デバッグライン　ここから
2290 'バーチャルパッド　下
2300 case 2:
2310 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:
2320 if lang_flag = 1 then
2330 else
2340 print "                                         ":
2350 color rgb(0,0,0):locate 0,12:
2360 print "3.ヘルプを選択":No=3:goto Main_Select:
2370 endif
2380 'cls:color rgb(255,255,255):print"ok"
2390 'デバッグライン　ここまで
2400 case 3:
2410 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                               "
2420 if lang_flag = 1 then
2430 else
2440 locate 0,12:print "4.終了を選択":No=0:goto Main_Select:
2450 endif
2460 'デバッグライン　ここから
2470 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
2480 'デバッグライン　ここまで
2490 case 0:
2500 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1
2510 if lang_flag = 1 then
2520 'lang_flag=1:英語
2530 else
2540 'lang_flag=0:日本語
2550 locate 0,12:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
2560 'endif
2570 endif
2580 'デバッグライン　ここから
2590 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
2600 'デバッグライン　ここまで
2610 end select
2620 endif
2630 'バーチャルパッド　上 ここから
2640 if y = -1 then
2650 select case No
2660 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
2670 case 1:
2680 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       "
2690 if lang_flag = 1 then
2700 'lang_flag=1 英語
2710 else
2720 'lang_flag=0 日本語
2730 locate 0,12:print "4.終了を選択":goto Main_Select:
2740 endif
2750 'endif
2760 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
2770 case 0:
2780 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":
2790 if lang_flag = 1 then
2800 '1:英語
2810 else
2820 '0:日本語
2830 locate 0,12:print "3.ヘルプを選択":goto Main_Select:
2840 endif
2850 'No:3 3.Help→2.設定 No:2
2860 case 3:
2870 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      "
2880 if lang_flag = 1 then
2890 '1:英語
2900 else
2910 '0:日本語
2920 locate 0,12:print"2.設定を選択":goto Main_Select:
2930 endif
2940 case 2:
2950 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":
2960 if lang_flag = 1 then
2970 'lang_flag 1 英語
2980 else
2990 'lang_flag 0 日本語
3000 locate 0,12:print"1.数霊(かずたま)チェックを選択":goto Main_Select:
3010 endif
3020 end select
3030 endif
3040 if bg=1 then
3050 select case No
3060 '1.数霊チェックを選択  パッドの右キー(決定)
3070 case 1:
3080 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
3090 '2.設定を選択  パッドの右キー(決定)
3100 case 2:
3110 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
3120 '3.ヘルプを選択 パッドの右(決定)
3130 case 3:
3140 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
3150 'プログラムの終了を選択(決定)
3160 case 0:
3170 cls 3:cls 4:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:
3180 'if lang_flag = 1 then
3190 'lang_flag = 1 英語
3200 'else
3210 'lang_flag = 0 日本語
3220 ui_msg "プログラムを終了します":color rgb(255,255,255):end
3230 'endif
3240 end select
3250 '4.終了するを選択  パッドの右
3260 endif
3270 'バーチャルパッド　上　ここまで
3280 '2.カーソルの処理
3290 'カーソル　下 chr$(31)
3300 if (key$ = chr$(31)) then
3310 select case (No)
3320 '4
3330 '0 選択肢4 => 選択肢1
3340 case 0:
3350 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "              ":color rgb(0,0,0):
3360 if lang_flag = 1 then
3370 'lang flag:1 英語
3380 else
3390 'lang flag:0 日本語
3400 color rgb(0,0,0):locate 0,12:print "1.数霊(かずたま)チェックを選択":beep:goto Main_Select:
3410 endif
3420 '1 選択肢1 => 選択肢2
3430 case 1:
3440 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":
3450 if lang_flag = 1 then
3460 'lang_flag:1 英語
3470 else
3480 'lang_flag:0 日本語
3490 color rgb(0,0,0):locate 0,12:print "2.設定を選択":beep:goto Main_Select:
3500 endif
3510 '2 選択肢2 => 選択肢3
3520 case 2:
3530 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "               ":
3540 if lang_flag = 1 then
3550 'lang flag:1 英語
3560 else
3570 'lang flang:0 日本語
3580 color rgb(0,0,0):locate 0,12:print "3.ヘルプを選択":beep:goto Main_Select:
3590 endif
3600 '3 選択肢３ => 選択肢4
3610 case 3:
3620 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "               ":color rgb(0,0,0)
3630 if lang_flag = 1 then
3640 'lang_flag = 1 英語
3650 else
3660 'lang_flag = 0 日本語
3670 color rgb(0,0,0):locate 0,12:print "4.終 了を選択":beep:goto Main_Select:
3680 endif
3690 case else:
3700 goto Main_Select:
3710 end select
3720 endif
3730 'カーソル　上
3740 if key$=chr$(30) then
3750 select case (No)
3760 '選択肢1 => 選択肢4
3770 case 1:
3780 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:PRINT "                      ":
3790 if lang_flag = 1 then
3800 'lang_flag=1:英語
3810 else
3820 'lang_flag = 0:日本語
3830 else
3840 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
3850 endif
3860 '選択肢2 => 選択肢1
3870 case 2:
3880 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                 ":locate 1,12:beep:print "2.設 定を選択":beep:goto Main_Select:
3890 '選択肢3　=> 選択肢2
3900 case 3:
3910 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0
3920 if lang_flag = 1 then
3930 'lang_flag = 1:英語
3940 else
3950 'lang_flag = 0:日本語
3960 locate 0,12:beep:print "3.ヘルプを選択":goto Main_Select:
3970 endif
3980 '選択肢4 => 選択肢3
3990 case 0:
4000 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 1,12:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
4010 if lang_flag = 1 then
4020 'lang flag=1 英語
4030 else
4040 'lang flag=0 日本語
4050 locate 1,12:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
4060 endif
4070 end select
4080 endif
4090 'Input "番号:",No
4100 'エンターキー入力:決定
4110 if key$ = chr$(13) then
4120 select case No
4130 case 1:
4140 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4150 case 3:
4160 Color rgb(255,255,255):goto Help:
4170 case 0:
4180 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
4190 case 2:
4200 color rgb(255,255,255):goto Setting:
4210 'else
4220 'goto Main_Select:
4230 end select
4240 endif
4250 'ndif
4260 'if N0=0 or No>4 then goto TopScreen:
4270 '1-1.数霊チェック
4280 Surei_Check:
4290 cls 3:Font 48:
4300 'gload Gazo$ + "Screen4.png"
4310 gload Gazo$ + "Screen1_Sureicheck_Top20211226.png"
4320 play ""
4330 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
4340 color rgb(255,0,0)
4350 'print "●数霊(かずたま)チェックトップ" + chr$(13)
4360 sp_on 0,1:sp_put 0,(5,200),0,0:screen 1,1,1
4370 if lang_flag = 1 then
4380 'lang_flag=1 英語
4390 else
4400 'lang_flag=0 日本語
4410 print chr$(13)
4420 color rgb(255,255,255)
4430 print "番号を選んでください" + chr$(13)
4440 print " :1.数霊(かずたま)1人用" + chr$(13)
4450 print " :2.数霊(かずたま)2人用" + chr$(13)
4460 print " :3.トップ画面に行く" + chr$(13)
4470 print " :4.終 了" + chr$(13)
4480 color rgb(0,0,0):No = 1
4490 locate 0,12
4500 print " 1.数霊(かずたま)1人用を選択"
4510 endif
4520 Kazutama_main:
4530 'y:バーチャルパッドの処理
4540 'key$:カーソルの処理
4550 'bg:バーチャルパッドの右のボタン
4560 y = 0:key$ = "":bg=0
4570 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
4580 y = stick(1)
4590 key$ = inkey$
4600 bg=strig(1)
4610 y=stick(-1)
4620 pause 2
4630 wend
4640 'key$ = input$(1)
4650 if y = 1 then
4660 select case No
4670 'No の初期値：No=1
4680 case 1:
4690 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":
4700 'if lang_flag=1 then
4710 'else
4720 locate 0,12
4730 print" 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
4740 'endif
4750 'デバッグライン　ここから
4760 '0のとき
4770 'デバッグライン　ここまで
4780 'デバッグライン　ここから
4790 case 2:
4800 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                               "
4810 color rgb(0,0,0):locate 0,12:print " 3.トップ画面に行くを選択":No=3:goto Kazutama_main:
4820 'cls:color rgb(255,255,255):print"ok"
4830 'デバッグライン　ここまで
4840 case 3:
4850 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 0,12:print " 4.終 了を選択":No=0:goto Kazutama_main:
4860 'デバッグライン　ここから
4870 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
4880 'デバッグライン　ここまで
4890 case 0:
4900 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 0,12:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
4910 'デバッグライン　ここから
4920 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
4930 'デバッグライン　ここまで
4940 end select
4950 endif
4960 'バーチャルパッド　上 ここから
4970 if y = -1 then
4980 select case No
4990 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
5000 case 1:
5010 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 0,12:print" 4.終了を選択":goto Kazutama_main:
5020 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
5030 case 0:
5040 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 0,12:print" 3.トップ画面に行くを選択":goto Kazutama_main:
5050 'No:3 3.Help→2.設定 No:2
5060 case 3:
5070 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 0,12:print" 2.数霊（かずたま）2人用を選択":goto Kazutama_main:
5080 case 2:
5090 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 0,12:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5100 end select
5110 endif
5120 if bg=1 then
5130 select case No
5140 '1.数霊チェックを選択  パッドの右キー
5150 case 1:
5160 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
5170 '2.設定を選択    パッドの右キー
5180 case 2:
5190 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
5200 '3.ヘルプを選択 パッドの右
5210 case 3:
5220 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
5230 'プログラムの終了を選択
5240 case 0:
5250 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.05*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
5260 end select
5270 '4.終了するを選択  パッドの右
5280 endif
5290 'バーチャルパッド　上　ここまで
5300 if key$ = chr$(31) then
5310 select case No
5320 case 0:
5330 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                                          ":
5340 if lang_flag = 1 then
5350 Else
5360 No=2:locate 0,12:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
5370 endif
5380 case 1:
5390 No=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                                          ":
5400 if lang_flag = 1 then
5410 Else
5420 locate 0,12:print" 3.トップ画面に行くを選択":goto Kazutama_main:
5430 endif
5440 case 2:
5450 No=3:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print"                                       ":
5460 if lang_flag = 1 then
5470 Else
5480 locate 0,12:print" 4.終了を選択":goto Kazutama_main:
5490 endif
5500 case 3:
5510 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":
5520 if lang_flag = 1 then
5530 Else
5540 No=1:locate 0,12:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
5550 endif
5560 end select
5570 endif
5580 if key$=chr$(13) then
5590 select case No
5600 case 1:
5610 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
5620 case 2:
5630 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
5640 case 3:
5650 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
5660 case 0:
5670 cls 4:cls 3:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
5680 end select
5690 endif
5700 'Input "番号:",No
5710 '前の画面に戻る
5720 'if No = 3 then goto TopScreen:
5730 'プログラムの終了
5740 'if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":COLOR rgb(255,255,255):end
5750 '1人用
5760 'if No = 1 then goto Surei_Input:
5770 '2人用
5780 'if No = 2 then goto Surei_twoParson:
5790 'if No > 4 or No=0 then ui_msg"もう一度入れてください":goto Surei_Check:
5800 '数霊(かずたま) 文字入力  1人用
5810 Surei_Input:
5820 if mode = 0 then
5830 cls 3:font 32:init"kb:2"
5840 gload Gazo$ + "InputKotodama_20211226.png"
5850 play""
5860 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
5870 color rgb(255,0,0)
5880 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
5890 if lang_flag=1 then
5900 '英語
5910 else
5920 print chr$(13)
5930 color rgb(0,0,0)
5940 print "文字を入れてください" + chr$(13)
5950 color rgb(255,0,0)
5960 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
5970 print chr$(13)
5980 color rgb(0,0,0)
5990 Input "入力文字:",buffer_moji$
6000 if buffer_moji$ = "" then
6010 ui_msg "未入力です":goto Surei_Input:
6020 'endif
6030 else
6040 goto Surei_Result:
6050 endif
6060 endif
6070 endif
6080 'else
6090 if mode = 1 then
6100 cls 3:Font 32:
6110 gload Gazo$ + "InputKotodama.png"
6120 color rgb(255,0,0)
6130 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
6140 color rgb(255,255,255)
6150 print "文字を入れてください" + chr$(13)
6160 color rgb(255,0,0)
6170 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
6180 print "大文字のみ)" + chr$(13)
6190 color rgb(0,0,0)
6200 Input "文字入力:",buffer_moji2$
6210 goto Surei_Result3:
6220 'endif
6230 endif
6240 '数霊(かずたま)文字入力　2人用
6250 Surei_twoParson:
6260 cls 3:Font 32:init"kb:2"
6270 gload Gazo$ + "InputKotodama_20211226.png"
6280 '1人目入力
6290 if lang_flag = 1 then
6300 'color rgb(255,0,0)
6310 else
6320 print ""+chr$(13)
6330 'print "●数霊(かずたま) 1人目 入力" + chr$(13)
6340 color rgb(255,0,0)
6350 print "1人目の文字を入れてください" + chr$(13)
6360 color rgb(255,0,0)
6370 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
6380 color rgb(0,0,0)
6390 print chr$(13)
6400 Input "1人目文字入力:",buf_Parson1$
6410 endif
6420 Surei_twoParson2:
6430 cls 3:Font 32:init"kb:2"
6440 '2人目入力
6450 gload Gazo$ + "InputKotodama_20211226.png"
6460 'color rgb(255,0,0)
6470 'print "●数霊(かずたま) 2人目 入力" + chr$(13)
6480 if lang_falg = 1 then
6490 else
6500 print ""+chr$(13)
6510 print "2人目の文字を入れてください" + chr$(13)
6520 color rgb(255,0,0)
6530 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
6540 color rgb(0,0,0)
6550 Input "2人目の文字入力:",buf_Parson2$
6560 goto Surei_Result2:
6570 endif
6580 '数霊　計算 パート
6590 '文字の計算関数
6600 'moji$:1文字を入れる
6610 func Complate(moji$)
6620 for n = 1 to 116
6630 if moji$ = bufline$(2*n) then
6640 buffcount = val(bufline$(2 * n + 1))
6650 endif
6660 next n
6670 endfunc buffcount
6680 '数霊　結果表示
6690 Surei_Result:
6700 cls 3:Font 32
6710 'ゼロカウント:zcount
6720 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
6730 '例 アカい:"い"の文字は無効な文字なので、はじく
6740 zcount=0
6750 'mojicount:入力文字数
6760 mojicount = len(buffer_moji$)
6770 for n=1 to mojicount
6780 for j=1 to 118
6790 if (bufcount$(n - 1) = bufline$(2 * j)) then
6800   bufcount$(n-1) = Mid$(buffer_moji$,n,1)
6810 endif
6820 next j
6830 next n
6840 'if mojicount > zcount then
6850 'cls 3:ui_msg "無効な文字です":talk "無効な文字があります。":zcount = 0:goto Surei_Input:
6860 ncount=0:count=0
6870    for i = 1 to mojicount
6880     bufcount$(i-1)=Mid$(buffer_moji$,i,1)
6890   'ンのカウント
6900    if (bufcount$(i-1) = "ン") then ncount = ncount + 1
6910     'bufcount$(i-1)=Mid$(buffer_moji$,i,1)
6920    next i
6930    if (ncount > 0) then
6940    'Listを表示する
6950    moji_List$(0) = "この単語は目に見える物です"
6960    moji_List$(1) = "この単語は目に見えない物です"
6970    num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
6980    if (num2 = 0) then
6990      ' n1 = n1 + 0
7000    else
7010    if (num2 = 1) then
7020       n1 = 9 * ncount
7030       'buf_count = 9 * ncount
7040    endif
7050    endif
7060    endif
7070 'else
7080    for j=1 to mojicount
7090    bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7100    count = count + Complate(bufcount$(j - 1))
7110   ' count = count + n1:count2 = count
7120 'endif
7130    'count = count + buf_count:
7140    next j
7150    count = count + n1
7160 if (ncount > 0) then count = count
7170 '182以上のとき,181を引く
7180 if buf_cofig_r = 0 then
7190      if (count > 181) then
7200 'if buf_config_r = 0 then
7210         count = count - 181
7220 'else
7230 'if buf_config_r = 1 then
7240 '   count=Single_Complate(count2)
7250 'endif
7260      else
7270      if (buf_config_r = 1) then
7280        'count2 = count - 180
7290        buf_count = Single_Complate(count)
7300      endif
7310 endif
7320 endif
7330 'if config_r = 0 then
7340 cls 3:Font 48+16
7350 gload Gazo$ + "Result_Screen3_20211226.png"
7360 if buf_config_r = 1 then
7370    print "入力文字:" + buffer_moji$ + chr$(13)
7380    print "数霊(かずたま):";buf_count;chr$(13)
7390 endif
7400 if lang_flag = 1 then
7410 else
7420 color rgb(255,0,0)
7430 print "入力文字:" + buffer_moji$ + chr$(13)
7440 endif
7450 'print chr$(13)
7460 if lang_flag = 1 then
7470 else
7480 color rgb(0,0,255)
7490 print "数霊(かずたま):";count;chr$(13)
7500 endif
7510 if lang_flag = 1 then
7520 else
7530 color rgb(0,0,0)
7540 print "エンター or スペース" + chr$(13)
7550 print  chr$(13)
7560 'endif
7570 endif
7580 key$ = input$(1)
7590 if ((key$ = chr$(13)) or (key$=" ")) then
7600 List$(0)="1.もう一度数霊を見る"
7610 List$(1)="2.トップ画面に行く"
7620 List$(2)="3.この数霊の説明を見る"
7630 List$(3)="4.数霊データーを保存"
7640 num=ui_select("List$","番号を選んでください")
7650 select case num
7660   case 0:
7670          goto Surei_Input:
7680   case 1:
7690        n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
7700          for i=0 to 9
7710             bufcount$(i)=""
7720          next i
7730          goto TopScreen:
7740   case 2:
7750        goto Surei_Result4:
7760   case 3:
7770         s=Surei_Result_Save_File()
7780         ui_msg "保存しました"
7790   case -1:
7800        'goto Surei_Result:
7810   case else:
7820        goto Surei_Result:
7830 end select
7840 'endif
7850 'if key$ = " " then
7860 '２回めの入力に行く
7870 'mode = 1:goto Surei_Input:
7880 'else
7890 'if key$ = "s" or key$ = "S" then
7900 'ファイルを保存する
7910 's = Save()
7920 'ui_msg"保存しました"
7930 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
7940 else
7950 goto Surei_Result:
7960 'endif
7970 endif
7980 '3-1 バージョン情報
7990 Version:
8000 cls 3:Font 32
8010 gload Gazo$ + "Screen1_Version.png"
8020 play ""
8030 play Voice_File_TopScreen$ + "Voice_Version.mp3"
8040 color rgb(255,0,0)
8050 'print"●バージョン情報"+chr$(13)
8060 print chr$(13)
8070 color rgb(255,255,255)
8080 if lang_flag = 1 then
8090 else
8100 print "Ver:";Version$ + chr$(13)
8110 print "アプリ名:数霊"+ chr$(13)
8120 print "Basic for Android Runtime" + chr$(13)
8130 print "Author:licksjp" + chr$(13)
8140 print "制作開始:2021.7.28" + chr$(13)
8150 print chr$(13)
8160 print "(C)Copy right licksjp " + chr$(13)
8170 print "All rights reserved" + chr$(13)
8180 color rgb(0,0,0)
8190 print "パッドの右を押してください" + chr$(13)
8200 endif
8210 'key$ = input$(1)
8220 bg=0:key$=""
8230 while (bg <> 1 and key$ <> chr$(13))
8240 bg = strig(1)
8250 key$ = inkey$
8260 pause 2
8270 wend
8280 if key$ = chr$(13) then
8290 goto TopScreen:
8300 'else
8310 'talk "無効なキーです":goto Version:
8320 else
8330 if bg=1 then
8340 goto TopScreen:
8350 else
8360 if lang_flag = 1 then
8370 else
8380 talk "無効なキーです":goto Version:
8390 endif
8400 endif
8410 endif
8420 '3-2 参考文献
8430 Reference_Book:
8440 cls 3:Font 48-16:play""
8450 gload Gazo$ + "Screen1_Reference.png"
8460 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
8470 color rgb(255,0,0)
8480 'print"●参考文献" + chr$(13)
8490 print chr$(13)
8500 if lang_flag = 1 then
8510 else
8520 color rgb(255,255,255)
8530 print "書名:数霊" + chr$(13)
8540 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
8550 print "出版社:徳間書店" + chr$(13)
8560 print "ISBN:978-4-19-" + chr$(13)
8570 print "         865309-5" + chr$(13)
8580 print "定価:2300円 + 税" + chr$(13)
8590 print chr$(13);chr$(13);chr$(13)
8600 color rgb(0,0,0)
8610 print "パッドの右を押してください"
8620 endif
8630 bg = 0:key$ = ""
8640 while (bg <> 1 and key$ <> chr$(13))
8650 bg = strig(1)
8660 key$ = inkey$
8670 pause 2
8680 wend
8690 if key$ = chr$(13) then
8700 goto TopScreen:
8710 'else
8720 'talk "無効なキーです":goto Reference_Book:
8730 else
8740 if bg = 1 then
8750 goto TopScreen:
8760 else
8770 talk "無効なキーです":goto Reference_Book:
8780 endif
8790 endif
8800 'key$=input$(1)
8810 'if key$=chr$(13) then
8820 'goto TopScreen:
8830 'else
8840 'talk"無効なキーです":goto Reference_Book:
8850 'endif
8860 'ヘルプ画面　トップ画面
8870 Help:
8880 No=1:c=0
8890 play ""
8900 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
8910 cls 3:Font 48:
8920 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
8930 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0
8940 color rgb(255,0,0)
8950 'print "●3.ヘルプ　トップ画面" + chr$(13)
8960 print chr$(13)
8970 color rgb(255,255,255)
8980 print "番号を選んでください" + chr$(13)
8990 print " :1.バージョン" + chr$(13)
9000 print " :2.参考文献" + chr$(13)
9010 print " :3.トップ画面に行く" + chr$(13)
9020 print " :4.終 了" + chr$(13)
9030 color rgb(0,0,0)
9040 if No = 1 then print " 1.バージョンを選択"
9050 'y:バーチャルパッドの処理
9060 'key$:カーソルの処理
9070 'bg:バーチャルパッドの右ボタン
9080 Help_key:
9090 y = 0:key$ = "":bg=0
9100 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
9110 y = stick(1)
9120 key$ = inkey$
9130 bg=strig(1)
9140 pause 2
9150 wend
9160 'バーチャルパッド　ここから'
9170 if y = 1 then
9180 select case No
9190 'No の初期値：No=1
9200 case 1:
9210 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.参考文献を選択":goto Help_key:
9220 if lang_flag = 1 then
9230 else
9240 locate 1,12:print"2.参考文献を選択":goto Help_key:
9250 endif
9260 'デバッグライン　ここから
9270 '0のとき
9280 'デバッグライン　ここまで
9290 'デバッグライン　ここから
9300 case 2:
9310 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 1,12:print "                  "
9320 color rgb(0,0,0):locate 1,12:print "3.トップ画面に行くを選択":No=3:goto Help_key:
9330 'cls:color rgb(255,255,255):print"ok"
9340 'デバッグライン　ここまで
9350 case 3:
9360 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print "                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Help_key:
9370 'デバッグライン　ここから
9380 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
9390 'デバッグライン　ここまで
9400 case 0:
9410 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.バージョンを選択":goto Help_key:
9420 'デバッグライン　ここから
9430 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
9440 'デバッグライン　ここまで
9450 end select
9460 endif
9470 'バーチャルパッド　上 ここから
9480 if y = -1 then
9490 select case No
9500 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
9510 case 1:
9520 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Help_key:
9530 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
9540 case 0:
9550 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面に行くを選択":goto Help_key
9560 'No:3 3.Help→2.設定 No:2
9570 case 3:
9580 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.参考文献を選択":goto Help_key:
9590 case 2:
9600 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.バージョンを選択":goto Help_key:
9610 end select
9620 endif
9630 if bg = 1 then
9640 select case No
9650 '1.数霊チェックを選択  パッドの右キー
9660 case 1:
9670 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
9680 '2.設定を選択    パッドの右キー
9690 case 2:
9700 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
9710 '3.ヘルプを選択 パッドの右
9720 case 3:
9730 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
9740 'プログラムの終了を選択
9750 case 0:
9760 cls 3:cls 4:color rgb(255,255,255):play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
9770 'if lang_flag = 1 then
9780 'lang_flag = 1:英語
9790 'Else
9800 'lang_flag = 0:日本語
9810 'endif
9820 end select
9830 '4.終了するを選択  パッドの右
9840 endif
9850 'バーチャルパッド　上　ここまで
9860 'バーチャルパッド　ここまで'
9870 'key$ = input$(1)
9880 'カーソルの下
9890 if key$ = chr$(31) then
9900 select case (No Mod 4)
9910 'バージョンから参考文献
9920 case 0:
9930 c=1:No=c:locate 0,12:Print "             ":locate 0,12:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
9940 '参考文献からトップ画面
9950 case 1:
9960 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "            ":locate 0,12:print " 3.トップ画面に行くを選択":goto Help_key:
9970 'トップ画面から終了
9980 case 2:
9990 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 0,12:print " 4.終 了を選択":goto Help_key:
10000 '終了からバージョン
10010 case 3:
10020 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                     ":locate 0,12:print " 1.バージョンを選択":goto Help_key:
10030 case else:
10040 goto Help_key:
10050 end select
10060 endif
10070 'カーソル　上
10080 if key$ = chr$(30) then
10090 select case (c Mod 4)
10100 'バージョンから終了
10110 case 0:
10120 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:locate 0,12:print "                   ":locate 0,12:print " 4.終 了を選択":goto Help_key:
10130 '参考文献からバージョン
10140 case 1:
10150 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                   ":locate 0,12:print " 1.バージョンを選択":goto Help_key:
10160 'トップ画面から参考文献
10170 case 2:
10180 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":locate 0,12:print " 2.参考文献を選択":goto Help_key:
10190 '終了からトップ画面を選択
10200 case 3:
10210 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print"                      ":locate 0,12:print "3.トップ画面に行くを選択":goto Help_key:
10220 case else:
10230 goto Help_key:
10240 end select
10250 endif
10260 'Input "番号:",No
10270 'sp_def 0,(5,200),32,32
10280 'エンターキー：決定
10290 if key$=chr$(13) then
10300 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10310 if No=3 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10320 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10330 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg "プログラムを終了します":cls 3:cls 4:end
10340 else
10350 goto Help_key:
10360 endif
10370 'if (No = 0 or No > 4) then ui_msg "もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
10380 '登録文字の確認
10390 '文字を1文字入れて登録されているか調べるメニュー
10400 '設定項目
10410 Setting:
10420 cls 3:Font 48
10430 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
10440 play ""
10450 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
10460 No=1
10470 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
10480 color rgb(0,0,255)
10490 'print "●設定項目" + chr$(13)
10500 print chr$(13)
10510 if lang_flag = 1 then
10520 'lang_flag = 1:英語
10530 else
10540 'lang_flag = 0:日本語
10550 color rgb(255,255,255)
10560 print "番号を選んでください" + chr$(13)
10570 '-------コメント----------------
10580 'print " :1.登録文字の確認" + chr$(13)
10590 'print " :2.数霊文字確認" + chr$(13)
10600 '-------コメント----------------
10610 print " :1.文字の項目" + chr$(13)
10620 print " :2.結果表示設定" + chr$(13)
10630 print " :3.トップ画面に行く" + chr$(13)
10640 print " :4.終 了" + chr$(13)
10650 endif
10660 color rgb(0,0,0)
10670 locate 0,12
10680 if No=1 then print " 1.文字の項目を選択"
10690 'y:バーチャルパッドの処理
10700 'key$:カーソルの処理
10710 'bg:バーチャルパッドの右ボタン
10720 SettingScreen:
10730 y = 0:key$ = "":bg=0
10740 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
10750 y = stick(1)
10760 key$ = inkey$
10770 bg=strig(1)
10780 pause 2
10790 wend
10800 'バーチャルパッド　ここから'
10810 'バーチャルパッド　ここから'
10820 if y = 1 then
10830 select case No
10840 'No の初期値：No=1
10850 case 1:
10860 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":color rgb(0,0,0):locate 1,12:print "2.結果表示設定を選択":goto SettingScreen:
10870 'デバッグライン　ここから
10880 '0のとき
10890 'デバッグライン　ここまで
10900 'デバッグライン　ここから
10910 case 2:
10920 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                         "
10930 color rgb(0,0,0)::No=3
10940 if lang_flag = 1 then
10950 else
10960 locate 1,12:print "3.トップ画面に行くを選択":goto SettingScreen:
10970 endif
10980 'cls:color rgb(255,255,255):print"ok"
10990 'デバッグライン　ここまで
11000 case 3:
11010 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                              ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
11020 'デバッグライン　ここから
11030 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11040 'デバッグライン　ここまで
11050 case 0:
11060 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.文字の項目を選択":goto SettingScreen:
11070 'デバッグライン　ここから
11080 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11090 'デバッグライン　ここまで
11100 end select
11110 endif
11120 'バーチャルパッド　上 ここから
11130 if y = -1 then
11140 select case No
11150 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11160 case 1:
11170 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択":goto SettingScreen:
11180 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11190 case 0:
11200 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
11210 'No:3 3.Help→2.設定 No:2
11220 case 3:
11230 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.結果表示設定を選択":goto SettingScreen:
11240 case 2:
11250 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.文字の項目を選択":goto SettingScreen:
11260 end select
11270 endif
11280 if bg=1 then
11290 select case No
11300 '1.数霊チェックを選択  パッドの右キー
11310 case 1:
11320 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
11330 '2.設定を選択    パッドの右キー
11340 case 2:
11350 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
11360 '3.ヘルプを選択 パッドの右
11370 case 3:
11380 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
11390 'プログラムの終了を選択
11400 case 0:
11410 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":ui_msg "プログラムを終了します":color rgb(255,255,255):pause 2.052*1000:end
11420 'if lang_flag = 1 then
11430 'Else
11440 'ui_msg "プログラムを終了します"
11450 'endif
11460 end select
11470 endif
11480 '4.終了するを選択  パッドの右
11490 'バーチャルパッド　ここまで'
11500 'SettingScreen:
11510 'key$ = input$(1)
11520 'カーソル下'
11530 if key$ = chr$(31) then
11540 select case (No Mod 4)
11550 '登録文字から数霊文字の確認
11560 case 1:
11570 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.結果表示設定を選択":goto SettingScreen:
11580 '数霊文字の確認からトップ画面に行く
11590 case 2:
11600 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
11610 'トップ画面に行くから終了
11620 case 3:
11630 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
11640 '終了から登録文字
11650 case 0:
11660 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.文字の項目を選択":goto SettingScreen:
11670 end select
11680 endif
11690 'カーソル　上
11700 if key$ = chr$(30) then
11710 select case (No Mod 4)
11720 case 1:
11730 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
11740 case 2:
11750 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
11760 case 3:
11770 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
11780 case 0:
11790 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
11800 end select
11810 endif
11820 'エンターキーを押したとき
11830 if key$ = chr$(13) then
11840 if No=3 then goto TopScreen:
11850 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
11860 'if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji1:
11870 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
11880 if No=0 then color rgb(255,255,255):play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":cls 3:cls 4:color rgb(255,255,255):end
11890 'lse
11900 'o'o SettingScreen:
11910 endif
11920 'endif
11930 'endif
11940 '文字検索項目  ここから
11950 Moji_Search:
11960 cls 4:cls 3:Font 32+16:init"kb:2"
11970 gload Gazo$ + "Moji_Search_Result.png"
11980 play ""
11990 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
12000 print "" + chr$(13)
12010 color rgb(255,0,0)
12020 if lang_flag = 1 then
12030 Else
12040 print "文字を一文字入れてください" + chr$(13)
12050 endif
12060 color rgb(0,0,0)
12070 if lang_flag=1 then
12080 Else
12090 Input "登録文字:",moji$
12100 endif
12110 moji_count = len(moji$)
12120 if moji_count > 1 then
12130 if lang_flag = 1 then
12140 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
12150 Else
12160 endif
12170 else
12180 count=0
12190 for n = 0 to 116
12200 if bufline$(2*n) = moji$ then
12210 cls 3:font 48:init"kb:4"
12220 gload Gazo$ + "Moji_Search_Result.png"
12230 'talk"この文字は登録されています"
12240 play ""
12250 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12260 if lang_flag = 1 then
12270 Else
12280 print chr$(13)
12290 color rgb(255,0,0)
12300 print moji$;"は、登録されています。" + chr$(13)
12310 color rgb(0,0,0)
12320 print "ジョイパッドの右を押してください"
12330 endif
12340 bg = 0:key$ = ""
12350 while (bg <> 1 and key$ <> chr$(13))
12360 key$ = inkey$
12370 bg = strig(1)
12380 pause 2
12390 wend
12400 'y$=input$(1)
12410 if key$ = chr$(13) then goto TopScreen:
12420 if bg=1 then goto TopScreen:
12430 count = count + 1
12440 endif
12450 next n
12460 if count = 0 then
12470 cls 3:font 48:init "kb:2"
12480 gload Gazo$ + "Moji_check.png"
12490 play ""
12500 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
12510 print chr$(13)
12520 if lang_flag = 1 then
12530 Else
12540 color rgb(255,0,0)
12550 print moji$;"は、登録されていません。" + chr$(13)
12560 color rgb(0,0,0)
12570 print "パッドの右を押してください" + chr$(13)
12580 endif
12590 kg = 0:key$ = ""
12600 while (kg <> 1 and key$ <> chr$(13))
12610 key$ = inkey$
12620 kg = strig(1)
12630 pause 2
12640 wend
12650 if key$ = chr$(13) then goto TopScreen:
12660 endif
12670 endif
12680 Surei_Result2:
12690 cls 3:Font 48
12700 zcount1=0:zcount2=0:count1=0:count2=0
12710 '1人目
12720 mojicount1=len(buf_Parson1$)
12730 '2人目
12740 mojicount2 = len(buf_Parson2$)
12750 '1人目
12760 for n = 1 to mojicount1
12770 for j = 1 to 116
12780 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
12790 if bufcount1$(n-1) = bufline$(2*j) then
12800 zcount1 = zcount1 + 1
12810 endif
12820 next j
12830 next n
12840 '2人目
12850 for n = 1 to mojicount2
12860 for j = 1 to 116
12870 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
12880 if bufcount2$(n-1) = bufline$(2*j) then
12890 zount2 = zcount2 + 1
12900 endif
12910 next j
12920 next n
12930 '1人目
12940 for i=1 to mojicount1
12950 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
12960 p1 = Complate(bufcount1$(i-1))
12970 count1 = count1 + p1
12980 next i
12990 '2人目
13000 for i = 1 to mojicount2
13010 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
13020 p2 = Complate(bufcount2$(i-1))
13030 count2 = count2 + p2
13040 next i
13050 cls 3:
13060 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
13070 color rgb(255,0,0)
13080 'print "数霊 2人用 結果表示"+chr$(13)
13090 print ""+chr$(13)
13100 if lang_flag = 1 then
13110 else
13120 color rgb(255,255,255)
13130 print "1人目:";buf_Parson1$;chr$(13)
13140 print "数霊1:";count1;chr$(13)
13150 print "2人目:";buf_Parson2$;chr$(13)
13160 print "数霊2:";count2;chr$(13)
13170 print "数霊(合計):";count1 + count2;chr$(13)
13180 color rgb(0,0,0)
13190 print "エンターキーを押してください" + chr$(13)
13200 endif
13210 key$ = "":bg = 0
13220 'ey$=input$(1)
13230 while (bg <> 1 and key$ <> chr$(13))
13240 bg = strig(1)
13250 key$ = inkey$
13260 pause 2
13270 wend
13280 if (bg = 1 or key$ = chr$(13))  then goto TopScreen:
13290 Surei_Result3:
13300 cls 3:Font 48
13310 zcount2 = 0:count2 = 0
13320 mojicount2 = len(buffer_moji2$)
13330 for n = 1 to mojicount2
13340 for j = 1 to 116
13350 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
13360 if bufcount2$(n - 1) = bufline$(2 * j) then
13370 zcount2 = zcount2 + 1
13380 endif
13390 next j
13400 next n
13410 for i = 1 to mojicount2
13420 n2 = Complate(bufcount2$(i-1))
13430 count2 = count2 + n2
13440 next i
13450 gload Gazo$ + "Screen5.png"
13460 if lang_flag = 1 then
13470 else
13480 color rgb(255,0,0)
13490 print "数霊の結果表示" + chr$(13)
13500 color rgb(255,255,255)
13510 print "１回目回の文字入力:";buffer_moji$;chr$(13)
13520 print "１回目の数霊(かずたま)";count;chr$(13)
13530 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
13540 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
13550 color rgb(0,0,0)
13560 print "エンターキー:トップ画面";chr$(13)
13570 print "c or C キー:数霊の比較";chr$(13)
13580 endif
13590 key$ = "":bg = 0
13600 while (key$ <> chr$(13) and bg <> 1)
13610 bg = strig(1)
13620 key$ = inkey$
13630 pause 2
13640 wend
13650 'key$ = input$(1)
13660 if bg = 1 then goto TopScreen:
13670 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
13680 if key$ = "c" or key$ = "C" then
13690 if count = count2 then
13700 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
13710 else
13720 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
13730 endif
13740 endif
13750 Moji_Count_Check:
13760 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
13770 cls 3:Font 48
13780 gload Gazo$ + "Moji_check.png"
13790 n = 0
13800 open FILE_csv$ for input as #1
13810 while eof(1) = 0
13820 line input #1, line$
13830 n = n + 1
13840 wend
13850 close #1
13860 'n = n - 1
13870 'talk "登録文字数は"+str$(n)+"文字です"
13880 play ""
13890 if n = 118 then
13900 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
13910 if lang_flag = 1 then
13920 else
13930 'talk "登録文字数は、" + str$(n) + "文字です"
13940 print "" + chr$(13)
13950 color rgb(255,0,0)
13960 print "文字の登録文字数は";n;"文字" + chr$(13)
13970 color rgb(0,0,0)
13980 print "パッドの右を押してください" + chr$(13)
13990 endif
14000 endif
14010 'key$ = input$(1)
14020 key$ = "":bg = 0
14030 while (key$ <> chr$(13) and bg <> 1)
14040 key$=inkey$
14050 bg=strig(1)
14060 pause 2
14070 wend
14080 if bg = 1 then goto TopScreen:
14090 if key$ = chr$(13) then
14100 goto TopScreen:
14110 else
14120 goto Moji_Count_Check:
14130 endif
14140 'Save 関数
14150 file_kazutama = 0
14160 file_kazutama = Save_File()
14170 func Save_File()
14180 open SAVE_DATA1$  for output as #1
14190 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
14200 close #1
14210 endfunc
14220 Select_moji:
14230 cls 3:font 48:No = 1
14240 gload Gazo$ + "Screen1_mojicheck.png"
14250 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
14260 color rgb(255,0,0)
14270 'print "文字の確認" + chr$(13)
14280 if lang_flag = 1 then
14290 else
14300 print chr$(13)
14310 color rgb(255,255,255)
14320 print "番号を選んでください" + chr$(13)
14330 print " :1.登録文字検索"+ chr$(13)
14340 print " :2.登録文字数の確認" + chr$(13)
14350 print " :3.トップ画面に戻る" + chr$(13)
14360 print " :4.終　了" + chr$(13)
14370 color rgb(0,0,0)
14380 if No = 1 then print " 1.登録文字検索を選択"
14390 endif
14400 Entry_check_key:
14410 y = 0:key$ = "":bg=0
14420 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
14430 y = stick(1)
14440 key$ = inkey$
14450 bg=strig(1)
14460 pause 2
14470 wend
14480 'バーチャルパッド　ここから'
14490 'バーチャルパッド　ここから'
14500 if y = 1 then
14510 select case No
14520 'No の初期値：No=1
14530 case 1:
14540 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
14550 'デバッグライン　ここから
14560 '0のとき
14570 'デバッグライン　ここまで
14580 'デバッグライン　ここから
14590 case 2:
14600 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                       "
14610 :No=3
14620 'if lang_flag = 1 then
14630 'Else
14640 color rgb(0,0,0):locate 0,12:print " 3.トップ画面に戻るを選択":goto Entry_check_key:
14650 'endif
14660 'cls:color rgb(255,255,255):print"ok"
14670 'デバッグライン　ここまで
14680 case 3:
14690 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 0,12:print " 4.終 了を選択":No=0:goto Entry_check_key:
14700 'デバッグライン　ここから
14710 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
14720 'デバッグライン　ここまで
14730 case 0:
14740 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 0,12:print " 1.登録文字数の確認を選択":goto Entry_check_key:
14750 'デバッグライン　ここから
14760 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
14770 'デバッグライン　ここまで
14780 end select
14790 endif
14800 'バーチャルパッド　上 ここから
14810 if y = -1 then
14820 select case No
14830 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
14840 case 1:
14850 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 0,12:print" 4.終了を選択"::goto Entry_check_key:
14860 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
14870 case 0:
14880 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                      ":locate 1,12:print"3.トップ画面に戻るを選択":goto Entry_check_key:
14890 'No:3 3.Help→2.設定 No:2
14900 case 3:
14910 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
14920 case 2:
14930 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_check_key:
14940 end select
14950 endif
14960 if bg=1 then
14970 select case No
14980 '1.数霊チェックを選択  パッドの右キー
14990 case 1:
15000 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15010 '2.設定を選択    パッドの右キー
15020 case 2:
15030 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15040 '3.ヘルプを選択 パッドの右
15050 case 3:
15060 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
15070 'プログラムの終了を選択
15080 case 0:
15090 cls 3:cls 4::play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":ui_msg "プログラムを終了します":color rgb(255,255,255):pause 2.052 * 1000:end
15100 'if lang_flag = 1 then
15110 'else
15120 'endif
15130 end select
15140 endif
15150 '4.終了するを選択  パッドの右
15160 'バーチャルパッド　ここまで'
15170 'key$ = input$(1)
15180 'カーソルの下
15190 if key$ = chr$(31) then
15200 select case (No Mod 4)
15210 case 0:
15220 c=1:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
15230 case 1:
15240 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:sp_on 3,0:goto Entry_check_key:
15250 case 2:
15260 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:goto Entry_check_key:
15270 case 3:
15280 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
15290 end select
15300 endif
15310 'カーソル　上
15320 if key$ = chr$(30) then
15330 select case (No Mod 4)
15340 case 0:
15350 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
15360 case 1:
15370 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
15380 case 2:
15390 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
15400 case 3:
15410 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
15420 end select
15430 endif
15440 'エンターキーを押す
15450 if key$ = chr$(13) then
15460 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15470 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15480 if No = 3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15490 if No = 0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
15500 endif
15510 '
15520 Kakunin_Surei_count:
15530 cls 3:font 48:No=1
15540 gload Gazo$ + "Kazutama_List_Top.png"
15550 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
15560 color rgb(255,0,0)
15570 print chr$(13)
15580 color rgb(255,255,255)
15590 'if lang_flag = 1 then
15600 'else
15610 print "番号を選んでください" + chr$(13)
15620 print " :1.数霊リスト 1人用" + chr$(13)
15630 print " :2.結果表示設定" + chr$(13)
15640 print " :3.トップ画面に行く" + chr$(13)
15650 print " :4.終 了" + chr$(13)
15660 print "" + chr$(13)
15670 'endif
15680 color rgb(0,0,0)
15690 locate 0,12:print"                                                         "
15700 if No = 1 then locate 1,12:print "1.数霊リスト　1人用を選択"
15710 Entry_List:
15720 y = 0:key$ = "":bg=0
15730 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
15740 y = stick(1)
15750 key$ = inkey$
15760 bg = strig(1)
15770 pause 2
15780 wend
15790 'バーチャルパッド　ここから'
15800 'バーチャルパッド　ここから'
15810 'バーチャルパッド　下
15820 if y = 1 then
15830 select case No
15840 'No の初期値：No=1
15850 case 1:
15860 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.結果表示設定を選択":goto Entry_List:
15870 'デバッグライン　ここから
15880 '0のとき
15890 'デバッグライン　ここまで
15900 'デバッグライン　ここから
15910 case 3:
15920 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:No=0:pause 200:locate 0,12:print "                                       "
15930 color rgb(0,0,0):locate 0,12:print " 4.終了を選択":goto Entry_List:
15940 'cls:color rgb(255,255,255):print"ok"
15950 'デバッグライン　ここまで
15960 case 0:
15970 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,200),0,0:pause 200:locate 0,12:print"                                       ":locate 0,12:print " 1.数霊リスト 1人用を選択":No=1:goto Entry_List:
15980 case 2:
15990 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                      ":No=3:locate 1,12:print "3．トップ画面に行くを選択":goto Entry_List:
16000 'sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print "                                      "
16010 'case 1:
16020 'デバッグライン　ここから
16030 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
16040 'デバッグライン　ここまで
16050 'case 0:
16060 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_List:
16070 'デバッグライン　ここから
16080 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
16090 'デバッグライン　ここまで
16100 end select
16110 endif
16120 'バーチャルパッド　上 ここから
16130 if y = -1 then
16140 select case No
16150 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
16160 case 3:
16170 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,300),0,0:pause 200:No=2:locate 0,12:print "                                      ":locate 0,12:print " 2.結果表示設定を選択":goto Entry_List:
16180 case 1:
16190 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 0,12:print " 4.終了を選択":goto Entry_List:
16200 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
16210 case 0:
16220 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,400),0,0:pause 200:No=3:locate 0,12:print "                                      ":locate 1,12:print"3.トップ画面に行くを選択":goto Entry_List:
16230 'No:3 3.Help→2.設定 No:2
16240 case 2:
16250 sp_on 1,1:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 1,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.数霊リスト 1人用を選択":goto Entry_List:
16260 'case 2:
16270 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_List:
16280 end select
16290 endif
16300 if bg = 1 then
16310 select case No
16320 '1.数霊リスト 一人用を選択を選択  パッドの右キー
16330 case 1:
16340 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16350 '2.設定を選択  パッドの右キー
16360 case 2:
16370 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16380 case 3:
16390  sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16400 '4.終了を選択 パッドの右
16410 case 0:
16420 cls 3:cls 4:color rgb(255,255,255):
16430 play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:
16440 'Else
16450 ui_msg "プログラムを終了します":end
16460 'endif
16470 'プログラムの終了を選択
16480 end select
16490 endif
16500 if key$=chr$(13) then
16510 select case No
16520 case 0:
16530       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":end
16540 case 1:
16550       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16560 case 2:
16570       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16580 case 3:
16590       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16600 end select
16610 endif
16620 '4.終了するを選択  パッドの右
16630 'バーチャルパッド　ここまで'
16640 'Input "番号:",No
16650 'if No=2 then goto TopScreen:
16660 'if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
16670 'if No=1 then goto Surei_List1:
16680 'if No > 3 or No=0 then ui_msg"無効な数字です、入れ直してください":talk"無効な数字です":goto Kakunin_Surei_count:
16690 'if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
16700 Surei_List1:
16710 cls 3:font 48
16720 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
16730 file$ = dir$(SAVE_DATA1$,0)
16740 'ファイルが無いときの画面
16750 if file$ = ""  then
16760 gload "./data/Gazo/" + "KazutamaList1.png",0
16770 print chr$(13)
16780 color rgb(255,0,0):print "登録ファイルはございません" + chr$(13)
16790 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
16800 'else
16810 'endif
16820 bg = 0:key$ = ""
16830 while (key$ <> chr$(13) and bg<>1)
16840 key$ = inkey$
16850 bg = strig(1)
16860 pause 2
16870 wend
16880 'エンターキーもしくはバーチャルパッドの右でトップに行く
16890 if (bg = 1  or key$ = chr$(13)) then goto TopScreen:
16900 else
16910 cls 3:buffer_list_count = Loadcount()
16920 color rgb(255,255,255)
16930 if lang_flag = 1 then
16940 Else
16950 talk "登録件数は" + str$(buffer_list_count) + "件です"
16960 gload Gazo$ + "KazutamaList1_Entry.png",0
16970 color rgb(0,0,255)
16980 print chr$(13)
16990 color rgb(255,0,0)
17000 print "登録件数:";buffer_list_count;"件";chr$(13)
17010 color rgb(0,0,0)
17020 print "パッドの右を押してください" + chr$(13)
17030 endif
17040 bg = 0:key$ = "":bg2 = 0
17050 while (key$ <> chr$(13) and bg <> 1)
17060 key$ = inkey$
17070 bg = strig(1)
17080 bg2=strig(0)
17090 pause 2
17100 wend
17110 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
17120 if (key$ = chr$(13) or bg = 1) then pause 2:goto KotodamaList_page:
17130 endif
17140 if (bg2 = 1) then pause 2:goto TopScreen:
17150 func Loadcount()
17160 n = 0
17170 'while eof(1)=-1
17180 open SAVE_DATA1$  for input as #1
17190 while eof(1) <> -1
17200 line input #1,line$
17210 n = n + 1
17220 wend
17230 close #1
17240 count = n
17250 endfunc count
17260 count_line = Loadcount()
17270 func Kotodama$(buf$)
17280 color rgb(255,255,255)
17290 b = len("数霊:")
17300 a$ = Mid$(buf$,b+1,len(buf$))
17310 for i=0 to 118
17320 color rgb(255,255,255)
17330 if bufline3$(2 * i) ="数霊:" + a$  then
17340 moji_$ = bufline3$(2*i + 1)
17350 'moji_$ = bufline3$(21)
17360 'moji$ = a$
17370 endif
17380 next i
17390 'kotodama$ = a$
17400 kotodama$ = moji_$
17410 endfunc kotodama$
17420 KotodamaList_page:
17430 cls 3:font 48:m = 0:
17440 gload Gazo$ + "Screen5_Surei_List.png"
17450 if SAVE_DATA1$ = "" then
17460 cls 3:print"ファイルがありません"
17470 else
17480 a = Loadcount()
17490 open SAVE_DATA1$  for input as #1
17500 for i=0 to a-1
17510 for n=0 to 1
17520 input #1,line$
17530 bufKaztama$(i,n) = line$
17540 next n
17550 next i
17560 close #1
17570 'endif
17580 l = 0:n=0
17590 gload Gazo$ + "Screen5_Surei_List.png"
17600 while (buffer_list_count >= l)
17610 'while (l<=a)
17620 cls
17630 color rgb(255,0,0)
17640 'print "数霊　リスト" + chr$(13)
17650 print chr$(13)
17660 color rgb(255,255,255)
17670 n=n+1
17680 'while (n <= a)
17690 print "番号:";l+1;chr$(13)
17700 print bufKaztama$(l,0) + chr$(13)
17710 print bufKaztama$(l,1) + chr$(13)
17720 'n=n+1
17730 Kmoji$ = moji$
17740 print chr$(13) + chr$(13)
17750 color rgb(0,0,0)
17760 print " :パッドの左:トップ画面" + chr$(13)
17770 print " :パッドの右:次へ行く" + chr$(13)
17780 'wend
17790 key$ = "":bg = 0:bg2 = 0
17800 while (key$ <> chr$(13) and bg <> 1 and bg2 <> 1)
17810 key$ = inkey$
17820 bg = strig(1)
17830 bg2 = strig(0)
17840 pause 2
17850 wend
17860 'key$ = input$(1)
17870 if (key$ = " " OR bg = 1) then
17880 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
17890 else
17900 if ((bg2 = 1) or (key$=chr$(13))) then
17910    goto TopScreen:
17920 endif
17930 else
17940 goto KotodamaList_page:
17950 endif
17960 wend
17970 'wend
17980 endif
17990 '結果表示２ Menu1
18000 Surei_Result4:
18010 cls 3:font 32:init"kb:4"
18020 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
18030 for i=0 to 181 + 3 - 1
18040 if i = count  then
18050 buffer$ = bufline2$(count + 4,0)
18060 endif
18070 next i
18080 if len(buffer$) > 23 and len(buffer$) <= 45 then
18090 buffer2$ = Mid$(buffer$,1,24)
18100 buffer3$ = Mid$(buffer$,25,(len(buffer$) - 25))
18110 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)
18120 else
18130 if len(buffer$) <= 23 then
18140 buffer2$ = Mid$(buffer$,1,22)
18150 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
18160 else
18170 if len(buffer$) > 45 and len(buffer$) <= 64 then
18180 buffer2$ = Mid$(buffer$,1,22)
18190 buffer3$ = Mid$(buffer$,23,20)
18200 buffer4$ = Mid$(buffer$,43,(len(buffer$)-43))
18210 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)+chr$(13)
18220 else
18230 if len(buffer$) > 64 and len(buffer$) <= 81 then
18240 buffer2$ = Mid$(buffer$,1,23)
18250 buffer3$ = Mid$(buffer$,24,20)
18260 buffer4$ = Mid$(buffer$,42,20)
18270 buffer5$ = Mid$(buffer$,63,(len(buffer$)-62))
18280 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13) + chr$(13) + chr$(13)
18290 if len(buffer$) > 81 and len(buffer$) <= 110 then
18300 buffer2$ = Mid$(buffer$,1,21)
18310 buffer3$ = Mid$(buffer$,22,20)
18320 buffer4$ = Mid$(buffer$,42,20)
18330 buffer5$ = Mid$(buffer$,62,20)
18340 buffer6$ = Mid$(buffer$,82,(len(buffer$) - 82))
18350 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13) + chr$(13) + chr$(13)
18360 endif
18370 endif
18380 endif
18390 endif
18400 endif
18410 Surei_Result4_2:
18420 gload Gazo$ + "Screen1_Result2.png"
18430 Result_Menu_List$(0)="1.トップ画面に行く"
18440 Result_Menu_List$(1)="2.数霊のデーターを保存"
18450 Result_Menu_List$(2)="3.もう一度、数霊を調べる"
18460 cls
18470 color rgb(255,0,0)
18480 'print "診断結果 2" + chr$(13)
18490 print chr$(13)
18500 if lang_flag = 1 then
18510 else
18520 color rgb(127,255,212)
18530 print "入力文字:";buffer_moji$;chr$(13)
18540 print "数霊:";count;chr$(13)
18550 color rgb(255,255,255)
18560 print "数霊の説明:"+chr$(13)
18570 print buffer$
18580 color rgb(0,0,0)
18590 print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
18600 endif
18610 key$ = "":bg = 0:bg2 = 0
18620 while (bg<>1 and bg2<>1)
18630 key$ = inkey$
18640 bg = strig(1)
18650 bg2 = strig(0)
18660 pause 2
18670 wend
18680 if ((bg = 1) or (bg2 = 1)) then
18690 num = ui_select("Result_Menu_List$","番号を選んでください")
18700 endif
18710 if num = 0 then goto TopScreen:
18720 if num = 1 then goto File_save:
18730 if num = 2 then goto Surei_Input:
18740 if num = -1 then goto Surei_Result4
18750 ' if bg=1 then buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
18760 'if key$ = chr$(13) then
18770 'buffer$ = "":buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
18780 'endif
18790 'if bg2=1 then
18800 File_save:
18810 'ファイルがない時
18820 if dir$(SAVE_DATA1$) = " " then
18830 open SAVE_DATA1$ for output as #1
18840 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18850 close #1
18860 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
18870 'ファイルが有る時
18880 else
18890 open SAVE_DATA1$ for append as #1
18900 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18910 close #1
18920 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
18930 endif
18940 'endif
18950 'if key$="s" or key$="S" then
18960 'if dir$(SAVE_DATA1$) = "" then
18970 'open SAVE_DATA1$ for output as #1
18980 'print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18990 'close #1
19000 'ui_msg"保存しました":talk"保存しました":goto Surei_Result4_2:
19010 'else
19020 'open SAVE_DATA1$ for append as #1
19030 'print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19040 'close #1
19050 'ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19060 'endif
19070 'else
19080 'talk "無効な文字です":goto Surei_Result4_2:
19090 'endif
19100 'endif
19110 func All_clear()
19120 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
19130 endfunc
19140 'ここから
19150 Config_moji1:
19160 cls 3:Font 48
19170 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19180 play ""
19190 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
19200 No=1
19210 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19220 color rgb(0,0,255)
19230 'print "●設定項目" + chr$(13)
19240 print chr$(13)
19250 if lang_flag = 1 then
19260 'lang_flag = 1:英語
19270 else
19280 'lang_flag = 0:日本語
19290 color rgb(255,255,255)
19300 print "番号を選んでください" + chr$(13)
19310 'print " :1.文字の項目" + chr$(13)
19320 'print " :2.結果表示設定" + chr$(13)
19330 print " :1.文字の項目" + chr$(13)
19340 print " :2.結果表示設定" + chr$(13)
19350 print " :3.トップ画面に行く" + chr$(13)
19360 print " :4.終 了" + chr$(13)
19370 endif
19380 color rgb(0,0,0)
19390 locate 1,12
19400 if No = 1 then print "1.文字の項目"
19410 'y:バーチャルパッドの処理
19420 'key$:カーソルの処理
19430 'bg:バーチャルパッドの右ボタン
19440 Config_moji1_Screen:
19450 y = 0:key$ = "":bg=0
19460 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
19470 y = stick(1)
19480 key$ = inkey$
19490 bg=strig(1)
19500 pause 2
19510 wend
19520 'バーチャルパッド　ここから'
19530 'バーチャルパッド　ここから'
19540 if y = 1 then
19550 select case No
19560 'No の初期値：No=1
19570 case 1:
19580 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
19590 'デバッグライン　ここから
19600 '0のとき
19610 'デバッグライン　ここまで
19620 'デバッグライン　ここから
19630 case 2:
19640 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
19650 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
19660 'if lang_flag = 1 then
19670 'else
19680 locate 1,12:print "3.トップ画面に行くを選択"
19690 'endif
19700 'cls:color rgb(255,255,255):print"ok"
19710 'デバッグライン　ここまで
19720 case 3:
19730 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
19740 'デバッグライン　ここから
19750 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
19760 'デバッグライン　ここまで
19770 case 0:
19780 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
19790 'デバッグライン　ここから
19800 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
19810 'デバッグライン　ここまで
19820 end select
19830 endif
19840 'バーチャルパッド　上 ここから
19850 if y = -1 then
19860 select case No
19870 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
19880 case 1:
19890 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
19900 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
19910 case 0:
19920 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
19930 'No:3 3.Help→2.設定 No:2
19940 case 3:
19950 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
19960 case 2:
19970 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
19980 end select
19990 endif
20000 if bg=1 then
20010 select case No
20020 '1.数霊チェックを選択  パッドの右キー
20030 case 1:
20040 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
20050 '2.設定を選択    パッドの右キー
20060 case 2:
20070 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
20080 '3.ヘルプを選択 パッドの右
20090 case 3:
20100 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
20110 'プログラムの終了を選択
20120 case 0:
20130 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
20140 'if lang_flag = 1 then
20150 'Else
20160 ui_msg "プログラムを終了します":end
20170 'endif
20180 end select
20190 endif
20200 '4.終了するを選択  パッドの右
20210 'バーチャルパッド　ここまで'
20220 'SettingScreen:
20230 'key$ = input$(1)
20240 'カーソル下'
20250 if key$ = chr$(31) then
20260 select case (No Mod 4)
20270 '登録文字から数霊文字の確認
20280 case 1:
20290 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
20300 '数霊文字の確認からトップ画面に行く
20310 case 2:
20320 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
20330 'トップ画面に行くから終了
20340 case 3:
20350 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
20360 '終了から登録文字
20370 case 0:
20380 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20390 end select
20400 endif
20410 'カーソル　上
20420 if key$ = chr$(30) then
20430 select case (No Mod 4)
20440 case 1:
20450 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
20460 case 2:
20470 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
20480 case 3:
20490 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
20500 case 0:
20510 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
20520 end select
20530 endif
20540 'エンターキーを押したとき
20550 if key$ = chr$(13) then
20560 if No=3 then goto TopScreen:
20570 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
20580 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
20590 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
20600 'lse
20610 'o'o SettingScreen:
20620 endif
20630 'ここまで
20640 Config_moji2:
20650 cls 3:Font 48
20660 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
20670 play ""
20680 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
20690 No=1
20700 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
20710 color rgb(0,0,255)
20720 'print "●設定項目" + chr$(13)
20730 print chr$(13)
20740 if lang_flag = 1 then
20750 'lang_flag = 1:英語
20760 else
20770 'lang_flag = 0:日本語
20780 color rgb(255,255,255)
20790 print "番号を選んでください" + chr$(13)
20800 'print " :1.文字の項目" + chr$(13)
20810 'print " :2.結果表示設定" + chr$(13)
20820 print " :1.文字の項目" + chr$(13)
20830 print " :2.結果表示設定" + chr$(13)
20840 print " :3.トップ画面に行く" + chr$(13)
20850 print " :4.終 了" + chr$(13)
20860 endif
20870 color rgb(0,0,0)
20880 locate 1,12
20890 if No = 1 then print "1.文字の項目"
20900 'y:バーチャルパッドの処理
20910 'key$:カーソルの処理
20920 'bg:バーチャルパッドの右ボタン
20930 config_moji2:
20940 y = 0:key$ = "":bg=0
20950 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
20960 y = stick(1)
20970 key$ = inkey$
20980 bg = strig(1)
20990 pause 2
21000 wend
21010 'バーチャルパッド　ここから'
21020 'バーチャルパッド　ここから'
21030 if y = 1 then
21040 select case No
21050 'No の初期値：No=1
21060 case 1:
21070 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
21080 'デバッグライン　ここから
21090 '0のとき
21100 'デバッグライン　ここまで
21110 'デバッグライン　ここから
21120 case 2:
21130 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
21140 color rgb(0,0,0)::No=2:goto SettingScreen:
21150 if lang_flag = 1 then
21160 else
21170 locate 0,12:print " 3.トップ画面に行くを選択"
21180 endif
21190 'cls:color rgb(255,255,255):print"ok"
21200 'デバッグライン　ここまで
21210 case 3:
21220 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
21230 'デバッグライン　ここから
21240 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
21250 'デバッグライン　ここまで
21260 case 0:
21270 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21280 'デバッグライン　ここから
21290 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
21300 'デバッグライン　ここまで
21310 end select
21320 endif
21330 'バーチャルパッド　上 ここから
21340 if y = -1 then
21350 select case No
21360 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
21370 case 1:
21380 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
21390 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
21400 case 0:
21410 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
21420 'No:3 3.Help→2.設定 No:2
21430 case 3:
21440 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
21450 case 2:
21460 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
21470 end select
21480 endif
21490 '決定ボタン
21500 if bg=1 then
21510 select case No
21520 '1.数霊チェックを選択  パッドの右キー
21530 case 1:
21540 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
21550 '2.設定を選択    パッドの右キー
21560 case 2:
21570 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
21580 '3.ヘルプを選択 パッドの右
21590 case 3:
21600 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
21610 'プログラムの終了を選択
21620 case 0:
21630 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
21640 'if lang_flag = 1 then
21650 'Else
21660 ui_msg "プログラムを終了します":end
21670 'endif
21680 end select
21690 endif
21700 '4.終了するを選択  パッドの右
21710 'バーチャルパッド　ここまで'
21720 'SettingScreen:
21730 'key$ = input$(1)
21740 'カーソル下'
21750 if key$ = chr$(31) then
21760 select case (No Mod 4)
21770 '登録文字から数霊文字の確認
21780 case 1:
21790 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
21800 '数霊文字の確認からトップ画面に行く
21810 case 2:
21820 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
21830 'トップ画面に行くから終了
21840 case 3:
21850 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
21860 '終了から登録文字
21870 case 0:
21880 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21890 end select
21900 endif
21910 'カーソル　上
21920 if key$ = chr$(30) then
21930 select case (No Mod 4)
21940 case 1:
21950 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
21960 case 2:
21970 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
21980 case 3:
21990 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
22000 case 0:
22010 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
22020 end select
22030 endif
22040 'エンターキーを押したとき
22050 if key$ = chr$(13) then
22060 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
22070 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
22080 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
22090 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
22100 'lse
22110 'o'o SettingScreen:
22120 endif
22130 '結果表示設定
22140 Result_Setting:
22150 color rgb(255,255,255)
22160 'dim list$(4)
22170 'ファイル読み込み
22180 '1.ファイルが有るか無いかのチェック
22190 if Dir$(System$) = "" then
22200 '1-1.ファイルがないとき
22210 '上のSystemフォルダを作成
22220 mkdir "./System/"
22230 list$(0) = "●:出た数字から181を引く"
22240 list$(1) = " :出た数字から180を引き単数変換"
22250 open System$ for output as #1
22260 print #1,"config_r=0"
22270 close #1
22280 ui_msg "ファイルを作成しました"
22290 'ファイル作成
22300 else
22310 '1-2.ファイルが有るとき
22320 'config_r:0 出た数字から181を引く
22330 'config_r:1 出た数字から180を引いて単数変換
22340 'open "./System/config.sys" for input as #1
22350 'ファイルが有るときファイルを読み込み
22360 open System$ for input as #1
22370 line input #1,buf_line$
22380 'buf$にデーターをコピーする
22390 buf$ = buf_line$
22400 close #1
22410 if len(buf$) = 10 then
22420  if left$(buf$,9) = "config_r=" then
22430  buf$ = right$(buf_line$,1)
22440  if buf$ = "1" then
22450    '1.System$ ファイルを削除(config.sys)
22460    '2.1行目をconfig_r=1と書き、保存する
22470    buf_config_r = 1
22480    'list$(0) = "●:1.出た数字から180を引いて単数変換"
22490    'list$(1) = " :2.出た数字から181を引く"
22500    else
22510  if buf$ = "0" then
22520    buf_config_r = 0
22530   ' list$(0) = "●:1.出た数字から181を引く"
22540   'list$(1) = " :2.出た数字から180を引いて単数変換"
22550  endif
22560  endif
22570  endif
22580 endif
22590 endif
22600 '"●:1.出た数字から180を引く"をlist$(0)に代入
22610 if buf_config_r =  0 then
22620 list$(0) = "●:1.出た数字から181を引く"
22630 list$(1) = " :2.出た数字から180を引いて単数変換"
22640 else
22650 list$(0) = "●:1.出た数字から180を引いて単数変換"
22660 list$(1) = " :2.出た数字から181を引く"
22670 endif
22680 list$(2) = " :トップ画面に戻る"
22690 list$(3) = " :終 了"
22700 list_num = ui_select("list$","番号を選んでください")
22710 play ""
22720 Select case (list_num)
22730 case 0:
22740        if buf$ = "1" then
22750        buf_config_r = 0:
22760        'データーを変更したのでファイルを削除
22770        kill System$
22780        'ファイルを新しく作成
22790        open System$ for output as #1
22800        print #1,"config_r=0"
22810        close #1
22820        ui_msg "設定を変更しました。"
22830        else
22840        'if buf$ = "0" then
22850        'buf_config_r = 1
22860        'kill System$
22870        'open Syetem$ for output as #1
22880        'print #1,"config_r=1"
22890        'close #1
22900        'ui_msg "設定を変更しました"
22910        'endif
22920        endif
22930        goto config_moji2:
22940 case 1:
22950        if buf$ = "0" then
22960        buf_config_r = 1:
22970        'データーを変更したので、ファイルを削除
22980        kill System$
22990        'ファイルを新しく作成
23000        open System$ for output as #1
23010        print #1,"config_r=1"
23020        close #1
23030        ui_msg "設定を変更しました"
23040        else
23050        kill System$
23060        if buf$ = "1" then
23070        open System$ for output as #1
23080        print #1,"config_r=0"
23090        close #1
23100        ui_msg "設定を変更しました"
23110        endif
23120        endif
23130        goto config_moji2:
23140 case 2:
23150       'トップ画面に飛ぶ
23160        goto TopScreen:
23170 case 3:
23180       'プログラムを終了する
23190       cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
23200 end select
23210 '単数変換
23220 Func Single_Complate(num)
23230 '1.出てきた数字から180を引く
23240 a = num - 180
23250 'a:10〜99
23260 Re1:
23270 if (a > 9 and a < 100) then
23280  b1 = fix(a / 10)
23290  b2 = 10 * a - b1
23300  d1 = b1 + b2
23310 if c>9 then
23320  goto Re1:
23330 else
23340  c=d1:goto Re2:
23350 endif
23360 endif
23370 Re2:
23380 buffer = c
23390 endfunc buffer
23400 Func Surei_Result_Save_File()
23410 'ファイルがないとき
23420 if dir$(SAVE_DATA1$) = "" then
23430 open SAVE_DATA1$ for output as #1
23440 print #1,"入力文字:"+buffer_moji$+"数霊:"+str$(count)
23450 close #1
23460 ui_msg "保存しました":talk "保存しました":goto Surei_Result:
23470 else
23480 open SAVE_DATA1$ for append as #1
23490 print #1,"入力文字:"+buffer_moji$+"数霊:"+str$(count)
23500 close #1
23510 ui_msg "保存しました":talk "保存しました":goto Surei_Result
23520 endif
23530 endfunc
