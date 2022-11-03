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
320 Version$ = "1.0.9_2022.10.20(正式版)"
330 'csvファイル 1.数霊 ベースファイル
340 FILE_csv$ = "data/Kazutama.csv"
350 'csvファイル 2.数霊 ベースファイル 2
360 FILE_csv2$ = "data/Surei_chart_20211207.csv"
370 'gazo ファイル
380 Gazo$ = "data/Gazo/"
390 'Sound File(Voice)
400 '1.ボイス TopScreen
410 Voice_File_TopScreen$ = "data/Sound_data/"
420 '変数領域
430 'vcount:バーチャルパッド下の変数
440 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50):c=1:vcount=0:timer=0
450 count2 = 0:N=0:N2=0:m2 = 0
460 'ファイルの有無チェック
470 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
480 '1.ファイルが無いとき
490 cls :print "依存ファイルが見つかりません":
500 print "エンターキーを押してください"+chr$(13)
510 key$ = input$(1)
520 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
530 else
540 '2.ファイルが有るとき
550 cls:print "csv:file ok." + chr$(13)
560 n=0
570 open FILE_csv$ for input as #1
580 while eof(1) = 0
590 input #1,line$
600 'print line$
610 bufline$(n) = line$
620 'Print n;chr$(13)
630 n = n + 1
640 wend
650 close #1
660 N=n
670 '2つ目のファイル読み込み
680 'n = 0
690 open FILE_csv2$ for input as #2
700 for n=3 to 181
710 for i=0 to 1
720 input #2,line$
730 bufline2$(n,i) = line$
740 'print bufline2$(n,i)
750 next i
760 next n
770 close #2
780 N2 = n
790 '
800 endif
810 'or j = 3 to 181+3
820 'ufline3$(j - 3,n) = bufline2$(i,n)
830 'next j
840 'moji$ = Kotodama$(bufline3$(16))
850 'erase bufline2$
860 'Top画面
870 TopScreen:
880 cls 3:font 48:screen 1,1,1
890 'play ""
900 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
910 gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
920 '選択肢 1
930 gload Gazo$ + "Selection.png",1,5,200
940 '選択肢 2
950 gload Gazo$ + "Selection.png",1,5,300
960 '選択肢 3
970 gload Gazo$ + "Selection.png",1,5,400
980 '選択肢 4
990 gload Gazo$ + "Selection.png",1,5,500
1000 color rgb(0,0,255)
1010 print chr$(13)
1020 'print "●Top画面" + chr$(13)
1030 color rgb(255,255,255)
1040 print "番号を選んでください" + chr$(13)
1050 print " :1.数霊(かずたま)チェック" + chr$(13)
1060 print " :2.設定" + chr$(13)
1070 print " :3.ヘルプ" + chr$(13)
1080 print " :4.終　了" + chr$(13)
1090 color rgb(0,0,0)
1100 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
1110 No=1:locate 1,12:color rgb(0,0,0):print "1.数霊(かずたま)チェックを選択";chr$(13)
1120 'スプライト
1130 '選択肢 1 On
1140 sp_def 0,(5,200),32,32
1150 sp_on 0,1
1160 sp_put 0,(5,200),0,0
1170 '選択肢 2 Off
1180 sp_def 1,(5,300),32,32
1190 sp_on 1,0
1200 sp_put 1,(5,300),0,0
1210 '選択肢 3 Off
1220 sp_def 2,(5,400),32,32
1230 sp_on 2,0
1240 sp_put 2,(5,400),0,0
1250 '選択肢 4 Off
1260 sp_def 3,(5,500),32,32
1270 sp_on 3,0
1280 sp_put 3,(5,500),0,0
1290 color rgb(0,0,0)
1300 Main_Select:
1310 'y:バーチャルパッドの処理
1320 'key$:カーソルの処理
1330 y = 0:key$ = "":bg=0
1340 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
1350 y = stick(1)
1360 key$ = inkey$
1370 bg=strig(1)
1380 pause 2
1390 wend
1400 'if y=1 then
1410 'select case (c Mod 4)
1420 'ase 0:
1430 '     c=1:No=c:sp_on 0,1:sp_on 1,0 :sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print " 数霊(かずたま)チェックを選択":beep:goto Main_Select:
1440 'case 1:
1450 '       =2:No=c:sp_on 0,0:
1460 '"ase 2:
1470 'ase 3:
1480 'nd select
1490 'ndif
1500 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
1510 '1.バーチャルパッドの処理
1520 'バーチャルパッド下を押した時
1530 if y = 1 then
1540 select case No
1550 'No の初期値：No=1
1560 case 1:
1570        sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 20:locate 1,12:print "                                       ":locate 1,12:print"2.設定を選択":goto Main_Select:
1580 'デバッグライン　ここから
1590        '0のとき
1600 'デバッグライン　ここまで
1610 'デバッグライン　ここから
1620 case 2:
1630       sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 20:locate 1,12:print "                    "
1640 color rgb(0,0,0):locate 1,12:print "2.ヘルプを選択":No=3:goto Main_Select:
1650 'cls:color rgb(255,255,255):print"ok"
1660 'デバッグライン　ここまで
1670 case 3:
1680      sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 20:locate 1,12:print"                                       ":locate 1,12:print "4.終了を選択":No=0:goto Main_Select:
1690 'デバッグライン　ここから
1700      'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
1710 'デバッグライン　ここまで
1720 case 0:
1730    sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 20:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
1740 'デバッグライン　ここから
1750     ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
1760 'デバッグライン　ここまで
1770 end select
1780 endif
1790 'バーチャルパッド　上 ここから
1800 if y = -1 then
1810 select case No
1820 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
1830  case 1:
1840         sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:No=0:locate 1,12:print "                                       ":locate 1,12:print "4.終了を選択":goto Main_Select:
1850 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
1860  case 0:
1870        sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.ヘルプを選択":goto Main_Select:
1880  'No:3 3.Help→2.設定 No:2
1890  case 3:
1900        sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.設定を選択":goto Main_Select:
1910  case 2:
1920        sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.数霊(かずたま)チェックを選択":goto Main_Select:
1930 end select
1940 endif
1950 if bg=0 then
1960 select case No
1970 case 0:
1980       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
1990 end select
2000 endif
2010 'バーチャルパッド　上　ここまで
2020 '2.カーソルの処理
2030 'カーソル　下 chr$(31)
2040 if (key$ = chr$(31)) then
2050 select case (c Mod 4)
2060 '4
2070 '0 選択肢4 => 選択肢1
2080 case 0:
2090        c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "              ":color rgb(0,0,0):locate 1,12:print "数霊（かずたま）チェックを選択":beep:goto Main_Select:
2100 '1 選択肢1 => 選択肢2
2110 case 1:
2120        c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 1,12:print "                ":color rgb(0,0,0):locate 1,12:print "設 定を選択":beep:goto Main_Select:
2130 '2 選択肢2 => 選択肢3
2140 case 2:
2150        c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "               ":color rgb(0,0,0):locate 1,12:print " ヘルプを選択":beep:goto Main_Select:
2160 '3 選択肢３ => 選択肢4
2170 case 3:
2180        c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "               ":color rgb(255,255,255):locate 1,12:print " 終　了を選択":beep:goto Main_Select:
2190 case else:
2200          goto Main_Select:
2210 end select
2220 endif
2230 'カーソル　上
2240 if key$=chr$(30) then
2250 select case (c Mod 4)
2260 '選択肢1 => 選択肢4
2270 case 1:
2280       c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:PRINT "                 ":locate 1,12:beep:print "数霊(かずたま)チェックを選択":goto Main_Select:
2290 '選択肢2 => 選択肢1
2300 case 2:
2310        c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 1,12:print "                 ":locate 1,12:beep:print "設 定を選択":beep:goto Main_Select:
2320 '選択肢3　=> 選択肢2
2330 case 3:
2340        c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0
2350 '選択肢4 => 選択肢3
2360 case 0:
2370        c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                ":locate 1,12:print "終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
2380 end select
2390 endif
2400 'Input "番号:",No
2410 'エンターキー入力:決定
2420 if key$ = chr$(13) then
2430 select case No
2440  case 1:
2450 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
2460 case 3:
2470  Color rgb(255,255,255):goto Help:
2480 case 0:
2490       cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
2500 case 2:
2510       color rgb(255,255,255):goto Setting:
2520 'else
2530    'goto Main_Select:
2540 end select
2550 endif
2560 'ndif
2570 'if N0=0 or No>4 then goto TopScreen:
2580 '1-1.数霊チェック
2590 Surei_Check:
2600 cls 3:Font 48
2610 'gload Gazo$ + "Screen4.png"
2620 gload Gazo$ + "Screen1_Sureicheck_Top20211226.png"
2630 play ""
2640 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
2650 color rgb(255,0,0)
2660 'print "●数霊(かずたま)チェックトップ" + chr$(13)
2670 sp_on 0,1:sp_put 0,(5,200),0,0:screen 1,1,1
2680 print chr$(13)
2690 color rgb(255,255,255)
2700 print "番号を選んでください" + chr$(13)
2710 print " :1.数霊(かずたま)1人用" + chr$(13)
2720 print " :2.数霊(かずたま)2人用" + chr$(13)
2730 print " :3.前の画面に戻る" + chr$(13)
2740 print " :4.終 了" + chr$(13)
2750 color rgb(0,0,0):No=0
2760 locate 1,12
2770 print "1.数霊1人用を選択"
2780 Kazutama_main:
2790 key$ = input$(1)
2800 if key$ = chr$(31) then
2810 select case No
2820 case 0:
2830        No=1:sp_on 0,0:sp_on 1,1:sp_put 0,(5,300),0,0:locate 1,12:print "                                                          ":locate 1,12:print "2.数霊(かずたま)2人用を選択":goto Kazutama_main:
2840 case 1:
2850        No=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                                                          ":locate 1,12:print"3.前の画面に戻るを選択":goto Kazutama_main:
2860 case 2:
2870       No=3:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print"                                       ":locate 1,12:print"4.終了を選択":goto Kazutama_main:
2880 case 3:
2890 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print"1.数霊（かずたま)1人用を選択":goto Kazutama_main:
2900 end select
2910 endif
2920 if key$=chr$(13) then
2930 select case No
2940 case 0:
2950       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_Input:
2960 case 1:
2970       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
2980 case 2:
2990       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
3000 case 3:
3010       cls 4:cls 3:talk"プログラムを終了します":ui_text"プログラムを終了します":end
3020 end select
3030 endif
3040 'Input "番号:",No
3050 '前の画面に戻る
3060 'if No = 3 then goto TopScreen:
3070 'プログラムの終了
3080 'if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":COLOR rgb(255,255,255):end
3090 '1人用
3100 'if No = 1 then goto Surei_Input:
3110 '2人用
3120 'if No = 2 then goto Surei_twoParson:
3130 'if No > 4 or No=0 then ui_msg"もう一度入れてください":goto Surei_Check:
3140 '数霊(かずたま) 文字入力  1人用
3150 Surei_Input:
3160 if mode = 0 then
3170 cls 3:font 32
3180 gload Gazo$ + "InputKotodama_20211226.png"
3190 play""
3200 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
3210 color rgb(255,0,0)
3220 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
3230 print chr$(13)
3240 color rgb(0,0,0)
3250 print "文字を入れてください" + chr$(13)
3260 color rgb(255,0,0)
3270 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)"+chr$(13)
3280 print chr$(13)
3290 color rgb(0,0,0)
3300 Input "入力文字:",buffer_moji$
3310 goto Surei_Result:
3320 else
3330 if mode = 1 then
3340 cls 3:Font 32
3350 gload Gazo$ + "InputKotodama.png"
3360 color rgb(255,0,0)
3370 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
3380 color rgb(255,255,255)
3390 print "文字を入れてください" + chr$(13)
3400 color rgb(255,0,0)
3410 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
3420 print "大文字のみ)" + chr$(13)
3430 color rgb(0,0,0)
3440 Input "文字入力:",buffer_moji2$
3450 goto Surei_Result3:
3460 endif
3470 endif
3480 '数霊(かずたま)文字入力　2人用
3490 Surei_twoParson:
3500 cls 3:Font 32
3510 gload Gazo$ + "InputKotodama_20211226.png"
3520 '1人目入力
3530 'color rgb(255,0,0)
3540 print ""+chr$(13)
3550 'print "●数霊(かずたま) 1人目 入力" + chr$(13)
3560 color rgb(255,0,0)
3570 print "1人目の文字を入れてください" + chr$(13)
3580 color rgb(255,0,0)
3590 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
3600 color rgb(0,0,0)
3610 print chr$(13)
3620 Input "1人目文字入力:",buf_Parson1$
3630 Surei_twoParson2:
3640 cls 3:Font 32
3650 '2人目入力
3660 gload Gazo$ + "InputKotodama_20211226.png"
3670 'color rgb(255,0,0)
3680 'print "●数霊(かずたま) 2人目 入力" + chr$(13)
3690 print ""+chr$(13)
3700 print "2人目の文字を入れてください" + chr$(13)
3710 color rgb(255,0,0)
3720 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
3730 color rgb(0,0,0)
3740 Input "2人目の文字入力:",buf_Parson2$
3750 goto Surei_Result2:
3760 '数霊　計算 パート
3770 '文字の計算関数
3780 'moji$:1文字を入れる
3790 func Complate(moji$)
3800 for n = 1 to 116
3810 if moji$ = bufline$(2*n) then
3820 buffcount = val(bufline$(2 * n + 1))
3830 endif
3840 next n
3850 endfunc buffcount
3860 '数霊　結果表示
3870 Surei_Result:
3880 cls 3:Font 32
3890 'ゼロカウント:zcount
3900 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
3910 '例 アカい:"い"の文字は無効な文字なので、はじく
3920 zcount=0
3930 'mojicount:入力文字数
3940 mojicount = len(buffer_moji$)
3950 for n=1 to mojicount
3960 for j=1 to 118
3970 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
3980 if bufcount$(n - 1) = bufline$(2 * j) then
3990   zcount = zcount + 1
4000 endif
4010 next j
4020 next n
4030 if mojicount > zcount then
4040 cls 3:ui_msg "無効な文字です":talk"無効な文字があります。":zcount = 0:goto Surei_Input:
4050 endif
4060 for i = 1 to mojicount
4070 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
4080 n1 = Complate(bufcount$(i - 1))
4090 count = count + n1
4100 next i
4110 '182以上のとき,181を引く
4120 if (count > 181) then count = count - 181
4130 cls 3:Font 48+16
4140 gload Gazo$ + "Result_Screen3_20211226.png"
4150 color rgb(255,0,0)
4160 print "入力文字:" + buffer_moji$ + chr$(13)
4170 'print chr$(13)
4180 color rgb(0,0,255)
4190 print "数霊(かずたま):";count;chr$(13)
4200 color rgb(0,0,0)
4210 print "エンターキー:トップ" + chr$(13)
4220 print "スペース:次 へ" + chr$(13)
4230 key$ = input$(1)
4240 if key$ = " " then goto Surei_Result4:
4250 if key$ = chr$(13) then
4260 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
4270 for i=0 to 9
4280 bufcount$(i) = " "
4290 next i
4300 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
4310 'else
4320 'if key$ = " " then
4330 '２回めの入力に行く
4340 'mode = 1:goto Surei_Input:
4350 'else
4360 'if key$ = "s" or key$ = "S" then
4370 'ファイルを保存する
4380 's = Save()
4390 'ui_msg"保存しました"
4400 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
4410 else
4420 goto Surei_Result:
4430 'endif
4440 endif
4450 '3-1 バージョン情報
4460 Version:
4470 cls 3:Font 32
4480 gload Gazo$ + "Screen1_Version.png"
4490 play ""
4500 play Voice_File_TopScreen$ + "Voice_Version.mp3"
4510 color rgb(255,0,0)
4520 'print"●バージョン情報"+chr$(13)
4530 print chr$(13)
4540 color rgb(255,255,255)
4550 print "Ver:";Version$ + chr$(13)
4560 print "アプリ名:数霊"+ chr$(13)
4570 print "for Basic for Android"+chr$(13)
4580 print "Author:licksjp"+chr$(13)
4590 print "制作開始:2021.7.28" + chr$(13)
4600 print chr$(13)
4610 print "(C)Copy right licksjp " + chr$(13)
4620 print "All rights reserved" + chr$(13)
4630 color rgb(0,0,0)
4640 print "エンターキーを押してください" + chr$(13)
4650 key$ = input$(1)
4660 if key$ = chr$(13) then
4670 goto TopScreen:
4680 else
4690 talk "無効なキーです":goto Version:
4700 endif
4710 '3-2 参考文献
4720 Reference_Book:
4730 cls 3:Font 48:play""
4740 gload Gazo$ + "Screen1_Reference.png"
4750 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
4760 color rgb(255,0,0)
4770 'print"●参考文献" + chr$(13)
4780 print chr$(13)
4790 color rgb(255,255,255)
4800 print "書名:数霊" + chr$(13)
4810 print "出版社:徳間書店" + chr$(13)
4820 print "ISBN:978-4-19-" + chr$(13)
4830 print "         865309-5" + chr$(13)
4840 print "定価:2300円 + 税" + chr$(13)
4850 color rgb(0,0,0)
4860 print "エンターキーを押してください"
4870 key$=input$(1)
4880 if key$=chr$(13) then
4890 goto TopScreen:
4900 else
4910 talk"無効なキーです":goto Reference_Book:
4920 endif
4930 'ヘルプ画面　トップ画面
4940 Help:
4950 No=0:c=0
4960 play ""
4970 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
4980 cls 3:Font 48:
4990 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
5000 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0
5010 color rgb(255,0,0)
5020 'print "●3.ヘルプ　トップ画面" + chr$(13)
5030 print chr$(13)
5040 color rgb(255,255,255)
5050 print "番号を選んでください" + chr$(13)
5060 print " :1.バージョン" + chr$(13)
5070 print " :2.参考文献" + chr$(13)
5080 print " :3.トップ画面" + chr$(13)
5090 print " :4.終 了" + chr$(13)
5100 color rgb(0,0,0)
5110 if No = 0 then print " バージョンを選択"
5120 key$ = input$(1)
5130 'カーソルの下
5140 if key$ = chr$(31) then
5150 select case (c Mod 4)
5160 'バージョンから参考文献
5170 case 0:
5180        c=1:No=c:locate 0,12:Print "           ":locate 0,12:print " 参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto 5120
5190 '参考文献からトップ画面
5200 case 1:
5210        c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "            ":locate 0,12:print " トップ画面を選択":goto 5120
5220 'トップ画面から終了
5230 case 2:
5240        c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 0,12:print " 終 了を選択":goto 5120
5250 '終了からバージョン
5260 case 3:
5270        c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                     ":locate 0,12:print " バージョンを選択":goto 5120
5280 case else:
5290           goto 5120
5300 end select
5310 else
5320 'カーソル　上
5330 if key$ = chr$(30) then
5340 select case (c Mod 4)
5350 'バージョンから終了
5360 case 0:
5370        c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:locate 0,12:print "                   ":locate 0,12:print " 終 了を選択":goto 5120
5380 '参考文献からバージョン
5390 case 1:
5400        c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                   ":locate 0,12:print " バージョンを選択":goto 5120
5410 'トップ画面から参考文献
5420 case 2:
5430        c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":locate 0,12:print " 参考文献を選択":goto 5120
5440 '終了からトップ画面を選択
5450 case 3:
5460        c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print"                      ":locate 0,12:print " トップ画面を選択":goto 5120
5470 case else:
5480           goto 5120
5490 end select
5500 else
5510 'Input "番号:",No
5520 'sp_def 0,(5,200),32,32
5530 'エンターキー：決定
5540 if key$=chr$(13) then
5550 if No=0 then cls 4:goto Version:
5560 if No=2 then cls 4:goto TopScreen:
5570 if No=1 then cls 4:goto Reference_Book:
5580 if No=3 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
5590 else
5600 goto 5120
5610 endif
5620 endif
5630 endif
5640 'if (No = 0 or No > 4) then ui_msg"もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
5650 '登録文字の確認
5660 '文字を1文字入れて登録されているか調べるメニュー
5670 '設定項目
5680 Setting:
5690 cls 3:Font 48
5700 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
5710 play ""
5720 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
5730 No=0
5740 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
5750 color rgb(0,0,255)
5760 'print "●設定項目" + chr$(13)
5770 print chr$(13)
5780 color rgb(255,255,255)
5790 print "番号を選んでください" + chr$(13)
5800 print " :1.登録文字の確認" + chr$(13)
5810 print " :2.数霊文字確認" + chr$(13)
5820 print " :3.トップ画面に行く" + chr$(13)
5830 print " :4.終 了" + chr$(13)
5840 color rgb(0,0,0)
5850 locate 1,12
5860 if No=0 then print "登録文字の確認を選択"
5870 SettingScreen:
5880 key$ = input$(1)
5890 if key$ =chr$(31) then
5900 select case (No Mod 4)
5910 '登録文字から数霊文字の確認
5920 case 0:
5930       c=1:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
5940 '数霊文字の確認からトップ画面に行く
5950 case 1:
5960       c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
5970 'トップ画面に行くから終了
5980 case 2:
5990       c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
6000 '終了から登録文字
6010 case 3:
6020       c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
6030 end select
6040 else
6050 'カーソル　上
6060 if key$ = chr$(30) then
6070 select case (No Mod 4)
6080 case 1:
6090        c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
6100 case 2:
6110        c=1:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
6120 case 3:
6130        c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
6140 case 0:
6150        c=3:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
6160 end select
6170 else
6180 'エンターキーを押したとき
6190 if key$ = chr$(13) then
6200 if No=2 then goto TopScreen:
6210 if No=0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
6220 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
6230 if No=3 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:color rgb(255,255,255):pause 3*120:end
6240 else
6250 goto SettingScreen:
6260 endif
6270 endif
6280 endif
6290 '文字検索項目  ここから
6300 Moji_Search:
6310 cls 4:cls 3:Font 32+16
6320 gload Gazo$ + "Moji_Search_Result.png"
6330 play ""
6340 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
6350 print "" + chr$(13)
6360 color rgb(255,0,0)
6370 print "文字を一文字入れてください" + chr$(13)
6380 color rgb(0,0,0)
6390 Input "登録文字:",moji$
6400 moji_count = len(moji$)
6410 if moji_count > 1 then
6420 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
6430 else
6440 count=0
6450 for n = 0 to 116
6460 if bufline$(2*n) = moji$ then
6470 cls 3:font 48
6480 gload Gazo$ + "Moji_Search_Result.png"
6490 'talk"この文字は登録されています"
6500 play ""
6510 play Voice_File_TopScreen$+"Voice_Entry_OK.mp3"
6520 print chr$(13)
6530 color rgb(255,0,0)
6540 print moji$;"は、登録されています。" + chr$(13)
6550 color rgb(0,0,0)
6560 print "エンターキーを押してください"
6570 key$=input$(1)
6580 if key$=chr$(13) then goto TopScreen:
6590 count = count + 1
6600 endif
6610 next n
6620 if count = 0 then
6630 cls 3:font 48
6640 gload Gazo$ + "Moji_check.png"
6650 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
6660 print chr$(13)
6670 color rgb(255,0,0)
6680 print moji$;"は、登録されていません。" + chr$(13)
6690 color rgb(0,0,0)
6700 print "エンターキーを押してください" + chr$(13)
6710 key$=input$(1)
6720 if key$=chr$(13) then goto TopScreen:
6730 endif
6740 endif
6750 Surei_Result2:
6760 cls 3:Font 48
6770 zcount1=0:zcount2=0:count1=0:count2=0
6780 '1人目
6790 mojicount1=len(buf_Parson1$)
6800 '2人目
6810 mojicount2=len(buf_Parson2$)
6820 '1人目
6830 for n=1 to mojicount1
6840 for j=1 to 116
6850 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
6860 if bufcount1$(n-1) = bufline$(2*j) then
6870 zcount1 = zcount1 + 1
6880 endif
6890 next j
6900 next n
6910 '2人目
6920 for n=1 to mojicount2
6930 for j=1 to 116
6940 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
6950 if bufcount2$(n-1) = bufline$(2*j) then
6960 zount2 = zcount2 + 1
6970 endif
6980 next j
6990 next n
7000 '1人目
7010 for i=1 to mojicount1
7020 bufcount1$(i-1)=Mid$(buf_Parson1$,i,1)
7030 p1=Complate(bufcount1$(i-1))
7040 count1 = count1 + p1
7050 next i
7060 '2人目
7070 for i=1 to mojicount2
7080 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
7090 p2 = Complate(bufcount2$(i-1))
7100 count2 = count2 + p2
7110 next i
7120 cls 3:
7130 gload Gazo$ + "Screen1_2Parson_Result.png"
7140 color rgb(255,0,0)
7150 'print "数霊 2人用 結果表示"+chr$(13)
7160 print ""+chr$(13)
7170 color rgb(255,255,255)
7180 print "1人目:";buf_Parson1$;chr$(13)
7190 print "数霊1:";count1;chr$(13)
7200 print "2人目:";buf_Parson2$;chr$(13)
7210 print "数霊2:";count2;chr$(13)
7220 print "数霊(合計):";count1 + count2;chr$(13)
7230 color rgb(0,0,0)
7240 print "エンターキーを押してください" + chr$(13)
7250 key$=input$(1)
7260 if key$=chr$(13) then goto TopScreen:
7270 Surei_Result3:
7280 cls 3:Font 48
7290 zcount2 = 0:count2 = 0
7300 mojicount2 = len(buffer_moji2$)
7310 for n=1 to mojicount2
7320 for j=1 to 116
7330 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
7340 if bufcount2$(n - 1) = bufline$(2 * j) then
7350 zcount2 = zcount2 + 1
7360 endif
7370 next j
7380 next n
7390 for i=1 to mojicount2
7400 n2 = Complate(bufcount2$(i-1))
7410 count2 = count2 + n2
7420 next i
7430 gload Gazo$ + "Screen5.png"
7440 color rgb(255,0,0)
7450 print "数霊の結果表示" + chr$(13)
7460 color rgb(255,255,255)
7470 print "１回目回の文字入力:";buffer_moji$;chr$(13)
7480 print "１回目の数霊(かずたま)";count;chr$(13)
7490 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
7500 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
7510 color rgb(0,0,0)
7520 print "エンターキー:トップ画面";chr$(13)
7530 print "c or C キー:数霊の比較";chr$(13)
7540 key$ = input$(1)
7550 if key$ = chr$(13) then mode=0:count=0:count2=0:goto TopScreen:
7560 if key$ = "c" or key$ = "C" then
7570 if count = count2 then
7580 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
7590 else
7600 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
7610 endif
7620 endif
7630 Moji_Count_Check:
7640 cls 3:Font 48
7650 gload Gazo$ + "Moji_check.png"
7660 n=0
7670 open FILE_csv$ for input as #1
7680 while eof(1)=0
7690 line input #1, line$
7700 n = n + 1
7710 wend
7720 close #1
7730 'n = n - 1
7740 'talk "登録文字数は"+str$(n)+"文字です"
7750 play ""
7760 if n = 118 then
7770 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
7780 else
7790 talk"登録文字数は、"+str$(n)+"文字です"
7800 endif
7810 print "" + chr$(13)
7820 color rgb(255,0,0)
7830 print "文字の登録文字数は";n;"文字" + chr$(13)
7840 color rgb(0,0,0)
7850 print "エンターキーを押してください"+chr$(13)
7860 key$ = input$(1)
7870 if key$ = chr$(13) then
7880 goto TopScreen:
7890 else
7900 goto Moji_Count_Check:
7910 endif
7920 'Save 関数
7930 func Save()
7940 open "data/Parsonal_list1.csv" for append as #1
7950 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
7960 close #1
7970 endfunc
7980 Select_moji:
7990 cls 3:font 48:No = 0
8000 gload Gazo$ + "Screen1_mojicheck.png"
8010 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
8020 color rgb(255,0,0)
8030 'print "文字の確認" + chr$(13)
8040 print chr$(13)
8050 color rgb(255,255,255)
8060 print "番号を選んでください" + chr$(13)
8070 print " :1.登録文字検索"+chr$(13)
8080 print " :2.登録文字数の確認" + chr$(13)
8090 print " :3.前の画面に戻る" + chr$(13)
8100 print " :4.終　了" + chr$(13)
8110 color rgb(0,0,0)
8120 if No = 0 then print "登録文字の確認を選択"
8130 key$ = input$(1)
8140 'カーソルの下
8150 if key$ = chr$(31) then
8160 select case (No Mod 4)
8170 case 0:
8180        c=1:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto 8130
8190 case 1:
8200        c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:sp_on 3,0:goto 8130
8210 case 2:
8220        c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:goto 8130
8230 case 3:
8240        c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto 8130
8250 end select
8260 endif
8270 'カーソル　上
8280 if key$ = chr$(30) then
8290 select case (No Mod 4)
8300 case 0:
8310        c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto 8130
8320 case 1:
8330        c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto 8130
8340 case 2:
8350        c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto 8130
8360 case 3:
8370        c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto 8130
8380 end select
8390 endif
8400 'エンターキーを押す
8410 if key$ = chr$(13) then
8420 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
8430 if No = 2 then goto Moji_Count_Check:
8440 if No = 3 then goto TopScreen:
8450 if No = 0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg
8460 endif
8470 '
8480 Kakunin_Surei_count:
8490 cls 3:font 48
8500 gload Gazo$ + "Kazutama_List_Top.png"
8510 color rgb(255,0,0)
8520 'print "数霊の確認" + chr$(13)
8530 print chr$(13)
8540 color rgb(255,255,255)
8550 print "番号を選んでください" + chr$(13)
8560 print "1.数霊リスト 1人用" + chr$(13)
8570 'print "2.数霊リスト 2人用:未実装" + chr$(13)
8580 print "2.トップ画面に行く" + chr$(13)
8590 print "3.終 了" + chr$(13)
8600 print ""+chr$(13)
8610 color rgb(0,0,0)
8620 Input "番号:",No
8630 if No=2 then goto TopScreen:
8640 if No=3 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
8650 if No=1 then goto Surei_List1:
8660 if No > 3 or No=0 then ui_msg"無効な数字です、入れ直してください":talk"無効な数字です":goto Kakunin_Surei_count:
8670 'if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
8680 Surei_List1:
8690 cls 3:font 48
8700 if dir$("data/Parsonal_list1.csv") = ""  then
8710 cls 3
8720 gload "data/Gazo/"+"KazutamaList1.png"
8730 print chr$(13)
8740 color rgb(255,0,0):print"登録ファイルはございません" + chr$(13)
8750 color rgb(0,0,0):print "スペースキーを押してください" + chr$(13)
8760 key$=input$(1)
8770 if key$ = " " then goto TopScreen:
8780 else
8790 'cls 3:print"登録ファイルがございません" + chr$(13)
8800 'else
8810 cls 3:buffer_list_count=Loadcount()
8820 talk"登録件数は"+str$(buffer_list_count)+"件です"
8830 gload Gazo$ + "KazutamaList1_Entry.png"
8840 color rgb(0,0,255)
8850 'print"数霊リスト  登録件数" + chr$(13)
8860 print chr$(13)
8870 color rgb(255,0,0)
8880 print "登録件数:";buffer_list_count;"件";chr$(13)
8890 color rgb(0,0,0)
8900 print "エンターキーを押してください" + chr$(13)
8910 key$ = input$(1)
8920 if key$ = chr$(13) then
8930 goto KotodamaList_page:
8940 'else
8950 'goto Surei_List1:
8960 endif
8970 'endif
8980 endif
8990 func Loadcount()
9000 n = 0
9010 open "data/Parsonal_list1.csv" for input as #1
9020 while eof(1) = 0
9030 line input #1,line$
9040 n = n + 1
9050 wend
9060 close #1
9070 count_line = n
9080 endfunc count_line
9090 func Kotodama$(buf$)
9100 b = len("数霊:")
9110 a$ = Mid$(buf$,b+1,len(buf$))
9120 for i=0 to 118
9130 if bufline3$(2 * i) ="数霊:" + a$  then
9140 moji_$ = bufline3$(2*i + 1)
9150 'moji_$ = bufline3$(21)
9160 'moji$ = a$
9170 endif
9180 next i
9190 'kotodama$ = a$
9200 kotodama$ = moji_$
9210 endfunc kotodama$
9220 KotodamaList_page:
9230 cls 3:font 48:m = 0
9240 gload Gazo$ + "Screen5_Surei_List.png"
9250 open "data/Parsonal_list1.csv" for input as #1
9260 while eof(1) = 0
9270 input #1,line$
9280 bufKaztama$(m) = line$
9290 'input #1,line$
9300 'bufKaztama$(m,2*m + 1) = line$
9310 m = m + 1
9320 wend
9330 close #1
9340 l = 0:
9350 while buffer_list_count > l
9360 cls
9370 color rgb(255,0,0)
9380 'print "数霊　リスト" + chr$(13)
9390 print chr$(13)
9400 color rgb(255,255,255)
9410 n3 = l:n3 = n3 + 1
9420 print "番号:";n3;chr$(13)
9430 print bufKaztama$(2*l) + chr$(13)
9440 print bufKaztama$(2*l + 1) + chr$(13)
9450 'Kmoji$ = Kotodama$(str$(36))
9460 Kmoji$=moji$
9470 print chr$(13) + chr$(13)
9480 color rgb(0,0,0)
9490 print "スペース:次へ行く" + chr$(13)
9500 print "エンターキー:トップ画面" + chr$(13)
9510 key$ = input$(1)
9520 if key$ = " " then
9530 l = ((l + 1) Mod buffer_list_count)
9540 else
9550 if key$ = chr$(13) then
9560 goto TopScreen:
9570 else
9580 goto KotodamaList_page:
9590 endif
9600 endif
9610 wend
9620 '
9630 '結果表示２ Menu1
9640 Surei_Result4:
9650 cls 3:font (48-16)
9660 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
9670 for i=0 to 181 + 3 - 1
9680 if i = count  then
9690 buffer$ = bufline2$(count + 4,0)
9700 endif
9710 next i
9720 if len(buffer$) > 23 and len(buffer$) <= 45 then
9730 buffer2$ = Mid$(buffer$,1,24)
9740 buffer3$ = Mid$(buffer$,25,(len(buffer$) - 25))
9750 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)
9760 else
9770 if len(buffer$) <= 23 then
9780 buffer2$ = Mid$(buffer$,1,22)
9790 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
9800 else
9810 if len(buffer$) > 45 and len(buffer$) <= 64 then
9820 buffer2$ = Mid$(buffer$,1,22)
9830 buffer3$ = Mid$(buffer$,23,20)
9840 buffer4$ = Mid$(buffer$,43,(len(buffer$)-43))
9850 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)+chr$(13)
9860 else
9870 if len(buffer$) > 64 and len(buffer$) <= 81 then
9880 buffer2$ = Mid$(buffer$,1,23)
9890 buffer3$ = Mid$(buffer$,24,20)
9900 buffer4$ = Mid$(buffer$,42,20)
9910 buffer5$ = Mid$(buffer$,63,(len(buffer$)-62))
9920 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13) + chr$(13) + chr$(13)
9930 if len(buffer$) > 81 and len(buffer$) <= 110 then
9940 buffer2$ = Mid$(buffer$,1,21)
9950 buffer3$ = Mid$(buffer$,22,20)
9960 buffer4$ = Mid$(buffer$,42,20)
9970 buffer5$ = Mid$(buffer$,62,20)
9980 buffer6$ = Mid$(buffer$,82,(len(buffer$) - 82))
9990 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13) + chr$(13) + chr$(13)
10000 endif
10010 endif
10020 endif
10030 endif
10040 endif
10050 'cls 3
10060 gload Gazo$ + "Screen1_Result2.png"
10070 color rgb(255,0,0)
10080 'print "診断結果 2" + chr$(13)
10090 print chr$(13)
10100 color rgb(127,255,212)
10110 print "入力文字:";buffer_moji$;chr$(13)
10120 print "数霊:";count;chr$(13)
10130 color rgb(255,255,255)
10140 print "数霊の説明:"+chr$(13)
10150 print buffer$
10160 color rgb(0,0,0)
10170 print "エンターキー:トップ,S:保存する" + chr$(13)
10180 key$=input$(1)
10190 if key$ = chr$(13) then
10200 buffer$="" : buffer_moji$="" : count=0:goto TopScreen:
10210 else
10220 if key$="s" or key$="S" then
10230 s=Save():ui_msg"保存しました":goto Surei_Result4:
10240 else
10250 talk"無効な文字です":goto Surei_Result4:
10260 endif
10270 endif
10280 func All_clear()
10290 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
10300 endfunc
