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
310 Version$ = "1.0.4.2022.04.06(正式版)"
320 'csvファイル 1.数霊 ベースファイル
330 FILE_csv$ = "data/Kazutama.csv"
340 'csvファイル 2.数霊 ベースファイル 2
350 FILE_csv2$ = "data/Surei_chart_20211207.csv"
360 'gazo ファイル
370 Gazo$ = "data/Gazo/"
380 'Sound File(Voice)
390 '1.ボイス TopScreen
400 Voice_File_TopScreen$ = "data/Sound_data/"
410 '変数領域
420 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50):c=1
430 count2 = 0:N=0:N2=0:m2 = 0
440 'ファイルの有無チェック
450 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
460 '1.ファイルが無いとき
470 cls :print "依存ファイルが見つかりません":
480 print "エンターキーを押してください"+chr$(13)
490 key$ = input$(1)
500 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
510 else
520 '2.ファイルが有るとき
530 cls:print "csv:file ok." + chr$(13)
540 n=0
550 open FILE_csv$ for input as #1
560 while eof(1) = 0
570 input #1,line$
580 'print line$
590 bufline$(n) = line$
600 'Print n;chr$(13)
610 n = n + 1
620 wend
630 close #1
640 N=n
650 '2つ目のファイル読み込み
660 'n = 0
670 open FILE_csv2$ for input as #2
680 for n=3 to 181
690 for i=0 to 1
700 input #2,line$
710 bufline2$(n,i) = line$
720 'print bufline2$(n,i)
730 next i
740 next n
750 close #2
760 N2 = n
770 '
780 endif
790 'or j = 3 to 181+3
800 'ufline3$(j - 3,n) = bufline2$(i,n)
810 'next j
820 'moji$ = Kotodama$(bufline3$(16))
830 'erase bufline2$
840 'Top画面
850 TopScreen:
860 cls 3:font 48:screen 1,1,1
870 'play ""
880 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
890 gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
900 '選択肢 1
910 gload Gazo$ + "Selection.png",1,5,200
920 '選択肢 2
930 gload Gazo$ + "Selection.png",1,5,300
940 '選択肢 3
950 gload Gazo$ + "Selection.png",1,5,400
960 '選択肢 4
970 gload Gazo$ + "Selection.png",1,5,500
980 color rgb(0,0,255)
990 print chr$(13)
1000 'print "●Top画面" + chr$(13)
1010 color rgb(255,255,255)
1020 print "番号を選んでください" + chr$(13)
1030 print " :1.数霊(かずたま)チェック" + chr$(13)
1040 print " :2.設 定" + chr$(13)
1050 print " :3.ヘルプ" + chr$(13)
1060 print " :4.終　了" + chr$(13)
1070 color rgb(0,0,0)
1080 No=0:locate 1,12:print "数霊（かずたま）チェックを選択"
1090 'スプライト
1100 '選択肢 1
1110 sp_def 0,(5,200),32,32
1120 sp_on 0,1
1130 sp_put 0,(5,200),0,0
1140 '選択肢 2
1150 sp_def 1,(5,300),32,32
1160 sp_on 1,0
1170 sp_put 1,(5,300),0,0
1180 '選択肢 3
1190 sp_def 2,(5,400),32,32
1200 sp_on 2,0
1210 sp_put 2,(5,400),0,0
1220 '選択肢 4
1230 sp_def 3,(5,500),32,32
1240 sp_on 3,0
1250 sp_put 3,(5,500),0,0
1260 color rgb(0,0,0)
1270 key$ = input$(1)
1280 'カーソル　下 chr$(31)
1290 if key$ = chr$(31) then
1300 select case (c Mod 4)
1310 '4
1320 '0 選択肢4 => 選択肢1
1330 case 0:
1340        c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 1,12:print "              ":color rgb(0,0,0):locate 1,12:print "設 定を選択":beep:goto 1270
1350 '1 選択肢1 => 選択肢2
1360 case 1:
1370        c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                ":color rgb(0,0,0):locate 1,12:print " ヘルプを選択":beep:goto 1270
1380 '2 選択肢2 => 選択肢3
1390 case 2:
1400        c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "               ":color rgb(0,0,0):locate 1,12:print " 終 了を選択":beep:goto 1270
1410 '3 選択肢３ => 選択肢4
1420 case 3:
1430        c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "               ":color rgb(0,0,0):locate 1,12:print " 数霊(かずたま)を選択":beep:goto 1270
1440 case else:
1450          goto 1270
1460 end select
1470 else
1480 'カーソル　上
1490 if key$=chr$(30) then
1500 select case (c Mod 4)
1510 '選択肢1 => 選択肢4
1520 case 1:
1530       c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:PRINT "                 ":locate 1,12:beep:print "数霊チェックを選択":goto 1270
1540 '選択肢2 => 選択肢1
1550 case 2:
1560        c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 1,12:print "                 ":locate 1,12:beep:print "設 定を選択":beep:goto 1270
1570 '選択肢3　=> 選択肢2
1580 case 3:
1590        c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0:locate 1,12:print "                 ":locate 1,12:print "ヘルプを選択":goto 1270
1600 '選択肢4 => 選択肢3
1610 case 0:
1620        c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                ":locate 1,12:print "終 了を選択":goto 1270
1630 case else:
1640           goto 1270
1650 end select
1660 else
1670 'Input "番号:",No
1680 'エンターキー入力:決定
1690 if key$=chr$(13) then
1700 if No=0 then goto Surei_Check:
1710 if No=2 then Color rgb(255,255,255):goto Help:
1720 if No=3 then cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
1730 if No=1 then color rgb(255,255,255):goto Setting:
1740 else
1750     goto 1270
1760 endif
1770 endif
1780 endif
1790 'if N0=0 or No>4 then goto TopScreen:
1800 '1-1.数霊チェック
1810 Surei_Check:
1820 cls 3:Font 48
1830 'gload Gazo$ + "Screen4.png"
1840 gload Gazo$ + "Screen1_Sureicheck_Top20211226.png"
1850 play ""
1860 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
1870 color rgb(255,0,0)
1880 'print "●数霊(かずたま)チェックトップ" + chr$(13)
1890 print chr$(13)
1900 color rgb(255,255,255)
1910 print "番号を選んでください"+chr$(13)
1920 print " :1.数霊(かずたま)チェック1" + chr$(13)
1930 print " :2.数霊(かずたま)チェック2" + chr$(13)
1940 print " :3.前の画面に戻る" + chr$(13)
1950 print " :4.終 了" + chr$(13)
1960 color rgb(0,0,0)
1970 No=0:locate 1,12:print "                 ":locate 1,12:print "数霊チェック１を選択"
1980 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0
1990 key$=input$(1)
2000 if key$ = chr$(31) then
2010 select case (No Mod 4)
2020 case 0:
2030        No=1:sp_on 1,1:sp_on 0,0:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 1,12:print "                        ":locate 1,12:print "数霊チェック２を選択":goto 1990
2040 case 1:
2050        No=2:sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                       ":locate 1,12:print "前の画面に戻るを選択":goto 1990
2060 case 2:
2070        No=3:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:locate 1,12:print "                       ":locate 1,12:print "終 了を選択":goto 1990
2080 case 3:
2090        No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0: locate 1,12:print "                         ":locate 1,12:print "数霊チェック1を選択":goto 1990
2100 end select
2110 else
2120 if key$ = chr$(30) then
2130 select case (No Mod 4)
2140 case 0:
2150        No=3:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                             ":locate 1,12:print "終 了を選択":goto 1990
2160 case 1:
2170        No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                     ":locate 1,12:print "数霊チェック１を選択":goto 1990
2180 case 2:
2190        No=1:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 1,12:print "                    ":locate 1,12:print "数霊チェック２を選択":goto 1990
2200 case 3:
2210        No=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                        ":locate 1,12:print "前の画面に戻るを選択":goto 1990
2220 end select
2230 else
2240 if key$ = chr$(13) then
2250 '前の画面に戻る
2260 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
2270 'プログラムの終了
2280 if No = 3 then cls 3:cls 4:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":COLOR rgb(255,255,255):end
2290 '1人用
2300 if No = 0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Input:
2310 '2人用
2320 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_twoParson:
2330 endif
2340 endif
2350 endif
2360 '数霊(かずたま) 文字入力  1人用
2370 Surei_Input:
2380 if mode = 0 then
2390 cls 3:font 32
2400 gload Gazo$ + "InputKotodama_20211226.png"
2410 play""
2420 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
2430 color rgb(255,0,0)
2440 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
2450 print chr$(13)
2460 color rgb(0,0,0)
2470 print "文字を入れてください" + chr$(13)
2480 color rgb(255,0,0)
2490 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)"+chr$(13)
2500 print chr$(13)
2510 color rgb(0,0,0)
2520 Input "入力文字:",buffer_moji$
2530 goto Surei_Result:
2540 else
2550 if mode = 1 then
2560 cls 3:Font 32
2570 gload Gazo$ + "InputKotodama.png"
2580 color rgb(255,0,0)
2590 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
2600 color rgb(255,255,255)
2610 print "文字を入れてください" + chr$(13)
2620 color rgb(255,0,0)
2630 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
2640 print "大文字のみ)" + chr$(13)
2650 color rgb(0,0,0)
2660 Input "文字入力:",buffer_moji2$
2670 goto Surei_Result3:
2680 endif
2690 endif
2700 '数霊(かずたま)文字入力　2人用
2710 Surei_twoParson:
2720 cls 3:Font 32
2730 gload Gazo$ + "InputKotodama_20211226.png"
2740 '1人目入力
2750 'color rgb(255,0,0)
2760 print ""+chr$(13)
2770 'print "●数霊(かずたま) 1人目 入力" + chr$(13)
2780 color rgb(255,0,0)
2790 print "1人目の文字を入れてください" + chr$(13)
2800 color rgb(255,0,0)
2810 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
2820 color rgb(0,0,0)
2830 print chr$(13)
2840 Input "1人目文字入力:",buf_Parson1$
2850 Surei_twoParson2:
2860 cls 3:Font 32
2870 '2人目入力
2880 gload Gazo$ + "InputKotodama_20211226.png"
2890 'color rgb(255,0,0)
2900 'print "●数霊(かずたま) 2人目 入力" + chr$(13)
2910 print ""+chr$(13)
2920 print "2人目の文字を入れてください" + chr$(13)
2930 color rgb(255,0,0)
2940 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
2950 color rgb(0,0,0)
2960 Input "2人目の文字入力:",buf_Parson2$
2970 goto Surei_Result2:
2980 '数霊　計算 パート
2990 '文字の計算関数
3000 'moji$:1文字を入れる
3010 func Complate(moji$)
3020 for n = 1 to 116
3030 if moji$ = bufline$(2*n) then
3040 buffcount = val(bufline$(2 * n + 1))
3050 endif
3060 next n
3070 endfunc buffcount
3080 '数霊　結果表示
3090 Surei_Result:
3100 cls 3:Font 32
3110 'ゼロカウント:zcount
3120 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
3130 '例 アカい:"い"の文字は無効な文字なので、はじく
3140 zcount=0
3150 'mojicount:入力文字数
3160 mojicount = len(buffer_moji$)
3170 for n=1 to mojicount
3180 for j=1 to 118
3190 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
3200 if bufcount$(n - 1) = bufline$(2 * j) then
3210   zcount = zcount + 1
3220 endif
3230 next j
3240 next n
3250 if mojicount > zcount then
3260 cls 3:ui_msg "無効な文字です":talk"無効な文字があります。":zcount = 0:goto Surei_Input:
3270 endif
3280 for i = 1 to mojicount
3290 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
3300 n1 = Complate(bufcount$(i - 1))
3310 count = count + n1
3320 next i
3330 '182以上のとき,181を引く
3340 if (count > 181) then count = count - 181
3350 cls 3:Font 48+16
3360 gload Gazo$ + "Result_Screen3_20211226.png"
3370 color rgb(255,0,0)
3380 print "入力文字:" + buffer_moji$ + chr$(13)
3390 'print chr$(13)
3400 color rgb(0,0,255)
3410 print "数霊(かずたま):";count;chr$(13)
3420 color rgb(0,0,0)
3430 print "エンターキー:トップ" + chr$(13)
3440 print "スペース:次 へ" + chr$(13)
3450 key$ = input$(1)
3460 if key$ = " " then goto Surei_Result4:
3470 if key$ = chr$(13) then
3480 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
3490 for i=0 to 9
3500 bufcount$(i) = " "
3510 next i
3520 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
3530 'else
3540 'if key$ = " " then
3550 '２回めの入力に行く
3560 'mode = 1:goto Surei_Input:
3570 'else
3580 'if key$ = "s" or key$ = "S" then
3590 'ファイルを保存する
3600 's = Save()
3610 'ui_msg"保存しました"
3620 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
3630 else
3640 goto Surei_Result:
3650 'endif
3660 endif
3670 '3-1 バージョン情報
3680 Version:
3690 cls 3:Font 32
3700 gload Gazo$ + "Screen1_Version.png"
3710 play ""
3720 play Voice_File_TopScreen$ + "Voice_Version.mp3"
3730 color rgb(255,0,0)
3740 'print"●バージョン情報"+chr$(13)
3750 print chr$(13)
3760 color rgb(255,255,255)
3770 print "Ver:";Version$ + chr$(13)
3780 print "アプリ名:数霊"+ chr$(13)
3790 print "for Basic for Android"+chr$(13)
3800 print "Author:licksjp"+chr$(13)
3810 print "制作開始:2021.7.28" + chr$(13)
3820 print chr$(13)
3830 print "(C)Copy right licksjp " + chr$(13)
3840 print "All rights reserved" + chr$(13)
3850 color rgb(0,0,0)
3860 print "エンターキーを押してください" + chr$(13)
3870 key$ = input$(1)
3880 if key$ = chr$(13) then
3890 goto TopScreen:
3900 else
3910 talk "無効なキーです":goto Version:
3920 endif
3930 '3-2 参考文献
3940 Reference_Book:
3950 cls 3:Font 48:play""
3960 gload Gazo$ + "Screen1_Reference.png"
3970 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
3980 color rgb(255,0,0)
3990 'print"●参考文献" + chr$(13)
4000 print chr$(13)
4010 color rgb(255,255,255)
4020 print "書名:数霊" + chr$(13)
4030 print "出版社:徳間書店" + chr$(13)
4040 print "ISBN:978-4-19-" + chr$(13)
4050 print "         865309-5" + chr$(13)
4060 print "定価:2300円 + 税" + chr$(13)
4070 color rgb(0,0,0)
4080 print "エンターキーを押してください"
4090 key$=input$(1)
4100 if key$=chr$(13) then
4110 goto TopScreen:
4120 else
4130 talk"無効なキーです":goto Reference_Book:
4140 endif
4150 'ヘルプ画面　トップ画面
4160 Help:
4170 No=0:c=0
4180 play ""
4190 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
4200 cls 3:Font 48:
4210 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
4220 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0
4230 color rgb(255,0,0)
4240 'print "●3.ヘルプ　トップ画面" + chr$(13)
4250 print chr$(13)
4260 color rgb(255,255,255)
4270 print "番号を選んでください" + chr$(13)
4280 print " :1.バージョン" + chr$(13)
4290 print " :2.参考文献" + chr$(13)
4300 print " :3.トップ画面" + chr$(13)
4310 print " :4.終 了" + chr$(13)
4320 color rgb(0,0,0)
4330 if No = 0 then print " バージョンを選択"
4340 key$ = input$(1)
4350 'カーソルの下
4360 if key$ = chr$(31) then
4370 select case (c Mod 4)
4380 'バージョンから参考文献
4390 case 0:
4400        c=1:No=c:locate 0,12:Print "           ":locate 0,12:print " 参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto 4340
4410 '参考文献からトップ画面
4420 case 1:
4430        c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "            ":locate 0,12:print " トップ画面を選択":goto 4340
4440 'トップ画面から終了
4450 case 2:
4460        c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 0,12:print " 終 了を選択":goto 4340
4470 '終了からバージョン
4480 case 3:
4490        c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                     ":locate 0,12:print " バージョンを選択":goto 4340
4500 case else:
4510           goto 4340
4520 end select
4530 else
4540 'カーソル　上
4550 if key$ = chr$(30) then
4560 select case (c Mod 4)
4570 'バージョンから終了
4580 case 0:
4590        c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:locate 0,12:print "                   ":locate 0,12:print " 終 了を選択":goto 4340
4600 '参考文献からバージョン
4610 case 1:
4620        c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                   ":locate 0,12:print " バージョンを選択":goto 4340
4630 'トップ画面から参考文献
4640 case 2:
4650        c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":locate 0,12:print " 参考文献を選択":goto 4340
4660 '終了からトップ画面を選択
4670 case 3:
4680        c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print"                      ":locate 0,12:print " トップ画面を選択":goto 4340
4690 case else:
4700           goto 4340
4710 end select
4720 else
4730 'Input "番号:",No
4740 'sp_def 0,(5,200),32,32
4750 'エンターキー：決定
4760 if key$=chr$(13) then
4770 if No=0 then cls 4:goto Version:
4780 if No=2 then cls 4:goto TopScreen:
4790 if No=1 then cls 4:goto Reference_Book:
4800 if No=3 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
4810 else
4820 goto 4340
4830 endif
4840 endif
4850 endif
4860 'if (No = 0 or No > 4) then ui_msg"もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
4870 '登録文字の確認
4880 '文字を1文字入れて登録されているか調べるメニュー
4890 '設定項目
4900 Setting:
4910 cls 3:Font 48
4920 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
4930 play ""
4940 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
4950 No=0
4960 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
4970 color rgb(0,0,255)
4980 'print "●設定項目" + chr$(13)
4990 print chr$(13)
5000 color rgb(255,255,255)
5010 print "番号を選んでください" + chr$(13)
5020 print " :1.登録文字の確認" + chr$(13)
5030 print " :2.数霊文字確認" + chr$(13)
5040 print " :3.トップ画面に行く" + chr$(13)
5050 print " :4.終 了" + chr$(13)
5060 color rgb(0,0,0)
5070 if No=0 then locate 1,12:print "            ":locate 1,12:print "登録文字の確認を選択"
5080 key$ = input$(1)
5090 if key$ =chr$(31) then
5100 select case (No Mod 4)
5110 '登録文字から数霊文字の確認
5120 case 0:
5130       c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 1,12:Print "                   ":locate 1,12:print "数霊文字の確認を選択":goto 5080
5140 '数霊文字の確認からトップ画面に行く
5150 case 1:
5160       c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                     ":locate 1,12:print "トップ画面に行くを選択":goto 5080
5170 'トップ画面に行くから終了
5180 case 2:
5190       c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                       ":locate 1,12:print "終 了を選択":goto 5080
5200 '終了から登録文字
5210 case 3:
5220       c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(2,200),0,0:locate 1,12:print "                     ":locate 1,12:print "登録文字の確認を選択":goto 5080
5230 end select
5240 else
5250 'カーソル　上
5260 if key$ = chr$(30) then
5270 select case (No Mod 4)
5280 case 1:
5290        c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:locate 1,12:print "                   ":locate 1,12:print "登録文字の確認を選択":goto 5080
5300 case 2:
5310        c=1:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:locate 1,12:print "                         ":locate 1,12:print "数霊文字の確認を選択":goto 5080
5320 case 3:
5330        c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                         ":locate 1,12:print "トップ画面に行くを選択":goto 5080
5340 case 0:
5350        c=3:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:sp_on 0,0:locate 1,12:print "                    ":locate 1,12:print "終 了を選択":goto 5080
5360 end select
5370 else
5380 'エンターキーを押したとき
5390 if key$ = chr$(13) then
5400 if No=2 then goto TopScreen:
5410 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
5420 if No=0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
5430 if No=3 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
5440 else
5450 goto 5080
5460 endif
5470 endif
5480 endif
5490 '文字検索項目  ここから
5500 Moji_Search:
5510 cls 4:cls 3:Font 32+16
5520 gload Gazo$ + "Moji_Search_Result.png"
5530 play ""
5540 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
5550 print "" + chr$(13)
5560 color rgb(255,0,0)
5570 print "文字を一文字入れてください" + chr$(13)
5580 color rgb(0,0,0)
5590 Input "登録文字:",moji$
5600 moji_count = len(moji$)
5610 if moji_count > 1 then
5620 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
5630 else
5640 count=0
5650 for n = 0 to 116
5660 if bufline$(2*n) = moji$ then
5670 cls 3:font 48
5680 gload Gazo$ + "Moji_Search_Result.png"
5690 'talk"この文字は登録されています"
5700 play ""
5710 play Voice_File_TopScreen$+"Voice_Entry_OK.mp3"
5720 print chr$(13)
5730 color rgb(255,0,0)
5740 print moji$;"は、登録されています。" + chr$(13)
5750 color rgb(0,0,0)
5760 print "エンターキーを押してください"
5770 key$=input$(1)
5780 if key$=chr$(13) then goto TopScreen:
5790 count = count + 1
5800 endif
5810 next n
5820 if count = 0 then
5830 cls 3:font 48
5840 gload Gazo$ + "Moji_check.png"
5850 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
5860 print chr$(13)
5870 color rgb(255,0,0)
5880 print moji$;"は、登録されていません。" + chr$(13)
5890 color rgb(0,0,0)
5900 print "エンターキーを押してください" + chr$(13)
5910 key$=input$(1)
5920 if key$=chr$(13) then goto TopScreen:
5930 endif
5940 endif
5950 Surei_Result2:
5960 cls 3:Font 48
5970 zcount1=0:zcount2=0:count1=0:count2=0
5980 '1人目
5990 mojicount1=len(buf_Parson1$)
6000 '2人目
6010 mojicount2=len(buf_Parson2$)
6020 '1人目
6030 for n=1 to mojicount1
6040 for j=1 to 116
6050 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
6060 if bufcount1$(n-1) = bufline$(2*j) then
6070 zcount1 = zcount1 + 1
6080 endif
6090 next j
6100 next n
6110 '2人目
6120 for n=1 to mojicount2
6130 for j=1 to 116
6140 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
6150 if bufcount2$(n-1) = bufline$(2*j) then
6160 zount2 = zcount2 + 1
6170 endif
6180 next j
6190 next n
6200 '1人目
6210 for i=1 to mojicount1
6220 bufcount1$(i-1)=Mid$(buf_Parson1$,i,1)
6230 p1=Complate(bufcount1$(i-1))
6240 count1 = count1 + p1
6250 next i
6260 '2人目
6270 for i=1 to mojicount2
6280 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
6290 p2 = Complate(bufcount2$(i-1))
6300 count2 = count2 + p2
6310 next i
6320 cls 3:
6330 gload Gazo$ + "Screen1_2Parson_Result.png"
6340 color rgb(255,0,0)
6350 'print "数霊 2人用 結果表示"+chr$(13)
6360 print ""+chr$(13)
6370 color rgb(255,255,255)
6380 print "1人目:";buf_Parson1$;chr$(13)
6390 print "数霊1:";count1;chr$(13)
6400 print "2人目:";buf_Parson2$;chr$(13)
6410 print "数霊2:";count2;chr$(13)
6420 print "数霊(合計):";count1 + count2;chr$(13)
6430 color rgb(0,0,0)
6440 print "エンターキーを押してください" + chr$(13)
6450 key$=input$(1)
6460 if key$=chr$(13) then goto TopScreen:
6470 Surei_Result3:
6480 cls 3:Font 48
6490 zcount2 = 0:count2 = 0
6500 mojicount2 = len(buffer_moji2$)
6510 for n=1 to mojicount2
6520 for j=1 to 116
6530 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
6540 if bufcount2$(n - 1) = bufline$(2 * j) then
6550 zcount2 = zcount2 + 1
6560 endif
6570 next j
6580 next n
6590 for i=1 to mojicount2
6600 n2 = Complate(bufcount2$(i-1))
6610 count2 = count2 + n2
6620 next i
6630 gload Gazo$ + "Screen5.png"
6640 color rgb(255,0,0)
6650 print "数霊の結果表示" + chr$(13)
6660 color rgb(255,255,255)
6670 print "１回目回の文字入力:";buffer_moji$;chr$(13)
6680 print "１回目の数霊(かずたま)";count;chr$(13)
6690 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
6700 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
6710 color rgb(0,0,0)
6720 print "エンターキー:トップ画面";chr$(13)
6730 print "c or C キー:数霊の比較";chr$(13)
6740 key$ = input$(1)
6750 if key$ = chr$(13) then mode=0:count=0:count2=0:goto TopScreen:
6760 if key$ = "c" or key$ = "C" then
6770 if count = count2 then
6780 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
6790 else
6800 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
6810 endif
6820 endif
6830 Moji_Count_Check:
6840 cls 3:Font 48
6850 gload Gazo$ + "Moji_check.png"
6860 n=0
6870 open FILE_csv$ for input as #1
6880 while eof(1)=0
6890 line input #1, line$
6900 n = n + 1
6910 wend
6920 close #1
6930 'n = n - 1
6940 'talk "登録文字数は"+str$(n)+"文字です"
6950 play ""
6960 if n = 118 then
6970 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
6980 else
6990 talk"登録文字数は、"+str$(n)+"文字です"
7000 endif
7010 print "" + chr$(13)
7020 color rgb(255,0,0)
7030 print "文字の登録文字数は";n;"文字" + chr$(13)
7040 color rgb(0,0,0)
7050 print "エンターキーを押してください"+chr$(13)
7060 key$ = input$(1)
7070 if key$ = chr$(13) then
7080 goto TopScreen:
7090 else
7100 goto Moji_Count_Check:
7110 endif
7120 'Save 関数
7130 func Save()
7140 open "data/Parsonal_list1.csv" for append as #1
7150 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
7160 close #1
7170 endfunc
7180 Select_moji:
7190 cls 3:font 48:No = 0
7200 gload Gazo$ + "Screen1_mojicheck.png"
7210 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
7220 color rgb(255,0,0)
7230 'print "文字の確認" + chr$(13)
7240 print chr$(13)
7250 color rgb(255,255,255)
7260 print "番号を選んでください" + chr$(13)
7270 print " :1.登録文字検索"+chr$(13)
7280 print " :2.登録文字数の確認" + chr$(13)
7290 print " :3.前の画面に戻る" + chr$(13)
7300 print " :4.終　了" + chr$(13)
7310 color rgb(0,0,0)
7320 if No = 1 then print "登録文字の検索を選択"
7330 key$ = input$(1)
7340 'カーソルの下
7350 if key$ = chr$(31) then
7360 select case (No Mod 4)
7370 case 0:
7380        c=1:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:locate 1,12:print "                    ":locate 1,12:print "登録文字の確認を選択":goto 7330
7390 case 1:
7400        c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:sp_on 3,0:locate 1,12:print "                    ":locate 1,12:print "前の画面に戻るを選択":goto 7330
7410 case 2:
7420        c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                    ":locate 1,12:print "終 了を選択":goto 7330
7430 case 3:
7440        c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                    ":locate 1,12:print "登録文字を検索を選択":goto 7330
7450 end select
7460 endif
7470 'カーソル　上
7480 if key$ = chr$(30) then
7490 select case (No Mod 4)
7500 case 0:
7510        c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:goto 7330
7520 case 1:
7530        c=0:No=c:sp_on 0,0:sp_put 3,(5,500),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:goto 7330
7540 case 2:
7550        c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto 7330
7560 case 3:
7570        c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto 7330
7580 end select
7590 endif
7600 'エンターキーを押す
7610 if key$ = chr$(13) then
7620 if No = 0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
7630 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
7640 if No = 2 then goto TopScreen:
7650 if No = 3 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
7660 endif
7670 '
7680 Kakunin_Surei_count:
7690 cls 3:font 48
7700 gload Gazo$ + "Kazutama_List_Top.png"
7710 color rgb(255,0,0)
7720 'print "数霊の確認" + chr$(13)
7730 print chr$(13)
7740 color rgb(255,255,255)
7750 print "番号を選んでください" + chr$(13)
7760 print " :1.数霊リスト 1人用" + chr$(13)
7770 'print "2.数霊リスト 2人用:未実装" + chr$(13)
7780 print " :2.トップ画面に行く" + chr$(13)
7790 print " :3.終 了" + chr$(13)
7800 print ""+chr$(13)
7810 color rgb(0,0,0)
7820 locate 1,12:print "                  ":locate 1,12:print "1.数霊リスト (1人用)を選択"
7830 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,200),0,0
7840 key$ = input$(1)
7850 '1.カーソル下
7860 if key$ = chr$(31) then
7870 select case (No Mod 3)
7880 case 0:
7890        No=1:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_put 1,(5,300),0,0:locate 1,12:print"                   ":locate 1,12:print "トップ画面に行くを選択":goto 7840
7900 case 1:
7910       No=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:locate 1,12:print "              ":locate 1,12:print "終 了を選択":goto 7840
7920 case 2:
7930       No=0:sp_on 1,0:sp_on 2,0:sp_on 0,1:sp_put 0,(5,200),0,0:locate 1,12:print "                    ":locate 1,12:print "数霊リスト 1人用を選択":goto 7840
7940 end select
7950 else
7960 '2.カーソル上
7970 if key$ = chr$(30) then
7980 select case (No Mod 3)
7990 case 0:
8000        No=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:locate 1,12:print "                      ":locate 1,12:print "終 了を選択":goto 7840
8010 case 1:
8020        No=0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0:locate 1,12:print "                       ":locate 1,12:print "数霊リスト 1人用を選択":goto 7840
8030 case 2:
8040        No=1:sp_on 0,0:sp_on 2,0:sp_on 1,1:sp_put 1,(5,300),0,0:locate 1,12:print "                        ":locate 1,12:print "トップ画面に行くを選択":goto 7840
8050 end select
8060 else
8070 '3.エンターキーを押したとき
8080 if key$ = chr$(13) then
8090 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:goto TopScreen:
8100 if No=2 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
8110 if No=0  then sp_on 0,0:sp_on 1,0:sp_on 2,0:goto Surei_List1:
8120 endif
8130 endif
8140 endif
8150 'if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
8160 Surei_List1:
8170 cls 3:font 48
8180 if dir$("data/Parsonal_list1.csv") = ""  then
8190 cls 3
8200 gload "data/Gazo/"+"KazutamaList1.png"
8210 print chr$(13)
8220 color rgb(255,0,0):print"登録ファイルはございません" + chr$(13)
8230 color rgb(0,0,0):print "スペースキーを押してください" + chr$(13)
8240 key$=input$(1)
8250 if key$ = " " then goto TopScreen:
8260 else
8270 'cls 3:print"登録ファイルがございません" + chr$(13)
8280 'else
8290 cls 3:buffer_list_count=Loadcount()
8300 talk"登録件数は"+str$(buffer_list_count)+"件です"
8310 gload Gazo$ + "KazutamaList1_Entry.png"
8320 color rgb(0,0,255)
8330 'print"数霊リスト  登録件数" + chr$(13)
8340 print chr$(13)
8350 color rgb(255,0,0)
8360 print "登録件数:";buffer_list_count;"件";chr$(13)
8370 color rgb(0,0,0)
8380 print "エンターキーを押してください" + chr$(13)
8390 key$ = input$(1)
8400 if key$ = chr$(13) then
8410 goto KotodamaList_page:
8420 'else
8430 'goto Surei_List1:
8440 endif
8450 'endif
8460 endif
8470 func Loadcount()
8480 n = 0
8490 open "data/Parsonal_list1.csv" for input as #1
8500 while eof(1) = 0
8510 line input #1,line$
8520 n = n + 1
8530 wend
8540 close #1
8550 count_line = n
8560 endfunc count_line
8570 func Kotodama$(buf$)
8580 b = len("数霊:")
8590 a$ = Mid$(buf$,b+1,len(buf$))
8600 for i=0 to 118
8610 if bufline3$(2 * i) ="数霊:" + a$  then
8620 moji_$ = bufline3$(2*i + 1)
8630 'moji_$ = bufline3$(21)
8640 'moji$ = a$
8650 endif
8660 next i
8670 'kotodama$ = a$
8680 kotodama$ = moji_$
8690 endfunc kotodama$
8700 KotodamaList_page:
8710 cls 3:font 48:m = 0
8720 gload Gazo$ + "Screen5_Surei_List.png"
8730 open "data/Parsonal_list1.csv" for input as #1
8740 while eof(1) = 0
8750 input #1,line$
8760 bufKaztama$(m) = line$
8770 'input #1,line$
8780 'bufKaztama$(m,2*m + 1) = line$
8790 m = m + 1
8800 wend
8810 close #1
8820 l = 0:
8830 while buffer_list_count > l
8840 cls
8850 color rgb(255,0,0)
8860 'print "数霊　リスト" + chr$(13)
8870 print chr$(13)
8880 color rgb(255,255,255)
8890 n3 = l:n3 = n3 + 1
8900 print "番号:";n3;chr$(13)
8910 print bufKaztama$(2*l) + chr$(13)
8920 print bufKaztama$(2*l + 1) + chr$(13)
8930 'Kmoji$ = Kotodama$(str$(36))
8940 Kmoji$=moji$
8950 print chr$(13) + chr$(13)
8960 color rgb(0,0,0)
8970 print "スペース:次へ行く" + chr$(13)
8980 print "エンターキー:トップ画面" + chr$(13)
8990 key$ = input$(1)
9000 if key$ = " " then
9010 l = ((l + 1) Mod buffer_list_count)
9020 else
9030 if key$ = chr$(13) then
9040 goto TopScreen:
9050 else
9060 goto KotodamaList_page:
9070 endif
9080 endif
9090 wend
9100 '
9110 '結果表示２ Menu1
9120 Surei_Result4:
9130 cls 3:font (48-16)
9140 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
9150 for i=0 to 181 + 3 - 1
9160 if i = count  then
9170 buffer$ = bufline2$(count + 4,0)
9180 endif
9190 next i
9200 if len(buffer$) > 23 and len(buffer$) <= 45 then
9210 buffer2$ = Mid$(buffer$,1,24)
9220 buffer3$ = Mid$(buffer$,25,(len(buffer$) - 25))
9230 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)
9240 else
9250 if len(buffer$) <= 23 then
9260 buffer2$ = Mid$(buffer$,1,22)
9270 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
9280 else
9290 if len(buffer$) > 45 and len(buffer$) <= 64 then
9300 buffer2$ = Mid$(buffer$,1,22)
9310 buffer3$ = Mid$(buffer$,23,20)
9320 buffer4$ = Mid$(buffer$,43,(len(buffer$)-43))
9330 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)+chr$(13)
9340 else
9350 if len(buffer$) > 64 and len(buffer$) <= 81 then
9360 buffer2$ = Mid$(buffer$,1,23)
9370 buffer3$ = Mid$(buffer$,24,20)
9380 buffer4$ = Mid$(buffer$,42,20)
9390 buffer5$ = Mid$(buffer$,63,(len(buffer$)-62))
9400 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13) + chr$(13) + chr$(13)
9410 if len(buffer$) > 81 and len(buffer$) <= 110 then
9420 buffer2$ = Mid$(buffer$,1,21)
9430 buffer3$ = Mid$(buffer$,22,20)
9440 buffer4$ = Mid$(buffer$,42,20)
9450 buffer5$ = Mid$(buffer$,62,20)
9460 buffer6$ = Mid$(buffer$,82,(len(buffer$) - 82))
9470 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13) + chr$(13) + chr$(13)
9480 endif
9490 endif
9500 endif
9510 endif
9520 endif
9530 'cls 3
9540 gload Gazo$ + "Screen1_Result2.png"
9550 color rgb(255,0,0)
9560 'print "診断結果 2" + chr$(13)
9570 print chr$(13)
9580 color rgb(127,255,212)
9590 print "入力文字:";buffer_moji$;chr$(13)
9600 print "数霊:";count;chr$(13)
9610 color rgb(255,255,255)
9620 print "数霊の説明:"+chr$(13)
9630 print buffer$
9640 color rgb(0,0,0)
9650 print "エンターキー:トップ,S:保存する" + chr$(13)
9660 key$=input$(1)
9670 if key$ = chr$(13) then
9680 buffer$="" : buffer_moji$="" : count=0:goto TopScreen:
9690 else
9700 if key$="s" or key$="S" then
9710 s=Save():ui_msg"保存しました":goto Surei_Result4:
9720 else
9730 talk"無効な文字です":goto Surei_Result4:
9740 endif
9750 endif
9760 func All_clear()
9770 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
9780 endfunc
