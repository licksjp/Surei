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
450 'Version 1.3.0_2023.01.23-2023.01.29(Release):正式版
460 '現在のバージョン
470 Version$ = "1.3.0_2023.01.29(正式版)"
480 'csvファイル 1.数霊 ベースファイル
490 FILE_csv$ = "data/Kazutama.csv"
500 'csvファイル 2.数霊 ベースファイル 2
510 FILE_csv2$ = "data/Surei_chart_20211207.csv"
520 'Save ファイル
530 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
540 'gazo ファイル
550 Gazo$ = "data/Gazo/"
560 'System フォルダ:設定ファイルを保存するところ
570 System$ = "System/config.sys"
580 '設定ファイル名:config.sys
590 'Sound File(Voice)
600 '1.ボイス TopScreen
610 Voice_File_TopScreen$ = "data/Sound_data/"
620 '変数領域
630 'vcount:バーチャルパッド下の変数
640 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
650 count2 = 0:N=0:N2=0:m2 = 0
660 dim list$(4),moji_List$(2)
670 'ファイルの有無チェック
680 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
690 '1.ファイルが無いとき
700 cls :print "依存ファイルが見つかりません":
710 print "エンターキーを押してください" + chr$(13)
720 key$ = input$(1)
730 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
740 else
750 '2.ファイルが有るとき
760 cls:print "csv:file ok." + chr$(13)
770 n=0
780 open FILE_csv$ for input as #1
790 while eof(1) = 0
800 input #1,line$
810 'print line$
820 bufline$(n) = line$
830 'Print n;chr$(13)
840 n = n + 1
850 wend
860 close #1
870 N=n
880 '2つ目のファイル読み込み
890 'n = 0
900 open FILE_csv2$ for input as #2
910 for n=3 to 181
920 for i=0 to 1
930 input #2,line$
940 bufline2$(n,i) = line$
950 next i
960 next n
970 close #2
980 N2 = n
990 '
1000 endif
1010 '設定ファイルの読み込み
1020 'open System$ for input as #1
1030 'line input #1,buf_line$
1040  'if len(buf_line$) = 10 then
1050   'if left$(buf_line$,9)="config_r=" then
1060   ' buf$ = right$(buf_line$,1)
1070    'if buf$ = "1" then
1080    '   buf_config_r = 1
1090   ' else
1100   '    buf_config_r = 0
1110   ' endif
1120  ' endif
1130 'endif
1140 'close #1
1150 'or j = 3 to 181+3
1160 'ufline3$(j - 3,n) = bufline2$(i,n)
1170 'next j
1180 'moji$ = Kotodama$(bufline3$(16))
1190 'erase bufline2$
1200 '2022.11.23----------------------
1210 '端末言語のチェック
1220 '日本語端末かチェックをして日本語以外なら英語で表示する
1230 'lang flag:0:日本語 1:英語(日本語以外)
1240 '--------------------------------
1250 lang_flag = 0
1260 if ex_info$(1) <> "JP" then
1270 lang_flag = 1
1280 endif
1290 'Top画面
1300 TopScreen:
1310 'バーチャルパッドを表示
1320 cls 3:font 48:screen 1,1,1:init"kb:4"
1330 'play ""
1340 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
1350 gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
1360 '選択肢 1
1370 gload Gazo$ + "Selection.png",1,5,200
1380 '選択肢 2
1390 gload Gazo$ + "Selection.png",1,5,300
1400 '選択肢 3
1410 gload Gazo$ + "Selection.png",1,5,400
1420 '選択肢 4
1430 gload Gazo$ + "Selection.png",1,5,500
1440 color rgb(0,0,255)
1450 print chr$(13)
1460 if lang_flag = 1 then
1470 color rgb(255,255,255)
1480 print "Select Number" + chr$(13)
1490 print " :1.Kazutama check" + chr$(13)
1500 print " :2.Setting" + chr$(13)
1510 print " :3.Help" + chr$(13)
1520 print " :4.End Program" + chr$(13)
1530 color rgb(255,255,255)
1540 else
1550 color rgb(255,255,255)
1560 print "番号を選んでください" + chr$(13)
1570 print " :1.数霊(かずたま)チェック" + chr$(13)
1580 print " :2.設定" + chr$(13)
1590 print " :3.ヘルプ" + chr$(13)
1600 print " :4.終　了" + chr$(13)
1610 color rgb(0,0,0)
1620 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
1630 'バーチャルパッドを表示
1640 No=1:
1650 'lang_flag:1 外国語,0:日本語
1660 if lang_flag = 1 then
1670 'lang_flag=1 英語
1680 locate 0,12:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
1690 else
1700 'lang_flag=0 日本語
1710 locate 0,12:color rgb(0,0,0):print "1.数霊(かずたま)チェックを選択";chr$(13)
1720 endif
1730 endif
1740 'スプライト
1750 '選択肢 1 On
1760 sp_def 0,(5,200),32,32
1770 sp_on 0,1
1780 sp_put 0,(5,200),0,0
1790 '選択肢 2 Off
1800 sp_def 1,(5,300),32,32
1810 sp_on 1,0
1820 sp_put 1,(5,300),0,0
1830 '選択肢 3 Off
1840 sp_def 2,(5,400),32,32
1850 sp_on 2,0
1860 sp_put 2,(5,400),0,0
1870 '選択肢 4 Off
1880 sp_def 3,(5,500),32,32
1890 sp_on 3,0
1900 sp_put 3,(5,500),0,0
1910 color rgb(0,0,0)
1920 Main_Select:
1930 'y:バーチャルパッドの処理
1940 'key$:カーソルの処理
1950 y = 0:key$ = "":bg = 0
1960 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
1970 y = stick(1)
1980 key$ = inkey$
1990 bg = strig(1)
2000 pause 2
2010 wend
2020 'if y=1 then
2030 'select case (No Mod 4)
2040 'ase 0:
2050 '     c=1:No=c:sp_on 0,1:sp_on 1,0 :sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print " 数霊(かずたま)チェックを選択":beep:goto Main_Select:
2060 'case 1:
2070 '       =2:No=c:sp_on 0,0:
2080 '"ase 2:
2090 'ase 3:
2100 'nd select
2110 'ndif
2120 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
2130 '1.バーチャルパッドの処理
2140 'バーチャルパッド下を押した時
2150 if y = 1 then
2160 select case No
2170 'No の初期値：No=1
2180 case 1:
2190 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":
2200 if lang_flag = 1 then
2210 'lang_flag=1 英語
2220 locate 0,12:print "2.It has selected Setting":goto Main_Select:
2230 else
2240 'lang_flag=0 日本語
2250 locate 0,12:print "2.設定を選択":goto Main_Select:
2260 endif
2270 'デバッグライン　ここから
2280 '0のとき
2290 'デバッグライン　ここまで
2300 'デバッグライン　ここから
2310 'バーチャルパッド　下
2320 case 2:
2330 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:
2340 print "                                         ":
2350 if lang_flag = 1 then
2360 color rgb(0,0,0):locate 0,12:
2370 print "3.It has selected Help":No=3:goto Main_Select:
2380 else
2390 color rgb(0,0,0):locate 0,12:
2400 print "3.ヘルプを選択":No=3:goto Main_Select:
2410 endif
2420 'cls:color rgb(255,255,255):print"ok"
2430 'デバッグライン　ここまで
2440 case 3:
2450 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                               "
2460 if lang_flag = 1 then
2470 locate 0,12:print "4.It has selected finish program":No=0:goto Main_Select:
2480 else
2490 locate 0,12:print "4.終了を選択":No=0:goto Main_Select:
2500 endif
2510 'デバッグライン　ここから
2520 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
2530 'デバッグライン　ここまで
2540 case 0:
2550 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1
2560 if lang_flag = 1 then
2570 'lang_flag=1:英語
2580 locate 0,12:print "1.It has selected Kazutama check":goto Main_Select:
2590 else
2600 'lang_flag=0:日本語
2610 locate 0,12:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
2620 'endif
2630 endif
2640 'デバッグライン　ここから
2650 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
2660 'デバッグライン　ここまで
2670 end select
2680 endif
2690 'バーチャルパッド　上 ここから
2700 if y = -1 then
2710 select case No
2720 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
2730 case 1:
2740 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       "
2750 if lang_flag = 1 then
2760 'lang_flag=1 英語
2770 locate 0,12:print "4.It has finished program":goto Main_Select:
2780 else
2790 'lang_flag=0 日本語
2800 locate 0,12:print "4.終了を選択":goto Main_Select:
2810 endif
2820 'endif
2830 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
2840 case 0:
2850 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":
2860 if lang_flag = 1 then
2870 '1:英語
2880 locate 0,12:print "3.It has selected Help":goto Main_Select:
2890 else
2900 '0:日本語
2910 locate 0,12:print "3.ヘルプを選択":goto Main_Select:
2920 endif
2930 'No:3 3.Help→2.設定 No:2
2940 case 3:
2950 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      "
2960 if lang_flag = 1 then
2970 '1:英語
2980 locate 0,12:print "2.It has selected Setting":goto Main_Select:
2990 else
3000 '0:日本語
3010 locate 0,12:print"2.設定を選択":goto Main_Select:
3020 endif
3030 case 2:
3040 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":
3050 if lang_flag = 1 then
3060 'lang_flag 1 英語
3070 locate 0,12:print "1.It has selected Kazutama check":goto Main_Select:
3080 else
3090 'lang_flag 0 日本語
3100 locate 0,12:print"1.数霊(かずたま)チェックを選択":goto Main_Select:
3110 endif
3120 end select
3130 endif
3140 if bg=1 then
3150 select case No
3160 '1.数霊チェックを選択  パッドの右キー(決定)
3170 case 1:
3180 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
3190 '2.設定を選択  パッドの右キー(決定)
3200 case 2:
3210 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
3220 '3.ヘルプを選択 パッドの右(決定)
3230 case 3:
3240 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
3250 'プログラムの終了を選択(決定)
3260 case 0:
3270 cls 3:cls 4:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:
3280 'if lang_flag = 1 then
3290 'lang_flag = 1 英語
3300 'else
3310 'lang_flag = 0 日本語
3320 ui_msg "プログラムを終了します":color rgb(255,255,255):end
3330 'endif
3340 end select
3350 '4.終了するを選択  パッドの右
3360 endif
3370 'バーチャルパッド　上　ここまで
3380 '2.カーソルの処理
3390 'カーソル　下 chr$(31)
3400 if (key$ = chr$(31)) then
3410 select case (No)
3420 '4
3430 '0 選択肢4 => 選択肢1
3440 case 0:
3450 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "              ":color rgb(0,0,0):
3460 if lang_flag = 1 then
3470 'lang flag:1 英語
3480 else
3490 'lang flag:0 日本語
3500 color rgb(0,0,0):locate 0,12:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
3510 endif
3520 '1 選択肢1 => 選択肢2
3530 case 1:
3540 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":
3550 if lang_flag = 1 then
3560 'lang_flag:1 英語
3570 else
3580 'lang_flag:0 日本語
3590 color rgb(0,0,0):locate 0,12:print "2.設定を選択":beep:goto Main_Select:
3600 endif
3610 '2 選択肢2 => 選択肢3
3620 case 2:
3630 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "               ":
3640 if lang_flag = 1 then
3650 'lang flag:1 英語
3660 else
3670 'lang flang:0 日本語
3680 color rgb(0,0,0):locate 0,12:print "3.ヘルプを選択":beep:goto Main_Select:
3690 endif
3700 '3 選択肢３ => 選択肢4
3710 case 3:
3720 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "               ":color rgb(0,0,0)
3730 if lang_flag = 1 then
3740 'lang_flag = 1 英語
3750 else
3760 'lang_flag = 0 日本語
3770 color rgb(0,0,0):locate 0,12:print "4.終 了を選択":beep:goto Main_Select:
3780 endif
3790 case else:
3800 goto Main_Select:
3810 end select
3820 endif
3830 'カーソル　上
3840 if key$=chr$(30) then
3850 select case (No)
3860 '選択肢1 => 選択肢4
3870 case 1:
3880 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:PRINT "                      ":
3890 if lang_flag = 1 then
3900 'lang_flag=1:英語
3910 'print "1.It has selected Kazutama check":goto Main_Select:
3920 else
3930 'lang_flag = 0:日本語
3940 else
3950 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
3960 endif
3970 '選択肢2 => 選択肢1
3980 case 2:
3990 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                 ":locate 1,12:print "2.設 定を選択":goto Main_Select:
4000 '選択肢3　=> 選択肢2
4010 case 3:
4020 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0
4030 if lang_flag = 1 then
4040 'lang_flag = 1:英語
4050 locate 0,12:print "It has selected Help":goto Main_Select:
4060 else
4070 'lang_flag = 0:日本語
4080 locate 0,12:print "3.ヘルプを選択":goto Main_Select:
4090 endif
4100 '選択肢4 => 選択肢3
4110 case 0:
4120 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 1,12:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
4130 if lang_flag = 1 then
4140 'lang flag=1 英語
4150 else
4160 'lang flag=0 日本語
4170 locate 1,12:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
4180 endif
4190 end select
4200 endif
4210 'Input "番号:",No
4220 'エンターキー入力:決定
4230 if key$ = chr$(13) then
4240 select case No
4250 case 1:
4260 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4270 case 3:
4280 Color rgb(255,255,255):goto Help:
4290 case 0:
4300 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
4310 case 2:
4320 color rgb(255,255,255):goto Setting:
4330 'else
4340 'goto Main_Select:
4350 end select
4360 endif
4370 'ndif
4380 'if N0=0 or No>4 then goto TopScreen:
4390 '1-1.数霊チェック
4400 Surei_Check:
4410 cls 3:Font 48:
4420 'gload Gazo$ + "Screen4.png"
4430 gload Gazo$ + "Screen1_Sureicheck_Top20211226.png"
4440 play ""
4450 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
4460 color rgb(255,0,0)
4470 'print "●数霊(かずたま)チェックトップ" + chr$(13)
4480 sp_on 0,1:sp_put 0,(5,200),0,0:screen 1,1,1
4490 if lang_flag = 1 then
4500 'lang_flag=1 英語
4510 else
4520 'lang_flag=0 日本語
4530 print chr$(13)
4540 color rgb(255,255,255)
4550 print "番号を選んでください" + chr$(13)
4560 print " :1.数霊(かずたま)1人用" + chr$(13)
4570 print " :2.数霊(かずたま)2人用" + chr$(13)
4580 print " :3.トップ画面に行く" + chr$(13)
4590 print " :4.終 了" + chr$(13)
4600 color rgb(0,0,0):No = 1
4610 locate 0,12
4620 print " 1.数霊(かずたま)1人用を選択"
4630 endif
4640 Kazutama_main:
4650 'y:バーチャルパッドの処理
4660 'key$:カーソルの処理
4670 'bg:バーチャルパッドの右のボタン
4680 y = 0:key$ = "":bg=0
4690 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
4700 y = stick(1)
4710 key$ = inkey$
4720 bg=strig(1)
4730 y=stick(-1)
4740 pause 2
4750 wend
4760 'key$ = input$(1)
4770 if y = 1 then
4780 select case No
4790 'No の初期値：No=1
4800 case 1:
4810 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":
4820 'if lang_flag=1 then
4830 'else
4840 locate 0,12
4850 print" 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
4860 'endif
4870 'デバッグライン　ここから
4880 '0のとき
4890 'デバッグライン　ここまで
4900 'デバッグライン　ここから
4910 case 2:
4920 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                               "
4930 color rgb(0,0,0):locate 0,12:print " 3.トップ画面に行くを選択":No=3:goto Kazutama_main:
4940 'cls:color rgb(255,255,255):print"ok"
4950 'デバッグライン　ここまで
4960 case 3:
4970 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 0,12:print " 4.終 了を選択":No=0:goto Kazutama_main:
4980 'デバッグライン　ここから
4990 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
5000 'デバッグライン　ここまで
5010 case 0:
5020 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 0,12:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5030 'デバッグライン　ここから
5040 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
5050 'デバッグライン　ここまで
5060 end select
5070 endif
5080 'バーチャルパッド　上 ここから
5090 if y = -1 then
5100 select case No
5110 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
5120 case 1:
5130 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 0,12:print" 4.終了を選択":goto Kazutama_main:
5140 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
5150 case 0:
5160 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 0,12:print" 3.トップ画面に行くを選択":goto Kazutama_main:
5170 'No:3 3.Help→2.設定 No:2
5180 case 3:
5190 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 0,12:print" 2.数霊（かずたま）2人用を選択":goto Kazutama_main:
5200 case 2:
5210 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 0,12:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5220 end select
5230 endif
5240 if bg=1 then
5250 select case No
5260 '1.数霊チェックを選択  パッドの右キー
5270 case 1:
5280 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
5290 '2.設定を選択    パッドの右キー
5300 case 2:
5310 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
5320 '3.ヘルプを選択 パッドの右
5330 case 3:
5340 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
5350 'プログラムの終了を選択
5360 case 0:
5370 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.05*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
5380 end select
5390 '4.終了するを選択  パッドの右
5400 endif
5410 'バーチャルパッド　上　ここまで
5420 if key$ = chr$(31) then
5430 select case No
5440 case 0:
5450 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                                          ":
5460 if lang_flag = 1 then
5470 Else
5480 No=2:locate 0,12:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
5490 endif
5500 case 1:
5510 No=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                                          ":
5520 if lang_flag = 1 then
5530 Else
5540 locate 0,12:print" 3.トップ画面に行くを選択":goto Kazutama_main:
5550 endif
5560 case 2:
5570 No=3:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print"                                       ":
5580 if lang_flag = 1 then
5590 Else
5600 locate 0,12:print" 4.終了を選択":goto Kazutama_main:
5610 endif
5620 case 3:
5630 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":
5640 if lang_flag = 1 then
5650 Else
5660 No=1:locate 0,12:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
5670 endif
5680 end select
5690 endif
5700 if key$=chr$(13) then
5710 select case No
5720 case 1:
5730 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
5740 case 2:
5750 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
5760 case 3:
5770 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
5780 case 0:
5790 cls 4:cls 3:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
5800 end select
5810 endif
5820 'Input "番号:",No
5830 '前の画面に戻る
5840 'if No = 3 then goto TopScreen:
5850 'プログラムの終了
5860 'if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":COLOR rgb(255,255,255):end
5870 '1人用
5880 'if No = 1 then goto Surei_Input:
5890 '2人用
5900 'if No = 2 then goto Surei_twoParson:
5910 'if No > 4 or No=0 then ui_msg"もう一度入れてください":goto Surei_Check:
5920 '数霊(かずたま) 文字入力  1人用
5930 Surei_Input:
5940 if mode = 0 then
5950 cls 3:font 32:init"kb:2"
5960 gload Gazo$ + "InputKotodama_20211226.png"
5970 play""
5980 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
5990 color rgb(255,0,0)
6000 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
6010 if lang_flag=1 then
6020 '英語
6030 else
6040 print chr$(13)
6050 color rgb(0,0,0)
6060 print "文字を入れてください" + chr$(13)
6070 color rgb(255,0,0)
6080 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
6090 print chr$(13)
6100 color rgb(0,0,0)
6110 Input "入力文字:",buffer_moji$
6120 if buffer_moji$ = "" then
6130 ui_msg "未入力です":goto Surei_Input:
6140 'endif
6150 else
6160 goto Surei_Result:
6170 endif
6180 endif
6190 endif
6200 'else
6210 if mode = 1 then
6220 cls 3:Font 32:
6230 gload Gazo$ + "InputKotodama.png"
6240 color rgb(255,0,0)
6250 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
6260 color rgb(255,255,255)
6270 print "文字を入れてください" + chr$(13)
6280 color rgb(255,0,0)
6290 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
6300 print "大文字のみ)" + chr$(13)
6310 color rgb(0,0,0)
6320 Input "文字入力:",buffer_moji2$
6330 goto Surei_Result3:
6340 'endif
6350 endif
6360 '数霊(かずたま)文字入力　2人用
6370 Surei_twoParson:
6380 cls 3:Font 32:init"kb:2"
6390 gload Gazo$ + "InputKotodama_20211226.png"
6400 '1人目入力
6410 if lang_flag = 1 then
6420 'color rgb(255,0,0)
6430 else
6440 print ""+chr$(13)
6450 'print "●数霊(かずたま) 1人目 入力" + chr$(13)
6460 color rgb(255,0,0)
6470 print "1人目の文字を入れてください" + chr$(13)
6480 color rgb(255,0,0)
6490 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
6500 color rgb(0,0,0)
6510 print chr$(13)
6520 Input "1人目文字入力:",buf_Parson1$
6530 endif
6540 Surei_twoParson2:
6550 cls 3:Font 32:init"kb:2"
6560 '2人目入力
6570 gload Gazo$ + "InputKotodama_20211226.png"
6580 'color rgb(255,0,0)
6590 'print "●数霊(かずたま) 2人目 入力" + chr$(13)
6600 if lang_falg = 1 then
6610 else
6620 print ""+chr$(13)
6630 print "2人目の文字を入れてください" + chr$(13)
6640 color rgb(255,0,0)
6650 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
6660 color rgb(0,0,0)
6670 Input "2人目の文字入力:",buf_Parson2$
6680 goto Surei_Result2:
6690 endif
6700 '数霊　計算 パート
6710 '文字の計算関数
6720 'moji$:1文字を入れる
6730 func Complate(moji$)
6740 for n = 1 to 116
6750 if moji$ = bufline$(2*n) then
6760 buffcount = val(bufline$(2 * n + 1))
6770 endif
6780 next n
6790 endfunc buffcount
6800 '数霊　結果表示
6810 Surei_Result:
6820 cls 3:Font 32
6830 'ゼロカウント:zcount
6840 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
6850 '例 アカい:"い"の文字は無効な文字なので、はじく
6860 zcount=0
6870 'mojicount:入力文字数
6880 mojicount = len(buffer_moji$)
6890 for n=1 to mojicount
6900 for j=1 to 118
6910 if (bufcount$(n - 1) = bufline$(2 * j)) then
6920   bufcount$(n-1) = Mid$(buffer_moji$,n,1)
6930 endif
6940 next j
6950 next n
6960 'if mojicount > zcount then
6970 'cls 3:ui_msg "無効な文字です":talk "無効な文字があります。":zcount = 0:goto Surei_Input:
6980 ncount=0:count=0
6990    for i = 1 to mojicount
7000     bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7010   'ンのカウント
7020    if (bufcount$(i-1) = "ン") then ncount = ncount + 1
7030     'bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7040    next i
7050    if (ncount > 0) then
7060    'Listを表示する
7070    moji_List$(0) = "この単語は目に見える物です"
7080    moji_List$(1) = "この単語は目に見えない物です"
7090    num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
7100    if (num2 = 0) then
7110      ' n1 = n1 + 0
7120    else
7130    if (num2 = 1) then
7140       n1 = 9 * ncount
7150       'buf_count = 9 * ncount
7160    endif
7170    endif
7180    endif
7190 'else
7200    for j=1 to mojicount
7210    bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7220    count = count + Complate(bufcount$(j - 1))
7230   ' count = count + n1:count2 = count
7240 'endif
7250    'count = count + buf_count:
7260    next j
7270    count = count + n1
7280 if (ncount > 0) then count = count
7290 '182以上のとき,181を引く
7300 if buf_cofig_r = 0 then
7310      if (count > 181) then
7320 'if buf_config_r = 0 then
7330         count = count - 181
7340 'else
7350 'if buf_config_r = 1 then
7360 '   count=Single_Complate(count2)
7370 'endif
7380      else
7390      if (buf_config_r = 1) then
7400        'count2 = count - 180
7410        buf_count = Single_Complate(count)
7420      endif
7430 endif
7440 endif
7450 'if config_r = 0 then
7460 cls 3:Font 48+16
7470 gload Gazo$ + "Result_Screen3_20211226.png"
7480 if buf_config_r = 1 then
7490    print "入力文字:" + buffer_moji$ + chr$(13)
7500    print "数霊(かずたま):";buf_count;chr$(13)
7510 endif
7520 if lang_flag = 1 then
7530 else
7540 color rgb(255,0,0)
7550 print "入力文字:" + buffer_moji$ + chr$(13)
7560 endif
7570 'print chr$(13)
7580 if lang_flag = 1 then
7590 else
7600 color rgb(0,0,255)
7610 print "数霊(かずたま):";count;chr$(13)
7620 endif
7630 if lang_flag = 1 then
7640 else
7650 color rgb(0,0,0)
7660 print "エンター or スペース" + chr$(13)
7670 print  chr$(13)
7680 'endif
7690 endif
7700 key$ = input$(1)
7710 if ((key$ = chr$(13)) or (key$=" ")) then
7720 List$(0)="1.もう一度数霊を見る"
7730 List$(1)="2.トップ画面に行く"
7740 List$(2)="3.この数霊の説明を見る"
7750 List$(3)="4.数霊データーを保存"
7760 num=ui_select("List$","番号を選んでください")
7770 select case num
7780   case 0:
7790          goto Surei_Input:
7800   case 1:
7810        n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
7820          for i=0 to 9
7830             bufcount$(i)=""
7840          next i
7850          goto TopScreen:
7860   case 2:
7870        goto Surei_Result4:
7880   case 3:
7890         s=Surei_Result_Save_File()
7900         ui_msg "保存しました"
7910   case -1:
7920        'goto Surei_Result:
7930   case else:
7940        goto Surei_Result:
7950 end select
7960 'endif
7970 'if key$ = " " then
7980 '２回めの入力に行く
7990 'mode = 1:goto Surei_Input:
8000 'else
8010 'if key$ = "s" or key$ = "S" then
8020 'ファイルを保存する
8030 's = Save()
8040 'ui_msg"保存しました"
8050 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
8060 else
8070 goto Surei_Result:
8080 'endif
8090 endif
8100 '3-1 バージョン情報
8110 Version:
8120 cls 3:Font 32
8130 gload Gazo$ + "Screen1_Version.png"
8140 play ""
8150 play Voice_File_TopScreen$ + "Voice_Version.mp3"
8160 color rgb(255,0,0)
8170 'print"●バージョン情報"+chr$(13)
8180 print chr$(13)
8190 color rgb(255,255,255)
8200 if lang_flag = 1 then
8210 else
8220 print "Ver:";Version$ + chr$(13)
8230 print "アプリ名:数霊"+ chr$(13)
8240 print "Basic for Android Runtime" + chr$(13)
8250 print "Author:licksjp" + chr$(13)
8260 print "制作開始:2021.7.28" + chr$(13)
8270 print chr$(13)
8280 print "(C)Copy right licksjp " + chr$(13)
8290 print "All rights reserved" + chr$(13)
8300 color rgb(0,0,0)
8310 print "パッドの右を押してください" + chr$(13)
8320 endif
8330 'key$ = input$(1)
8340 bg=0:key$=""
8350 while (bg <> 1 and key$ <> chr$(13))
8360 bg = strig(1)
8370 key$ = inkey$
8380 pause 2
8390 wend
8400 if key$ = chr$(13) then
8410 goto TopScreen:
8420 'else
8430 'talk "無効なキーです":goto Version:
8440 else
8450 if bg=1 then
8460 goto TopScreen:
8470 else
8480 if lang_flag = 1 then
8490 else
8500 talk "無効なキーです":goto Version:
8510 endif
8520 endif
8530 endif
8540 '3-2 参考文献
8550 Reference_Book:
8560 cls 3:Font 48-16:play""
8570 gload Gazo$ + "Screen1_Reference.png"
8580 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
8590 color rgb(255,0,0)
8600 'print"●参考文献" + chr$(13)
8610 print chr$(13)
8620 if lang_flag = 1 then
8630 else
8640 color rgb(255,255,255)
8650 print "書名:数霊" + chr$(13)
8660 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
8670 print "出版社:徳間書店" + chr$(13)
8680 print "ISBN:978-4-19-" + chr$(13)
8690 print "         865309-5" + chr$(13)
8700 print "定価:2300円 + 税" + chr$(13)
8710 print chr$(13);chr$(13);chr$(13)
8720 color rgb(0,0,0)
8730 print "パッドの右を押してください"
8740 endif
8750 bg = 0:key$ = ""
8760 while (bg <> 1 and key$ <> chr$(13))
8770 bg = strig(1)
8780 key$ = inkey$
8790 pause 2
8800 wend
8810 if key$ = chr$(13) then
8820 goto TopScreen:
8830 'else
8840 'talk "無効なキーです":goto Reference_Book:
8850 else
8860 if bg = 1 then
8870 goto TopScreen:
8880 else
8890 talk "無効なキーです":goto Reference_Book:
8900 endif
8910 endif
8920 'key$=input$(1)
8930 'if key$=chr$(13) then
8940 'goto TopScreen:
8950 'else
8960 'talk"無効なキーです":goto Reference_Book:
8970 'endif
8980 'ヘルプ画面　トップ画面
8990 Help:
9000 No=1:c=0
9010 play ""
9020 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
9030 cls 3:Font 48:
9040 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9050 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0
9060 color rgb(255,0,0)
9070 'print "●3.ヘルプ　トップ画面" + chr$(13)
9080 print chr$(13)
9090 color rgb(255,255,255)
9100 print "番号を選んでください" + chr$(13)
9110 print " :1.バージョン" + chr$(13)
9120 print " :2.参考文献" + chr$(13)
9130 print " :3.トップ画面に行く" + chr$(13)
9140 print " :4.終 了" + chr$(13)
9150 color rgb(0,0,0)
9160 if No = 1 then print " 1.バージョンを選択"
9170 'y:バーチャルパッドの処理
9180 'key$:カーソルの処理
9190 'bg:バーチャルパッドの右ボタン
9200 Help_key:
9210 y = 0:key$ = "":bg=0
9220 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
9230 y = stick(1)
9240 key$ = inkey$
9250 bg=strig(1)
9260 pause 2
9270 wend
9280 'バーチャルパッド　ここから'
9290 if y = 1 then
9300 select case No
9310 'No の初期値：No=1
9320 case 1:
9330 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.参考文献を選択":goto Help_key:
9340 if lang_flag = 1 then
9350 else
9360 locate 1,12:print"2.参考文献を選択":goto Help_key:
9370 endif
9380 'デバッグライン　ここから
9390 '0のとき
9400 'デバッグライン　ここまで
9410 'デバッグライン　ここから
9420 case 2:
9430 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 1,12:print "                  "
9440 color rgb(0,0,0):locate 1,12:print "3.トップ画面に行くを選択":No=3:goto Help_key:
9450 'cls:color rgb(255,255,255):print"ok"
9460 'デバッグライン　ここまで
9470 case 3:
9480 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print "                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Help_key:
9490 'デバッグライン　ここから
9500 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
9510 'デバッグライン　ここまで
9520 case 0:
9530 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.バージョンを選択":goto Help_key:
9540 'デバッグライン　ここから
9550 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
9560 'デバッグライン　ここまで
9570 end select
9580 endif
9590 'バーチャルパッド　上 ここから
9600 if y = -1 then
9610 select case No
9620 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
9630 case 1:
9640 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Help_key:
9650 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
9660 case 0:
9670 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面に行くを選択":goto Help_key
9680 'No:3 3.Help→2.設定 No:2
9690 case 3:
9700 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.参考文献を選択":goto Help_key:
9710 case 2:
9720 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.バージョンを選択":goto Help_key:
9730 end select
9740 endif
9750 if bg = 1 then
9760 select case No
9770 '1.数霊チェックを選択  パッドの右キー
9780 case 1:
9790 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
9800 '2.設定を選択    パッドの右キー
9810 case 2:
9820 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
9830 '3.ヘルプを選択 パッドの右
9840 case 3:
9850 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
9860 'プログラムの終了を選択
9870 case 0:
9880 cls 3:cls 4:color rgb(255,255,255):play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
9890 'if lang_flag = 1 then
9900 'lang_flag = 1:英語
9910 'Else
9920 'lang_flag = 0:日本語
9930 'endif
9940 end select
9950 '4.終了するを選択  パッドの右
9960 endif
9970 'バーチャルパッド　上　ここまで
9980 'バーチャルパッド　ここまで'
9990 'key$ = input$(1)
10000 'カーソルの下
10010 if key$ = chr$(31) then
10020 select case (No Mod 4)
10030 'バージョンから参考文献
10040 case 0:
10050 c=1:No=c:locate 0,12:Print "             ":locate 0,12:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
10060 '参考文献からトップ画面
10070 case 1:
10080 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "            ":locate 0,12:print " 3.トップ画面に行くを選択":goto Help_key:
10090 'トップ画面から終了
10100 case 2:
10110 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 0,12:print " 4.終 了を選択":goto Help_key:
10120 '終了からバージョン
10130 case 3:
10140 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                     ":locate 0,12:print " 1.バージョンを選択":goto Help_key:
10150 case else:
10160 goto Help_key:
10170 end select
10180 endif
10190 'カーソル　上
10200 if key$ = chr$(30) then
10210 select case (c Mod 4)
10220 'バージョンから終了
10230 case 0:
10240 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:locate 0,12:print "                   ":locate 0,12:print " 4.終 了を選択":goto Help_key:
10250 '参考文献からバージョン
10260 case 1:
10270 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                   ":locate 0,12:print " 1.バージョンを選択":goto Help_key:
10280 'トップ画面から参考文献
10290 case 2:
10300 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":locate 0,12:print " 2.参考文献を選択":goto Help_key:
10310 '終了からトップ画面を選択
10320 case 3:
10330 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print"                      ":locate 0,12:print "3.トップ画面に行くを選択":goto Help_key:
10340 case else:
10350 goto Help_key:
10360 end select
10370 endif
10380 'Input "番号:",No
10390 'sp_def 0,(5,200),32,32
10400 'エンターキー：決定
10410 if key$=chr$(13) then
10420 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10430 if No=3 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10440 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10450 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg "プログラムを終了します":cls 3:cls 4:end
10460 else
10470 goto Help_key:
10480 endif
10490 'if (No = 0 or No > 4) then ui_msg "もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
10500 '登録文字の確認
10510 '文字を1文字入れて登録されているか調べるメニュー
10520 '設定項目
10530 Setting:
10540 cls 3:Font 48
10550 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
10560 play ""
10570 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
10580 No=1
10590 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
10600 color rgb(0,0,255)
10610 'print "●設定項目" + chr$(13)
10620 print chr$(13)
10630 if lang_flag = 1 then
10640 'lang_flag = 1:英語
10650 else
10660 'lang_flag = 0:日本語
10670 color rgb(255,255,255)
10680 print "番号を選んでください" + chr$(13)
10690 '-------コメント----------------
10700 'print " :1.登録文字の確認" + chr$(13)
10710 'print " :2.数霊文字確認" + chr$(13)
10720 '-------コメント----------------
10730 print " :1.文字の項目" + chr$(13)
10740 print " :2.結果表示設定" + chr$(13)
10750 print " :3.言語設定" + chr$(13)
10760 print " :4.トップ画面に行く" + chr$(13)
10770 endif
10780 color rgb(0,0,0)
10790 locate 0,12
10800 if No=1 then print " 1.文字の項目を選択"
10810 'y:バーチャルパッドの処理
10820 'key$:カーソルの処理
10830 'bg:バーチャルパッドの右ボタン
10840 SettingScreen:
10850 y = 0:key$ = "":bg=0
10860 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
10870 y = stick(1)
10880 key$ = inkey$
10890 bg=strig(1)
10900 pause 2
10910 wend
10920 'バーチャルパッド　ここから'
10930 'バーチャルパッド　ここから'
10940 if y = 1 then
10950 select case No
10960 'No の初期値：No=1
10970 case 1:
10980 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":color rgb(0,0,0):locate 1,12:print "2.結果表示設定を選択":goto SettingScreen:
10990 'デバッグライン　ここから
11000 '0のとき
11010 'デバッグライン　ここまで
11020 'デバッグライン　ここから
11030 case 2:
11040 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                         "
11050 color rgb(0,0,0)::No=3
11060 if lang_flag = 1 then
11070 else
11080 locate 1,12:print "3.言語設定を選択":goto SettingScreen:
11090 endif
11100 'cls:color rgb(255,255,255):print"ok"
11110 'デバッグライン　ここまで
11120 case 3:
11130 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                              ":locate 1,12:print "4.トップ画面に行くを選択":No=0:goto SettingScreen:
11140 'デバッグライン　ここから
11150 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11160 'デバッグライン　ここまで
11170 case 0:
11180 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.文字の項目を選択":goto SettingScreen:
11190 'デバッグライン　ここから
11200 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11210 'デバッグライン　ここまで
11220 end select
11230 endif
11240 'バーチャルパッド　上 ここから
11250 if y = -1 then
11260 select case No
11270 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11280 case 1:
11290 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.トップ画面に行くを選択":goto SettingScreen:
11300 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11310 case 0:
11320 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.言語設定に行くを選択":goto SettingScreen:
11330 'No:3 3.Help→2.設定 No:2
11340 case 3:
11350 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.結果表示設定を選択":goto SettingScreen:
11360 case 2:
11370 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.文字の項目を選択":goto SettingScreen:
11380 end select
11390 endif
11400 if bg=1 then
11410 select case No
11420 '1.数霊チェックを選択  パッドの右キー
11430 case 1:
11440 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
11450 '2.設定を選択    パッドの右キー
11460 case 2:
11470 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
11480 '3.ヘルプを選択 パッドの右
11490 case 0:
11500 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
11510 'プログラムの終了を選択
11520 case 3:
11530 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Setting_Language:
11540 'if lang_flag = 1 then
11550 'Else
11560 'ui_msg "プログラムを終了します"
11570 'endif
11580 end select
11590 endif
11600 '4.終了するを選択  パッドの右
11610 'バーチャルパッド　ここまで'
11620 'SettingScreen:
11630 'key$ = input$(1)
11640 'カーソル下'
11650 if key$ = chr$(31) then
11660 select case (No Mod 4)
11670 '登録文字から数霊文字の確認
11680 case 1:
11690 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.結果表示設定を選択":goto SettingScreen:
11700 '数霊文字の確認からトップ画面に行く
11710 case 2:
11720 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.言語設定に行くを選択":goto SettingScreen:
11730 'トップ画面に行くから終了
11740 case 3:
11750 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.トップ画面に行くを選択":goto SettingScreen:
11760 '終了から登録文字
11770 case 0:
11780 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.文字の項目を選択":goto SettingScreen:
11790 end select
11800 endif
11810 'カーソル　上
11820 if key$ = chr$(30) then
11830 select case (No Mod 4)
11840 case 1:
11850 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
11860 case 2:
11870 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
11880 case 3:
11890 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
11900 case 0:
11910 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
11920 end select
11930 endif
11940 'エンターキーを押したとき
11950 if key$ = chr$(13) then
11960 if No=3 then goto Setting_Language:
11970 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
11980 'if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji1:
11990 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
12000 if No=0 then goto TopScreen:
12010 'lse
12020 'o'o SettingScreen:
12030 endif
12040 'endif
12050 'endif
12060 '文字検索項目  ここから
12070 Moji_Search:
12080 cls 4:cls 3:Font 32+16:init"kb:2"
12090 gload Gazo$ + "Moji_Search_Result.png"
12100 play ""
12110 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
12120 print "" + chr$(13)
12130 color rgb(255,0,0)
12140 if lang_flag = 1 then
12150 Else
12160 print "文字を一文字入れてください" + chr$(13)
12170 endif
12180 color rgb(0,0,0)
12190 if lang_flag=1 then
12200 Else
12210 Input "登録文字:",moji$
12220 endif
12230 moji_count = len(moji$)
12240 if moji_count > 1 then
12250 if lang_flag = 1 then
12260 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
12270 Else
12280 endif
12290 else
12300 count=0
12310 for n = 0 to 116
12320 if bufline$(2*n) = moji$ then
12330 cls 3:font 48:init"kb:4"
12340 gload Gazo$ + "Moji_Search_Result.png"
12350 'talk"この文字は登録されています"
12360 play ""
12370 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12380 if lang_flag = 1 then
12390 Else
12400 print chr$(13)
12410 color rgb(255,0,0)
12420 print moji$;"は、登録されています。" + chr$(13)
12430 color rgb(0,0,0)
12440 print "ジョイパッドの右を押してください"
12450 endif
12460 bg = 0:key$ = ""
12470 while (bg <> 1 and key$ <> chr$(13))
12480 key$ = inkey$
12490 bg = strig(1)
12500 pause 2
12510 wend
12520 'y$=input$(1)
12530 if key$ = chr$(13) then goto TopScreen:
12540 if bg=1 then goto TopScreen:
12550 count = count + 1
12560 endif
12570 next n
12580 if count = 0 then
12590 cls 3:font 48:init "kb:2"
12600 gload Gazo$ + "Moji_check.png"
12610 play ""
12620 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
12630 print chr$(13)
12640 if lang_flag = 1 then
12650 Else
12660 color rgb(255,0,0)
12670 print moji$;"は、登録されていません。" + chr$(13)
12680 color rgb(0,0,0)
12690 print "パッドの右を押してください" + chr$(13)
12700 endif
12710 kg = 0:key$ = ""
12720 while (kg <> 1 and key$ <> chr$(13))
12730 key$ = inkey$
12740 kg = strig(1)
12750 pause 2
12760 wend
12770 if key$ = chr$(13) then goto TopScreen:
12780 endif
12790 endif
12800 Surei_Result2:
12810 cls 3:Font 48
12820 zcount1=0:zcount2=0:count1=0:count2=0
12830 '1人目
12840 mojicount1=len(buf_Parson1$)
12850 '2人目
12860 mojicount2 = len(buf_Parson2$)
12870 '1人目
12880 for n = 1 to mojicount1
12890 for j = 1 to 116
12900 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
12910 if bufcount1$(n-1) = bufline$(2*j) then
12920 zcount1 = zcount1 + 1
12930 endif
12940 next j
12950 next n
12960 '2人目
12970 for n = 1 to mojicount2
12980 for j = 1 to 116
12990 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
13000 if bufcount2$(n-1) = bufline$(2*j) then
13010 zount2 = zcount2 + 1
13020 endif
13030 next j
13040 next n
13050 '1人目
13060 for i=1 to mojicount1
13070 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
13080 p1 = Complate(bufcount1$(i-1))
13090 count1 = count1 + p1
13100 next i
13110 '2人目
13120 for i = 1 to mojicount2
13130 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
13140 p2 = Complate(bufcount2$(i-1))
13150 count2 = count2 + p2
13160 next i
13170 cls 3:
13180 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
13190 color rgb(255,0,0)
13200 'print "数霊 2人用 結果表示"+chr$(13)
13210 print ""+chr$(13)
13220 if lang_flag = 1 then
13230 else
13240 color rgb(255,255,255)
13250 print "1人目:";buf_Parson1$;chr$(13)
13260 print "数霊1:";count1;chr$(13)
13270 print "2人目:";buf_Parson2$;chr$(13)
13280 print "数霊2:";count2;chr$(13)
13290 print "数霊(合計):";count1 + count2;chr$(13)
13300 color rgb(0,0,0)
13310 print "エンターキーを押してください" + chr$(13)
13320 endif
13330 key$ = "":bg = 0
13340 'ey$=input$(1)
13350 while (bg <> 1 and key$ <> chr$(13))
13360 bg = strig(1)
13370 key$ = inkey$
13380 pause 2
13390 wend
13400 if (bg = 1 or key$ = chr$(13))  then goto TopScreen:
13410 Surei_Result3:
13420 cls 3:Font 48
13430 zcount2 = 0:count2 = 0
13440 mojicount2 = len(buffer_moji2$)
13450 for n = 1 to mojicount2
13460 for j = 1 to 116
13470 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
13480 if bufcount2$(n - 1) = bufline$(2 * j) then
13490 zcount2 = zcount2 + 1
13500 endif
13510 next j
13520 next n
13530 for i = 1 to mojicount2
13540 n2 = Complate(bufcount2$(i-1))
13550 count2 = count2 + n2
13560 next i
13570 gload Gazo$ + "Screen5.png"
13580 if lang_flag = 1 then
13590 else
13600 color rgb(255,0,0)
13610 print "数霊の結果表示" + chr$(13)
13620 color rgb(255,255,255)
13630 print "１回目回の文字入力:";buffer_moji$;chr$(13)
13640 print "１回目の数霊(かずたま)";count;chr$(13)
13650 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
13660 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
13670 color rgb(0,0,0)
13680 print "エンターキー:トップ画面";chr$(13)
13690 print "c or C キー:数霊の比較";chr$(13)
13700 endif
13710 key$ = "":bg = 0
13720 while (key$ <> chr$(13) and bg <> 1)
13730 bg = strig(1)
13740 key$ = inkey$
13750 pause 2
13760 wend
13770 'key$ = input$(1)
13780 if bg = 1 then goto TopScreen:
13790 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
13800 if key$ = "c" or key$ = "C" then
13810 if count = count2 then
13820 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
13830 else
13840 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
13850 endif
13860 endif
13870 Moji_Count_Check:
13880 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
13890 cls 3:Font 48
13900 gload Gazo$ + "Moji_check.png"
13910 n = 0
13920 open FILE_csv$ for input as #1
13930 while eof(1) = 0
13940 line input #1, line$
13950 n = n + 1
13960 wend
13970 close #1
13980 'n = n - 1
13990 'talk "登録文字数は"+str$(n)+"文字です"
14000 play ""
14010 if n = 118 then
14020 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
14030 if lang_flag = 1 then
14040 else
14050 'talk "登録文字数は、" + str$(n) + "文字です"
14060 print "" + chr$(13)
14070 color rgb(255,0,0)
14080 print "文字の登録文字数は";n;"文字" + chr$(13)
14090 color rgb(0,0,0)
14100 print "パッドの右を押してください" + chr$(13)
14110 endif
14120 endif
14130 'key$ = input$(1)
14140 key$ = "":bg = 0
14150 while (key$ <> chr$(13) and bg <> 1)
14160 key$=inkey$
14170 bg=strig(1)
14180 pause 2
14190 wend
14200 if bg = 1 then goto TopScreen:
14210 if key$ = chr$(13) then
14220 goto TopScreen:
14230 else
14240 goto Moji_Count_Check:
14250 endif
14260 'Save 関数
14270 file_kazutama = 0
14280 file_kazutama = Save_File()
14290 func Save_File()
14300 open SAVE_DATA1$  for output as #1
14310 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
14320 close #1
14330 endfunc
14340 Select_moji:
14350 cls 3:font 48:No = 1
14360 gload Gazo$ + "Screen1_mojicheck.png"
14370 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
14380 color rgb(255,0,0)
14390 'print "文字の確認" + chr$(13)
14400 if lang_flag = 1 then
14410 else
14420 print chr$(13)
14430 color rgb(255,255,255)
14440 print "番号を選んでください" + chr$(13)
14450 print " :1.登録文字検索"+ chr$(13)
14460 print " :2.登録文字数の確認" + chr$(13)
14470 print " :3.トップ画面に戻る" + chr$(13)
14480 print " :4.終　了" + chr$(13)
14490 color rgb(0,0,0)
14500 if No = 1 then print " 1.登録文字検索を選択"
14510 endif
14520 Entry_check_key:
14530 y = 0:key$ = "":bg=0
14540 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
14550 y = stick(1)
14560 key$ = inkey$
14570 bg=strig(1)
14580 pause 2
14590 wend
14600 'バーチャルパッド　ここから'
14610 'バーチャルパッド　ここから'
14620 if y = 1 then
14630 select case No
14640 'No の初期値：No=1
14650 case 1:
14660 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
14670 'デバッグライン　ここから
14680 '0のとき
14690 'デバッグライン　ここまで
14700 'デバッグライン　ここから
14710 case 2:
14720 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                       "
14730 :No=3
14740 'if lang_flag = 1 then
14750 'Else
14760 color rgb(0,0,0):locate 0,12:print " 3.トップ画面に戻るを選択":goto Entry_check_key:
14770 'endif
14780 'cls:color rgb(255,255,255):print"ok"
14790 'デバッグライン　ここまで
14800 case 3:
14810 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 0,12:print " 4.終 了を選択":No=0:goto Entry_check_key:
14820 'デバッグライン　ここから
14830 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
14840 'デバッグライン　ここまで
14850 case 0:
14860 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 0,12:print " 1.登録文字数の確認を選択":goto Entry_check_key:
14870 'デバッグライン　ここから
14880 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
14890 'デバッグライン　ここまで
14900 end select
14910 endif
14920 'バーチャルパッド　上 ここから
14930 if y = -1 then
14940 select case No
14950 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
14960 case 1:
14970 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 0,12:print" 4.終了を選択"::goto Entry_check_key:
14980 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
14990 case 0:
15000 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                      ":locate 1,12:print"3.トップ画面に戻るを選択":goto Entry_check_key:
15010 'No:3 3.Help→2.設定 No:2
15020 case 3:
15030 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
15040 case 2:
15050 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_check_key:
15060 end select
15070 endif
15080 if bg=1 then
15090 select case No
15100 '1.数霊チェックを選択  パッドの右キー
15110 case 1:
15120 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15130 '2.設定を選択    パッドの右キー
15140 case 2:
15150 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15160 '3.ヘルプを選択 パッドの右
15170 case 3:
15180 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
15190 'プログラムの終了を選択
15200 case 0:
15210 cls 3:cls 4::play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":ui_msg "プログラムを終了します":color rgb(255,255,255):pause 2.052 * 1000:end
15220 'if lang_flag = 1 then
15230 'else
15240 'endif
15250 end select
15260 endif
15270 '4.終了するを選択  パッドの右
15280 'バーチャルパッド　ここまで'
15290 'key$ = input$(1)
15300 'カーソルの下
15310 if key$ = chr$(31) then
15320 select case (No Mod 4)
15330 case 0:
15340 c=1:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
15350 case 1:
15360 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:sp_on 3,0:goto Entry_check_key:
15370 case 2:
15380 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:goto Entry_check_key:
15390 case 3:
15400 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
15410 end select
15420 endif
15430 'カーソル　上
15440 if key$ = chr$(30) then
15450 select case (No Mod 4)
15460 case 0:
15470 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
15480 case 1:
15490 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
15500 case 2:
15510 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
15520 case 3:
15530 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
15540 end select
15550 endif
15560 'エンターキーを押す
15570 if key$ = chr$(13) then
15580 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15590 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15600 if No = 3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15610 if No = 0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
15620 endif
15630 '
15640 Kakunin_Surei_count:
15650 cls 3:font 48:No=1
15660 gload Gazo$ + "Kazutama_List_Top.png"
15670 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
15680 color rgb(255,0,0)
15690 print chr$(13)
15700 color rgb(255,255,255)
15710 'if lang_flag = 1 then
15720 'else
15730 print "番号を選んでください" + chr$(13)
15740 print " :1.数霊リスト 1人用" + chr$(13)
15750 print " :2.結果表示設定" + chr$(13)
15760 print " :3.トップ画面に行く" + chr$(13)
15770 print " :4.終 了" + chr$(13)
15780 print "" + chr$(13)
15790 'endif
15800 color rgb(0,0,0)
15810 locate 0,12:print"                                                         "
15820 if No = 1 then locate 1,12:print "1.数霊リスト　1人用を選択"
15830 Entry_List:
15840 y = 0:key$ = "":bg=0
15850 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
15860 y = stick(1)
15870 key$ = inkey$
15880 bg = strig(1)
15890 pause 2
15900 wend
15910 'バーチャルパッド　ここから'
15920 'バーチャルパッド　ここから'
15930 'バーチャルパッド　下
15940 if y = 1 then
15950 select case No
15960 'No の初期値：No=1
15970 case 1:
15980 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.結果表示設定を選択":goto Entry_List:
15990 'デバッグライン　ここから
16000 '0のとき
16010 'デバッグライン　ここまで
16020 'デバッグライン　ここから
16030 case 3:
16040 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:No=0:pause 200:locate 0,12:print "                                       "
16050 color rgb(0,0,0):locate 0,12:print " 4.終了を選択":goto Entry_List:
16060 'cls:color rgb(255,255,255):print"ok"
16070 'デバッグライン　ここまで
16080 case 0:
16090 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,200),0,0:pause 200:locate 0,12:print"                                       ":locate 0,12:print " 1.数霊リスト 1人用を選択":No=1:goto Entry_List:
16100 case 2:
16110 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                      ":No=3:locate 1,12:print "3．トップ画面に行くを選択":goto Entry_List:
16120 'sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print "                                      "
16130 'case 1:
16140 'デバッグライン　ここから
16150 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
16160 'デバッグライン　ここまで
16170 'case 0:
16180 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_List:
16190 'デバッグライン　ここから
16200 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
16210 'デバッグライン　ここまで
16220 end select
16230 endif
16240 'バーチャルパッド　上 ここから
16250 if y = -1 then
16260 select case No
16270 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
16280 case 3:
16290 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,300),0,0:pause 200:No=2:locate 0,12:print "                                      ":locate 0,12:print " 2.結果表示設定を選択":goto Entry_List:
16300 case 1:
16310 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 0,12:print " 4.終了を選択":goto Entry_List:
16320 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
16330 case 0:
16340 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,400),0,0:pause 200:No=3:locate 0,12:print "                                      ":locate 1,12:print"3.トップ画面に行くを選択":goto Entry_List:
16350 'No:3 3.Help→2.設定 No:2
16360 case 2:
16370 sp_on 1,1:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 1,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.数霊リスト 1人用を選択":goto Entry_List:
16380 'case 2:
16390 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_List:
16400 end select
16410 endif
16420 if bg = 1 then
16430 select case No
16440 '1.数霊リスト 一人用を選択を選択  パッドの右キー
16450 case 1:
16460 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16470 '2.設定を選択  パッドの右キー
16480 case 2:
16490 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16500 case 3:
16510  sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16520 '4.終了を選択 パッドの右
16530 case 0:
16540 cls 3:cls 4:color rgb(255,255,255):
16550 play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:
16560 'Else
16570 ui_msg "プログラムを終了します":end
16580 'endif
16590 'プログラムの終了を選択
16600 end select
16610 endif
16620 if key$=chr$(13) then
16630 select case No
16640 case 0:
16650       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":end
16660 case 1:
16670       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16680 case 2:
16690       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16700 case 3:
16710       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16720 end select
16730 endif
16740 '4.終了するを選択  パッドの右
16750 'バーチャルパッド　ここまで'
16760 'Input "番号:",No
16770 'if No=2 then goto TopScreen:
16780 'if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
16790 'if No=1 then goto Surei_List1:
16800 'if No > 3 or No=0 then ui_msg"無効な数字です、入れ直してください":talk"無効な数字です":goto Kakunin_Surei_count:
16810 'if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
16820 Surei_List1:
16830 cls 3:font 48
16840 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
16850 file$ = dir$(SAVE_DATA1$,0)
16860 'ファイルが無いときの画面
16870 if file$ = ""  then
16880 gload "./data/Gazo/" + "KazutamaList1.png",0
16890 print chr$(13)
16900 color rgb(255,0,0):print "登録ファイルはございません" + chr$(13)
16910 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
16920 'else
16930 'endif
16940 bg = 0:key$ = ""
16950 while (key$ <> chr$(13) and bg<>1)
16960 key$ = inkey$
16970 bg = strig(1)
16980 pause 2
16990 wend
17000 'エンターキーもしくはバーチャルパッドの右でトップに行く
17010 if (bg = 1  or key$ = chr$(13)) then goto TopScreen:
17020 else
17030 cls 3:buffer_list_count = Loadcount()
17040 color rgb(255,255,255)
17050 if lang_flag = 1 then
17060 Else
17070 talk "登録件数は" + str$(buffer_list_count) + "件です"
17080 gload Gazo$ + "KazutamaList1_Entry.png",0
17090 color rgb(0,0,255)
17100 print chr$(13)
17110 color rgb(255,0,0)
17120 print "登録件数:";buffer_list_count;"件";chr$(13)
17130 color rgb(0,0,0)
17140 print "パッドの右を押してください" + chr$(13)
17150 endif
17160 bg = 0:key$ = "":bg2 = 0
17170 while (key$ <> chr$(13) and bg <> 1)
17180 key$ = inkey$
17190 bg = strig(1)
17200 bg2=strig(0)
17210 pause 2
17220 wend
17230 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
17240 if (key$ = chr$(13) or bg = 1) then pause 2:goto KotodamaList_page:
17250 endif
17260 if (bg2 = 1) then pause 2:goto TopScreen:
17270 func Loadcount()
17280 n = 0
17290 'while eof(1)=-1
17300 open SAVE_DATA1$  for input as #1
17310 while eof(1) <> -1
17320 line input #1,line$
17330 n = n + 1
17340 wend
17350 close #1
17360 count = n
17370 endfunc count
17380 count_line = Loadcount()
17390 func Kotodama$(buf$)
17400 color rgb(255,255,255)
17410 b = len("数霊:")
17420 a$ = Mid$(buf$,b+1,len(buf$))
17430 for i=0 to 118
17440 color rgb(255,255,255)
17450 if bufline3$(2 * i) ="数霊:" + a$  then
17460 moji_$ = bufline3$(2*i + 1)
17470 'moji_$ = bufline3$(21)
17480 'moji$ = a$
17490 endif
17500 next i
17510 'kotodama$ = a$
17520 kotodama$ = moji_$
17530 endfunc kotodama$
17540 KotodamaList_page:
17550 cls 3:font 48:m = 0:
17560 gload Gazo$ + "Screen5_Surei_List.png"
17570 if SAVE_DATA1$ = "" then
17580 cls 3:print"ファイルがありません"
17590 else
17600 a = Loadcount()
17610 open SAVE_DATA1$  for input as #1
17620 for i=0 to a-1
17630 for n=0 to 1
17640 input #1,line$
17650 bufKaztama$(i,n) = line$
17660 next n
17670 next i
17680 close #1
17690 'endif
17700 l = 0:n=0
17710 gload Gazo$ + "Screen5_Surei_List.png"
17720 while (buffer_list_count >= l)
17730 'while (l<=a)
17740 cls
17750 color rgb(255,0,0)
17760 'print "数霊　リスト" + chr$(13)
17770 print chr$(13)
17780 color rgb(255,255,255)
17790 n=n+1
17800 'while (n <= a)
17810 print "番号:";l+1;chr$(13)
17820 print bufKaztama$(l,0) + chr$(13)
17830 print bufKaztama$(l,1) + chr$(13)
17840 'n=n+1
17850 Kmoji$ = moji$
17860 print chr$(13) + chr$(13)
17870 color rgb(0,0,0)
17880 print " :パッドの左:トップ画面" + chr$(13)
17890 print " :パッドの右:次へ行く" + chr$(13)
17900 'wend
17910 key$ = "":bg = 0:bg2 = 0
17920 while (key$ <> chr$(13) and bg <> 1 and bg2 <> 1)
17930 key$ = inkey$
17940 bg = strig(1)
17950 bg2 = strig(0)
17960 pause 2
17970 wend
17980 'key$ = input$(1)
17990 if (key$ = " " OR bg = 1) then
18000 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
18010 else
18020 if ((bg2 = 1) or (key$=chr$(13))) then
18030    goto TopScreen:
18040 endif
18050 else
18060 goto KotodamaList_page:
18070 endif
18080 wend
18090 'wend
18100 endif
18110 '結果表示２ Menu1
18120 Surei_Result4:
18130 cls 3:font 32:init"kb:4"
18140 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
18150 for i=0 to 181 + 3 - 1
18160 if i = count  then
18170 buffer$ = bufline2$(count + 4,0)
18180 endif
18190 next i
18200 if len(buffer$) > 23 and len(buffer$) <= 45 then
18210 buffer2$ = Mid$(buffer$,1,24)
18220 buffer3$ = Mid$(buffer$,25,(len(buffer$) - 25))
18230 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)
18240 else
18250 if len(buffer$) <= 23 then
18260 buffer2$ = Mid$(buffer$,1,22)
18270 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
18280 else
18290 if len(buffer$) > 45 and len(buffer$) <= 64 then
18300 buffer2$ = Mid$(buffer$,1,22)
18310 buffer3$ = Mid$(buffer$,23,20)
18320 buffer4$ = Mid$(buffer$,43,(len(buffer$)-43))
18330 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)+chr$(13)
18340 else
18350 if len(buffer$) > 64 and len(buffer$) <= 81 then
18360 buffer2$ = Mid$(buffer$,1,23)
18370 buffer3$ = Mid$(buffer$,24,20)
18380 buffer4$ = Mid$(buffer$,42,20)
18390 buffer5$ = Mid$(buffer$,63,(len(buffer$)-62))
18400 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13) + chr$(13) + chr$(13)
18410 if len(buffer$) > 81 and len(buffer$) <= 110 then
18420 buffer2$ = Mid$(buffer$,1,21)
18430 buffer3$ = Mid$(buffer$,22,20)
18440 buffer4$ = Mid$(buffer$,42,20)
18450 buffer5$ = Mid$(buffer$,62,20)
18460 buffer6$ = Mid$(buffer$,82,(len(buffer$) - 82))
18470 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13) + chr$(13) + chr$(13)
18480 endif
18490 endif
18500 endif
18510 endif
18520 endif
18530 Surei_Result4_2:
18540 gload Gazo$ + "Screen1_Result2.png"
18550 Result_Menu_List$(0)="1.トップ画面に行く"
18560 Result_Menu_List$(1)="2.数霊のデーターを保存"
18570 Result_Menu_List$(2)="3.もう一度、数霊を調べる"
18580 cls
18590 color rgb(255,0,0)
18600 'print "診断結果 2" + chr$(13)
18610 print chr$(13)
18620 if lang_flag = 1 then
18630 else
18640 color rgb(127,255,212)
18650 print "入力文字:";buffer_moji$;chr$(13)
18660 print "数霊:";count;chr$(13)
18670 color rgb(255,255,255)
18680 print "数霊の説明:"+chr$(13)
18690 print buffer$
18700 color rgb(0,0,0)
18710 print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
18720 endif
18730 key$ = "":bg = 0:bg2 = 0
18740 while (bg<>1 and bg2<>1)
18750 key$ = inkey$
18760 bg = strig(1)
18770 bg2 = strig(0)
18780 pause 2
18790 wend
18800 if ((bg = 1) or (bg2 = 1)) then
18810 num = ui_select("Result_Menu_List$","番号を選んでください")
18820 endif
18830 if num = 0 then goto TopScreen:
18840 if num = 1 then goto File_save:
18850 if num = 2 then goto Surei_Input:
18860 if num = -1 then goto Surei_Result4
18870 ' if bg=1 then buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
18880 'if key$ = chr$(13) then
18890 'buffer$ = "":buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
18900 'endif
18910 'if bg2=1 then
18920 File_save:
18930 'ファイルがない時
18940 if dir$(SAVE_DATA1$) = " " then
18950 open SAVE_DATA1$ for output as #1
18960 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18970 close #1
18980 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
18990 'ファイルが有る時
19000 else
19010 open SAVE_DATA1$ for append as #1
19020 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19030 close #1
19040 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19050 endif
19060 'endif
19070 'if key$="s" or key$="S" then
19080 'if dir$(SAVE_DATA1$) = "" then
19090 'open SAVE_DATA1$ for output as #1
19100 'print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19110 'close #1
19120 'ui_msg"保存しました":talk"保存しました":goto Surei_Result4_2:
19130 'else
19140 'open SAVE_DATA1$ for append as #1
19150 'print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19160 'close #1
19170 'ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19180 'endif
19190 'else
19200 'talk "無効な文字です":goto Surei_Result4_2:
19210 'endif
19220 'endif
19230 func All_clear()
19240 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
19250 endfunc
19260 'ここから
19270 Config_moji1:
19280 cls 3:Font 48
19290 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19300 play ""
19310 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
19320 No=1
19330 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19340 color rgb(0,0,255)
19350 'print "●設定項目" + chr$(13)
19360 print chr$(13)
19370 if lang_flag = 1 then
19380 'lang_flag = 1:英語
19390 else
19400 'lang_flag = 0:日本語
19410 color rgb(255,255,255)
19420 print "番号を選んでください" + chr$(13)
19430 'print " :1.文字の項目" + chr$(13)
19440 'print " :2.結果表示設定" + chr$(13)
19450 print " :1.文字の項目" + chr$(13)
19460 print " :2.結果表示設定" + chr$(13)
19470 print " :3.トップ画面に行く" + chr$(13)
19480 print " :4.終 了" + chr$(13)
19490 endif
19500 color rgb(0,0,0)
19510 locate 1,12
19520 if No = 1 then print "1.文字の項目"
19530 'y:バーチャルパッドの処理
19540 'key$:カーソルの処理
19550 'bg:バーチャルパッドの右ボタン
19560 Config_moji1_Screen:
19570 y = 0:key$ = "":bg=0
19580 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
19590 y = stick(1)
19600 key$ = inkey$
19610 bg=strig(1)
19620 pause 2
19630 wend
19640 'バーチャルパッド　ここから'
19650 'バーチャルパッド　ここから'
19660 if y = 1 then
19670 select case No
19680 'No の初期値：No=1
19690 case 1:
19700 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
19710 'デバッグライン　ここから
19720 '0のとき
19730 'デバッグライン　ここまで
19740 'デバッグライン　ここから
19750 case 2:
19760 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
19770 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
19780 'if lang_flag = 1 then
19790 'else
19800 locate 1,12:print "3.トップ画面に行くを選択"
19810 'endif
19820 'cls:color rgb(255,255,255):print"ok"
19830 'デバッグライン　ここまで
19840 case 3:
19850 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
19860 'デバッグライン　ここから
19870 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
19880 'デバッグライン　ここまで
19890 case 0:
19900 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
19910 'デバッグライン　ここから
19920 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
19930 'デバッグライン　ここまで
19940 end select
19950 endif
19960 'バーチャルパッド　上 ここから
19970 if y = -1 then
19980 select case No
19990 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
20000 case 1:
20010 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
20020 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
20030 case 0:
20040 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
20050 'No:3 3.Help→2.設定 No:2
20060 case 3:
20070 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20080 case 2:
20090 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
20100 end select
20110 endif
20120 if bg=1 then
20130 select case No
20140 '1.数霊チェックを選択  パッドの右キー
20150 case 1:
20160 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
20170 '2.設定を選択    パッドの右キー
20180 case 2:
20190 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
20200 '3.ヘルプを選択 パッドの右
20210 case 3:
20220 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
20230 'プログラムの終了を選択
20240 case 0:
20250 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
20260 'if lang_flag = 1 then
20270 'Else
20280 ui_msg "プログラムを終了します":end
20290 'endif
20300 end select
20310 endif
20320 '4.終了するを選択  パッドの右
20330 'バーチャルパッド　ここまで'
20340 'SettingScreen:
20350 'key$ = input$(1)
20360 'カーソル下'
20370 if key$ = chr$(31) then
20380 select case (No Mod 4)
20390 '登録文字から数霊文字の確認
20400 case 1:
20410 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
20420 '数霊文字の確認からトップ画面に行く
20430 case 2:
20440 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
20450 'トップ画面に行くから終了
20460 case 3:
20470 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
20480 '終了から登録文字
20490 case 0:
20500 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20510 end select
20520 endif
20530 'カーソル　上
20540 if key$ = chr$(30) then
20550 select case (No Mod 4)
20560 case 1:
20570 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
20580 case 2:
20590 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
20600 case 3:
20610 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
20620 case 0:
20630 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
20640 end select
20650 endif
20660 'エンターキーを押したとき
20670 if key$ = chr$(13) then
20680 if No=3 then goto TopScreen:
20690 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
20700 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
20710 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
20720 'lse
20730 'o'o SettingScreen:
20740 endif
20750 'ここまで
20760 Config_moji2:
20770 cls 3:Font 48
20780 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
20790 play ""
20800 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
20810 No=1
20820 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
20830 color rgb(0,0,255)
20840 'print "●設定項目" + chr$(13)
20850 print chr$(13)
20860 if lang_flag = 1 then
20870 'lang_flag = 1:英語
20880 else
20890 'lang_flag = 0:日本語
20900 color rgb(255,255,255)
20910 print "番号を選んでください" + chr$(13)
20920 'print " :1.文字の項目" + chr$(13)
20930 'print " :2.結果表示設定" + chr$(13)
20940 print " :1.文字の項目" + chr$(13)
20950 print " :2.結果表示設定" + chr$(13)
20960 print " :3.トップ画面に行く" + chr$(13)
20970 print " :4.終 了" + chr$(13)
20980 endif
20990 color rgb(0,0,0)
21000 locate 1,12
21010 if No = 1 then print "1.文字の項目"
21020 'y:バーチャルパッドの処理
21030 'key$:カーソルの処理
21040 'bg:バーチャルパッドの右ボタン
21050 config_moji2:
21060 y = 0:key$ = "":bg=0
21070 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
21080 y = stick(1)
21090 key$ = inkey$
21100 bg = strig(1)
21110 pause 2
21120 wend
21130 'バーチャルパッド　ここから'
21140 'バーチャルパッド　ここから'
21150 if y = 1 then
21160 select case No
21170 'No の初期値：No=1
21180 case 1:
21190 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
21200 'デバッグライン　ここから
21210 '0のとき
21220 'デバッグライン　ここまで
21230 'デバッグライン　ここから
21240 case 2:
21250 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
21260 color rgb(0,0,0)::No=2:goto SettingScreen:
21270 if lang_flag = 1 then
21280 else
21290 locate 0,12:print " 3.トップ画面に行くを選択"
21300 endif
21310 'cls:color rgb(255,255,255):print"ok"
21320 'デバッグライン　ここまで
21330 case 3:
21340 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
21350 'デバッグライン　ここから
21360 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
21370 'デバッグライン　ここまで
21380 case 0:
21390 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21400 'デバッグライン　ここから
21410 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
21420 'デバッグライン　ここまで
21430 end select
21440 endif
21450 'バーチャルパッド　上 ここから
21460 if y = -1 then
21470 select case No
21480 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
21490 case 1:
21500 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
21510 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
21520 case 0:
21530 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
21540 'No:3 3.Help→2.設定 No:2
21550 case 3:
21560 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
21570 case 2:
21580 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
21590 end select
21600 endif
21610 '決定ボタン
21620 if bg=1 then
21630 select case No
21640 '1.数霊チェックを選択  パッドの右キー
21650 case 1:
21660 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
21670 '2.設定を選択    パッドの右キー
21680 case 2:
21690 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
21700 '3.ヘルプを選択 パッドの右
21710 case 3:
21720 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
21730 'プログラムの終了を選択
21740 case 0:
21750 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
21760 'if lang_flag = 1 then
21770 'Else
21780 ui_msg "プログラムを終了します":end
21790 'endif
21800 end select
21810 endif
21820 '4.終了するを選択  パッドの右
21830 'バーチャルパッド　ここまで'
21840 'SettingScreen:
21850 'key$ = input$(1)
21860 'カーソル下'
21870 if key$ = chr$(31) then
21880 select case (No Mod 4)
21890 '登録文字から数霊文字の確認
21900 case 1:
21910 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
21920 '数霊文字の確認からトップ画面に行く
21930 case 2:
21940 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
21950 'トップ画面に行くから終了
21960 case 3:
21970 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
21980 '終了から登録文字
21990 case 0:
22000 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
22010 end select
22020 endif
22030 'カーソル　上
22040 if key$ = chr$(30) then
22050 select case (No Mod 4)
22060 case 1:
22070 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
22080 case 2:
22090 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
22100 case 3:
22110 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
22120 case 0:
22130 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
22140 end select
22150 endif
22160 'エンターキーを押したとき
22170 if key$ = chr$(13) then
22180 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
22190 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
22200 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
22210 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
22220 'lse
22230 'o'o SettingScreen:
22240 endif
22250 '結果表示設定
22260 Result_Setting:
22270 color rgb(255,255,255)
22280 'dim list$(4)
22290 'ファイル読み込み
22300 '1.ファイルが有るか無いかのチェック
22310 if Dir$(System$) = "" then
22320 '1-1.ファイルがないとき
22330 '上のSystemフォルダを作成
22340 mkdir "./System/"
22350 list$(0) = "●:出た数字から181を引く"
22360 list$(1) = " :出た数字から180を引き単数変換"
22370 open System$ for output as #1
22380 print #1,"config_r=0"
22390 close #1
22400 ui_msg "ファイルを作成しました"
22410 'ファイル作成
22420 else
22430 '1-2.ファイルが有るとき
22440 'config_r:0 出た数字から181を引く
22450 'config_r:1 出た数字から180を引いて単数変換
22460 'open "./System/config.sys" for input as #1
22470 'ファイルが有るときファイルを読み込み
22480 open System$ for input as #1
22490 line input #1,buf_line$
22500 'buf$にデーターをコピーする
22510 buf$ = buf_line$
22520 close #1
22530 if len(buf$) = 10 then
22540  if left$(buf$,9) = "config_r=" then
22550  buf$ = right$(buf_line$,1)
22560  if buf$ = "1" then
22570    '1.System$ ファイルを削除(config.sys)
22580    '2.1行目をconfig_r=1と書き、保存する
22590    buf_config_r = 1
22600    'list$(0) = "●:1.出た数字から180を引いて単数変換"
22610    'list$(1) = " :2.出た数字から181を引く"
22620    else
22630  if buf$ = "0" then
22640    buf_config_r = 0
22650   ' list$(0) = "●:1.出た数字から181を引く"
22660   'list$(1) = " :2.出た数字から180を引いて単数変換"
22670  endif
22680  endif
22690  endif
22700 endif
22710 endif
22720 '"●:1.出た数字から180を引く"をlist$(0)に代入
22730 if buf_config_r =  0 then
22740 list$(0) = "●:1.出た数字から181を引く"
22750 list$(1) = " :2.出た数字から180を引いて単数変換"
22760 else
22770 list$(0) = "●:1.出た数字から180を引いて単数変換"
22780 list$(1) = " :2.出た数字から181を引く"
22790 endif
22800 list$(2) = " :トップ画面に戻る"
22810 list$(3) = " :終 了"
22820 list_num = ui_select("list$","番号を選んでください")
22830 play ""
22840 Select case (list_num)
22850 case 0:
22860        if buf$ = "1" then
22870        buf_config_r = 0:
22880        'データーを変更したのでファイルを削除
22890        kill System$
22900        'ファイルを新しく作成
22910        open System$ for output as #1
22920        print #1,"config_r=0"
22930        close #1
22940        ui_msg "設定を変更しました。"
22950        else
22960        'if buf$ = "0" then
22970        'buf_config_r = 1
22980        'kill System$
22990        'open Syetem$ for output as #1
23000        'print #1,"config_r=1"
23010        'close #1
23020        'ui_msg "設定を変更しました"
23030        'endif
23040        endif
23050        goto config_moji2:
23060 case 1:
23070        if buf$ = "0" then
23080        buf_config_r = 1:
23090        'データーを変更したので、ファイルを削除
23100        kill System$
23110        'ファイルを新しく作成
23120        open System$ for output as #1
23130        print #1,"config_r=1"
23140        close #1
23150        ui_msg "設定を変更しました"
23160        else
23170        kill System$
23180        if buf$ = "1" then
23190        open System$ for output as #1
23200        print #1,"config_r=0"
23210        close #1
23220        ui_msg "設定を変更しました"
23230        endif
23240        endif
23250        goto config_moji2:
23260 case 2:
23270       'トップ画面に飛ぶ
23280        goto TopScreen:
23290 case 3:
23300       'プログラムを終了する
23310       cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
23320 end select
23330 '単数変換
23340 Func Single_Complate(num)
23350 '1.出てきた数字から180を引く
23360 a = num - 180
23370 'a:10〜99
23380 Re1:
23390 if (a > 9 and a < 100) then
23400  b1 = fix(a / 10)
23410  b2 = 10 * a - b1
23420  d1 = b1 + b2
23430 if c > 9 then
23440  goto Re1:
23450 else
23460  c = d1:goto Re2:
23470 endif
23480 endif
23490 Re2:
23500 buffer = c
23510 endfunc buffer
23520 Func Surei_Result_Save_File()
23530 'ファイルがないとき
23540 if dir$(SAVE_DATA1$) = "" then
23550 open SAVE_DATA1$ for output as #1
23560 print #1,"入力文字:"+buffer_moji$+"数霊:"+str$(count)
23570 close #1
23580 ui_msg "保存しました":talk "保存しました":goto Surei_Result:
23590 else
23600 open SAVE_DATA1$ for append as #1
23610 print #1,"入力文字:" + buffer_moji$ + "数霊:" + str$(count)
23620 close #1
23630 ui_msg "保存しました":talk "保存しました":goto Surei_Result
23640 endif
23650 endfunc
23660 '言語設定
23670 Setting_Language:
23680 cls 3:gload Gazo$ + "Screen1.png":screen 1,1,1:No=2
23690 init "Kb:4"
23700 sp_on 1,1:sp_on 0,0
23710 sp_put 0,(0,200),0,0
23720 sp_put 1,(0,300),1,0
23730 color rgb(0,0,255)
23740 'print "番号を選んでください"+chr$(13)
23750 'if lang_flag=0 then
23760 'print "言語設定:日本語"+chr$(13)
23770 'else
23780 'print "言語設定:英 語"+chr$(13)
23790 Change_Language:
23800 if lang_flag = 1 then
23810 cls
23820 print "It has changed Language"+chr$(13)
23830 color rgb(255,255,255)
23840 print "Select the Number"+chr$(13)
23850 print " :1.English → Japanse"+chr$(13)
23860 print " :2.It goes to TopScreen"+chr$(13)
23870 print "Language:In English" +chr$(13)
23880 else
23890 cls
23900 print "設定変更(言語の変更)" + chr$(13)
23910 color rgb(255,255,255)
23920 print "番号を選んでください"+chr$(13)
23930 print " :1.日本語 → 英語に変更" + chr$(13)
23940 print " :2.トップ画面に戻る" + chr$(13)
23950 'print chr$(13)
23960 print "設定言語:日本語" + chr$(13)
23970 endif
23980 color rgb(0,0,0)
23990 locate 0,12:print "                                       ":locate 0,12:print "2.トップ画面に戻る　を選択" + chr$(13)
24000 Setting_Language_key:
24010 y=0:key$="":bg=0
24020 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y<> -1 and bg<> 1)
24030 y=stick(1)
24040 key$=inkey$
24050 bg=strig(1)
24060 pause 2
24070 wend
24080 '選択肢変更
24090 if ((y=1) or (y=-1)) then
24100 select case No
24110 case 2:
24120      '実装部分　ここから
24130      pause 200:No=1:sp_on 0,1:sp_on 1,0:locate 0,12:print "                                                         ":locate 0,12:print "1.日本語 → 英語に変更を選択": goto Setting_Language_key:
24140      '実装部分　ここまで
24150 case 1:
24160       pause 200: No=2:sp_on 0,0:sp_on 1,1:locate 0,12:print "                                                       ":locate 0,12:print "2.トップ画面に戻る を選択":goto Setting_Language_key:
24170 end select
24180 endif
24190 'Enter Key  決定ボタン
24200 if ((key$=chr$(13)) or (bg=1)) then
24210 select case No
24220 case 2:
24230         sp_on 0,0:sp_on 1,0:goto TopScreen:
24240 case 1:                                                     'lang_flag=1:sp_on 0,0:sp_on 1,0:goto Change_Language:
24250       '
24260 '未実装　ここから
24270  sp_on 0,1:sp_on 1,0:ui_msg "この機能は未実装です":goto Setting_Language_key:
24280 '未実装　ここまで
24290 end select
24300 endif
