100 '数霊(かずたま) 製作開始日:2021.07.28
110 'version 0.0.1_2021.07.28 テスト版１
120 'version 0.0.2_2021.11.27 テスト版２
130 Version$ = "0.0.3.2021.11.29(テスト3)"
140 'csvファイル 1.数霊 ベースファイル
150 FILE_csv$ = "data/Kazutama.csv"
160 '変数領域
170 dim bufline$(116 * 2),bufcount$(10):count = 0:dim bufcount1$(10):dim bufcount2$(10)
180 'ファイルの有無チェック
190 if dir$(FILE_csv$) = "" then
200 '1.ファイルが無いとき
210 cls :print "依存ファイルが見つかりません"
220 else
230 '2.ファイルが有るとき
240 cls:print "csv:file ok." + chr$(13)
250 n=0
260 open FILE_csv$ for input as #1
270 while eof(1)=0
280 input #1,line$
290 bufline$(n)=line$
300 n = n + 1
310 wend
320 close #1
330 endif
340 'Top画面
350 TopScreen:
360 cls 3
370 print "●Top画面" + chr$(13)
380 print "1.数霊(かずたま)チェック" + chr$(13)
390 print "2.設定" + chr$(13)
400 print "3.ヘルプ" + chr$(13)
410 print "4.終　了" + chr$(13)
420 print "番号を選んで入力ボタンを入れてください" + chr$(13)
430 Input "番号:",No
440 if No=1 then goto Surei_Check:
450 if No=3 then goto Help:
460 if No=4 then cls 3:talk "終了します":ui_msg "終了します":end
470 if No=2 then goto Setting:
480 '1-1.数霊チェック
490 Surei_Check:
500 cls 3
510 print "●数霊(かずたま)チェックトップ" + chr$(13)
520 print "1.数霊(かずたま)チェック(1人用)" + chr$(13)
530 print "2.数霊(かずたま)チェック(2人用)" + chr$(13)
540 print "3.前の画面に戻る" + chr$(13)
550 print "4.終 了" + chr$(13)
560 print "番号を選んでエンターキーを押してください" + chr$(13)
570 Input "番号:",No
580 '前の画面に戻る
590 if No = 3 then goto TopScreen:
600 'プログラムの終了
610 if No = 4 then cls 3:talk"終了いたします.":end
620 '1人用
630 if No = 1 then goto Surei_Input:
640 '2人用
650 if No = 2 then goto Surei_twoParson:
660 if No > 4 then ui_msg"もう一度入れてください":goto Surei_Check:
670 '数霊(かずたま) 文字入力  1人用
680 Surei_Input:
690 cls 3
700 print "●数霊(かずたま)文字入力" + chr$(13)
710 print "文字を入れてください" + chr$(13)
720 color rgb(255,0,0)
730 print "(有効文字:カタカナ、半角アルファベット 大文字のみ)" + chr$(13)
740 color rgb(255,255,255)
750 Input "入力文字:",buffer_moji$
760 goto Surei_Result:
770 '数霊(かずたま)文字入力　2人用
780 Surei_twoParson:
790 cls 3
800 '1人目入力
810 print "●数霊(かずたま) 1人目 入力" + chr$(13)
820 print "1人目の文字を入れてください" + chr$(13)
830 color rgb(255,0,0)
840 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
850 color rgb(255,255,255)
860 Input"1人目文字入力:",buf_Parson1$
870 Surei_twoParson2:
880 cls 3
890 '2人目入力
900 print "●数霊(かずたま) 2人目 入力" + chr$(13)
910 print "2人目の文字を入れてください" + chr$(13)
920 color rgb(255,0,0)
930 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13)
940 color rgb(255,255,255)
950 Input "2人目の文字入力:",buf_Parson2$
960 goto Surei_Result2:
970 '数霊　計算 パート
980 '文字の計算関数
990 'moji$:1文字を入れる
1000 func Complate(moji$)
1010 for n = 1 to 116
1020 if moji$ = bufline$(2*n) then
1030 buffcount = val(bufline$(2 * n + 1))
1040 endif
1050 next n
1060 endfunc buffcount
1070 '数霊　結果表示
1080 Surei_Result:
1090 cls 3
1100 'ゼロカウント:zcount
1110 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
1120 '例 アカい:"い"の文字は無効な文字なので、はじく
1130 zcount=0
1140 'mojicount:入力文字数
1150 mojicount = len(buffer_moji$)
1160 for n=1 to mojicount
1170 for j=1 to 116
1180 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
1190 if bufcount$(n - 1) = bufline$(2 * j) then
1200   zcount = zcount + 1
1210 endif
1220 next j
1230 next n
1240 if mojicount > zcount then
1250 cls 3:ui_msg "無効な文字です":talk"無効な文字があります。":zcount = 0:goto Surei_Input:
1260 endif
1270 for i = 1 to mojicount
1280 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
1290 n1 = Complate(bufcount$(i - 1))
1300 count = count + n1
1310 next i
1320 '182以上のとき,181を引く
1330 if (count > 181) then count = count - 181
1340 cls 3
1350 print "入力文字:";buffer_moji$;chr$(13)
1360 print "数霊(かずたま):";count;chr$(13)
1370 print "エンターキーを押してください";chr$(13)
1380 key$ = input$(1)
1390 if key$ = chr$(13) then
1400 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
1410 for i=0 to 9
1420 bufcount$(i) = ""
1430 next i
1440 goto TopScreen:
1450 endif
1460 '3-1 バージョン情報
1470 Version:
1480 cls 3
1490 print"●バージョン情報"+chr$(13)
1500 print "Ver:";Version$ + chr$(13)
1510 print "アプリ名:数霊　for Basic for Android" + chr$(13)
1520 print "Author:licksjp"+chr$(13)
1530 print "制作開始:2021.7.28" + chr$(13)
1540 print "(C)Copy right licksjp All right reserved" + chr$(13)
1550 print "エンターキーを押してください" + chr$(13)
1560 key$ = input$(1)
1570 if key$ = chr$(13) then goto TopScreen:
1580 '3-2 参考文献
1590 Reference_Book:
1600 cls 3
1610 print"●参考文献" + chr$(13)
1620 print "書名:数霊" + chr$(13)
1630 print "出版社:徳間書店" + chr$(13)
1640 print "ISBN:978-4-19-865309-5" + chr$(13)
1650 print "定価:2300円 + 税" + chr$(13)
1660 print "エンターキーを押してください"
1670 key$=input$(1)
1680 if key$=chr$(13) then goto TopScreen:
1690 'ヘルプ画面　トップ画面
1700 Help:
1710 cls 3
1720 print "●3.ヘルプ　トップ画面" + chr$(13)
1730 print "番号を選んでください" + chr$(13)
1740 print "1.バージョン" + chr$(13)
1750 print "2.参考文献" + chr$(13)
1760 print "3.トップ画面" + chr$(13)
1770 Input "番号:",No
1780 if No=1 then goto Version:
1790 if No=3 then goto TopScreen:
1800 if No=2 then goto Reference_Book:
1810 if (No=0 or No > 3) then ui_msg"もう一度入れてください":talk "もう一度、入れてください":goto Help:
1820 '登録文字の確認
1830 '文字を1文字入れて登録されているか調べるメニュー
1840 '設定項目
1850 Setting:
1860 cls 3
1870 print "●設定項目" + chr$(13)
1880 print "1.文字検索" + chr$(13)
1890 print "2.キーボードの表示" + chr$(13)
1900 print "3.トップ画面に行く" + chr$(13)
1910 print "番号を選んでください" + chr$(13)
1920 Input "番号:",No
1930 Moji_Search:
1940 cls 3
1950 print "登録文字検索" + chr$(13)
1960 print "文字を一文字入れてください" + chr$(13)
1970 Input "登録文字:",moji$
1980 moji_count = len(moji$)
1990 if moji_count > 1 then
2000 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
2010 else
2020 count=0
2030 for n = 0 to 116
2040 if bufline$(2*n) = moji$ then
2050 cls 3:
2060 talk"この文字は登録されています"
2070 print moji$;"は、登録されています。" + chr$(13)
2080 print "エンターキーを押してください"
2090 key$=input$(1)
2100 if key$=chr$(13) then goto TopScreen:
2110 count = count + 1
2120 endif
2130 next n
2140 if count = 0 then
2150 cls 3
2160 talk"この文字は登録されていません"
2170 print moji$;"は、登録されていません。" + chr$(13)
2180 print "エンターキーを押してください" + chr$(13)
2190 key$=input$(1)
2200 if key$=chr$(13) then goto TopScreen:
2210 endif
2220 endif
2230 Surei_Result2:
2240 cls 3
2250 zcount1=0:zcount2=0:count1=0:count2=0
2260 '1人目
2270 mojicount1=len(buf_Parson1$)
2280 '2人目
2290 mojicount2=len(buf_Parson2$)
2300 '1人目
2310 for n=1 to mojicount1
2320 for j=1 to 116
2330 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
2340 if bufcount1$(n-1) = bufline$(2*j) then
2350 zcount1 = zcount1 + 1
2360 endif
2370 next j
2380 next n
2390 '2人目
2400 for n=1 to mojicount2
2410 for j=1 to 116
2420 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
2430 if bufcount2$(n-1) = bufline$(2*j) then
2440 zount2 = zcount2 + 1
2450 endif
2460 next j
2470 next n
2480 '1人目
2490 for i=1 to mojicount1
2500 bufcount1$(i-1)=Mid$(buf_Parson1$,i,1)
2510 p1=Complate(bufcount1$(i-1))
2520 count1 = count1 + p1
2530 next i
2540 '2人目
2550 for i=1 to mojicount2
2560 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
2570 p2 = Complate(bufcount2$(i-1))
2580 count2 = count2 + p2
2590 next i
2600 cls 3:
2610 print "1人目:";buf_Parson1$;chr$(13)
2620 print "数霊1:";count1;chr$(13)
2630 print "2人目:";buf_Parson2$;chr$(13)
2640 print "数霊2:";count2;chr$(13)
2650 print "数霊(合計):";count1+count2;chr$(13)
2660 print "エンターキーを押してください"+chr$(13)
2670 key$=input$(1)
2680 if key$=chr$(13) then goto TopScreen:
