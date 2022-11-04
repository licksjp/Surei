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
330 Version$ = "1.1.1_2022.11.04(正式版)"
340 'csvファイル 1.数霊 ベースファイル
350 FILE_csv$ = "data/Kazutama.csv"
360 'csvファイル 2.数霊 ベースファイル 2
370 FILE_csv2$ = "data/Surei_chart_20211207.csv"
380 'gazo ファイル
390 Gazo$ = "data/Gazo/"
400 'Sound File(Voice)
410 '1.ボイス TopScreen
420 Voice_File_TopScreen$ = "data/Sound_data/"
430 '変数領域
440 'vcount:バーチャルパッド下の変数
450 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50):c=1:vcount=0:timer=0
460 count2 = 0:N=0:N2=0:m2 = 0
470 'ファイルの有無チェック
480 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
490 '1.ファイルが無いとき
500 cls :print "依存ファイルが見つかりません":
510 print "エンターキーを押してください"+chr$(13)
520 key$ = input$(1)
530 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
540 else
550 '2.ファイルが有るとき
560 cls:print "csv:file ok." + chr$(13)
570 n=0
580 open FILE_csv$ for input as #1
590 while eof(1) = 0
600 input #1,line$
610 'print line$
620 bufline$(n) = line$
630 'Print n;chr$(13)
640 n = n + 1
650 wend
660 close #1
670 N=n
680 '2つ目のファイル読み込み
690 'n = 0
700 open FILE_csv2$ for input as #2
710 for n=3 to 181
720 for i=0 to 1
730 input #2,line$
740 bufline2$(n,i) = line$
750 'print bufline2$(n,i)
760 next i
770 next n
780 close #2
790 N2 = n
800 '
810 endif
820 'or j = 3 to 181+3
830 'ufline3$(j - 3,n) = bufline2$(i,n)
840 'next j
850 'moji$ = Kotodama$(bufline3$(16))
860 'erase bufline2$
870 'Top画面
880 TopScreen:
890 cls 3:font 48:screen 1,1,1:init"kb:4"
900 'play ""
910 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
920 gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
930 '選択肢 1
940 gload Gazo$ + "Selection.png",1,5,200
950 '選択肢 2
960 gload Gazo$ + "Selection.png",1,5,300
970 '選択肢 3
980 gload Gazo$ + "Selection.png",1,5,400
990 '選択肢 4
1000 gload Gazo$ + "Selection.png",1,5,500
1010 color rgb(0,0,255)
1020 print chr$(13)
1030 'print "●Top画面" + chr$(13)
1040 color rgb(255,255,255)
1050 print "番号を選んでください" + chr$(13)
1060 print " :1.数霊(かずたま)チェック" + chr$(13)
1070 print " :2.設定" + chr$(13)
1080 print " :3.ヘルプ" + chr$(13)
1090 print " :4.終　了" + chr$(13)
1100 color rgb(0,0,0)
1110 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
1120 'バーチャルパッドを表示
1130 No=1:locate 1,12:color rgb(0,0,0):print "1.数霊(かずたま)チェックを選択";chr$(13)
1140 'スプライト
1150 '選択肢 1 On
1160 sp_def 0,(5,200),32,32
1170 sp_on 0,1
1180 sp_put 0,(5,200),0,0
1190 '選択肢 2 Off
1200 sp_def 1,(5,300),32,32
1210 sp_on 1,0
1220 sp_put 1,(5,300),0,0
1230 '選択肢 3 Off
1240 sp_def 2,(5,400),32,32
1250 sp_on 2,0
1260 sp_put 2,(5,400),0,0
1270 '選択肢 4 Off
1280 sp_def 3,(5,500),32,32
1290 sp_on 3,0
1300 sp_put 3,(5,500),0,0
1310 color rgb(0,0,0)
1320 Main_Select:
1330 'y:バーチャルパッドの処理
1340 'key$:カーソルの処理
1350 y = 0:key$ = "":bg=0
1360 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
1370 y = stick(1)
1380 key$ = inkey$
1390 bg=strig(1)
1400 pause 2
1410 wend
1420 'if y=1 then
1430 'select case (No Mod 4)
1440 'ase 0:
1450 '     c=1:No=c:sp_on 0,1:sp_on 1,0 :sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print " 数霊(かずたま)チェックを選択":beep:goto Main_Select:
1460 'case 1:
1470 '       =2:No=c:sp_on 0,0:
1480 '"ase 2:
1490 'ase 3:
1500 'nd select
1510 'ndif
1520 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
1530 '1.バーチャルパッドの処理
1540 'バーチャルパッド下を押した時
1550 if y = 1 then
1560 select case No
1570 'No の初期値：No=1
1580 case 1:
1590 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.設定を選択":goto Main_Select:
1600 'デバッグライン　ここから
1610 '0のとき
1620 'デバッグライン　ここまで
1630 'デバッグライン　ここから
1640 case 2:
1650 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 1,12:print "                  "
1660 color rgb(0,0,0):locate 1,12:print "2.ヘルプを選択":No=3:goto Main_Select:
1670 'cls:color rgb(255,255,255):print"ok"
1680 'デバッグライン　ここまで
1690 case 3:
1700 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                       ":locate 1,12:print "4.終了を選択":No=0:goto Main_Select:
1710 'デバッグライン　ここから
1720 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
1730 'デバッグライン　ここまで
1740 case 0:
1750 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
1760 'デバッグライン　ここから
1770 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
1780 'デバッグライン　ここまで
1790 end select
1800 endif
1810 'バーチャルパッド　上 ここから
1820 if y = -1 then
1830 select case No
1840 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
1850 case 1:
1860 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print "4.終了を選択":goto Main_Select:
1870 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
1880 case 0:
1890 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.ヘルプを選択":goto Main_Select:
1900 'No:3 3.Help→2.設定 No:2
1910 case 3:
1920 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.設定を選択":goto Main_Select:
1930 case 2:
1940 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.数霊(かずたま)チェックを選択":goto Main_Select
1950 end select
1960 endif
1970 if bg=1 then
1980 select case No
1990 '1.数霊チェックを選択  パッドの右キー
2000 case 1:
2010 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
2020 '2.設定を選択    パッドの右キー
2030 case 2:
2040 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
2050 '3.ヘルプを選択 パッドの右
2060 case 3:
2070 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
2080 'プログラムの終了を選択
2090 case 0:
2100 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
2110 end select
2120 '4.終了するを選択  パッドの右
2130 endif
2140 'バーチャルパッド　上　ここまで
2150 '2.カーソルの処理
2160 'カーソル　下 chr$(31)
2170 if (key$ = chr$(31)) then
2180 select case (No)
2190 '4
2200 '0 選択肢4 => 選択肢1
2210 case 0:
2220 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "              ":color rgb(0,0,0):locate 1,12:print "数霊（かずたま）チェックを選択":beep:goto Main_Select:
2230 '1 選択肢1 => 選択肢2
2240 case 1:
2250 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 1,12:print "                ":color rgb(0,0,0):locate 1,12:print "設 定を選択":beep:goto Main_Select:
2260 '2 選択肢2 => 選択肢3
2270 case 2:
2280 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "               ":color rgb(0,0,0):locate 1,12:print " ヘルプを選択":beep:goto Main_Select:
2290 '3 選択肢３ => 選択肢4
2300 case 3:
2310 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "               ":color rgb(255,255,255):locate 1,12:print " 終　了を選択":beep:goto Main_Select:
2320 case else:
2330 goto Main_Select:
2340 end select
2350 endif
2360 'カーソル　上
2370 if key$=chr$(30) then
2380 select case (No)
2390 '選択肢1 => 選択肢4
2400 case 1:
2410 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:PRINT "                 ":locate 1,12:beep:print "数霊(かずたま)チェックを選択":goto Main_Select:
2420 '選択肢2 => 選択肢1
2430 case 2:
2440 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 1,12:print "                 ":locate 1,12:beep:print "設 定を選択":beep:goto Main_Select:
2450 '選択肢3　=> 選択肢2
2460 case 3:
2470 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0
2480 '選択肢4 => 選択肢3
2490 case 0:
2500 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                ":locate 1,12:print "終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
2510 end select
2520 endif
2530 'Input "番号:",No
2540 'エンターキー入力:決定
2550 if key$ = chr$(13) then
2560 select case No
2570 case 1:
2580 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
2590 case 3:
2600 Color rgb(255,255,255):goto Help:
2610 case 0:
2620 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
2630 case 2:
2640 color rgb(255,255,255):goto Setting:
2650 'else
2660 'goto Main_Select:
2670 end select
2680 endif
2690 'ndif
2700 'if N0=0 or No>4 then goto TopScreen:
2710 '1-1.数霊チェック
2720 Surei_Check:
2730 cls 3:Font 48:
2740 'gload Gazo$ + "Screen4.png"
2750 gload Gazo$ + "Screen1_Sureicheck_Top20211226.png"
2760 play ""
2770 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
2780 color rgb(255,0,0)
2790 'print "●数霊(かずたま)チェックトップ" + chr$(13)
2800 sp_on 0,1:sp_put 0,(5,200),0,0:screen 1,1,1
2810 print chr$(13)
2820 color rgb(255,255,255)
2830 print "番号を選んでください" + chr$(13)
2840 print " :1.数霊(かずたま)1人用" + chr$(13)
2850 print " :2.数霊(かずたま)2人用" + chr$(13)
2860 print " :3.前の画面に戻る" + chr$(13)
2870 print " :4.終 了" + chr$(13)
2880 color rgb(0,0,0):No=1
2890 locate 1,12
2900 print "1.数霊1人用を選択"
2910 Kazutama_main:
2920 'y:バーチャルパッドの処理
2930 'key$:カーソルの処理
2940 'bg:バーチャルパッドの右のボタン
2950 y = 0:key$ = "":bg=0
2960 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
2970 y = stick(1)
2980 key$ = inkey$
2990 bg=strig(1)
3000 pause 2
3010 wend
3020 'key$ = input$(1)
3030 if y = 1 then
3040 select case No
3050 'No の初期値：No=1
3060 case 1:
3070 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.数霊(かずたま)2人用を選択":goto Kazutama_main:
3080 'デバッグライン　ここから
3090 '0のとき
3100 'デバッグライン　ここまで
3110 'デバッグライン　ここから
3120 case 2:
3130 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 1,12:print "                  "
3140 color rgb(0,0,0):locate 1,12:print "3.前の画面に戻る":No=3:goto Kazutama_main:
3150 'cls:color rgb(255,255,255):print"ok"
3160 'デバッグライン　ここまで
3170 case 3:
3180 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Kazutama_main:
3190 'デバッグライン　ここから
3200 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
3210 'デバッグライン　ここまで
3220 case 0:
3230 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.数霊(かずたま)1人用":goto Kazutama_main:
3240 'デバッグライン　ここから
3250 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
3260 'デバッグライン　ここまで
3270 end select
3280 endif
3290 'バーチャルパッド　上 ここから
3300 if y = -1 then
3310 select case No
3320 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
3330 case 1:
3340 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Kazutama_main:
3350 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
3360 case 0:
3370 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.ヘルプを選択":goto Kazutama_main:
3380 'No:3 3.Help→2.設定 No:2
3390 case 3:
3400 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.設定を選択":goto Kazutama_main:
3410 case 2:
3420 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.数霊(かずたま)チェックを選択":goto Kazutama_main:
3430 end select
3440 endif
3450 if bg=1 then
3460 select case No
3470 '1.数霊チェックを選択  パッドの右キー
3480 case 1:
3490 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
3500 '2.設定を選択    パッドの右キー
3510 case 2:
3520 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
3530 '3.ヘルプを選択 パッドの右
3540 case 3:
3550 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
3560 'プログラムの終了を選択
3570 case 0:
3580 cls 3:cls 4:ui_msg "プログラムを終了します":color rgb(255,255,255):end
3590 end select
3600 '4.終了するを選択  パッドの右
3610 endif
3620 'バーチャルパッド　上　ここまで
3630 if key$ = chr$(31) then
3640 select case No
3650 case 0:
3660 No=1:sp_on 0,0:sp_on 1,1:sp_put 0,(5,300),0,0:locate 1,12:print "                                                          ":locate 1,12:print "2.数霊(かずたま)2人用を選択":goto Kazutama_main:
3670 case 1:
3680 No=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                                                          ":locate 1,12:print"3.前の画面に戻るを選択":goto Kazutama_main:
3690 case 2:
3700 No=3:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print"                                       ":locate 1,12:print"4.終了を選択":goto Kazutama_main:
3710 case 3:
3720 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print"1.数霊（かずたま)1人用を選択":goto Kazutama_main:
3730 end select
3740 endif
3750 if key$=chr$(13) then
3760 select case No
3770 case 1:
3780 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_Input:
3790 case 2:
3800 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
3810 case 3:
3820 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
3830 case 0:
3840 cls 4:cls 3:talk"プログラムを終了します":ui_text"プログラムを終了します":end
3850 end select
3860 endif
3870 'Input "番号:",No
3880 '前の画面に戻る
3890 'if No = 3 then goto TopScreen:
3900 'プログラムの終了
3910 'if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":COLOR rgb(255,255,255):end
3920 '1人用
3930 'if No = 1 then goto Surei_Input:
3940 '2人用
3950 'if No = 2 then goto Surei_twoParson:
3960 'if No > 4 or No=0 then ui_msg"もう一度入れてください":goto Surei_Check:
3970 '数霊(かずたま) 文字入力  1人用
3980 Surei_Input:
3990 if mode = 0 then
4000 cls 3:font 32:init"kb:2"
4010 gload Gazo$ + "InputKotodama_20211226.png"
4020 play""
4030 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
4040 color rgb(255,0,0)
4050 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
4060 print chr$(13)
4070 color rgb(0,0,0)
4080 print "文字を入れてください" + chr$(13)
4090 color rgb(255,0,0)
4100 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)"+chr$(13)
4110 print chr$(13)
4120 color rgb(0,0,0)
4130 Input "入力文字:",buffer_moji$
4140 goto Surei_Result:
4150 else
4160 if mode = 1 then
4170 cls 3:Font 32:
4180 gload Gazo$ + "InputKotodama.png"
4190 color rgb(255,0,0)
4200 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
4210 color rgb(255,255,255)
4220 print "文字を入れてください" + chr$(13)
4230 color rgb(255,0,0)
4240 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
4250 print "大文字のみ)" + chr$(13)
4260 color rgb(0,0,0)
4270 Input "文字入力:",buffer_moji2$
4280 goto Surei_Result3:
4290 endif
4300 endif
4310 '数霊(かずたま)文字入力　2人用
4320 Surei_twoParson:
4330 cls 3:Font 32:
4340 gload Gazo$ + "InputKotodama_20211226.png"
4350 '1人目入力
4360 'color rgb(255,0,0)
4370 print ""+chr$(13)
4380 'print "●数霊(かずたま) 1人目 入力" + chr$(13)
4390 color rgb(255,0,0)
4400 print "1人目の文字を入れてください" + chr$(13)
4410 color rgb(255,0,0)
4420 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
4430 color rgb(0,0,0)
4440 print chr$(13)
4450 Input "1人目文字入力:",buf_Parson1$
4460 Surei_twoParson2:
4470 cls 3:Font 32
4480 '2人目入力
4490 gload Gazo$ + "InputKotodama_20211226.png"
4500 'color rgb(255,0,0)
4510 'print "●数霊(かずたま) 2人目 入力" + chr$(13)
4520 print ""+chr$(13)
4530 print "2人目の文字を入れてください" + chr$(13)
4540 color rgb(255,0,0)
4550 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
4560 color rgb(0,0,0)
4570 Input "2人目の文字入力:",buf_Parson2$
4580 goto Surei_Result2:
4590 '数霊　計算 パート
4600 '文字の計算関数
4610 'moji$:1文字を入れる
4620 func Complate(moji$)
4630 for n = 1 to 116
4640 if moji$ = bufline$(2*n) then
4650 buffcount = val(bufline$(2 * n + 1))
4660 endif
4670 next n
4680 endfunc buffcount
4690 '数霊　結果表示
4700 Surei_Result:
4710 cls 3:Font 32
4720 'ゼロカウント:zcount
4730 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
4740 '例 アカい:"い"の文字は無効な文字なので、はじく
4750 zcount=0
4760 'mojicount:入力文字数
4770 mojicount = len(buffer_moji$)
4780 for n=1 to mojicount
4790 for j=1 to 118
4800 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
4810 if bufcount$(n - 1) = bufline$(2 * j) then
4820 zcount = zcount + 1
4830 endif
4840 next j
4850 next n
4860 if mojicount > zcount then
4870 cls 3:ui_msg "無効な文字です":talk"無効な文字があります。":zcount = 0:goto Surei_Input:
4880 endif
4890 for i = 1 to mojicount
4900 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
4910 n1 = Complate(bufcount$(i - 1))
4920 count = count + n1
4930 next i
4940 '182以上のとき,181を引く
4950 if (count > 181) then count = count - 181
4960 cls 3:Font 48+16
4970 gload Gazo$ + "Result_Screen3_20211226.png"
4980 color rgb(255,0,0)
4990 print "入力文字:" + buffer_moji$ + chr$(13)
5000 'print chr$(13)
5010 color rgb(0,0,255)
5020 print "数霊(かずたま):";count;chr$(13)
5030 color rgb(0,0,0)
5040 print "エンターキー:トップ" + chr$(13)
5050 print "スペース:次 へ" + chr$(13)
5060 key$ = input$(1)
5070 if key$ = " " then goto Surei_Result4:
5080 if key$ = chr$(13) then
5090 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
5100 for i=0 to 9
5110 bufcount$(i) = " "
5120 next i
5130 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
5140 'else
5150 'if key$ = " " then
5160 '２回めの入力に行く
5170 'mode = 1:goto Surei_Input:
5180 'else
5190 'if key$ = "s" or key$ = "S" then
5200 'ファイルを保存する
5210 's = Save()
5220 'ui_msg"保存しました"
5230 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
5240 else
5250 goto Surei_Result:
5260 'endif
5270 endif
5280 '3-1 バージョン情報
5290 Version:
5300 cls 3:Font 32
5310 gload Gazo$ + "Screen1_Version.png"
5320 play ""
5330 play Voice_File_TopScreen$ + "Voice_Version.mp3"
5340 color rgb(255,0,0)
5350 'print"●バージョン情報"+chr$(13)
5360 print chr$(13)
5370 color rgb(255,255,255)
5380 print "Ver:";Version$ + chr$(13)
5390 print "アプリ名:数霊"+ chr$(13)
5400 print "for Basic for Android"+chr$(13)
5410 print "Author:licksjp"+chr$(13)
5420 print "制作開始:2021.7.28" + chr$(13)
5430 print chr$(13)
5440 print "(C)Copy right licksjp " + chr$(13)
5450 print "All rights reserved" + chr$(13)
5460 color rgb(0,0,0)
5470 print "エンターキーを押してください" + chr$(13)
5480 'key$ = input$(1)
5490 bg=0:key$=""
5500 while (bg <> 1 and key$ <> chr$(13))
5510 bg = strig(1)
5520 key$ = inkey$
5530 pause 2
5540 wend
5550 if key$ = chr$(13) then
5560 goto TopScreen:
5570 'else
5580 'talk "無効なキーです":goto Version:
5590 else
5600 if bg=1 then
5610 goto TopScreen:
5620 else
5630 talk "無効なキーです":goto Version:
5640 endif
5650 endif
5660 '3-2 参考文献
5670 Reference_Book:
5680 cls 3:Font 48:play""
5690 gload Gazo$ + "Screen1_Reference.png"
5700 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
5710 color rgb(255,0,0)
5720 'print"●参考文献" + chr$(13)
5730 print chr$(13)
5740 color rgb(255,255,255)
5750 print "書名:数霊" + chr$(13)
5760 print "出版社:徳間書店" + chr$(13)
5770 print "ISBN:978-4-19-" + chr$(13)
5780 print "         865309-5" + chr$(13)
5790 print "定価:2300円 + 税" + chr$(13)
5800 color rgb(0,0,0)
5810 print "エンターキーを押してください"
5820 bg=0:key$=""
5830 while (bg <> 1 and key$ <> chr$(13))
5840 bg = strig(1)
5850 key$ = inkey$
5860 pause 2
5870 wend
5880 if key$ = chr$(13) then
5890 goto TopScreen:
5900 'else
5910 'talk "無効なキーです":goto Reference_Book:
5920 else
5930 if bg=1 then
5940 goto TopScreen:
5950 else
5960 talk "無効なキーです":goto Reference_Book:
5970 endif
5980 endif
5990 'key$=input$(1)
6000 'if key$=chr$(13) then
6010 'goto TopScreen:
6020 'else
6030 'talk"無効なキーです":goto Reference_Book:
6040 'endif
6050 'ヘルプ画面　トップ画面
6060 Help:
6070 No=1:c=0
6080 play ""
6090 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
6100 cls 3:Font 48:
6110 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
6120 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0
6130 color rgb(255,0,0)
6140 'print "●3.ヘルプ　トップ画面" + chr$(13)
6150 print chr$(13)
6160 color rgb(255,255,255)
6170 print "番号を選んでください" + chr$(13)
6180 print " :1.バージョン" + chr$(13)
6190 print " :2.参考文献" + chr$(13)
6200 print " :3.トップ画面" + chr$(13)
6210 print " :4.終 了" + chr$(13)
6220 color rgb(0,0,0)
6230 if No = 1 then print " バージョンを選択"
6240 'y:バーチャルパッドの処理
6250 'key$:カーソルの処理
6260 'bg:バーチャルパッドの右ボタン
6270 Help_key:
6280 y = 0:key$ = "":bg=0
6290 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
6300 y = stick(1)
6310 key$ = inkey$
6320 bg=strig(1)
6330 pause 2
6340 wend
6350 'バーチャルパッド　ここから'
6360 if y = 1 then
6370 select case No
6380 'No の初期値：No=1
6390 case 1:
6400 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.参考文献を選択":goto Help_key:
6410 'デバッグライン　ここから
6420 '0のとき
6430 'デバッグライン　ここまで
6440 'デバッグライン　ここから
6450 case 2:
6460 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 1,12:print "                  "
6470 color rgb(0,0,0):locate 1,12:print "3.トップ画面":No=3:goto Help_key:
6480 'cls:color rgb(255,255,255):print"ok"
6490 'デバッグライン　ここまで
6500 case 3:
6510 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Help_key:
6520 'デバッグライン　ここから
6530 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
6540 'デバッグライン　ここまで
6550 case 0:
6560 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.バージョンを選択":goto Help_key:
6570 'デバッグライン　ここから
6580 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
6590 'デバッグライン　ここまで
6600 end select
6610 endif
6620 'バーチャルパッド　上 ここから
6630 if y = -1 then
6640 select case No
6650 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
6660 case 1:
6670 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Kazutama_main:
6680 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
6690 case 0:
6700 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面":goto Kazutama_main:
6710 'No:3 3.Help→2.設定 No:2
6720 case 3:
6730 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.参考文献を選択":goto Kazutama_main:
6740 case 2:
6750 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.バージョンを選択":goto Kazutama_main:
6760 end select
6770 endif
6780 if bg=1 then
6790 select case No
6800 '1.数霊チェックを選択  パッドの右キー
6810 case 1:
6820 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
6830 '2.設定を選択    パッドの右キー
6840 case 2:
6850 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
6860 '3.ヘルプを選択 パッドの右
6870 case 3:
6880 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
6890 'プログラムの終了を選択
6900 case 0:
6910 cls 3:cls 4:ui_msg "プログラムを終了します":color rgb(255,255,255):end
6920 end select
6930 '4.終了するを選択  パッドの右
6940 endif
6950 'バーチャルパッド　上　ここまで
6960 'バーチャルパッド　ここまで'
6970 'key$ = input$(1)
6980 'カーソルの下
6990 if key$ = chr$(31) then
7000 select case (No Mod 4)
7010 'バージョンから参考文献
7020 case 0:
7030 c=1:No=c:locate 0,12:Print "           ":locate 0,12:print " 参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
7040 '参考文献からトップ画面
7050 case 1:
7060 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "            ":locate 0,12:print " トップ画面を選択":goto Help_key:
7070 'トップ画面から終了
7080 case 2:
7090 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 0,12:print " 終 了を選択":goto Help_key:
7100 '終了からバージョン
7110 case 3:
7120 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                     ":locate 0,12:print " バージョンを選択":goto Help_key:
7130 case else:
7140 goto 5370
7150 end select
7160 endif
7170 'カーソル　上
7180 if key$ = chr$(30) then
7190 select case (c Mod 4)
7200 'バージョンから終了
7210 case 0:
7220 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:locate 0,12:print "                   ":locate 0,12:print " 終 了を選択":goto 5370
7230 '参考文献からバージョン
7240 case 1:
7250 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                   ":locate 0,12:print " バージョンを選択":goto 5370
7260 'トップ画面から参考文献
7270 case 2:
7280 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":locate 0,12:print " 参考文献を選択":goto 5370
7290 '終了からトップ画面を選択
7300 case 3:
7310 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print"                      ":locate 0,12:print " トップ画面を選択":goto 5370
7320 case else:
7330 goto Help_key:
7340 end select
7350 endif
7360 'Input "番号:",No
7370 'sp_def 0,(5,200),32,32
7380 'エンターキー：決定
7390 if key$=chr$(13) then
7400 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
7410 if No=3 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
7420 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
7430 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
7440 else
7450 goto Help_key:
7460 endif
7470 'if (No = 0 or No > 4) then ui_msg"もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
7480 '登録文字の確認
7490 '文字を1文字入れて登録されているか調べるメニュー
7500 '設定項目
7510 Setting:
7520 cls 3:Font 48
7530 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
7540 play ""
7550 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
7560 No=1
7570 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
7580 color rgb(0,0,255)
7590 'print "●設定項目" + chr$(13)
7600 print chr$(13)
7610 color rgb(255,255,255)
7620 print "番号を選んでください" + chr$(13)
7630 print " :1.登録文字の確認" + chr$(13)
7640 print " :2.数霊文字確認" + chr$(13)
7650 print " :3.トップ画面に行く" + chr$(13)
7660 print " :4.終 了" + chr$(13)
7670 color rgb(0,0,0)
7680 locate 1,12
7690 if No=1 then print "1.登録文字の確認を選択"
7700 'y:バーチャルパッドの処理
7710 'key$:カーソルの処理
7720 'bg:バーチャルパッドの右ボタン
7730 SettingScreen:
7740 y = 0:key$ = "":bg=0
7750 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
7760 y = stick(1)
7770 key$ = inkey$
7780 bg=strig(1)
7790 pause 2
7800 wend
7810 'バーチャルパッド　ここから'
7820 'バーチャルパッド　ここから'
7830 if y = 1 then
7840 select case No
7850 'No の初期値：No=1
7860 case 1:
7870 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
7880 'デバッグライン　ここから
7890 '0のとき
7900 'デバッグライン　ここまで
7910 'デバッグライン　ここから
7920 case 2:
7930 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 1,12:print "                  "
7940 color rgb(0,0,0):locate 1,12:print "3.トップ画面に行くを選択":No=3:goto SettingScreen:
7950 'cls:color rgb(255,255,255):print"ok"
7960 'デバッグライン　ここまで
7970 case 3:
7980 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
7990 'デバッグライン　ここから
8000 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
8010 'デバッグライン　ここまで
8020 case 0:
8030 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
8040 'デバッグライン　ここから
8050 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
8060 'デバッグライン　ここまで
8070 end select
8080 endif
8090 'バーチャルパッド　上 ここから
8100 if y = -1 then
8110 select case No
8120 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
8130 case 1:
8140 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
8150 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
8160 case 0:
8170 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
8180 'No:3 3.Help→2.設定 No:2
8190 case 3:
8200 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
8210 case 2:
8220 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
8230 end select
8240 endif
8250 if bg=1 then
8260 select case No
8270 '1.数霊チェックを選択  パッドの右キー
8280 case 1:
8290 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
8300 '2.設定を選択    パッドの右キー
8310 case 2:
8320 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
8330 '3.ヘルプを選択 パッドの右
8340 case 3:
8350 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
8360 'プログラムの終了を選択
8370 case 0:
8380 cls 3:cls 4:ui_msg "プログラムを終了します":color rgb(255,255,255):pause 2.052*1000:end
8390 end select
8400 endif
8410 '4.終了するを選択  パッドの右
8420 'バーチャルパッド　ここまで'
8430 'SettingScreen:
8440 'key$ = input$(1)
8450 'カーソル下'
8460 if key$ =chr$(31) then
8470 select case (No Mod 4)
8480 '登録文字から数霊文字の確認
8490 case 1:
8500 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
8510 '数霊文字の確認からトップ画面に行く
8520 case 2:
8530 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
8540 'トップ画面に行くから終了
8550 case 3:
8560 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
8570 '終了から登録文字
8580 case 0:
8590 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
8600 end select
8610 endif
8620 'カーソル　上
8630 if key$ = chr$(30) then
8640 select case (No Mod 4)
8650 case 1:
8660 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
8670 case 2:
8680 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
8690 case 3:
8700 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
8710 case 0:
8720 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
8730 end select
8740 endif
8750 'エンターキーを押したとき
8760 if key$ = chr$(13) then
8770 if No=3 then goto TopScreen:
8780 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
8790 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
8800 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:color rgb(255,255,255):pause 3*120:end
8810 'lse
8820 'o'o SettingScreen:
8830 endif
8840 'endif
8850 'endif
8860 '文字検索項目  ここから
8870 Moji_Search:
8880 cls 4:cls 3:Font 32+16:init"kb:2"
8890 gload Gazo$ + "Moji_Search_Result.png"
8900 play ""
8910 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
8920 print "" + chr$(13)
8930 color rgb(255,0,0)
8940 print "文字を一文字入れてください" + chr$(13)
8950 color rgb(0,0,0)
8960 Input "登録文字:",moji$
8970 moji_count = len(moji$)
8980 if moji_count > 1 then
8990 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
9000 else
9010 count=0
9020 for n = 0 to 116
9030 if bufline$(2*n) = moji$ then
9040 cls 3:font 48:init"kb:4"
9050 gload Gazo$ + "Moji_Search_Result.png"
9060 'talk"この文字は登録されています"
9070 play ""
9080 play Voice_File_TopScreen$+"Voice_Entry_OK.mp3"
9090 print chr$(13)
9100 color rgb(255,0,0)
9110 print moji$;"は、登録されています。" + chr$(13)
9120 color rgb(0,0,0)
9130 print "エンターキーを押してください"
9140 bg=0:key$=""
9150 while (bg<>1 and key$<>chr$(13))
9160 key$=inkey$
9170 bg=strig(1)
9180 pause 2
9190 wend
9200 'y$=input$(1)
9210 if key$=chr$(13) then goto TopScreen:
9220 if bg=1 then goto TopScreen:
9230 count = count + 1
9240 endif
9250 next n
9260 if count = 0 then
9270 cls 3:font 48
9280 gload Gazo$ + "Moji_check.png"
9290 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
9300 print chr$(13)
9310 color rgb(255,0,0)
9320 print moji$;"は、登録されていません。" + chr$(13)
9330 color rgb(0,0,0)
9340 print "エンターキーを押してください" + chr$(13)
9350 key$=input$(1)
9360 if key$=chr$(13) then goto TopScreen:
9370 endif
9380 endif
9390 Surei_Result2:
9400 cls 3:Font 48
9410 zcount1=0:zcount2=0:count1=0:count2=0
9420 '1人目
9430 mojicount1=len(buf_Parson1$)
9440 '2人目
9450 mojicount2=len(buf_Parson2$)
9460 '1人目
9470 for n=1 to mojicount1
9480 for j=1 to 116
9490 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
9500 if bufcount1$(n-1) = bufline$(2*j) then
9510 zcount1 = zcount1 + 1
9520 endif
9530 next j
9540 next n
9550 '2人目
9560 for n=1 to mojicount2
9570 for j=1 to 116
9580 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
9590 if bufcount2$(n-1) = bufline$(2*j) then
9600 zount2 = zcount2 + 1
9610 endif
9620 next j
9630 next n
9640 '1人目
9650 for i=1 to mojicount1
9660 bufcount1$(i-1)=Mid$(buf_Parson1$,i,1)
9670 p1=Complate(bufcount1$(i-1))
9680 count1 = count1 + p1
9690 next i
9700 '2人目
9710 for i=1 to mojicount2
9720 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
9730 p2 = Complate(bufcount2$(i-1))
9740 count2 = count2 + p2
9750 next i
9760 cls 3:
9770 gload Gazo$ + "Screen1_2Parson_Result.png"
9780 color rgb(255,0,0)
9790 'print "数霊 2人用 結果表示"+chr$(13)
9800 print ""+chr$(13)
9810 color rgb(255,255,255)
9820 print "1人目:";buf_Parson1$;chr$(13)
9830 print "数霊1:";count1;chr$(13)
9840 print "2人目:";buf_Parson2$;chr$(13)
9850 print "数霊2:";count2;chr$(13)
9860 print "数霊(合計):";count1 + count2;chr$(13)
9870 color rgb(0,0,0)
9880 print "エンターキーを押してください" + chr$(13)
9890 key$="":gb=0
9900 'ey$=input$(1)
9910 while (bg<>1 and key$<>chr$(13))
9920 bg=strig(1)
9930 key$=inkey$
9940 pause 2
9950 wend
9960 if bg=1 then goto TopScreen:
9970 if key$=chr$(13) then goto TopScreen:
9980 Surei_Result3:
9990 cls 3:Font 48
10000 zcount2 = 0:count2 = 0
10010 mojicount2 = len(buffer_moji2$)
10020 for n=1 to mojicount2
10030 for j=1 to 116
10040 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
10050 if bufcount2$(n - 1) = bufline$(2 * j) then
10060 zcount2 = zcount2 + 1
10070 endif
10080 next j
10090 next n
10100 for i=1 to mojicount2
10110 n2 = Complate(bufcount2$(i-1))
10120 count2 = count2 + n2
10130 next i
10140 gload Gazo$ + "Screen5.png"
10150 color rgb(255,0,0)
10160 print "数霊の結果表示" + chr$(13)
10170 color rgb(255,255,255)
10180 print "１回目回の文字入力:";buffer_moji$;chr$(13)
10190 print "１回目の数霊(かずたま)";count;chr$(13)
10200 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
10210 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
10220 color rgb(0,0,0)
10230 print "エンターキー:トップ画面";chr$(13)
10240 print "c or C キー:数霊の比較";chr$(13)
10250 key$="":bg=0
10260 while (key$ <> chr$(13) and bg <> 1)
10270 bg=strig(1)
10280 key$=inkey$
10290 pause 2
10300 wend
10310 'key$ = input$(1)
10320 if bg=1 then goto TopScreen:
10330 if key$ = chr$(13) then mode=0:count=0:count2=0:goto TopScreen:
10340 if key$ = "c" or key$ = "C" then
10350 if count = count2 then
10360 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
10370 else
10380 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
10390 endif
10400 endif
10410 Moji_Count_Check:
10420 cls 3:Font 48
10430 gload Gazo$ + "Moji_check.png"
10440 n=0
10450 open FILE_csv$ for input as #1
10460 while eof(1)=0
10470 line input #1, line$
10480 n = n + 1
10490 wend
10500 close #1
10510 'n = n - 1
10520 'talk "登録文字数は"+str$(n)+"文字です"
10530 play ""
10540 if n = 118 then
10550 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
10560 else
10570 talk"登録文字数は、"+str$(n)+"文字です"
10580 endif
10590 print "" + chr$(13)
10600 color rgb(255,0,0)
10610 print "文字の登録文字数は";n;"文字" + chr$(13)
10620 color rgb(0,0,0)
10630 print "エンターキーを押してください"+chr$(13)
10640 'key$ = input$(1)
10650 key$="":bg=0
10660 while (key$<>chr$(13) and bg<>1)
10670 key$=inkey$
10680 bg=strig(1)
10690 pause 2
10700 wend
10710 if bg=1 then goto TopScreen:
10720 if key$ = chr$(13) then
10730 goto TopScreen:
10740 else
10750 goto Moji_Count_Check:
10760 endif
10770 'Save 関数
10780 func Save()
10790 open "data/Parsonal_list1.csv" for append as #1
10800 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
10810 close #1
10820 endfunc
10830 Select_moji:
10840 cls 3:font 48:No = 1
10850 gload Gazo$ + "Screen1_mojicheck.png"
10860 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
10870 color rgb(255,0,0)
10880 'print "文字の確認" + chr$(13)
10890 print chr$(13)
10900 color rgb(255,255,255)
10910 print "番号を選んでください" + chr$(13)
10920 print " :1.登録文字検索"+chr$(13)
10930 print " :2.登録文字数の確認" + chr$(13)
10940 print " :3.前の画面に戻る" + chr$(13)
10950 print " :4.終　了" + chr$(13)
10960 color rgb(0,0,0)
10970 if No = 1 then print "1.登録文字の確認を選択"
10980 Entry_check_key:
10990 y = 0:key$ = "":bg=0
11000 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
11010 y = stick(1)
11020 key$ = inkey$
11030 bg=strig(1)
11040 pause 2
11050 wend
11060 'バーチャルパッド　ここから'
11070 'バーチャルパッド　ここから'
11080 if y = 1 then
11090 select case No
11100 'No の初期値：No=1
11110 case 1:
11120 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.登録文字数の確認":goto Entry_check_key:
11130 'デバッグライン　ここから
11140 '0のとき
11150 'デバッグライン　ここまで
11160 'デバッグライン　ここから
11170 case 2:
11180 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                       "
11190 color rgb(0,0,0):locate 0,12:print " 3.トップ画面に行く":No=3:goto Entry_check_key:
11200 'cls:color rgb(255,255,255):print"ok"
11210 'デバッグライン　ここまで
11220 case 3:
11230 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Entry_check_key:
11240 'デバッグライン　ここから
11250 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11260 'デバッグライン　ここまで
11270 case 0:
11280 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_check_key:
11290 'デバッグライン　ここから
11300 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11310 'デバッグライン　ここまで
11320 end select
11330 endif
11340 'バーチャルパッド　上 ここから
11350 if y = -1 then
11360 select case No
11370 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11380 case 1:
11390 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Entry_check_key:
11400 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11410 case 0:
11420 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                      ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
11430 'No:3 3.Help→2.設定 No:2
11440 case 3:
11450 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
11460 case 2:
11470 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_check_key:
11480 end select
11490 endif
11500 if bg=1 then
11510 select case No
11520 '1.数霊チェックを選択  パッドの右キー
11530 case 1:
11540 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
11550 '2.設定を選択    パッドの右キー
11560 case 2:
11570 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
11580 '3.ヘルプを選択 パッドの右
11590 case 3:
11600 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
11610 'プログラムの終了を選択
11620 case 0:
11630 cls 3:cls 4:ui_msg "プログラムを終了します":color rgb(255,255,255):pause 2.052*1000:end
11640 end select
11650 endif
11660 '4.終了するを選択  パッドの右
11670 'バーチャルパッド　ここまで'
11680 'key$ = input$(1)
11690 'カーソルの下
11700 if key$ = chr$(31) then
11710 select case (No Mod 4)
11720 case 0:
11730 c=1:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
11740 case 1:
11750 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:sp_on 3,0:goto Entry_check_key:
11760 case 2:
11770 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:goto Entry_check_key:
11780 case 3:
11790 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
11800 end select
11810 endif
11820 'カーソル　上
11830 if key$ = chr$(30) then
11840 select case (No Mod 4)
11850 case 0:
11860 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
11870 case 1:
11880 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
11890 case 2:
11900 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
11910 case 3:
11920 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
11930 end select
11940 endif
11950 'エンターキーを押す
11960 if key$ = chr$(13) then
11970 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
11980 if No = 2 then goto Moji_Count_Check:
11990 if No = 3 then goto TopScreen:
12000 if No = 0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg
12010 endif
12020 '
12030 Kakunin_Surei_count:
12040 cls 3:font 48:No=1
12050 gload Gazo$ + "Kazutama_List_Top.png"
12060 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
12070 color rgb(255,0,0)
12080 'print "数霊の確認" + chr$(13)
12090 print chr$(13)
12100 color rgb(255,255,255)
12110 print "番号を選んでください" + chr$(13)
12120 print " :1.数霊リスト 1人用" + chr$(13)
12130 print " :2.トップ画面に行く" + chr$(13)
12140 print " :3.終 了" + chr$(13)
12150 print ""+chr$(13)
12160 color rgb(0,0,0)
12170 locate 0,12:print"                                                         "
12180 if No = 1 then locate 1,12:print "1.数霊リスト　1人用"
12190 Entry_List:
12200 y = 0:key$ = "":bg=0
12210 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
12220 y = stick(1)
12230 key$ = inkey$
12240 bg=strig(1)
12250 pause 2
12260 wend
12270 'バーチャルパッド　ここから'
12280 'バーチャルパッド　ここから'
12290 if y = 1 then
12300 select case No
12310 'No の初期値：No=1
12320 case 1:
12330 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.トップ画面に行く":goto Entry_List:
12340 'デバッグライン　ここから
12350 '0のとき
12360 'デバッグライン　ここまで
12370 'デバッグライン　ここから
12380 case 2:
12390 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                       "
12400 color rgb(0,0,0):locate 1,12:print "3.終 了を選択":No=0:goto Entry_List:
12410 'cls:color rgb(255,255,255):print"ok"
12420 'デバッグライン　ここまで
12430 case 0:
12440 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,200),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "1.数霊リスト 1人用を選択":No=1:goto Entry_List:
12450 'デバッグライン　ここから
12460 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
12470 'デバッグライン　ここまで
12480 'case 0:
12490 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_List:
12500 'デバッグライン　ここから
12510 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
12520 'デバッグライン　ここまで
12530 end select
12540 endif
12550 'バーチャルパッド　上 ここから
12560 if y = -1 then
12570 select case No
12580 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
12590 case 1:
12600 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Entry_List:
12610 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
12620 case 0:
12630 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                      ":locate 1,12:print"2.トップ画面に行くを選択":goto Entry_List:
12640 'No:3 3.Help→2.設定 No:2
12650 case 2:
12660 sp_on 1,0:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print"1.数霊リスト 1人用を選択":goto Entry_List:
12670 'case 2:
12680 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_List:
12690 end select
12700 endif
12710 if bg=1 then
12720 select case No
12730 '1.数霊チェックを選択  パッドの右キー
12740 case 1:
12750 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto Surei_List1:
12760 '2.設定を選択    パッドの右キー
12770 case 2:
12780 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
12790 '3.ヘルプを選択 パッドの右
12800 case 0:
12810 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
12820 'プログラムの終了を選択
12830 end select
12840 endif
12850 '4.終了するを選択  パッドの右
12860 'バーチャルパッド　ここまで'
12870 'Input "番号:",No
12880 'if No=2 then goto TopScreen:
12890 'if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
12900 'if No=1 then goto Surei_List1:
12910 'if No > 3 or No=0 then ui_msg"無効な数字です、入れ直してください":talk"無効な数字です":goto Kakunin_Surei_count:
12920 'if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
12930 Surei_List1:
12940 cls 3:font 48
12950 if dir$("data/Parsonal_list1.csv") = ""  then
12960 cls 3
12970 gload "data/Gazo/"+"KazutamaList1.png"
12980 print chr$(13)
12990 color rgb(255,0,0):print"登録ファイルはございません" + chr$(13)
13000 color rgb(0,0,0):print "スペースキーを押してください" + chr$(13)
13010 key$=input$(1)
13020 if key$ = " " then goto TopScreen:
13030 else
13040 'cls 3:print"登録ファイルがございません" + chr$(13)
13050 'else
13060 cls 3:buffer_list_count=Loadcount()
13070 talk"登録件数は"+str$(buffer_list_count)+"件です"
13080 gload Gazo$ + "KazutamaList1_Entry.png"
13090 color rgb(0,0,255)
13100 'print"数霊リスト  登録件数" + chr$(13)
13110 print chr$(13)
13120 color rgb(255,0,0)
13130 print "登録件数:";buffer_list_count;"件";chr$(13)
13140 color rgb(0,0,0)
13150 print "エンターキーを押してください" + chr$(13)
13160 key$ = input$(1)
13170 if key$ = chr$(13) then
13180 goto KotodamaList_page:
13190 'else
13200 'goto Surei_List1:
13210 endif
13220 'endif
13230 endif
13240 func Loadcount()
13250 n = 0
13260 open "data/Parsonal_list1.csv" for input as #1
13270 while eof(1) = 0
13280 line input #1,line$
13290 n = n + 1
13300 wend
13310 close #1
13320 count_line = n
13330 endfunc count_line
13340 func Kotodama$(buf$)
13350 b = len("数霊:")
13360 a$ = Mid$(buf$,b+1,len(buf$))
13370 for i=0 to 118
13380 if bufline3$(2 * i) ="数霊:" + a$  then
13390 moji_$ = bufline3$(2*i + 1)
13400 'moji_$ = bufline3$(21)
13410 'moji$ = a$
13420 endif
13430 next i
13440 'kotodama$ = a$
13450 kotodama$ = moji_$
13460 endfunc kotodama$
13470 KotodamaList_page:
13480 cls 3:font 48:m = 0
13490 gload Gazo$ + "Screen5_Surei_List.png"
13500 open "data/Parsonal_list1.csv" for input as #1
13510 while eof(1) = 0
13520 input #1,line$
13530 bufKaztama$(m) = line$
13540 'input #1,line$
13550 'bufKaztama$(m,2*m + 1) = line$
13560 m = m + 1
13570 wend
13580 close #1
13590 l = 0:
13600 while buffer_list_count > l
13610 cls
13620 color rgb(255,0,0)
13630 'print "数霊　リスト" + chr$(13)
13640 print chr$(13)
13650 color rgb(255,255,255)
13660 n3 = l:n3 = n3 + 1
13670 print "番号:";n3;chr$(13)
13680 print bufKaztama$(2*l) + chr$(13)
13690 print bufKaztama$(2*l + 1) + chr$(13)
13700 'Kmoji$ = Kotodama$(str$(36))
13710 Kmoji$=moji$
13720 print chr$(13) + chr$(13)
13730 color rgb(0,0,0)
13740 print "スペース:次へ行く" + chr$(13)
13750 print "エンターキー:トップ画面" + chr$(13)
13760 key$ = input$(1)
13770 if key$ = " " then
13780 l = ((l + 1) Mod buffer_list_count)
13790 else
13800 if key$ = chr$(13) then
13810 goto TopScreen:
13820 else
13830 goto KotodamaList_page:
13840 endif
13850 endif
13860 wend
13870 '
13880 '結果表示２ Menu1
13890 Surei_Result4:
13900 cls 3:font (48-16):init"kb:4"
13910 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
13920 for i=0 to 181 + 3 - 1
13930 if i = count  then
13940 buffer$ = bufline2$(count + 4,0)
13950 endif
13960 next i
13970 if len(buffer$) > 23 and len(buffer$) <= 45 then
13980 buffer2$ = Mid$(buffer$,1,24)
13990 buffer3$ = Mid$(buffer$,25,(len(buffer$) - 25))
14000 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)
14010 else
14020 if len(buffer$) <= 23 then
14030 buffer2$ = Mid$(buffer$,1,22)
14040 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
14050 else
14060 if len(buffer$) > 45 and len(buffer$) <= 64 then
14070 buffer2$ = Mid$(buffer$,1,22)
14080 buffer3$ = Mid$(buffer$,23,20)
14090 buffer4$ = Mid$(buffer$,43,(len(buffer$)-43))
14100 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)+chr$(13)
14110 else
14120 if len(buffer$) > 64 and len(buffer$) <= 81 then
14130 buffer2$ = Mid$(buffer$,1,23)
14140 buffer3$ = Mid$(buffer$,24,20)
14150 buffer4$ = Mid$(buffer$,42,20)
14160 buffer5$ = Mid$(buffer$,63,(len(buffer$)-62))
14170 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13) + chr$(13) + chr$(13)
14180 if len(buffer$) > 81 and len(buffer$) <= 110 then
14190 buffer2$ = Mid$(buffer$,1,21)
14200 buffer3$ = Mid$(buffer$,22,20)
14210 buffer4$ = Mid$(buffer$,42,20)
14220 buffer5$ = Mid$(buffer$,62,20)
14230 buffer6$ = Mid$(buffer$,82,(len(buffer$) - 82))
14240 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13) + chr$(13) + chr$(13)
14250 endif
14260 endif
14270 endif
14280 endif
14290 endif
14300 'cls 3
14310 gload Gazo$ + "Screen1_Result2.png"
14320 color rgb(255,0,0)
14330 'print "診断結果 2" + chr$(13)
14340 print chr$(13)
14350 color rgb(127,255,212)
14360 print "入力文字:";buffer_moji$;chr$(13)
14370 print "数霊:";count;chr$(13)
14380 color rgb(255,255,255)
14390 print "数霊の説明:"+chr$(13)
14400 print buffer$
14410 color rgb(0,0,0)
14420 print "エンターキー:トップ,S:保存する" + chr$(13)
14430 key$="":bg=0
14440 while (key$<>chr$(13) and bg<>1)
14450 key$=inkey$
14460 bg=strig(1)
14470 pause 2
14480 wend
14490 if bg=1 then goto TopScreen:
14500 if key$ = chr$(13) then
14510 buffer$="" : buffer_moji$="" : count=0:goto TopScreen:
14520 else
14530 if key$="s" or key$="S" then
14540 s=Save():ui_msg"保存しました":goto Surei_Result4:
14550 else
14560 talk"無効な文字です":goto Surei_Result4:
14570 endif
14580 endif
14590 func All_clear()
14600 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
14610 endfunc
