100 '数霊(かずたま) 製作開始日:2021.07.28
110 'version 0.0.1_2021.07.28 テスト版１
120 'version 0.0.2_2021.11.27 テスト版２
130 'Version 0.0.3_2021.11.29 テスト版3
140 'Version 0.0.4_2021.11.30 - 12.01 α1
150 'Version 0.0.5_2021.12.02-1203 α2
160 'Version 0.0.6_2021.12.10 (α3)
170 Version$ = "0.0.6.2021.1210(α3)"
180 'csvファイル 1.数霊 ベースファイル
190 FILE_csv$ = "data/Kazutama.csv"
200 'gazo ファイル
210 Gazo$ = "data/Gazo/"
220 'Sound File(Voice)
230 '1.ボイス TopScreen
240 Voice_File_TopScreen$ = "data/Sound_data/"
250 '変数領域
260 dim bufline$(118 * 2),bufcount$(10):count = 0:dim bufcount1$(10):dim bufcount2$(10):mode = 0
270 count2 = 0
280 'ファイルの有無チェック
290 if dir$(FILE_csv$) = "" then
300 '1.ファイルが無いとき
310 cls :print "依存ファイルが見つかりません"
320 else
330 '2.ファイルが有るとき
340 cls:print "csv:file ok." + chr$(13)
350 n=0
360 open FILE_csv$ for input as #1
370 while eof(1) = 0
380 input #1,line$
390 bufline$(n) = line$
400 n = n + 1
410 wend
420 close #1
430 endif
440 'Top画面
450 TopScreen:
460 cls 3:font 48
470 play ""
480 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
490 gload Gazo$ + "Screen1.png"
500 color rgb(255,255,255)
510 print "●Top画面" + chr$(13)
520 print "1.数霊(かずたま)チェック" + chr$(13)
530 print "2.設定" + chr$(13)
540 print "3.ヘルプ" + chr$(13)
550 print "4.終　了" + chr$(13)
560 print "番号を選んでください" + chr$(13)
570 color rgb(0,0,0)
580 Input "番号:",No
590 if No=1 then goto Surei_Check:
600 if No=3 then goto Help:
610 if No=4 then cls 3:play"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":ui_msg "終了します":end
620 if No=2 then goto Setting:
630 '1-1.数霊チェック
640 Surei_Check:
650 cls 3:Font 32
660 gload Gazo$ + "Screen4.png"
670 play ""
680 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
690 color rgb(0,0,255)
700 print "●数霊(かずたま)チェックトップ" + chr$(13)
710 color rgb(255,255,255)
720 print "1.数霊(かずたま)チェック(1人用)" + chr$(13)
730 print "2.数霊(かずたま)チェック(2人用)" + chr$(13)
740 print "3.前の画面に戻る" + chr$(13)
750 print "4.終 了" + chr$(13)
760 color rgb(0,0,0)
770 print "番号を選んでください" + chr$(13)
780 Input "番号:",No
790 '前の画面に戻る
800 if No = 3 then goto TopScreen:
810 'プログラムの終了
820 if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":end
830 '1人用
840 if No = 1 then goto Surei_Input:
850 '2人用
860 if No = 2 then goto Surei_twoParson:
870 if No > 4 then ui_msg"もう一度入れてください":goto Surei_Check:
880 '数霊(かずたま) 文字入力  1人用
890 Surei_Input:
900 if mode = 0 then
910 cls 3:font 32
920 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
930 color rgb(255,255,255)
940 print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
950 print "文字を入れてください" + chr$(13)
960 color rgb(255,0,0)
970 print "(有効文字:カタカナ、半角アルファベット 大文字のみ)" + chr$(13)
980 color rgb(255,255,255)
990 Input "入力文字:",buffer_moji$
1000 goto Surei_Result:
1010 else
1020 if mode = 1 then
1030 cls 3:Font 32
1040 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
1050 print "文字を入れてください" + chr$(13)
1060 color rgb(255,0,0)
1070 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
1080 color rgb(255,255,255)
1090 Input "文字入力:",buffer_moji2$
1100 goto Surei_Result3:
1110 endif
1120 endif
1130 '数霊(かずたま)文字入力　2人用
1140 Surei_twoParson:
1150 cls 3:Font 32
1160 '1人目入力
1170 print "●数霊(かずたま) 1人目 入力" + chr$(13)
1180 print "1人目の文字を入れてください" + chr$(13)
1190 color rgb(255,0,0)
1200 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
1210 color rgb(255,255,255)
1220 Input "1人目文字入力:",buf_Parson1$
1230 Surei_twoParson2:
1240 cls 3:Font 32
1250 '2人目入力
1260 print "●数霊(かずたま) 2人目 入力" + chr$(13)
1270 print "2人目の文字を入れてください" + chr$(13)
1280 color rgb(255,0,0)
1290 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13)
1300 color rgb(255,255,255)
1310 Input "2人目の文字入力:",buf_Parson2$
1320 goto Surei_Result2:
1330 '数霊　計算 パート
1340 '文字の計算関数
1350 'moji$:1文字を入れる
1360 func Complate(moji$)
1370 for n = 1 to 116
1380 if moji$ = bufline$(2*n) then
1390 buffcount = val(bufline$(2 * n + 1))
1400 endif
1410 next n
1420 endfunc buffcount
1430 '数霊　結果表示
1440 Surei_Result:
1450 cls 3:Font 32
1460 'ゼロカウント:zcount
1470 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
1480 '例 アカい:"い"の文字は無効な文字なので、はじく
1490 zcount=0
1500 'mojicount:入力文字数
1510 mojicount = len(buffer_moji$)
1520 for n=1 to mojicount
1530 for j=1 to 116
1540 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
1550 if bufcount$(n - 1) = bufline$(2 * j) then
1560   zcount = zcount + 1
1570 endif
1580 next j
1590 next n
1600 if mojicount > zcount then
1610 cls 3:ui_msg "無効な文字です":talk"無効な文字があります。":zcount = 0:goto Surei_Input:
1620 endif
1630 for i = 1 to mojicount
1640 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
1650 n1 = Complate(bufcount$(i - 1))
1660 count = count + n1
1670 next i
1680 '182以上のとき,181を引く
1690 if (count > 181) then count = count - 181
1700 cls 3:Font 32
1710 print "入力文字:";buffer_moji$;chr$(13)
1720 print "数霊(かずたま):";count;chr$(13)
1730 print "エンターキー:トップ画面" + chr$(13)
1740 print "スペースキー:もう一度入力"
1750 key$ = input$(1)
1760 if key$ = chr$(13) then
1770 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
1780 for i=0 to 9
1790 bufcount$(i) = ""
1800 next i
1810 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
1820 else
1830 if key$ = " " then
1840 '２回めの入力に行く
1850 mode = 1:goto Surei_Input:
1860 endif
1870 endif
1880 '3-1 バージョン情報
1890 Version:
1900 cls 3:Font 32
1910 play ""
1920 play Voice_File_TopScreen$ + "Version_Screen.mp3"
1930 print"●バージョン情報"+chr$(13)
1940 print "Ver:";Version$ + chr$(13)
1950 print "アプリ名:数霊　for Basic for Android" + chr$(13)
1960 print "Author:licksjp"+chr$(13)
1970 print "制作開始:2021.7.28" + chr$(13)
1980 print "(C)Copy right licksjp All rights reserved" + chr$(13)
1990 print "エンターキーを押してください" + chr$(13)
2000 key$ = input$(1)
2010 if key$ = chr$(13) then goto TopScreen:
2020 '3-2 参考文献
2030 Reference_Book:
2040 cls 3:Font 32
2050 print"●参考文献" + chr$(13)
2060 print "書名:数霊" + chr$(13)
2070 print "出版社:徳間書店" + chr$(13)
2080 print "ISBN:978-4-19-865309-5" + chr$(13)
2090 print "定価:2300円 + 税" + chr$(13)
2100 print "エンターキーを押してください"
2110 key$=input$(1)
2120 if key$=chr$(13) then goto TopScreen:
2130 'ヘルプ画面　トップ画面
2140 Help:
2150 play Voice_File_TopScreen$ + "help_Screen.mp3"
2160 cls 3:Font 32
2170 print "●3.ヘルプ　トップ画面" + chr$(13)
2180 print "番号を選んでください" + chr$(13)
2190 print "1.バージョン" + chr$(13)
2200 print "2.参考文献" + chr$(13)
2210 print "3.トップ画面" + chr$(13)
2220 Input "番号:",No
2230 if No=1 then goto Version:
2240 if No=3 then goto TopScreen:
2250 if No=2 then goto Reference_Book:
2260 if (No=0 or No > 3) then ui_msg"もう一度入れてください":talk "もう一度、入れてください":goto Help:
2270 '登録文字の確認
2280 '文字を1文字入れて登録されているか調べるメニュー
2290 '設定項目
2300 Setting:
2310 cls 3:Font 32
2320 print "●設定項目" + chr$(13)
2330 print "1.文字検索" + chr$(13)
2340 print "2.登録文字数の確認" + chr$(13)
2350 print "3.トップ画面に行く" + chr$(13)
2360 print "番号を選んでください" + chr$(13)
2370 Input "番号:",No
2380 if No=3 then goto TopScreen:
2390 if No=1 then goto Moji_Search:
2400 if No=2 then goto Moji_Count_Check:
2410 if No > 3 then goto Setting:
2420 '文字検索項目  ここから
2430 Moji_Search:
2440 cls 3:Font 32
2450 'gload Gazo$ + "Moji_check.png"
2460 print "" + chr$(13)
2470 print "" + chr$(13)
2480 print "文字を一文字入れてください" + chr$(13)
2490 Input "登録文字:",moji$
2500 moji_count = len(moji$)
2510 if moji_count > 1 then
2520 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
2530 else
2540 count=0
2550 for n = 0 to 116
2560 if bufline$(2*n) = moji$ then
2570 cls 3:
2580 talk"この文字は登録されています"
2590 print moji$;"は、登録されています。" + chr$(13)
2600 print "エンターキーを押してください"
2610 key$=input$(1)
2620 if key$=chr$(13) then goto TopScreen:
2630 count = count + 1
2640 endif
2650 next n
2660 if count = 0 then
2670 cls 3
2680 talk"この文字は登録されていません"
2690 print moji$;"は、登録されていません。" + chr$(13)
2700 print "エンターキーを押してください" + chr$(13)
2710 key$=input$(1)
2720 if key$=chr$(13) then goto TopScreen:
2730 endif
2740 endif
2750 Surei_Result2:
2760 cls 3:Font 32
2770 zcount1=0:zcount2=0:count1=0:count2=0
2780 '1人目
2790 mojicount1=len(buf_Parson1$)
2800 '2人目
2810 mojicount2=len(buf_Parson2$)
2820 '1人目
2830 for n=1 to mojicount1
2840 for j=1 to 116
2850 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
2860 if bufcount1$(n-1) = bufline$(2*j) then
2870 zcount1 = zcount1 + 1
2880 endif
2890 next j
2900 next n
2910 '2人目
2920 for n=1 to mojicount2
2930 for j=1 to 116
2940 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
2950 if bufcount2$(n-1) = bufline$(2*j) then
2960 zount2 = zcount2 + 1
2970 endif
2980 next j
2990 next n
3000 '1人目
3010 for i=1 to mojicount1
3020 bufcount1$(i-1)=Mid$(buf_Parson1$,i,1)
3030 p1=Complate(bufcount1$(i-1))
3040 count1 = count1 + p1
3050 next i
3060 '2人目
3070 for i=1 to mojicount2
3080 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
3090 p2 = Complate(bufcount2$(i-1))
3100 count2 = count2 + p2
3110 next i
3120 cls 3:
3130 print "1人目:";buf_Parson1$;chr$(13)
3140 print "数霊1:";count1;chr$(13)
3150 print "2人目:";buf_Parson2$;chr$(13)
3160 print "数霊2:";count2;chr$(13)
3170 print "数霊(合計):";count1 + count2;chr$(13)
3180 print "エンターキーを押してください" + chr$(13)
3190 key$=input$(1)
3200 if key$=chr$(13) then goto TopScreen:
3210 Surei_Result3:
3220 cls 3:Font 32
3230 zcount2 = 0:count2 = 0
3240 mojicount2 = len(buffer_moji2$)
3250 for n=1 to mojicount2
3260 for j=1 to 116
3270 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
3280 if bufcount2$(n - 1) = bufline$(2 * j) then
3290 zcount2 = zcount2 + 1
3300 endif
3310 next j
3320 next n
3330 for i=1 to mojicount2
3340 n2 = Complate(bufcount2$(i-1))
3350 count2 = count2 + n2
3360 next i
3370 print "１回目回の文字入力:";buffer_moji$;chr$(13)
3380 print "１回目の数霊(かずたま)";count;chr$(13)
3390 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
3400 print "今回(2回目)の数霊(かずたま)";count2;chr$(13)
3410 print "エンターキー:トップ画面";chr$(13)
3420 print "c or C キー:数霊の比較";chr$(13)
3430 key$ = input$(1)
3440 if key$ = chr$(13) then mode=0:count=0:count2=0:goto TopScreen:
3450 if key$ = "c" or key$ = "C" then
3460 if count = count2 then
3470 talk "かずたまは、一致してます、エンターキーでトップに行きます":goto Surei_Result3:
3480 else
3490 talk "かずたまは一致しません、エンターキーでトップに行きます"::goto Surei_Result3:
3500 endif
3510 endif
3520 Moji_Count_Check:
3530 cls 3:Font 48
3540 gload Gazo$ + "Moji_check.png"
3550 n=0
3560 open FILE_csv$ for input as #1
3570 while eof(1)=0
3580 line input #1, line$
3590 n = n + 1
3600 wend
3610 close #1
3620 n = n - 1
3630 talk "登録件数は"+str$(n)+"件です"
3640 print ""+chr$(13)
3650 color rgb(255,0,0)
3660 print "文字の登録件数は";n;"件です。" + chr$(13)
3670 color rgb(0,0,0)
3680 print "エンターキーを押してください"+chr$(13)
3690 key$=input$(1)
3700 if key$ = chr$(13) then
3710 goto TopScreen:
3720 else
3730 goto Moji_Count_Check:
3740 endif
