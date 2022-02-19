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
300 Version$ = "1.0.2.2022.02.20(正式版)"
310 'csvファイル 1.数霊 ベースファイル
320 FILE_csv$ = "data/Kazutama.csv"
330 'csvファイル 2.数霊 ベースファイル 2
340 FILE_csv2$ = "data/Surei_chart_20211207.csv"
350 'gazo ファイル
360 Gazo$ = "data/Gazo/"
370 'Sound File(Voice)
380 '1.ボイス TopScreen
390 Voice_File_TopScreen$ = "data/Sound_data/"
400 '変数領域
410 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50)
420 count2 = 0:N=0:N2=0:m2 = 0
430 'ファイルの有無チェック
440 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
450 '1.ファイルが無いとき
460 cls :print "依存ファイルが見つかりません":
470 print "エンターキーを押してください"+chr$(13)
480 key$ = input$(1)
490 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
500 else
510 '2.ファイルが有るとき
520 cls:print "csv:file ok." + chr$(13)
530 n=0
540 open FILE_csv$ for input as #1
550 while eof(1) = 0
560 input #1,line$
570 'print line$
580 bufline$(n) = line$
590 'Print n;chr$(13)
600 n = n + 1
610 wend
620 close #1
630 N=n
640 '2つ目のファイル読み込み
650 'n = 0
660 open FILE_csv2$ for input as #2
670 for n=3 to 181
680 for i=0 to 1
690 input #2,line$
700 bufline2$(n,i) = line$
710 'print bufline2$(n,i)
720 next i
730 next n
740 close #2
750 N2 = n
760 '
770 endif
780 'or j = 3 to 181+3
790 'ufline3$(j - 3,n) = bufline2$(i,n)
800 'next j
810 'moji$ = Kotodama$(bufline3$(16))
820 'erase bufline2$
830 'Top画面
840 TopScreen:
850 cls 3:font 48
860 play ""
870 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
880 gload Gazo$ + "Screen1_Top_20211226.png"
890 color rgb(0,0,255)
900 print chr$(13)
910 'print "●Top画面" + chr$(13)
920 color rgb(255,255,255)
930 print "番号を選んでください" + chr$(13)
940 print "1.数霊(かずたま)チェック" + chr$(13)
950 print "2.設定" + chr$(13)
960 print "3.ヘルプ" + chr$(13)
970 print "4.終　了" + chr$(13)
980 color rgb(0,0,0)
990 Input "番号:",No
1000 if No=1 then goto Surei_Check:
1010 if No=3 then Color rgb(255,255,255):goto Help:
1020 if No=4 then cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
1030 if No=2 then color rgb(255,255,255):goto Setting:
1040 if N0=0 or No>4 then goto TopScreen:
1050 '1-1.数霊チェック
1060 Surei_Check:
1070 cls 3:Font 48
1080 'gload Gazo$ + "Screen4.png"
1090 gload Gazo$ + "Screen1_Sureicheck_Top20211226.png"
1100 play ""
1110 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
1120 color rgb(255,0,0)
1130 'print "●数霊(かずたま)チェックトップ" + chr$(13)
1140 print chr$(13)
1150 color rgb(255,255,255)
1160 print "番号を選んでください"+chr$(13)
1170 print "1.数霊(かずたま)チェック(1人)" + chr$(13)
1180 print "2.数霊(かずたま)チェック(2人)" + chr$(13)
1190 print "3.前の画面に戻る" + chr$(13)
1200 print "4.終 了" + chr$(13)
1210 color rgb(0,0,0)
1220 Input "番号:",No
1230 '前の画面に戻る
1240 if No = 3 then goto TopScreen:
1250 'プログラムの終了
1260 if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":COLOR rgb(255,255,255):end
1270 '1人用
1280 if No = 1 then goto Surei_Input:
1290 '2人用
1300 if No = 2 then goto Surei_twoParson:
1310 if No > 4 or No=0 then ui_msg"もう一度入れてください":goto Surei_Check:
1320 '数霊(かずたま) 文字入力  1人用
1330 Surei_Input:
1340 if mode = 0 then
1350 cls 3:font 32
1360 gload Gazo$ + "InputKotodama_20211226.png"
1370 play""
1380 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
1390 color rgb(255,0,0)
1400 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
1410 print chr$(13)
1420 color rgb(0,0,0)
1430 print "文字を入れてください" + chr$(13)
1440 color rgb(255,0,0)
1450 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)"+chr$(13)
1460 print chr$(13)
1470 color rgb(0,0,0)
1480 Input "入力文字:",buffer_moji$
1490 goto Surei_Result:
1500 else
1510 if mode = 1 then
1520 cls 3:Font 32
1530 gload Gazo$ + "InputKotodama.png"
1540 color rgb(255,0,0)
1550 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
1560 color rgb(255,255,255)
1570 print "文字を入れてください" + chr$(13)
1580 color rgb(255,0,0)
1590 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
1600 print "大文字のみ)" + chr$(13)
1610 color rgb(0,0,0)
1620 Input "文字入力:",buffer_moji2$
1630 goto Surei_Result3:
1640 endif
1650 endif
1660 '数霊(かずたま)文字入力　2人用
1670 Surei_twoParson:
1680 cls 3:Font 32
1690 gload Gazo$ + "InputKotodama_20211226.png"
1700 '1人目入力
1710 'color rgb(255,0,0)
1720 print ""+chr$(13)
1730 'print "●数霊(かずたま) 1人目 入力" + chr$(13)
1740 color rgb(255,0,0)
1750 print "1人目の文字を入れてください" + chr$(13)
1760 color rgb(255,0,0)
1770 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
1780 color rgb(0,0,0)
1790 print chr$(13)
1800 Input "1人目文字入力:",buf_Parson1$
1810 Surei_twoParson2:
1820 cls 3:Font 32
1830 '2人目入力
1840 gload Gazo$ + "InputKotodama_20211226.png"
1850 'color rgb(255,0,0)
1860 'print "●数霊(かずたま) 2人目 入力" + chr$(13)
1870 print ""+chr$(13)
1880 print "2人目の文字を入れてください" + chr$(13)
1890 color rgb(255,0,0)
1900 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
1910 color rgb(0,0,0)
1920 Input "2人目の文字入力:",buf_Parson2$
1930 goto Surei_Result2:
1940 '数霊　計算 パート
1950 '文字の計算関数
1960 'moji$:1文字を入れる
1970 func Complate(moji$)
1980 for n = 1 to 116
1990 if moji$ = bufline$(2*n) then
2000 buffcount = val(bufline$(2 * n + 1))
2010 endif
2020 next n
2030 endfunc buffcount
2040 '数霊　結果表示
2050 Surei_Result:
2060 cls 3:Font 32
2070 'ゼロカウント:zcount
2080 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
2090 '例 アカい:"い"の文字は無効な文字なので、はじく
2100 zcount=0
2110 'mojicount:入力文字数
2120 mojicount = len(buffer_moji$)
2130 for n=1 to mojicount
2140 for j=1 to 118
2150 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
2160 if bufcount$(n - 1) = bufline$(2 * j) then
2170   zcount = zcount + 1
2180 endif
2190 next j
2200 next n
2210 if mojicount > zcount then
2220 cls 3:ui_msg "無効な文字です":talk"無効な文字があります。":zcount = 0:goto Surei_Input:
2230 endif
2240 for i = 1 to mojicount
2250 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
2260 n1 = Complate(bufcount$(i - 1))
2270 count = count + n1
2280 next i
2290 '182以上のとき,181を引く
2300 if (count > 181) then count = count - 181
2310 cls 3:Font 48+16
2320 gload Gazo$ + "Result_Screen3_20211226.png"
2330 color rgb(255,0,0)
2340 print "入力文字:" + buffer_moji$ + chr$(13)
2350 'print chr$(13)
2360 color rgb(0,0,255)
2370 print "数霊(かずたま):";count;chr$(13)
2380 color rgb(0,0,0)
2390 print "エンターキー:トップ" + chr$(13)
2400 print "スペース:次 へ" + chr$(13)
2410 key$ = input$(1)
2420 if key$ = " " then goto Surei_Result4:
2430 if key$ = chr$(13) then
2440 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
2450 for i=0 to 9
2460 bufcount$(i) = " "
2470 next i
2480 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
2490 'else
2500 'if key$ = " " then
2510 '２回めの入力に行く
2520 'mode = 1:goto Surei_Input:
2530 'else
2540 'if key$ = "s" or key$ = "S" then
2550 'ファイルを保存する
2560 's = Save()
2570 'ui_msg"保存しました"
2580 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
2590 else
2600 goto Surei_Result:
2610 'endif
2620 endif
2630 '3-1 バージョン情報
2640 Version:
2650 cls 3:Font 32
2660 gload Gazo$ + "Screen1_Version.png"
2670 play ""
2680 play Voice_File_TopScreen$ + "Voice_Version.mp3"
2690 color rgb(255,0,0)
2700 'print"●バージョン情報"+chr$(13)
2710 print chr$(13)
2720 color rgb(255,255,255)
2730 print "Ver:";Version$ + chr$(13)
2740 print "アプリ名:数霊"+ chr$(13)
2750 print "for Basic for Android"+chr$(13)
2760 print "Author:licksjp"+chr$(13)
2770 print "制作開始:2021.7.28" + chr$(13)
2780 print chr$(13)
2790 print "(C)Copy right licksjp " + chr$(13)
2800 print "All rights reserved" + chr$(13)
2810 color rgb(0,0,0)
2820 print "エンターキーを押してください" + chr$(13)
2830 key$ = input$(1)
2840 if key$ = chr$(13) then
2850 goto TopScreen:
2860 else
2870 talk "無効なキーです":goto Version:
2880 endif
2890 '3-2 参考文献
2900 Reference_Book:
2910 cls 3:Font 48:play""
2920 gload Gazo$ + "Screen1_Reference.png"
2930 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
2940 color rgb(255,0,0)
2950 'print"●参考文献" + chr$(13)
2960 print chr$(13)
2970 color rgb(255,255,255)
2980 print "書名:数霊" + chr$(13)
2990 print "出版社:徳間書店" + chr$(13)
3000 print "ISBN:978-4-19-" + chr$(13)
3010 print "         865309-5" + chr$(13)
3020 print "定価:2300円 + 税" + chr$(13)
3030 color rgb(0,0,0)
3040 print "エンターキーを押してください"
3050 key$=input$(1)
3060 if key$=chr$(13) then
3070 goto TopScreen:
3080 else
3090 talk"無効なキーです":goto Reference_Book:
3100 endif
3110 'ヘルプ画面　トップ画面
3120 Help:
3130 play ""
3140 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
3150 cls 3:Font 48:
3160 gload Gazo$ + "Screen1_Help_Top.png"
3170 color rgb(255,0,0)
3180 'print "●3.ヘルプ　トップ画面" + chr$(13)
3190 print chr$(13)
3200 color rgb(255,255,255)
3210 print "番号を選んでください" + chr$(13)
3220 print "1.バージョン" + chr$(13)
3230 print "2.参考文献" + chr$(13)
3240 print "3.トップ画面" + chr$(13)
3250 print "4.終 了" + chr$(13)
3260 color rgb(0,0,0)
3270 Input "番号:",No
3280 if No=1 then goto Version:
3290 if No=3 then goto TopScreen:
3300 if No=2 then goto Reference_Book:
3310 if No=4 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
3320 if (No = 0 or No > 4) then ui_msg"もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
3330 '登録文字の確認
3340 '文字を1文字入れて登録されているか調べるメニュー
3350 '設定項目
3360 Setting:
3370 cls 3:Font 48
3380 gload Gazo$ + "Screen1_Setting_Top.png"
3390 play ""
3400 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
3410 color rgb(0,0,255)
3420 'print "●設定項目" + chr$(13)
3430 print chr$(13)
3440 color rgb(255,255,255)
3450 print "番号を選んでください" + chr$(13)
3460 print "1.登録文字の確認" + chr$(13)
3470 print "2.数霊文字確認" + chr$(13)
3480 print "3.トップ画面に行く" + chr$(13)
3490 print "4.終 了" + chr$(13)
3500 color rgb(0,0,0)
3510 Input "番号:",No
3520 if No=3 then goto TopScreen:
3530 if No=1 then goto Select_moji:
3540 if No=2 then goto Kakunin_Surei_count:
3550 if No=4 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
3560 if No > 4 or No=0 then goto Setting:
3570 '文字検索項目  ここから
3580 Moji_Search:
3590 cls 3:Font 32+16
3600 gload Gazo$ + "Moji_Search_Result.png"
3610 play ""
3620 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
3630 print "" + chr$(13)
3640 color rgb(255,0,0)
3650 print "文字を一文字入れてください" + chr$(13)
3660 color rgb(0,0,0)
3670 Input "登録文字:",moji$
3680 moji_count = len(moji$)
3690 if moji_count > 1 then
3700 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
3710 else
3720 count=0
3730 for n = 0 to 116
3740 if bufline$(2*n) = moji$ then
3750 cls 3:font 48
3760 gload Gazo$ + "Moji_Search_Result.png"
3770 'talk"この文字は登録されています"
3780 play ""
3790 play Voice_File_TopScreen$+"Voice_Entry_OK.mp3"
3800 print chr$(13)
3810 color rgb(255,0,0)
3820 print moji$;"は、登録されています。" + chr$(13)
3830 color rgb(0,0,0)
3840 print "エンターキーを押してください"
3850 key$=input$(1)
3860 if key$=chr$(13) then goto TopScreen:
3870 count = count + 1
3880 endif
3890 next n
3900 if count = 0 then
3910 cls 3:font 48
3920 gload Gazo$ + "Moji_check.png"
3930 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
3940 print chr$(13)
3950 color rgb(255,0,0)
3960 print moji$;"は、登録されていません。" + chr$(13)
3970 color rgb(0,0,0)
3980 print "エンターキーを押してください" + chr$(13)
3990 key$=input$(1)
4000 if key$=chr$(13) then goto TopScreen:
4010 endif
4020 endif
4030 Surei_Result2:
4040 cls 3:Font 48
4050 zcount1=0:zcount2=0:count1=0:count2=0
4060 '1人目
4070 mojicount1=len(buf_Parson1$)
4080 '2人目
4090 mojicount2=len(buf_Parson2$)
4100 '1人目
4110 for n=1 to mojicount1
4120 for j=1 to 116
4130 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
4140 if bufcount1$(n-1) = bufline$(2*j) then
4150 zcount1 = zcount1 + 1
4160 endif
4170 next j
4180 next n
4190 '2人目
4200 for n=1 to mojicount2
4210 for j=1 to 116
4220 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
4230 if bufcount2$(n-1) = bufline$(2*j) then
4240 zount2 = zcount2 + 1
4250 endif
4260 next j
4270 next n
4280 '1人目
4290 for i=1 to mojicount1
4300 bufcount1$(i-1)=Mid$(buf_Parson1$,i,1)
4310 p1=Complate(bufcount1$(i-1))
4320 count1 = count1 + p1
4330 next i
4340 '2人目
4350 for i=1 to mojicount2
4360 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
4370 p2 = Complate(bufcount2$(i-1))
4380 count2 = count2 + p2
4390 next i
4400 cls 3:
4410 gload Gazo$ + "Screen1_2Parson_Result.png"
4420 color rgb(255,0,0)
4430 'print "数霊 2人用 結果表示"+chr$(13)
4440 print ""+chr$(13)
4450 color rgb(255,255,255)
4460 print "1人目:";buf_Parson1$;chr$(13)
4470 print "数霊1:";count1;chr$(13)
4480 print "2人目:";buf_Parson2$;chr$(13)
4490 print "数霊2:";count2;chr$(13)
4500 print "数霊(合計):";count1 + count2;chr$(13)
4510 color rgb(0,0,0)
4520 print "エンターキーを押してください" + chr$(13)
4530 key$=input$(1)
4540 if key$=chr$(13) then goto TopScreen:
4550 Surei_Result3:
4560 cls 3:Font 48
4570 zcount2 = 0:count2 = 0
4580 mojicount2 = len(buffer_moji2$)
4590 for n=1 to mojicount2
4600 for j=1 to 116
4610 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
4620 if bufcount2$(n - 1) = bufline$(2 * j) then
4630 zcount2 = zcount2 + 1
4640 endif
4650 next j
4660 next n
4670 for i=1 to mojicount2
4680 n2 = Complate(bufcount2$(i-1))
4690 count2 = count2 + n2
4700 next i
4710 gload Gazo$ + "Screen5.png"
4720 color rgb(255,0,0)
4730 print "数霊の結果表示" + chr$(13)
4740 color rgb(255,255,255)
4750 print "１回目回の文字入力:";buffer_moji$;chr$(13)
4760 print "１回目の数霊(かずたま)";count;chr$(13)
4770 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
4780 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
4790 color rgb(0,0,0)
4800 print "エンターキー:トップ画面";chr$(13)
4810 print "c or C キー:数霊の比較";chr$(13)
4820 key$ = input$(1)
4830 if key$ = chr$(13) then mode=0:count=0:count2=0:goto TopScreen:
4840 if key$ = "c" or key$ = "C" then
4850 if count = count2 then
4860 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
4870 else
4880 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
4890 endif
4900 endif
4910 Moji_Count_Check:
4920 cls 3:Font 48
4930 gload Gazo$ + "Moji_check.png"
4940 n=0
4950 open FILE_csv$ for input as #1
4960 while eof(1)=0
4970 line input #1, line$
4980 n = n + 1
4990 wend
5000 close #1
5010 'n = n - 1
5020 'talk "登録文字数は"+str$(n)+"文字です"
5030 play ""
5040 if n = 118 then
5050 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
5060 else
5070 talk"登録文字数は、"+str$(n)+"文字です"
5080 endif
5090 print "" + chr$(13)
5100 color rgb(255,0,0)
5110 print "文字の登録文字数は";n;"文字" + chr$(13)
5120 color rgb(0,0,0)
5130 print "エンターキーを押してください"+chr$(13)
5140 key$ = input$(1)
5150 if key$ = chr$(13) then
5160 goto TopScreen:
5170 else
5180 goto Moji_Count_Check:
5190 endif
5200 'Save 関数
5210 func Save()
5220 open "data/Parsonal_list1.csv" for append as #1
5230 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
5240 close #1
5250 endfunc
5260 Select_moji:
5270 cls 3:font 48
5280 gload Gazo$ + "Screen1_mojicheck.png"
5290 color rgb(255,0,0)
5300 'print "文字の確認" + chr$(13)
5310 print chr$(13)
5320 color rgb(255,255,255)
5330 print "番号を選んでください" + chr$(13)
5340 print "1.登録文字検索"+chr$(13)
5350 print "2.登録文字数の確認" + chr$(13)
5360 print "3.前の画面に戻る" + chr$(13)
5370 print "4.終　了" + chr$(13)
5380 color rgb(0,0,0)
5390 Input "番号:",No
5400 if No=1 then goto Moji_Search:
5410 if No=2 then goto Moji_Count_Check:
5420 if No=3 then goto TopScreen:
5430 if No=4 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":cls 3:end
5440 if No=0 or No>4 then goto Select_moji
5450 '
5460 Kakunin_Surei_count:
5470 cls 3:font 48
5480 gload Gazo$ + "Kazutama_List_Top.png"
5490 color rgb(255,0,0)
5500 'print "数霊の確認" + chr$(13)
5510 print chr$(13)
5520 color rgb(255,255,255)
5530 print "番号を選んでください" + chr$(13)
5540 print "1.数霊リスト 1人用" + chr$(13)
5550 'print "2.数霊リスト 2人用:未実装" + chr$(13)
5560 print "2.トップ画面に行く" + chr$(13)
5570 print "3.終 了" + chr$(13)
5580 print ""+chr$(13)
5590 color rgb(0,0,0)
5600 Input "番号:",No
5610 if No=2 then goto TopScreen:
5620 if No=3 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
5630 if No=1 then goto Surei_List1:
5640 if No > 3 or No=0 then ui_msg"無効な数字です、入れ直してください":talk"無効な数字です":goto Kakunin_Surei_count:
5650 'if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
5660 Surei_List1:
5670 cls 3:font 48
5680 if dir$("data/Parsonal_list1.csv") = ""  then
5690 cls 3
5700 gload "data/Gazo/"+"KazutamaList1.png"
5710 print chr$(13)
5720 color rgb(255,0,0):print"登録ファイルはございません" + chr$(13)
5730 color rgb(0,0,0):print "スペースキーを押してください" + chr$(13)
5740 key$=input$(1)
5750 if key$ = " " then goto TopScreen:
5760 else
5770 'cls 3:print"登録ファイルがございません" + chr$(13)
5780 'else
5790 cls 3:buffer_list_count=Loadcount()
5800 talk"登録件数は"+str$(buffer_list_count)+"件です"
5810 gload Gazo$ + "KazutamaList1_Entry.png"
5820 color rgb(0,0,255)
5830 'print"数霊リスト  登録件数" + chr$(13)
5840 print chr$(13)
5850 color rgb(255,0,0)
5860 print "登録件数:";buffer_list_count;"件";chr$(13)
5870 color rgb(0,0,0)
5880 print "エンターキーを押してください" + chr$(13)
5890 key$ = input$(1)
5900 if key$ = chr$(13) then
5910 goto KotodamaList_page:
5920 'else
5930 'goto Surei_List1:
5940 endif
5950 'endif
5960 endif
5970 func Loadcount()
5980 n = 0
5990 open "data/Parsonal_list1.csv" for input as #1
6000 while eof(1) = 0
6010 line input #1,line$
6020 n = n + 1
6030 wend
6040 close #1
6050 count_line = n
6060 endfunc count_line
6070 func Kotodama$(buf$)
6080 b = len("数霊:")
6090 a$ = Mid$(buf$,b+1,len(buf$))
6100 for i=0 to 118
6110 if bufline3$(2 * i) ="数霊:" + a$  then
6120 moji_$ = bufline3$(2*i + 1)
6130 'moji_$ = bufline3$(21)
6140 'moji$ = a$
6150 endif
6160 next i
6170 'kotodama$ = a$
6180 kotodama$ = moji_$
6190 endfunc kotodama$
6200 KotodamaList_page:
6210 cls 3:font 48:m = 0
6220 gload Gazo$ + "Screen5_Surei_List.png"
6230 open "data/Parsonal_list1.csv" for input as #1
6240 while eof(1) = 0
6250 input #1,line$
6260 bufKaztama$(m) = line$
6270 'input #1,line$
6280 'bufKaztama$(m,2*m + 1) = line$
6290 m = m + 1
6300 wend
6310 close #1
6320 l = 0:
6330 while buffer_list_count > l
6340 cls
6350 color rgb(255,0,0)
6360 'print "数霊　リスト" + chr$(13)
6370 print chr$(13)
6380 color rgb(255,255,255)
6390 n3 = l:n3 = n3 + 1
6400 print "番号:";n3;chr$(13)
6410 print bufKaztama$(2*l) + chr$(13)
6420 print bufKaztama$(2*l + 1) + chr$(13)
6430 'Kmoji$ = Kotodama$(str$(36))
6440 Kmoji$=moji$
6450 print chr$(13) + chr$(13)
6460 color rgb(0,0,0)
6470 print "スペース:次へ行く" + chr$(13)
6480 print "エンターキー:トップ画面" + chr$(13)
6490 key$ = input$(1)
6500 if key$ = " " then
6510 l = ((l + 1) Mod buffer_list_count)
6520 else
6530 if key$ = chr$(13) then
6540 goto TopScreen:
6550 else
6560 goto KotodamaList_page:
6570 endif
6580 endif
6590 wend
6600 '
6610 '結果表示２ Menu1
6620 Surei_Result4:
6630 cls 3:font (48-16)
6640 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
6650 for i=0 to 181 + 3 - 1
6660 if i = count  then
6670 buffer$ = bufline2$(count + 4,0)
6680 endif
6690 next i
6700 if len(buffer$) > 23 and len(buffer$) <= 45 then
6710 buffer2$ = Mid$(buffer$,1,24)
6720 buffer3$ = Mid$(buffer$,25,(len(buffer$) - 25))
6730 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)
6740 else
6750 if len(buffer$) <= 23 then
6760 buffer2$ = Mid$(buffer$,1,22)
6770 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
6780 else
6790 if len(buffer$) > 45 and len(buffer$) <= 64 then
6800 buffer2$ = Mid$(buffer$,1,22)
6810 buffer3$ = Mid$(buffer$,23,20)
6820 buffer4$ = Mid$(buffer$,43,(len(buffer$)-43))
6830 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)+chr$(13)
6840 else
6850 if len(buffer$) > 64 and len(buffer$) <= 81 then
6860 buffer2$ = Mid$(buffer$,1,23)
6870 buffer3$ = Mid$(buffer$,24,20)
6880 buffer4$ = Mid$(buffer$,42,20)
6890 buffer5$ = Mid$(buffer$,63,(len(buffer$)-62))
6900 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13) + chr$(13) + chr$(13)
6910 if len(buffer$) > 81 and len(buffer$) <= 110 then
6920 buffer2$ = Mid$(buffer$,1,21)
6930 buffer3$ = Mid$(buffer$,22,20)
6940 buffer4$ = Mid$(buffer$,42,20)
6950 buffer5$ = Mid$(buffer$,62,20)
6960 buffer6$ = Mid$(buffer$,82,(len(buffer$) - 82))
6970 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13) + chr$(13) + chr$(13)
6980 endif
6990 endif
7000 endif
7010 endif
7020 endif
7030 'cls 3
7040 gload Gazo$ + "Screen1_Result2.png"
7050 color rgb(255,0,0)
7060 'print "診断結果 2" + chr$(13)
7070 print chr$(13)
7080 color rgb(127,255,212)
7090 print "入力文字:";buffer_moji$;chr$(13)
7100 print "数霊:";count;chr$(13)
7110 color rgb(255,255,255)
7120 print "数霊の説明:"+chr$(13)
7130 print buffer$
7140 color rgb(0,0,0)
7150 print "エンターキー:トップ,S:保存する" + chr$(13)
7160 key$=input$(1)
7170 if key$ = chr$(13) then
7180 buffer$="" : buffer_moji$="" : count=0:goto TopScreen:
7190 else
7200 if key$="s" or key$="S" then
7210 s=Save():ui_msg"保存しました":goto Surei_Result4:
7220 else
7230 talk"無効な文字です":goto Surei_Result4:
7240 endif
7250 endif
