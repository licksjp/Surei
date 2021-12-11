100 '数霊(かずたま) 製作開始日:2021.07.28
110 'version 0.0.1_2021.07.28 テスト版１
120 'version 0.0.2_2021.11.27 テスト版２
130 'Version 0.0.3_2021.11.29 テスト版3
140 'Version 0.0.4_2021.11.30 - 12.01 α1
150 'Version 0.0.5_2021.12.02-1203 α2
160 'Version 0.0.6_2021.12.10 (α3)
170 'Version 0.0.7_2021.12.11 (α4)
180 Version$ = "0.0.7.2021.12.11(α4)"
190 'csvファイル 1.数霊 ベースファイル
200 FILE_csv$ = "data/Kazutama.csv"
210 'csvファイル 2.数霊 ベースファイル 2
220 FILE_csv2$ = "data/Surei_chart_20211207.csv"
230 'gazo ファイル
240 Gazo$ = "data/Gazo/"
250 'Sound File(Voice)
260 '1.ボイス TopScreen
270 Voice_File_TopScreen$ = "data/Sound_data/"
280 '変数領域
290 dim bufline$(118 * 2),bufcount$(10):count = 0:dim bufcount1$(10):dim bufcount2$(10):mode = 0:dim bufline2$(183 * 2),bufline3$(181 * 2)
300 count2 = 0
310 'ファイルの有無チェック
320 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
330 '1.ファイルが無いとき
340 cls :print "依存ファイルが見つかりません":
350 print "エンターキーを押してください"+chr$(13)
360 key$=input$(1)
370 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
380 else
390 '2.ファイルが有るとき
400 cls:print "csv:file ok." + chr$(13)
410 n=0
420 open FILE_csv$ for input as #1
430 while eof(1) = 0
440 input #1,line$
450 bufline$(n) = line$
460 n = n + 1
470 wend
480 close #1
490 '2つ目のファイル読み込み
500 m=0
510 open FILE_csv2$ for input as #2
520 while eof(1) = 0
530 input #2,line2$
540  bufline2$(m) = line2$
550  m = m + 1
560 wend
570 close #2
580 endif
590 'for j=1 to 181
600 for i=2 to 183
610 bufline3$(i - 2) = bufline2$(i)
620 'next j
630 next i
640 erase bufline2$
650 'Top画面
660 TopScreen:
670 cls 3:font 48
680 play ""
690 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
700 gload Gazo$ + "Screen1.png"
710 color rgb(255,255,255)
720 print "●Top画面" + chr$(13)
730 print "1.数霊(かずたま)チェック" + chr$(13)
740 print "2.設定" + chr$(13)
750 print "3.ヘルプ" + chr$(13)
760 print "4.終　了" + chr$(13)
770 print "番号を選んでください" + chr$(13)
780 color rgb(0,0,0)
790 Input "番号:",No
800 if No=1 then goto Surei_Check:
810 if No=3 then Color rgb(255,255,255):goto Help:
820 if No=4 then cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":ui_msg "終了します":color rgb(255,255,255):end
830 if No=2 then color rgb(255,255,255):goto Setting:
840 '1-1.数霊チェック
850 Surei_Check:
860 cls 3:Font 32
870 gload Gazo$ + "Screen4.png"
880 play ""
890 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
900 color rgb(255,0,0)
910 print "●数霊(かずたま)チェックトップ" + chr$(13)
920 color rgb(255,255,255)
930 print "番号を選んでください"+chr$(13)
940 print "1.数霊(かずたま)チェック(1人用)" + chr$(13)
950 print "2.数霊(かずたま)チェック(2人用)" + chr$(13)
960 print "3.前の画面に戻る" + chr$(13)
970 print "4.終 了" + chr$(13)
980 color rgb(0,0,0)
990 Input "番号:",No
1000 '前の画面に戻る
1010 if No = 3 then goto TopScreen:
1020 'プログラムの終了
1030 if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":end
1040 '1人用
1050 if No = 1 then goto Surei_Input:
1060 '2人用
1070 if No = 2 then goto Surei_twoParson:
1080 if No > 4 then ui_msg"もう一度入れてください":goto Surei_Check:
1090 '数霊(かずたま) 文字入力  1人用
1100 Surei_Input:
1110 if mode = 0 then
1120 cls 3:font 32
1130 gload Gazo$ + "InputKotodama.png"
1140 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
1150 color rgb(255,0,0)
1160 print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
1170 color rgb(255,255,255)
1180 print "文字を入れてください" + chr$(13)
1190 color rgb(255,0,0)
1200 print "(有効文字:カタカナ、半角アルファベット"+chr$(13)
1210 print "大文字のみ)" +chr$(13)
1220 'print "" + chr$(13)
1230 color rgb(0,0,0)
1240 Input "入力文字:",buffer_moji$
1250 goto Surei_Result:
1260 else
1270 if mode = 1 then
1280 cls 3:Font 32
1290 gload Gazo$ + "InputKotodama.png"
1300 color rgb(255,0,0)
1310 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
1320 color rgb(255,255,255)
1330 print "文字を入れてください" + chr$(13)
1340 color rgb(255,0,0)
1350 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
1360 print "大文字のみ)" + chr$(13)
1370 color rgb(0,0,0)
1380 Input "文字入力:",buffer_moji2$
1390 goto Surei_Result3:
1400 endif
1410 endif
1420 '数霊(かずたま)文字入力　2人用
1430 Surei_twoParson:
1440 cls 3:Font 32
1450 gload Gazo$ + "InputKotodama.png"
1460 '1人目入力
1470 color rgb(255,0,0)
1480 print "●数霊(かずたま) 1人目 入力" + chr$(13)
1490 color rgb(255,0,0)
1500 print "1人目の文字を入れてください" + chr$(13)
1510 color rgb(255,0,0)
1520 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
1530 color rgb(0,0,0)
1540 print chr$(13)
1550 Input "1人目文字入力:",buf_Parson1$
1560 Surei_twoParson2:
1570 cls 3:Font 32
1580 '2人目入力
1590 gload Gazo$ + "InputKotodama.png"
1600 color rgb(255,0,0)
1610 print "●数霊(かずたま) 2人目 入力" + chr$(13)
1620 print "2人目の文字を入れてください" + chr$(13)
1630 color rgb(255,0,0)
1640 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13)
1650 color rgb(0,0,0)
1660 Input "2人目の文字入力:",buf_Parson2$
1670 goto Surei_Result2:
1680 '数霊　計算 パート
1690 '文字の計算関数
1700 'moji$:1文字を入れる
1710 func Complate(moji$)
1720 for n = 1 to 116
1730 if moji$ = bufline$(2*n) then
1740 buffcount = val(bufline$(2 * n + 1))
1750 endif
1760 next n
1770 endfunc buffcount
1780 '数霊　結果表示
1790 Surei_Result:
1800 cls 3:Font 32
1810 'ゼロカウント:zcount
1820 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
1830 '例 アカい:"い"の文字は無効な文字なので、はじく
1840 zcount=0
1850 'mojicount:入力文字数
1860 mojicount = len(buffer_moji$)
1870 for n=1 to mojicount
1880 for j=1 to 116
1890 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
1900 if bufcount$(n - 1) = bufline$(2 * j) then
1910   zcount = zcount + 1
1920 endif
1930 next j
1940 next n
1950 if mojicount > zcount then
1960 cls 3:ui_msg "無効な文字です":talk"無効な文字があります。":zcount = 0:goto Surei_Input:
1970 endif
1980 for i = 1 to mojicount
1990 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
2000 n1 = Complate(bufcount$(i - 1))
2010 count = count + n1
2020 next i
2030 '182以上のとき,181を引く
2040 if (count > 181) then count = count - 181
2050 cls 3:Font 48
2060 gload Gazo$ + "Result_Screen3.png"
2070 color rgb(255,0,0)
2080 print "入力文字:";buffer_moji$;chr$(13)
2090 color rgb(255,255,255)
2100 print "数霊(かずたま):";count;chr$(13)
2110 color rgb(0,0,0)
2120 print "エンターキー:トップ画面" + chr$(13)
2130 print "スペースキー:もう一度入力" + chr$(13)
2140 key$ = input$(1)
2150 if key$ = chr$(13) then
2160 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
2170 for i=0 to 9
2180 bufcount$(i) = ""
2190 next i
2200 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
2210 else
2220 if key$ = " " then
2230 '２回めの入力に行く
2240 mode = 1:goto Surei_Input:
2250 endif
2260 endif
2270 '3-1 バージョン情報
2280 Version:
2290 cls 3:Font 32
2300 gload Gazo$ + "Screen1.png"
2310 play ""
2320 play Voice_File_TopScreen$ + "Version_Screen.mp3"
2330 color rgb(255,0,0)
2340 print"●バージョン情報"+chr$(13)
2350 color rgb(255,255,255)
2360 print "Ver:";Version$ + chr$(13)
2370 print "アプリ名:数霊"+ chr$(13)
2380 print "for Basic for Android"+chr$(13)
2390 print "Author:licksjp"+chr$(13)
2400 print "制作開始:2021.7.28" + chr$(13)
2410 print chr$(13)
2420 print "(C)Copy right licksjp " + chr$(13)
2430 print "All rights reserved" + chr$(13)
2440 color rgb(0,0,0)
2450 print "エンターキーを押してください" + chr$(13)
2460 key$ = input$(1)
2470 if key$ = chr$(13) then goto TopScreen:
2480 '3-2 参考文献
2490 Reference_Book:
2500 cls 3:Font 48:play""
2510 gload Gazo$ + "Screen1.png"
2520 color rgb(255,0,0)
2530 print"●参考文献" + chr$(13)
2540 color rgb(255,255,255)
2550 print "書名:数霊" + chr$(13)
2560 print "出版社:徳間書店" + chr$(13)
2570 print "ISBN:978-4-19-" + chr$(13)
2580 print "         865309-5" + chr$(13)
2590 print "定価:2300円 + 税" + chr$(13)
2600 color rgb(0,0,0)
2610 print "エンターキーを押してください"
2620 key$=input$(1)
2630 if key$=chr$(13) then goto TopScreen:
2640 'ヘルプ画面　トップ画面
2650 Help:
2660 play Voice_File_TopScreen$ + "help_Screen.mp3"
2670 cls 3:Font 48:play""
2680 gload Gazo$ + "Screen1.png"
2690 print "●3.ヘルプ　トップ画面" + chr$(13)
2700 print "番号を選んでください" + chr$(13)
2710 print "1.バージョン" + chr$(13)
2720 print "2.参考文献" + chr$(13)
2730 print "3.トップ画面" + chr$(13)
2740 print "4.終 了" + chr$(13)
2750 color rgb(0,0,0)
2760 Input "番号:",No
2770 if No=1 then goto Version:
2780 if No=3 then goto TopScreen:
2790 if No=2 then goto Reference_Book:
2800 if No=4 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":cls 3:end
2810 if (No = 0 or No > 4) then ui_msg"もう一度入れてください":talk "もう一度、入れてください":goto Help:
2820 '登録文字の確認
2830 '文字を1文字入れて登録されているか調べるメニュー
2840 '設定項目
2850 Setting:
2860 cls 3:Font 48
2870 gload Gazo$ + "Screen1.png"
2880 color rgb(255,0,0)
2890 print "●設定項目" + chr$(13)
2900 color rgb(255,255,255)
2910 print "1.文字検索" + chr$(13)
2920 print "2.登録文字数の確認" + chr$(13)
2930 print "3.トップ画面に行く" + chr$(13)
2940 print "4.終 了" + chr$(13)
2950 print "番号を選んでください" + chr$(13)
2960 color rgb(0,0,0)
2970 Input "番号:",No
2980 if No=3 then goto TopScreen:
2990 if No=1 then goto Moji_Search:
3000 if No=2 then goto Moji_Count_Check:
3010 if No=4 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
3020 if No > 4 then goto Setting:
3030 '文字検索項目  ここから
3040 Moji_Search:
3050 cls 3:Font 32
3060 gload Gazo$ + "Moji_check.png"
3070 print "" + chr$(13)
3080 color rgb(255,0,0):print chr$(13)
3090 print "文字を一文字入れてください" + chr$(13)
3100 color rgb(0,0,0)
3110 Input "登録文字:",moji$
3120 moji_count = len(moji$)
3130 if moji_count > 1 then
3140 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
3150 else
3160 count=0
3170 for n = 0 to 116
3180 if bufline$(2*n) = moji$ then
3190 cls 3:font 48
3200 gload Gazo$ + "Moji_check.png"
3210 talk"この文字は登録されています"
3220 print chr$(13)
3230 color rgb(255,0,0)
3240 print moji$;"は、登録されています。" + chr$(13)
3250 color rgb(0,0,0)
3260 print "エンターキーを押してください"
3270 key$=input$(1)
3280 if key$=chr$(13) then goto TopScreen:
3290 count = count + 1
3300 endif
3310 next n
3320 if count = 0 then
3330 cls 3
3340 talk"この文字は登録されていません"
3350 print moji$;"は、登録されていません。" + chr$(13)
3360 print "エンターキーを押してください" + chr$(13)
3370 key$=input$(1)
3380 if key$=chr$(13) then goto TopScreen:
3390 endif
3400 endif
3410 Surei_Result2:
3420 cls 3:Font 48
3430 zcount1=0:zcount2=0:count1=0:count2=0
3440 '1人目
3450 mojicount1=len(buf_Parson1$)
3460 '2人目
3470 mojicount2=len(buf_Parson2$)
3480 '1人目
3490 for n=1 to mojicount1
3500 for j=1 to 116
3510 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
3520 if bufcount1$(n-1) = bufline$(2*j) then
3530 zcount1 = zcount1 + 1
3540 endif
3550 next j
3560 next n
3570 '2人目
3580 for n=1 to mojicount2
3590 for j=1 to 116
3600 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
3610 if bufcount2$(n-1) = bufline$(2*j) then
3620 zount2 = zcount2 + 1
3630 endif
3640 next j
3650 next n
3660 '1人目
3670 for i=1 to mojicount1
3680 bufcount1$(i-1)=Mid$(buf_Parson1$,i,1)
3690 p1=Complate(bufcount1$(i-1))
3700 count1 = count1 + p1
3710 next i
3720 '2人目
3730 for i=1 to mojicount2
3740 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
3750 p2 = Complate(bufcount2$(i-1))
3760 count2 = count2 + p2
3770 next i
3780 cls 3:
3790 gload Gazo$ + "Screen1.png"
3800 color rgb(255,0,0)
3810 print "数霊 2人用 結果表示"+chr$(13)
3820 color rgb(255,255,255)
3830 print "1人目:";buf_Parson1$;chr$(13)
3840 print "数霊1:";count1;chr$(13)
3850 print "2人目:";buf_Parson2$;chr$(13)
3860 print "数霊2:";count2;chr$(13)
3870 print "数霊(合計):";count1 + count2;chr$(13)
3880 color rgb(0,0,0)
3890 print "エンターキーを押してください" + chr$(13)
3900 key$=input$(1)
3910 if key$=chr$(13) then goto TopScreen:
3920 Surei_Result3:
3930 cls 3:Font 48
3940 zcount2 = 0:count2 = 0
3950 mojicount2 = len(buffer_moji2$)
3960 for n=1 to mojicount2
3970 for j=1 to 116
3980 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
3990 if bufcount2$(n - 1) = bufline$(2 * j) then
4000 zcount2 = zcount2 + 1
4010 endif
4020 next j
4030 next n
4040 for i=1 to mojicount2
4050 n2 = Complate(bufcount2$(i-1))
4060 count2 = count2 + n2
4070 next i
4080 gload Gazo$ + "Screen5.png"
4090 print chr$(13)
4100 color rgb(255,255,255)
4110 print "１回目回の文字入力:";buffer_moji$;chr$(13)
4120 print "１回目の数霊(かずたま)";count;chr$(13)
4130 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
4140 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
4150 color rgb(0,0,0)
4160 print "エンターキー:トップ画面";chr$(13)
4170 print "c or C キー:数霊の比較";chr$(13)
4180 key$ = input$(1)
4190 if key$ = chr$(13) then mode=0:count=0:count2=0:goto TopScreen:
4200 if key$ = "c" or key$ = "C" then
4210 if count = count2 then
4220 talk "かずたまは、一致してます、エンターキーでトップに行きます":goto Surei_Result3:
4230 else
4240 talk "かずたまは一致しません、エンターキーでトップに行きます"::goto Surei_Result3:
4250 endif
4260 endif
4270 Moji_Count_Check:
4280 cls 3:Font 48
4290 gload Gazo$ + "Moji_check.png"
4300 n=0
4310 open FILE_csv$ for input as #1
4320 while eof(1)=0
4330 line input #1, line$
4340 n = n + 1
4350 wend
4360 close #1
4370 n = n - 1
4380 talk "登録文字数は"+str$(n)+"文字です"
4390 print ""+chr$(13)
4400 color rgb(255,0,0)
4410 print "文字の登録文字数は";n;"文字" + chr$(13)
4420 color rgb(0,0,0)
4430 print "エンターキーを押してください"+chr$(13)
4440 key$=input$(1)
4450 if key$ = chr$(13) then
4460 goto TopScreen:
4470 else
4480 goto Moji_Count_Check:
4490 endif
