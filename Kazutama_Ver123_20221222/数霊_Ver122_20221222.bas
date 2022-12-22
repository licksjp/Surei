100 '数霊(かずたま) 製作開始日:2021.07.28
110 'デバッグライン　ここから3:locate 1,12:print "15120 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
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
360 'Version 1.1.6_2022.11.12(Release):正式版
370 'Version 1.1.7_2022.11.16(Release):正式版
380 'Version 1.1.8_2022.11.23(Release):正式版
390 'Version 1.2.0_2022.11.30-2022.11.02(Release):正式版
400 'Version 1.2.1_2022.12.06-2022.12.10(Release):正式版
410 'Version 1.2.2_2022.12.17-2022.12.20(Release):正式版
420 '現在のバージョン
430 Version$ = "1.2.3_2022.12.22(正式版)"
440 'csvファイル 1.数霊 ベースファイル
450 FILE_csv$ = "data/Kazutama.csv"
460 'csvファイル 2.数霊 ベースファイル 2
470 FILE_csv2$ = "data/Surei_chart_20211207.csv"
480 'Save ファイル
490 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
500 'gazo ファイル
510 Gazo$ = "data/Gazo/"
520 'System フォルダ:設定ファイルを保存するところ
530 System$ = "System/config.sys"
540 '設定ファイル名:config.sys
550 'Sound File(Voice)
560 '1.ボイス TopScreen
570 Voice_File_TopScreen$ = "data/Sound_data/"
580 '変数領域
590 'vcount:バーチャルパッド下の変数
600 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50):c=1:vcount=0:timer=0
610 count2 = 0:N=0:N2=0:m2 = 0
620 dim list$(4),moji_List$(2)
630 'ファイルの有無チェック
640 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
650 '1.ファイルが無いとき
660 cls :print "依存ファイルが見つかりません":
670 print "エンターキーを押してください" + chr$(13)
680 key$ = input$(1)
690 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
700 else
710 '2.ファイルが有るとき
720 cls:print "csv:file ok." + chr$(13)
730 n=0
740 open FILE_csv$ for input as #1
750 while eof(1) = 0
760 input #1,line$
770 'print line$
780 bufline$(n) = line$
790 'Print n;chr$(13)
800 n = n + 1
810 wend
820 close #1
830 N=n
840 '2つ目のファイル読み込み
850 'n = 0
860 open FILE_csv2$ for input as #2
870 for n=3 to 181
880 for i=0 to 1
890 input #2,line$
900 bufline2$(n,i) = line$
910 next i
920 next n
930 close #2
940 N2 = n
950 '
960 endif
970 '設定ファイルの読み込み
980 'open System$ for input as #1
990 'line input #1,buf_line$
1000  'if len(buf_line$) = 10 then
1010   'if left$(buf_line$,9)="config_r=" then
1020   ' buf$ = right$(buf_line$,1)
1030    'if buf$ = "1" then
1040    '   buf_config_r = 1
1050   ' else
1060   '    buf_config_r = 0
1070   ' endif
1080  ' endif
1090 'endif
1100 'close #1
1110 'or j = 3 to 181+3
1120 'ufline3$(j - 3,n) = bufline2$(i,n)
1130 'next j
1140 'moji$ = Kotodama$(bufline3$(16))
1150 'erase bufline2$
1160 '2022.11.23----------------------
1170 '端末言語のチェック
1180 '日本語端末かチェックをして日本語以外なら英語で表示する
1190 'lang flag:0:日本語 1:英語(日本語以外)
1200 '--------------------------------
1210 lang_flag = 0
1220 if ex_info$(1) <> "JP" then
1230 lang_flag = 1
1240 endif
1250 'Top画面
1260 TopScreen:
1270 'バーチャルパッドを表示
1280 cls 3:font 48:screen 1,1,1:init"kb:4"
1290 'play ""
1300 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
1310 gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
1320 '選択肢 1
1330 gload Gazo$ + "Selection.png",1,5,200
1340 '選択肢 2
1350 gload Gazo$ + "Selection.png",1,5,300
1360 '選択肢 3
1370 gload Gazo$ + "Selection.png",1,5,400
1380 '選択肢 4
1390 gload Gazo$ + "Selection.png",1,5,500
1400 color rgb(0,0,255)
1410 print chr$(13)
1420 if lang_flag = 1 then
1430 color rgb(255,255,255)
1440 print "Select Number" + chr$(13)
1450 print " :1.Kazutama check" + chr$(13)
1460 print " :2.Setting" + chr$(13)
1470 print " :3.Help" + chr$(13)
1480 print " :4.End Program" + chr$(13)
1490 color rgb(255,255,255)
1500 else
1510 color rgb(255,255,255)
1520 print "番号を選んでください" + chr$(13)
1530 print " :1.数霊(かずたま)チェック" + chr$(13)
1540 print " :2.設定" + chr$(13)
1550 print " :3.ヘルプ" + chr$(13)
1560 print " :4.終　了" + chr$(13)
1570 color rgb(0,0,0)
1580 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
1590 'バーチャルパッドを表示
1600 No=1:
1610 'lang_flag:1 外国語,0:日本語
1620 if lang_flag = 1 then
1630 'lang_flag=1 英語
1640 else
1650 'lang_flag=0 日本語
1660 locate 0,12:color rgb(0,0,0):print "1.数霊(かずたま)チェックを選択";chr$(13)
1670 endif
1680 endif
1690 'スプライト
1700 '選択肢 1 On
1710 sp_def 0,(5,200),32,32
1720 sp_on 0,1
1730 sp_put 0,(5,200),0,0
1740 '選択肢 2 Off
1750 sp_def 1,(5,300),32,32
1760 sp_on 1,0
1770 sp_put 1,(5,300),0,0
1780 '選択肢 3 Off
1790 sp_def 2,(5,400),32,32
1800 sp_on 2,0
1810 sp_put 2,(5,400),0,0
1820 '選択肢 4 Off
1830 sp_def 3,(5,500),32,32
1840 sp_on 3,0
1850 sp_put 3,(5,500),0,0
1860 color rgb(0,0,0)
1870 Main_Select:
1880 'y:バーチャルパッドの処理
1890 'key$:カーソルの処理
1900 y = 0:key$ = "":bg = 0
1910 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
1920 y = stick(1)
1930 key$ = inkey$
1940 bg = strig(1)
1950 pause 2
1960 wend
1970 'if y=1 then
1980 'select case (No Mod 4)
1990 'ase 0:
2000 '     c=1:No=c:sp_on 0,1:sp_on 1,0 :sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print " 数霊(かずたま)チェックを選択":beep:goto Main_Select:
2010 'case 1:
2020 '       =2:No=c:sp_on 0,0:
2030 '"ase 2:
2040 'ase 3:
2050 'nd select
2060 'ndif
2070 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
2080 '1.バーチャルパッドの処理
2090 'バーチャルパッド下を押した時
2100 if y = 1 then
2110 select case No
2120 'No の初期値：No=1
2130 case 1:
2140 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":
2150 if lang_flag = 1 then
2160 'lang_flag=1 英語
2170 else
2180 'lang_flag=0 日本語
2190 locate 0,12:print "2.設定を選択":goto Main_Select:
2200 endif
2210 'デバッグライン　ここから
2220 '0のとき
2230 'デバッグライン　ここまで
2240 'デバッグライン　ここから
2250 'バーチャルパッド　下
2260 case 2:
2270 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:
2280 if lang_flag = 1 then
2290 else
2300 print "                                         ":
2310 color rgb(0,0,0):locate 0,12:
2320 print "3.ヘルプを選択":No=3:goto Main_Select:
2330 endif
2340 'cls:color rgb(255,255,255):print"ok"
2350 'デバッグライン　ここまで
2360 case 3:
2370 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                               "
2380 if lang_flag = 1 then
2390 else
2400 locate 0,12:print "4.終了を選択":No=0:goto Main_Select:
2410 endif
2420 'デバッグライン　ここから
2430 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
2440 'デバッグライン　ここまで
2450 case 0:
2460 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1
2470 if lang_flag = 1 then
2480 'lang_flag=1:英語
2490 else
2500 'lang_flag=0:日本語
2510 locate 0,12:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
2520 'endif
2530 endif
2540 'デバッグライン　ここから
2550 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
2560 'デバッグライン　ここまで
2570 end select
2580 endif
2590 'バーチャルパッド　上 ここから
2600 if y = -1 then
2610 select case No
2620 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
2630 case 1:
2640 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       "
2650 if lang_flag = 1 then
2660 'lang_flag=1 英語
2670 else
2680 'lang_flag=0 日本語
2690 locate 0,12:print "4.終了を選択":goto Main_Select:
2700 endif
2710 'endif
2720 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
2730 case 0:
2740 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":
2750 if lang_flag = 1 then
2760 '1:英語
2770 else
2780 '0:日本語
2790 locate 0,12:print "3.ヘルプを選択":goto Main_Select:
2800 endif
2810 'No:3 3.Help→2.設定 No:2
2820 case 3:
2830 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      "
2840 if lang_flag = 1 then
2850 '1:英語
2860 else
2870 '0:日本語
2880 locate 0,12:print"2.設定を選択":goto Main_Select:
2890 endif
2900 case 2:
2910 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":
2920 if lang_flag = 1 then
2930 'lang_flag 1 英語
2940 else
2950 'lang_flag 0 日本語
2960 locate 0,12:print"1.数霊(かずたま)チェックを選択":goto Main_Select:
2970 endif
2980 end select
2990 endif
3000 if bg=1 then
3010 select case No
3020 '1.数霊チェックを選択  パッドの右キー(決定)
3030 case 1:
3040 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
3050 '2.設定を選択  パッドの右キー(決定)
3060 case 2:
3070 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
3080 '3.ヘルプを選択 パッドの右(決定)
3090 case 3:
3100 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
3110 'プログラムの終了を選択(決定)
3120 case 0:
3130 cls 3:cls 4:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:
3140 if lang_flag = 1 then
3150 'lang_flag = 1 英語
3160 else
3170 'lang_flag = 0 日本語
3180 ui_msg "プログラムを終了します":color rgb(255,255,255):end
3190 endif
3200 end select
3210 '4.終了するを選択  パッドの右
3220 endif
3230 'バーチャルパッド　上　ここまで
3240 '2.カーソルの処理
3250 'カーソル　下 chr$(31)
3260 if (key$ = chr$(31)) then
3270 select case (No)
3280 '4
3290 '0 選択肢4 => 選択肢1
3300 case 0:
3310 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "              ":color rgb(0,0,0):
3320 if lang_flag = 1 then
3330 'lang flag:1 英語
3340 else
3350 'lang flag:0 日本語
3360 color rgb(0,0,0):locate 0,12:print "1.数霊(かずたま)チェックを選択":beep:goto Main_Select:
3370 endif
3380 '1 選択肢1 => 選択肢2
3390 case 1:
3400 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":
3410 if lang_flag = 1 then
3420 'lang_flag:1 英語
3430 else
3440 'lang_flag:0 日本語
3450 color rgb(0,0,0):locate 0,12:print "2.設定を選択":beep:goto Main_Select:
3460 endif
3470 '2 選択肢2 => 選択肢3
3480 case 2:
3490 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "               ":
3500 if lang_flag = 1 then
3510 'lang flag:1 英語
3520 else
3530 'lang flang:0 日本語
3540 color rgb(0,0,0):locate 0,12:print "3.ヘルプを選択":beep:goto Main_Select:
3550 endif
3560 '3 選択肢３ => 選択肢4
3570 case 3:
3580 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "               ":color rgb(0,0,0)
3590 if lang_flag = 1 then
3600 'lang_flag = 1 英語
3610 else
3620 'lang_flag = 0 日本語
3630 color rgb(0,0,0):locate 0,12:print "4.終 了を選択":beep:goto Main_Select:
3640 endif
3650 case else:
3660 goto Main_Select:
3670 end select
3680 endif
3690 'カーソル　上
3700 if key$=chr$(30) then
3710 select case (No)
3720 '選択肢1 => 選択肢4
3730 case 1:
3740 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:PRINT "                      ":
3750 if lang_flag = 1 then
3760 'lang_flag=1:英語
3770 else
3780 'lang_flag = 0:日本語
3790 else
3800 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
3810 endif
3820 '選択肢2 => 選択肢1
3830 case 2:
3840 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                 ":locate 1,12:beep:print "2.設 定を選択":beep:goto Main_Select:
3850 '選択肢3　=> 選択肢2
3860 case 3:
3870 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0
3880 if lang_flag = 1 then
3890 'lang_flag = 1:英語
3900 else
3910 'lang_flag = 0:日本語
3920 locate 0,12:beep:print "3.ヘルプを選択":goto Main_Select:
3930 endif
3940 '選択肢4 => 選択肢3
3950 case 0:
3960 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 1,12:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
3970 if lang_flag = 1 then
3980 'lang flag=1 英語
3990 else
4000 'lang flag=0 日本語
4010 locate 1,12:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
4020 endif
4030 end select
4040 endif
4050 'Input "番号:",No
4060 'エンターキー入力:決定
4070 if key$ = chr$(13) then
4080 select case No
4090 case 1:
4100 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4110 case 3:
4120 Color rgb(255,255,255):goto Help:
4130 case 0:
4140 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
4150 case 2:
4160 color rgb(255,255,255):goto Setting:
4170 'else
4180 'goto Main_Select:
4190 end select
4200 endif
4210 'ndif
4220 'if N0=0 or No>4 then goto TopScreen:
4230 '1-1.数霊チェック
4240 Surei_Check:
4250 cls 3:Font 48:
4260 'gload Gazo$ + "Screen4.png"
4270 gload Gazo$ + "Screen1_Sureicheck_Top20211226.png"
4280 play ""
4290 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
4300 color rgb(255,0,0)
4310 'print "●数霊(かずたま)チェックトップ" + chr$(13)
4320 sp_on 0,1:sp_put 0,(5,200),0,0:screen 1,1,1
4330 if lang_flag = 1 then
4340 'lang_flag=1 英語
4350 else
4360 'lang_flag=0 日本語
4370 print chr$(13)
4380 color rgb(255,255,255)
4390 print "番号を選んでください" + chr$(13)
4400 print " :1.数霊(かずたま)1人用" + chr$(13)
4410 print " :2.数霊(かずたま)2人用" + chr$(13)
4420 print " :3.前の画面に戻る" + chr$(13)
4430 print " :4.終 了" + chr$(13)
4440 color rgb(0,0,0):No = 1
4450 locate 0,12
4460 print "1.数霊1人用を選択"
4470 endif
4480 Kazutama_main:
4490 'y:バーチャルパッドの処理
4500 'key$:カーソルの処理
4510 'bg:バーチャルパッドの右のボタン
4520 y = 0:key$ = "":bg=0
4530 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
4540 y = stick(1)
4550 key$ = inkey$
4560 bg=strig(1)
4570 pause 2
4580 wend
4590 'key$ = input$(1)
4600 if y = 1 then
4610 select case No
4620 'No の初期値：No=1
4630 case 1:
4640 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":
4650 if lang_flag=1 then
4660 else
4670 locate 0,12
4680 print"2.数霊(かずたま)2人用を選択":goto Kazutama_main:
4690 endif
4700 'デバッグライン　ここから
4710 '0のとき
4720 'デバッグライン　ここまで
4730 'デバッグライン　ここから
4740 case 2:
4750 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                               "
4760 color rgb(0,0,0):locate 1,12:print "3.前の画面に戻るを選択":No=3:goto Kazutama_main:
4770 'cls:color rgb(255,255,255):print"ok"
4780 'デバッグライン　ここまで
4790 case 3:
4800 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Kazutama_main:
4810 'デバッグライン　ここから
4820 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
4830 'デバッグライン　ここまで
4840 case 0:
4850 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.数霊(かずたま)1人用を選択":goto Surei_Input:
4860 'デバッグライン　ここから
4870 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
4880 'デバッグライン　ここまで
4890 end select
4900 endif
4910 'バーチャルパッド　上 ここから
4920 if y = -1 then
4930 select case No
4940 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
4950 case 1:
4960 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択":goto Kazutama_main:
4970 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
4980 case 0:
4990 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.ヘルプを選択":goto Kazutama_main:
5000 'No:3 3.Help→2.設定 No:2
5010 case 3:
5020 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.設定を選択":goto Kazutama_main:
5030 case 2:
5040 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.数霊(かずたま)チェックを選択":goto Kazutama_main:
5050 end select
5060 endif
5070 if bg=1 then
5080 select case No
5090 '1.数霊チェックを選択  パッドの右キー
5100 case 1:
5110 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
5120 '2.設定を選択    パッドの右キー
5130 case 2:
5140 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
5150 '3.ヘルプを選択 パッドの右
5160 case 3:
5170 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
5180 'プログラムの終了を選択
5190 case 0:
5200 cls 3:cls 4:ui_msg "プログラムを終了します":color rgb(255,255,255):end
5210 end select
5220 '4.終了するを選択  パッドの右
5230 endif
5240 'バーチャルパッド　上　ここまで
5250 if key$ = chr$(31) then
5260 select case No
5270 case 0:
5280 No=1:sp_on 0,0:sp_on 1,1:sp_put 0,(5,300),0,0:locate 1,12:print "                                                          ":
5290 if lang_flag = 1 then
5300 Else
5310 No=2:locate 0,12:print "2.数霊(かずたま)2人用を選択":goto Kazutama_main:
5320 endif
5330 case 1:
5340 No=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                                          ":
5350 if lang_flag = 1 then
5360 Else
5370 locate 1,12:print"3.前の画面に戻るを選択":goto Kazutama_main:
5380 endif
5390 case 2:
5400 No=3:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print"                                       ":
5410 if lang_flag = 1 then
5420 Else
5430 locate 1,12:print"4.終了を選択":goto Kazutama_main:
5440 endif
5450 case 3:
5460 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":
5470 if lang_flag = 1 then
5480 Else
5490 No=1:locate 1,12:print"1.数霊（かずたま)1人用を選択":goto Kazutama_main:
5500 endif
5510 end select
5520 endif
5530 if key$=chr$(13) then
5540 select case No
5550 case 1:
5560 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
5570 case 2:
5580 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
5590 case 3:
5600 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
5610 case 0:
5620 cls 4:cls 3:talk"プログラムを終了します":ui_text"プログラムを終了します":end
5630 end select
5640 endif
5650 'Input "番号:",No
5660 '前の画面に戻る
5670 'if No = 3 then goto TopScreen:
5680 'プログラムの終了
5690 'if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":COLOR rgb(255,255,255):end
5700 '1人用
5710 'if No = 1 then goto Surei_Input:
5720 '2人用
5730 'if No = 2 then goto Surei_twoParson:
5740 'if No > 4 or No=0 then ui_msg"もう一度入れてください":goto Surei_Check:
5750 '数霊(かずたま) 文字入力  1人用
5760 Surei_Input:
5770 if mode = 0 then
5780 cls 3:font 32:init"kb:2"
5790 gload Gazo$ + "InputKotodama_20211226.png"
5800 play""
5810 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
5820 color rgb(255,0,0)
5830 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
5840 if lang_flag=1 then
5850 '英語
5860 else
5870 print chr$(13)
5880 color rgb(0,0,0)
5890 print "文字を入れてください" + chr$(13)
5900 color rgb(255,0,0)
5910 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
5920 print chr$(13)
5930 color rgb(0,0,0)
5940 Input "入力文字:",buffer_moji$
5950 if buffer_moji$ = "" then
5960 ui_msg "未入力です":goto Surei_Input:
5970 'endif
5980 else
5990 goto Surei_Result:
6000 endif
6010 endif
6020 endif
6030 'else
6040 if mode = 1 then
6050 cls 3:Font 32:
6060 gload Gazo$ + "InputKotodama.png"
6070 color rgb(255,0,0)
6080 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
6090 color rgb(255,255,255)
6100 print "文字を入れてください" + chr$(13)
6110 color rgb(255,0,0)
6120 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
6130 print "大文字のみ)" + chr$(13)
6140 color rgb(0,0,0)
6150 Input "文字入力:",buffer_moji2$
6160 goto Surei_Result3:
6170 'endif
6180 endif
6190 '数霊(かずたま)文字入力　2人用
6200 Surei_twoParson:
6210 cls 3:Font 32:init"kb:2"
6220 gload Gazo$ + "InputKotodama_20211226.png"
6230 '1人目入力
6240 if lang_flag = 1 then
6250 'color rgb(255,0,0)
6260 else
6270 print ""+chr$(13)
6280 'print "●数霊(かずたま) 1人目 入力" + chr$(13)
6290 color rgb(255,0,0)
6300 print "1人目の文字を入れてください" + chr$(13)
6310 color rgb(255,0,0)
6320 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
6330 color rgb(0,0,0)
6340 print chr$(13)
6350 Input "1人目文字入力:",buf_Parson1$
6360 endif
6370 Surei_twoParson2:
6380 cls 3:Font 32:init"kb:2"
6390 '2人目入力
6400 gload Gazo$ + "InputKotodama_20211226.png"
6410 'color rgb(255,0,0)
6420 'print "●数霊(かずたま) 2人目 入力" + chr$(13)
6430 if lang_falg = 1 then
6440 else
6450 print ""+chr$(13)
6460 print "2人目の文字を入れてください" + chr$(13)
6470 color rgb(255,0,0)
6480 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
6490 color rgb(0,0,0)
6500 Input "2人目の文字入力:",buf_Parson2$
6510 goto Surei_Result2:
6520 endif
6530 '数霊　計算 パート
6540 '文字の計算関数
6550 'moji$:1文字を入れる
6560 func Complate(moji$)
6570 for n = 1 to 116
6580 if moji$ = bufline$(2*n) then
6590 buffcount = val(bufline$(2 * n + 1))
6600 endif
6610 next n
6620 endfunc buffcount
6630 '数霊　結果表示
6640 Surei_Result:
6650 cls 3:Font 32
6660 'ゼロカウント:zcount
6670 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
6680 '例 アカい:"い"の文字は無効な文字なので、はじく
6690 zcount=0
6700 'mojicount:入力文字数
6710 mojicount = len(buffer_moji$)
6720 for n=1 to mojicount
6730 for j=1 to 118
6740 if (bufcount$(n - 1) = bufline$(2 * j)) then
6750   bufcount$(n-1) = Mid$(buffer_moji$,n,1)
6760 endif
6770 next j
6780 next n
6790 'if mojicount > zcount then
6800 'cls 3:ui_msg "無効な文字です":talk "無効な文字があります。":zcount = 0:goto Surei_Input:
6810 ncount=0:count=0
6820    for i = 1 to mojicount
6830     bufcount$(i-1)=Mid$(buffer_moji$,i,1)
6840   'ンのカウント
6850    if bufcount$(i-1) = "ン" then ncount = ncount + 1
6860     'bufcount$(i-1)=Mid$(buffer_moji$,i,1)
6870    next i
6880    if (ncount > 0) then
6890    'Listを表示する
6900    moji_List$(0) = "この単語は目に見える物です"
6910    moji_List$(1) = "この単語は目に見えない物です"
6920    num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
6930    if num2 = 0 then n1 = n1 + 1
6940    if num2 = 1 then n1 = n1 + 9 * ncount
6950    endif
6960 'else
6970    for j=1 to mojicount
6980    bufcount$(j-1) = Mid$(buffer_moji$,j,1)
6990    n1 = Complate(bufcount$(j - 1))
7000    'count = count + n1:count2 = count
7010 'endif
7020    count = count + n1:count2 = count
7030    next j
7040 if (ncount > 0) then count = count
7050 '182以上のとき,181を引く
7060 if buf_cofig_r = 0 then
7070      if (count > 181) then
7080 'if buf_config_r = 0 then
7090         count = count - 181
7100 'else
7110 'if buf_config_r = 1 then
7120 '   count=Single_Complate(count2)
7130 'endif
7140      else
7150      if (buf_config_r = 1) then
7160        'count2 = count - 180
7170        buf_count = Single_Complate(count)
7180      endif
7190 endif
7200 endif
7210 'if config_r = 0 then
7220 cls 3:Font 48+16
7230 gload Gazo$ + "Result_Screen3_20211226.png"
7240 if buf_config_r = 1 then
7250    print "入力文字:" + buffer_moji$ + chr$(13)
7260    print "数霊(かずたま):";buf_count;chr$(13)
7270 endif
7280 if lang_flag = 1 then
7290 else
7300 color rgb(255,0,0)
7310 print "入力文字:" + buffer_moji$ + chr$(13)
7320 endif
7330 'print chr$(13)
7340 if lang_flag = 1 then
7350 else
7360 color rgb(0,0,255)
7370 print "数霊(かずたま):";count;chr$(13)
7380 endif
7390 if lang_flag = 1 then
7400 else
7410 color rgb(0,0,0)
7420 print "エンターキー:トップ" + chr$(13)
7430 print "スペース:次 へ" + chr$(13)
7440 'endif
7450 endif
7460 key$ = input$(1)
7470 if key$ = " " then goto Surei_Result4:
7480 if key$ = chr$(13) then
7490 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
7500 for i=0 to 9
7510 bufcount$(i) = " "
7520 next i
7530 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
7540 'else
7550 'if key$ = " " then
7560 '２回めの入力に行く
7570 'mode = 1:goto Surei_Input:
7580 'else
7590 'if key$ = "s" or key$ = "S" then
7600 'ファイルを保存する
7610 's = Save()
7620 'ui_msg"保存しました"
7630 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
7640 else
7650 goto Surei_Result:
7660 'endif
7670 endif
7680 '3-1 バージョン情報
7690 Version:
7700 cls 3:Font 32
7710 gload Gazo$ + "Screen1_Version.png"
7720 play ""
7730 play Voice_File_TopScreen$ + "Voice_Version.mp3"
7740 color rgb(255,0,0)
7750 'print"●バージョン情報"+chr$(13)
7760 print chr$(13)
7770 color rgb(255,255,255)
7780 if lang_flag = 1 then
7790 else
7800 print "Ver:";Version$ + chr$(13)
7810 print "アプリ名:数霊"+ chr$(13)
7820 print "Basic for Android Runtime" + chr$(13)
7830 print "Author:licksjp" + chr$(13)
7840 print "制作開始:2021.7.28" + chr$(13)
7850 print chr$(13)
7860 print "(C)Copy right licksjp " + chr$(13)
7870 print "All rights reserved" + chr$(13)
7880 color rgb(0,0,0)
7890 print "パッドの右を押してください" + chr$(13)
7900 endif
7910 'key$ = input$(1)
7920 bg=0:key$=""
7930 while (bg <> 1 and key$ <> chr$(13))
7940 bg = strig(1)
7950 key$ = inkey$
7960 pause 2
7970 wend
7980 if key$ = chr$(13) then
7990 goto TopScreen:
8000 'else
8010 'talk "無効なキーです":goto Version:
8020 else
8030 if bg=1 then
8040 goto TopScreen:
8050 else
8060 if lang_flag = 1 then
8070 else
8080 talk "無効なキーです":goto Version:
8090 endif
8100 endif
8110 endif
8120 '3-2 参考文献
8130 Reference_Book:
8140 cls 3:Font 48:play""
8150 gload Gazo$ + "Screen1_Reference.png"
8160 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
8170 color rgb(255,0,0)
8180 'print"●参考文献" + chr$(13)
8190 print chr$(13)
8200 if lang_flag = 1 then
8210 else
8220 color rgb(255,255,255)
8230 print "書名:数霊" + chr$(13)
8240 print "出版社:徳間書店" + chr$(13)
8250 print "ISBN:978-4-19-" + chr$(13)
8260 print "         865309-5" + chr$(13)
8270 print "定価:2300円 + 税" + chr$(13)
8280 color rgb(0,0,0)
8290 print "パッドの右を押してください"
8300 endif
8310 bg = 0:key$ = ""
8320 while (bg <> 1 and key$ <> chr$(13))
8330 bg = strig(1)
8340 key$ = inkey$
8350 pause 2
8360 wend
8370 if key$ = chr$(13) then
8380 goto TopScreen:
8390 'else
8400 'talk "無効なキーです":goto Reference_Book:
8410 else
8420 if bg = 1 then
8430 goto TopScreen:
8440 else
8450 talk "無効なキーです":goto Reference_Book:
8460 endif
8470 endif
8480 'key$=input$(1)
8490 'if key$=chr$(13) then
8500 'goto TopScreen:
8510 'else
8520 'talk"無効なキーです":goto Reference_Book:
8530 'endif
8540 'ヘルプ画面　トップ画面
8550 Help:
8560 No=1:c=0
8570 play ""
8580 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
8590 cls 3:Font 48:
8600 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
8610 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0
8620 color rgb(255,0,0)
8630 'print "●3.ヘルプ　トップ画面" + chr$(13)
8640 print chr$(13)
8650 color rgb(255,255,255)
8660 print "番号を選んでください" + chr$(13)
8670 print " :1.バージョン" + chr$(13)
8680 print " :2.参考文献" + chr$(13)
8690 print " :3.トップ画面" + chr$(13)
8700 print " :4.終 了" + chr$(13)
8710 color rgb(0,0,0)
8720 if No = 1 then print " バージョンを選択"
8730 'y:バーチャルパッドの処理
8740 'key$:カーソルの処理
8750 'bg:バーチャルパッドの右ボタン
8760 Help_key:
8770 y = 0:key$ = "":bg=0
8780 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
8790 y = stick(1)
8800 key$ = inkey$
8810 bg=strig(1)
8820 pause 2
8830 wend
8840 'バーチャルパッド　ここから'
8850 if y = 1 then
8860 select case No
8870 'No の初期値：No=1
8880 case 1:
8890 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.参考文献を選択":goto Help_key:
8900 if lang_flag = 1 then
8910 else
8920 locate 1,12:print"2.参考文献を選択":goto Help_key:
8930 endif
8940 'デバッグライン　ここから
8950 '0のとき
8960 'デバッグライン　ここまで
8970 'デバッグライン　ここから
8980 case 2:
8990 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 1,12:print "                  "
9000 color rgb(0,0,0):locate 1,12:print "3.トップ画面に行くを選択":No=3:goto Help_key:
9010 'cls:color rgb(255,255,255):print"ok"
9020 'デバッグライン　ここまで
9030 case 3:
9040 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print "                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Help_key:
9050 'デバッグライン　ここから
9060 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
9070 'デバッグライン　ここまで
9080 case 0:
9090 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.バージョンを選択":goto Help_key:
9100 'デバッグライン　ここから
9110 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
9120 'デバッグライン　ここまで
9130 end select
9140 endif
9150 'バーチャルパッド　上 ここから
9160 if y = -1 then
9170 select case No
9180 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
9190 case 1:
9200 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Kazutama_main:
9210 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
9220 case 0:
9230 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面に行くを選択":goto Kazutama_main:
9240 'No:3 3.Help→2.設定 No:2
9250 case 3:
9260 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.参考文献を選択":goto Kazutama_main:
9270 case 2:
9280 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.バージョンを選択":goto Kazutama_main:
9290 end select
9300 endif
9310 if bg = 1 then
9320 select case No
9330 '1.数霊チェックを選択  パッドの右キー
9340 case 1:
9350 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
9360 '2.設定を選択    パッドの右キー
9370 case 2:
9380 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
9390 '3.ヘルプを選択 パッドの右
9400 case 3:
9410 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
9420 'プログラムの終了を選択
9430 case 0:
9440 cls 3:cls 4:color rgb(255,255,255):end
9450 if lang_flag = 1 then
9460 'lang_flag = 1:英語
9470 Else
9480 'lang_flag = 0:日本語
9490 print "プログラムを終了します"
9500 endif
9510 end select
9520 '4.終了するを選択  パッドの右
9530 endif
9540 'バーチャルパッド　上　ここまで
9550 'バーチャルパッド　ここまで'
9560 'key$ = input$(1)
9570 'カーソルの下
9580 if key$ = chr$(31) then
9590 select case (No Mod 4)
9600 'バージョンから参考文献
9610 case 0:
9620 c=1:No=c:locate 0,12:Print "             ":locate 0,12:print " 参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
9630 '参考文献からトップ画面
9640 case 1:
9650 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "            ":locate 0,12:print " トップ画面を選択":goto Help_key:
9660 'トップ画面から終了
9670 case 2:
9680 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 0,12:print " 終 了を選択":goto Help_key:
9690 '終了からバージョン
9700 case 3:
9710 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                     ":locate 0,12:print " バージョンを選択":goto Help_key:
9720 case else:
9730 goto Help_key:
9740 end select
9750 endif
9760 'カーソル　上
9770 if key$ = chr$(30) then
9780 select case (c Mod 4)
9790 'バージョンから終了
9800 case 0:
9810 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:locate 0,12:print "                   ":locate 0,12:print " 終 了を選択":goto Help_key:
9820 '参考文献からバージョン
9830 case 1:
9840 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                   ":locate 0,12:print " バージョンを選択":goto Help_key:
9850 'トップ画面から参考文献
9860 case 2:
9870 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":locate 0,12:print " 参考文献を選択":goto Help_key:
9880 '終了からトップ画面を選択
9890 case 3:
9900 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print"                      ":locate 0,12:print " トップ画面を選択":goto Help_key:
9910 case else:
9920 goto Help_key:
9930 end select
9940 endif
9950 'Input "番号:",No
9960 'sp_def 0,(5,200),32,32
9970 'エンターキー：決定
9980 if key$=chr$(13) then
9990 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10000 if No=3 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10010 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10020 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg "プログラムを終了します":cls 3:cls 4:end
10030 else
10040 goto Help_key:
10050 endif
10060 'if (No = 0 or No > 4) then ui_msg "もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
10070 '登録文字の確認
10080 '文字を1文字入れて登録されているか調べるメニュー
10090 '設定項目
10100 Setting:
10110 cls 3:Font 48
10120 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
10130 play ""
10140 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
10150 No=1
10160 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
10170 color rgb(0,0,255)
10180 'print "●設定項目" + chr$(13)
10190 print chr$(13)
10200 if lang_flag = 1 then
10210 'lang_flag = 1:英語
10220 else
10230 'lang_flag = 0:日本語
10240 color rgb(255,255,255)
10250 print "番号を選んでください" + chr$(13)
10260 '-------コメント----------------
10270 'print " :1.登録文字の確認" + chr$(13)
10280 'print " :2.数霊文字確認" + chr$(13)
10290 '-------コメント----------------
10300 print " :1.文字の項目" + chr$(13)
10310 print " :2.結果表示設定" + chr$(13)
10320 print " :3.トップ画面に行く" + chr$(13)
10330 print " :4.終 了" + chr$(13)
10340 endif
10350 color rgb(0,0,0)
10360 locate 1,12
10370 if No=1 then print "1.文字の項目を選択"
10380 'y:バーチャルパッドの処理
10390 'key$:カーソルの処理
10400 'bg:バーチャルパッドの右ボタン
10410 SettingScreen:
10420 y = 0:key$ = "":bg=0
10430 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
10440 y = stick(1)
10450 key$ = inkey$
10460 bg=strig(1)
10470 pause 2
10480 wend
10490 'バーチャルパッド　ここから'
10500 'バーチャルパッド　ここから'
10510 if y = 1 then
10520 select case No
10530 'No の初期値：No=1
10540 case 1:
10550 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":color rgb(0,0,0):locate 1,12:print "2.結果表示設定を選択":goto SettingScreen:
10560 'デバッグライン　ここから
10570 '0のとき
10580 'デバッグライン　ここまで
10590 'デバッグライン　ここから
10600 case 2:
10610 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                         "
10620 color rgb(0,0,0)::No=3
10630 if lang_flag = 1 then
10640 else
10650 locate 1,12:print "3.トップ画面に行くを選択":goto SettingScreen:
10660 endif
10670 'cls:color rgb(255,255,255):print"ok"
10680 'デバッグライン　ここまで
10690 case 3:
10700 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                              ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
10710 'デバッグライン　ここから
10720 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
10730 'デバッグライン　ここまで
10740 case 0:
10750 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.文字の項目を選択":goto SettingScreen:
10760 'デバッグライン　ここから
10770 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
10780 'デバッグライン　ここまで
10790 end select
10800 endif
10810 'バーチャルパッド　上 ここから
10820 if y = -1 then
10830 select case No
10840 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
10850 case 1:
10860 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択":goto SettingScreen:
10870 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
10880 case 0:
10890 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
10900 'No:3 3.Help→2.設定 No:2
10910 case 3:
10920 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.結果表示設定を選択":goto SettingScreen:
10930 case 2:
10940 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.文字の項目を選択":goto SettingScreen:
10950 end select
10960 endif
10970 if bg=1 then
10980 select case No
10990 '1.数霊チェックを選択  パッドの右キー
11000 case 1:
11010 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
11020 '2.設定を選択    パッドの右キー
11030 case 2:
11040 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
11050 '3.ヘルプを選択 パッドの右
11060 case 3:
11070 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
11080 'プログラムの終了を選択
11090 case 0:
11100 cls 3:cls 4::color rgb(255,255,255):pause 2.052*1000:end
11110 if lang_flag = 1 then
11120 Else
11130 ui_msg "プログラムを終了します"
11140 endif
11150 end select
11160 endif
11170 '4.終了するを選択  パッドの右
11180 'バーチャルパッド　ここまで'
11190 'SettingScreen:
11200 'key$ = input$(1)
11210 'カーソル下'
11220 if key$ = chr$(31) then
11230 select case (No Mod 4)
11240 '登録文字から数霊文字の確認
11250 case 1:
11260 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                     ":locate 1,12:print "2.結果表示設定を選択":goto SettingScreen:
11270 '数霊文字の確認からトップ画面に行く
11280 case 2:
11290 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
11300 'トップ画面に行くから終了
11310 case 3:
11320 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
11330 '終了から登録文字
11340 case 0:
11350 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print "1.文字の項目を選択":goto SettingScreen:
11360 end select
11370 endif
11380 'カーソル　上
11390 if key$ = chr$(30) then
11400 select case (No Mod 4)
11410 case 1:
11420 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
11430 case 2:
11440 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
11450 case 3:
11460 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
11470 case 0:
11480 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
11490 end select
11500 endif
11510 'エンターキーを押したとき
11520 if key$ = chr$(13) then
11530 if No=3 then goto TopScreen:
11540 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
11550 'if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji1:
11560 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
11570 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:color rgb(255,255,255):pause 3*120:end
11580 'lse
11590 'o'o SettingScreen:
11600 endif
11610 'endif
11620 'endif
11630 '文字検索項目  ここから
11640 Moji_Search:
11650 cls 4:cls 3:Font 32+16:init"kb:2"
11660 gload Gazo$ + "Moji_Search_Result.png"
11670 play ""
11680 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
11690 print "" + chr$(13)
11700 color rgb(255,0,0)
11710 if lang_flag = 1 then
11720 Else
11730 print "文字を一文字入れてください" + chr$(13)
11740 endif
11750 color rgb(0,0,0)
11760 if lang_flag=1 then
11770 Else
11780 Input "登録文字:",moji$
11790 endif
11800 moji_count = len(moji$)
11810 if moji_count > 1 then
11820 if lang_flag = 1 then
11830 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
11840 Else
11850 endif
11860 else
11870 count=0
11880 for n = 0 to 116
11890 if bufline$(2*n) = moji$ then
11900 cls 3:font 48:init"kb:4"
11910 gload Gazo$ + "Moji_Search_Result.png"
11920 'talk"この文字は登録されています"
11930 play ""
11940 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
11950 if lang_flag = 1 then
11960 Else
11970 print chr$(13)
11980 color rgb(255,0,0)
11990 print moji$;"は、登録されています。" + chr$(13)
12000 color rgb(0,0,0)
12010 print "エンターキーを押してください"
12020 endif
12030 bg = 0:key$ = ""
12040 while (bg <> 1 and key$ <> chr$(13))
12050 key$ = inkey$
12060 bg = strig(1)
12070 pause 2
12080 wend
12090 'y$=input$(1)
12100 if key$ = chr$(13) then goto TopScreen:
12110 if bg=1 then goto TopScreen:
12120 count = count + 1
12130 endif
12140 next n
12150 if count = 0 then
12160 cls 3:font 48:init "kb:2"
12170 gload Gazo$ + "Moji_check.png"
12180 play ""
12190 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
12200 print chr$(13)
12210 if lang_flag = 1 then
12220 Else
12230 color rgb(255,0,0)
12240 print moji$;"は、登録されていません。" + chr$(13)
12250 color rgb(0,0,0)
12260 print "パッドの右を押してください" + chr$(13)
12270 endif
12280 kg = 0:key$ = ""
12290 while (kg <> 1 and key$ <> chr$(13))
12300 key$ = inkey$
12310 kg = strig(1)
12320 pause 2
12330 wend
12340 if key$ = chr$(13) then goto TopScreen:
12350 endif
12360 endif
12370 Surei_Result2:
12380 cls 3:Font 48
12390 zcount1=0:zcount2=0:count1=0:count2=0
12400 '1人目
12410 mojicount1=len(buf_Parson1$)
12420 '2人目
12430 mojicount2 = len(buf_Parson2$)
12440 '1人目
12450 for n = 1 to mojicount1
12460 for j = 1 to 116
12470 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
12480 if bufcount1$(n-1) = bufline$(2*j) then
12490 zcount1 = zcount1 + 1
12500 endif
12510 next j
12520 next n
12530 '2人目
12540 for n = 1 to mojicount2
12550 for j = 1 to 116
12560 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
12570 if bufcount2$(n-1) = bufline$(2*j) then
12580 zount2 = zcount2 + 1
12590 endif
12600 next j
12610 next n
12620 '1人目
12630 for i=1 to mojicount1
12640 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
12650 p1 = Complate(bufcount1$(i-1))
12660 count1 = count1 + p1
12670 next i
12680 '2人目
12690 for i = 1 to mojicount2
12700 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
12710 p2 = Complate(bufcount2$(i-1))
12720 count2 = count2 + p2
12730 next i
12740 cls 3:
12750 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
12760 color rgb(255,0,0)
12770 'print "数霊 2人用 結果表示"+chr$(13)
12780 print ""+chr$(13)
12790 if lang_flag = 1 then
12800 else
12810 color rgb(255,255,255)
12820 print "1人目:";buf_Parson1$;chr$(13)
12830 print "数霊1:";count1;chr$(13)
12840 print "2人目:";buf_Parson2$;chr$(13)
12850 print "数霊2:";count2;chr$(13)
12860 print "数霊(合計):";count1 + count2;chr$(13)
12870 color rgb(0,0,0)
12880 print "エンターキーを押してください" + chr$(13)
12890 endif
12900 key$ = "":bg = 0
12910 'ey$=input$(1)
12920 while (bg <> 1 and key$ <> chr$(13))
12930 bg = strig(1)
12940 key$ = inkey$
12950 pause 2
12960 wend
12970 if (bg = 1 or key$ = chr$(13))  then goto TopScreen:
12980 Surei_Result3:
12990 cls 3:Font 48
13000 zcount2 = 0:count2 = 0
13010 mojicount2 = len(buffer_moji2$)
13020 for n = 1 to mojicount2
13030 for j = 1 to 116
13040 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
13050 if bufcount2$(n - 1) = bufline$(2 * j) then
13060 zcount2 = zcount2 + 1
13070 endif
13080 next j
13090 next n
13100 for i = 1 to mojicount2
13110 n2 = Complate(bufcount2$(i-1))
13120 count2 = count2 + n2
13130 next i
13140 gload Gazo$ + "Screen5.png"
13150 if lang_flag = 1 then
13160 else
13170 color rgb(255,0,0)
13180 print "数霊の結果表示" + chr$(13)
13190 color rgb(255,255,255)
13200 print "１回目回の文字入力:";buffer_moji$;chr$(13)
13210 print "１回目の数霊(かずたま)";count;chr$(13)
13220 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
13230 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
13240 color rgb(0,0,0)
13250 print "エンターキー:トップ画面";chr$(13)
13260 print "c or C キー:数霊の比較";chr$(13)
13270 endif
13280 key$ = "":bg = 0
13290 while (key$ <> chr$(13) and bg <> 1)
13300 bg = strig(1)
13310 key$ = inkey$
13320 pause 2
13330 wend
13340 'key$ = input$(1)
13350 if bg = 1 then goto TopScreen:
13360 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
13370 if key$ = "c" or key$ = "C" then
13380 if count = count2 then
13390 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
13400 else
13410 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
13420 endif
13430 endif
13440 Moji_Count_Check:
13450 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
13460 cls 3:Font 48
13470 gload Gazo$ + "Moji_check.png"
13480 n = 0
13490 open FILE_csv$ for input as #1
13500 while eof(1) = 0
13510 line input #1, line$
13520 n = n + 1
13530 wend
13540 close #1
13550 'n = n - 1
13560 'talk "登録文字数は"+str$(n)+"文字です"
13570 play ""
13580 if n = 118 then
13590 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
13600 if lang_flag = 1 then
13610 else
13620 'talk "登録文字数は、" + str$(n) + "文字です"
13630 print "" + chr$(13)
13640 color rgb(255,0,0)
13650 print "文字の登録文字数は";n;"文字" + chr$(13)
13660 color rgb(0,0,0)
13670 print "パッドの右を押してください" + chr$(13)
13680 endif
13690 endif
13700 'key$ = input$(1)
13710 key$ = "":bg = 0
13720 while (key$ <> chr$(13) and bg <> 1)
13730 key$=inkey$
13740 bg=strig(1)
13750 pause 2
13760 wend
13770 if bg = 1 then goto TopScreen:
13780 if key$ = chr$(13) then
13790 goto TopScreen:
13800 else
13810 goto Moji_Count_Check:
13820 endif
13830 'Save 関数
13840 file_kazutama = 0
13850 file_kazutama = Save_File()
13860 func Save_File()
13870 open SAVE_DATA1$  for output as #1
13880 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
13890 close #1
13900 endfunc
13910 Select_moji:
13920 cls 3:font 48:No = 1
13930 gload Gazo$ + "Screen1_mojicheck.png"
13940 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
13950 color rgb(255,0,0)
13960 'print "文字の確認" + chr$(13)
13970 if lang_flag = 1 then
13980 else
13990 print chr$(13)
14000 color rgb(255,255,255)
14010 print "番号を選んでください" + chr$(13)
14020 print " :1.登録文字検索"+ chr$(13)
14030 print " :2.登録文字数の確認" + chr$(13)
14040 print " :3.前の画面に戻る" + chr$(13)
14050 print " :4.終　了" + chr$(13)
14060 color rgb(0,0,0)
14070 if No = 1 then print "1.登録文字の確認を選択"
14080 endif
14090 Entry_check_key:
14100 y = 0:key$ = "":bg=0
14110 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
14120 y = stick(1)
14130 key$ = inkey$
14140 bg=strig(1)
14150 pause 2
14160 wend
14170 'バーチャルパッド　ここから'
14180 'バーチャルパッド　ここから'
14190 if y = 1 then
14200 select case No
14210 'No の初期値：No=1
14220 case 1:
14230 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.登録文字数の確認":goto Entry_check_key:
14240 'デバッグライン　ここから
14250 '0のとき
14260 'デバッグライン　ここまで
14270 'デバッグライン　ここから
14280 case 2:
14290 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                       "
14300 :No=3:goto Entry_check_key:
14310 if lang_flag = 1 then
14320 Else
14330 color rgb(0,0,0):locate 0,12:print " 3.トップ画面に行く"
14340 endif
14350 'cls:color rgb(255,255,255):print"ok"
14360 'デバッグライン　ここまで
14370 case 3:
14380 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Entry_check_key:
14390 'デバッグライン　ここから
14400 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
14410 'デバッグライン　ここまで
14420 case 0:
14430 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_check_key:
14440 'デバッグライン　ここから
14450 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
14460 'デバッグライン　ここまで
14470 end select
14480 endif
14490 'バーチャルパッド　上 ここから
14500 if y = -1 then
14510 select case No
14520 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
14530 case 1:
14540 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Entry_check_key:
14550 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
14560 case 0:
14570 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                      ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
14580 'No:3 3.Help→2.設定 No:2
14590 case 3:
14600 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
14610 case 2:
14620 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_check_key:
14630 end select
14640 endif
14650 if bg=1 then
14660 select case No
14670 '1.数霊チェックを選択  パッドの右キー
14680 case 1:
14690 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
14700 '2.設定を選択    パッドの右キー
14710 case 2:
14720 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
14730 '3.ヘルプを選択 パッドの右
14740 case 3:
14750 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
14760 'プログラムの終了を選択
14770 case 0:
14780 cls 3:cls 4::color rgb(255,255,255):pause 2.052 * 1000:end
14790 if lang_flag = 1 then
14800 else
14810 ui_msg "プログラムを終了します"
14820 endif
14830 end select
14840 endif
14850 '4.終了するを選択  パッドの右
14860 'バーチャルパッド　ここまで'
14870 'key$ = input$(1)
14880 'カーソルの下
14890 if key$ = chr$(31) then
14900 select case (No Mod 4)
14910 case 0:
14920 c=1:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
14930 case 1:
14940 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:sp_on 3,0:goto Entry_check_key:
14950 case 2:
14960 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:goto Entry_check_key:
14970 case 3:
14980 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
14990 end select
15000 endif
15010 'カーソル　上
15020 if key$ = chr$(30) then
15030 select case (No Mod 4)
15040 case 0:
15050 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
15060 case 1:
15070 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
15080 case 2:
15090 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
15100 case 3:
15110 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
15120 end select
15130 endif
15140 'エンターキーを押す
15150 if key$ = chr$(13) then
15160 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15170 if No = 2 then goto Moji_Count_Check:
15180 if No = 3 then goto TopScreen:
15190 if No = 0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg
15200 endif
15210 '
15220 Kakunin_Surei_count:
15230 cls 3:font 48:No=1
15240 gload Gazo$ + "Kazutama_List_Top.png"
15250 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
15260 color rgb(255,0,0)
15270 print chr$(13)
15280 color rgb(255,255,255)
15290 if lang_flag = 1 then
15300 else
15310 print "番号を選んでください" + chr$(13)
15320 print " :1.数霊リスト 1人用" + chr$(13)
15330 print " :2.結果表示設定" + chr$(13)
15340 print " :3.トップ画面に行く" + chr$(13)
15350 print " :4.終 了" + chr$(13)
15360 print "" + chr$(13)
15370 endif
15380 color rgb(0,0,0)
15390 locate 0,12:print"                                                         "
15400 if No = 1 then locate 1,12:print "1.数霊リスト　1人用を選択"
15410 Entry_List:
15420 y = 0:key$ = "":bg=0
15430 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
15440 y = stick(1)
15450 key$ = inkey$
15460 bg = strig(1)
15470 pause 2
15480 wend
15490 'バーチャルパッド　ここから'
15500 'バーチャルパッド　ここから'
15510 'バーチャルパッド　下
15520 if y = 1 then
15530 select case No
15540 'No の初期値：No=1
15550 case 1:
15560 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.結果表示設定":goto Entry_List:
15570 'デバッグライン　ここから
15580 '0のとき
15590 'デバッグライン　ここまで
15600 'デバッグライン　ここから
15610 case 3:
15620 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,12:print "                                       "
15630 color rgb(0,0,0):locate 1,12:print "4.終了を選択":No=0:goto Entry_List:
15640 'cls:color rgb(255,255,255):print"ok"
15650 'デバッグライン　ここまで
15660 case 0:
15670 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,200),0,0:pause 200:locate 0,12:print"                                       ":locate 0,12:print "1.数霊リスト 1人用を選択":No=1:goto Entry_List:
15680 case 2:
15690 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 1,12:print "                                      ":No=2:locate 1,12:print "3．トップ画面に行く":goto Entry_List:
15700 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print "                        15110 'デバッグライン　ここから3:locate 1,12:print "15120 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
15710 case 1:
15720 'デバッグライン　ここから
15730 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
15740 'デバッグライン　ここまで
15750 'case 0:
15760 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_List:
15770 'デバッグライン　ここから
15780 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
15790 'デバッグライン　ここまで
15800 end select
15810 endif
15820 'バーチャルパッド　上 ここから
15830 if y = -1 then
15840 select case No
15850 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15860 case 1:
15870 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 1,12:print "                                       ":locate 1,12:print "4.終了を選択"::goto Entry_List:
15880 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15890 case 0:
15900 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print "                                      ":locate 1,12:print"2.トップ画面に行くを選択":goto Entry_List:
15910 'No:3 3.Help→2.設定 No:2
15920 case 2:
15930 sp_on 1,0:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.数霊リスト 1人用を選択":goto Entry_List:
15940 'case 2:
15950 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_List:
15960 end select
15970 endif
15980 if bg = 1 then
15990 select case No
16000 '1.数霊リスト 一人用を選択を選択  パッドの右キー
16010 case 1:
16020 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16030 '2.設定を選択  パッドの右キー
16040 case 2:
16050 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16060 '4.終了を選択 パッドの右
16070 case 0:
16080 cls 3:cls 4:color rgb(255,255,255):
16090 if lang_flag = 1 then
16100 Else
16110 ui_msg"プログラムを終了します":end
16120 endif
16130 'プログラムの終了を選択
16140 end select
16150 endif
16160 '4.終了するを選択  パッドの右
16170 'バーチャルパッド　ここまで'
16180 'Input "番号:",No
16190 'if No=2 then goto TopScreen:
16200 'if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
16210 'if No=1 then goto Surei_List1:
16220 'if No > 3 or No=0 then ui_msg"無効な数字です、入れ直してください":talk"無効な数字です":goto Kakunin_Surei_count:
16230 'if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
16240 Surei_List1:
16250 cls 3:font 48
16260 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
16270 file$ = dir$(SAVE_DATA1$,0)
16280 'ファイルが無いときの画面
16290 if file$ = ""  then
16300 gload "./data/Gazo/" + "KazutamaList1.png",0
16310 print chr$(13)
16320 color rgb(255,0,0):print "登録ファイルはございません" + chr$(13)
16330 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
16340 'else
16350 'endif
16360 bg = 0:key$ = ""
16370 while (key$ <> chr$(13) and bg<>1)
16380 key$ = inkey$
16390 bg = strig(1)
16400 pause 2
16410 wend
16420 'エンターキーもしくはバーチャルパッドの右でトップに行く
16430 if (bg = 1  or key$ = chr$(13)) then goto TopScreen:
16440 else
16450 cls 3:buffer_list_count = Loadcount()
16460 color rgb(255,255,255)
16470 if lang_flag = 1 then
16480 Else
16490 talk "登録件数は" + str$(buffer_list_count) + "件です"
16500 gload Gazo$ + "KazutamaList1_Entry.png",0
16510 color rgb(0,0,255)
16520 print chr$(13)
16530 color rgb(255,0,0)
16540 print "登録件数:";buffer_list_count;"件";chr$(13)
16550 color rgb(0,0,0)
16560 print "パッドの右を押してください" + chr$(13)
16570 endif
16580 bg = 0:key$ = "":bg2 = 0
16590 while (key$ <> chr$(13) and bg <> 1)
16600 key$ = inkey$
16610 bg = strig(1)
16620 bg2=strig(0)
16630 pause 2
16640 wend
16650 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
16660 if (key$ = chr$(13) or bg = 1) then pause 2:goto KotodamaList_page:
16670 endif
16680 if (bg2 = 1) then pause 2:goto TopScreen:
16690 func Loadcount()
16700 n = 0
16710 'while eof(1)=-1
16720 open SAVE_DATA1$  for input as #1
16730 while eof(1) = 0
16740 line input #1,line$
16750 n = n + 1
16760 wend
16770 close #1
16780 count = n
16790 endfunc count
16800 count_line = Loadcount()
16810 func Kotodama$(buf$)
16820 color rgb(255,255,255)
16830 b = len("数霊:")
16840 a$ = Mid$(buf$,b+1,len(buf$))
16850 for i=0 to 118
16860 color rgb(255,255,255)
16870 if bufline3$(2 * i) ="数霊:" + a$  then
16880 moji_$ = bufline3$(2*i + 1)
16890 'moji_$ = bufline3$(21)
16900 'moji$ = a$
16910 endif
16920 next i
16930 'kotodama$ = a$
16940 kotodama$ = moji_$
16950 endfunc kotodama$
16960 KotodamaList_page:
16970 cls 3:font 48:m = 0:
16980 gload Gazo$ + "Screen5_Surei_List.png"
16990 if SAVE_DATA1$ = "" then
17000 cls 3:print"ファイルがありません"
17010 else
17020 a = Loadcount()
17030 open SAVE_DATA1$  for input as #1
17040 while (a >= m)
17050 input #1,line$
17060 bufKaztama$(m) = line$
17070 m = m + 1
17080 wend
17090 close #1
17100 'endif
17110 l = 0:n=0
17120 gload Gazo$ + "Screen5_Surei_List.png"
17130 while (buffer_list_count > l)
17140 'while (l<=a)
17150 cls
17160 color rgb(255,0,0)
17170 'print "数霊　リスト" + chr$(13)
17180 print chr$(13)
17190 color rgb(255,255,255)
17200 n=n+1
17210 'while (n <= a)
17220 print "番号:";l+1;chr$(13)
17230 print bufKaztama$(l) + chr$(13)
17240 print bufKaztama$(l+1) + chr$(13)
17250 'n=n+1
17260 Kmoji$ = moji$
17270 print chr$(13) + chr$(13)
17280 color rgb(0,0,0)
17290 print " :パッドの左:トップ画面" + chr$(13)
17300 print " :パッドの右:次へ行く" + chr$(13)
17310 'wend
17320 key$ = "":bg = 0:bg2 = 0
17330 while (key$ <> chr$(13) and bg <> 1 and bg2 <> 1)
17340 key$ = inkey$
17350 bg = strig(1)
17360 bg2 = strig(0)
17370 pause 2
17380 wend
17390 'key$ = input$(1)
17400 if (key$ = " " OR bg = 1) then
17410 l = ((l + 1) Mod buffer_list_count):pause 1.583 * 1000
17420 else
17430 if ((bg2 = 1) or (key$=chr$(13))) then
17440    goto TopScreen:
17450 endif
17460 else
17470 goto KotodamaList_page:
17480 endif
17490 wend
17500 'wend
17510 endif
17520 '結果表示２ Menu1
17530 Surei_Result4:
17540 cls 3:font (48-16):init"kb:4"
17550 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
17560 for i=0 to 181 + 3 - 1
17570 if i = count  then
17580 buffer$ = bufline2$(count + 4,0)
17590 endif
17600 next i
17610 if len(buffer$) > 23 and len(buffer$) <= 45 then
17620 buffer2$ = Mid$(buffer$,1,24)
17630 buffer3$ = Mid$(buffer$,25,(len(buffer$) - 25))
17640 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)
17650 else
17660 if len(buffer$) <= 23 then
17670 buffer2$ = Mid$(buffer$,1,22)
17680 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
17690 else
17700 if len(buffer$) > 45 and len(buffer$) <= 64 then
17710 buffer2$ = Mid$(buffer$,1,22)
17720 buffer3$ = Mid$(buffer$,23,20)
17730 buffer4$ = Mid$(buffer$,43,(len(buffer$)-43))
17740 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)+chr$(13)
17750 else
17760 if len(buffer$) > 64 and len(buffer$) <= 81 then
17770 buffer2$ = Mid$(buffer$,1,23)
17780 buffer3$ = Mid$(buffer$,24,20)
17790 buffer4$ = Mid$(buffer$,42,20)
17800 buffer5$ = Mid$(buffer$,63,(len(buffer$)-62))
17810 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13) + chr$(13) + chr$(13)
17820 if len(buffer$) > 81 and len(buffer$) <= 110 then
17830 buffer2$ = Mid$(buffer$,1,21)
17840 buffer3$ = Mid$(buffer$,22,20)
17850 buffer4$ = Mid$(buffer$,42,20)
17860 buffer5$ = Mid$(buffer$,62,20)
17870 buffer6$ = Mid$(buffer$,82,(len(buffer$) - 82))
17880 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13) + chr$(13) + chr$(13)
17890 endif
17900 endif
17910 endif
17920 endif
17930 endif
17940 Surei_Result4_2:
17950 gload Gazo$ + "Screen1_Result2.png"
17960 cls
17970 color rgb(255,0,0)
17980 'print "診断結果 2" + chr$(13)
17990 print chr$(13)
18000 if lang_flag = 1 then
18010 else
18020 color rgb(127,255,212)
18030 print "入力文字:";buffer_moji$;chr$(13)
18040 print "数霊:";count;chr$(13)
18050 color rgb(255,255,255)
18060 print "数霊の説明:"+chr$(13)
18070 print buffer$
18080 color rgb(0,0,0)
18090 print "(パッド 左):保存,S(パッド 右):トップ画面" + chr$(13)
18100 endif
18110 key$ = "":bg = 0:bg2 = 0
18120 while (key$<>chr$(13) and bg<>1 and bg2<>1)
18130 key$=inkey$
18140 bg=strig(1)
18150 bg2=strig(0)
18160 pause 2
18170 wend
18180 if bg=1 then buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
18190 if key$ = chr$(13) then
18200 buffer$ = "":buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
18210 endif
18220 if bg2=1 then
18230 'ファイルがない時
18240 if dir$(SAVE_DATA1$) = "" then
18250 open SAVE_DATA1$ for output as #1
18260 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18270 close #1
18280 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
18290 'ファイルが有る時
18300 else
18310 open SAVE_DATA1$ for append as #1
18320 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18330 close #1
18340 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
18350 endif
18360 endif
18370 if key$="s" or key$="S" then
18380 if dir$(SAVE_DATA1$) = "" then
18390 open SAVE_DATA1$ for output as #1
18400 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18410 close #1
18420 ui_msg"保存しました":talk"保存しました":goto Surei_Result4_2:
18430 else
18440 open SAVE_DATA1$ for append as #1
18450 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18460 close #1
18470 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
18480 endif
18490 else
18500 talk "無効な文字です":goto Surei_Result4_2:
18510 endif
18520 'endif
18530 func All_clear()
18540 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
18550 endfunc
18560 'ここから
18570 Config_moji1:
18580 cls 3:Font 48
18590 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
18600 play ""
18610 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
18620 No=1
18630 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
18640 color rgb(0,0,255)
18650 'print "●設定項目" + chr$(13)
18660 print chr$(13)
18670 if lang_flag = 1 then
18680 'lang_flag = 1:英語
18690 else
18700 'lang_flag = 0:日本語
18710 color rgb(255,255,255)
18720 print "番号を選んでください" + chr$(13)
18730 'print " :1.文字の項目" + chr$(13)
18740 'print " :2.結果表示設定" + chr$(13)
18750 print " :1.文字の項目" + chr$(13)
18760 print " :2.結果表示設定" + chr$(13)
18770 print " :3.トップ画面に行く" + chr$(13)
18780 print " :4.終 了" + chr$(13)
18790 endif
18800 color rgb(0,0,0)
18810 locate 1,12
18820 if No = 1 then print "1.文字の項目"
18830 'y:バーチャルパッドの処理
18840 'key$:カーソルの処理
18850 'bg:バーチャルパッドの右ボタン
18860 Config_moji1_Screen:
18870 y = 0:key$ = "":bg=0
18880 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
18890 y = stick(1)
18900 key$ = inkey$
18910 bg=strig(1)
18920 pause 2
18930 wend
18940 'バーチャルパッド　ここから'
18950 'バーチャルパッド　ここから'
18960 if y = 1 then
18970 select case No
18980 'No の初期値：No=1
18990 case 1:
19000 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
19010 'デバッグライン　ここから
19020 '0のとき
19030 'デバッグライン　ここまで
19040 'デバッグライン　ここから
19050 case 2:
19060 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
19070 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
19080 if lang_flag = 1 then
19090 else
19100 locate 1,12:print "3.トップ画面に行くを選択"
19110 endif
19120 'cls:color rgb(255,255,255):print"ok"
19130 'デバッグライン　ここまで
19140 case 3:
19150 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
19160 'デバッグライン　ここから
19170 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
19180 'デバッグライン　ここまで
19190 case 0:
19200 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
19210 'デバッグライン　ここから
19220 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
19230 'デバッグライン　ここまで
19240 end select
19250 endif
19260 'バーチャルパッド　上 ここから
19270 if y = -1 then
19280 select case No
19290 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
19300 case 1:
19310 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
19320 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
19330 case 0:
19340 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
19350 'No:3 3.Help→2.設定 No:2
19360 case 3:
19370 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
19380 case 2:
19390 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
19400 end select
19410 endif
19420 if bg=1 then
19430 select case No
19440 '1.数霊チェックを選択  パッドの右キー
19450 case 1:
19460 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
19470 '2.設定を選択    パッドの右キー
19480 case 2:
19490 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
19500 '3.ヘルプを選択 パッドの右
19510 case 3:
19520 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
19530 'プログラムの終了を選択
19540 case 0:
19550 cls 3:cls 4::color rgb(255,255,255):pause 2.052*1000:end
19560 if lang_flag = 1 then
19570 Else
19580 ui_msg "プログラムを終了します"
19590 endif
19600 end select
19610 endif
19620 '4.終了するを選択  パッドの右
19630 'バーチャルパッド　ここまで'
19640 'SettingScreen:
19650 'key$ = input$(1)
19660 'カーソル下'
19670 if key$ = chr$(31) then
19680 select case (No Mod 4)
19690 '登録文字から数霊文字の確認
19700 case 1:
19710 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
19720 '数霊文字の確認からトップ画面に行く
19730 case 2:
19740 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
19750 'トップ画面に行くから終了
19760 case 3:
19770 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
19780 '終了から登録文字
19790 case 0:
19800 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
19810 end select
19820 endif
19830 'カーソル　上
19840 if key$ = chr$(30) then
19850 select case (No Mod 4)
19860 case 1:
19870 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
19880 case 2:
19890 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
19900 case 3:
19910 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
19920 case 0:
19930 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
19940 end select
19950 endif
19960 'エンターキーを押したとき
19970 if key$ = chr$(13) then
19980 if No=3 then goto TopScreen:
19990 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
20000 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
20010 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:color rgb(255,255,255):pause 3*120:end
20020 'lse
20030 'o'o SettingScreen:
20040 endif
20050 'ここまで
20060 Config_moji2:
20070 cls 3:Font 48
20080 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
20090 play ""
20100 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
20110 No=1
20120 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
20130 color rgb(0,0,255)
20140 'print "●設定項目" + chr$(13)
20150 print chr$(13)
20160 if lang_flag = 1 then
20170 'lang_flag = 1:英語
20180 else
20190 'lang_flag = 0:日本語
20200 color rgb(255,255,255)
20210 print "番号を選んでください" + chr$(13)
20220 'print " :1.文字の項目" + chr$(13)
20230 'print " :2.結果表示設定" + chr$(13)
20240 print " :1.文字の項目" + chr$(13)
20250 print " :2.結果表示設定" + chr$(13)
20260 print " :3.トップ画面に行く" + chr$(13)
20270 print " :4.終 了" + chr$(13)
20280 endif
20290 color rgb(0,0,0)
20300 locate 1,12
20310 if No = 1 then print "1.文字の項目"
20320 'y:バーチャルパッドの処理
20330 'key$:カーソルの処理
20340 'bg:バーチャルパッドの右ボタン
20350 config_moji2:
20360 y = 0:key$ = "":bg=0
20370 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
20380 y = stick(1)
20390 key$ = inkey$
20400 bg = strig(1)
20410 pause 2
20420 wend
20430 'バーチャルパッド　ここから'
20440 'バーチャルパッド　ここから'
20450 if y = 1 then
20460 select case No
20470 'No の初期値：No=1
20480 case 1:
20490 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
20500 'デバッグライン　ここから
20510 '0のとき
20520 'デバッグライン　ここまで
20530 'デバッグライン　ここから
20540 case 2:
20550 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
20560 color rgb(0,0,0)::No=3:goto SettingScreen:
20570 if lang_flag = 1 then
20580 else
20590 locate 1,12:print "3.トップ画面に行くを選択"
20600 endif
20610 'cls:color rgb(255,255,255):print"ok"
20620 'デバッグライン　ここまで
20630 case 3:
20640 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
20650 'デバッグライン　ここから
20660 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
20670 'デバッグライン　ここまで
20680 case 0:
20690 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
20700 'デバッグライン　ここから
20710 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
20720 'デバッグライン　ここまで
20730 end select
20740 endif
20750 'バーチャルパッド　上 ここから
20760 if y = -1 then
20770 select case No
20780 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
20790 case 1:
20800 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
20810 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
20820 case 0:
20830 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
20840 'No:3 3.Help→2.設定 No:2
20850 case 3:
20860 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
20870 case 2:
20880 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
20890 end select
20900 endif
20910 '決定ボタン
20920 if bg=1 then
20930 select case No
20940 '1.数霊チェックを選択  パッドの右キー
20950 case 1:
20960 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
20970 '2.設定を選択    パッドの右キー
20980 case 2:
20990 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
21000 '3.ヘルプを選択 パッドの右
21010 case 3:
21020 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
21030 'プログラムの終了を選択
21040 case 0:
21050 cls 3:cls 4::color rgb(255,255,255):pause 2.052*1000:end
21060 if lang_flag = 1 then
21070 Else
21080 ui_msg "プログラムを終了します"
21090 endif
21100 end select
21110 endif
21120 '4.終了するを選択  パッドの右
21130 'バーチャルパッド　ここまで'
21140 'SettingScreen:
21150 'key$ = input$(1)
21160 'カーソル下'
21170 if key$ = chr$(31) then
21180 select case (No Mod 4)
21190 '登録文字から数霊文字の確認
21200 case 1:
21210 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
21220 '数霊文字の確認からトップ画面に行く
21230 case 2:
21240 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
21250 'トップ画面に行くから終了
21260 case 3:
21270 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
21280 '終了から登録文字
21290 case 0:
21300 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21310 end select
21320 endif
21330 'カーソル　上
21340 if key$ = chr$(30) then
21350 select case (No Mod 4)
21360 case 1:
21370 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
21380 case 2:
21390 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
21400 case 3:
21410 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
21420 case 0:
21430 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
21440 end select
21450 endif
21460 'エンターキーを押したとき
21470 if key$ = chr$(13) then
21480 if No=3 then goto TopScreen:
21490 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
21500 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
21510 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4:color rgb(255,255,255):pause 3 * 120:end
21520 'lse
21530 'o'o SettingScreen:
21540 endif
21550 '結果表示設定
21560 Result_Setting:
21570 color rgb(255,255,255)
21580 'dim list$(4)
21590 'ファイル読み込み
21600 '1.ファイルが有るか無いかのチェック
21610 if Dir$(System$) = "" then
21620 '1-1.ファイルがないとき
21630 '上のSystemフォルダを作成
21640 mkdir "./System/"
21650 list$(0) = "●:出た数字から181を引く"
21660 list$(1) = " :出た数字から180を引き単数変換"
21670 open System$ for output as #1
21680 print #1,"config_r=0"
21690 close #1
21700 ui_msg "ファイルを作成しました"
21710 'ファイル作成
21720 else
21730 '1-2.ファイルが有るとき
21740 'config_r:0 出た数字から181を引く
21750 'config_r:1 出た数字から180を引いて単数変換
21760 'open "./System/config.sys" for input as #1
21770 'ファイルが有るときファイルを読み込み
21780 open System$ for input as #1
21790 line input #1,buf_line$
21800 'buf$にデーターをコピーする
21810 buf$ = buf_line$
21820 close #1
21830 if len(buf$) = 10 then
21840  if left$(buf$,9) = "config_r=" then
21850  buf$ = right$(buf_line$,1)
21860  if buf$ = "1" then
21870    '1.System$ ファイルを削除(config.sys)
21880    '2.1行目をconfig_r=1と書き、保存する
21890    buf_config_r = 1
21900    'list$(0) = "●:1.出た数字から180を引いて単数変換"
21910    'list$(1) = " :2.出た数字から181を引く"
21920    else
21930  if buf$ = "0" then
21940    buf_config_r = 0
21950   ' list$(0) = "●:1.出た数字から181を引く"
21960   'list$(1) = " :2.出た数字から180を引いて単数変換"
21970  endif
21980  endif
21990  endif
22000 endif
22010 endif
22020 '"●:1.出た数字から180を引く"をlist$(0)に代入
22030 if buf_config_r =  0 then
22040 list$(0) = "●:1.出た数字から181を引く"
22050 list$(1) = " :2.出た数字から180を引いて単数変換"
22060 else
22070 list$(0) = "●:1.出た数字から180を引いて単数変換"
22080 list$(1) = " :2.出た数字から181を引く"
22090 endif
22100 list$(2) = " :トップ画面に戻る"
22110 list$(3) = " :終 了"
22120 list_num = ui_select("list$","番号を選んでください")
22130 play ""
22140 Select case (list_num)
22150 case 0:
22160        if buf$ = "1" then
22170        buf_config_r = 0:
22180        'データーを変更したのでファイルを削除
22190        kill System$
22200        'ファイルを新しく作成
22210        open System$ for output as #1
22220        print #1,"config_r=0"
22230        close #1
22240        ui_msg "設定を変更しました。"
22250        else
22260        'if buf$ = "0" then
22270        'buf_config_r = 1
22280        'kill System$
22290        'open Syetem$ for output as #1
22300        'print #1,"config_r=1"
22310        'close #1
22320        'ui_msg "設定を変更しました"
22330        'endif
22340        endif
22350        goto config_moji2:
22360 case 1:
22370        if buf$ = "0" then
22380        buf_config_r = 1:
22390        'データーを変更したので、ファイルを削除
22400        kill System$
22410        'ファイルを新しく作成
22420        open System$ for output as #1
22430        print #1,"config_r=1"
22440        close #1
22450        ui_msg "設定を変更しました"
22460        else
22470        kill System$
22480        if buf$ = "1" then
22490        open System$ for output as #1
22500        print #1,"config_r=0"
22510        close #1
22520        ui_msg "設定を変更しました"
22530        endif
22540        endif
22550        goto config_moji2:
22560 case 2:
22570       'トップ画面に飛ぶ
22580        goto TopScreen:
22590 case 3:
22600       'プログラムを終了する
22610       cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
22620 end select
22630 '単数変換
22640 Func Single_Complate(num)
22650 '1.出てきた数字から180を引く
22660 a = num - 180
22670 'a:10〜99
22680 Re1:
22690 if (a > 9 and a < 100) then
22700  b1 = fix(a / 10)
22710  b2 = 10 * a - b1
22720  d1 = b1 + b2
22730 if c>9 then
22740  goto Re1:
22750 else
22760  c=d1:goto Re2:
22770 endif
22780 endif
22790 Re2:
22800 buffer = c
22810 endfunc buffer
