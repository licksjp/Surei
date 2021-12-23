100 '数霊(かずたま) 製作開始日:2021.07.28
110 'version 0.0.1_2021.07.28 テスト版１
120 'version 0.0.2_2021.11.27 テスト版２
130 'Version 0.0.3_2021.11.29 テスト版3
140 'Version 0.0.4_2021.11.30 - 12.01 α1
150 'Version 0.0.5_2021.12.02-1203 α2
160 'Version 0.0.6_2021.12.10 (α3)
170 'Version 0.0.7_2021.12.11 (α4)
180 'Version 0.0.8_2021.12.13 (α5)
190 'Version 0.0.9_2021.12.16 - 2021.12.18 (α6)
200 'Version 0.1.0_2021.12.19 -2021.12. 23 (β1)
210 '
220 Version$ = "0.1.0.2021.12.23 (β1)"
230 'csvファイル 1.数霊 ベースファイル
240 FILE_csv$ = "data/Kazutama.csv"
250 'csvファイル 2.数霊 ベースファイル 2
260 FILE_csv2$ = "data/Surei_chart_20211207.csv"
270 'gazo ファイル
280 Gazo$ = "data/Gazo/"
290 'Sound File(Voice)
300 '1.ボイス TopScreen
310 Voice_File_TopScreen$ = "data/Sound_data/"
320 '変数領域
330 dim bufline$(118 * 2),bufcount$(10):count = 0:dim bufcount1$(10):dim bufcount2$(10):mode = 0:dim bufline2$(200 * 2 + 3):dim bufline3$(118 * 2 + 3):dim bufKaztama$(50)
340 count2 = 0:N=0:N2=0:m2=0
350 'ファイルの有無チェック
360 if (dir$(FILE_csv$) = "" and dir$(FILE_csv2$) = "" ) then
370 '1.ファイルが無いとき
380 cls :print "依存ファイルが見つかりません":
390 print "エンターキーを押してください"+chr$(13)
400 key$ = input$(1)
410 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
420 else
430 '2.ファイルが有るとき
440 cls:print "csv:file ok." + chr$(13)
450 n=0
460 open FILE_csv$ for input as #1
470 while eof(1) = 0
480 input #1,line$
490 'print line$
500 bufline$(n) = line$
510 'Print n;chr$(13)
520 n = n + 1
530 wend
540 close #1
550 N=n
560 '2つ目のファイル読み込み
570 n = 0
580 open FILE_csv2$ for input as #2
590 while eof(2) = 0
600 input #2,line$
610 'print line$
620 bufline2$(n) = line$
630 'print n;chr$(13)
640 n = n + 1
650 wend
660 close #2
670 N2 = n
680 '
690 endif
700 for j=3 to 118*2+3
710 for i = 0 to 118*2
720 bufline3$(j-3) = bufline2$(i)
730 next i
740 next j
750 moji$ = Kotodama$(bufline3$(16))
760 'erase bufline2$
770 'Top画面
780 TopScreen:
790 cls 3:font 48
800 play ""
810 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
820 gload Gazo$ + "Screen1.png"
830 color rgb(0,0,255)
840 print "●Top画面" + chr$(13)
850 color rgb(255,255,255)
860 print "番号を選んでください" + chr$(13)
870 print "1.数霊(かずたま)チェック" + chr$(13)
880 print "2.設定" + chr$(13)
890 print "3.ヘルプ" + chr$(13)
900 print "4.終　了" + chr$(13)
910 color rgb(0,0,0)
920 Input "番号:",No
930 if No=1 then goto Surei_Check:
940 if No=3 then Color rgb(255,255,255):goto Help:
950 if No=4 then cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "終了します":color rgb(255,255,255):end
960 if No=2 then color rgb(255,255,255):goto Setting:
970 '1-1.数霊チェック
980 Surei_Check:
990 cls 3:Font 48
1000 'gload Gazo$ + "Screen4.png"
1010 gload Gazo$ + "Screen1.png"
1020 play ""
1030 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
1040 color rgb(255,0,0)
1050 print "●数霊(かずたま)チェックトップ" + chr$(13)
1060 color rgb(255,255,255)
1070 print "番号を選んでください"+chr$(13)
1080 print "1.数霊(かずたま)チェック(1人)" + chr$(13)
1090 print "2.数霊(かずたま)チェック(2人)" + chr$(13)
1100 print "3.前の画面に戻る" + chr$(13)
1110 print "4.終 了" + chr$(13)
1120 color rgb(0,0,0)
1130 Input "番号:",No
1140 '前の画面に戻る
1150 if No = 3 then goto TopScreen:
1160 'プログラムの終了
1170 if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:end
1180 '1人用
1190 if No = 1 then goto Surei_Input:
1200 '2人用
1210 if No = 2 then goto Surei_twoParson:
1220 if No > 4 then ui_msg"もう一度入れてください":goto Surei_Check:
1230 '数霊(かずたま) 文字入力  1人用
1240 Surei_Input:
1250 if mode = 0 then
1260 cls 3:font 32
1270 gload Gazo$ + "InputKotodama.png"
1280 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
1290 color rgb(255,0,0)
1300 print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
1310 color rgb(255,255,255)
1320 print "文字を入れてください" + chr$(13)
1330 color rgb(255,0,0)
1340 print "(有効文字:カタカナ、半角アルファベット"+chr$(13)
1350 print "大文字のみ)" +chr$(13)
1360 'print "" + chr$(13)
1370 color rgb(0,0,0)
1380 Input "入力文字:",buffer_moji$
1390 goto Surei_Result:
1400 else
1410 if mode = 1 then
1420 cls 3:Font 32
1430 gload Gazo$ + "InputKotodama.png"
1440 color rgb(255,0,0)
1450 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
1460 color rgb(255,255,255)
1470 print "文字を入れてください" + chr$(13)
1480 color rgb(255,0,0)
1490 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
1500 print "大文字のみ)" + chr$(13)
1510 color rgb(0,0,0)
1520 Input "文字入力:",buffer_moji2$
1530 goto Surei_Result3:
1540 endif
1550 endif
1560 '数霊(かずたま)文字入力　2人用
1570 Surei_twoParson:
1580 cls 3:Font 32
1590 gload Gazo$ + "InputKotodama.png"
1600 '1人目入力
1610 color rgb(255,0,0)
1620 print "●数霊(かずたま) 1人目 入力" + chr$(13)
1630 color rgb(255,0,0)
1640 print "1人目の文字を入れてください" + chr$(13)
1650 color rgb(255,0,0)
1660 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
1670 color rgb(0,0,0)
1680 print chr$(13)
1690 Input "1人目文字入力:",buf_Parson1$
1700 Surei_twoParson2:
1710 cls 3:Font 32
1720 '2人目入力
1730 gload Gazo$ + "InputKotodama.png"
1740 color rgb(255,0,0)
1750 print "●数霊(かずたま) 2人目 入力" + chr$(13)
1760 print "2人目の文字を入れてください" + chr$(13)
1770 color rgb(255,0,0)
1780 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13)
1790 color rgb(0,0,0)
1800 Input "2人目の文字入力:",buf_Parson2$
1810 goto Surei_Result2:
1820 '数霊　計算 パート
1830 '文字の計算関数
1840 'moji$:1文字を入れる
1850 func Complate(moji$)
1860 for n = 1 to 116
1870 if moji$ = bufline$(2*n) then
1880 buffcount = val(bufline$(2 * n + 1))
1890 endif
1900 next n
1910 endfunc buffcount
1920 '数霊　結果表示
1930 Surei_Result:
1940 cls 3:Font 32
1950 'ゼロカウント:zcount
1960 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
1970 '例 アカい:"い"の文字は無効な文字なので、はじく
1980 zcount=0
1990 'mojicount:入力文字数
2000 mojicount = len(buffer_moji$)
2010 for n=1 to mojicount
2020 for j=1 to 116
2030 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
2040 if bufcount$(n - 1) = bufline$(2 * j) then
2050   zcount = zcount + 1
2060 endif
2070 next j
2080 next n
2090 if mojicount > zcount then
2100 cls 3:ui_msg "無効な文字です":talk"無効な文字があります。":zcount = 0:goto Surei_Input:
2110 endif
2120 for i = 1 to mojicount
2130 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
2140 n1 = Complate(bufcount$(i - 1))
2150 count = count + n1
2160 next i
2170 '182以上のとき,181を引く
2180 if (count > 181) then count = count - 181
2190 cls 3:Font 48
2200 gload Gazo$ + "Result_Screen3.png"
2210 color rgb(255,0,0)
2220 print "入力文字:";buffer_moji$;chr$(13)
2230 color rgb(255,255,255)
2240 print "数霊(かずたま):";count;chr$(13)
2250 color rgb(0,0,0)
2260 print "エンターキー:トップ" + chr$(13)
2270 print "S or s:保存する"+ chr$(13)
2280 key$ = input$(1)
2290 if key$ = chr$(13) then
2300 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
2310 for i=0 to 9
2320 bufcount$(i) = " "
2330 next i
2340 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
2350 'else
2360 'if key$ = " " then
2370 '２回めの入力に行く
2380 'mode = 1:goto Surei_Input:
2390 else
2400 if key$ = "s" or key$ = "S" then
2410 'ファイルを保存する
2420 s = Save()
2430 ui_msg"保存しました"
2440 n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
2450 else
2460 goto Surei_Result:
2470 'endif
2480 endif
2490 endif
2500 '3-1 バージョン情報
2510 Version:
2520 cls 3:Font 32
2530 gload Gazo$ + "Screen1.png"
2540 play ""
2550 play Voice_File_TopScreen$ + "Voice_Version.mp3"
2560 color rgb(255,0,0)
2570 print"●バージョン情報"+chr$(13)
2580 color rgb(255,255,255)
2590 print "Ver:";Version$ + chr$(13)
2600 print "アプリ名:数霊"+ chr$(13)
2610 print "for Basic for Android"+chr$(13)
2620 print "Author:licksjp"+chr$(13)
2630 print "制作開始:2021.7.28" + chr$(13)
2640 print chr$(13)
2650 print "(C)Copy right licksjp " + chr$(13)
2660 print "All rights reserved" + chr$(13)
2670 color rgb(0,0,0)
2680 print "エンターキーを押してください" + chr$(13)
2690 key$ = input$(1)
2700 if key$ = chr$(13) then goto TopScreen:
2710 '3-2 参考文献
2720 Reference_Book:
2730 cls 3:Font 48:play""
2740 gload Gazo$ + "Screen1.png"
2750 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
2760 color rgb(255,0,0)
2770 print"●参考文献" + chr$(13)
2780 color rgb(255,255,255)
2790 print "書名:数霊" + chr$(13)
2800 print "出版社:徳間書店" + chr$(13)
2810 print "ISBN:978-4-19-" + chr$(13)
2820 print "         865309-5" + chr$(13)
2830 print "定価:2300円 + 税" + chr$(13)
2840 color rgb(0,0,0)
2850 print "エンターキーを押してください"
2860 key$=input$(1)
2870 if key$=chr$(13) then goto TopScreen:
2880 'ヘルプ画面　トップ画面
2890 Help:
2900 play ""
2910 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
2920 cls 3:Font 48:
2930 gload Gazo$ + "Screen1.png"
2940 color rgb(255,0,0)
2950 print "●3.ヘルプ　トップ画面" + chr$(13)
2960 color rgb(255,255,255)
2970 print "番号を選んでください" + chr$(13)
2980 print "1.バージョン" + chr$(13)
2990 print "2.参考文献" + chr$(13)
3000 print "3.トップ画面" + chr$(13)
3010 print "4.終 了" + chr$(13)
3020 color rgb(0,0,0)
3030 Input "番号:",No
3040 if No=1 then goto Version:
3050 if No=3 then goto TopScreen:
3060 if No=2 then goto Reference_Book:
3070 if No=4 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 400:cls 3:pause 2.052 * 1000:end
3080 if (No = 0 or No > 4) then ui_msg"もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
3090 '登録文字の確認
3100 '文字を1文字入れて登録されているか調べるメニュー
3110 '設定項目
3120 Setting:
3130 cls 3:Font 48
3140 gload Gazo$ + "Screen1.png"
3150 play ""
3160 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
3170 color rgb(0,0,255)
3180 print "●設定項目" + chr$(13)
3190 color rgb(255,255,255)
3200 print "番号を選んでください" + chr$(13)
3210 print "1.文字の確認" + chr$(13)
3220 print "2.数霊文字確認" + chr$(13)
3230 print "3.トップ画面に行く" + chr$(13)
3240 print "4.終 了" + chr$(13)
3250 color rgb(0,0,0)
3260 Input "番号:",No
3270 if No=3 then goto TopScreen:
3280 if No=1 then goto Select_moji:
3290 if No=2 then goto Kakunin_Surei_count:
3300 if No=4 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:end
3310 if No > 4 then goto Setting:
3320 '文字検索項目  ここから
3330 Moji_Search:
3340 cls 3:Font 32
3350 gload Gazo$ + "Moji_check.png"
3360 play ""
3370 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
3380 print "" + chr$(13)
3390 color rgb(255,0,0):print chr$(13)
3400 print "文字を一文字入れてください" + chr$(13)
3410 color rgb(0,0,0)
3420 Input "登録文字:",moji$
3430 moji_count = len(moji$)
3440 if moji_count > 1 then
3450 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
3460 else
3470 count=0
3480 for n = 0 to 116
3490 if bufline$(2*n) = moji$ then
3500 cls 3:font 48
3510 gload Gazo$ + "Moji_check.png"
3520 'talk"この文字は登録されています"
3530 play ""
3540 play Voice_File_TopScreen$+"Voice_Entry_OK.mp3"
3550 print chr$(13)
3560 color rgb(255,0,0)
3570 print moji$;"は、登録されています。" + chr$(13)
3580 color rgb(0,0,0)
3590 print "エンターキーを押してください"
3600 key$=input$(1)
3610 if key$=chr$(13) then goto TopScreen:
3620 count = count + 1
3630 endif
3640 next n
3650 if count = 0 then
3660 cls 3:font 48
3670 gload Gazo$ + "Moji_check.png"
3680 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
3690 print chr$(13)
3700 color rgb(255,0,0)
3710 print moji$;"は、登録されていません。" + chr$(13)
3720 color rgb(0,0,0)
3730 print "エンターキーを押してください" + chr$(13)
3740 key$=input$(1)
3750 if key$=chr$(13) then goto TopScreen:
3760 endif
3770 endif
3780 Surei_Result2:
3790 cls 3:Font 48
3800 zcount1=0:zcount2=0:count1=0:count2=0
3810 '1人目
3820 mojicount1=len(buf_Parson1$)
3830 '2人目
3840 mojicount2=len(buf_Parson2$)
3850 '1人目
3860 for n=1 to mojicount1
3870 for j=1 to 116
3880 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
3890 if bufcount1$(n-1) = bufline$(2*j) then
3900 zcount1 = zcount1 + 1
3910 endif
3920 next j
3930 next n
3940 '2人目
3950 for n=1 to mojicount2
3960 for j=1 to 116
3970 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
3980 if bufcount2$(n-1) = bufline$(2*j) then
3990 zount2 = zcount2 + 1
4000 endif
4010 next j
4020 next n
4030 '1人目
4040 for i=1 to mojicount1
4050 bufcount1$(i-1)=Mid$(buf_Parson1$,i,1)
4060 p1=Complate(bufcount1$(i-1))
4070 count1 = count1 + p1
4080 next i
4090 '2人目
4100 for i=1 to mojicount2
4110 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
4120 p2 = Complate(bufcount2$(i-1))
4130 count2 = count2 + p2
4140 next i
4150 cls 3:
4160 gload Gazo$ + "Screen1.png"
4170 color rgb(255,0,0)
4180 print "数霊 2人用 結果表示"+chr$(13)
4190 color rgb(255,255,255)
4200 print "1人目:";buf_Parson1$;chr$(13)
4210 print "数霊1:";count1;chr$(13)
4220 print "2人目:";buf_Parson2$;chr$(13)
4230 print "数霊2:";count2;chr$(13)
4240 print "数霊(合計):";count1 + count2;chr$(13)
4250 color rgb(0,0,0)
4260 print "エンターキーを押してください" + chr$(13)
4270 key$=input$(1)
4280 if key$=chr$(13) then goto TopScreen:
4290 Surei_Result3:
4300 cls 3:Font 48
4310 zcount2 = 0:count2 = 0
4320 mojicount2 = len(buffer_moji2$)
4330 for n=1 to mojicount2
4340 for j=1 to 116
4350 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
4360 if bufcount2$(n - 1) = bufline$(2 * j) then
4370 zcount2 = zcount2 + 1
4380 endif
4390 next j
4400 next n
4410 for i=1 to mojicount2
4420 n2 = Complate(bufcount2$(i-1))
4430 count2 = count2 + n2
4440 next i
4450 gload Gazo$ + "Screen5.png"
4460 color rgb(255,0,0)
4470 print "数霊の結果表示" + chr$(13)
4480 color rgb(255,255,255)
4490 print "１回目回の文字入力:";buffer_moji$;chr$(13)
4500 print "１回目の数霊(かずたま)";count;chr$(13)
4510 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
4520 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
4530 color rgb(0,0,0)
4540 print "エンターキー:トップ画面";chr$(13)
4550 print "c or C キー:数霊の比較";chr$(13)
4560 key$ = input$(1)
4570 if key$ = chr$(13) then mode=0:count=0:count2=0:goto TopScreen:
4580 if key$ = "c" or key$ = "C" then
4590 if count = count2 then
4600 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
4610 else
4620 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
4630 endif
4640 endif
4650 Moji_Count_Check:
4660 cls 3:Font 48
4670 gload Gazo$ + "Moji_check.png"
4680 n=0
4690 open FILE_csv$ for input as #1
4700 while eof(1)=0
4710 line input #1, line$
4720 n = n + 1
4730 wend
4740 close #1
4750 'n = n - 1
4760 'talk "登録文字数は"+str$(n)+"文字です"
4770 play ""
4780 if n = 118 then
4790 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
4800 else
4810 talk"登録文字数は、"+str$(n)+"文字です"
4820 endif
4830 print "" + chr$(13)
4840 color rgb(255,0,0)
4850 print "文字の登録文字数は";n;"文字" + chr$(13)
4860 color rgb(0,0,0)
4870 print "エンターキーを押してください"+chr$(13)
4880 key$ = input$(1)
4890 if key$ = chr$(13) then
4900 goto TopScreen:
4910 else
4920 goto Moji_Count_Check:
4930 endif
4940 'Save 関数
4950 func Save()
4960 open "data/Parsonal_list1.csv" for append as #1
4970 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
4980 close #1
4990 endfunc
5000 Select_moji:
5010 cls 3:font 48
5020 gload Gazo$ + "Screen1.png"
5030 color rgb(255,0,0)
5040 print "文字の確認" + chr$(13)
5050 color rgb(255,255,255)
5060 print "番号を選んでください" + chr$(13)
5070 print "1.文字検索"+chr$(13)
5080 print "2.登録文字の確認" + chr$(13)
5090 print "3.前の画面に戻る" + chr$(13)
5100 print "4.終　了" + chr$(13)
5110 color rgb(0,0,0)
5120 Input "番号:",No
5130 if No=1 then goto Moji_Search:
5140 if No=2 then goto Moji_Count_Check:
5150 if No=3 then goto TopScreen:
5160 if No=4 then color rgb(255,255,255):cls 3:pause 2.052*1000:end
5170 '
5180 Kakunin_Surei_count:
5190 cls 3:font 48
5200 gload Gazo$ + "Screen1.png"
5210 color rgb(255,0,0)
5220 print "数霊の確認" + chr$(13)
5230 color rgb(255,255,255)
5240 print "番号を選んでください" + chr$(13)
5250 print "1.数霊リスト 1人用" + chr$(13)
5260 print "2.数霊リスト 2人用:未実装" + chr$(13)
5270 print "3.トップ画面に行く" + chr$(13)
5280 print "4.終 了" + chr$(13)
5290 color rgb(0,0,0)
5300 Input "番号:",No
5310 if No=3 then goto TopScreen:
5320 if No=4 then color rgb(255,255,255):cls 3:pause 2.052*1000:end
5330 if No=1 then goto Surei_List1:
5340 if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
5350 Surei_List1:
5360 cls 3:font 48
5370 if dir$ = "data/Parsonal_list1.csv" then
5380 cls 3:print"登録ファイルがございません" + chr$(13)
5390 else
5400 buffer_list_count=Loadcount()
5410 talk"登録件数は"+str$(buffer_list_count)+"件です"
5420 gload Gazo$ + "KazutamaList1.png"
5430 color rgb(0,0,255)
5440 print"数霊リスト  登録件数" + chr$(13)
5450 color rgb(255,0,0)
5460 print "登録件数:";buffer_list_count;"件";chr$(13)
5470 color rgb(0,0,0)
5480 print "エンターキーを押してください"+chr$(13)
5490 key$=input$(1)
5500 if key$=chr$(13) then goto KotodamaList_page:
5510 endif
5520 func Loadcount()
5530 n = 0
5540 open "data/Parsonal_list1.csv" for input as #1
5550 while eof(1) = 0
5560 line input #1,line$
5570 n = n + 1
5580 wend
5590 close #1
5600 count_line = n
5610 endfunc count_line
5620 func Kotodama$(buf$)
5630 b = len("数霊:")
5640 a$ = Mid$(buf$,b+1,len(buf$))
5650 for i=0 to 118
5660 if bufline3$(2 * i) ="数霊:" + a$  then
5670 moji_$ = bufline3$(2*i + 1)
5680 'moji_$ = bufline3$(21)
5690 'moji$ = a$
5700 endif
5710 next i
5720 'kotodama$ = a$
5730 kotodama$ = moji_$
5740 endfunc kotodama$
5750 KotodamaList_page:
5760 cls 3:font 48:m = 0
5770 gload Gazo$ + "Screen5.png"
5780 open "data/Parsonal_list1.csv" for input as #1
5790 while eof(1) = 0
5800 input #1,line$
5810 bufKaztama$(m) = line$
5820 'input #1,line$
5830 'bufKaztama$(m,2*m + 1) = line$
5840 m = m + 1
5850 wend
5860 close #1
5870 l=0
5880 while buffer_list_count > l
5890 cls
5900 color rgb(255,0,0)
5910 print "数霊　リスト" + chr$(13)
5920 color rgb(255,255,255)
5930 n3 = l:n3 = n3 + 1
5940 print "番号:";n3;chr$(13)
5950 print bufKaztama$(2*l) + chr$(13)
5960 print bufKaztama$(2*l+ 1) + chr$(13)
5970 'Kmoji$ = Kotodama$(str$(36))
5980 Kmoji$=moji$
5990 print chr$(13) + chr$(13)
6000 color rgb(0,0,0)
6010 print "スペース:次へ行く" + chr$(13)
6020 print "エンターキー:トップ画面" + chr$(13)
6030 key$ = input$(1)
6040 if key$ = " " then
6050 l = ((l + 1) Mod buffer_list_count)
6060 else
6070 if key$ = chr$(13) then
6080 goto TopScreen:
6090 endif
6100 endif
6110 wend
