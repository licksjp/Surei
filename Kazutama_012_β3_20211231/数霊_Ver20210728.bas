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
250 '
260 Version$ = "0.1.2.2021.12.31(β3)"
270 'csvファイル 1.数霊 ベースファイル
280 FILE_csv$ = "data/Kazutama.csv"
290 'csvファイル 2.数霊 ベースファイル 2
300 FILE_csv2$ = "data/Surei_chart_20211207.csv"
310 'gazo ファイル
320 Gazo$ = "data/Gazo/"
330 'Sound File(Voice)
340 '1.ボイス TopScreen
350 Voice_File_TopScreen$ = "data/Sound_data/"
360 '変数領域
370 dim bufline$(181 * 2+3),bufcount$(10):count = 0:dim bufcount1$(10):dim bufcount2$(10):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50)
380 count2 = 0:N=0:N2=0:m2 = 0
390 'ファイルの有無チェック
400 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
410 '1.ファイルが無いとき
420 cls :print "依存ファイルが見つかりません":
430 print "エンターキーを押してください"+chr$(13)
440 key$ = input$(1)
450 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
460 else
470 '2.ファイルが有るとき
480 cls:print "csv:file ok." + chr$(13)
490 n=0
500 open FILE_csv$ for input as #1
510 while eof(1) = 0
520 input #1,line$
530 'print line$
540 bufline$(n) = line$
550 'Print n;chr$(13)
560 n = n + 1
570 wend
580 close #1
590 N=n
600 '2つ目のファイル読み込み
610 'n = 0
620 open FILE_csv2$ for input as #2
630 for n=3 to 181
640 for i=0 to 1
650 input #2,line$
660 bufline2$(n,i) = line$
670 'print bufline2$(n,i)
680 next i
690 next n
700 close #2
710 N2 = n
720 '
730 endif
740 'or j = 3 to 181+3
750 'ufline3$(j - 3,n) = bufline2$(i,n)
760 'next j
770 'moji$ = Kotodama$(bufline3$(16))
780 'erase bufline2$
790 'Top画面
800 TopScreen:
810 cls 3:font 48
820 play ""
830 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
840 gload Gazo$ + "Screen1_Top_20211226.png"
850 color rgb(0,0,255)
860 print chr$(13)
870 'print "●Top画面" + chr$(13)
880 color rgb(255,255,255)
890 print "番号を選んでください" + chr$(13)
900 print "1.数霊(かずたま)チェック" + chr$(13)
910 print "2.設定" + chr$(13)
920 print "3.ヘルプ" + chr$(13)
930 print "4.終　了" + chr$(13)
940 color rgb(0,0,0)
950 Input "番号:",No
960 if No=1 then goto Surei_Check:
970 if No=3 then Color rgb(255,255,255):goto Help:
980 if No=4 then cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "終了します":color rgb(255,255,255):end
990 if No=2 then color rgb(255,255,255):goto Setting:
1000 '1-1.数霊チェック
1010 Surei_Check:
1020 cls 3:Font 48
1030 'gload Gazo$ + "Screen4.png"
1040 gload Gazo$ + "Screen1_Sureicheck_Top20211226.png"
1050 play ""
1060 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
1070 color rgb(255,0,0)
1080 'print "●数霊(かずたま)チェックトップ" + chr$(13)
1090 print chr$(13)
1100 color rgb(255,255,255)
1110 print "番号を選んでください"+chr$(13)
1120 print "1.数霊(かずたま)チェック(1人)" + chr$(13)
1130 print "2.数霊(かずたま)チェック(2人)" + chr$(13)
1140 print "3.前の画面に戻る" + chr$(13)
1150 print "4.終 了" + chr$(13)
1160 color rgb(0,0,0)
1170 Input "番号:",No
1180 '前の画面に戻る
1190 if No = 3 then goto TopScreen:
1200 'プログラムの終了
1210 if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:end
1220 '1人用
1230 if No = 1 then goto Surei_Input:
1240 '2人用
1250 if No = 2 then goto Surei_twoParson:
1260 if No > 4 then ui_msg"もう一度入れてください":goto Surei_Check:
1270 '数霊(かずたま) 文字入力  1人用
1280 Surei_Input:
1290 if mode = 0 then
1300 cls 3:font 32
1310 gload Gazo$ + "InputKotodama_20211226.png"
1320 play""
1330 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
1340 color rgb(255,0,0)
1350 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
1360 print chr$(13)
1370 color rgb(0,0,0)
1380 print "文字を入れてください" + chr$(13)
1390 color rgb(255,0,0)
1400 print "(有効文字:カタカナ、半角アルファベット、大文字のみ)"+chr$(13)
1410 print chr$(13)
1420 color rgb(0,0,0)
1430 Input "入力文字:",buffer_moji$
1440 goto Surei_Result:
1450 else
1460 if mode = 1 then
1470 cls 3:Font 32
1480 gload Gazo$ + "InputKotodama.png"
1490 color rgb(255,0,0)
1500 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
1510 color rgb(255,255,255)
1520 print "文字を入れてください" + chr$(13)
1530 color rgb(255,0,0)
1540 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
1550 print "大文字のみ)" + chr$(13)
1560 color rgb(0,0,0)
1570 Input "文字入力:",buffer_moji2$
1580 goto Surei_Result3:
1590 endif
1600 endif
1610 '数霊(かずたま)文字入力　2人用
1620 Surei_twoParson:
1630 cls 3:Font 32
1640 gload Gazo$ + "InputKotodama.png"
1650 '1人目入力
1660 color rgb(255,0,0)
1670 print "●数霊(かずたま) 1人目 入力" + chr$(13)
1680 color rgb(255,0,0)
1690 print "1人目の文字を入れてください" + chr$(13)
1700 color rgb(255,0,0)
1710 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
1720 color rgb(0,0,0)
1730 print chr$(13)
1740 Input "1人目文字入力:",buf_Parson1$
1750 Surei_twoParson2:
1760 cls 3:Font 32
1770 '2人目入力
1780 gload Gazo$ + "InputKotodama.png"
1790 color rgb(255,0,0)
1800 print "●数霊(かずたま) 2人目 入力" + chr$(13)
1810 print "2人目の文字を入れてください" + chr$(13)
1820 color rgb(255,0,0)
1830 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13)
1840 color rgb(0,0,0)
1850 Input "2人目の文字入力:",buf_Parson2$
1860 goto Surei_Result2:
1870 '数霊　計算 パート
1880 '文字の計算関数
1890 'moji$:1文字を入れる
1900 func Complate(moji$)
1910 for n = 1 to 116
1920 if moji$ = bufline$(2*n) then
1930 buffcount = val(bufline$(2 * n + 1))
1940 endif
1950 next n
1960 endfunc buffcount
1970 '数霊　結果表示
1980 Surei_Result:
1990 cls 3:Font 32
2000 'ゼロカウント:zcount
2010 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
2020 '例 アカい:"い"の文字は無効な文字なので、はじく
2030 zcount=0
2040 'mojicount:入力文字数
2050 mojicount = len(buffer_moji$)
2060 for n=1 to mojicount
2070 for j=1 to 116
2080 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
2090 if bufcount$(n - 1) = bufline$(2 * j) then
2100   zcount = zcount + 1
2110 endif
2120 next j
2130 next n
2140 if mojicount > zcount then
2150 cls 3:ui_msg "無効な文字です":talk"無効な文字があります。":zcount = 0:goto Surei_Input:
2160 endif
2170 for i = 1 to mojicount
2180 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
2190 n1 = Complate(bufcount$(i - 1))
2200 count = count + n1
2210 next i
2220 '182以上のとき,181を引く
2230 if (count > 181) then count = count - 181
2240 cls 3:Font 48+16
2250 gload Gazo$ + "Result_Screen3_20211226.png"
2260 color rgb(255,0,0)
2270 print "入力文字:" + buffer_moji$ + chr$(13)
2280 'print chr$(13)
2290 color rgb(0,0,255)
2300 print "数霊(かずたま):";count;chr$(13)
2310 color rgb(0,0,0)
2320 print "エンターキー:トップ" + chr$(13)
2330 print "スペース:次 へ" + chr$(13)
2340 key$ = input$(1)
2350 if key$ = " " then goto Surei_Result4:
2360 if key$ = chr$(13) then
2370 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
2380 for i=0 to 9
2390 bufcount$(i) = " "
2400 next i
2410 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
2420 'else
2430 'if key$ = " " then
2440 '２回めの入力に行く
2450 'mode = 1:goto Surei_Input:
2460 'else
2470 'if key$ = "s" or key$ = "S" then
2480 'ファイルを保存する
2490 's = Save()
2500 'ui_msg"保存しました"
2510 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
2520 else
2530 goto Surei_Result:
2540 'endif
2550 endif
2560 '3-1 バージョン情報
2570 Version:
2580 cls 3:Font 32
2590 gload Gazo$ + "Screen1_Version.png"
2600 play ""
2610 play Voice_File_TopScreen$ + "Voice_Version.mp3"
2620 color rgb(255,0,0)
2630 'print"●バージョン情報"+chr$(13)
2640 print chr$(13)
2650 color rgb(255,255,255)
2660 print "Ver:";Version$ + chr$(13)
2670 print "アプリ名:数霊"+ chr$(13)
2680 print "for Basic for Android"+chr$(13)
2690 print "Author:licksjp"+chr$(13)
2700 print "制作開始:2021.7.28" + chr$(13)
2710 print chr$(13)
2720 print "(C)Copy right licksjp " + chr$(13)
2730 print "All rights reserved" + chr$(13)
2740 color rgb(0,0,0)
2750 print "エンターキーを押してください" + chr$(13)
2760 key$ = input$(1)
2770 if key$ = chr$(13) then
2780 goto TopScreen:
2790 else
2800 talk "無効なキーです":goto Version:
2810 endif
2820 '3-2 参考文献
2830 Reference_Book:
2840 cls 3:Font 48:play""
2850 gload Gazo$ + "Screen1_Reference.png"
2860 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
2870 color rgb(255,0,0)
2880 'print"●参考文献" + chr$(13)
2890 print chr$(13)
2900 color rgb(255,255,255)
2910 print "書名:数霊" + chr$(13)
2920 print "出版社:徳間書店" + chr$(13)
2930 print "ISBN:978-4-19-" + chr$(13)
2940 print "         865309-5" + chr$(13)
2950 print "定価:2300円 + 税" + chr$(13)
2960 color rgb(0,0,0)
2970 print "エンターキーを押してください"
2980 key$=input$(1)
2990 if key$=chr$(13) then
3000 goto TopScreen:
3010 else
3020 talk"無効なキーです":goto Reference_Book:
3030 endif
3040 'ヘルプ画面　トップ画面
3050 Help:
3060 play ""
3070 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
3080 cls 3:Font 48:
3090 gload Gazo$ + "Screen1_Help_Top.png"
3100 color rgb(255,0,0)
3110 'print "●3.ヘルプ　トップ画面" + chr$(13)
3120 print chr$(13)
3130 color rgb(255,255,255)
3140 print "番号を選んでください" + chr$(13)
3150 print "1.バージョン" + chr$(13)
3160 print "2.参考文献" + chr$(13)
3170 print "3.トップ画面" + chr$(13)
3180 print "4.終 了" + chr$(13)
3190 color rgb(0,0,0)
3200 Input "番号:",No
3210 if No=1 then goto Version:
3220 if No=3 then goto TopScreen:
3230 if No=2 then goto Reference_Book:
3240 if No=4 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 400:cls 3:pause 2.052 * 1000:end
3250 if (No = 0 or No > 4) then ui_msg"もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
3260 '登録文字の確認
3270 '文字を1文字入れて登録されているか調べるメニュー
3280 '設定項目
3290 Setting:
3300 cls 3:Font 48
3310 gload Gazo$ + "Screen1_Setting_Top.png"
3320 play ""
3330 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
3340 color rgb(0,0,255)
3350 'print "●設定項目" + chr$(13)
3360 print chr$(13)
3370 color rgb(255,255,255)
3380 print "番号を選んでください" + chr$(13)
3390 print "1.文字の確認" + chr$(13)
3400 print "2.数霊文字確認" + chr$(13)
3410 print "3.トップ画面に行く" + chr$(13)
3420 print "4.終 了" + chr$(13)
3430 color rgb(0,0,0)
3440 Input "番号:",No
3450 if No=3 then goto TopScreen:
3460 if No=1 then goto Select_moji:
3470 if No=2 then goto Kakunin_Surei_count:
3480 if No=4 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:end
3490 if No > 4 then goto Setting:
3500 '文字検索項目  ここから
3510 Moji_Search:
3520 cls 3:Font 32
3530 gload Gazo$ + "Moji_check.png"
3540 play ""
3550 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
3560 print "" + chr$(13)
3570 color rgb(255,0,0):print chr$(13)
3580 print "文字を一文字入れてください" + chr$(13)
3590 color rgb(0,0,0)
3600 Input "登録文字:",moji$
3610 moji_count = len(moji$)
3620 if moji_count > 1 then
3630 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
3640 else
3650 count=0
3660 for n = 0 to 116
3670 if bufline$(2*n) = moji$ then
3680 cls 3:font 48
3690 gload Gazo$ + "Moji_check.png"
3700 'talk"この文字は登録されています"
3710 play ""
3720 play Voice_File_TopScreen$+"Voice_Entry_OK.mp3"
3730 print chr$(13)
3740 color rgb(255,0,0)
3750 print moji$;"は、登録されています。" + chr$(13)
3760 color rgb(0,0,0)
3770 print "エンターキーを押してください"
3780 key$=input$(1)
3790 if key$=chr$(13) then goto TopScreen:
3800 count = count + 1
3810 endif
3820 next n
3830 if count = 0 then
3840 cls 3:font 48
3850 gload Gazo$ + "Moji_check.png"
3860 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
3870 print chr$(13)
3880 color rgb(255,0,0)
3890 print moji$;"は、登録されていません。" + chr$(13)
3900 color rgb(0,0,0)
3910 print "エンターキーを押してください" + chr$(13)
3920 key$=input$(1)
3930 if key$=chr$(13) then goto TopScreen:
3940 endif
3950 endif
3960 Surei_Result2:
3970 cls 3:Font 48
3980 zcount1=0:zcount2=0:count1=0:count2=0
3990 '1人目
4000 mojicount1=len(buf_Parson1$)
4010 '2人目
4020 mojicount2=len(buf_Parson2$)
4030 '1人目
4040 for n=1 to mojicount1
4050 for j=1 to 116
4060 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
4070 if bufcount1$(n-1) = bufline$(2*j) then
4080 zcount1 = zcount1 + 1
4090 endif
4100 next j
4110 next n
4120 '2人目
4130 for n=1 to mojicount2
4140 for j=1 to 116
4150 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
4160 if bufcount2$(n-1) = bufline$(2*j) then
4170 zount2 = zcount2 + 1
4180 endif
4190 next j
4200 next n
4210 '1人目
4220 for i=1 to mojicount1
4230 bufcount1$(i-1)=Mid$(buf_Parson1$,i,1)
4240 p1=Complate(bufcount1$(i-1))
4250 count1 = count1 + p1
4260 next i
4270 '2人目
4280 for i=1 to mojicount2
4290 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
4300 p2 = Complate(bufcount2$(i-1))
4310 count2 = count2 + p2
4320 next i
4330 cls 3:
4340 gload Gazo$ + "Screen1.png"
4350 color rgb(255,0,0)
4360 print "数霊 2人用 結果表示"+chr$(13)
4370 color rgb(255,255,255)
4380 print "1人目:";buf_Parson1$;chr$(13)
4390 print "数霊1:";count1;chr$(13)
4400 print "2人目:";buf_Parson2$;chr$(13)
4410 print "数霊2:";count2;chr$(13)
4420 print "数霊(合計):";count1 + count2;chr$(13)
4430 color rgb(0,0,0)
4440 print "エンターキーを押してください" + chr$(13)
4450 key$=input$(1)
4460 if key$=chr$(13) then goto TopScreen:
4470 Surei_Result3:
4480 cls 3:Font 48
4490 zcount2 = 0:count2 = 0
4500 mojicount2 = len(buffer_moji2$)
4510 for n=1 to mojicount2
4520 for j=1 to 116
4530 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
4540 if bufcount2$(n - 1) = bufline$(2 * j) then
4550 zcount2 = zcount2 + 1
4560 endif
4570 next j
4580 next n
4590 for i=1 to mojicount2
4600 n2 = Complate(bufcount2$(i-1))
4610 count2 = count2 + n2
4620 next i
4630 gload Gazo$ + "Screen5.png"
4640 color rgb(255,0,0)
4650 print "数霊の結果表示" + chr$(13)
4660 color rgb(255,255,255)
4670 print "１回目回の文字入力:";buffer_moji$;chr$(13)
4680 print "１回目の数霊(かずたま)";count;chr$(13)
4690 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
4700 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
4710 color rgb(0,0,0)
4720 print "エンターキー:トップ画面";chr$(13)
4730 print "c or C キー:数霊の比較";chr$(13)
4740 key$ = input$(1)
4750 if key$ = chr$(13) then mode=0:count=0:count2=0:goto TopScreen:
4760 if key$ = "c" or key$ = "C" then
4770 if count = count2 then
4780 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
4790 else
4800 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
4810 endif
4820 endif
4830 Moji_Count_Check:
4840 cls 3:Font 48
4850 gload Gazo$ + "Moji_check.png"
4860 n=0
4870 open FILE_csv$ for input as #1
4880 while eof(1)=0
4890 line input #1, line$
4900 n = n + 1
4910 wend
4920 close #1
4930 'n = n - 1
4940 'talk "登録文字数は"+str$(n)+"文字です"
4950 play ""
4960 if n = 118 then
4970 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
4980 else
4990 talk"登録文字数は、"+str$(n)+"文字です"
5000 endif
5010 print "" + chr$(13)
5020 color rgb(255,0,0)
5030 print "文字の登録文字数は";n;"文字" + chr$(13)
5040 color rgb(0,0,0)
5050 print "エンターキーを押してください"+chr$(13)
5060 key$ = input$(1)
5070 if key$ = chr$(13) then
5080 goto TopScreen:
5090 else
5100 goto Moji_Count_Check:
5110 endif
5120 'Save 関数
5130 func Save()
5140 open "data/Parsonal_list1.csv" for append as #1
5150 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
5160 close #1
5170 endfunc
5180 Select_moji:
5190 cls 3:font 48
5200 gload Gazo$ + "Screen1_mojicheck.png"
5210 color rgb(255,0,0)
5220 'print "文字の確認" + chr$(13)
5230 print chr$(13)
5240 color rgb(255,255,255)
5250 print "番号を選んでください" + chr$(13)
5260 print "1.文字検索"+chr$(13)
5270 print "2.登録文字の確認" + chr$(13)
5280 print "3.前の画面に戻る" + chr$(13)
5290 print "4.終　了" + chr$(13)
5300 color rgb(0,0,0)
5310 Input "番号:",No
5320 if No=1 then goto Moji_Search:
5330 if No=2 then goto Moji_Count_Check:
5340 if No=3 then goto TopScreen:
5350 if No=4 then color rgb(255,255,255):cls 3:pause 2.052*1000:end
5360 '
5370 Kakunin_Surei_count:
5380 cls 3:font 48
5390 gload Gazo$ + "Kazutama_List_Top.png"
5400 color rgb(255,0,0)
5410 'print "数霊の確認" + chr$(13)
5420 print chr$(13)
5430 color rgb(255,255,255)
5440 print "番号を選んでください" + chr$(13)
5450 print "1.数霊リスト 1人用" + chr$(13)
5460 print "2.数霊リスト 2人用:未実装" + chr$(13)
5470 print "3.トップ画面に行く" + chr$(13)
5480 print "4.終 了" + chr$(13)
5490 color rgb(0,0,0)
5500 Input "番号:",No
5510 if No=3 then goto TopScreen:
5520 if No=4 then color rgb(255,255,255):cls 3:pause 2.052*1000:end
5530 if No=1 then goto Surei_List1:
5540 if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
5550 Surei_List1:
5560 cls 3:font 48
5570 if dir$ = "data/Parsonal_list1.csv" then
5580 cls 3:print"登録ファイルがございません" + chr$(13)
5590 else
5600 buffer_list_count=Loadcount()
5610 talk"登録件数は"+str$(buffer_list_count)+"件です"
5620 gload Gazo$ + "KazutamaList1_Entry.png"
5630 color rgb(0,0,255)
5640 'print"数霊リスト  登録件数" + chr$(13)
5650 print chr$(13)
5660 color rgb(255,0,0)
5670 print "登録件数:";buffer_list_count;"件";chr$(13)
5680 color rgb(0,0,0)
5690 print "エンターキーを押してください"+chr$(13)
5700 key$=input$(1)
5710 if key$=chr$(13) then
5720 goto KotodamaList_page:
5730 else
5740 goto Surei_List1:
5750 endif
5760 endif
5770 func Loadcount()
5780 n = 0
5790 open "data/Parsonal_list1.csv" for input as #1
5800 while eof(1) = 0
5810 line input #1,line$
5820 n = n + 1
5830 wend
5840 close #1
5850 count_line = n
5860 endfunc count_line
5870 func Kotodama$(buf$)
5880 b = len("数霊:")
5890 a$ = Mid$(buf$,b+1,len(buf$))
5900 for i=0 to 118
5910 if bufline3$(2 * i) ="数霊:" + a$  then
5920 moji_$ = bufline3$(2*i + 1)
5930 'moji_$ = bufline3$(21)
5940 'moji$ = a$
5950 endif
5960 next i
5970 'kotodama$ = a$
5980 kotodama$ = moji_$
5990 endfunc kotodama$
6000 KotodamaList_page:
6010 cls 3:font 48:m = 0
6020 gload Gazo$ + "Screen5_Surei_List.png"
6030 open "data/Parsonal_list1.csv" for input as #1
6040 while eof(1) = 0
6050 input #1,line$
6060 bufKaztama$(m) = line$
6070 'input #1,line$
6080 'bufKaztama$(m,2*m + 1) = line$
6090 m = m + 1
6100 wend
6110 close #1
6120 l=0
6130 while buffer_list_count > l
6140 cls
6150 color rgb(255,0,0)
6160 'print "数霊　リスト" + chr$(13)
6170 print chr$(13)
6180 color rgb(255,255,255)
6190 n3 = l:n3 = n3 + 1
6200 print "番号:";n3;chr$(13)
6210 print bufKaztama$(2*l) + chr$(13)
6220 print bufKaztama$(2*l+ 1) + chr$(13)
6230 'Kmoji$ = Kotodama$(str$(36))
6240 Kmoji$=moji$
6250 print chr$(13) + chr$(13)
6260 color rgb(0,0,0)
6270 print "スペース:次へ行く" + chr$(13)
6280 print "エンターキー:トップ画面" + chr$(13)
6290 key$ = input$(1)
6300 if key$ = " " then
6310 l = ((l + 1) Mod buffer_list_count)
6320 else
6330 if key$ = chr$(13) then
6340 goto TopScreen:
6350 else
6360 goto KotodamaList_page:
6370 endif
6380 endif
6390 wend
6400 '
6410 '結果表示２ Menu1
6420 Surei_Result4:
6430 cls 3:font (48 - 16)
6440 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
6450 for i=0 to 181 + 3 - 1
6460 if i = count  then
6470 buffer$ = bufline2$(count + 4,0)
6480 endif
6490 next i
6500 if len(buffer$) > 23 and len(buffer$) <= 44 then
6510 buffer2$ = Mid$(buffer$,1,22)
6520 buffer3$ = Mid$(buffer$,23,(len(buffer$) - 23))
6530 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)
6540 else
6550 if len(buffer$) <= 22 then
6560 buffer2$ = Mid$(buffer$,1,22)
6570 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
6580 else
6590 if len(buffer$) > 44 and len(buffer$) <= 63 then
6600 buffer2$ = Mid$(buffer$,1,22)
6610 buffer3$ = Mid$(buffer$,23,20)
6620 buffer4$ = Mid$(buffer$,43,(len(buffer$)-43))
6630 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)+chr$(13)
6640 else
6650 if len(buffer$) > 63 and len(buffer$) <= 81 then
6660 buffer2$ = Mid$(buffer$,1,21)
6670 buffer3$ = Mid$(buffer$,22,20)
6680 buffer4$ = Mid$(buffer$,42,20)
6690 buffer5$ = Mid$(buffer$,62,(len(buffer$)-62))
6700 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13) + chr$(13) + chr$(13)
6710 if len(buffer$) > 81 and len(buffer$) <= 110 then
6720 buffer2$ = Mid$(buffer$,1,21)
6730 buffer3$ = Mid$(buffer$,22,20)
6740 buffer4$ = Mid$(buffer$,42,20)
6750 buffer5$ = Mid$(buffer$,62,20)
6760 buffer6$ = Mid$(buffer$,82,(len(buffer$) - 82))
6770 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13) + chr$(13) + chr$(13)
6780 endif
6790 endif
6800 endif
6810 endif
6820 endif
6830 'cls 3
6840 gload Gazo$ + "Screen1_Result2.png"
6850 color rgb(255,0,0)
6860 'print "診断結果 2" + chr$(13)
6870 print chr$(13)
6880 color rgb(0,0,0)
6890 print "入力文字:";buffer_moji$;chr$(13)
6900 print "数霊:";count;chr$(13)
6910 color rgb(255,255,255)
6920 print "数霊の説明:"+chr$(13)
6930 print buffer$
6940 color rgb(0,0,0)
6950 print "エンターキー:トップ,S:保存する" + chr$(13)
6960 key$=input$(1)
6970 if key$ = chr$(13) then
6980 buffer$="" : buffer_moji$="" : count=0:goto TopScreen:
6990 else
7000 if key$="s" or key$="S" then
7010 s=Save():ui_msg"保存しました":goto Surei_Result4:
7020 else
7030 talk"無効な文字です":goto Surei_Result4:
7040 endif
7050 endif
