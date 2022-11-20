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
380 Version$ = "1.1.7_2022.11.16(正式版)"
390 'csvファイル 1.数霊 ベースファイル
400 FILE_csv$ = "data/Kazutama.csv"
410 'csvファイル 2.数霊 ベースファイル 2
420 FILE_csv2$ = "data/Surei_chart_20211207.csv"
430 'Save ファイル
440 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
450 'gazo ファイル
460 Gazo$ = "data/Gazo/"
470 'Sound File(Voice)
480 '1.ボイス TopScreen
490 Voice_File_TopScreen$ = "data/Sound_data/"
500 '変数領域
510 'vcount:バーチャルパッド下の変数
520 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50):c=1:vcount=0:timer=0
530 count2 = 0:N=0:N2=0:m2 = 0
540 'ファイルの有無チェック
550 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
560 '1.ファイルが無いとき
570 cls :print "依存ファイルが見つかりません":
580 print "エンターキーを押してください"+chr$(13)
590 key$ = input$(1)
600 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
610 else
620 '2.ファイルが有るとき
630 cls:print "csv:file ok." + chr$(13)
640 n=0
650 open FILE_csv$ for input as #1
660 while eof(1) = 0
670 input #1,line$
680 'print line$
690 bufline$(n) = line$
700 'Print n;chr$(13)
710 n = n + 1
720 wend
730 close #1
740 N=n
750 '2つ目のファイル読み込み
760 'n = 0
770 open FILE_csv2$ for input as #2
780 for n=3 to 181
790 for i=0 to 1
800 input #2,line$
810 bufline2$(n,i) = line$
820 'print bufline2$(n,i)
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
940 'Top画面
950 TopScreen:
960 'バーチャルパッドを表示
970 cls 3:font 48:screen 1,1,1:init"kb:4"
980 'play ""
990 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
1000 gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
1010 '選択肢 1
1020 gload Gazo$ + "Selection.png",1,5,200
1030 '選択肢 2
1040 gload Gazo$ + "Selection.png",1,5,300
1050 '選択肢 3
1060 gload Gazo$ + "Selection.png",1,5,400
1070 '選択肢 4
1080 gload Gazo$ + "Selection.png",1,5,500
1090 color rgb(0,0,255)
1100 print chr$(13)
1110 'print "●Top画面" + chr$(13)
1120 color rgb(255,255,255)
1130 print "番号を選んでください" + chr$(13)
1140 print " :1.数霊(かずたま)チェック" + chr$(13)
1150 print " :2.設定" + chr$(13)
1160 print " :3.ヘルプ" + chr$(13)
1170 print " :4.終　了" + chr$(13)
1180 color rgb(0,0,0)
1190 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
1200 'バーチャルパッドを表示
1210 No=1:locate 1,12:color rgb(0,0,0):print "1.数霊(かずたま)チェックを選択";chr$(13)
1220 'スプライト
1230 '選択肢 1 On
1240 sp_def 0,(5,200),32,32
1250 sp_on 0,1
1260 sp_put 0,(5,200),0,0
1270 '選択肢 2 Off
1280 sp_def 1,(5,300),32,32
1290 sp_on 1,0
1300 sp_put 1,(5,300),0,0
1310 '選択肢 3 Off
1320 sp_def 2,(5,400),32,32
1330 sp_on 2,0
1340 sp_put 2,(5,400),0,0
1350 '選択肢 4 Off
1360 sp_def 3,(5,500),32,32
1370 sp_on 3,0
1380 sp_put 3,(5,500),0,0
1390 color rgb(0,0,0)
1400 Main_Select:
1410 'y:バーチャルパッドの処理
1420 'key$:カーソルの処理
1430 y = 0:key$ = "":bg=0
1440 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
1450 y = stick(1)
1460 key$ = inkey$
1470 bg=strig(1)
1480 pause 2
1490 wend
1500 'if y=1 then
1510 'select case (No Mod 4)
1520 'ase 0:
1530 '     c=1:No=c:sp_on 0,1:sp_on 1,0 :sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print " 数霊(かずたま)チェックを選択":beep:goto Main_Select:
1540 'case 1:
1550 '       =2:No=c:sp_on 0,0:
1560 '"ase 2:
1570 'ase 3:
1580 'nd select
1590 'ndif
1600 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
1610 '1.バーチャルパッドの処理
1620 'バーチャルパッド下を押した時
1630 if y = 1 then
1640 select case No
1650 'No の初期値：No=1
1660 case 1:
1670 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.設定を選択":goto Main_Select:
1680 'デバッグライン　ここから
1690 '0のとき
1700 'デバッグライン　ここまで
1710 'デバッグライン　ここから
1720 case 2:
1730 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                  "
1740 color rgb(0,0,0):locate 1,12:print "2.ヘルプを選択":No=3:goto Main_Select:
1750 'cls:color rgb(255,255,255):print"ok"
1760 'デバッグライン　ここまで
1770 case 3:
1780 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終了を選択":No=0:goto Main_Select:
1790 'デバッグライン　ここから
1800 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
1810 'デバッグライン　ここまで
1820 case 0:
1830 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
1840 'デバッグライン　ここから
1850 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
1860 'デバッグライン　ここまで
1870 end select
1880 endif
1890 'バーチャルパッド　上 ここから
1900 if y = -1 then
1910 select case No
1920 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
1930 case 1:
1940 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print "4.終了を選択":goto Main_Select:
1950 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
1960 case 0:
1970 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.ヘルプを選択":goto Main_Select:
1980 'No:3 3.Help→2.設定 No:2
1990 case 3:
2000 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.設定を選択":goto Main_Select:
2010 case 2:
2020 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.数霊(かずたま)チェックを選択":goto Main_Select
2030 end select
2040 endif
2050 if bg=1 then
2060 select case No
2070 '1.数霊チェックを選択  パッドの右キー
2080 case 1:
2090 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
2100 '2.設定を選択    パッドの右キー
2110 case 2:
2120 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
2130 '3.ヘルプを選択 パッドの右
2140 case 3:
2150 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
2160 'プログラムの終了を選択
2170 case 0:
2180 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
2190 end select
2200 '4.終了するを選択  パッドの右
2210 endif
2220 'バーチャルパッド　上　ここまで
2230 '2.カーソルの処理
2240 'カーソル　下 chr$(31)
2250 if (key$ = chr$(31)) then
2260 select case (No)
2270 '4
2280 '0 選択肢4 => 選択肢1
2290 case 0:
2300 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "              ":color rgb(0,0,0):locate 1,12:print "数霊（かずたま）チェックを選択":beep:goto Main_Select:
2310 '1 選択肢1 => 選択肢2
2320 case 1:
2330 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                ":color rgb(0,0,0):locate 1,12:print "設 定を選択":beep:goto Main_Select:
2340 '2 選択肢2 => 選択肢3
2350 case 2:
2360 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "               ":color rgb(0,0,0):locate 1,12:print " ヘルプを選択":beep:goto Main_Select:
2370 '3 選択肢３ => 選択肢4
2380 case 3:
2390 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "               ":color rgb(255,255,255):locate 1,12:print " 終　了を選択":beep:goto Main_Select:
2400 case else:
2410 goto Main_Select:
2420 end select
2430 endif
2440 'カーソル　上
2450 if key$=chr$(30) then
2460 select case (No)
2470 '選択肢1 => 選択肢4
2480 case 1:
2490 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:PRINT "                 ":locate 1,12:beep:print "数霊(かずたま)チェックを選択":goto Main_Select:
2500 '選択肢2 => 選択肢1
2510 case 2:
2520 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                 ":locate 1,12:beep:print "設 定を選択":beep:goto Main_Select:
2530 '選択肢3　=> 選択肢2
2540 case 3:
2550 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0
2560 '選択肢4 => 選択肢3
2570 case 0:
2580 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 1,12:print "終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
2590 end select
2600 endif
2610 'Input "番号:",No
2620 'エンターキー入力:決定
2630 if key$ = chr$(13) then
2640 select case No
2650 case 1:
2660 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
2670 case 3:
2680 Color rgb(255,255,255):goto Help:
2690 case 0:
2700 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
2710 case 2:
2720 color rgb(255,255,255):goto Setting:
2730 'else
2740 'goto Main_Select:
2750 end select
2760 endif
2770 'ndif
2780 'if N0=0 or No>4 then goto TopScreen:
2790 '1-1.数霊チェック
2800 Surei_Check:
2810 cls 3:Font 48:
2820 'gload Gazo$ + "Screen4.png"
2830 gload Gazo$ + "Screen1_Sureicheck_Top20211226.png"
2840 play ""
2850 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
2860 color rgb(255,0,0)
2870 'print "●数霊(かずたま)チェックトップ" + chr$(13)
2880 sp_on 0,1:sp_put 0,(5,200),0,0:screen 1,1,1
2890 print chr$(13)
2900 color rgb(255,255,255)
2910 print "番号を選んでください" + chr$(13)
2920 print " :1.数霊(かずたま)1人用" + chr$(13)
2930 print " :2.数霊(かずたま)2人用" + chr$(13)
2940 print " :3.前の画面に戻る" + chr$(13)
2950 print " :4.終 了" + chr$(13)
2960 color rgb(0,0,0):No=1
2970 locate 1,12
2980 print "1.数霊1人用を選択"
2990 Kazutama_main:
3000 'y:バーチャルパッドの処理
3010 'key$:カーソルの処理
3020 'bg:バーチャルパッドの右のボタン
3030 y = 0:key$ = "":bg=0
3040 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
3050 y = stick(1)
3060 key$ = inkey$
3070 bg=strig(1)
3080 pause 2
3090 wend
3100 'key$ = input$(1)
3110 if y = 1 then
3120 select case No
3130 'No の初期値：No=1
3140 case 1:
3150 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊(かずたま)2人用を選択":goto Kazutama_main:
3160 'デバッグライン　ここから
3170 '0のとき
3180 'デバッグライン　ここまで
3190 'デバッグライン　ここから
3200 case 2:
3210 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                               "
3220 color rgb(0,0,0):locate 1,12:print "3.前の画面に戻るを選択":No=3:goto Kazutama_main:
3230 'cls:color rgb(255,255,255):print"ok"
3240 'デバッグライン　ここまで
3250 case 3:
3260 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Kazutama_main:
3270 'デバッグライン　ここから
3280 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
3290 'デバッグライン　ここまで
3300 case 0:
3310 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.数霊(かずたま)1人用を選択":goto Kazutama_main:
3320 'デバッグライン　ここから
3330 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
3340 'デバッグライン　ここまで
3350 end select
3360 endif
3370 'バーチャルパッド　上 ここから
3380 if y = -1 then
3390 select case No
3400 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
3410 case 1:
3420 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Kazutama_main:
3430 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
3440 case 0:
3450 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.ヘルプを選択":goto Kazutama_main:
3460 'No:3 3.Help→2.設定 No:2
3470 case 3:
3480 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.設定を選択":goto Kazutama_main:
3490 case 2:
3500 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.数霊(かずたま)チェックを選択":goto Kazutama_main:
3510 end select
3520 endif
3530 if bg=1 then
3540 select case No
3550 '1.数霊チェックを選択  パッドの右キー
3560 case 1:
3570 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
3580 '2.設定を選択    パッドの右キー
3590 case 2:
3600 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
3610 '3.ヘルプを選択 パッドの右
3620 case 3:
3630 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
3640 'プログラムの終了を選択
3650 case 0:
3660 cls 3:cls 4:ui_msg "プログラムを終了します":color rgb(255,255,255):end
3670 end select
3680 '4.終了するを選択  パッドの右
3690 endif
3700 'バーチャルパッド　上　ここまで
3710 if key$ = chr$(31) then
3720 select case No
3730 case 0:
3740 No=1:sp_on 0,0:sp_on 1,1:sp_put 0,(5,300),0,0:locate 1,12:print "                                                          ":locate 0,12:print "2.数霊(かずたま)2人用を選択":goto Kazutama_main:
3750 case 1:
3760 No=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                                          ":locate 1,12:print"3.前の画面に戻るを選択":goto Kazutama_main:
3770 case 2:
3780 No=3:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print"                                       ":locate 1,12:print"4.終了を選択":goto Kazutama_main:
3790 case 3:
3800 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print"1.数霊（かずたま)1人用を選択":goto Kazutama_main:
3810 end select
3820 endif
3830 if key$=chr$(13) then
3840 select case No
3850 case 1:
3860 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_Input:
3870 case 2:
3880 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
3890 case 3:
3900 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
3910 case 0:
3920 cls 4:cls 3:talk"プログラムを終了します":ui_text"プログラムを終了します":end
3930 end select
3940 endif
3950 'Input "番号:",No
3960 '前の画面に戻る
3970 'if No = 3 then goto TopScreen:
3980 'プログラムの終了
3990 'if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":COLOR rgb(255,255,255):end
4000 '1人用
4010 'if No = 1 then goto Surei_Input:
4020 '2人用
4030 'if No = 2 then goto Surei_twoParson:
4040 'if No > 4 or No=0 then ui_msg"もう一度入れてください":goto Surei_Check:
4050 '数霊(かずたま) 文字入力  1人用
4060 Surei_Input:
4070 if mode = 0 then
4080 cls 3:font 32:init"kb:2"
4090 gload Gazo$ + "InputKotodama_20211226.png"
4100 play""
4110 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
4120 color rgb(255,0,0)
4130 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
4140 print chr$(13)
4150 color rgb(0,0,0)
4160 print "文字を入れてください" + chr$(13)
4170 color rgb(255,0,0)
4180 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)"+chr$(13)
4190 print chr$(13)
4200 color rgb(0,0,0)
4210 Input "入力文字:",buffer_moji$
4220 goto Surei_Result:
4230 else
4240 if mode = 1 then
4250 cls 3:Font 32:
4260 gload Gazo$ + "InputKotodama.png"
4270 color rgb(255,0,0)
4280 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
4290 color rgb(255,255,255)
4300 print "文字を入れてください" + chr$(13)
4310 color rgb(255,0,0)
4320 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
4330 print "大文字のみ)" + chr$(13)
4340 color rgb(0,0,0)
4350 Input "文字入力:",buffer_moji2$
4360 goto Surei_Result3:
4370 endif
4380 endif
4390 '数霊(かずたま)文字入力　2人用
4400 Surei_twoParson:
4410 cls 3:Font 32:init"kb:2"
4420 gload Gazo$ + "InputKotodama_20211226.png"
4430 '1人目入力
4440 'color rgb(255,0,0)
4450 print ""+chr$(13)
4460 'print "●数霊(かずたま) 1人目 入力" + chr$(13)
4470 color rgb(255,0,0)
4480 print "1人目の文字を入れてください" + chr$(13)
4490 color rgb(255,0,0)
4500 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
4510 color rgb(0,0,0)
4520 print chr$(13)
4530 Input "1人目文字入力:",buf_Parson1$
4540 Surei_twoParson2:
4550 cls 3:Font 32:init"kb:2"
4560 '2人目入力
4570 gload Gazo$ + "InputKotodama_20211226.png"
4580 'color rgb(255,0,0)
4590 'print "●数霊(かずたま) 2人目 入力" + chr$(13)
4600 print ""+chr$(13)
4610 print "2人目の文字を入れてください" + chr$(13)
4620 color rgb(255,0,0)
4630 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
4640 color rgb(0,0,0)
4650 Input "2人目の文字入力:",buf_Parson2$
4660 goto Surei_Result2:
4670 '数霊　計算 パート
4680 '文字の計算関数
4690 'moji$:1文字を入れる
4700 func Complate(moji$)
4710 for n = 1 to 116
4720 if moji$ = bufline$(2*n) then
4730 buffcount = val(bufline$(2 * n + 1))
4740 endif
4750 next n
4760 endfunc buffcount
4770 '数霊　結果表示
4780 Surei_Result:
4790 cls 3:Font 32
4800 'ゼロカウント:zcount
4810 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
4820 '例 アカい:"い"の文字は無効な文字なので、はじく
4830 zcount=0
4840 'mojicount:入力文字数
4850 mojicount = len(buffer_moji$)
4860 for n=1 to mojicount
4870 for j=1 to 118
4880 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
4890 if bufcount$(n - 1) = bufline$(2 * j) then
4900 zcount = zcount + 1
4910 endif
4920 next j
4930 next n
4940 if mojicount > zcount then
4950 cls 3:ui_msg "無効な文字です":talk"無効な文字があります。":zcount = 0:goto Surei_Input:
4960 endif
4970 for i = 1 to mojicount
4980 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
4990 n1 = Complate(bufcount$(i - 1))
5000 count = count + n1
5010 next i
5020 '182以上のとき,181を引く
5030 if (count > 181) then count = count - 181
5040 cls 3:Font 48+16
5050 gload Gazo$ + "Result_Screen3_20211226.png"
5060 color rgb(255,0,0)
5070 print "入力文字:" + buffer_moji$ + chr$(13)
5080 'print chr$(13)
5090 color rgb(0,0,255)
5100 print "数霊(かずたま):";count;chr$(13)
5110 color rgb(0,0,0)
5120 print "エンターキー:トップ" + chr$(13)
5130 print "スペース:次 へ" + chr$(13)
5140 key$ = input$(1)
5150 if key$ = " " then goto Surei_Result4:
5160 if key$ = chr$(13) then
5170 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
5180 for i=0 to 9
5190 bufcount$(i) = " "
5200 next i
5210 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
5220 'else
5230 'if key$ = " " then
5240 '２回めの入力に行く
5250 'mode = 1:goto Surei_Input:
5260 'else
5270 'if key$ = "s" or key$ = "S" then
5280 'ファイルを保存する
5290 's = Save()
5300 'ui_msg"保存しました"
5310 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
5320 else
5330 goto Surei_Result:
5340 'endif
5350 endif
5360 '3-1 バージョン情報
5370 Version:
5380 cls 3:Font 32
5390 gload Gazo$ + "Screen1_Version.png"
5400 play ""
5410 play Voice_File_TopScreen$ + "Voice_Version.mp3"
5420 color rgb(255,0,0)
5430 'print"●バージョン情報"+chr$(13)
5440 print chr$(13)
5450 color rgb(255,255,255)
5460 print "Ver:";Version$ + chr$(13)
5470 print "アプリ名:数霊"+ chr$(13)
5480 print "for Basic for Android"+chr$(13)
5490 print "Author:licksjp"+chr$(13)
5500 print "制作開始:2021.7.28" + chr$(13)
5510 print chr$(13)
5520 print "(C)Copy right licksjp " + chr$(13)
5530 print "All rights reserved" + chr$(13)
5540 color rgb(0,0,0)
5550 print "エンターキーを押してください" + chr$(13)
5560 'key$ = input$(1)
5570 bg=0:key$=""
5580 while (bg <> 1 and key$ <> chr$(13))
5590 bg = strig(1)
5600 key$ = inkey$
5610 pause 2
5620 wend
5630 if key$ = chr$(13) then
5640 goto TopScreen:
5650 'else
5660 'talk "無効なキーです":goto Version:
5670 else
5680 if bg=1 then
5690 goto TopScreen:
5700 else
5710 talk "無効なキーです":goto Version:
5720 endif
5730 endif
5740 '3-2 参考文献
5750 Reference_Book:
5760 cls 3:Font 48:play""
5770 gload Gazo$ + "Screen1_Reference.png"
5780 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
5790 color rgb(255,0,0)
5800 'print"●参考文献" + chr$(13)
5810 print chr$(13)
5820 color rgb(255,255,255)
5830 print "書名:数霊" + chr$(13)
5840 print "出版社:徳間書店" + chr$(13)
5850 print "ISBN:978-4-19-" + chr$(13)
5860 print "         865309-5" + chr$(13)
5870 print "定価:2300円 + 税" + chr$(13)
5880 color rgb(0,0,0)
5890 print "エンターキーを押してください"
5900 bg=0:key$=""
5910 while (bg <> 1 and key$ <> chr$(13))
5920 bg = strig(1)
5930 key$ = inkey$
5940 pause 2
5950 wend
5960 if key$ = chr$(13) then
5970 goto TopScreen:
5980 'else
5990 'talk "無効なキーです":goto Reference_Book:
6000 else
6010 if bg=1 then
6020 goto TopScreen:
6030 else
6040 talk "無効なキーです":goto Reference_Book:
6050 endif
6060 endif
6070 'key$=input$(1)
6080 'if key$=chr$(13) then
6090 'goto TopScreen:
6100 'else
6110 'talk"無効なキーです":goto Reference_Book:
6120 'endif
6130 'ヘルプ画面　トップ画面
6140 Help:
6150 No=1:c=0
6160 play ""
6170 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
6180 cls 3:Font 48:
6190 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
6200 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0
6210 color rgb(255,0,0)
6220 'print "●3.ヘルプ　トップ画面" + chr$(13)
6230 print chr$(13)
6240 color rgb(255,255,255)
6250 print "番号を選んでください" + chr$(13)
6260 print " :1.バージョン" + chr$(13)
6270 print " :2.参考文献" + chr$(13)
6280 print " :3.トップ画面" + chr$(13)
6290 print " :4.終 了" + chr$(13)
6300 color rgb(0,0,0)
6310 if No = 1 then print " バージョンを選択"
6320 'y:バーチャルパッドの処理
6330 'key$:カーソルの処理
6340 'bg:バーチャルパッドの右ボタン
6350 Help_key:
6360 y = 0:key$ = "":bg=0
6370 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
6380 y = stick(1)
6390 key$ = inkey$
6400 bg=strig(1)
6410 pause 2
6420 wend
6430 'バーチャルパッド　ここから'
6440 if y = 1 then
6450 select case No
6460 'No の初期値：No=1
6470 case 1:
6480 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.参考文献を選択":goto Help_key:
6490 'デバッグライン　ここから
6500 '0のとき
6510 'デバッグライン　ここまで
6520 'デバッグライン　ここから
6530 case 2:
6540 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 1,12:print "                  "
6550 color rgb(0,0,0):locate 1,12:print "3.トップ画面に行くを選択":No=3:goto Help_key:
6560 'cls:color rgb(255,255,255):print"ok"
6570 'デバッグライン　ここまで
6580 case 3:
6590 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Help_key:
6600 'デバッグライン　ここから
6610 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
6620 'デバッグライン　ここまで
6630 case 0:
6640 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.バージョンを選択":goto Help_key:
6650 'デバッグライン　ここから
6660 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
6670 'デバッグライン　ここまで
6680 end select
6690 endif
6700 'バーチャルパッド　上 ここから
6710 if y = -1 then
6720 select case No
6730 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
6740 case 1:
6750 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Kazutama_main:
6760 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
6770 case 0:
6780 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面に行くを選択":goto Kazutama_main:
6790 'No:3 3.Help→2.設定 No:2
6800 case 3:
6810 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.参考文献を選択":goto Kazutama_main:
6820 case 2:
6830 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.バージョンを選択":goto Kazutama_main:
6840 end select
6850 endif
6860 if bg=1 then
6870 select case No
6880 '1.数霊チェックを選択  パッドの右キー
6890 case 1:
6900 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
6910 '2.設定を選択    パッドの右キー
6920 case 2:
6930 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
6940 '3.ヘルプを選択 パッドの右
6950 case 3:
6960 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
6970 'プログラムの終了を選択
6980 case 0:
6990 cls 3:cls 4:ui_msg "プログラムを終了します":color rgb(255,255,255):end
7000 end select
7010 '4.終了するを選択  パッドの右
7020 endif
7030 'バーチャルパッド　上　ここまで
7040 'バーチャルパッド　ここまで'
7050 'key$ = input$(1)
7060 'カーソルの下
7070 if key$ = chr$(31) then
7080 select case (No Mod 4)
7090 'バージョンから参考文献
7100 case 0:
7110 c=1:No=c:locate 0,12:Print "           ":locate 0,12:print " 参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
7120 '参考文献からトップ画面
7130 case 1:
7140 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "            ":locate 0,12:print " トップ画面を選択":goto Help_key:
7150 'トップ画面から終了
7160 case 2:
7170 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 0,12:print " 終 了を選択":goto Help_key:
7180 '終了からバージョン
7190 case 3:
7200 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                     ":locate 0,12:print " バージョンを選択":goto Help_key:
7210 case else:
7220 goto Help_key:
7230 end select
7240 endif
7250 'カーソル　上
7260 if key$ = chr$(30) then
7270 select case (c Mod 4)
7280 'バージョンから終了
7290 case 0:
7300 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:locate 0,12:print "                   ":locate 0,12:print " 終 了を選択":goto Help_key:
7310 '参考文献からバージョン
7320 case 1:
7330 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                   ":locate 0,12:print " バージョンを選択":goto Help_key:
7340 'トップ画面から参考文献
7350 case 2:
7360 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":locate 0,12:print " 参考文献を選択":goto Help_key:
7370 '終了からトップ画面を選択
7380 case 3:
7390 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print"                      ":locate 0,12:print " トップ画面を選択":goto Help_key:
7400 case else:
7410 goto Help_key:
7420 end select
7430 endif
7440 'Input "番号:",No
7450 'sp_def 0,(5,200),32,32
7460 'エンターキー：決定
7470 if key$=chr$(13) then
7480 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
7490 if No=3 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
7500 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
7510 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
7520 else
7530 goto Help_key:
7540 endif
7550 'if (No = 0 or No > 4) then ui_msg"もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
7560 '登録文字の確認
7570 '文字を1文字入れて登録されているか調べるメニュー
7580 '設定項目
7590 Setting:
7600 cls 3:Font 48
7610 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
7620 play ""
7630 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
7640 No=1
7650 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
7660 color rgb(0,0,255)
7670 'print "●設定項目" + chr$(13)
7680 print chr$(13)
7690 color rgb(255,255,255)
7700 print "番号を選んでください" + chr$(13)
7710 print " :1.登録文字の確認" + chr$(13)
7720 print " :2.数霊文字確認" + chr$(13)
7730 print " :3.トップ画面に行く" + chr$(13)
7740 print " :4.終 了" + chr$(13)
7750 color rgb(0,0,0)
7760 locate 1,12
7770 if No=1 then print "1.登録文字の確認を選択"
7780 'y:バーチャルパッドの処理
7790 'key$:カーソルの処理
7800 'bg:バーチャルパッドの右ボタン
7810 SettingScreen:
7820 y = 0:key$ = "":bg=0
7830 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
7840 y = stick(1)
7850 key$ = inkey$
7860 bg=strig(1)
7870 pause 2
7880 wend
7890 'バーチャルパッド　ここから'
7900 'バーチャルパッド　ここから'
7910 if y = 1 then
7920 select case No
7930 'No の初期値：No=1
7940 case 1:
7950 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
7960 'デバッグライン　ここから
7970 '0のとき
7980 'デバッグライン　ここまで
7990 'デバッグライン　ここから
8000 case 2:
8010 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
8020 color rgb(0,0,0):locate 1,12:print "3.トップ画面に行くを選択":No=3:goto SettingScreen:
8030 'cls:color rgb(255,255,255):print"ok"
8040 'デバッグライン　ここまで
8050 case 3:
8060 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
8070 'デバッグライン　ここから
8080 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
8090 'デバッグライン　ここまで
8100 case 0:
8110 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
8120 'デバッグライン　ここから
8130 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
8140 'デバッグライン　ここまで
8150 end select
8160 endif
8170 'バーチャルパッド　上 ここから
8180 if y = -1 then
8190 select case No
8200 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
8210 case 1:
8220 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
8230 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
8240 case 0:
8250 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
8260 'No:3 3.Help→2.設定 No:2
8270 case 3:
8280 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
8290 case 2:
8300 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
8310 end select
8320 endif
8330 if bg=1 then
8340 select case No
8350 '1.数霊チェックを選択  パッドの右キー
8360 case 1:
8370 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
8380 '2.設定を選択    パッドの右キー
8390 case 2:
8400 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
8410 '3.ヘルプを選択 パッドの右
8420 case 3:
8430 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
8440 'プログラムの終了を選択
8450 case 0:
8460 cls 3:cls 4:ui_msg "プログラムを終了します":color rgb(255,255,255):pause 2.052*1000:end
8470 end select
8480 endif
8490 '4.終了するを選択  パッドの右
8500 'バーチャルパッド　ここまで'
8510 'SettingScreen:
8520 'key$ = input$(1)
8530 'カーソル下'
8540 if key$ =chr$(31) then
8550 select case (No Mod 4)
8560 '登録文字から数霊文字の確認
8570 case 1:
8580 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
8590 '数霊文字の確認からトップ画面に行く
8600 case 2:
8610 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
8620 'トップ画面に行くから終了
8630 case 3:
8640 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
8650 '終了から登録文字
8660 case 0:
8670 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
8680 end select
8690 endif
8700 'カーソル　上
8710 if key$ = chr$(30) then
8720 select case (No Mod 4)
8730 case 1:
8740 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
8750 case 2:
8760 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
8770 case 3:
8780 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
8790 case 0:
8800 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
8810 end select
8820 endif
8830 'エンターキーを押したとき
8840 if key$ = chr$(13) then
8850 if No=3 then goto TopScreen:
8860 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
8870 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
8880 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:color rgb(255,255,255):pause 3*120:end
8890 'lse
8900 'o'o SettingScreen:
8910 endif
8920 'endif
8930 'endif
8940 '文字検索項目  ここから
8950 Moji_Search:
8960 cls 4:cls 3:Font 32+16:init"kb:2"
8970 gload Gazo$ + "Moji_Search_Result.png"
8980 play ""
8990 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
9000 print "" + chr$(13)
9010 color rgb(255,0,0)
9020 print "文字を一文字入れてください" + chr$(13)
9030 color rgb(0,0,0)
9040 Input "登録文字:",moji$
9050 moji_count = len(moji$)
9060 if moji_count > 1 then
9070 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
9080 else
9090 count=0
9100 for n = 0 to 116
9110 if bufline$(2*n) = moji$ then
9120 cls 3:font 48:init"kb:4"
9130 gload Gazo$ + "Moji_Search_Result.png"
9140 'talk"この文字は登録されています"
9150 play ""
9160 play Voice_File_TopScreen$+"Voice_Entry_OK.mp3"
9170 print chr$(13)
9180 color rgb(255,0,0)
9190 print moji$;"は、登録されています。" + chr$(13)
9200 color rgb(0,0,0)
9210 print "エンターキーを押してください"
9220 bg=0:key$=""
9230 while (bg<>1 and key$<>chr$(13))
9240 key$=inkey$
9250 bg=strig(1)
9260 pause 2
9270 wend
9280 'y$=input$(1)
9290 if key$=chr$(13) then goto TopScreen:
9300 if bg=1 then goto TopScreen:
9310 count = count + 1
9320 endif
9330 next n
9340 if count = 0 then
9350 cls 3:font 48:init "kb:2"
9360 gload Gazo$ + "Moji_check.png"
9370 play ""
9380 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
9390 print chr$(13)
9400 color rgb(255,0,0)
9410 print moji$;"は、登録されていません。" + chr$(13)
9420 color rgb(0,0,0)
9430 print "エンターキーを押してください" + chr$(13)
9440 kg = 0:key$ = ""
9450 while (kg <> 1 and key$ <> chr$(13))
9460 key$ = inkey$
9470 kg = strig(1)
9480 pause 2
9490 wend
9500 if key$ = chr$(13) then goto TopScreen:
9510 endif
9520 endif
9530 Surei_Result2:
9540 cls 3:Font 48
9550 zcount1=0:zcount2=0:count1=0:count2=0
9560 '1人目
9570 mojicount1=len(buf_Parson1$)
9580 '2人目
9590 mojicount2=len(buf_Parson2$)
9600 '1人目
9610 for n=1 to mojicount1
9620 for j=1 to 116
9630 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
9640 if bufcount1$(n-1) = bufline$(2*j) then
9650 zcount1 = zcount1 + 1
9660 endif
9670 next j
9680 next n
9690 '2人目
9700 for n=1 to mojicount2
9710 for j=1 to 116
9720 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
9730 if bufcount2$(n-1) = bufline$(2*j) then
9740 zount2 = zcount2 + 1
9750 endif
9760 next j
9770 next n
9780 '1人目
9790 for i=1 to mojicount1
9800 bufcount1$(i-1)=Mid$(buf_Parson1$,i,1)
9810 p1=Complate(bufcount1$(i-1))
9820 count1 = count1 + p1
9830 next i
9840 '2人目
9850 for i=1 to mojicount2
9860 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
9870 p2 = Complate(bufcount2$(i-1))
9880 count2 = count2 + p2
9890 next i
9900 cls 3:
9910 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
9920 color rgb(255,0,0)
9930 'print "数霊 2人用 結果表示"+chr$(13)
9940 print ""+chr$(13)
9950 color rgb(255,255,255)
9960 print "1人目:";buf_Parson1$;chr$(13)
9970 print "数霊1:";count1;chr$(13)
9980 print "2人目:";buf_Parson2$;chr$(13)
9990 print "数霊2:";count2;chr$(13)
10000 print "数霊(合計):";count1 + count2;chr$(13)
10010 color rgb(0,0,0)
10020 print "エンターキーを押してください" + chr$(13)
10030 key$="":bg = 0
10040 'ey$=input$(1)
10050 while (bg <> 1 and key$ <> chr$(13))
10060 bg = strig(1)
10070 key$ = inkey$
10080 pause 2
10090 wend
10100 if (bg = 1 or key$ = chr$(13))  then goto TopScreen:
10110 Surei_Result3:
10120 cls 3:Font 48
10130 zcount2 = 0:count2 = 0
10140 mojicount2 = len(buffer_moji2$)
10150 for n=1 to mojicount2
10160 for j=1 to 116
10170 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
10180 if bufcount2$(n - 1) = bufline$(2 * j) then
10190 zcount2 = zcount2 + 1
10200 endif
10210 next j
10220 next n
10230 for i=1 to mojicount2
10240 n2 = Complate(bufcount2$(i-1))
10250 count2 = count2 + n2
10260 next i
10270 gload Gazo$ + "Screen5.png"
10280 color rgb(255,0,0)
10290 print "数霊の結果表示" + chr$(13)
10300 color rgb(255,255,255)
10310 print "１回目回の文字入力:";buffer_moji$;chr$(13)
10320 print "１回目の数霊(かずたま)";count;chr$(13)
10330 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
10340 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
10350 color rgb(0,0,0)
10360 print "エンターキー:トップ画面";chr$(13)
10370 print "c or C キー:数霊の比較";chr$(13)
10380 key$="":bg=0
10390 while (key$ <> chr$(13) and bg <> 1)
10400 bg=strig(1)
10410 key$=inkey$
10420 pause 2
10430 wend
10440 'key$ = input$(1)
10450 if bg=1 then goto TopScreen:
10460 if key$ = chr$(13) then mode=0:count=0:count2=0:goto TopScreen:
10470 if key$ = "c" or key$ = "C" then
10480 if count = count2 then
10490 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
10500 else
10510 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
10520 endif
10530 endif
10540 Moji_Count_Check:
10550 cls 3:Font 48
10560 gload Gazo$ + "Moji_check.png"
10570 n=0
10580 open FILE_csv$ for input as #1
10590 while eof(1)=0
10600 line input #1, line$
10610 n = n + 1
10620 wend
10630 close #1
10640 'n = n - 1
10650 'talk "登録文字数は"+str$(n)+"文字です"
10660 play ""
10670 if n = 118 then
10680 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
10690 else
10700 talk"登録文字数は、"+str$(n)+"文字です"
10710 endif
10720 print "" + chr$(13)
10730 color rgb(255,0,0)
10740 print "文字の登録文字数は";n;"文字" + chr$(13)
10750 color rgb(0,0,0)
10760 print "エンターキーを押してください"+chr$(13)
10770 'key$ = input$(1)
10780 key$="":bg=0
10790 while (key$<>chr$(13) and bg<>1)
10800 key$=inkey$
10810 bg=strig(1)
10820 pause 2
10830 wend
10840 if bg=1 then goto TopScreen:
10850 if key$ = chr$(13) then
10860 goto TopScreen:
10870 else
10880 goto Moji_Count_Check:
10890 endif
10900 'Save 関数
10910 file_kazutama = 0
10920 file_kazutama = Save_File()
10930 func Save_File()
10940 open SAVE_DATA1$  for output as #1
10950 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
10960 close #1
10970 endfunc
10980 Select_moji:
10990 cls 3:font 48:No = 1
11000 gload Gazo$ + "Screen1_mojicheck.png"
11010 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
11020 color rgb(255,0,0)
11030 'print "文字の確認" + chr$(13)
11040 print chr$(13)
11050 color rgb(255,255,255)
11060 print "番号を選んでください" + chr$(13)
11070 print " :1.登録文字検索"+chr$(13)
11080 print " :2.登録文字数の確認" + chr$(13)
11090 print " :3.前の画面に戻る" + chr$(13)
11100 print " :4.終　了" + chr$(13)
11110 color rgb(0,0,0)
11120 if No = 1 then print "1.登録文字の確認を選択"
11130 Entry_check_key:
11140 y = 0:key$ = "":bg=0
11150 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
11160 y = stick(1)
11170 key$ = inkey$
11180 bg=strig(1)
11190 pause 2
11200 wend
11210 'バーチャルパッド　ここから'
11220 'バーチャルパッド　ここから'
11230 if y = 1 then
11240 select case No
11250 'No の初期値：No=1
11260 case 1:
11270 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.登録文字数の確認":goto Entry_check_key:
11280 'デバッグライン　ここから
11290 '0のとき
11300 'デバッグライン　ここまで
11310 'デバッグライン　ここから
11320 case 2:
11330 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                       "
11340 color rgb(0,0,0):locate 0,12:print " 3.トップ画面に行く":No=3:goto Entry_check_key:
11350 'cls:color rgb(255,255,255):print"ok"
11360 'デバッグライン　ここまで
11370 case 3:
11380 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Entry_check_key:
11390 'デバッグライン　ここから
11400 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11410 'デバッグライン　ここまで
11420 case 0:
11430 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_check_key:
11440 'デバッグライン　ここから
11450 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11460 'デバッグライン　ここまで
11470 end select
11480 endif
11490 'バーチャルパッド　上 ここから
11500 if y = -1 then
11510 select case No
11520 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11530 case 1:
11540 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Entry_check_key:
11550 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11560 case 0:
11570 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                      ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
11580 'No:3 3.Help→2.設定 No:2
11590 case 3:
11600 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
11610 case 2:
11620 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_check_key:
11630 end select
11640 endif
11650 if bg=1 then
11660 select case No
11670 '1.数霊チェックを選択  パッドの右キー
11680 case 1:
11690 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
11700 '2.設定を選択    パッドの右キー
11710 case 2:
11720 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
11730 '3.ヘルプを選択 パッドの右
11740 case 3:
11750 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
11760 'プログラムの終了を選択
11770 case 0:
11780 cls 3:cls 4:ui_msg "プログラムを終了します":color rgb(255,255,255):pause 2.052*1000:end
11790 end select
11800 endif
11810 '4.終了するを選択  パッドの右
11820 'バーチャルパッド　ここまで'
11830 'key$ = input$(1)
11840 'カーソルの下
11850 if key$ = chr$(31) then
11860 select case (No Mod 4)
11870 case 0:
11880 c=1:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
11890 case 1:
11900 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:sp_on 3,0:goto Entry_check_key:
11910 case 2:
11920 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:goto Entry_check_key:
11930 case 3:
11940 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
11950 end select
11960 endif
11970 'カーソル　上
11980 if key$ = chr$(30) then
11990 select case (No Mod 4)
12000 case 0:
12010 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
12020 case 1:
12030 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
12040 case 2:
12050 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
12060 case 3:
12070 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
12080 end select
12090 endif
12100 'エンターキーを押す
12110 if key$ = chr$(13) then
12120 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
12130 if No = 2 then goto Moji_Count_Check:
12140 if No = 3 then goto TopScreen:
12150 if No = 0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg
12160 endif
12170 '
12180 Kakunin_Surei_count:
12190 cls 3:font 48:No=1
12200 gload Gazo$ + "Kazutama_List_Top.png"
12210 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
12220 color rgb(255,0,0)
12230 print chr$(13)
12240 color rgb(255,255,255)
12250 print "番号を選んでください" + chr$(13)
12260 print " :1.数霊リスト 1人用" + chr$(13)
12270 print " :2.トップ画面に行く" + chr$(13)
12280 print " :3.終 了" + chr$(13)
12290 print ""+chr$(13)
12300 color rgb(0,0,0)
12310 locate 0,12:print"                                                         "
12320 if No = 1 then locate 1,12:print "1.数霊リスト　1人用を選択"
12330 Entry_List:
12340 y = 0:key$ = "":bg=0
12350 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
12360 y = stick(1)
12370 key$ = inkey$
12380 bg=strig(1)
12390 pause 2
12400 wend
12410 'バーチャルパッド　ここから'
12420 'バーチャルパッド　ここから'
12430 if y = 1 then
12440 select case No
12450 'No の初期値：No=1
12460 case 1:
12470 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.トップ画面に行く":goto Entry_List:
12480 'デバッグライン　ここから
12490 '0のとき
12500 'デバッグライン　ここまで
12510 'デバッグライン　ここから
12520 case 2:
12530 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                       "
12540 color rgb(0,0,0):locate 1,12:print "3.終 了を選択":No=0:goto Entry_List:
12550 'cls:color rgb(255,255,255):print"ok"
12560 'デバッグライン　ここまで
12570 case 0:
12580 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,200),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "1.数霊リスト 1人用を選択":No=1:goto Entry_List:
12590 'デバッグライン　ここから
12600 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
12610 'デバッグライン　ここまで
12620 'case 0:
12630 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_List:
12640 'デバッグライン　ここから
12650 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
12660 'デバッグライン　ここまで
12670 end select
12680 endif
12690 'バーチャルパッド　上 ここから
12700 if y = -1 then
12710 select case No
12720 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
12730 case 1:
12740 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 1,12:print "                                       ":locate 1,12:print "4.終了を選択"::goto Entry_List:
12750 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
12760 case 0:
12770 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                      ":locate 1,12:print"2.トップ画面に行くを選択":goto Entry_List:
12780 'No:3 3.Help→2.設定 No:2
12790 case 2:
12800 sp_on 1,0:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.数霊リスト 1人用を選択":goto Entry_List:
12810 'case 2:
12820 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_List:
12830 end select
12840 endif
12850 if bg=1 then
12860 select case No
12870 '1.数霊リスト 一人用を選択を選択  パッドの右キー
12880 case 1:
12890 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
12900 '2.設定を選択  パッドの右キー
12910 case 2:
12920 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
12930 '3.終了を選択 パッドの右
12940 case 0:
12950 cls 3:cls 4:color rgb(255,255,255):ui_msg"プログラムを終了します":end
12960 'プログラムの終了を選択
12970 end select
12980 endif
12990 '4.終了するを選択  パッドの右
13000 'バーチャルパッド　ここまで'
13010 'Input "番号:",No
13020 'if No=2 then goto TopScreen:
13030 'if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
13040 'if No=1 then goto Surei_List1:
13050 'if No > 3 or No=0 then ui_msg"無効な数字です、入れ直してください":talk"無効な数字です":goto Kakunin_Surei_count:
13060 'if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
13070 Surei_List1:
13080 cls 3:font 48
13090 file$ = dir$(SAVE_DATA1$,0)
13100 'ファイルが無いときの画面
13110 if file$ = ""  then
13120 gload "./data/Gazo/" + "KazutamaList1.png",0
13130 print chr$(13)
13140 color rgb(255,0,0):print "登録ファイルはございません" + chr$(13)
13150 color rgb(0,0,0):print "エンターキーを押してください" + chr$(13)
13160 'else
13170 'endif
13180 bg = 0:key$ = ""
13190 while (key$ <> chr$(13) and bg<>1)
13200 key$ = inkey$
13210 bg = strig(1)
13220 pause 2
13230 wend
13240 'エンターキーもしくはバーチャルパッドの右でトップに行く
13250 if (bg = 1 or key$ = chr$(13)) then goto TopScreen:
13260 else
13270 cls 3:buffer_list_count = Loadcount()
13280 talk"登録件数は"+str$(buffer_list_count) + "件です"
13290 gload Gazo$ + "KazutamaList1_Entry.png",0
13300 color rgb(0,0,255)
13310 print chr$(13)
13320 color rgb(255,0,0)
13330 print "登録件数:";buffer_list_count;"件";chr$(13)
13340 color rgb(0,0,0)
13350 print "エンターキーを押してください" + chr$(13)
13360 bg = 0:key$ = ""
13370 while (key$ <> chr$(13) and bg <> 1)
13380 key$ = inkey$
13390 bg = strig(1)
13400 pause 2
13410 wend
13420 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
13430 if (key$ = chr$(13) or bg = 1) then pause 2:goto KotodamaList_page:
13440 endif
13450 func Loadcount()
13460 n = 0
13470 open SAVE_DATA1$  for input as #1
13480 while eof(1) = 0
13490 line input #1,line$
13500 n = n + 1
13510 wend
13520 close #1
13530 count_line = n
13540 endfunc count_line
13550 func Kotodama$(buf$)
13560 color rgb(255,255,255)
13570 b = len("数霊:")
13580 a$ = Mid$(buf$,b+1,len(buf$))
13590 for i=0 to 118
13600 color rgb(255,255,255)
13610 if bufline3$(2 * i) ="数霊:" + a$  then
13620 moji_$ = bufline3$(2*i + 1)
13630 'moji_$ = bufline3$(21)
13640 'moji$ = a$
13650 endif
13660 next i
13670 'kotodama$ = a$
13680 kotodama$ = moji_$
13690 endfunc kotodama$
13700 KotodamaList_page:
13710 cls 3:font 48:m = 0:
13720 gload Gazo$ + "Screen5_Surei_List.png"
13730 if SAVE_DATA1$ = "" then
13740 cls 3:print"ファイルがありません"
13750 else
13760 open SAVE_DATA1$  for input as #1
13770 while 2*buffer_list_count > m
13780 input #1,line$
13790 bufKaztama$(m) = line$
13800 m = m + 1
13810 wend
13820 close #1
13830 endif
13840 l = 0
13850 gload Gazo$ + "Screen5_Surei_List.png"
13860 while buffer_list_count > l
13870 cls
13880 color rgb(255,0,0)
13890 'print "数霊　リスト" + chr$(13)
13900 print chr$(13)
13910 color rgb(255,255,255)
13920 'n3 = l:l = l + 1
13930 print "番号:";l+1;chr$(13)
13940 print bufKaztama$(l) + chr$(13)
13950 print bufKaztama$(l + 1) + chr$(13)
13960 'n3 = l:l = l + 1
13970 Kmoji$ = moji$
13980 print chr$(13) + chr$(13)
13990 color rgb(0,0,0)
14000 print "スペース:次へ行く" + chr$(13)
14010 print "エンターキー:トップ画面" + chr$(13)
14020 key$="":bg=0:bg2=0
14030 while (key$ <> chr$(13) and bg <> 1 and bg2 <> 1)
14040 key$ = inkey$
14050 bg = strig(1)
14060 bg2 = strig(0)
14070 pause 2
14080 wend
14090 'key$ = input$(1)
14100 if (key$ = " " or bg2 = 1) then
14110 l = ((l + 1) Mod buffer_list_count):pause 1.58*1000
14120 else
14130 if (key$ = chr$(13) or bg = 1) then
14140 goto TopScreen:
14150 else
14160 goto KotodamaList_page:
14170 endif
14180 endif
14190 wend
14200 '
14210 '結果表示２ Menu1
14220 Surei_Result4:
14230 cls 3:font (48-16):init"kb:4"
14240 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
14250 for i=0 to 181 + 3 - 1
14260 if i = count  then
14270 buffer$ = bufline2$(count + 4,0)
14280 endif
14290 next i
14300 if len(buffer$) > 23 and len(buffer$) <= 45 then
14310 buffer2$ = Mid$(buffer$,1,24)
14320 buffer3$ = Mid$(buffer$,25,(len(buffer$) - 25))
14330 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)
14340 else
14350 if len(buffer$) <= 23 then
14360 buffer2$ = Mid$(buffer$,1,22)
14370 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
14380 else
14390 if len(buffer$) > 45 and len(buffer$) <= 64 then
14400 buffer2$ = Mid$(buffer$,1,22)
14410 buffer3$ = Mid$(buffer$,23,20)
14420 buffer4$ = Mid$(buffer$,43,(len(buffer$)-43))
14430 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)+chr$(13)
14440 else
14450 if len(buffer$) > 64 and len(buffer$) <= 81 then
14460 buffer2$ = Mid$(buffer$,1,23)
14470 buffer3$ = Mid$(buffer$,24,20)
14480 buffer4$ = Mid$(buffer$,42,20)
14490 buffer5$ = Mid$(buffer$,63,(len(buffer$)-62))
14500 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13) + chr$(13) + chr$(13)
14510 if len(buffer$) > 81 and len(buffer$) <= 110 then
14520 buffer2$ = Mid$(buffer$,1,21)
14530 buffer3$ = Mid$(buffer$,22,20)
14540 buffer4$ = Mid$(buffer$,42,20)
14550 buffer5$ = Mid$(buffer$,62,20)
14560 buffer6$ = Mid$(buffer$,82,(len(buffer$) - 82))
14570 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13) + chr$(13) + chr$(13)
14580 endif
14590 endif
14600 endif
14610 endif
14620 endif
14630 Surei_Result4_2:
14640 gload Gazo$ + "Screen1_Result2.png"
14650 cls
14660 color rgb(255,0,0)
14670 'print "診断結果 2" + chr$(13)
14680 print chr$(13)
14690 color rgb(127,255,212)
14700 print "入力文字:";buffer_moji$;chr$(13)
14710 print "数霊:";count;chr$(13)
14720 color rgb(255,255,255)
14730 print "数霊の説明:"+chr$(13)
14740 print buffer$
14750 color rgb(0,0,0)
14760 print "エンターキー(パッド 右):トップ,S(パッド 左):保存する" + chr$(13)
14770 key$="":bg=0:bg2=0
14780 while (key$<>chr$(13) and bg<>1 and bg2<>1)
14790 key$=inkey$
14800 bg=strig(1)
14810 bg2=strig(0)
14820 pause 2
14830 wend
14840 if bg=1 then buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
14850 if key$ = chr$(13) then
14860 buffer$ = "":buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
14870 endif
14880 if bg2=1 then
14890 'ファイルがない時
14900 if dir$(SAVE_DATA1$) = "" then
14910 open SAVE_DATA1$ for output as #1
14920 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
14930 close #1
14940 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
14950 'ファイルが有る時
14960 else
14970 open SAVE_DATA1$ for append as #1
14980 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
14990 close #1
15000 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
15010 endif
15020 endif
15030 if key$="s" or key$="S" then
15040 if dir$(SAVE_DATA1$) = "" then
15050 open SAVE_DATA1$ for output as #1
15060 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
15070 close #1
15080 ui_msg"保存しました":talk"保存しました":goto Surei_Result4_2:
15090 else
15100 open SAVE_DATA1$ for append as #1
15110 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
15120 close #1
15130 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
15140 endif
15150 else
15160 talk "無効な文字です":goto Surei_Result4_2:
15170 endif
15180 'endif
15190 func All_clear()
15200 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
15210 endfunc
