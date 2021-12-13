100 '数霊(かずたま) 製作開始日:2021.07.28
110 'version 0.0.1_2021.07.28 テスト版１
120 'version 0.0.2_2021.11.27 テスト版２
130 'Version 0.0.3_2021.11.29 テスト版3
140 'Version 0.0.4_2021.11.30 - 12.01 α1
150 'Version 0.0.5_2021.12.02-1203 α2
160 'Version 0.0.6_2021.12.10 (α3)
170 'Version 0.0.7_2021.12.11 (α4)
180 'Version 0.0.8_2021.12.13 (α5)
190 Version$ = "0.0.8.2021.12.13 (α5)"
200 'csvファイル 1.数霊 ベースファイル
210 FILE_csv$ = "data/Kazutama.csv"
220 'csvファイル 2.数霊 ベースファイル 2
230 FILE_csv2$ = "data/Surei_chart_20211207.csv"
240 'gazo ファイル
250 Gazo$ = "data/Gazo/"
260 'Sound File(Voice)
270 '1.ボイス TopScreen
280 Voice_File_TopScreen$ = "data/Sound_data/"
290 '変数領域
300 dim bufline$(118 * 2),bufcount$(10):count = 0:dim bufcount1$(10):dim bufcount2$(10):mode = 0:dim bufline2$(183 * 2),bufline3$(181 * 2)
310 count2 = 0
320 'ファイルの有無チェック
330 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
340 '1.ファイルが無いとき
350 cls :print "依存ファイルが見つかりません":
360 print "エンターキーを押してください"+chr$(13)
370 key$=input$(1)
380 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
390 else
400 '2.ファイルが有るとき
410 cls:print "csv:file ok." + chr$(13)
420 n=0
430 open FILE_csv$ for input as #1
440 while eof(1) = 0
450 input #1,line$
460 bufline$(n) = line$
470 n = n + 1
480 wend
490 close #1
500 '2つ目のファイル読み込み
510 m=0
520 open FILE_csv2$ for input as #2
530 while eof(1) = 0
540 input #2,line2$
550  bufline2$(m) = line2$
560  m = m + 1
570 wend
580 close #2
590 endif
600 'for j=1 to 181
610 for i=2 to 183
620 bufline3$(i - 2) = bufline2$(i)
630 'next j
640 next i
650 erase bufline2$
660 'Top画面
670 TopScreen:
680 cls 3:font 48
690 play ""
700 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
710 gload Gazo$ + "Screen1.png"
720 color rgb(0,0,255)
730 print "●Top画面" + chr$(13)
740 color rgb(255,255,255)
750 print "番号を選んでください" + chr$(13)
760 print "1.数霊(かずたま)チェック" + chr$(13)
770 print "2.設定" + chr$(13)
780 print "3.ヘルプ" + chr$(13)
790 print "4.終　了" + chr$(13)
800 color rgb(0,0,0)
810 Input "番号:",No
820 if No=1 then goto Surei_Check:
830 if No=3 then Color rgb(255,255,255):goto Help:
840 if No=4 then cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":ui_msg "終了します":color rgb(255,255,255):end
850 if No=2 then color rgb(255,255,255):goto Setting:
860 '1-1.数霊チェック
870 Surei_Check:
880 cls 3:Font 32
890 gload Gazo$ + "Screen4.png"
900 play ""
910 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
920 color rgb(255,0,0)
930 print "●数霊(かずたま)チェックトップ" + chr$(13)
940 color rgb(255,255,255)
950 print "番号を選んでください"+chr$(13)
960 print "1.数霊(かずたま)チェック(1人用)" + chr$(13)
970 print "2.数霊(かずたま)チェック(2人用)" + chr$(13)
980 print "3.前の画面に戻る" + chr$(13)
990 print "4.終 了" + chr$(13)
1000 color rgb(0,0,0)
1010 Input "番号:",No
1020 '前の画面に戻る
1030 if No = 3 then goto TopScreen:
1040 'プログラムの終了
1050 if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":end
1060 '1人用
1070 if No = 1 then goto Surei_Input:
1080 '2人用
1090 if No = 2 then goto Surei_twoParson:
1100 if No > 4 then ui_msg"もう一度入れてください":goto Surei_Check:
1110 '数霊(かずたま) 文字入力  1人用
1120 Surei_Input:
1130 if mode = 0 then
1140 cls 3:font 32
1150 gload Gazo$ + "InputKotodama.png"
1160 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
1170 color rgb(255,0,0)
1180 print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
1190 color rgb(255,255,255)
1200 print "文字を入れてください" + chr$(13)
1210 color rgb(255,0,0)
1220 print "(有効文字:カタカナ、半角アルファベット"+chr$(13)
1230 print "大文字のみ)" +chr$(13)
1240 'print "" + chr$(13)
1250 color rgb(0,0,0)
1260 Input "入力文字:",buffer_moji$
1270 goto Surei_Result:
1280 else
1290 if mode = 1 then
1300 cls 3:Font 32
1310 gload Gazo$ + "InputKotodama.png"
1320 color rgb(255,0,0)
1330 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
1340 color rgb(255,255,255)
1350 print "文字を入れてください" + chr$(13)
1360 color rgb(255,0,0)
1370 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
1380 print "大文字のみ)" + chr$(13)
1390 color rgb(0,0,0)
1400 Input "文字入力:",buffer_moji2$
1410 goto Surei_Result3:
1420 endif
1430 endif
1440 '数霊(かずたま)文字入力　2人用
1450 Surei_twoParson:
1460 cls 3:Font 32
1470 gload Gazo$ + "InputKotodama.png"
1480 '1人目入力
1490 color rgb(255,0,0)
1500 print "●数霊(かずたま) 1人目 入力" + chr$(13)
1510 color rgb(255,0,0)
1520 print "1人目の文字を入れてください" + chr$(13)
1530 color rgb(255,0,0)
1540 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
1550 color rgb(0,0,0)
1560 print chr$(13)
1570 Input "1人目文字入力:",buf_Parson1$
1580 Surei_twoParson2:
1590 cls 3:Font 32
1600 '2人目入力
1610 gload Gazo$ + "InputKotodama.png"
1620 color rgb(255,0,0)
1630 print "●数霊(かずたま) 2人目 入力" + chr$(13)
1640 print "2人目の文字を入れてください" + chr$(13)
1650 color rgb(255,0,0)
1660 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13)
1670 color rgb(0,0,0)
1680 Input "2人目の文字入力:",buf_Parson2$
1690 goto Surei_Result2:
1700 '数霊　計算 パート
1710 '文字の計算関数
1720 'moji$:1文字を入れる
1730 func Complate(moji$)
1740 for n = 1 to 116
1750 if moji$ = bufline$(2*n) then
1760 buffcount = val(bufline$(2 * n + 1))
1770 endif
1780 next n
1790 endfunc buffcount
1800 '数霊　結果表示
1810 Surei_Result:
1820 cls 3:Font 32
1830 'ゼロカウント:zcount
1840 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
1850 '例 アカい:"い"の文字は無効な文字なので、はじく
1860 zcount=0
1870 'mojicount:入力文字数
1880 mojicount = len(buffer_moji$)
1890 for n=1 to mojicount
1900 for j=1 to 116
1910 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
1920 if bufcount$(n - 1) = bufline$(2 * j) then
1930   zcount = zcount + 1
1940 endif
1950 next j
1960 next n
1970 if mojicount > zcount then
1980 cls 3:ui_msg "無効な文字です":talk"無効な文字があります。":zcount = 0:goto Surei_Input:
1990 endif
2000 for i = 1 to mojicount
2010 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
2020 n1 = Complate(bufcount$(i - 1))
2030 count = count + n1
2040 next i
2050 '182以上のとき,181を引く
2060 if (count > 181) then count = count - 181
2070 cls 3:Font 48
2080 gload Gazo$ + "Result_Screen3.png"
2090 color rgb(255,0,0)
2100 print "入力文字:";buffer_moji$;chr$(13)
2110 color rgb(255,255,255)
2120 print "数霊(かずたま):";count;chr$(13)
2130 color rgb(0,0,0)
2140 print "エンターキー:トップ画面" + chr$(13)
2150 print "スペースキー:もう一度入力" + chr$(13)
2160 key$ = input$(1)
2170 if key$ = chr$(13) then
2180 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
2190 for i=0 to 9
2200 bufcount$(i) = ""
2210 next i
2220 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
2230 else
2240 if key$ = " " then
2250 '２回めの入力に行く
2260 mode = 1:goto Surei_Input:
2270 endif
2280 endif
2290 '3-1 バージョン情報
2300 Version:
2310 cls 3:Font 32
2320 gload Gazo$ + "Screen1.png"
2330 play ""
2340 play Voice_File_TopScreen$ + "Voice_Version.mp3"
2350 color rgb(255,0,0)
2360 print"●バージョン情報"+chr$(13)
2370 color rgb(255,255,255)
2380 print "Ver:";Version$ + chr$(13)
2390 print "アプリ名:数霊"+ chr$(13)
2400 print "for Basic for Android"+chr$(13)
2410 print "Author:licksjp"+chr$(13)
2420 print "制作開始:2021.7.28" + chr$(13)
2430 print chr$(13)
2440 print "(C)Copy right licksjp " + chr$(13)
2450 print "All rights reserved" + chr$(13)
2460 color rgb(0,0,0)
2470 print "エンターキーを押してください" + chr$(13)
2480 key$ = input$(1)
2490 if key$ = chr$(13) then goto TopScreen:
2500 '3-2 参考文献
2510 Reference_Book:
2520 cls 3:Font 48:play""
2530 gload Gazo$ + "Screen1.png"
2540 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
2550 color rgb(255,0,0)
2560 print"●参考文献" + chr$(13)
2570 color rgb(255,255,255)
2580 print "書名:数霊" + chr$(13)
2590 print "出版社:徳間書店" + chr$(13)
2600 print "ISBN:978-4-19-" + chr$(13)
2610 print "         865309-5" + chr$(13)
2620 print "定価:2300円 + 税" + chr$(13)
2630 color rgb(0,0,0)
2640 print "エンターキーを押してください"
2650 key$=input$(1)
2660 if key$=chr$(13) then goto TopScreen:
2670 'ヘルプ画面　トップ画面
2680 Help:
2690 play ""
2700 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
2710 cls 3:Font 48:
2720 gload Gazo$ + "Screen1.png"
2730 print "●3.ヘルプ　トップ画面" + chr$(13)
2740 print "番号を選んでください" + chr$(13)
2750 print "1.バージョン" + chr$(13)
2760 print "2.参考文献" + chr$(13)
2770 print "3.トップ画面" + chr$(13)
2780 print "4.終 了" + chr$(13)
2790 color rgb(0,0,0)
2800 Input "番号:",No
2810 if No=1 then goto Version:
2820 if No=3 then goto TopScreen:
2830 if No=2 then goto Reference_Book:
2840 if No=4 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":cls 3:end
2850 if (No = 0 or No > 4) then ui_msg"もう一度入れてください":talk "もう一度、入れてください":goto Help:
2860 '登録文字の確認
2870 '文字を1文字入れて登録されているか調べるメニュー
2880 '設定項目
2890 Setting:
2900 cls 3:Font 48
2910 gload Gazo$ + "Screen1.png"
2920 play ""
2930 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
2940 color rgb(0,0,255)
2950 print "●設定項目" + chr$(13)
2960 color rgb(255,255,255)
2970 print "番号を選んでください" + chr$(13)
2980 print "1.文字検索" + chr$(13)
2990 print "2.登録文字数の確認" + chr$(13)
3000 print "3.トップ画面に行く" + chr$(13)
3010 print "4.終 了" + chr$(13)
3020 color rgb(0,0,0)
3030 Input "番号:",No
3040 if No=3 then goto TopScreen:
3050 if No=1 then goto Moji_Search:
3060 if No=2 then goto Moji_Count_Check:
3070 if No=4 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
3080 if No > 4 then goto Setting:
3090 '文字検索項目  ここから
3100 Moji_Search:
3110 cls 3:Font 32
3120 gload Gazo$ + "Moji_check.png"
3130 play ""
3140 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
3150 print "" + chr$(13)
3160 color rgb(255,0,0):print chr$(13)
3170 print "文字を一文字入れてください" + chr$(13)
3180 color rgb(0,0,0)
3190 Input "登録文字:",moji$
3200 moji_count = len(moji$)
3210 if moji_count > 1 then
3220 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
3230 else
3240 count=0
3250 for n = 0 to 116
3260 if bufline$(2*n) = moji$ then
3270 cls 3:font 48
3280 gload Gazo$ + "Moji_check.png"
3290 'talk"この文字は登録されています"
3300 play ""
3310 play Voice_File_TopScreen$+"Voice_Entry_OK.mp3"
3320 print chr$(13)
3330 color rgb(255,0,0)
3340 print moji$;"は、登録されています。" + chr$(13)
3350 color rgb(0,0,0)
3360 print "エンターキーを押してください"
3370 key$=input$(1)
3380 if key$=chr$(13) then goto TopScreen:
3390 count = count + 1
3400 endif
3410 next n
3420 if count = 0 then
3430 cls 3:font 48
3440 gload Gazo$ + "Moji_check.png"
3450 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
3460 print chr$(13)
3470 color rgb(255,0,0)
3480 print moji$;"は、登録されていません。" + chr$(13)
3490 color rgb(0,0,0)
3500 print "エンターキーを押してください" + chr$(13)
3510 key$=input$(1)
3520 if key$=chr$(13) then goto TopScreen:
3530 endif
3540 endif
3550 Surei_Result2:
3560 cls 3:Font 48
3570 zcount1=0:zcount2=0:count1=0:count2=0
3580 '1人目
3590 mojicount1=len(buf_Parson1$)
3600 '2人目
3610 mojicount2=len(buf_Parson2$)
3620 '1人目
3630 for n=1 to mojicount1
3640 for j=1 to 116
3650 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
3660 if bufcount1$(n-1) = bufline$(2*j) then
3670 zcount1 = zcount1 + 1
3680 endif
3690 next j
3700 next n
3710 '2人目
3720 for n=1 to mojicount2
3730 for j=1 to 116
3740 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
3750 if bufcount2$(n-1) = bufline$(2*j) then
3760 zount2 = zcount2 + 1
3770 endif
3780 next j
3790 next n
3800 '1人目
3810 for i=1 to mojicount1
3820 bufcount1$(i-1)=Mid$(buf_Parson1$,i,1)
3830 p1=Complate(bufcount1$(i-1))
3840 count1 = count1 + p1
3850 next i
3860 '2人目
3870 for i=1 to mojicount2
3880 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
3890 p2 = Complate(bufcount2$(i-1))
3900 count2 = count2 + p2
3910 next i
3920 cls 3:
3930 gload Gazo$ + "Screen1.png"
3940 color rgb(255,0,0)
3950 print "数霊 2人用 結果表示"+chr$(13)
3960 color rgb(255,255,255)
3970 print "1人目:";buf_Parson1$;chr$(13)
3980 print "数霊1:";count1;chr$(13)
3990 print "2人目:";buf_Parson2$;chr$(13)
4000 print "数霊2:";count2;chr$(13)
4010 print "数霊(合計):";count1 + count2;chr$(13)
4020 color rgb(0,0,0)
4030 print "エンターキーを押してください" + chr$(13)
4040 key$=input$(1)
4050 if key$=chr$(13) then goto TopScreen:
4060 Surei_Result3:
4070 cls 3:Font 48
4080 zcount2 = 0:count2 = 0
4090 mojicount2 = len(buffer_moji2$)
4100 for n=1 to mojicount2
4110 for j=1 to 116
4120 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
4130 if bufcount2$(n - 1) = bufline$(2 * j) then
4140 zcount2 = zcount2 + 1
4150 endif
4160 next j
4170 next n
4180 for i=1 to mojicount2
4190 n2 = Complate(bufcount2$(i-1))
4200 count2 = count2 + n2
4210 next i
4220 gload Gazo$ + "Screen5.png"
4230 color rgb(255,0,0)
4240 print "数霊の結果表示" + chr$(13)
4250 color rgb(255,255,255)
4260 print "１回目回の文字入力:";buffer_moji$;chr$(13)
4270 print "１回目の数霊(かずたま)";count;chr$(13)
4280 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
4290 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
4300 color rgb(0,0,0)
4310 print "エンターキー:トップ画面";chr$(13)
4320 print "c or C キー:数霊の比較";chr$(13)
4330 key$ = input$(1)
4340 if key$ = chr$(13) then mode=0:count=0:count2=0:goto TopScreen:
4350 if key$ = "c" or key$ = "C" then
4360 if count = count2 then
4370 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
4380 else
4390 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
4400 endif
4410 endif
4420 Moji_Count_Check:
4430 cls 3:Font 48
4440 gload Gazo$ + "Moji_check.png"
4450 n=0
4460 open FILE_csv$ for input as #1
4470 while eof(1)=0
4480 line input #1, line$
4490 n = n + 1
4500 wend
4510 close #1
4520 n = n - 1
4530 'talk "登録文字数は"+str$(n)+"文字です"
4540 play ""
4550 if n = 117 then
4560 play Voice_File_TopScreen$+"Voice_Entry_moji_count.mp3"
4570 else
4580 talk"登録文字数は、"+str$(n)+"文字です"
4590 endif
4600 print ""+chr$(13)
4610 color rgb(255,0,0)
4620 print "文字の登録文字数は";n;"文字" + chr$(13)
4630 color rgb(0,0,0)
4640 print "エンターキーを押してください"+chr$(13)
4650 key$=input$(1)
4660 if key$ = chr$(13) then
4670 goto TopScreen:
4680 else
4690 goto Moji_Count_Check:
4700 endif
