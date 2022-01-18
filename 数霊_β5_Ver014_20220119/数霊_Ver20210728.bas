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
270 Version$ = "0.1.4.2022.1.15(β4)"
280 'csvファイル 1.数霊 ベースファイル
290 FILE_csv$ = "data/Kazutama.csv"
300 'csvファイル 2.数霊 ベースファイル 2
310 FILE_csv2$ = "data/Surei_chart_20211207.csv"
320 'gazo ファイル
330 Gazo$ = "data/Gazo/"
340 'Sound File(Voice)
350 '1.ボイス TopScreen
360 Voice_File_TopScreen$ = "data/Sound_data/"
370 '変数領域
380 dim bufline$(181 * 2+3),bufcount$(10):count = 0:dim bufcount1$(10):dim bufcount2$(10):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50):flag=0
390 count2 = 0:N=0:N2=0:m2 = 0
400 'ファイルの有無チェック
410 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
420 '1.ファイルが無いとき
430 cls :print "依存ファイルが見つかりません":
440 print "エンターキーを押してください"+chr$(13)
450 key$ = input$(1)
460 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
470 else
480 '2.ファイルが有るとき
490 cls:print "csv:file ok." + chr$(13)
500 n=0
510 open FILE_csv$ for input as #1
520 while eof(1) = 0
530 input #1,line$
540 'print line$
550 bufline$(n) = line$
560 'Print n;chr$(13)
570 n = n + 1
580 wend
590 close #1
600 N=n
610 '2つ目のファイル読み込み
620 'n = 0
630 open FILE_csv2$ for input as #2
640 for n=3 to 181
650 for i=0 to 1
660 input #2,line$
670 bufline2$(n,i) = line$
680 'print bufline2$(n,i)
690 next i
700 next n
710 close #2
720 N2 = n
730 '
740 endif
750 'or j = 3 to 181+3
760 'ufline3$(j - 3,n) = bufline2$(i,n)
770 'next j
780 'moji$ = Kotodama$(bufline3$(16))
790 'erase bufline2$
800 'Top画面
810 TopScreen:
820 cls 3:font 48
830 play ""
840 if flag=1 then
850 talk"無効な数字です、入れ直してください。":flag=0
860 else
870 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
880 endif
890 gload Gazo$ + "Screen1_Top_20211226.png"
900 color rgb(0,0,255)
910 print chr$(13)
920 'print "●Top画面" + chr$(13)
930 color rgb(255,255,255)
940 print "番号を選んでください" + chr$(13)
950 print "1.数霊(かずたま)チェック" + chr$(13)
960 print "2.設定" + chr$(13)
970 print "3.ヘルプ" + chr$(13)
980 print "4.終　了" + chr$(13)
990 color rgb(0,0,0)
1000 Input "番号:",No
1010 if No=1 then goto Surei_Check:
1020 if No=3 then Color rgb(255,255,255):goto Help:
1030 if No=4 then cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "終了します":color rgb(255,255,255):end
1040 if No=2 then color rgb(255,255,255):goto Setting:
1050 if (No > 4 or No=0) then ui_msg"無効な数字です":flag = 1:goto TopScreen:
1060 '1-1.数霊チェック
1070 Surei_Check:
1080 cls 3:Font 48
1090 'gload Gazo$ + "Screen4.png"
1100 gload Gazo$ + "Screen1_Sureicheck_Top20211226.png"
1110 play ""
1120 if flag=1 then
1130 talk"無効な数字です、入れ直してください":flag=0
1140 else
1150 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
1160 endif
1170 color rgb(255,0,0)
1180 'print "●数霊(かずたま)チェックトップ" + chr$(13)
1190 print chr$(13)
1200 color rgb(255,255,255)
1210 print "番号を選んでください"+chr$(13)
1220 print "1.数霊(かずたま)チェック(1人)" + chr$(13)
1230 print "2.数霊(かずたま)チェック(2人)" + chr$(13)
1240 print "3.前の画面に戻る" + chr$(13)
1250 print "4.終 了" + chr$(13)
1260 color rgb(0,0,0)
1270 Input "番号:",No
1280 '前の画面に戻る
1290 if No = 3 then goto TopScreen:
1300 'プログラムの終了
1310 if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"終了します":end
1320 '1人用
1330 if No = 1 then goto Surei_Input:
1340 '2人用
1350 if No = 2 then goto Surei_twoParson:
1360 if (No > 4 or No=0) then ui_msg"もう一度入れてください":flag=1:goto Surei_Check:
1370 '数霊(かずたま) 文字入力  1人用
1380 Surei_Input:
1390 if mode = 0 then
1400 cls 3:font 32
1410 gload Gazo$ + "InputKotodama_20211226.png"
1420 play""
1430 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
1440 color rgb(255,0,0)
1450 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
1460 print chr$(13)
1470 color rgb(0,0,0)
1480 print "文字を入れてください" + chr$(13)
1490 color rgb(255,0,0)
1500 print "(有効文字:カタカナ、半角アルファベット、大文字のみ)"+chr$(13)
1510 print chr$(13)
1520 color rgb(0,0,0)
1530 Input "入力文字:",buffer_moji$
1540 goto Surei_Result:
1550 else
1560 if mode = 1 then
1570 cls 3:Font 32
1580 gload Gazo$ + "InputKotodama.png"
1590 color rgb(255,0,0)
1600 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
1610 color rgb(255,255,255)
1620 print "文字を入れてください" + chr$(13)
1630 color rgb(255,0,0)
1640 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
1650 print "大文字のみ)" + chr$(13)
1660 color rgb(0,0,0)
1670 Input "文字入力:",buffer_moji2$
1680 goto Surei_Result3:
1690 endif
1700 endif
1710 '数霊(かずたま)文字入力　2人用
1720 Surei_twoParson:
1730 cls 3:Font 32
1740 gload Gazo$ + "InputKotodama.png"
1750 '1人目入力
1760 color rgb(255,0,0)
1770 print "●数霊(かずたま) 1人目 入力" + chr$(13)
1780 color rgb(255,0,0)
1790 print "1人目の文字を入れてください" + chr$(13)
1800 color rgb(255,0,0)
1810 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
1820 color rgb(0,0,0)
1830 print chr$(13)
1840 Input "1人目文字入力:",buf_Parson1$
1850 Surei_twoParson2:
1860 cls 3:Font 32
1870 '2人目入力
1880 gload Gazo$ + "InputKotodama.png"
1890 color rgb(255,0,0)
1900 print "●数霊(かずたま) 2人目 入力" + chr$(13)
1910 print "2人目の文字を入れてください" + chr$(13)
1920 color rgb(255,0,0)
1930 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13)
1940 color rgb(0,0,0)
1950 Input "2人目の文字入力:",buf_Parson2$
1960 goto Surei_Result2:
1970 '数霊　計算 パート
1980 '文字の計算関数
1990 'moji$:1文字を入れる
2000 func Complate(moji$)
2010 for n = 1 to 116
2020 if moji$ = bufline$(2*n) then
2030 buffcount = val(bufline$(2 * n + 1))
2040 endif
2050 next n
2060 endfunc buffcount
2070 '数霊　結果表示
2080 Surei_Result:
2090 cls 3:Font 32
2100 'ゼロカウント:zcount
2110 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
2120 '例 アカい:"い"の文字は無効な文字なので、はじく
2130 zcount=0
2140 'mojicount:入力文字数
2150 mojicount = len(buffer_moji$)
2160 for n=1 to mojicount
2170 for j=1 to 116
2180 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
2190 if bufcount$(n - 1) = bufline$(2 * j) then
2200   zcount = zcount + 1
2210 endif
2220 next j
2230 next n
2240 if mojicount > zcount then
2250 cls 3:ui_msg "無効な文字です":talk"無効な文字があります。":zcount = 0:goto Surei_Input:
2260 endif
2270 for i = 1 to mojicount
2280 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
2290 n1 = Complate(bufcount$(i - 1))
2300 count = count + n1
2310 next i
2320 '182以上のとき,181を引く
2330 if (count > 181) then count = count - 181
2340 cls 3:Font 48+16
2350 gload Gazo$ + "Result_Screen3_20211226.png"
2360 color rgb(255,0,0)
2370 print "入力文字:" + buffer_moji$ + chr$(13)
2380 'print chr$(13)
2390 color rgb(0,0,255)
2400 print "数霊(かずたま):";count;chr$(13)
2410 color rgb(0,0,0)
2420 print "エンターキー:トップ" + chr$(13)
2430 print "スペース:次 へ" + chr$(13)
2440 key$ = input$(1)
2450 if key$ = " " then goto Surei_Result4:
2460 if key$ = chr$(13) then
2470 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
2480 for i=0 to 9
2490 bufcount$(i) = " "
2500 next i
2510 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
2520 'else
2530 'if key$ = " " then
2540 '２回めの入力に行く
2550 'mode = 1:goto Surei_Input:
2560 'else
2570 'if key$ = "s" or key$ = "S" then
2580 'ファイルを保存する
2590 's = Save()
2600 'ui_msg"保存しました"
2610 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
2620 else
2630 goto Surei_Result:
2640 'endif
2650 endif
2660 '3-1 バージョン情報
2670 Version:
2680 cls 3:Font 32
2690 gload Gazo$ + "Screen1_Version.png"
2700 play ""
2710 play Voice_File_TopScreen$ + "Voice_Version.mp3"
2720 color rgb(255,0,0)
2730 'print"●バージョン情報"+chr$(13)
2740 print chr$(13)
2750 color rgb(255,255,255)
2760 print "Ver:";Version$ + chr$(13)
2770 print "アプリ名:数霊"+ chr$(13)
2780 print "for Basic for Android"+chr$(13)
2790 print "Author:licksjp"+chr$(13)
2800 print "制作開始:2021.7.28" + chr$(13)
2810 print chr$(13)
2820 print "(C)Copy right licksjp " + chr$(13)
2830 print "All rights reserved" + chr$(13)
2840 color rgb(0,0,0)
2850 print "エンターキーを押してください" + chr$(13)
2860 key$ = input$(1)
2870 if key$ = chr$(13) then
2880 goto TopScreen:
2890 else
2900 talk "無効なキーです":goto Version:
2910 endif
2920 '3-2 参考文献
2930 Reference_Book:
2940 cls 3:Font 48:play""
2950 gload Gazo$ + "Screen1_Reference.png"
2960 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
2970 color rgb(255,0,0)
2980 'print"●参考文献" + chr$(13)
2990 print chr$(13)
3000 color rgb(255,255,255)
3010 print "書名:数霊" + chr$(13)
3020 print "出版社:徳間書店" + chr$(13)
3030 print "ISBN:978-4-19-" + chr$(13)
3040 print "         865309-5" + chr$(13)
3050 print "定価:2300円 + 税" + chr$(13)
3060 color rgb(0,0,0)
3070 print "エンターキーを押してください"
3080 key$=input$(1)
3090 if key$=chr$(13) then
3100 goto TopScreen:
3110 else
3120 talk"無効なキーです":goto Reference_Book:
3130 endif
3140 'ヘルプ画面　トップ画面
3150 Help:
3160 play ""
3170 if flag = 1 then
3180 talk"無効な数字です。入れ直してください.":flag=0
3190 else
3200 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
3210 endif
3220 cls 3:Font 48:
3230 gload Gazo$ + "Screen1_Help_Top.png"
3240 color rgb(255,0,0)
3250 'print "●3.ヘルプ　トップ画面" + chr$(13)
3260 print chr$(13)
3270 color rgb(255,255,255)
3280 print "番号を選んでください" + chr$(13)
3290 print "1.バージョン" + chr$(13)
3300 print "2.参考文献" + chr$(13)
3310 print "3.トップ画面" + chr$(13)
3320 print "4.終 了" + chr$(13)
3330 color rgb(0,0,0)
3340 Input "番号:",No
3350 if No=1 then goto Version:
3360 if No=3 then goto TopScreen:
3370 if No=2 then goto Reference_Book:
3380 if No=4 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":ui_msg"プログラムを終了します":pause 2.052*1000:cls 3:end
3390 if (No = 0 or No > 4) then ui_msg"もう一度入れてください":flag=1:goto Help:
3400 '登録文字の確認
3410 '文字を1文字入れて登録されているか調べるメニュー
3420 '設定項目
3430 Setting:
3440 cls 3:Font 48
3450 gload Gazo$ + "Screen1_Setting_Top.png"
3460 play ""
3470 if flag=1 then
3480 talk"無効な数字です、入れ直してください":flag=0
3490 else
3500 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
3510 endif
3520 color rgb(0,0,255)
3530 'print "●設定項目" + chr$(13)
3540 print chr$(13)
3550 color rgb(255,255,255)
3560 print "番号を選んでください" + chr$(13)
3570 print "1.文字の確認" + chr$(13)
3580 print "2.数霊文字確認" + chr$(13)
3590 print "3.トップ画面に行く" + chr$(13)
3600 print "4.終 了" + chr$(13)
3610 color rgb(0,0,0)
3620 Input "番号:",No
3630 if No=3 then goto TopScreen:
3640 if No=1 then goto Select_moji:
3650 if No=2 then goto Kakunin_Surei_count:
3660 if No=4 then color rgb(255,255,255):ui_msg"プログラムを終了します":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:cls 3:end
3670 if (No > 4 or No=0) then flag=1:goto Setting:
3680 '文字検索項目  ここから
3690 Moji_Search:
3700 cls 3:Font 32
3710 gload Gazo$ + "Moji_check.png"
3720 play ""
3730 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
3740 print "" + chr$(13)
3750 color rgb(255,0,0):print chr$(13)
3760 print "文字を一文字入れてください" + chr$(13)
3770 color rgb(0,0,0)
3780 Input "登録文字:",moji$
3790 moji_count = len(moji$)
3800 if moji_count > 1 then
3810 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
3820 else
3830 count=0
3840 for n = 0 to 116
3850 if bufline$(2*n) = moji$ then
3860 cls 3:font 48
3870 gload Gazo$ + "Moji_check.png"
3880 'talk"この文字は登録されています"
3890 play ""
3900 play Voice_File_TopScreen$+"Voice_Entry_OK.mp3"
3910 print chr$(13)
3920 color rgb(255,0,0)
3930 print moji$;"は、登録されています。" + chr$(13)
3940 color rgb(0,0,0)
3950 print "エンターキーを押してください"
3960 key$=input$(1)
3970 if key$=chr$(13) then goto TopScreen:
3980 count = count + 1
3990 endif
4000 next n
4010 if count = 0 then
4020 cls 3:font 48
4030 gload Gazo$ + "Moji_check.png"
4040 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
4050 print chr$(13)
4060 color rgb(255,0,0)
4070 print moji$;"は、登録されていません。" + chr$(13)
4080 color rgb(0,0,0)
4090 print "エンターキーを押してください" + chr$(13)
4100 key$=input$(1)
4110 if key$=chr$(13) then goto TopScreen:
4120 endif
4130 endif
4140 Surei_Result2:
4150 cls 3:Font 48
4160 zcount1=0:zcount2=0:count1=0:count2=0
4170 '1人目
4180 mojicount1=len(buf_Parson1$)
4190 '2人目
4200 mojicount2=len(buf_Parson2$)
4210 '1人目
4220 for n=1 to mojicount1
4230 for j=1 to 116
4240 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
4250 if bufcount1$(n-1) = bufline$(2*j) then
4260 zcount1 = zcount1 + 1
4270 endif
4280 next j
4290 next n
4300 '2人目
4310 for n=1 to mojicount2
4320 for j=1 to 116
4330 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
4340 if bufcount2$(n-1) = bufline$(2*j) then
4350 zount2 = zcount2 + 1
4360 endif
4370 next j
4380 next n
4390 '1人目
4400 for i=1 to mojicount1
4410 bufcount1$(i-1)=Mid$(buf_Parson1$,i,1)
4420 p1=Complate(bufcount1$(i-1))
4430 count1 = count1 + p1
4440 next i
4450 '2人目
4460 for i=1 to mojicount2
4470 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
4480 p2 = Complate(bufcount2$(i-1))
4490 count2 = count2 + p2
4500 next i
4510 cls 3:
4520 gload Gazo$ + "Screen1.png"
4530 color rgb(255,0,0)
4540 print "数霊 2人用 結果表示"+chr$(13)
4550 color rgb(255,255,255)
4560 print "1人目:";buf_Parson1$;chr$(13)
4570 print "数霊1:";count1;chr$(13)
4580 print "2人目:";buf_Parson2$;chr$(13)
4590 print "数霊2:";count2;chr$(13)
4600 print "数霊(合計):";count1 + count2;chr$(13)
4610 color rgb(0,0,0)
4620 print "エンターキーを押してください" + chr$(13)
4630 key$=input$(1)
4640 if key$=chr$(13) then goto TopScreen:
4650 Surei_Result3:
4660 cls 3:Font 48
4670 zcount2 = 0:count2 = 0
4680 mojicount2 = len(buffer_moji2$)
4690 for n=1 to mojicount2
4700 for j=1 to 116
4710 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
4720 if bufcount2$(n - 1) = bufline$(2 * j) then
4730 zcount2 = zcount2 + 1
4740 endif
4750 next j
4760 next n
4770 for i=1 to mojicount2
4780 n2 = Complate(bufcount2$(i-1))
4790 count2 = count2 + n2
4800 next i
4810 gload Gazo$ + "Screen5.png"
4820 color rgb(255,0,0)
4830 print "数霊の結果表示" + chr$(13)
4840 color rgb(255,255,255)
4850 print "１回目回の文字入力:";buffer_moji$;chr$(13)
4860 print "１回目の数霊(かずたま)";count;chr$(13)
4870 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
4880 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
4890 color rgb(0,0,0)
4900 print "エンターキー:トップ画面";chr$(13)
4910 print "c or C キー:数霊の比較";chr$(13)
4920 key$ = input$(1)
4930 if key$ = chr$(13) then mode=0:count=0:count2=0:goto TopScreen:
4940 if key$ = "c" or key$ = "C" then
4950 if count = count2 then
4960 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
4970 else
4980 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
4990 endif
5000 endif
5010 Moji_Count_Check:
5020 cls 3:Font 48
5030 gload Gazo$ + "Moji_check.png"
5040 n=0
5050 open FILE_csv$ for input as #1
5060 while eof(1)=0
5070 line input #1, line$
5080 n = n + 1
5090 wend
5100 close #1
5110 'n = n - 1
5120 'talk "登録文字数は"+str$(n)+"文字です"
5130 play ""
5140 if n = 118 then
5150 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
5160 else
5170 talk"登録文字数は、"+str$(n)+"文字です"
5180 endif
5190 print "" + chr$(13)
5200 color rgb(255,0,0)
5210 print "文字の登録文字数は";n;"文字" + chr$(13)
5220 color rgb(0,0,0)
5230 print "エンターキーを押してください"+chr$(13)
5240 key$ = input$(1)
5250 if key$ = chr$(13) then
5260 goto TopScreen:
5270 else
5280 goto Moji_Count_Check:
5290 endif
5300 'Save 関数
5310 func Save()
5320 open "data/Parsonal_list1.csv" for append as #1
5330 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
5340 close #1
5350 endfunc
5360 Select_moji:
5370 cls 3:font 48
5380 gload Gazo$ + "Screen1_mojicheck.png"
5390 if flag=1 then talk"無効な数字です、入れ直してください.":flag = 0
5400 color rgb(255,0,0)
5410 'print "文字の確認" + chr$(13)
5420 print chr$(13)
5430 color rgb(255,255,255)
5440 print "番号を選んでください" + chr$(13)
5450 print "1.文字検索"+chr$(13)
5460 print "2.登録文字の確認" + chr$(13)
5470 print "3.前の画面に戻る" + chr$(13)
5480 print "4.終　了" + chr$(13)
5490 color rgb(0,0,0)
5500 Input "番号:",No
5510 if No=1 then goto Moji_Search:
5520 if No=2 then goto Moji_Count_Check:
5530 if No=3 then goto TopScreen:
5540 if No=4 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":ui_msg "プログラムを終了します":pause 2.053*1000:cls 3:end
5550 if (No>4 or No=0) then play"":flag=1:ui_msg"無効な数字です":goto Select_moji:
5560 '
5570 Kakunin_Surei_count:
5580 cls 3:font 48
5590 gload Gazo$ + "Kazutama_List_Top.png"
5600 if flag=1 then talk"無効な数字です、入れ直してください":flag=0
5610 color rgb(255,0,0)
5620 'print "数霊の確認" + chr$(13)
5630 print chr$(13)
5640 color rgb(255,255,255)
5650 print "番号を選んでください" + chr$(13)
5660 print "1.数霊リスト 1人用" + chr$(13)
5670 print "2.数霊リスト 2人用:未実装" + chr$(13)
5680 print "3.トップ画面に行く" + chr$(13)
5690 print "4.終 了" + chr$(13)
5700 color rgb(0,0,0)
5710 Input "番号:",No
5720 if No=3 then goto TopScreen:
5730 if No=4 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
5740 if No=1 then goto Surei_List1:
5750 if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
5760 if (No=0 or No>4) then play"":flag=1:ui_msg"無効な文字です":goto Kakunin_Surei_count:
5770 Surei_List1:
5780 cls 3:font 48
5790 if dir$ = "data/Parsonal_list1.csv" then
5800 cls 3:print"登録ファイルがございません" + chr$(13)
5810 else
5820 buffer_list_count=Loadcount()
5830 talk"登録件数は"+str$(buffer_list_count)+"件です"
5840 gload Gazo$ + "KazutamaList1_Entry.png"
5850 color rgb(0,0,255)
5860 'print"数霊リスト  登録件数" + chr$(13)
5870 print chr$(13)
5880 color rgb(255,0,0)
5890 print "登録件数:";buffer_list_count;"件";chr$(13)
5900 color rgb(0,0,0)
5910 print "エンターキーを押してください"+chr$(13)
5920 key$=input$(1)
5930 if key$=chr$(13) then
5940 goto KotodamaList_page:
5950 else
5960 goto Surei_List1:
5970 endif
5980 endif
5990 func Loadcount()
6000 n = 0
6010 open "data/Parsonal_list1.csv" for input as #1
6020 while eof(1) = 0
6030 line input #1,line$
6040 n = n + 1
6050 wend
6060 close #1
6070 count_line = n
6080 endfunc count_line
6090 func Kotodama$(buf$)
6100 b = len("数霊:")
6110 a$ = Mid$(buf$,b+1,len(buf$))
6120 for i=0 to 118
6130 if bufline3$(2 * i) ="数霊:" + a$  then
6140 moji_$ = bufline3$(2*i + 1)
6150 'moji_$ = bufline3$(21)
6160 'moji$ = a$
6170 endif
6180 next i
6190 'kotodama$ = a$
6200 kotodama$ = moji_$
6210 endfunc kotodama$
6220 KotodamaList_page:
6230 cls 3:font 48:m = 0
6240 gload Gazo$ + "Screen5_Surei_List.png"
6250 open "data/Parsonal_list1.csv" for input as #1
6260 while eof(1) = 0
6270 input #1,line$
6280 bufKaztama$(m) = line$
6290 'input #1,line$
6300 'bufKaztama$(m,2*m + 1) = line$
6310 m = m + 1
6320 wend
6330 close #1
6340 l = 0:
6350 while buffer_list_count > l
6360 cls
6370 color rgb(255,0,0)
6380 'print "数霊　リスト" + chr$(13)
6390 print chr$(13)
6400 color rgb(255,255,255)
6410 n3 = l:n3 = n3 + 1
6420 print "番号:";n3;chr$(13)
6430 print bufKaztama$(2*l) + chr$(13)
6440 print bufKaztama$(2*l + 1) + chr$(13)
6450 'Kmoji$ = Kotodama$(str$(36))
6460 Kmoji$=moji$
6470 print chr$(13) + chr$(13)
6480 color rgb(0,0,0)
6490 print "スペース:次へ行く" + chr$(13)
6500 print "エンターキー:トップ画面" + chr$(13)
6510 key$ = input$(1)
6520 if key$ = " " then
6530 l = ((l + 1) Mod buffer_list_count)
6540 else
6550 if key$ = chr$(13) then
6560 goto TopScreen:
6570 else
6580 goto KotodamaList_page:
6590 endif
6600 endif
6610 wend
6620 '
6630 '結果表示２ Menu1
6640 Surei_Result4:
6650 cls 3:font (48 - 16)
6660 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
6670 for i=0 to 181 + 3 - 1
6680 if i = count  then
6690 buffer$ = bufline2$(count + 4,0)
6700 endif
6710 next i
6720 if len(buffer$) > 23 and len(buffer$) <= 44 then
6730 buffer2$ = Mid$(buffer$,1,22)
6740 buffer3$ = Mid$(buffer$,23,(len(buffer$) - 23))
6750 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)
6760 else
6770 if len(buffer$) <= 22 then
6780 buffer2$ = Mid$(buffer$,1,22)
6790 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
6800 else
6810 if len(buffer$) > 44 and len(buffer$) <= 63 then
6820 buffer2$ = Mid$(buffer$,1,22)
6830 buffer3$ = Mid$(buffer$,23,20)
6840 buffer4$ = Mid$(buffer$,43,(len(buffer$)-43))
6850 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)+chr$(13)
6860 else
6870 if len(buffer$) > 63 and len(buffer$) <= 81 then
6880 buffer2$ = Mid$(buffer$,1,21)
6890 buffer3$ = Mid$(buffer$,22,20)
6900 buffer4$ = Mid$(buffer$,42,20)
6910 buffer5$ = Mid$(buffer$,62,(len(buffer$)-62))
6920 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13) + chr$(13) + chr$(13)
6930 if len(buffer$) > 81 and len(buffer$) <= 110 then
6940 buffer2$ = Mid$(buffer$,1,21)
6950 buffer3$ = Mid$(buffer$,22,20)
6960 buffer4$ = Mid$(buffer$,42,20)
6970 buffer5$ = Mid$(buffer$,62,20)
6980 buffer6$ = Mid$(buffer$,82,(len(buffer$) - 82))
6990 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13) + chr$(13) + chr$(13)
7000 endif
7010 endif
7020 endif
7030 endif
7040 endif
7050 'cls 3
7060 gload Gazo$ + "Screen1_Result2.png"
7070 color rgb(255,0,0)
7080 'print "診断結果 2" + chr$(13)
7090 print chr$(13)
7100 color rgb(127,255,212)
7110 print "入力文字:";buffer_moji$;chr$(13)
7120 print "数霊:";count;chr$(13)
7130 color rgb(255,255,255)
7140 print "数霊の説明:"+chr$(13)
7150 print buffer$
7160 color rgb(0,0,0)
7170 print "エンターキー:トップ,S:保存する" + chr$(13)
7180 key$=input$(1)
7190 if key$ = chr$(13) then
7200 buffer$="" : buffer_moji$="" : count=0:goto TopScreen:
7210 else
7220 if key$="s" or key$="S" then
7230 s=Save():ui_msg"保存しました":goto Surei_Result4:
7240 else
7250 talk"無効な文字です":goto Surei_Result4:
7260 endif
7270 endif
