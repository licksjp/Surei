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
430 '現在のバージョン
440 Version$ = "1.2.7_2023.01.06(正式版)"
450 'csvファイル 1.数霊 ベースファイル
460 FILE_csv$ = "data/Kazutama.csv"
470 'csvファイル 2.数霊 ベースファイル 2
480 FILE_csv2$ = "data/Surei_chart_20211207.csv"
490 'Save ファイル
500 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
510 'gazo ファイル
520 Gazo$ = "data/Gazo/"
530 'System フォルダ:設定ファイルを保存するところ
540 System$ = "System/config.sys"
550 '設定ファイル名:config.sys
560 'Sound File(Voice)
570 '1.ボイス TopScreen
580 Voice_File_TopScreen$ = "data/Sound_data/"
590 '変数領域
600 'vcount:バーチャルパッド下の変数
610 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0
620 count2 = 0:N=0:N2=0:m2 = 0
630 dim list$(4),moji_List$(2)
640 'ファイルの有無チェック
650 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
660 '1.ファイルが無いとき
670 cls :print "依存ファイルが見つかりません":
680 print "エンターキーを押してください" + chr$(13)
690 key$ = input$(1)
700 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
710 else
720 '2.ファイルが有るとき
730 cls:print "csv:file ok." + chr$(13)
740 n=0
750 open FILE_csv$ for input as #1
760 while eof(1) = 0
770 input #1,line$
780 'print line$
790 bufline$(n) = line$
800 'Print n;chr$(13)
810 n = n + 1
820 wend
830 close #1
840 N=n
850 '2つ目のファイル読み込み
860 'n = 0
870 open FILE_csv2$ for input as #2
880 for n=3 to 181
890 for i=0 to 1
900 input #2,line$
910 bufline2$(n,i) = line$
920 next i
930 next n
940 close #2
950 N2 = n
960 '
970 endif
980 '設定ファイルの読み込み
990 'open System$ for input as #1
1000 'line input #1,buf_line$
1010  'if len(buf_line$) = 10 then
1020   'if left$(buf_line$,9)="config_r=" then
1030   ' buf$ = right$(buf_line$,1)
1040    'if buf$ = "1" then
1050    '   buf_config_r = 1
1060   ' else
1070   '    buf_config_r = 0
1080   ' endif
1090  ' endif
1100 'endif
1110 'close #1
1120 'or j = 3 to 181+3
1130 'ufline3$(j - 3,n) = bufline2$(i,n)
1140 'next j
1150 'moji$ = Kotodama$(bufline3$(16))
1160 'erase bufline2$
1170 '2022.11.23----------------------
1180 '端末言語のチェック
1190 '日本語端末かチェックをして日本語以外なら英語で表示する
1200 'lang flag:0:日本語 1:英語(日本語以外)
1210 '--------------------------------
1220 lang_flag = 0
1230 if ex_info$(1) <> "JP" then
1240 lang_flag = 1
1250 endif
1260 'Top画面
1270 TopScreen:
1280 'バーチャルパッドを表示
1290 cls 3:font 48:screen 1,1,1:init"kb:4"
1300 'play ""
1310 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
1320 gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
1330 '選択肢 1
1340 gload Gazo$ + "Selection.png",1,5,200
1350 '選択肢 2
1360 gload Gazo$ + "Selection.png",1,5,300
1370 '選択肢 3
1380 gload Gazo$ + "Selection.png",1,5,400
1390 '選択肢 4
1400 gload Gazo$ + "Selection.png",1,5,500
1410 color rgb(0,0,255)
1420 print chr$(13)
1430 if lang_flag = 1 then
1440 color rgb(255,255,255)
1450 print "Select Number" + chr$(13)
1460 print " :1.Kazutama check" + chr$(13)
1470 print " :2.Setting" + chr$(13)
1480 print " :3.Help" + chr$(13)
1490 print " :4.End Program" + chr$(13)
1500 color rgb(255,255,255)
1510 else
1520 color rgb(255,255,255)
1530 print "番号を選んでください" + chr$(13)
1540 print " :1.数霊(かずたま)チェック" + chr$(13)
1550 print " :2.設定" + chr$(13)
1560 print " :3.ヘルプ" + chr$(13)
1570 print " :4.終　了" + chr$(13)
1580 color rgb(0,0,0)
1590 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
1600 'バーチャルパッドを表示
1610 No=1:
1620 'lang_flag:1 外国語,0:日本語
1630 if lang_flag = 1 then
1640 'lang_flag=1 英語
1650 locate 0,12:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
1660 else
1670 'lang_flag=0 日本語
1680 locate 0,12:color rgb(0,0,0):print "1.数霊(かずたま)チェックを選択";chr$(13)
1690 endif
1700 endif
1710 'スプライト
1720 '選択肢 1 On
1730 sp_def 0,(5,200),32,32
1740 sp_on 0,1
1750 sp_put 0,(5,200),0,0
1760 '選択肢 2 Off
1770 sp_def 1,(5,300),32,32
1780 sp_on 1,0
1790 sp_put 1,(5,300),0,0
1800 '選択肢 3 Off
1810 sp_def 2,(5,400),32,32
1820 sp_on 2,0
1830 sp_put 2,(5,400),0,0
1840 '選択肢 4 Off
1850 sp_def 3,(5,500),32,32
1860 sp_on 3,0
1870 sp_put 3,(5,500),0,0
1880 color rgb(0,0,0)
1890 Main_Select:
1900 'y:バーチャルパッドの処理
1910 'key$:カーソルの処理
1920 y = 0:key$ = "":bg = 0
1930 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
1940 y = stick(1)
1950 key$ = inkey$
1960 bg = strig(1)
1970 pause 2
1980 wend
1990 'if y=1 then
2000 'select case (No Mod 4)
2010 'ase 0:
2020 '     c=1:No=c:sp_on 0,1:sp_on 1,0 :sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print " 数霊(かずたま)チェックを選択":beep:goto Main_Select:
2030 'case 1:
2040 '       =2:No=c:sp_on 0,0:
2050 '"ase 2:
2060 'ase 3:
2070 'nd select
2080 'ndif
2090 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
2100 '1.バーチャルパッドの処理
2110 'バーチャルパッド下を押した時
2120 if y = 1 then
2130 select case No
2140 'No の初期値：No=1
2150 case 1:
2160 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":
2170 if lang_flag = 1 then
2180 'lang_flag=1 英語
2190 else
2200 'lang_flag=0 日本語
2210 locate 0,12:print "2.設定を選択":goto Main_Select:
2220 endif
2230 'デバッグライン　ここから
2240 '0のとき
2250 'デバッグライン　ここまで
2260 'デバッグライン　ここから
2270 'バーチャルパッド　下
2280 case 2:
2290 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:
2300 if lang_flag = 1 then
2310 else
2320 print "                                         ":
2330 color rgb(0,0,0):locate 0,12:
2340 print "3.ヘルプを選択":No=3:goto Main_Select:
2350 endif
2360 'cls:color rgb(255,255,255):print"ok"
2370 'デバッグライン　ここまで
2380 case 3:
2390 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                               "
2400 if lang_flag = 1 then
2410 else
2420 locate 0,12:print "4.終了を選択":No=0:goto Main_Select:
2430 endif
2440 'デバッグライン　ここから
2450 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
2460 'デバッグライン　ここまで
2470 case 0:
2480 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1
2490 if lang_flag = 1 then
2500 'lang_flag=1:英語
2510 else
2520 'lang_flag=0:日本語
2530 locate 0,12:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
2540 'endif
2550 endif
2560 'デバッグライン　ここから
2570 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
2580 'デバッグライン　ここまで
2590 end select
2600 endif
2610 'バーチャルパッド　上 ここから
2620 if y = -1 then
2630 select case No
2640 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
2650 case 1:
2660 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       "
2670 if lang_flag = 1 then
2680 'lang_flag=1 英語
2690 else
2700 'lang_flag=0 日本語
2710 locate 0,12:print "4.終了を選択":goto Main_Select:
2720 endif
2730 'endif
2740 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
2750 case 0:
2760 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":
2770 if lang_flag = 1 then
2780 '1:英語
2790 else
2800 '0:日本語
2810 locate 0,12:print "3.ヘルプを選択":goto Main_Select:
2820 endif
2830 'No:3 3.Help→2.設定 No:2
2840 case 3:
2850 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      "
2860 if lang_flag = 1 then
2870 '1:英語
2880 else
2890 '0:日本語
2900 locate 0,12:print"2.設定を選択":goto Main_Select:
2910 endif
2920 case 2:
2930 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":
2940 if lang_flag = 1 then
2950 'lang_flag 1 英語
2960 else
2970 'lang_flag 0 日本語
2980 locate 0,12:print"1.数霊(かずたま)チェックを選択":goto Main_Select:
2990 endif
3000 end select
3010 endif
3020 if bg=1 then
3030 select case No
3040 '1.数霊チェックを選択  パッドの右キー(決定)
3050 case 1:
3060 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
3070 '2.設定を選択  パッドの右キー(決定)
3080 case 2:
3090 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
3100 '3.ヘルプを選択 パッドの右(決定)
3110 case 3:
3120 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
3130 'プログラムの終了を選択(決定)
3140 case 0:
3150 cls 3:cls 4:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:
3160 if lang_flag = 1 then
3170 'lang_flag = 1 英語
3180 else
3190 'lang_flag = 0 日本語
3200 ui_msg "プログラムを終了します":color rgb(255,255,255):end
3210 endif
3220 end select
3230 '4.終了するを選択  パッドの右
3240 endif
3250 'バーチャルパッド　上　ここまで
3260 '2.カーソルの処理
3270 'カーソル　下 chr$(31)
3280 if (key$ = chr$(31)) then
3290 select case (No)
3300 '4
3310 '0 選択肢4 => 選択肢1
3320 case 0:
3330 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "              ":color rgb(0,0,0):
3340 if lang_flag = 1 then
3350 'lang flag:1 英語
3360 else
3370 'lang flag:0 日本語
3380 color rgb(0,0,0):locate 0,12:print "1.数霊(かずたま)チェックを選択":beep:goto Main_Select:
3390 endif
3400 '1 選択肢1 => 選択肢2
3410 case 1:
3420 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":
3430 if lang_flag = 1 then
3440 'lang_flag:1 英語
3450 else
3460 'lang_flag:0 日本語
3470 color rgb(0,0,0):locate 0,12:print "2.設定を選択":beep:goto Main_Select:
3480 endif
3490 '2 選択肢2 => 選択肢3
3500 case 2:
3510 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "               ":
3520 if lang_flag = 1 then
3530 'lang flag:1 英語
3540 else
3550 'lang flang:0 日本語
3560 color rgb(0,0,0):locate 0,12:print "3.ヘルプを選択":beep:goto Main_Select:
3570 endif
3580 '3 選択肢３ => 選択肢4
3590 case 3:
3600 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "               ":color rgb(0,0,0)
3610 if lang_flag = 1 then
3620 'lang_flag = 1 英語
3630 else
3640 'lang_flag = 0 日本語
3650 color rgb(0,0,0):locate 0,12:print "4.終 了を選択":beep:goto Main_Select:
3660 endif
3670 case else:
3680 goto Main_Select:
3690 end select
3700 endif
3710 'カーソル　上
3720 if key$=chr$(30) then
3730 select case (No)
3740 '選択肢1 => 選択肢4
3750 case 1:
3760 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:PRINT "                      ":
3770 if lang_flag = 1 then
3780 'lang_flag=1:英語
3790 else
3800 'lang_flag = 0:日本語
3810 else
3820 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
3830 endif
3840 '選択肢2 => 選択肢1
3850 case 2:
3860 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                 ":locate 1,12:beep:print "2.設 定を選択":beep:goto Main_Select:
3870 '選択肢3　=> 選択肢2
3880 case 3:
3890 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0
3900 if lang_flag = 1 then
3910 'lang_flag = 1:英語
3920 else
3930 'lang_flag = 0:日本語
3940 locate 0,12:beep:print "3.ヘルプを選択":goto Main_Select:
3950 endif
3960 '選択肢4 => 選択肢3
3970 case 0:
3980 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 1,12:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
3990 if lang_flag = 1 then
4000 'lang flag=1 英語
4010 else
4020 'lang flag=0 日本語
4030 locate 1,12:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
4040 endif
4050 end select
4060 endif
4070 'Input "番号:",No
4080 'エンターキー入力:決定
4090 if key$ = chr$(13) then
4100 select case No
4110 case 1:
4120 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4130 case 3:
4140 Color rgb(255,255,255):goto Help:
4150 case 0:
4160 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
4170 case 2:
4180 color rgb(255,255,255):goto Setting:
4190 'else
4200 'goto Main_Select:
4210 end select
4220 endif
4230 'ndif
4240 'if N0=0 or No>4 then goto TopScreen:
4250 '1-1.数霊チェック
4260 Surei_Check:
4270 cls 3:Font 48:
4280 'gload Gazo$ + "Screen4.png"
4290 gload Gazo$ + "Screen1_Sureicheck_Top20211226.png"
4300 play ""
4310 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
4320 color rgb(255,0,0)
4330 'print "●数霊(かずたま)チェックトップ" + chr$(13)
4340 sp_on 0,1:sp_put 0,(5,200),0,0:screen 1,1,1
4350 if lang_flag = 1 then
4360 'lang_flag=1 英語
4370 else
4380 'lang_flag=0 日本語
4390 print chr$(13)
4400 color rgb(255,255,255)
4410 print "番号を選んでください" + chr$(13)
4420 print " :1.数霊(かずたま)1人用" + chr$(13)
4430 print " :2.数霊(かずたま)2人用" + chr$(13)
4440 print " :3.トップ画面に行く" + chr$(13)
4450 print " :4.終 了" + chr$(13)
4460 color rgb(0,0,0):No = 1
4470 locate 0,12
4480 print "1.数霊(かずたま)1人用を選択"
4490 endif
4500 Kazutama_main:
4510 'y:バーチャルパッドの処理
4520 'key$:カーソルの処理
4530 'bg:バーチャルパッドの右のボタン
4540 y = 0:key$ = "":bg=0
4550 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
4560 y = stick(1)
4570 key$ = inkey$
4580 bg=strig(1)
4590 y=stick(-1)
4600 pause 2
4610 wend
4620 'key$ = input$(1)
4630 if y = 1 then
4640 select case No
4650 'No の初期値：No=1
4660 case 1:
4670 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":
4680 'if lang_flag=1 then
4690 'else
4700 locate 0,12
4710 print"2.数霊(かずたま)2人用を選択":goto Kazutama_main:
4720 'endif
4730 'デバッグライン　ここから
4740 '0のとき
4750 'デバッグライン　ここまで
4760 'デバッグライン　ここから
4770 case 2:
4780 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                               "
4790 color rgb(0,0,0):locate 1,12:print "3.トップ画面に行くを選択":No=3:goto Kazutama_main:
4800 'cls:color rgb(255,255,255):print"ok"
4810 'デバッグライン　ここまで
4820 case 3:
4830 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Kazutama_main:
4840 'デバッグライン　ここから
4850 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
4860 'デバッグライン　ここまで
4870 case 0:
4880 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.数霊(かずたま)1人用を選択":goto Kazutama_main:
4890 'デバッグライン　ここから
4900 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
4910 'デバッグライン　ここまで
4920 end select
4930 endif
4940 'バーチャルパッド　上 ここから
4950 if y = -1 then
4960 select case No
4970 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
4980 case 1:
4990 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択":goto Kazutama_main:
5000 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
5010 case 0:
5020 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面に行くを選択":goto Kazutama_main:
5030 'No:3 3.Help→2.設定 No:2
5040 case 3:
5050 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊（かずたま）2人用を選択":goto Kazutama_main:
5060 case 2:
5070 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5080 end select
5090 endif
5100 if bg=1 then
5110 select case No
5120 '1.数霊チェックを選択  パッドの右キー
5130 case 1:
5140 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
5150 '2.設定を選択    パッドの右キー
5160 case 2:
5170 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
5180 '3.ヘルプを選択 パッドの右
5190 case 3:
5200 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
5210 'プログラムの終了を選択
5220 case 0:
5230 cls 3:cls 4:ui_msg "プログラムを終了します":color rgb(255,255,255):end
5240 end select
5250 '4.終了するを選択  パッドの右
5260 endif
5270 'バーチャルパッド　上　ここまで
5280 if key$ = chr$(31) then
5290 select case No
5300 case 0:
5310 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                                          ":
5320 if lang_flag = 1 then
5330 Else
5340 No=2:locate 0,12:print "2.数霊(かずたま)2人用を選択":goto Kazutama_main:
5350 endif
5360 case 1:
5370 No=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                                          ":
5380 if lang_flag = 1 then
5390 Else
5400 locate 1,12:print"3.トップ画面に行くを選択":goto Kazutama_main:
5410 endif
5420 case 2:
5430 No=3:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print"                                       ":
5440 if lang_flag = 1 then
5450 Else
5460 locate 1,12:print"4.終了を選択":goto Kazutama_main:
5470 endif
5480 case 3:
5490 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":
5500 if lang_flag = 1 then
5510 Else
5520 No=1:locate 1,12:print"1.数霊（かずたま)1人用を選択":goto Kazutama_main:
5530 endif
5540 end select
5550 endif
5560 if key$=chr$(13) then
5570 select case No
5580 case 1:
5590 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
5600 case 2:
5610 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
5620 case 3:
5630 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
5640 case 0:
5650 cls 4:cls 3:talk"プログラムを終了します":ui_text"プログラムを終了します":end
5660 end select
5670 endif
5680 'Input "番号:",No
5690 '前の画面に戻る
5700 'if No = 3 then goto TopScreen:
5710 'プログラムの終了
5720 'if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":COLOR rgb(255,255,255):end
5730 '1人用
5740 'if No = 1 then goto Surei_Input:
5750 '2人用
5760 'if No = 2 then goto Surei_twoParson:
5770 'if No > 4 or No=0 then ui_msg"もう一度入れてください":goto Surei_Check:
5780 '数霊(かずたま) 文字入力  1人用
5790 Surei_Input:
5800 if mode = 0 then
5810 cls 3:font 32:init"kb:2"
5820 gload Gazo$ + "InputKotodama_20211226.png"
5830 play""
5840 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
5850 color rgb(255,0,0)
5860 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
5870 if lang_flag=1 then
5880 '英語
5890 else
5900 print chr$(13)
5910 color rgb(0,0,0)
5920 print "文字を入れてください" + chr$(13)
5930 color rgb(255,0,0)
5940 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
5950 print chr$(13)
5960 color rgb(0,0,0)
5970 Input "入力文字:",buffer_moji$
5980 if buffer_moji$ = "" then
5990 ui_msg "未入力です":goto Surei_Input:
6000 'endif
6010 else
6020 goto Surei_Result:
6030 endif
6040 endif
6050 endif
6060 'else
6070 if mode = 1 then
6080 cls 3:Font 32:
6090 gload Gazo$ + "InputKotodama.png"
6100 color rgb(255,0,0)
6110 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
6120 color rgb(255,255,255)
6130 print "文字を入れてください" + chr$(13)
6140 color rgb(255,0,0)
6150 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
6160 print "大文字のみ)" + chr$(13)
6170 color rgb(0,0,0)
6180 Input "文字入力:",buffer_moji2$
6190 goto Surei_Result3:
6200 'endif
6210 endif
6220 '数霊(かずたま)文字入力　2人用
6230 Surei_twoParson:
6240 cls 3:Font 32:init"kb:2"
6250 gload Gazo$ + "InputKotodama_20211226.png"
6260 '1人目入力
6270 if lang_flag = 1 then
6280 'color rgb(255,0,0)
6290 else
6300 print ""+chr$(13)
6310 'print "●数霊(かずたま) 1人目 入力" + chr$(13)
6320 color rgb(255,0,0)
6330 print "1人目の文字を入れてください" + chr$(13)
6340 color rgb(255,0,0)
6350 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
6360 color rgb(0,0,0)
6370 print chr$(13)
6380 Input "1人目文字入力:",buf_Parson1$
6390 endif
6400 Surei_twoParson2:
6410 cls 3:Font 32:init"kb:2"
6420 '2人目入力
6430 gload Gazo$ + "InputKotodama_20211226.png"
6440 'color rgb(255,0,0)
6450 'print "●数霊(かずたま) 2人目 入力" + chr$(13)
6460 if lang_falg = 1 then
6470 else
6480 print ""+chr$(13)
6490 print "2人目の文字を入れてください" + chr$(13)
6500 color rgb(255,0,0)
6510 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
6520 color rgb(0,0,0)
6530 Input "2人目の文字入力:",buf_Parson2$
6540 goto Surei_Result2:
6550 endif
6560 '数霊　計算 パート
6570 '文字の計算関数
6580 'moji$:1文字を入れる
6590 func Complate(moji$)
6600 for n = 1 to 116
6610 if moji$ = bufline$(2*n) then
6620 buffcount = val(bufline$(2 * n + 1))
6630 endif
6640 next n
6650 endfunc buffcount
6660 '数霊　結果表示
6670 Surei_Result:
6680 cls 3:Font 32
6690 'ゼロカウント:zcount
6700 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
6710 '例 アカい:"い"の文字は無効な文字なので、はじく
6720 zcount=0
6730 'mojicount:入力文字数
6740 mojicount = len(buffer_moji$)
6750 for n=1 to mojicount
6760 for j=1 to 118
6770 if (bufcount$(n - 1) = bufline$(2 * j)) then
6780   bufcount$(n-1) = Mid$(buffer_moji$,n,1)
6790 endif
6800 next j
6810 next n
6820 'if mojicount > zcount then
6830 'cls 3:ui_msg "無効な文字です":talk "無効な文字があります。":zcount = 0:goto Surei_Input:
6840 ncount=0:count=0
6850    for i = 1 to mojicount
6860     bufcount$(i-1)=Mid$(buffer_moji$,i,1)
6870   'ンのカウント
6880    if (bufcount$(i-1) = "ン") then ncount = ncount + 1
6890     'bufcount$(i-1)=Mid$(buffer_moji$,i,1)
6900    next i
6910    if (ncount > 0) then
6920    'Listを表示する
6930    moji_List$(0) = "この単語は目に見える物です"
6940    moji_List$(1) = "この単語は目に見えない物です"
6950    num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
6960    if (num2 = 0) then
6970      ' n1 = n1 + 0
6980    else
6990    if (num2 = 1) then
7000       n1 = 9 * ncount
7010       'buf_count = 9 * ncount
7020    endif
7030    endif
7040    endif
7050 'else
7060    for j=1 to mojicount
7070    bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7080    count = count + Complate(bufcount$(j - 1))
7090   ' count = count + n1:count2 = count
7100 'endif
7110    'count = count + buf_count:
7120    next j
7130    count = count + n1
7140 if (ncount > 0) then count = count
7150 '182以上のとき,181を引く
7160 if buf_cofig_r = 0 then
7170      if (count > 181) then
7180 'if buf_config_r = 0 then
7190         count = count - 181
7200 'else
7210 'if buf_config_r = 1 then
7220 '   count=Single_Complate(count2)
7230 'endif
7240      else
7250      if (buf_config_r = 1) then
7260        'count2 = count - 180
7270        buf_count = Single_Complate(count)
7280      endif
7290 endif
7300 endif
7310 'if config_r = 0 then
7320 cls 3:Font 48+16
7330 gload Gazo$ + "Result_Screen3_20211226.png"
7340 if buf_config_r = 1 then
7350    print "入力文字:" + buffer_moji$ + chr$(13)
7360    print "数霊(かずたま):";buf_count;chr$(13)
7370 endif
7380 if lang_flag = 1 then
7390 else
7400 color rgb(255,0,0)
7410 print "入力文字:" + buffer_moji$ + chr$(13)
7420 endif
7430 'print chr$(13)
7440 if lang_flag = 1 then
7450 else
7460 color rgb(0,0,255)
7470 print "数霊(かずたま):";count;chr$(13)
7480 endif
7490 if lang_flag = 1 then
7500 else
7510 color rgb(0,0,0)
7520 print "エンターキー:トップ" + chr$(13)
7530 print "スペース:次 へ" + chr$(13)
7540 'endif
7550 endif
7560 key$ = input$(1)
7570 if key$ = " " then goto Surei_Result4:
7580 if key$ = chr$(13) then
7590 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
7600 for i=0 to 9
7610 bufcount$(i) = " "
7620 next i
7630 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
7640 'else
7650 'if key$ = " " then
7660 '２回めの入力に行く
7670 'mode = 1:goto Surei_Input:
7680 'else
7690 'if key$ = "s" or key$ = "S" then
7700 'ファイルを保存する
7710 's = Save()
7720 'ui_msg"保存しました"
7730 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
7740 else
7750 goto Surei_Result:
7760 'endif
7770 endif
7780 '3-1 バージョン情報
7790 Version:
7800 cls 3:Font 32
7810 gload Gazo$ + "Screen1_Version.png"
7820 play ""
7830 play Voice_File_TopScreen$ + "Voice_Version.mp3"
7840 color rgb(255,0,0)
7850 'print"●バージョン情報"+chr$(13)
7860 print chr$(13)
7870 color rgb(255,255,255)
7880 if lang_flag = 1 then
7890 else
7900 print "Ver:";Version$ + chr$(13)
7910 print "アプリ名:数霊"+ chr$(13)
7920 print "Basic for Android Runtime" + chr$(13)
7930 print "Author:licksjp" + chr$(13)
7940 print "制作開始:2021.7.28" + chr$(13)
7950 print chr$(13)
7960 print "(C)Copy right licksjp " + chr$(13)
7970 print "All rights reserved" + chr$(13)
7980 color rgb(0,0,0)
7990 print "パッドの右を押してください" + chr$(13)
8000 endif
8010 'key$ = input$(1)
8020 bg=0:key$=""
8030 while (bg <> 1 and key$ <> chr$(13))
8040 bg = strig(1)
8050 key$ = inkey$
8060 pause 2
8070 wend
8080 if key$ = chr$(13) then
8090 goto TopScreen:
8100 'else
8110 'talk "無効なキーです":goto Version:
8120 else
8130 if bg=1 then
8140 goto TopScreen:
8150 else
8160 if lang_flag = 1 then
8170 else
8180 talk "無効なキーです":goto Version:
8190 endif
8200 endif
8210 endif
8220 '3-2 参考文献
8230 Reference_Book:
8240 cls 3:Font 48-16:play""
8250 gload Gazo$ + "Screen1_Reference.png"
8260 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
8270 color rgb(255,0,0)
8280 'print"●参考文献" + chr$(13)
8290 print chr$(13)
8300 if lang_flag = 1 then
8310 else
8320 color rgb(255,255,255)
8330 print "書名:数霊" + chr$(13)
8340 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
8350 print "出版社:徳間書店" + chr$(13)
8360 print "ISBN:978-4-19-" + chr$(13)
8370 print "         865309-5" + chr$(13)
8380 print "定価:2300円 + 税" + chr$(13)
8390 print chr$(13);chr$(13);chr$(13)
8400 color rgb(0,0,0)
8410 print "パッドの右を押してください"
8420 endif
8430 bg = 0:key$ = ""
8440 while (bg <> 1 and key$ <> chr$(13))
8450 bg = strig(1)
8460 key$ = inkey$
8470 pause 2
8480 wend
8490 if key$ = chr$(13) then
8500 goto TopScreen:
8510 'else
8520 'talk "無効なキーです":goto Reference_Book:
8530 else
8540 if bg = 1 then
8550 goto TopScreen:
8560 else
8570 talk "無効なキーです":goto Reference_Book:
8580 endif
8590 endif
8600 'key$=input$(1)
8610 'if key$=chr$(13) then
8620 'goto TopScreen:
8630 'else
8640 'talk"無効なキーです":goto Reference_Book:
8650 'endif
8660 'ヘルプ画面　トップ画面
8670 Help:
8680 No=1:c=0
8690 play ""
8700 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
8710 cls 3:Font 48:
8720 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
8730 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0
8740 color rgb(255,0,0)
8750 'print "●3.ヘルプ　トップ画面" + chr$(13)
8760 print chr$(13)
8770 color rgb(255,255,255)
8780 print "番号を選んでください" + chr$(13)
8790 print " :1.バージョン" + chr$(13)
8800 print " :2.参考文献" + chr$(13)
8810 print " :3.トップ画面に行く" + chr$(13)
8820 print " :4.終 了" + chr$(13)
8830 color rgb(0,0,0)
8840 if No = 1 then print " バージョンを選択"
8850 'y:バーチャルパッドの処理
8860 'key$:カーソルの処理
8870 'bg:バーチャルパッドの右ボタン
8880 Help_key:
8890 y = 0:key$ = "":bg=0
8900 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
8910 y = stick(1)
8920 key$ = inkey$
8930 bg=strig(1)
8940 pause 2
8950 wend
8960 'バーチャルパッド　ここから'
8970 if y = 1 then
8980 select case No
8990 'No の初期値：No=1
9000 case 1:
9010 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.参考文献を選択":goto Help_key:
9020 if lang_flag = 1 then
9030 else
9040 locate 1,12:print"2.参考文献を選択":goto Help_key:
9050 endif
9060 'デバッグライン　ここから
9070 '0のとき
9080 'デバッグライン　ここまで
9090 'デバッグライン　ここから
9100 case 2:
9110 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 1,12:print "                  "
9120 color rgb(0,0,0):locate 1,12:print "3.トップ画面に行くを選択":No=3:goto Help_key:
9130 'cls:color rgb(255,255,255):print"ok"
9140 'デバッグライン　ここまで
9150 case 3:
9160 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print "                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Help_key:
9170 'デバッグライン　ここから
9180 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
9190 'デバッグライン　ここまで
9200 case 0:
9210 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.バージョンを選択":goto Help_key:
9220 'デバッグライン　ここから
9230 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
9240 'デバッグライン　ここまで
9250 end select
9260 endif
9270 'バーチャルパッド　上 ここから
9280 if y = -1 then
9290 select case No
9300 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
9310 case 1:
9320 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Help_key:
9330 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
9340 case 0:
9350 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面に行くを選択":goto Help_key
9360 'No:3 3.Help→2.設定 No:2
9370 case 3:
9380 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.参考文献を選択":goto Help_key:
9390 case 2:
9400 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.バージョンを選択":goto Help_key:
9410 end select
9420 endif
9430 if bg = 1 then
9440 select case No
9450 '1.数霊チェックを選択  パッドの右キー
9460 case 1:
9470 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
9480 '2.設定を選択    パッドの右キー
9490 case 2:
9500 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
9510 '3.ヘルプを選択 パッドの右
9520 case 3:
9530 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
9540 'プログラムの終了を選択
9550 case 0:
9560 cls 3:cls 4:color rgb(255,255,255):end
9570 if lang_flag = 1 then
9580 'lang_flag = 1:英語
9590 Else
9600 'lang_flag = 0:日本語
9610 print "プログラムを終了します"
9620 endif
9630 end select
9640 '4.終了するを選択  パッドの右
9650 endif
9660 'バーチャルパッド　上　ここまで
9670 'バーチャルパッド　ここまで'
9680 'key$ = input$(1)
9690 'カーソルの下
9700 if key$ = chr$(31) then
9710 select case (No Mod 4)
9720 'バージョンから参考文献
9730 case 0:
9740 c=1:No=c:locate 0,12:Print "             ":locate 0,12:print " 参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
9750 '参考文献からトップ画面
9760 case 1:
9770 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "            ":locate 0,12:print " トップ画面を選択":goto Help_key:
9780 'トップ画面から終了
9790 case 2:
9800 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 0,12:print " 終 了を選択":goto Help_key:
9810 '終了からバージョン
9820 case 3:
9830 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                     ":locate 0,12:print " バージョンを選択":goto Help_key:
9840 case else:
9850 goto Help_key:
9860 end select
9870 endif
9880 'カーソル　上
9890 if key$ = chr$(30) then
9900 select case (c Mod 4)
9910 'バージョンから終了
9920 case 0:
9930 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:locate 0,12:print "                   ":locate 0,12:print " 終 了を選択":goto Help_key:
9940 '参考文献からバージョン
9950 case 1:
9960 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                   ":locate 0,12:print " バージョンを選択":goto Help_key:
9970 'トップ画面から参考文献
9980 case 2:
9990 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":locate 0,12:print " 参考文献を選択":goto Help_key:
10000 '終了からトップ画面を選択
10010 case 3:
10020 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print"                      ":locate 0,12:print " トップ画面を選択":goto Help_key:
10030 case else:
10040 goto Help_key:
10050 end select
10060 endif
10070 'Input "番号:",No
10080 'sp_def 0,(5,200),32,32
10090 'エンターキー：決定
10100 if key$=chr$(13) then
10110 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10120 if No=3 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10130 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10140 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg "プログラムを終了します":cls 3:cls 4:end
10150 else
10160 goto Help_key:
10170 endif
10180 'if (No = 0 or No > 4) then ui_msg "もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
10190 '登録文字の確認
10200 '文字を1文字入れて登録されているか調べるメニュー
10210 '設定項目
10220 Setting:
10230 cls 3:Font 48
10240 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
10250 play ""
10260 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
10270 No=1
10280 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
10290 color rgb(0,0,255)
10300 'print "●設定項目" + chr$(13)
10310 print chr$(13)
10320 if lang_flag = 1 then
10330 'lang_flag = 1:英語
10340 else
10350 'lang_flag = 0:日本語
10360 color rgb(255,255,255)
10370 print "番号を選んでください" + chr$(13)
10380 '-------コメント----------------
10390 'print " :1.登録文字の確認" + chr$(13)
10400 'print " :2.数霊文字確認" + chr$(13)
10410 '-------コメント----------------
10420 print " :1.文字の項目" + chr$(13)
10430 print " :2.結果表示設定" + chr$(13)
10440 print " :3.トップ画面に行く" + chr$(13)
10450 print " :4.終 了" + chr$(13)
10460 endif
10470 color rgb(0,0,0)
10480 locate 1,12
10490 if No=1 then print "1.文字の項目を選択"
10500 'y:バーチャルパッドの処理
10510 'key$:カーソルの処理
10520 'bg:バーチャルパッドの右ボタン
10530 SettingScreen:
10540 y = 0:key$ = "":bg=0
10550 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
10560 y = stick(1)
10570 key$ = inkey$
10580 bg=strig(1)
10590 pause 2
10600 wend
10610 'バーチャルパッド　ここから'
10620 'バーチャルパッド　ここから'
10630 if y = 1 then
10640 select case No
10650 'No の初期値：No=1
10660 case 1:
10670 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":color rgb(0,0,0):locate 1,12:print "2.結果表示設定を選択":goto SettingScreen:
10680 'デバッグライン　ここから
10690 '0のとき
10700 'デバッグライン　ここまで
10710 'デバッグライン　ここから
10720 case 2:
10730 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                         "
10740 color rgb(0,0,0)::No=3
10750 if lang_flag = 1 then
10760 else
10770 locate 1,12:print "3.トップ画面に行くを選択":goto SettingScreen:
10780 endif
10790 'cls:color rgb(255,255,255):print"ok"
10800 'デバッグライン　ここまで
10810 case 3:
10820 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                              ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
10830 'デバッグライン　ここから
10840 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
10850 'デバッグライン　ここまで
10860 case 0:
10870 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.文字の項目を選択":goto SettingScreen:
10880 'デバッグライン　ここから
10890 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
10900 'デバッグライン　ここまで
10910 end select
10920 endif
10930 'バーチャルパッド　上 ここから
10940 if y = -1 then
10950 select case No
10960 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
10970 case 1:
10980 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択":goto SettingScreen:
10990 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11000 case 0:
11010 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
11020 'No:3 3.Help→2.設定 No:2
11030 case 3:
11040 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.結果表示設定を選択":goto SettingScreen:
11050 case 2:
11060 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.文字の項目を選択":goto SettingScreen:
11070 end select
11080 endif
11090 if bg=1 then
11100 select case No
11110 '1.数霊チェックを選択  パッドの右キー
11120 case 1:
11130 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
11140 '2.設定を選択    パッドの右キー
11150 case 2:
11160 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
11170 '3.ヘルプを選択 パッドの右
11180 case 3:
11190 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
11200 'プログラムの終了を選択
11210 case 0:
11220 cls 3:cls 4::color rgb(255,255,255):pause 2.052*1000:end
11230 if lang_flag = 1 then
11240 Else
11250 ui_msg "プログラムを終了します"
11260 endif
11270 end select
11280 endif
11290 '4.終了するを選択  パッドの右
11300 'バーチャルパッド　ここまで'
11310 'SettingScreen:
11320 'key$ = input$(1)
11330 'カーソル下'
11340 if key$ = chr$(31) then
11350 select case (No Mod 4)
11360 '登録文字から数霊文字の確認
11370 case 1:
11380 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                     ":locate 1,12:print "2.結果表示設定を選択":goto SettingScreen:
11390 '数霊文字の確認からトップ画面に行く
11400 case 2:
11410 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
11420 'トップ画面に行くから終了
11430 case 3:
11440 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
11450 '終了から登録文字
11460 case 0:
11470 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print "1.文字の項目を選択":goto SettingScreen:
11480 end select
11490 endif
11500 'カーソル　上
11510 if key$ = chr$(30) then
11520 select case (No Mod 4)
11530 case 1:
11540 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
11550 case 2:
11560 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
11570 case 3:
11580 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
11590 case 0:
11600 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
11610 end select
11620 endif
11630 'エンターキーを押したとき
11640 if key$ = chr$(13) then
11650 if No=3 then goto TopScreen:
11660 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
11670 'if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji1:
11680 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
11690 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:color rgb(255,255,255):pause 3*120:end
11700 'lse
11710 'o'o SettingScreen:
11720 endif
11730 'endif
11740 'endif
11750 '文字検索項目  ここから
11760 Moji_Search:
11770 cls 4:cls 3:Font 32+16:init"kb:2"
11780 gload Gazo$ + "Moji_Search_Result.png"
11790 play ""
11800 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
11810 print "" + chr$(13)
11820 color rgb(255,0,0)
11830 if lang_flag = 1 then
11840 Else
11850 print "文字を一文字入れてください" + chr$(13)
11860 endif
11870 color rgb(0,0,0)
11880 if lang_flag=1 then
11890 Else
11900 Input "登録文字:",moji$
11910 endif
11920 moji_count = len(moji$)
11930 if moji_count > 1 then
11940 if lang_flag = 1 then
11950 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
11960 Else
11970 endif
11980 else
11990 count=0
12000 for n = 0 to 116
12010 if bufline$(2*n) = moji$ then
12020 cls 3:font 48:init"kb:4"
12030 gload Gazo$ + "Moji_Search_Result.png"
12040 'talk"この文字は登録されています"
12050 play ""
12060 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12070 if lang_flag = 1 then
12080 Else
12090 print chr$(13)
12100 color rgb(255,0,0)
12110 print moji$;"は、登録されています。" + chr$(13)
12120 color rgb(0,0,0)
12130 print "ジョイパッドの右を押してください"
12140 endif
12150 bg = 0:key$ = ""
12160 while (bg <> 1 and key$ <> chr$(13))
12170 key$ = inkey$
12180 bg = strig(1)
12190 pause 2
12200 wend
12210 'y$=input$(1)
12220 if key$ = chr$(13) then goto TopScreen:
12230 if bg=1 then goto TopScreen:
12240 count = count + 1
12250 endif
12260 next n
12270 if count = 0 then
12280 cls 3:font 48:init "kb:2"
12290 gload Gazo$ + "Moji_check.png"
12300 play ""
12310 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
12320 print chr$(13)
12330 if lang_flag = 1 then
12340 Else
12350 color rgb(255,0,0)
12360 print moji$;"は、登録されていません。" + chr$(13)
12370 color rgb(0,0,0)
12380 print "パッドの右を押してください" + chr$(13)
12390 endif
12400 kg = 0:key$ = ""
12410 while (kg <> 1 and key$ <> chr$(13))
12420 key$ = inkey$
12430 kg = strig(1)
12440 pause 2
12450 wend
12460 if key$ = chr$(13) then goto TopScreen:
12470 endif
12480 endif
12490 Surei_Result2:
12500 cls 3:Font 48
12510 zcount1=0:zcount2=0:count1=0:count2=0
12520 '1人目
12530 mojicount1=len(buf_Parson1$)
12540 '2人目
12550 mojicount2 = len(buf_Parson2$)
12560 '1人目
12570 for n = 1 to mojicount1
12580 for j = 1 to 116
12590 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
12600 if bufcount1$(n-1) = bufline$(2*j) then
12610 zcount1 = zcount1 + 1
12620 endif
12630 next j
12640 next n
12650 '2人目
12660 for n = 1 to mojicount2
12670 for j = 1 to 116
12680 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
12690 if bufcount2$(n-1) = bufline$(2*j) then
12700 zount2 = zcount2 + 1
12710 endif
12720 next j
12730 next n
12740 '1人目
12750 for i=1 to mojicount1
12760 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
12770 p1 = Complate(bufcount1$(i-1))
12780 count1 = count1 + p1
12790 next i
12800 '2人目
12810 for i = 1 to mojicount2
12820 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
12830 p2 = Complate(bufcount2$(i-1))
12840 count2 = count2 + p2
12850 next i
12860 cls 3:
12870 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
12880 color rgb(255,0,0)
12890 'print "数霊 2人用 結果表示"+chr$(13)
12900 print ""+chr$(13)
12910 if lang_flag = 1 then
12920 else
12930 color rgb(255,255,255)
12940 print "1人目:";buf_Parson1$;chr$(13)
12950 print "数霊1:";count1;chr$(13)
12960 print "2人目:";buf_Parson2$;chr$(13)
12970 print "数霊2:";count2;chr$(13)
12980 print "数霊(合計):";count1 + count2;chr$(13)
12990 color rgb(0,0,0)
13000 print "エンターキーを押してください" + chr$(13)
13010 endif
13020 key$ = "":bg = 0
13030 'ey$=input$(1)
13040 while (bg <> 1 and key$ <> chr$(13))
13050 bg = strig(1)
13060 key$ = inkey$
13070 pause 2
13080 wend
13090 if (bg = 1 or key$ = chr$(13))  then goto TopScreen:
13100 Surei_Result3:
13110 cls 3:Font 48
13120 zcount2 = 0:count2 = 0
13130 mojicount2 = len(buffer_moji2$)
13140 for n = 1 to mojicount2
13150 for j = 1 to 116
13160 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
13170 if bufcount2$(n - 1) = bufline$(2 * j) then
13180 zcount2 = zcount2 + 1
13190 endif
13200 next j
13210 next n
13220 for i = 1 to mojicount2
13230 n2 = Complate(bufcount2$(i-1))
13240 count2 = count2 + n2
13250 next i
13260 gload Gazo$ + "Screen5.png"
13270 if lang_flag = 1 then
13280 else
13290 color rgb(255,0,0)
13300 print "数霊の結果表示" + chr$(13)
13310 color rgb(255,255,255)
13320 print "１回目回の文字入力:";buffer_moji$;chr$(13)
13330 print "１回目の数霊(かずたま)";count;chr$(13)
13340 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
13350 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
13360 color rgb(0,0,0)
13370 print "エンターキー:トップ画面";chr$(13)
13380 print "c or C キー:数霊の比較";chr$(13)
13390 endif
13400 key$ = "":bg = 0
13410 while (key$ <> chr$(13) and bg <> 1)
13420 bg = strig(1)
13430 key$ = inkey$
13440 pause 2
13450 wend
13460 'key$ = input$(1)
13470 if bg = 1 then goto TopScreen:
13480 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
13490 if key$ = "c" or key$ = "C" then
13500 if count = count2 then
13510 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
13520 else
13530 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
13540 endif
13550 endif
13560 Moji_Count_Check:
13570 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
13580 cls 3:Font 48
13590 gload Gazo$ + "Moji_check.png"
13600 n = 0
13610 open FILE_csv$ for input as #1
13620 while eof(1) = 0
13630 line input #1, line$
13640 n = n + 1
13650 wend
13660 close #1
13670 'n = n - 1
13680 'talk "登録文字数は"+str$(n)+"文字です"
13690 play ""
13700 if n = 118 then
13710 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
13720 if lang_flag = 1 then
13730 else
13740 'talk "登録文字数は、" + str$(n) + "文字です"
13750 print "" + chr$(13)
13760 color rgb(255,0,0)
13770 print "文字の登録文字数は";n;"文字" + chr$(13)
13780 color rgb(0,0,0)
13790 print "パッドの右を押してください" + chr$(13)
13800 endif
13810 endif
13820 'key$ = input$(1)
13830 key$ = "":bg = 0
13840 while (key$ <> chr$(13) and bg <> 1)
13850 key$=inkey$
13860 bg=strig(1)
13870 pause 2
13880 wend
13890 if bg = 1 then goto TopScreen:
13900 if key$ = chr$(13) then
13910 goto TopScreen:
13920 else
13930 goto Moji_Count_Check:
13940 endif
13950 'Save 関数
13960 file_kazutama = 0
13970 file_kazutama = Save_File()
13980 func Save_File()
13990 open SAVE_DATA1$  for output as #1
14000 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
14010 close #1
14020 endfunc
14030 Select_moji:
14040 cls 3:font 48:No = 1
14050 gload Gazo$ + "Screen1_mojicheck.png"
14060 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
14070 color rgb(255,0,0)
14080 'print "文字の確認" + chr$(13)
14090 if lang_flag = 1 then
14100 else
14110 print chr$(13)
14120 color rgb(255,255,255)
14130 print "番号を選んでください" + chr$(13)
14140 print " :1.登録文字検索"+ chr$(13)
14150 print " :2.登録文字数の確認" + chr$(13)
14160 print " :3.トップ画面に戻る" + chr$(13)
14170 print " :4.終　了" + chr$(13)
14180 color rgb(0,0,0)
14190 if No = 1 then print "1.登録文字検索を選択"
14200 endif
14210 Entry_check_key:
14220 y = 0:key$ = "":bg=0
14230 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
14240 y = stick(1)
14250 key$ = inkey$
14260 bg=strig(1)
14270 pause 2
14280 wend
14290 'バーチャルパッド　ここから'
14300 'バーチャルパッド　ここから'
14310 if y = 1 then
14320 select case No
14330 'No の初期値：No=1
14340 case 1:
14350 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
14360 'デバッグライン　ここから
14370 '0のとき
14380 'デバッグライン　ここまで
14390 'デバッグライン　ここから
14400 case 2:
14410 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                       "
14420 :No=3
14430 'if lang_flag = 1 then
14440 'Else
14450 color rgb(0,0,0):locate 0,12:print " 3.トップ画面に戻るを選択":goto Entry_check_key:
14460 'endif
14470 'cls:color rgb(255,255,255):print"ok"
14480 'デバッグライン　ここまで
14490 case 3:
14500 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 0,12:print "4.終 了を選択":No=0:goto Entry_check_key:
14510 'デバッグライン　ここから
14520 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
14530 'デバッグライン　ここまで
14540 case 0:
14550 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字数の確認を選択":goto Entry_check_key:
14560 'デバッグライン　ここから
14570 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
14580 'デバッグライン　ここまで
14590 end select
14600 endif
14610 'バーチャルパッド　上 ここから
14620 if y = -1 then
14630 select case No
14640 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
14650 case 1:
14660 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Entry_check_key:
14670 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
14680 case 0:
14690 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                      ":locate 1,12:print"3.トップ画面に戻るを選択":goto Entry_check_key:
14700 'No:3 3.Help→2.設定 No:2
14710 case 3:
14720 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
14730 case 2:
14740 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_check_key:
14750 end select
14760 endif
14770 if bg=1 then
14780 select case No
14790 '1.数霊チェックを選択  パッドの右キー
14800 case 1:
14810 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
14820 '2.設定を選択    パッドの右キー
14830 case 2:
14840 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
14850 '3.ヘルプを選択 パッドの右
14860 case 3:
14870 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
14880 'プログラムの終了を選択
14890 case 0:
14900 cls 3:cls 4::color rgb(255,255,255):pause 2.052 * 1000:end
14910 'if lang_flag = 1 then
14920 'else
14930 ui_msg "プログラムを終了します"
14940 'endif
14950 end select
14960 endif
14970 '4.終了するを選択  パッドの右
14980 'バーチャルパッド　ここまで'
14990 'key$ = input$(1)
15000 'カーソルの下
15010 if key$ = chr$(31) then
15020 select case (No Mod 4)
15030 case 0:
15040 c=1:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
15050 case 1:
15060 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:sp_on 3,0:goto Entry_check_key:
15070 case 2:
15080 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:goto Entry_check_key:
15090 case 3:
15100 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
15110 end select
15120 endif
15130 'カーソル　上
15140 if key$ = chr$(30) then
15150 select case (No Mod 4)
15160 case 0:
15170 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
15180 case 1:
15190 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
15200 case 2:
15210 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
15220 case 3:
15230 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
15240 end select
15250 endif
15260 'エンターキーを押す
15270 if key$ = chr$(13) then
15280 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15290 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15300 if No = 3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15310 if No = 0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg
15320 endif
15330 '
15340 Kakunin_Surei_count:
15350 cls 3:font 48:No=1
15360 gload Gazo$ + "Kazutama_List_Top.png"
15370 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
15380 color rgb(255,0,0)
15390 print chr$(13)
15400 color rgb(255,255,255)
15410 'if lang_flag = 1 then
15420 'else
15430 print "番号を選んでください" + chr$(13)
15440 print " :1.数霊リスト 1人用" + chr$(13)
15450 print " :2.結果表示設定" + chr$(13)
15460 print " :3.トップ画面に行く" + chr$(13)
15470 print " :4.終 了" + chr$(13)
15480 print "" + chr$(13)
15490 'endif
15500 color rgb(0,0,0)
15510 locate 0,12:print"                                                         "
15520 if No = 1 then locate 1,12:print "1.数霊リスト　1人用を選択"
15530 Entry_List:
15540 y = 0:key$ = "":bg=0
15550 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
15560 y = stick(1)
15570 key$ = inkey$
15580 bg = strig(1)
15590 pause 2
15600 wend
15610 'バーチャルパッド　ここから'
15620 'バーチャルパッド　ここから'
15630 'バーチャルパッド　下
15640 if y = 1 then
15650 select case No
15660 'No の初期値：No=1
15670 case 1:
15680 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.結果表示設定を選択":goto Entry_List:
15690 'デバッグライン　ここから
15700 '0のとき
15710 'デバッグライン　ここまで
15720 'デバッグライン　ここから
15730 case 3:
15740 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:No=0:pause 200:locate 0,12:print "                                       "
15750 color rgb(0,0,0):locate 0,12:print "4.終了を選択":goto Entry_List:
15760 'cls:color rgb(255,255,255):print"ok"
15770 'デバッグライン　ここまで
15780 case 0:
15790 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,200),0,0:pause 200:locate 0,12:print"                                       ":locate 0,12:print "1.数霊リスト 1人用を選択":No=1:goto Entry_List:
15800 case 2:
15810 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 1,12:print "                                      ":No=3:locate 1,12:print "3．トップ画面に行くを選択":goto Entry_List:
15820 'sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print "                                      "
15830 'case 1:
15840 'デバッグライン　ここから
15850 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
15860 'デバッグライン　ここまで
15870 'case 0:
15880 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_List:
15890 'デバッグライン　ここから
15900 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
15910 'デバッグライン　ここまで
15920 end select
15930 endif
15940 'バーチャルパッド　上 ここから
15950 if y = -1 then
15960 select case No
15970 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15980 case 3:
15990 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,300),0,0:pause 200:No=2:locate 0,12:print "                                      ":locate 0,12:print "2.結果表示設定を選択":goto Entry_List:
16000 case 1:
16010 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 0,12:print "4.終了を選択":goto Entry_List:
16020 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
16030 case 0:
16040 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,400),0,0:pause 200:No=3:locate 0,12:print "                                      ":locate 1,12:print"3.トップ画面に行くを選択":goto Entry_List:
16050 'No:3 3.Help→2.設定 No:2
16060 case 2:
16070 sp_on 1,1:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 1,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.数霊リスト 1人用を選択":goto Entry_List:
16080 'case 2:
16090 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_List:
16100 end select
16110 endif
16120 if bg = 1 then
16130 select case No
16140 '1.数霊リスト 一人用を選択を選択  パッドの右キー
16150 case 1:
16160 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16170 '2.設定を選択  パッドの右キー
16180 case 2:
16190 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16200 case 3:
16210  sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 3,0:goto TopScreen:
16220 '4.終了を選択 パッドの右
16230 case 0:
16240 cls 3:cls 4:color rgb(255,255,255):
16250 'if lang_flag = 1 then
16260 'Else
16270 ui_msg"プログラムを終了します":end
16280 'endif
16290 'プログラムの終了を選択
16300 end select
16310 endif
16320 '4.終了するを選択  パッドの右
16330 'バーチャルパッド　ここまで'
16340 'Input "番号:",No
16350 'if No=2 then goto TopScreen:
16360 'if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
16370 'if No=1 then goto Surei_List1:
16380 'if No > 3 or No=0 then ui_msg"無効な数字です、入れ直してください":talk"無効な数字です":goto Kakunin_Surei_count:
16390 'if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
16400 Surei_List1:
16410 cls 3:font 48
16420 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
16430 file$ = dir$(SAVE_DATA1$,0)
16440 'ファイルが無いときの画面
16450 if file$ = ""  then
16460 gload "./data/Gazo/" + "KazutamaList1.png",0
16470 print chr$(13)
16480 color rgb(255,0,0):print "登録ファイルはございません" + chr$(13)
16490 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
16500 'else
16510 'endif
16520 bg = 0:key$ = ""
16530 while (key$ <> chr$(13) and bg<>1)
16540 key$ = inkey$
16550 bg = strig(1)
16560 pause 2
16570 wend
16580 'エンターキーもしくはバーチャルパッドの右でトップに行く
16590 if (bg = 1  or key$ = chr$(13)) then goto TopScreen:
16600 else
16610 cls 3:buffer_list_count = Loadcount()
16620 color rgb(255,255,255)
16630 if lang_flag = 1 then
16640 Else
16650 talk "登録件数は" + str$(buffer_list_count) + "件です"
16660 gload Gazo$ + "KazutamaList1_Entry.png",0
16670 color rgb(0,0,255)
16680 print chr$(13)
16690 color rgb(255,0,0)
16700 print "登録件数:";buffer_list_count;"件";chr$(13)
16710 color rgb(0,0,0)
16720 print "パッドの右を押してください" + chr$(13)
16730 endif
16740 bg = 0:key$ = "":bg2 = 0
16750 while (key$ <> chr$(13) and bg <> 1)
16760 key$ = inkey$
16770 bg = strig(1)
16780 bg2=strig(0)
16790 pause 2
16800 wend
16810 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
16820 if (key$ = chr$(13) or bg = 1) then pause 2:goto KotodamaList_page:
16830 endif
16840 if (bg2 = 1) then pause 2:goto TopScreen:
16850 func Loadcount()
16860 n = 0
16870 'while eof(1)=-1
16880 open SAVE_DATA1$  for input as #1
16890 while eof(1) <> -1
16900 line input #1,line$
16910 n = n + 1
16920 wend
16930 close #1
16940 count = n
16950 endfunc count
16960 count_line = Loadcount()
16970 func Kotodama$(buf$)
16980 color rgb(255,255,255)
16990 b = len("数霊:")
17000 a$ = Mid$(buf$,b+1,len(buf$))
17010 for i=0 to 118
17020 color rgb(255,255,255)
17030 if bufline3$(2 * i) ="数霊:" + a$  then
17040 moji_$ = bufline3$(2*i + 1)
17050 'moji_$ = bufline3$(21)
17060 'moji$ = a$
17070 endif
17080 next i
17090 'kotodama$ = a$
17100 kotodama$ = moji_$
17110 endfunc kotodama$
17120 KotodamaList_page:
17130 cls 3:font 48:m = 0:
17140 gload Gazo$ + "Screen5_Surei_List.png"
17150 if SAVE_DATA1$ = "" then
17160 cls 3:print"ファイルがありません"
17170 else
17180 a = Loadcount()
17190 open SAVE_DATA1$  for input as #1
17200 for i=0 to a-1
17210 for n=0 to 1
17220 input #1,line$
17230 bufKaztama$(i,n) = line$
17240 next n
17250 next i
17260 close #1
17270 'endif
17280 l = 0:n=0
17290 gload Gazo$ + "Screen5_Surei_List.png"
17300 while (buffer_list_count >= l)
17310 'while (l<=a)
17320 cls
17330 color rgb(255,0,0)
17340 'print "数霊　リスト" + chr$(13)
17350 print chr$(13)
17360 color rgb(255,255,255)
17370 n=n+1
17380 'while (n <= a)
17390 print "番号:";l+1;chr$(13)
17400 print bufKaztama$(l,0) + chr$(13)
17410 print bufKaztama$(l,1) + chr$(13)
17420 'n=n+1
17430 Kmoji$ = moji$
17440 print chr$(13) + chr$(13)
17450 color rgb(0,0,0)
17460 print " :パッドの左:トップ画面" + chr$(13)
17470 print " :パッドの右:次へ行く" + chr$(13)
17480 'wend
17490 key$ = "":bg = 0:bg2 = 0
17500 while (key$ <> chr$(13) and bg <> 1 and bg2 <> 1)
17510 key$ = inkey$
17520 bg = strig(1)
17530 bg2 = strig(0)
17540 pause 2
17550 wend
17560 'key$ = input$(1)
17570 if (key$ = " " OR bg = 1) then
17580 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
17590 else
17600 if ((bg2 = 1) or (key$=chr$(13))) then
17610    goto TopScreen:
17620 endif
17630 else
17640 goto KotodamaList_page:
17650 endif
17660 wend
17670 'wend
17680 endif
17690 '結果表示２ Menu1
17700 Surei_Result4:
17710 cls 3:font (48-16):init"kb:4"
17720 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
17730 for i=0 to 181 + 3 - 1
17740 if i = count  then
17750 buffer$ = bufline2$(count + 4,0)
17760 endif
17770 next i
17780 if len(buffer$) > 23 and len(buffer$) <= 45 then
17790 buffer2$ = Mid$(buffer$,1,24)
17800 buffer3$ = Mid$(buffer$,25,(len(buffer$) - 25))
17810 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)
17820 else
17830 if len(buffer$) <= 23 then
17840 buffer2$ = Mid$(buffer$,1,22)
17850 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
17860 else
17870 if len(buffer$) > 45 and len(buffer$) <= 64 then
17880 buffer2$ = Mid$(buffer$,1,22)
17890 buffer3$ = Mid$(buffer$,23,20)
17900 buffer4$ = Mid$(buffer$,43,(len(buffer$)-43))
17910 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)+chr$(13)
17920 else
17930 if len(buffer$) > 64 and len(buffer$) <= 81 then
17940 buffer2$ = Mid$(buffer$,1,23)
17950 buffer3$ = Mid$(buffer$,24,20)
17960 buffer4$ = Mid$(buffer$,42,20)
17970 buffer5$ = Mid$(buffer$,63,(len(buffer$)-62))
17980 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13) + chr$(13) + chr$(13)
17990 if len(buffer$) > 81 and len(buffer$) <= 110 then
18000 buffer2$ = Mid$(buffer$,1,21)
18010 buffer3$ = Mid$(buffer$,22,20)
18020 buffer4$ = Mid$(buffer$,42,20)
18030 buffer5$ = Mid$(buffer$,62,20)
18040 buffer6$ = Mid$(buffer$,82,(len(buffer$) - 82))
18050 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13) + chr$(13) + chr$(13)
18060 endif
18070 endif
18080 endif
18090 endif
18100 endif
18110 Surei_Result4_2:
18120 gload Gazo$ + "Screen1_Result2.png"
18130 cls
18140 color rgb(255,0,0)
18150 'print "診断結果 2" + chr$(13)
18160 print chr$(13)
18170 if lang_flag = 1 then
18180 else
18190 color rgb(127,255,212)
18200 print "入力文字:";buffer_moji$;chr$(13)
18210 print "数霊:";count;chr$(13)
18220 color rgb(255,255,255)
18230 print "数霊の説明:"+chr$(13)
18240 print buffer$
18250 color rgb(0,0,0)
18260 print "(パッド 左):保存,S(パッド 右):トップ画面" + chr$(13)
18270 endif
18280 key$ = "":bg = 0:bg2 = 0
18290 while (key$<>chr$(13) and bg<>1 and bg2<>1)
18300 key$=inkey$
18310 bg=strig(1)
18320 bg2=strig(0)
18330 pause 2
18340 wend
18350 if bg=1 then buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
18360 if key$ = chr$(13) then
18370 buffer$ = "":buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
18380 endif
18390 if bg2=1 then
18400 'ファイルがない時
18410 if dir$(SAVE_DATA1$) = "" then
18420 open SAVE_DATA1$ for output as #1
18430 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18440 close #1
18450 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
18460 'ファイルが有る時
18470 else
18480 open SAVE_DATA1$ for append as #1
18490 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18500 close #1
18510 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
18520 endif
18530 endif
18540 if key$="s" or key$="S" then
18550 if dir$(SAVE_DATA1$) = "" then
18560 open SAVE_DATA1$ for output as #1
18570 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18580 close #1
18590 ui_msg"保存しました":talk"保存しました":goto Surei_Result4_2:
18600 else
18610 open SAVE_DATA1$ for append as #1
18620 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18630 close #1
18640 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
18650 endif
18660 else
18670 talk "無効な文字です":goto Surei_Result4_2:
18680 endif
18690 'endif
18700 func All_clear()
18710 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
18720 endfunc
18730 'ここから
18740 Config_moji1:
18750 cls 3:Font 48
18760 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
18770 play ""
18780 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
18790 No=1
18800 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
18810 color rgb(0,0,255)
18820 'print "●設定項目" + chr$(13)
18830 print chr$(13)
18840 if lang_flag = 1 then
18850 'lang_flag = 1:英語
18860 else
18870 'lang_flag = 0:日本語
18880 color rgb(255,255,255)
18890 print "番号を選んでください" + chr$(13)
18900 'print " :1.文字の項目" + chr$(13)
18910 'print " :2.結果表示設定" + chr$(13)
18920 print " :1.文字の項目" + chr$(13)
18930 print " :2.結果表示設定" + chr$(13)
18940 print " :3.トップ画面に行く" + chr$(13)
18950 print " :4.終 了" + chr$(13)
18960 endif
18970 color rgb(0,0,0)
18980 locate 1,12
18990 if No = 1 then print "1.文字の項目"
19000 'y:バーチャルパッドの処理
19010 'key$:カーソルの処理
19020 'bg:バーチャルパッドの右ボタン
19030 Config_moji1_Screen:
19040 y = 0:key$ = "":bg=0
19050 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
19060 y = stick(1)
19070 key$ = inkey$
19080 bg=strig(1)
19090 pause 2
19100 wend
19110 'バーチャルパッド　ここから'
19120 'バーチャルパッド　ここから'
19130 if y = 1 then
19140 select case No
19150 'No の初期値：No=1
19160 case 1:
19170 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
19180 'デバッグライン　ここから
19190 '0のとき
19200 'デバッグライン　ここまで
19210 'デバッグライン　ここから
19220 case 2:
19230 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
19240 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
19250 if lang_flag = 1 then
19260 else
19270 locate 1,12:print "3.トップ画面に行くを選択"
19280 endif
19290 'cls:color rgb(255,255,255):print"ok"
19300 'デバッグライン　ここまで
19310 case 3:
19320 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
19330 'デバッグライン　ここから
19340 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
19350 'デバッグライン　ここまで
19360 case 0:
19370 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
19380 'デバッグライン　ここから
19390 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
19400 'デバッグライン　ここまで
19410 end select
19420 endif
19430 'バーチャルパッド　上 ここから
19440 if y = -1 then
19450 select case No
19460 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
19470 case 1:
19480 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
19490 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
19500 case 0:
19510 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
19520 'No:3 3.Help→2.設定 No:2
19530 case 3:
19540 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
19550 case 2:
19560 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
19570 end select
19580 endif
19590 if bg=1 then
19600 select case No
19610 '1.数霊チェックを選択  パッドの右キー
19620 case 1:
19630 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
19640 '2.設定を選択    パッドの右キー
19650 case 2:
19660 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
19670 '3.ヘルプを選択 パッドの右
19680 case 3:
19690 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
19700 'プログラムの終了を選択
19710 case 0:
19720 cls 3:cls 4::color rgb(255,255,255):pause 2.052*1000:end
19730 if lang_flag = 1 then
19740 Else
19750 ui_msg "プログラムを終了します"
19760 endif
19770 end select
19780 endif
19790 '4.終了するを選択  パッドの右
19800 'バーチャルパッド　ここまで'
19810 'SettingScreen:
19820 'key$ = input$(1)
19830 'カーソル下'
19840 if key$ = chr$(31) then
19850 select case (No Mod 4)
19860 '登録文字から数霊文字の確認
19870 case 1:
19880 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
19890 '数霊文字の確認からトップ画面に行く
19900 case 2:
19910 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
19920 'トップ画面に行くから終了
19930 case 3:
19940 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
19950 '終了から登録文字
19960 case 0:
19970 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
19980 end select
19990 endif
20000 'カーソル　上
20010 if key$ = chr$(30) then
20020 select case (No Mod 4)
20030 case 1:
20040 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
20050 case 2:
20060 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
20070 case 3:
20080 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
20090 case 0:
20100 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
20110 end select
20120 endif
20130 'エンターキーを押したとき
20140 if key$ = chr$(13) then
20150 if No=3 then goto TopScreen:
20160 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
20170 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
20180 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:color rgb(255,255,255):pause 3*120:end
20190 'lse
20200 'o'o SettingScreen:
20210 endif
20220 'ここまで
20230 Config_moji2:
20240 cls 3:Font 48
20250 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
20260 play ""
20270 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
20280 No=1
20290 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
20300 color rgb(0,0,255)
20310 'print "●設定項目" + chr$(13)
20320 print chr$(13)
20330 if lang_flag = 1 then
20340 'lang_flag = 1:英語
20350 else
20360 'lang_flag = 0:日本語
20370 color rgb(255,255,255)
20380 print "番号を選んでください" + chr$(13)
20390 'print " :1.文字の項目" + chr$(13)
20400 'print " :2.結果表示設定" + chr$(13)
20410 print " :1.文字の項目" + chr$(13)
20420 print " :2.結果表示設定" + chr$(13)
20430 print " :3.トップ画面に行く" + chr$(13)
20440 print " :4.終 了" + chr$(13)
20450 endif
20460 color rgb(0,0,0)
20470 locate 1,12
20480 if No = 1 then print "1.文字の項目"
20490 'y:バーチャルパッドの処理
20500 'key$:カーソルの処理
20510 'bg:バーチャルパッドの右ボタン
20520 config_moji2:
20530 y = 0:key$ = "":bg=0
20540 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
20550 y = stick(1)
20560 key$ = inkey$
20570 bg = strig(1)
20580 pause 2
20590 wend
20600 'バーチャルパッド　ここから'
20610 'バーチャルパッド　ここから'
20620 if y = 1 then
20630 select case No
20640 'No の初期値：No=1
20650 case 1:
20660 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
20670 'デバッグライン　ここから
20680 '0のとき
20690 'デバッグライン　ここまで
20700 'デバッグライン　ここから
20710 case 2:
20720 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
20730 color rgb(0,0,0)::No=2:goto SettingScreen:
20740 if lang_flag = 1 then
20750 else
20760 locate 1,12:print "3.トップ画面に行くを選択"
20770 endif
20780 'cls:color rgb(255,255,255):print"ok"
20790 'デバッグライン　ここまで
20800 case 3:
20810 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
20820 'デバッグライン　ここから
20830 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
20840 'デバッグライン　ここまで
20850 case 0:
20860 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 1,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
20870 'デバッグライン　ここから
20880 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
20890 'デバッグライン　ここまで
20900 end select
20910 endif
20920 'バーチャルパッド　上 ここから
20930 if y = -1 then
20940 select case No
20950 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
20960 case 1:
20970 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
20980 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
20990 case 0:
21000 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
21010 'No:3 3.Help→2.設定 No:2
21020 case 3:
21030 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
21040 case 2:
21050 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
21060 end select
21070 endif
21080 '決定ボタン
21090 if bg=1 then
21100 select case No
21110 '1.数霊チェックを選択  パッドの右キー
21120 case 1:
21130 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
21140 '2.設定を選択    パッドの右キー
21150 case 2:
21160 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
21170 '3.ヘルプを選択 パッドの右
21180 case 3:
21190 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
21200 'プログラムの終了を選択
21210 case 0:
21220 cls 3:cls 4::color rgb(255,255,255):pause 2.052*1000:end
21230 if lang_flag = 1 then
21240 Else
21250 ui_msg "プログラムを終了します"
21260 endif
21270 end select
21280 endif
21290 '4.終了するを選択  パッドの右
21300 'バーチャルパッド　ここまで'
21310 'SettingScreen:
21320 'key$ = input$(1)
21330 'カーソル下'
21340 if key$ = chr$(31) then
21350 select case (No Mod 4)
21360 '登録文字から数霊文字の確認
21370 case 1:
21380 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
21390 '数霊文字の確認からトップ画面に行く
21400 case 2:
21410 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
21420 'トップ画面に行くから終了
21430 case 3:
21440 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
21450 '終了から登録文字
21460 case 0:
21470 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21480 end select
21490 endif
21500 'カーソル　上
21510 if key$ = chr$(30) then
21520 select case (No Mod 4)
21530 case 1:
21540 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
21550 case 2:
21560 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
21570 case 3:
21580 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
21590 case 0:
21600 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
21610 end select
21620 endif
21630 'エンターキーを押したとき
21640 if key$ = chr$(13) then
21650 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
21660 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
21670 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
21680 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4:color rgb(255,255,255):pause 3 * 120:end
21690 'lse
21700 'o'o SettingScreen:
21710 endif
21720 '結果表示設定
21730 Result_Setting:
21740 color rgb(255,255,255)
21750 'dim list$(4)
21760 'ファイル読み込み
21770 '1.ファイルが有るか無いかのチェック
21780 if Dir$(System$) = "" then
21790 '1-1.ファイルがないとき
21800 '上のSystemフォルダを作成
21810 mkdir "./System/"
21820 list$(0) = "●:出た数字から181を引く"
21830 list$(1) = " :出た数字から180を引き単数変換"
21840 open System$ for output as #1
21850 print #1,"config_r=0"
21860 close #1
21870 ui_msg "ファイルを作成しました"
21880 'ファイル作成
21890 else
21900 '1-2.ファイルが有るとき
21910 'config_r:0 出た数字から181を引く
21920 'config_r:1 出た数字から180を引いて単数変換
21930 'open "./System/config.sys" for input as #1
21940 'ファイルが有るときファイルを読み込み
21950 open System$ for input as #1
21960 line input #1,buf_line$
21970 'buf$にデーターをコピーする
21980 buf$ = buf_line$
21990 close #1
22000 if len(buf$) = 10 then
22010  if left$(buf$,9) = "config_r=" then
22020  buf$ = right$(buf_line$,1)
22030  if buf$ = "1" then
22040    '1.System$ ファイルを削除(config.sys)
22050    '2.1行目をconfig_r=1と書き、保存する
22060    buf_config_r = 1
22070    'list$(0) = "●:1.出た数字から180を引いて単数変換"
22080    'list$(1) = " :2.出た数字から181を引く"
22090    else
22100  if buf$ = "0" then
22110    buf_config_r = 0
22120   ' list$(0) = "●:1.出た数字から181を引く"
22130   'list$(1) = " :2.出た数字から180を引いて単数変換"
22140  endif
22150  endif
22160  endif
22170 endif
22180 endif
22190 '"●:1.出た数字から180を引く"をlist$(0)に代入
22200 if buf_config_r =  0 then
22210 list$(0) = "●:1.出た数字から181を引く"
22220 list$(1) = " :2.出た数字から180を引いて単数変換"
22230 else
22240 list$(0) = "●:1.出た数字から180を引いて単数変換"
22250 list$(1) = " :2.出た数字から181を引く"
22260 endif
22270 list$(2) = " :トップ画面に戻る"
22280 list$(3) = " :終 了"
22290 list_num = ui_select("list$","番号を選んでください")
22300 play ""
22310 Select case (list_num)
22320 case 0:
22330        if buf$ = "1" then
22340        buf_config_r = 0:
22350        'データーを変更したのでファイルを削除
22360        kill System$
22370        'ファイルを新しく作成
22380        open System$ for output as #1
22390        print #1,"config_r=0"
22400        close #1
22410        ui_msg "設定を変更しました。"
22420        else
22430        'if buf$ = "0" then
22440        'buf_config_r = 1
22450        'kill System$
22460        'open Syetem$ for output as #1
22470        'print #1,"config_r=1"
22480        'close #1
22490        'ui_msg "設定を変更しました"
22500        'endif
22510        endif
22520        goto config_moji2:
22530 case 1:
22540        if buf$ = "0" then
22550        buf_config_r = 1:
22560        'データーを変更したので、ファイルを削除
22570        kill System$
22580        'ファイルを新しく作成
22590        open System$ for output as #1
22600        print #1,"config_r=1"
22610        close #1
22620        ui_msg "設定を変更しました"
22630        else
22640        kill System$
22650        if buf$ = "1" then
22660        open System$ for output as #1
22670        print #1,"config_r=0"
22680        close #1
22690        ui_msg "設定を変更しました"
22700        endif
22710        endif
22720        goto config_moji2:
22730 case 2:
22740       'トップ画面に飛ぶ
22750        goto TopScreen:
22760 case 3:
22770       'プログラムを終了する
22780       cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
22790 end select
22800 '単数変換
22810 Func Single_Complate(num)
22820 '1.出てきた数字から180を引く
22830 a = num - 180
22840 'a:10〜99
22850 Re1:
22860 if (a > 9 and a < 100) then
22870  b1 = fix(a / 10)
22880  b2 = 10 * a - b1
22890  d1 = b1 + b2
22900 if c>9 then
22910  goto Re1:
22920 else
22930  c=d1:goto Re2:
22940 endif
22950 endif
22960 Re2:
22970 buffer = c
22980 endfunc buffer
