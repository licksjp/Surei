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
370 Version$ = "1.1.6_2022.11.12(正式版)"
380 'csvファイル 1.数霊 ベースファイル
390 FILE_csv$ = "data/Kazutama.csv"
400 'csvファイル 2.数霊 ベースファイル 2
410 FILE_csv2$ = "data/Surei_chart_20211207.csv"
420 'Save ファイル
430 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
440 'gazo ファイル
450 Gazo$ = "data/Gazo/"
460 'Sound File(Voice)
470 '1.ボイス TopScreen
480 Voice_File_TopScreen$ = "data/Sound_data/"
490 '変数領域
500 'vcount:バーチャルパッド下の変数
510 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50):c=1:vcount=0:timer=0
520 count2 = 0:N=0:N2=0:m2 = 0
530 'ファイルの有無チェック
540 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
550 '1.ファイルが無いとき
560 cls :print "依存ファイルが見つかりません":
570 print "エンターキーを押してください"+chr$(13)
580 key$ = input$(1)
590 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
600 else
610 '2.ファイルが有るとき
620 cls:print "csv:file ok." + chr$(13)
630 n=0
640 open FILE_csv$ for input as #1
650 while eof(1) = 0
660 input #1,line$
670 'print line$
680 bufline$(n) = line$
690 'Print n;chr$(13)
700 n = n + 1
710 wend
720 close #1
730 N=n
740 '2つ目のファイル読み込み
750 'n = 0
760 open FILE_csv2$ for input as #2
770 for n=3 to 181
780 for i=0 to 1
790 input #2,line$
800 bufline2$(n,i) = line$
810 'print bufline2$(n,i)
820 next i
830 next n
840 close #2
850 N2 = n
860 '
870 endif
880 'or j = 3 to 181+3
890 'ufline3$(j - 3,n) = bufline2$(i,n)
900 'next j
910 'moji$ = Kotodama$(bufline3$(16))
920 'erase bufline2$
930 'Top画面
940 TopScreen:
950 'バーチャルパッドを表示
960 cls 3:font 48:screen 1,1,1:init"kb:4"
970 'play ""
980 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
990 gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
1000 '選択肢 1
1010 gload Gazo$ + "Selection.png",1,5,200
1020 '選択肢 2
1030 gload Gazo$ + "Selection.png",1,5,300
1040 '選択肢 3
1050 gload Gazo$ + "Selection.png",1,5,400
1060 '選択肢 4
1070 gload Gazo$ + "Selection.png",1,5,500
1080 color rgb(0,0,255)
1090 print chr$(13)
1100 'print "●Top画面" + chr$(13)
1110 color rgb(255,255,255)
1120 print "番号を選んでください" + chr$(13)
1130 print " :1.数霊(かずたま)チェック" + chr$(13)
1140 print " :2.設定" + chr$(13)
1150 print " :3.ヘルプ" + chr$(13)
1160 print " :4.終　了" + chr$(13)
1170 color rgb(0,0,0)
1180 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
1190 'バーチャルパッドを表示
1200 No=1:locate 1,12:color rgb(0,0,0):print "1.数霊(かずたま)チェックを選択";chr$(13)
1210 'スプライト
1220 '選択肢 1 On
1230 sp_def 0,(5,200),32,32
1240 sp_on 0,1
1250 sp_put 0,(5,200),0,0
1260 '選択肢 2 Off
1270 sp_def 1,(5,300),32,32
1280 sp_on 1,0
1290 sp_put 1,(5,300),0,0
1300 '選択肢 3 Off
1310 sp_def 2,(5,400),32,32
1320 sp_on 2,0
1330 sp_put 2,(5,400),0,0
1340 '選択肢 4 Off
1350 sp_def 3,(5,500),32,32
1360 sp_on 3,0
1370 sp_put 3,(5,500),0,0
1380 color rgb(0,0,0)
1390 Main_Select:
1400 'y:バーチャルパッドの処理
1410 'key$:カーソルの処理
1420 y = 0:key$ = "":bg=0
1430 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
1440 y = stick(1)
1450 key$ = inkey$
1460 bg=strig(1)
1470 pause 2
1480 wend
1490 'if y=1 then
1500 'select case (No Mod 4)
1510 'ase 0:
1520 '     c=1:No=c:sp_on 0,1:sp_on 1,0 :sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print " 数霊(かずたま)チェックを選択":beep:goto Main_Select:
1530 'case 1:
1540 '       =2:No=c:sp_on 0,0:
1550 '"ase 2:
1560 'ase 3:
1570 'nd select
1580 'ndif
1590 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
1600 '1.バーチャルパッドの処理
1610 'バーチャルパッド下を押した時
1620 if y = 1 then
1630 select case No
1640 'No の初期値：No=1
1650 case 1:
1660 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.設定を選択":goto Main_Select:
1670 'デバッグライン　ここから
1680 '0のとき
1690 'デバッグライン　ここまで
1700 'デバッグライン　ここから
1710 case 2:
1720 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                  "
1730 color rgb(0,0,0):locate 1,12:print "2.ヘルプを選択":No=3:goto Main_Select:
1740 'cls:color rgb(255,255,255):print"ok"
1750 'デバッグライン　ここまで
1760 case 3:
1770 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終了を選択":No=0:goto Main_Select:
1780 'デバッグライン　ここから
1790 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
1800 'デバッグライン　ここまで
1810 case 0:
1820 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
1830 'デバッグライン　ここから
1840 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
1850 'デバッグライン　ここまで
1860 end select
1870 endif
1880 'バーチャルパッド　上 ここから
1890 if y = -1 then
1900 select case No
1910 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
1920 case 1:
1930 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print "4.終了を選択":goto Main_Select:
1940 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
1950 case 0:
1960 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.ヘルプを選択":goto Main_Select:
1970 'No:3 3.Help→2.設定 No:2
1980 case 3:
1990 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.設定を選択":goto Main_Select:
2000 case 2:
2010 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.数霊(かずたま)チェックを選択":goto Main_Select
2020 end select
2030 endif
2040 if bg=1 then
2050 select case No
2060 '1.数霊チェックを選択  パッドの右キー
2070 case 1:
2080 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
2090 '2.設定を選択    パッドの右キー
2100 case 2:
2110 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
2120 '3.ヘルプを選択 パッドの右
2130 case 3:
2140 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
2150 'プログラムの終了を選択
2160 case 0:
2170 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
2180 end select
2190 '4.終了するを選択  パッドの右
2200 endif
2210 'バーチャルパッド　上　ここまで
2220 '2.カーソルの処理
2230 'カーソル　下 chr$(31)
2240 if (key$ = chr$(31)) then
2250 select case (No)
2260 '4
2270 '0 選択肢4 => 選択肢1
2280 case 0:
2290 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "              ":color rgb(0,0,0):locate 1,12:print "数霊（かずたま）チェックを選択":beep:goto Main_Select:
2300 '1 選択肢1 => 選択肢2
2310 case 1:
2320 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                ":color rgb(0,0,0):locate 1,12:print "設 定を選択":beep:goto Main_Select:
2330 '2 選択肢2 => 選択肢3
2340 case 2:
2350 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "               ":color rgb(0,0,0):locate 1,12:print " ヘルプを選択":beep:goto Main_Select:
2360 '3 選択肢３ => 選択肢4
2370 case 3:
2380 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "               ":color rgb(255,255,255):locate 1,12:print " 終　了を選択":beep:goto Main_Select:
2390 case else:
2400 goto Main_Select:
2410 end select
2420 endif
2430 'カーソル　上
2440 if key$=chr$(30) then
2450 select case (No)
2460 '選択肢1 => 選択肢4
2470 case 1:
2480 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:PRINT "                 ":locate 1,12:beep:print "数霊(かずたま)チェックを選択":goto Main_Select:
2490 '選択肢2 => 選択肢1
2500 case 2:
2510 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                 ":locate 1,12:beep:print "設 定を選択":beep:goto Main_Select:
2520 '選択肢3　=> 選択肢2
2530 case 3:
2540 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0
2550 '選択肢4 => 選択肢3
2560 case 0:
2570 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 1,12:print "終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
2580 end select
2590 endif
2600 'Input "番号:",No
2610 'エンターキー入力:決定
2620 if key$ = chr$(13) then
2630 select case No
2640 case 1:
2650 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
2660 case 3:
2670 Color rgb(255,255,255):goto Help:
2680 case 0:
2690 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
2700 case 2:
2710 color rgb(255,255,255):goto Setting:
2720 'else
2730 'goto Main_Select:
2740 end select
2750 endif
2760 'ndif
2770 'if N0=0 or No>4 then goto TopScreen:
2780 '1-1.数霊チェック
2790 Surei_Check:
2800 cls 3:Font 48:
2810 'gload Gazo$ + "Screen4.png"
2820 gload Gazo$ + "Screen1_Sureicheck_Top20211226.png"
2830 play ""
2840 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
2850 color rgb(255,0,0)
2860 'print "●数霊(かずたま)チェックトップ" + chr$(13)
2870 sp_on 0,1:sp_put 0,(5,200),0,0:screen 1,1,1
2880 print chr$(13)
2890 color rgb(255,255,255)
2900 print "番号を選んでください" + chr$(13)
2910 print " :1.数霊(かずたま)1人用" + chr$(13)
2920 print " :2.数霊(かずたま)2人用" + chr$(13)
2930 print " :3.前の画面に戻る" + chr$(13)
2940 print " :4.終 了" + chr$(13)
2950 color rgb(0,0,0):No=1
2960 locate 1,12
2970 print "1.数霊1人用を選択"
2980 Kazutama_main:
2990 'y:バーチャルパッドの処理
3000 'key$:カーソルの処理
3010 'bg:バーチャルパッドの右のボタン
3020 y = 0:key$ = "":bg=0
3030 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
3040 y = stick(1)
3050 key$ = inkey$
3060 bg=strig(1)
3070 pause 2
3080 wend
3090 'key$ = input$(1)
3100 if y = 1 then
3110 select case No
3120 'No の初期値：No=1
3130 case 1:
3140 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊(かずたま)2人用を選択":goto Kazutama_main:
3150 'デバッグライン　ここから
3160 '0のとき
3170 'デバッグライン　ここまで
3180 'デバッグライン　ここから
3190 case 2:
3200 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                               "
3210 color rgb(0,0,0):locate 1,12:print "3.前の画面に戻るを選択":No=3:goto Kazutama_main:
3220 'cls:color rgb(255,255,255):print"ok"
3230 'デバッグライン　ここまで
3240 case 3:
3250 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Kazutama_main:
3260 'デバッグライン　ここから
3270 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
3280 'デバッグライン　ここまで
3290 case 0:
3300 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.数霊(かずたま)1人用を選択":goto Kazutama_main:
3310 'デバッグライン　ここから
3320 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
3330 'デバッグライン　ここまで
3340 end select
3350 endif
3360 'バーチャルパッド　上 ここから
3370 if y = -1 then
3380 select case No
3390 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
3400 case 1:
3410 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Kazutama_main:
3420 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
3430 case 0:
3440 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.ヘルプを選択":goto Kazutama_main:
3450 'No:3 3.Help→2.設定 No:2
3460 case 3:
3470 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.設定を選択":goto Kazutama_main:
3480 case 2:
3490 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.数霊(かずたま)チェックを選択":goto Kazutama_main:
3500 end select
3510 endif
3520 if bg=1 then
3530 select case No
3540 '1.数霊チェックを選択  パッドの右キー
3550 case 1:
3560 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
3570 '2.設定を選択    パッドの右キー
3580 case 2:
3590 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
3600 '3.ヘルプを選択 パッドの右
3610 case 3:
3620 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
3630 'プログラムの終了を選択
3640 case 0:
3650 cls 3:cls 4:ui_msg "プログラムを終了します":color rgb(255,255,255):end
3660 end select
3670 '4.終了するを選択  パッドの右
3680 endif
3690 'バーチャルパッド　上　ここまで
3700 if key$ = chr$(31) then
3710 select case No
3720 case 0:
3730 No=1:sp_on 0,0:sp_on 1,1:sp_put 0,(5,300),0,0:locate 1,12:print "                                                          ":locate 0,12:print "2.数霊(かずたま)2人用を選択":goto Kazutama_main:
3740 case 1:
3750 No=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                                          ":locate 1,12:print"3.前の画面に戻るを選択":goto Kazutama_main:
3760 case 2:
3770 No=3:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print"                                       ":locate 1,12:print"4.終了を選択":goto Kazutama_main:
3780 case 3:
3790 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print"1.数霊（かずたま)1人用を選択":goto Kazutama_main:
3800 end select
3810 endif
3820 if key$=chr$(13) then
3830 select case No
3840 case 1:
3850 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_Input:
3860 case 2:
3870 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
3880 case 3:
3890 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
3900 case 0:
3910 cls 4:cls 3:talk"プログラムを終了します":ui_text"プログラムを終了します":end
3920 end select
3930 endif
3940 'Input "番号:",No
3950 '前の画面に戻る
3960 'if No = 3 then goto TopScreen:
3970 'プログラムの終了
3980 'if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":COLOR rgb(255,255,255):end
3990 '1人用
4000 'if No = 1 then goto Surei_Input:
4010 '2人用
4020 'if No = 2 then goto Surei_twoParson:
4030 'if No > 4 or No=0 then ui_msg"もう一度入れてください":goto Surei_Check:
4040 '数霊(かずたま) 文字入力  1人用
4050 Surei_Input:
4060 if mode = 0 then
4070 cls 3:font 32:init"kb:2"
4080 gload Gazo$ + "InputKotodama_20211226.png"
4090 play""
4100 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
4110 color rgb(255,0,0)
4120 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
4130 print chr$(13)
4140 color rgb(0,0,0)
4150 print "文字を入れてください" + chr$(13)
4160 color rgb(255,0,0)
4170 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)"+chr$(13)
4180 print chr$(13)
4190 color rgb(0,0,0)
4200 Input "入力文字:",buffer_moji$
4210 goto Surei_Result:
4220 else
4230 if mode = 1 then
4240 cls 3:Font 32:
4250 gload Gazo$ + "InputKotodama.png"
4260 color rgb(255,0,0)
4270 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
4280 color rgb(255,255,255)
4290 print "文字を入れてください" + chr$(13)
4300 color rgb(255,0,0)
4310 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
4320 print "大文字のみ)" + chr$(13)
4330 color rgb(0,0,0)
4340 Input "文字入力:",buffer_moji2$
4350 goto Surei_Result3:
4360 endif
4370 endif
4380 '数霊(かずたま)文字入力　2人用
4390 Surei_twoParson:
4400 cls 3:Font 32:init"kb:2"
4410 gload Gazo$ + "InputKotodama_20211226.png"
4420 '1人目入力
4430 'color rgb(255,0,0)
4440 print ""+chr$(13)
4450 'print "●数霊(かずたま) 1人目 入力" + chr$(13)
4460 color rgb(255,0,0)
4470 print "1人目の文字を入れてください" + chr$(13)
4480 color rgb(255,0,0)
4490 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
4500 color rgb(0,0,0)
4510 print chr$(13)
4520 Input "1人目文字入力:",buf_Parson1$
4530 Surei_twoParson2:
4540 cls 3:Font 32:init"kb:2"
4550 '2人目入力
4560 gload Gazo$ + "InputKotodama_20211226.png"
4570 'color rgb(255,0,0)
4580 'print "●数霊(かずたま) 2人目 入力" + chr$(13)
4590 print ""+chr$(13)
4600 print "2人目の文字を入れてください" + chr$(13)
4610 color rgb(255,0,0)
4620 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
4630 color rgb(0,0,0)
4640 Input "2人目の文字入力:",buf_Parson2$
4650 goto Surei_Result2:
4660 '数霊　計算 パート
4670 '文字の計算関数
4680 'moji$:1文字を入れる
4690 func Complate(moji$)
4700 for n = 1 to 116
4710 if moji$ = bufline$(2*n) then
4720 buffcount = val(bufline$(2 * n + 1))
4730 endif
4740 next n
4750 endfunc buffcount
4760 '数霊　結果表示
4770 Surei_Result:
4780 cls 3:Font 32
4790 'ゼロカウント:zcount
4800 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
4810 '例 アカい:"い"の文字は無効な文字なので、はじく
4820 zcount=0
4830 'mojicount:入力文字数
4840 mojicount = len(buffer_moji$)
4850 for n=1 to mojicount
4860 for j=1 to 118
4870 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
4880 if bufcount$(n - 1) = bufline$(2 * j) then
4890 zcount = zcount + 1
4900 endif
4910 next j
4920 next n
4930 if mojicount > zcount then
4940 cls 3:ui_msg "無効な文字です":talk"無効な文字があります。":zcount = 0:goto Surei_Input:
4950 endif
4960 for i = 1 to mojicount
4970 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
4980 n1 = Complate(bufcount$(i - 1))
4990 count = count + n1
5000 next i
5010 '182以上のとき,181を引く
5020 if (count > 181) then count = count - 181
5030 cls 3:Font 48+16
5040 gload Gazo$ + "Result_Screen3_20211226.png"
5050 color rgb(255,0,0)
5060 print "入力文字:" + buffer_moji$ + chr$(13)
5070 'print chr$(13)
5080 color rgb(0,0,255)
5090 print "数霊(かずたま):";count;chr$(13)
5100 color rgb(0,0,0)
5110 print "エンターキー:トップ" + chr$(13)
5120 print "スペース:次 へ" + chr$(13)
5130 key$ = input$(1)
5140 if key$ = " " then goto Surei_Result4:
5150 if key$ = chr$(13) then
5160 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
5170 for i=0 to 9
5180 bufcount$(i) = " "
5190 next i
5200 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
5210 'else
5220 'if key$ = " " then
5230 '２回めの入力に行く
5240 'mode = 1:goto Surei_Input:
5250 'else
5260 'if key$ = "s" or key$ = "S" then
5270 'ファイルを保存する
5280 's = Save()
5290 'ui_msg"保存しました"
5300 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
5310 else
5320 goto Surei_Result:
5330 'endif
5340 endif
5350 '3-1 バージョン情報
5360 Version:
5370 cls 3:Font 32
5380 gload Gazo$ + "Screen1_Version.png"
5390 play ""
5400 play Voice_File_TopScreen$ + "Voice_Version.mp3"
5410 color rgb(255,0,0)
5420 'print"●バージョン情報"+chr$(13)
5430 print chr$(13)
5440 color rgb(255,255,255)
5450 print "Ver:";Version$ + chr$(13)
5460 print "アプリ名:数霊"+ chr$(13)
5470 print "for Basic for Android"+chr$(13)
5480 print "Author:licksjp"+chr$(13)
5490 print "制作開始:2021.7.28" + chr$(13)
5500 print chr$(13)
5510 print "(C)Copy right licksjp " + chr$(13)
5520 print "All rights reserved" + chr$(13)
5530 color rgb(0,0,0)
5540 print "エンターキーを押してください" + chr$(13)
5550 'key$ = input$(1)
5560 bg=0:key$=""
5570 while (bg <> 1 and key$ <> chr$(13))
5580 bg = strig(1)
5590 key$ = inkey$
5600 pause 2
5610 wend
5620 if key$ = chr$(13) then
5630 goto TopScreen:
5640 'else
5650 'talk "無効なキーです":goto Version:
5660 else
5670 if bg=1 then
5680 goto TopScreen:
5690 else
5700 talk "無効なキーです":goto Version:
5710 endif
5720 endif
5730 '3-2 参考文献
5740 Reference_Book:
5750 cls 3:Font 48:play""
5760 gload Gazo$ + "Screen1_Reference.png"
5770 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
5780 color rgb(255,0,0)
5790 'print"●参考文献" + chr$(13)
5800 print chr$(13)
5810 color rgb(255,255,255)
5820 print "書名:数霊" + chr$(13)
5830 print "出版社:徳間書店" + chr$(13)
5840 print "ISBN:978-4-19-" + chr$(13)
5850 print "         865309-5" + chr$(13)
5860 print "定価:2300円 + 税" + chr$(13)
5870 color rgb(0,0,0)
5880 print "エンターキーを押してください"
5890 bg=0:key$=""
5900 while (bg <> 1 and key$ <> chr$(13))
5910 bg = strig(1)
5920 key$ = inkey$
5930 pause 2
5940 wend
5950 if key$ = chr$(13) then
5960 goto TopScreen:
5970 'else
5980 'talk "無効なキーです":goto Reference_Book:
5990 else
6000 if bg=1 then
6010 goto TopScreen:
6020 else
6030 talk "無効なキーです":goto Reference_Book:
6040 endif
6050 endif
6060 'key$=input$(1)
6070 'if key$=chr$(13) then
6080 'goto TopScreen:
6090 'else
6100 'talk"無効なキーです":goto Reference_Book:
6110 'endif
6120 'ヘルプ画面　トップ画面
6130 Help:
6140 No=1:c=0
6150 play ""
6160 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
6170 cls 3:Font 48:
6180 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
6190 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0
6200 color rgb(255,0,0)
6210 'print "●3.ヘルプ　トップ画面" + chr$(13)
6220 print chr$(13)
6230 color rgb(255,255,255)
6240 print "番号を選んでください" + chr$(13)
6250 print " :1.バージョン" + chr$(13)
6260 print " :2.参考文献" + chr$(13)
6270 print " :3.トップ画面" + chr$(13)
6280 print " :4.終 了" + chr$(13)
6290 color rgb(0,0,0)
6300 if No = 1 then print " バージョンを選択"
6310 'y:バーチャルパッドの処理
6320 'key$:カーソルの処理
6330 'bg:バーチャルパッドの右ボタン
6340 Help_key:
6350 y = 0:key$ = "":bg=0
6360 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
6370 y = stick(1)
6380 key$ = inkey$
6390 bg=strig(1)
6400 pause 2
6410 wend
6420 'バーチャルパッド　ここから'
6430 if y = 1 then
6440 select case No
6450 'No の初期値：No=1
6460 case 1:
6470 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.参考文献を選択":goto Help_key:
6480 'デバッグライン　ここから
6490 '0のとき
6500 'デバッグライン　ここまで
6510 'デバッグライン　ここから
6520 case 2:
6530 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 1,12:print "                  "
6540 color rgb(0,0,0):locate 1,12:print "3.トップ画面に行くを選択":No=3:goto Help_key:
6550 'cls:color rgb(255,255,255):print"ok"
6560 'デバッグライン　ここまで
6570 case 3:
6580 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Help_key:
6590 'デバッグライン　ここから
6600 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
6610 'デバッグライン　ここまで
6620 case 0:
6630 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.バージョンを選択":goto Help_key:
6640 'デバッグライン　ここから
6650 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
6660 'デバッグライン　ここまで
6670 end select
6680 endif
6690 'バーチャルパッド　上 ここから
6700 if y = -1 then
6710 select case No
6720 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
6730 case 1:
6740 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Kazutama_main:
6750 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
6760 case 0:
6770 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面に行くを選択":goto Kazutama_main:
6780 'No:3 3.Help→2.設定 No:2
6790 case 3:
6800 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.参考文献を選択":goto Kazutama_main:
6810 case 2:
6820 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.バージョンを選択":goto Kazutama_main:
6830 end select
6840 endif
6850 if bg=1 then
6860 select case No
6870 '1.数霊チェックを選択  パッドの右キー
6880 case 1:
6890 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
6900 '2.設定を選択    パッドの右キー
6910 case 2:
6920 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
6930 '3.ヘルプを選択 パッドの右
6940 case 3:
6950 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
6960 'プログラムの終了を選択
6970 case 0:
6980 cls 3:cls 4:ui_msg "プログラムを終了します":color rgb(255,255,255):end
6990 end select
7000 '4.終了するを選択  パッドの右
7010 endif
7020 'バーチャルパッド　上　ここまで
7030 'バーチャルパッド　ここまで'
7040 'key$ = input$(1)
7050 'カーソルの下
7060 if key$ = chr$(31) then
7070 select case (No Mod 4)
7080 'バージョンから参考文献
7090 case 0:
7100 c=1:No=c:locate 0,12:Print "           ":locate 0,12:print " 参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
7110 '参考文献からトップ画面
7120 case 1:
7130 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "            ":locate 0,12:print " トップ画面を選択":goto Help_key:
7140 'トップ画面から終了
7150 case 2:
7160 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 0,12:print " 終 了を選択":goto Help_key:
7170 '終了からバージョン
7180 case 3:
7190 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                     ":locate 0,12:print " バージョンを選択":goto Help_key:
7200 case else:
7210 goto Help_key:
7220 end select
7230 endif
7240 'カーソル　上
7250 if key$ = chr$(30) then
7260 select case (c Mod 4)
7270 'バージョンから終了
7280 case 0:
7290 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:locate 0,12:print "                   ":locate 0,12:print " 終 了を選択":goto Help_key:
7300 '参考文献からバージョン
7310 case 1:
7320 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                   ":locate 0,12:print " バージョンを選択":goto Help_key:
7330 'トップ画面から参考文献
7340 case 2:
7350 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":locate 0,12:print " 参考文献を選択":goto Help_key:
7360 '終了からトップ画面を選択
7370 case 3:
7380 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print"                      ":locate 0,12:print " トップ画面を選択":goto Help_key:
7390 case else:
7400 goto Help_key:
7410 end select
7420 endif
7430 'Input "番号:",No
7440 'sp_def 0,(5,200),32,32
7450 'エンターキー：決定
7460 if key$=chr$(13) then
7470 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
7480 if No=3 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
7490 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
7500 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
7510 else
7520 goto Help_key:
7530 endif
7540 'if (No = 0 or No > 4) then ui_msg"もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
7550 '登録文字の確認
7560 '文字を1文字入れて登録されているか調べるメニュー
7570 '設定項目
7580 Setting:
7590 cls 3:Font 48
7600 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
7610 play ""
7620 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
7630 No=1
7640 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
7650 color rgb(0,0,255)
7660 'print "●設定項目" + chr$(13)
7670 print chr$(13)
7680 color rgb(255,255,255)
7690 print "番号を選んでください" + chr$(13)
7700 print " :1.登録文字の確認" + chr$(13)
7710 print " :2.数霊文字確認" + chr$(13)
7720 print " :3.トップ画面に行く" + chr$(13)
7730 print " :4.終 了" + chr$(13)
7740 color rgb(0,0,0)
7750 locate 1,12
7760 if No=1 then print "1.登録文字の確認を選択"
7770 'y:バーチャルパッドの処理
7780 'key$:カーソルの処理
7790 'bg:バーチャルパッドの右ボタン
7800 SettingScreen:
7810 y = 0:key$ = "":bg=0
7820 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
7830 y = stick(1)
7840 key$ = inkey$
7850 bg=strig(1)
7860 pause 2
7870 wend
7880 'バーチャルパッド　ここから'
7890 'バーチャルパッド　ここから'
7900 if y = 1 then
7910 select case No
7920 'No の初期値：No=1
7930 case 1:
7940 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
7950 'デバッグライン　ここから
7960 '0のとき
7970 'デバッグライン　ここまで
7980 'デバッグライン　ここから
7990 case 2:
8000 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
8010 color rgb(0,0,0):locate 1,12:print "3.トップ画面に行くを選択":No=3:goto SettingScreen:
8020 'cls:color rgb(255,255,255):print"ok"
8030 'デバッグライン　ここまで
8040 case 3:
8050 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
8060 'デバッグライン　ここから
8070 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
8080 'デバッグライン　ここまで
8090 case 0:
8100 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
8110 'デバッグライン　ここから
8120 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
8130 'デバッグライン　ここまで
8140 end select
8150 endif
8160 'バーチャルパッド　上 ここから
8170 if y = -1 then
8180 select case No
8190 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
8200 case 1:
8210 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
8220 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
8230 case 0:
8240 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
8250 'No:3 3.Help→2.設定 No:2
8260 case 3:
8270 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
8280 case 2:
8290 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
8300 end select
8310 endif
8320 if bg=1 then
8330 select case No
8340 '1.数霊チェックを選択  パッドの右キー
8350 case 1:
8360 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
8370 '2.設定を選択    パッドの右キー
8380 case 2:
8390 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
8400 '3.ヘルプを選択 パッドの右
8410 case 3:
8420 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
8430 'プログラムの終了を選択
8440 case 0:
8450 cls 3:cls 4:ui_msg "プログラムを終了します":color rgb(255,255,255):pause 2.052*1000:end
8460 end select
8470 endif
8480 '4.終了するを選択  パッドの右
8490 'バーチャルパッド　ここまで'
8500 'SettingScreen:
8510 'key$ = input$(1)
8520 'カーソル下'
8530 if key$ =chr$(31) then
8540 select case (No Mod 4)
8550 '登録文字から数霊文字の確認
8560 case 1:
8570 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
8580 '数霊文字の確認からトップ画面に行く
8590 case 2:
8600 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
8610 'トップ画面に行くから終了
8620 case 3:
8630 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
8640 '終了から登録文字
8650 case 0:
8660 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
8670 end select
8680 endif
8690 'カーソル　上
8700 if key$ = chr$(30) then
8710 select case (No Mod 4)
8720 case 1:
8730 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
8740 case 2:
8750 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
8760 case 3:
8770 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
8780 case 0:
8790 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
8800 end select
8810 endif
8820 'エンターキーを押したとき
8830 if key$ = chr$(13) then
8840 if No=3 then goto TopScreen:
8850 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
8860 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
8870 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:color rgb(255,255,255):pause 3*120:end
8880 'lse
8890 'o'o SettingScreen:
8900 endif
8910 'endif
8920 'endif
8930 '文字検索項目  ここから
8940 Moji_Search:
8950 cls 4:cls 3:Font 32+16:init"kb:2"
8960 gload Gazo$ + "Moji_Search_Result.png"
8970 play ""
8980 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
8990 print "" + chr$(13)
9000 color rgb(255,0,0)
9010 print "文字を一文字入れてください" + chr$(13)
9020 color rgb(0,0,0)
9030 Input "登録文字:",moji$
9040 moji_count = len(moji$)
9050 if moji_count > 1 then
9060 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
9070 else
9080 count=0
9090 for n = 0 to 116
9100 if bufline$(2*n) = moji$ then
9110 cls 3:font 48:init"kb:4"
9120 gload Gazo$ + "Moji_Search_Result.png"
9130 'talk"この文字は登録されています"
9140 play ""
9150 play Voice_File_TopScreen$+"Voice_Entry_OK.mp3"
9160 print chr$(13)
9170 color rgb(255,0,0)
9180 print moji$;"は、登録されています。" + chr$(13)
9190 color rgb(0,0,0)
9200 print "エンターキーを押してください"
9210 bg=0:key$=""
9220 while (bg<>1 and key$<>chr$(13))
9230 key$=inkey$
9240 bg=strig(1)
9250 pause 2
9260 wend
9270 'y$=input$(1)
9280 if key$=chr$(13) then goto TopScreen:
9290 if bg=1 then goto TopScreen:
9300 count = count + 1
9310 endif
9320 next n
9330 if count = 0 then
9340 cls 3:font 48:init "kb:2"
9350 gload Gazo$ + "Moji_check.png"
9360 play ""
9370 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
9380 print chr$(13)
9390 color rgb(255,0,0)
9400 print moji$;"は、登録されていません。" + chr$(13)
9410 color rgb(0,0,0)
9420 print "エンターキーを押してください" + chr$(13)
9430 kg = 0:key$ = ""
9440 while (kg <> 1 and key$ <> chr$(13))
9450 key$ = inkey$
9460 kg = strig(1)
9470 pause 2
9480 wend
9490 if key$ = chr$(13) then goto TopScreen:
9500 endif
9510 endif
9520 Surei_Result2:
9530 cls 3:Font 48
9540 zcount1=0:zcount2=0:count1=0:count2=0
9550 '1人目
9560 mojicount1=len(buf_Parson1$)
9570 '2人目
9580 mojicount2=len(buf_Parson2$)
9590 '1人目
9600 for n=1 to mojicount1
9610 for j=1 to 116
9620 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
9630 if bufcount1$(n-1) = bufline$(2*j) then
9640 zcount1 = zcount1 + 1
9650 endif
9660 next j
9670 next n
9680 '2人目
9690 for n=1 to mojicount2
9700 for j=1 to 116
9710 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
9720 if bufcount2$(n-1) = bufline$(2*j) then
9730 zount2 = zcount2 + 1
9740 endif
9750 next j
9760 next n
9770 '1人目
9780 for i=1 to mojicount1
9790 bufcount1$(i-1)=Mid$(buf_Parson1$,i,1)
9800 p1=Complate(bufcount1$(i-1))
9810 count1 = count1 + p1
9820 next i
9830 '2人目
9840 for i=1 to mojicount2
9850 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
9860 p2 = Complate(bufcount2$(i-1))
9870 count2 = count2 + p2
9880 next i
9890 cls 3:
9900 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
9910 color rgb(255,0,0)
9920 'print "数霊 2人用 結果表示"+chr$(13)
9930 print ""+chr$(13)
9940 color rgb(255,255,255)
9950 print "1人目:";buf_Parson1$;chr$(13)
9960 print "数霊1:";count1;chr$(13)
9970 print "2人目:";buf_Parson2$;chr$(13)
9980 print "数霊2:";count2;chr$(13)
9990 print "数霊(合計):";count1 + count2;chr$(13)
10000 color rgb(0,0,0)
10010 print "エンターキーを押してください" + chr$(13)
10020 key$="":bg = 0
10030 'ey$=input$(1)
10040 while (bg <> 1 and key$ <> chr$(13))
10050 bg = strig(1)
10060 key$ = inkey$
10070 pause 2
10080 wend
10090 if (bg = 1 or key$ = chr$(13))  then goto TopScreen:
10100 Surei_Result3:
10110 cls 3:Font 48
10120 zcount2 = 0:count2 = 0
10130 mojicount2 = len(buffer_moji2$)
10140 for n=1 to mojicount2
10150 for j=1 to 116
10160 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
10170 if bufcount2$(n - 1) = bufline$(2 * j) then
10180 zcount2 = zcount2 + 1
10190 endif
10200 next j
10210 next n
10220 for i=1 to mojicount2
10230 n2 = Complate(bufcount2$(i-1))
10240 count2 = count2 + n2
10250 next i
10260 gload Gazo$ + "Screen5.png"
10270 color rgb(255,0,0)
10280 print "数霊の結果表示" + chr$(13)
10290 color rgb(255,255,255)
10300 print "１回目回の文字入力:";buffer_moji$;chr$(13)
10310 print "１回目の数霊(かずたま)";count;chr$(13)
10320 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
10330 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
10340 color rgb(0,0,0)
10350 print "エンターキー:トップ画面";chr$(13)
10360 print "c or C キー:数霊の比較";chr$(13)
10370 key$="":bg=0
10380 while (key$ <> chr$(13) and bg <> 1)
10390 bg=strig(1)
10400 key$=inkey$
10410 pause 2
10420 wend
10430 'key$ = input$(1)
10440 if bg=1 then goto TopScreen:
10450 if key$ = chr$(13) then mode=0:count=0:count2=0:goto TopScreen:
10460 if key$ = "c" or key$ = "C" then
10470 if count = count2 then
10480 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
10490 else
10500 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
10510 endif
10520 endif
10530 Moji_Count_Check:
10540 cls 3:Font 48
10550 gload Gazo$ + "Moji_check.png"
10560 n=0
10570 open FILE_csv$ for input as #1
10580 while eof(1)=0
10590 line input #1, line$
10600 n = n + 1
10610 wend
10620 close #1
10630 'n = n - 1
10640 'talk "登録文字数は"+str$(n)+"文字です"
10650 play ""
10660 if n = 118 then
10670 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
10680 else
10690 talk"登録文字数は、"+str$(n)+"文字です"
10700 endif
10710 print "" + chr$(13)
10720 color rgb(255,0,0)
10730 print "文字の登録文字数は";n;"文字" + chr$(13)
10740 color rgb(0,0,0)
10750 print "エンターキーを押してください"+chr$(13)
10760 'key$ = input$(1)
10770 key$="":bg=0
10780 while (key$<>chr$(13) and bg<>1)
10790 key$=inkey$
10800 bg=strig(1)
10810 pause 2
10820 wend
10830 if bg=1 then goto TopScreen:
10840 if key$ = chr$(13) then
10850 goto TopScreen:
10860 else
10870 goto Moji_Count_Check:
10880 endif
10890 'Save 関数
10900 file_kazutama = 0
10910 file_kazutama = Save_File()
10920 func Save_File()
10930 open SAVE_DATA1$  for output as #1
10940 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
10950 close #1
10960 endfunc
10970 Select_moji:
10980 cls 3:font 48:No = 1
10990 gload Gazo$ + "Screen1_mojicheck.png"
11000 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
11010 color rgb(255,0,0)
11020 'print "文字の確認" + chr$(13)
11030 print chr$(13)
11040 color rgb(255,255,255)
11050 print "番号を選んでください" + chr$(13)
11060 print " :1.登録文字検索"+chr$(13)
11070 print " :2.登録文字数の確認" + chr$(13)
11080 print " :3.前の画面に戻る" + chr$(13)
11090 print " :4.終　了" + chr$(13)
11100 color rgb(0,0,0)
11110 if No = 1 then print "1.登録文字の確認を選択"
11120 Entry_check_key:
11130 y = 0:key$ = "":bg=0
11140 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
11150 y = stick(1)
11160 key$ = inkey$
11170 bg=strig(1)
11180 pause 2
11190 wend
11200 'バーチャルパッド　ここから'
11210 'バーチャルパッド　ここから'
11220 if y = 1 then
11230 select case No
11240 'No の初期値：No=1
11250 case 1:
11260 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.登録文字数の確認":goto Entry_check_key:
11270 'デバッグライン　ここから
11280 '0のとき
11290 'デバッグライン　ここまで
11300 'デバッグライン　ここから
11310 case 2:
11320 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                       "
11330 color rgb(0,0,0):locate 0,12:print " 3.トップ画面に行く":No=3:goto Entry_check_key:
11340 'cls:color rgb(255,255,255):print"ok"
11350 'デバッグライン　ここまで
11360 case 3:
11370 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Entry_check_key:
11380 'デバッグライン　ここから
11390 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11400 'デバッグライン　ここまで
11410 case 0:
11420 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_check_key:
11430 'デバッグライン　ここから
11440 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11450 'デバッグライン　ここまで
11460 end select
11470 endif
11480 'バーチャルパッド　上 ここから
11490 if y = -1 then
11500 select case No
11510 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11520 case 1:
11530 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Entry_check_key:
11540 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11550 case 0:
11560 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                      ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
11570 'No:3 3.Help→2.設定 No:2
11580 case 3:
11590 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
11600 case 2:
11610 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_check_key:
11620 end select
11630 endif
11640 if bg=1 then
11650 select case No
11660 '1.数霊チェックを選択  パッドの右キー
11670 case 1:
11680 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
11690 '2.設定を選択    パッドの右キー
11700 case 2:
11710 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
11720 '3.ヘルプを選択 パッドの右
11730 case 3:
11740 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
11750 'プログラムの終了を選択
11760 case 0:
11770 cls 3:cls 4:ui_msg "プログラムを終了します":color rgb(255,255,255):pause 2.052*1000:end
11780 end select
11790 endif
11800 '4.終了するを選択  パッドの右
11810 'バーチャルパッド　ここまで'
11820 'key$ = input$(1)
11830 'カーソルの下
11840 if key$ = chr$(31) then
11850 select case (No Mod 4)
11860 case 0:
11870 c=1:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
11880 case 1:
11890 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:sp_on 3,0:goto Entry_check_key:
11900 case 2:
11910 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:goto Entry_check_key:
11920 case 3:
11930 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
11940 end select
11950 endif
11960 'カーソル　上
11970 if key$ = chr$(30) then
11980 select case (No Mod 4)
11990 case 0:
12000 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
12010 case 1:
12020 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
12030 case 2:
12040 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
12050 case 3:
12060 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
12070 end select
12080 endif
12090 'エンターキーを押す
12100 if key$ = chr$(13) then
12110 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
12120 if No = 2 then goto Moji_Count_Check:
12130 if No = 3 then goto TopScreen:
12140 if No = 0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg
12150 endif
12160 '
12170 Kakunin_Surei_count:
12180 cls 3:font 48:No=1
12190 gload Gazo$ + "Kazutama_List_Top.png"
12200 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
12210 color rgb(255,0,0)
12220 print chr$(13)
12230 color rgb(255,255,255)
12240 print "番号を選んでください" + chr$(13)
12250 print " :1.数霊リスト 1人用" + chr$(13)
12260 print " :2.トップ画面に行く" + chr$(13)
12270 print " :3.終 了" + chr$(13)
12280 print ""+chr$(13)
12290 color rgb(0,0,0)
12300 locate 0,12:print"                                                         "
12310 if No = 1 then locate 1,12:print "1.数霊リスト　1人用を選択"
12320 Entry_List:
12330 y = 0:key$ = "":bg=0
12340 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
12350 y = stick(1)
12360 key$ = inkey$
12370 bg=strig(1)
12380 pause 2
12390 wend
12400 'バーチャルパッド　ここから'
12410 'バーチャルパッド　ここから'
12420 if y = 1 then
12430 select case No
12440 'No の初期値：No=1
12450 case 1:
12460 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.トップ画面に行く":goto Entry_List:
12470 'デバッグライン　ここから
12480 '0のとき
12490 'デバッグライン　ここまで
12500 'デバッグライン　ここから
12510 case 2:
12520 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                       "
12530 color rgb(0,0,0):locate 1,12:print "3.終 了を選択":No=0:goto Entry_List:
12540 'cls:color rgb(255,255,255):print"ok"
12550 'デバッグライン　ここまで
12560 case 0:
12570 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,200),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "1.数霊リスト 1人用を選択":No=1:goto Entry_List:
12580 'デバッグライン　ここから
12590 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
12600 'デバッグライン　ここまで
12610 'case 0:
12620 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_List:
12630 'デバッグライン　ここから
12640 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
12650 'デバッグライン　ここまで
12660 end select
12670 endif
12680 'バーチャルパッド　上 ここから
12690 if y = -1 then
12700 select case No
12710 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
12720 case 1:
12730 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 1,12:print "                                       ":locate 1,12:print "4.終了を選択"::goto Entry_List:
12740 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
12750 case 0:
12760 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                      ":locate 1,12:print"2.トップ画面に行くを選択":goto Entry_List:
12770 'No:3 3.Help→2.設定 No:2
12780 case 2:
12790 sp_on 1,0:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.数霊リスト 1人用を選択":goto Entry_List:
12800 'case 2:
12810 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_List:
12820 end select
12830 endif
12840 if bg=1 then
12850 select case No
12860 '1.数霊リスト 一人用を選択を選択  パッドの右キー
12870 case 1:
12880 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
12890 '2.設定を選択  パッドの右キー
12900 case 2:
12910 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
12920 '3.終了を選択 パッドの右
12930 case 0:
12940 cls 3:cls 4:color rgb(255,255,255):ui_msg"プログラムを終了します":end
12950 'プログラムの終了を選択
12960 end select
12970 endif
12980 '4.終了するを選択  パッドの右
12990 'バーチャルパッド　ここまで'
13000 'Input "番号:",No
13010 'if No=2 then goto TopScreen:
13020 'if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
13030 'if No=1 then goto Surei_List1:
13040 'if No > 3 or No=0 then ui_msg"無効な数字です、入れ直してください":talk"無効な数字です":goto Kakunin_Surei_count:
13050 'if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
13060 Surei_List1:
13070 cls 3:font 48
13080 file$ = dir$(SAVE_DATA1$,0)
13090 'ファイルが無いときの画面
13100 if file$ = ""  then
13110 gload "./data/Gazo/" + "KazutamaList1.png",0
13120 print chr$(13)
13130 color rgb(255,0,0):print "登録ファイルはございません" + chr$(13)
13140 color rgb(0,0,0):print "エンターキーを押してください" + chr$(13)
13150 'else
13160 'endif
13170 bg = 0:key$ = ""
13180 while (key$ <> chr$(13) and bg<>1)
13190 key$ = inkey$
13200 bg = strig(1)
13210 pause 2
13220 wend
13230 'エンターキーもしくはバーチャルパッドの右でトップに行く
13240 if (bg = 1 or key$ = chr$(13)) then goto TopScreen:
13250 else
13260 cls 3:buffer_list_count = Loadcount()
13270 talk"登録件数は"+str$(buffer_list_count) + "件です"
13280 gload Gazo$ + "KazutamaList1_Entry.png",0
13290 color rgb(0,0,255)
13300 print chr$(13)
13310 color rgb(255,0,0)
13320 print "登録件数:";buffer_list_count;"件";chr$(13)
13330 color rgb(0,0,0)
13340 print "エンターキーを押してください" + chr$(13)
13350 bg = 0:key$ = ""
13360 while (key$ <> chr$(13) and bg <> 1)
13370 key$ = inkey$
13380 bg = strig(1)
13390 pause 2
13400 wend
13410 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
13420 if (key$ = chr$(13) or bg = 1) then pause 2:goto KotodamaList_page:
13430 endif
13440 func Loadcount()
13450 n = 0
13460 open SAVE_DATA1$  for input as #1
13470 while eof(1) = 0
13480 line input #1,line$
13490 n = n + 1
13500 wend
13510 close #1
13520 count_line = n
13530 endfunc count_line
13540 func Kotodama$(buf$)
13550 color rgb(255,255,255)
13560 b = len("数霊:")
13570 a$ = Mid$(buf$,b+1,len(buf$))
13580 for i=0 to 118
13590 color rgb(255,255,255)
13600 if bufline3$(2 * i) ="数霊:" + a$  then
13610 moji_$ = bufline3$(2*i + 1)
13620 'moji_$ = bufline3$(21)
13630 'moji$ = a$
13640 endif
13650 next i
13660 'kotodama$ = a$
13670 kotodama$ = moji_$
13680 endfunc kotodama$
13690 KotodamaList_page:
13700 cls 3:font 48:m = 0:
13710 gload Gazo$ + "Screen5_Surei_List.png"
13720 if SAVE_DATA1$ = "" then
13730 cls 3:print"ファイルがありません"
13740 else
13750 open SAVE_DATA1$  for input as #1
13760 while 2*buffer_list_count > m
13770 input #1,line$
13780 bufKaztama$(m) = line$
13790 m = m + 1
13800 wend
13810 close #1
13820 endif
13830 l = 0
13840 gload Gazo$ + "Screen5_Surei_List.png"
13850 while buffer_list_count > l
13860 cls
13870 color rgb(255,0,0)
13880 'print "数霊　リスト" + chr$(13)
13890 print chr$(13)
13900 color rgb(255,255,255)
13910 'n3 = l:l = l + 1
13920 print "番号:";l+1;chr$(13)
13930 print bufKaztama$(l) + chr$(13)
13940 print bufKaztama$(l + 1) + chr$(13)
13950 'n3 = l:l = l + 1
13960 Kmoji$ = moji$
13970 print chr$(13) + chr$(13)
13980 color rgb(0,0,0)
13990 print "スペース:次へ行く" + chr$(13)
14000 print "エンターキー:トップ画面" + chr$(13)
14010 key$="":bg=0:bg2=0
14020 while (key$ <> chr$(13) and bg <> 1 and bg2 <> 1)
14030 key$ = inkey$
14040 bg = strig(1)
14050 bg2 = strig(0)
14060 pause 2
14070 wend
14080 'key$ = input$(1)
14090 if (key$ = " " or bg2 = 1) then
14100 l = ((l + 1) Mod buffer_list_count):pause 1.58*1000
14110 else
14120 if (key$ = chr$(13) or bg = 1) then
14130 goto TopScreen:
14140 else
14150 goto KotodamaList_page:
14160 endif
14170 endif
14180 wend
14190 '
14200 '結果表示２ Menu1
14210 Surei_Result4:
14220 cls 3:font (48-16):init"kb:4"
14230 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
14240 for i=0 to 181 + 3 - 1
14250 if i = count  then
14260 buffer$ = bufline2$(count + 4,0)
14270 endif
14280 next i
14290 if len(buffer$) > 23 and len(buffer$) <= 45 then
14300 buffer2$ = Mid$(buffer$,1,24)
14310 buffer3$ = Mid$(buffer$,25,(len(buffer$) - 25))
14320 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)
14330 else
14340 if len(buffer$) <= 23 then
14350 buffer2$ = Mid$(buffer$,1,22)
14360 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
14370 else
14380 if len(buffer$) > 45 and len(buffer$) <= 64 then
14390 buffer2$ = Mid$(buffer$,1,22)
14400 buffer3$ = Mid$(buffer$,23,20)
14410 buffer4$ = Mid$(buffer$,43,(len(buffer$)-43))
14420 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)+chr$(13)
14430 else
14440 if len(buffer$) > 64 and len(buffer$) <= 81 then
14450 buffer2$ = Mid$(buffer$,1,23)
14460 buffer3$ = Mid$(buffer$,24,20)
14470 buffer4$ = Mid$(buffer$,42,20)
14480 buffer5$ = Mid$(buffer$,63,(len(buffer$)-62))
14490 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13) + chr$(13) + chr$(13)
14500 if len(buffer$) > 81 and len(buffer$) <= 110 then
14510 buffer2$ = Mid$(buffer$,1,21)
14520 buffer3$ = Mid$(buffer$,22,20)
14530 buffer4$ = Mid$(buffer$,42,20)
14540 buffer5$ = Mid$(buffer$,62,20)
14550 buffer6$ = Mid$(buffer$,82,(len(buffer$) - 82))
14560 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13) + chr$(13) + chr$(13)
14570 endif
14580 endif
14590 endif
14600 endif
14610 endif
14620 Surei_Result4_2:
14630 gload Gazo$ + "Screen1_Result2.png"
14640 cls
14650 color rgb(255,0,0)
14660 'print "診断結果 2" + chr$(13)
14670 print chr$(13)
14680 color rgb(127,255,212)
14690 print "入力文字:";buffer_moji$;chr$(13)
14700 print "数霊:";count;chr$(13)
14710 color rgb(255,255,255)
14720 print "数霊の説明:"+chr$(13)
14730 print buffer$
14740 color rgb(0,0,0)
14750 print "エンターキー(パッド 右):トップ,S(パッド 左):保存する" + chr$(13)
14760 key$="":bg=0:bg2=0
14770 while (key$<>chr$(13) and bg<>1 and bg2<>1)
14780 key$=inkey$
14790 bg=strig(1)
14800 bg2=strig(0)
14810 pause 2
14820 wend
14830 if bg=1 then goto TopScreen:
14840 if key$ = chr$(13) then
14850 buffer$ = "" : buffer_moji$="" : count=0:goto TopScreen:
14860 endif
14870 if bg2=1 then
14880 'ファイルがない時
14890 if dir$(SAVE_DATA1$) = "" then
14900 open SAVE_DATA1$ for output as #1
14910 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
14920 close #1
14930 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
14940 'ファイルが有る時
14950 else
14960 open SAVE_DATA1$ for append as #1
14970 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
14980 close #1
14990 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
15000 endif
15010 endif
15020 if key$="s" or key$="S" then
15030 if dir$(SAVE_DATA1$) = "" then
15040 open SAVE_DATA1$ for output as #1
15050 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
15060 close #1
15070 ui_msg"保存しました":talk"保存しました":goto Surei_Result4_2:
15080 else
15090 open SAVE_DATA1$ for append as #1
15100 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
15110 close #1
15120 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
15130 endif
15140 else
15150 talk "無効な文字です":goto Surei_Result4_2:
15160 endif
15170 'endif
15180 func All_clear()
15190 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
15200 endfunc
