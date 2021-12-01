100 '数霊(かずたま) 製作開始日:2021.07.28
110 'version 0.0.1_2021.07.28 テスト版１
120 'version 0.0.2_2021.11.27 テスト版２
130 'Version 0.0.3_2021.11.29 テスト版3
140 'Version 0.0.4_2021.11.30 - 12.01 α1
150 Version$ = "0.0.4.2021.11.30 - 12.1(α1)"
160 'csvファイル 1.数霊 ベースファイル
170 FILE_csv$ = "data/Kazutama.csv"
180 '変数領域
190 dim bufline$(116 * 2),bufcount$(10):count = 0:dim bufcount1$(10):dim bufcount2$(10):mode=0
200 count2=0
210 'ファイルの有無チェック
220 if dir$(FILE_csv$) = "" then
230 '1.ファイルが無いとき
240 cls :print "依存ファイルが見つかりません"
250 else
260 '2.ファイルが有るとき
270 cls:print "csv:file ok." + chr$(13)
280 n=0
290 open FILE_csv$ for input as #1
300 while eof(1) = 0
310 input #1,line$
320 bufline$(n) = line$
330 n = n + 1
340 wend
350 close #1
360 endif
370 'Top画面
380 TopScreen:
390 cls 3
400 print "●Top画面" + chr$(13)
410 print "1.数霊(かずたま)チェック" + chr$(13)
420 print "2.設定" + chr$(13)
430 print "3.ヘルプ" + chr$(13)
440 print "4.終　了" + chr$(13)
450 print "番号を選んで入力ボタンを入れてください" + chr$(13)
460 Input "番号:",No
470 if No=1 then goto Surei_Check:
480 if No=3 then goto Help:
490 if No=4 then cls 3:talk "終了します":ui_msg "終了します":end
500 if No=2 then goto Setting:
510 '1-1.数霊チェック
520 Surei_Check:
530 cls 3
540 print "●数霊(かずたま)チェックトップ" + chr$(13)
550 print "1.数霊(かずたま)チェック(1人用)" + chr$(13)
560 print "2.数霊(かずたま)チェック(2人用)" + chr$(13)
570 print "3.前の画面に戻る" + chr$(13)
580 print "4.終 了" + chr$(13)
590 print "番号を選んでエンターキーを押してください" + chr$(13)
600 Input "番号:",No
610 '前の画面に戻る
620 if No = 3 then goto TopScreen:
630 'プログラムの終了
640 if No = 4 then cls 3:talk"終了いたします.":end
650 '1人用
660 if No = 1 then goto Surei_Input:
670 '2人用
680 if No = 2 then goto Surei_twoParson:
690 if No > 4 then ui_msg"もう一度入れてください":goto Surei_Check:
700 '数霊(かずたま) 文字入力  1人用
710 Surei_Input:
720 if mode = 0 then
730 cls 3
740 print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
750 print "文字を入れてください" + chr$(13)
760 color rgb(255,0,0)
770 print "(有効文字:カタカナ、半角アルファベット 大文字のみ)" + chr$(13)
780 color rgb(255,255,255)
790 Input "入力文字:",buffer_moji$
800 goto Surei_Result:
810 else
820 if mode = 1 then
830 cls 3
840 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
850 print "文字を入れてください" + chr$(13)
860 color rgb(255,0,0)
870 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
880 color rgb(255,255,255)
890 Input "文字入力:",buffer_moji2$
900 goto Surei_Result3:
910 endif
920 endif
930 '数霊(かずたま)文字入力　2人用
940 Surei_twoParson:
950 cls 3
960 '1人目入力
970 print "●数霊(かずたま) 1人目 入力" + chr$(13)
980 print "1人目の文字を入れてください" + chr$(13)
990 color rgb(255,0,0)
1000 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
1010 color rgb(255,255,255)
1020 Input"1人目文字入力:",buf_Parson1$
1030 Surei_twoParson2:
1040 cls 3
1050 '2人目入力
1060 print "●数霊(かずたま) 2人目 入力" + chr$(13)
1070 print "2人目の文字を入れてください" + chr$(13)
1080 color rgb(255,0,0)
1090 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13)
1100 color rgb(255,255,255)
1110 Input "2人目の文字入力:",buf_Parson2$
1120 goto Surei_Result2:
1130 '数霊　計算 パート
1140 '文字の計算関数
1150 'moji$:1文字を入れる
1160 func Complate(moji$)
1170 for n = 1 to 116
1180 if moji$ = bufline$(2*n) then
1190 buffcount = val(bufline$(2 * n + 1))
1200 endif
1210 next n
1220 endfunc buffcount
1230 '数霊　結果表示
1240 Surei_Result:
1250 cls 3
1260 'ゼロカウント:zcount
1270 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
1280 '例 アカい:"い"の文字は無効な文字なので、はじく
1290 zcount=0
1300 'mojicount:入力文字数
1310 mojicount = len(buffer_moji$)
1320 for n=1 to mojicount
1330 for j=1 to 116
1340 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
1350 if bufcount$(n - 1) = bufline$(2 * j) then
1360   zcount = zcount + 1
1370 endif
1380 next j
1390 next n
1400 if mojicount > zcount then
1410 cls 3:ui_msg "無効な文字です":talk"無効な文字があります。":zcount = 0:goto Surei_Input:
1420 endif
1430 for i = 1 to mojicount
1440 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
1450 n1 = Complate(bufcount$(i - 1))
1460 count = count + n1
1470 next i
1480 '182以上のとき,181を引く
1490 if (count > 181) then count = count - 181
1500 cls 3
1510 print "入力文字:";buffer_moji$;chr$(13)
1520 print "数霊(かずたま):";count;chr$(13)
1530 print "エンターキー:トップ画面" + chr$(13)
1540 print "スペースキー:もう一度入力"
1550 key$ = input$(1)
1560 if key$ = chr$(13) then
1570 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
1580 for i=0 to 9
1590 bufcount$(i) = ""
1600 next i
1610 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
1620 else
1630 if key$ = " " then
1640 '２回めの入力に行く
1650 mode = 1:goto Surei_Input:
1660 endif
1670 endif
1680 '3-1 バージョン情報
1690 Version:
1700 cls 3
1710 print"●バージョン情報"+chr$(13)
1720 print "Ver:";Version$ + chr$(13)
1730 print "アプリ名:数霊　for Basic for Android" + chr$(13)
1740 print "Author:licksjp"+chr$(13)
1750 print "制作開始:2021.7.28" + chr$(13)
1760 print "(C)Copy right licksjp All rights reserved" + chr$(13)
1770 print "エンターキーを押してください" + chr$(13)
1780 key$ = input$(1)
1790 if key$ = chr$(13) then goto TopScreen:
1800 '3-2 参考文献
1810 Reference_Book:
1820 cls 3
1830 print"●参考文献" + chr$(13)
1840 print "書名:数霊" + chr$(13)
1850 print "出版社:徳間書店" + chr$(13)
1860 print "ISBN:978-4-19-865309-5" + chr$(13)
1870 print "定価:2300円 + 税" + chr$(13)
1880 print "エンターキーを押してください"
1890 key$=input$(1)
1900 if key$=chr$(13) then goto TopScreen:
1910 'ヘルプ画面　トップ画面
1920 Help:
1930 cls 3
1940 print "●3.ヘルプ　トップ画面" + chr$(13)
1950 print "番号を選んでください" + chr$(13)
1960 print "1.バージョン" + chr$(13)
1970 print "2.参考文献" + chr$(13)
1980 print "3.トップ画面" + chr$(13)
1990 Input "番号:",No
2000 if No=1 then goto Version:
2010 if No=3 then goto TopScreen:
2020 if No=2 then goto Reference_Book:
2030 if (No=0 or No > 3) then ui_msg"もう一度入れてください":talk "もう一度、入れてください":goto Help:
2040 '登録文字の確認
2050 '文字を1文字入れて登録されているか調べるメニュー
2060 '設定項目
2070 Setting:
2080 cls 3
2090 print "●設定項目" + chr$(13)
2100 print "1.文字検索" + chr$(13)
2110 print "2.キーボードの表示" + chr$(13)
2120 print "3.トップ画面に行く" + chr$(13)
2130 print "番号を選んでください" + chr$(13)
2140 Input "番号:",No
2150 Moji_Search:
2160 cls 3
2170 print "登録文字検索" + chr$(13)
2180 print "文字を一文字入れてください" + chr$(13)
2190 Input "登録文字:",moji$
2200 moji_count = len(moji$)
2210 if moji_count > 1 then
2220 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
2230 else
2240 count=0
2250 for n = 0 to 116
2260 if bufline$(2*n) = moji$ then
2270 cls 3:
2280 talk"この文字は登録されています"
2290 print moji$;"は、登録されています。" + chr$(13)
2300 print "エンターキーを押してください"
2310 key$=input$(1)
2320 if key$=chr$(13) then goto TopScreen:
2330 count = count + 1
2340 endif
2350 next n
2360 if count = 0 then
2370 cls 3
2380 talk"この文字は登録されていません"
2390 print moji$;"は、登録されていません。" + chr$(13)
2400 print "エンターキーを押してください" + chr$(13)
2410 key$=input$(1)
2420 if key$=chr$(13) then goto TopScreen:
2430 endif
2440 endif
2450 Surei_Result2:
2460 cls 3
2470 zcount1=0:zcount2=0:count1=0:count2=0
2480 '1人目
2490 mojicount1=len(buf_Parson1$)
2500 '2人目
2510 mojicount2=len(buf_Parson2$)
2520 '1人目
2530 for n=1 to mojicount1
2540 for j=1 to 116
2550 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
2560 if bufcount1$(n-1) = bufline$(2*j) then
2570 zcount1 = zcount1 + 1
2580 endif
2590 next j
2600 next n
2610 '2人目
2620 for n=1 to mojicount2
2630 for j=1 to 116
2640 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
2650 if bufcount2$(n-1) = bufline$(2*j) then
2660 zount2 = zcount2 + 1
2670 endif
2680 next j
2690 next n
2700 '1人目
2710 for i=1 to mojicount1
2720 bufcount1$(i-1)=Mid$(buf_Parson1$,i,1)
2730 p1=Complate(bufcount1$(i-1))
2740 count1 = count1 + p1
2750 next i
2760 '2人目
2770 for i=1 to mojicount2
2780 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
2790 p2 = Complate(bufcount2$(i-1))
2800 count2 = count2 + p2
2810 next i
2820 cls 3:
2830 print "1人目:";buf_Parson1$;chr$(13)
2840 print "数霊1:";count1;chr$(13)
2850 print "2人目:";buf_Parson2$;chr$(13)
2860 print "数霊2:";count2;chr$(13)
2870 print "数霊(合計):";count1 + count2;chr$(13)
2880 print "エンターキーを押してください" + chr$(13)
2890 key$=input$(1)
2900 if key$=chr$(13) then goto TopScreen:
2910 Surei_Result3:
2920 cls 3
2930 zcount2 = 0:count2 = 0
2940 mojicount2 = len(buffer_moji2$)
2950 for n=1 to mojicount2
2960 for j=1 to 116
2970 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
2980 if bufcount2$(n - 1) = bufline$(2 * j) then
2990 zcount2 = zcount2 + 1
3000 endif
3010 next j
3020 next n
3030 for i=1 to mojicount2
3040 n2 = Complate(bufcount2$(i-1))
3050 count2 = count2 + n2
3060 next i
3070 print "１回目回の文字入力:";buffer_moji$;chr$(13)
3080 print "１回目の数霊(かずたま)";count;chr$(13)
3090 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
3100 print "今回(2回目)の数霊(かずたま)";count2;chr$(13)
3110 print "エンターキー:トップ画面";chr$(13)
3120 print "c or C キー:数霊の比較";chr$(13)
3130 key$ = input$(1)
3140 if key$ = chr$(13) then mode=0:count=0:count2=0:goto TopScreen:
3150 if key$ = "c" or key$ = "C" then
3160 if count = count2 then
3170 talk "かずたまは、一致してます、エンターキーでトップに行きます":goto Surei_Result3:
3180 else
3190 talk "かずたまは一致しません、エンターキーでトップに行きます"::goto Surei_Result3:
3200 endif
3210 endif
