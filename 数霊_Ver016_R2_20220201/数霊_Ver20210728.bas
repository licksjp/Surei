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
280 'Version 0.1.6_2022.01.28 - 2022.01.31 (Release2):R2
290 Version$ = "0.1.6.2022.02.01(R2)"
300 'csvファイル 1.数霊 ベースファイル
310 FILE_csv$ = "data/Kazutama.csv"
320 'csvファイル 2.数霊 ベースファイル 2
330 FILE_csv2$ = "data/Surei_chart_20211207.csv"
340 'gazo ファイル
350 Gazo$ = "data/Gazo/"
360 'Sound File(Voice)
370 '1.ボイス TopScreen
380 Voice_File_TopScreen$ = "data/Sound_data/"
390 '変数領域
400 dim bufline$(181 * 2+3),bufcount$(10):count = 0:dim bufcount1$(10):dim bufcount2$(10):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50)
410 count2 = 0:N=0:N2=0:m2 = 0
420 'ファイルの有無チェック
430 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
440 '1.ファイルが無いとき
450 cls :print "依存ファイルが見つかりません":
460 print "エンターキーを押してください"+chr$(13)
470 key$ = input$(1)
480 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
490 else
500 '2.ファイルが有るとき
510 cls:print "csv:file ok." + chr$(13)
520 n=0
530 open FILE_csv$ for input as #1
540 while eof(1) = 0
550 input #1,line$
560 'print line$
570 bufline$(n) = line$
580 'Print n;chr$(13)
590 n = n + 1
600 wend
610 close #1
620 N=n
630 '2つ目のファイル読み込み
640 'n = 0
650 open FILE_csv2$ for input as #2
660 for n=3 to 181
670 for i=0 to 1
680 input #2,line$
690 bufline2$(n,i) = line$
700 'print bufline2$(n,i)
710 next i
720 next n
730 close #2
740 N2 = n
750 '
760 endif
770 'or j = 3 to 181+3
780 'ufline3$(j - 3,n) = bufline2$(i,n)
790 'next j
800 'moji$ = Kotodama$(bufline3$(16))
810 'erase bufline2$
820 'Top画面
830 TopScreen:
840 cls 3:font 48
850 play ""
860 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
870 gload Gazo$ + "Screen1_Top_20211226.png"
880 color rgb(0,0,255)
890 print chr$(13)
900 'print "●Top画面" + chr$(13)
910 color rgb(255,255,255)
920 print "番号を選んでください" + chr$(13)
930 print "1.数霊(かずたま)チェック" + chr$(13)
940 print "2.設定" + chr$(13)
950 print "3.ヘルプ" + chr$(13)
960 print "4.終　了" + chr$(13)
970 color rgb(0,0,0)
980 Input "番号:",No
990 if No=1 then goto Surei_Check:
1000 if No=3 then Color rgb(255,255,255):goto Help:
1010 if No=4 then cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "終了します":color rgb(255,255,255):end
1020 if No=2 then color rgb(255,255,255):goto Setting:
1030 '1-1.数霊チェック
1040 Surei_Check:
1050 cls 3:Font 48
1060 'gload Gazo$ + "Screen4.png"
1070 gload Gazo$ + "Screen1_Sureicheck_Top20211226.png"
1080 play ""
1090 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
1100 color rgb(255,0,0)
1110 'print "●数霊(かずたま)チェックトップ" + chr$(13)
1120 print chr$(13)
1130 color rgb(255,255,255)
1140 print "番号を選んでください"+chr$(13)
1150 print "1.数霊(かずたま)チェック(1人)" + chr$(13)
1160 print "2.数霊(かずたま)チェック(2人)" + chr$(13)
1170 print "3.前の画面に戻る" + chr$(13)
1180 print "4.終 了" + chr$(13)
1190 color rgb(0,0,0)
1200 Input "番号:",No
1210 '前の画面に戻る
1220 if No = 3 then goto TopScreen:
1230 'プログラムの終了
1240 if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"終了します":COLOR rgb(255,255,255):end
1250 '1人用
1260 if No = 1 then goto Surei_Input:
1270 '2人用
1280 if No = 2 then goto Surei_twoParson:
1290 if No > 4 then ui_msg"もう一度入れてください":goto Surei_Check:
1300 '数霊(かずたま) 文字入力  1人用
1310 Surei_Input:
1320 if mode = 0 then
1330 cls 3:font 32
1340 gload Gazo$ + "InputKotodama_20211226.png"
1350 play""
1360 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
1370 color rgb(255,0,0)
1380 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
1390 print chr$(13)
1400 color rgb(0,0,0)
1410 print "文字を入れてください" + chr$(13)
1420 color rgb(255,0,0)
1430 print "(有効文字:カタカナ、半角アルファベット、大文字のみ)"+chr$(13)
1440 print chr$(13)
1450 color rgb(0,0,0)
1460 Input "入力文字:",buffer_moji$
1470 goto Surei_Result:
1480 else
1490 if mode = 1 then
1500 cls 3:Font 32
1510 gload Gazo$ + "InputKotodama.png"
1520 color rgb(255,0,0)
1530 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
1540 color rgb(255,255,255)
1550 print "文字を入れてください" + chr$(13)
1560 color rgb(255,0,0)
1570 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
1580 print "大文字のみ)" + chr$(13)
1590 color rgb(0,0,0)
1600 Input "文字入力:",buffer_moji2$
1610 goto Surei_Result3:
1620 endif
1630 endif
1640 '数霊(かずたま)文字入力　2人用
1650 Surei_twoParson:
1660 cls 3:Font 32
1670 gload Gazo$ + "InputKotodama_20211226.png"
1680 '1人目入力
1690 'color rgb(255,0,0)
1700 print ""+chr$(13)
1710 'print "●数霊(かずたま) 1人目 入力" + chr$(13)
1720 color rgb(255,0,0)
1730 print "1人目の文字を入れてください" + chr$(13)
1740 color rgb(255,0,0)
1750 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
1760 color rgb(0,0,0)
1770 print chr$(13)
1780 Input "1人目文字入力:",buf_Parson1$
1790 Surei_twoParson2:
1800 cls 3:Font 32
1810 '2人目入力
1820 gload Gazo$ + "InputKotodama_20211226.png"
1830 'color rgb(255,0,0)
1840 'print "●数霊(かずたま) 2人目 入力" + chr$(13)
1850 print ""+chr$(13)
1860 print "2人目の文字を入れてください" + chr$(13)
1870 color rgb(255,0,0)
1880 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
1890 color rgb(0,0,0)
1900 Input "2人目の文字入力:",buf_Parson2$
1910 goto Surei_Result2:
1920 '数霊　計算 パート
1930 '文字の計算関数
1940 'moji$:1文字を入れる
1950 func Complate(moji$)
1960 for n = 1 to 116
1970 if moji$ = bufline$(2*n) then
1980 buffcount = val(bufline$(2 * n + 1))
1990 endif
2000 next n
2010 endfunc buffcount
2020 '数霊　結果表示
2030 Surei_Result:
2040 cls 3:Font 32
2050 'ゼロカウント:zcount
2060 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
2070 '例 アカい:"い"の文字は無効な文字なので、はじく
2080 zcount=0
2090 'mojicount:入力文字数
2100 mojicount = len(buffer_moji$)
2110 for n=1 to mojicount
2120 for j=1 to 116
2130 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
2140 if bufcount$(n - 1) = bufline$(2 * j) then
2150   zcount = zcount + 1
2160 endif
2170 next j
2180 next n
2190 if mojicount > zcount then
2200 cls 3:ui_msg "無効な文字です":talk"無効な文字があります。":zcount = 0:goto Surei_Input:
2210 endif
2220 for i = 1 to mojicount
2230 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
2240 n1 = Complate(bufcount$(i - 1))
2250 count = count + n1
2260 next i
2270 '182以上のとき,181を引く
2280 if (count > 181) then count = count - 181
2290 cls 3:Font 48+16
2300 gload Gazo$ + "Result_Screen3_20211226.png"
2310 color rgb(255,0,0)
2320 print "入力文字:" + buffer_moji$ + chr$(13)
2330 'print chr$(13)
2340 color rgb(0,0,255)
2350 print "数霊(かずたま):";count;chr$(13)
2360 color rgb(0,0,0)
2370 print "エンターキー:トップ" + chr$(13)
2380 print "スペース:次 へ" + chr$(13)
2390 key$ = input$(1)
2400 if key$ = " " then goto Surei_Result4:
2410 if key$ = chr$(13) then
2420 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
2430 for i=0 to 9
2440 bufcount$(i) = " "
2450 next i
2460 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
2470 'else
2480 'if key$ = " " then
2490 '２回めの入力に行く
2500 'mode = 1:goto Surei_Input:
2510 'else
2520 'if key$ = "s" or key$ = "S" then
2530 'ファイルを保存する
2540 's = Save()
2550 'ui_msg"保存しました"
2560 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
2570 else
2580 goto Surei_Result:
2590 'endif
2600 endif
2610 '3-1 バージョン情報
2620 Version:
2630 cls 3:Font 32
2640 gload Gazo$ + "Screen1_Version.png"
2650 play ""
2660 play Voice_File_TopScreen$ + "Voice_Version.mp3"
2670 color rgb(255,0,0)
2680 'print"●バージョン情報"+chr$(13)
2690 print chr$(13)
2700 color rgb(255,255,255)
2710 print "Ver:";Version$ + chr$(13)
2720 print "アプリ名:数霊"+ chr$(13)
2730 print "for Basic for Android"+chr$(13)
2740 print "Author:licksjp"+chr$(13)
2750 print "制作開始:2021.7.28" + chr$(13)
2760 print chr$(13)
2770 print "(C)Copy right licksjp " + chr$(13)
2780 print "All rights reserved" + chr$(13)
2790 color rgb(0,0,0)
2800 print "エンターキーを押してください" + chr$(13)
2810 key$ = input$(1)
2820 if key$ = chr$(13) then
2830 goto TopScreen:
2840 else
2850 talk "無効なキーです":goto Version:
2860 endif
2870 '3-2 参考文献
2880 Reference_Book:
2890 cls 3:Font 48:play""
2900 gload Gazo$ + "Screen1_Reference.png"
2910 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
2920 color rgb(255,0,0)
2930 'print"●参考文献" + chr$(13)
2940 print chr$(13)
2950 color rgb(255,255,255)
2960 print "書名:数霊" + chr$(13)
2970 print "出版社:徳間書店" + chr$(13)
2980 print "ISBN:978-4-19-" + chr$(13)
2990 print "         865309-5" + chr$(13)
3000 print "定価:2300円 + 税" + chr$(13)
3010 color rgb(0,0,0)
3020 print "エンターキーを押してください"
3030 key$=input$(1)
3040 if key$=chr$(13) then
3050 goto TopScreen:
3060 else
3070 talk"無効なキーです":goto Reference_Book:
3080 endif
3090 'ヘルプ画面　トップ画面
3100 Help:
3110 play ""
3120 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
3130 cls 3:Font 48:
3140 gload Gazo$ + "Screen1_Help_Top.png"
3150 color rgb(255,0,0)
3160 'print "●3.ヘルプ　トップ画面" + chr$(13)
3170 print chr$(13)
3180 color rgb(255,255,255)
3190 print "番号を選んでください" + chr$(13)
3200 print "1.バージョン" + chr$(13)
3210 print "2.参考文献" + chr$(13)
3220 print "3.トップ画面" + chr$(13)
3230 print "4.終 了" + chr$(13)
3240 color rgb(0,0,0)
3250 Input "番号:",No
3260 if No=1 then goto Version:
3270 if No=3 then goto TopScreen:
3280 if No=2 then goto Reference_Book:
3290 if No=4 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
3300 if (No = 0 or No > 4) then ui_msg"もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
3310 '登録文字の確認
3320 '文字を1文字入れて登録されているか調べるメニュー
3330 '設定項目
3340 Setting:
3350 cls 3:Font 48
3360 gload Gazo$ + "Screen1_Setting_Top.png"
3370 play ""
3380 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
3390 color rgb(0,0,255)
3400 'print "●設定項目" + chr$(13)
3410 print chr$(13)
3420 color rgb(255,255,255)
3430 print "番号を選んでください" + chr$(13)
3440 print "1.登録文字の確認" + chr$(13)
3450 print "2.数霊文字確認" + chr$(13)
3460 print "3.トップ画面に行く" + chr$(13)
3470 print "4.終 了" + chr$(13)
3480 color rgb(0,0,0)
3490 Input "番号:",No
3500 if No=3 then goto TopScreen:
3510 if No=1 then goto Select_moji:
3520 if No=2 then goto Kakunin_Surei_count:
3530 if No=4 then color rgb(255,255,255):pause 2.052*1000:ui_msg"プログラムを終了します":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":cls 3:end
3540 if No > 4 then goto Setting:
3550 '文字検索項目  ここから
3560 Moji_Search:
3570 cls 3:Font 32+16
3580 gload Gazo$ + "Moji_Search_Result.png"
3590 play ""
3600 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
3610 print "" + chr$(13)
3620 color rgb(255,0,0)
3630 print "文字を一文字入れてください" + chr$(13)
3640 color rgb(0,0,0)
3650 Input "登録文字:",moji$
3660 moji_count = len(moji$)
3670 if moji_count > 1 then
3680 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
3690 else
3700 count=0
3710 for n = 0 to 116
3720 if bufline$(2*n) = moji$ then
3730 cls 3:font 48
3740 gload Gazo$ + "Moji_Search_Result.png"
3750 'talk"この文字は登録されています"
3760 play ""
3770 play Voice_File_TopScreen$+"Voice_Entry_OK.mp3"
3780 print chr$(13)
3790 color rgb(255,0,0)
3800 print moji$;"は、登録されています。" + chr$(13)
3810 color rgb(0,0,0)
3820 print "エンターキーを押してください"
3830 key$=input$(1)
3840 if key$=chr$(13) then goto TopScreen:
3850 count = count + 1
3860 endif
3870 next n
3880 if count = 0 then
3890 cls 3:font 48
3900 gload Gazo$ + "Moji_check.png"
3910 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
3920 print chr$(13)
3930 color rgb(255,0,0)
3940 print moji$;"は、登録されていません。" + chr$(13)
3950 color rgb(0,0,0)
3960 print "エンターキーを押してください" + chr$(13)
3970 key$=input$(1)
3980 if key$=chr$(13) then goto TopScreen:
3990 endif
4000 endif
4010 Surei_Result2:
4020 cls 3:Font 48
4030 zcount1=0:zcount2=0:count1=0:count2=0
4040 '1人目
4050 mojicount1=len(buf_Parson1$)
4060 '2人目
4070 mojicount2=len(buf_Parson2$)
4080 '1人目
4090 for n=1 to mojicount1
4100 for j=1 to 116
4110 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
4120 if bufcount1$(n-1) = bufline$(2*j) then
4130 zcount1 = zcount1 + 1
4140 endif
4150 next j
4160 next n
4170 '2人目
4180 for n=1 to mojicount2
4190 for j=1 to 116
4200 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
4210 if bufcount2$(n-1) = bufline$(2*j) then
4220 zount2 = zcount2 + 1
4230 endif
4240 next j
4250 next n
4260 '1人目
4270 for i=1 to mojicount1
4280 bufcount1$(i-1)=Mid$(buf_Parson1$,i,1)
4290 p1=Complate(bufcount1$(i-1))
4300 count1 = count1 + p1
4310 next i
4320 '2人目
4330 for i=1 to mojicount2
4340 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
4350 p2 = Complate(bufcount2$(i-1))
4360 count2 = count2 + p2
4370 next i
4380 cls 3:
4390 gload Gazo$ + "Screen1_2Parson_Result.png"
4400 color rgb(255,0,0)
4410 'print "数霊 2人用 結果表示"+chr$(13)
4420 print ""+chr$(13)
4430 color rgb(255,255,255)
4440 print "1人目:";buf_Parson1$;chr$(13)
4450 print "数霊1:";count1;chr$(13)
4460 print "2人目:";buf_Parson2$;chr$(13)
4470 print "数霊2:";count2;chr$(13)
4480 print "数霊(合計):";count1 + count2;chr$(13)
4490 color rgb(0,0,0)
4500 print "エンターキーを押してください" + chr$(13)
4510 key$=input$(1)
4520 if key$=chr$(13) then goto TopScreen:
4530 Surei_Result3:
4540 cls 3:Font 48
4550 zcount2 = 0:count2 = 0
4560 mojicount2 = len(buffer_moji2$)
4570 for n=1 to mojicount2
4580 for j=1 to 116
4590 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
4600 if bufcount2$(n - 1) = bufline$(2 * j) then
4610 zcount2 = zcount2 + 1
4620 endif
4630 next j
4640 next n
4650 for i=1 to mojicount2
4660 n2 = Complate(bufcount2$(i-1))
4670 count2 = count2 + n2
4680 next i
4690 gload Gazo$ + "Screen5.png"
4700 color rgb(255,0,0)
4710 print "数霊の結果表示" + chr$(13)
4720 color rgb(255,255,255)
4730 print "１回目回の文字入力:";buffer_moji$;chr$(13)
4740 print "１回目の数霊(かずたま)";count;chr$(13)
4750 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
4760 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
4770 color rgb(0,0,0)
4780 print "エンターキー:トップ画面";chr$(13)
4790 print "c or C キー:数霊の比較";chr$(13)
4800 key$ = input$(1)
4810 if key$ = chr$(13) then mode=0:count=0:count2=0:goto TopScreen:
4820 if key$ = "c" or key$ = "C" then
4830 if count = count2 then
4840 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
4850 else
4860 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
4870 endif
4880 endif
4890 Moji_Count_Check:
4900 cls 3:Font 48
4910 gload Gazo$ + "Moji_check.png"
4920 n=0
4930 open FILE_csv$ for input as #1
4940 while eof(1)=0
4950 line input #1, line$
4960 n = n + 1
4970 wend
4980 close #1
4990 'n = n - 1
5000 'talk "登録文字数は"+str$(n)+"文字です"
5010 play ""
5020 if n = 118 then
5030 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
5040 else
5050 talk"登録文字数は、"+str$(n)+"文字です"
5060 endif
5070 print "" + chr$(13)
5080 color rgb(255,0,0)
5090 print "文字の登録文字数は";n;"文字" + chr$(13)
5100 color rgb(0,0,0)
5110 print "エンターキーを押してください"+chr$(13)
5120 key$ = input$(1)
5130 if key$ = chr$(13) then
5140 goto TopScreen:
5150 else
5160 goto Moji_Count_Check:
5170 endif
5180 'Save 関数
5190 func Save()
5200 open "data/Parsonal_list1.csv" for append as #1
5210 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
5220 close #1
5230 endfunc
5240 Select_moji:
5250 cls 3:font 48
5260 gload Gazo$ + "Screen1_mojicheck.png"
5270 color rgb(255,0,0)
5280 'print "文字の確認" + chr$(13)
5290 print chr$(13)
5300 color rgb(255,255,255)
5310 print "番号を選んでください" + chr$(13)
5320 print "1.登録文字検索"+chr$(13)
5330 print "2.登録文字数の確認" + chr$(13)
5340 print "3.前の画面に戻る" + chr$(13)
5350 print "4.終　了" + chr$(13)
5360 color rgb(0,0,0)
5370 Input "番号:",No
5380 if No=1 then goto Moji_Search:
5390 if No=2 then goto Moji_Count_Check:
5400 if No=3 then goto TopScreen:
5410 if No=4 then color rgb(255,255,255):cls 3:pause 2.052*1000:ui_msg "プログラムを終了します":end
5420 '
5430 Kakunin_Surei_count:
5440 cls 3:font 48
5450 gload Gazo$ + "Kazutama_List_Top.png"
5460 color rgb(255,0,0)
5470 'print "数霊の確認" + chr$(13)
5480 print chr$(13)
5490 color rgb(255,255,255)
5500 print "番号を選んでください" + chr$(13)
5510 print "1.数霊リスト 1人用" + chr$(13)
5520 'print "2.数霊リスト 2人用:未実装" + chr$(13)
5530 print "2.トップ画面に行く" + chr$(13)
5540 print "3.終 了" + chr$(13)
5550 print ""+chr$(13)
5560 color rgb(0,0,0)
5570 Input "番号:",No
5580 if No=2 then goto TopScreen:
5590 if No=3 then color rgb(255,255,255):cls 3:pause 2.052*1000:ui_msg"プログラムを終了します":end
5600 if No=1 then goto Surei_List1:
5610 if No > 3 or No=0 then ui_msg"無効な数字です、入れ直してください":talk"無効な数字です":goto Kakunin_Surei_count:
5620 'if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
5630 Surei_List1:
5640 cls 3:font 48
5650 if dir$ = "data/Parsonal_list1.csv" then
5660 cls 3:print"登録ファイルがございません" + chr$(13)
5670 else
5680 buffer_list_count=Loadcount()
5690 talk"登録件数は"+str$(buffer_list_count)+"件です"
5700 gload Gazo$ + "KazutamaList1_Entry.png"
5710 color rgb(0,0,255)
5720 'print"数霊リスト  登録件数" + chr$(13)
5730 print chr$(13)
5740 color rgb(255,0,0)
5750 print "登録件数:";buffer_list_count;"件";chr$(13)
5760 color rgb(0,0,0)
5770 print "エンターキーを押してください"+chr$(13)
5780 key$=input$(1)
5790 if key$=chr$(13) then
5800 goto KotodamaList_page:
5810 else
5820 goto Surei_List1:
5830 endif
5840 endif
5850 func Loadcount()
5860 n = 0
5870 open "data/Parsonal_list1.csv" for input as #1
5880 while eof(1) = 0
5890 line input #1,line$
5900 n = n + 1
5910 wend
5920 close #1
5930 count_line = n
5940 endfunc count_line
5950 func Kotodama$(buf$)
5960 b = len("数霊:")
5970 a$ = Mid$(buf$,b+1,len(buf$))
5980 for i=0 to 118
5990 if bufline3$(2 * i) ="数霊:" + a$  then
6000 moji_$ = bufline3$(2*i + 1)
6010 'moji_$ = bufline3$(21)
6020 'moji$ = a$
6030 endif
6040 next i
6050 'kotodama$ = a$
6060 kotodama$ = moji_$
6070 endfunc kotodama$
6080 KotodamaList_page:
6090 cls 3:font 48:m = 0
6100 gload Gazo$ + "Screen5_Surei_List.png"
6110 open "data/Parsonal_list1.csv" for input as #1
6120 while eof(1) = 0
6130 input #1,line$
6140 bufKaztama$(m) = line$
6150 'input #1,line$
6160 'bufKaztama$(m,2*m + 1) = line$
6170 m = m + 1
6180 wend
6190 close #1
6200 l = 0:
6210 while buffer_list_count > l
6220 cls
6230 color rgb(255,0,0)
6240 'print "数霊　リスト" + chr$(13)
6250 print chr$(13)
6260 color rgb(255,255,255)
6270 n3 = l:n3 = n3 + 1
6280 print "番号:";n3;chr$(13)
6290 print bufKaztama$(2*l) + chr$(13)
6300 print bufKaztama$(2*l + 1) + chr$(13)
6310 'Kmoji$ = Kotodama$(str$(36))
6320 Kmoji$=moji$
6330 print chr$(13) + chr$(13)
6340 color rgb(0,0,0)
6350 print "スペース:次へ行く" + chr$(13)
6360 print "エンターキー:トップ画面" + chr$(13)
6370 key$ = input$(1)
6380 if key$ = " " then
6390 l = ((l + 1) Mod buffer_list_count)
6400 else
6410 if key$ = chr$(13) then
6420 goto TopScreen:
6430 else
6440 goto KotodamaList_page:
6450 endif
6460 endif
6470 wend
6480 '
6490 '結果表示２ Menu1
6500 Surei_Result4:
6510 cls 3:font (48-16)
6520 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
6530 for i=0 to 181 + 3 - 1
6540 if i = count  then
6550 buffer$ = bufline2$(count + 4,0)
6560 endif
6570 next i
6580 if len(buffer$) > 23 and len(buffer$) <= 45 then
6590 buffer2$ = Mid$(buffer$,1,24)
6600 buffer3$ = Mid$(buffer$,25,(len(buffer$) - 25))
6610 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)
6620 else
6630 if len(buffer$) <= 23 then
6640 buffer2$ = Mid$(buffer$,1,22)
6650 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
6660 else
6670 if len(buffer$) > 45 and len(buffer$) <= 64 then
6680 buffer2$ = Mid$(buffer$,1,22)
6690 buffer3$ = Mid$(buffer$,23,20)
6700 buffer4$ = Mid$(buffer$,43,(len(buffer$)-43))
6710 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)+chr$(13)
6720 else
6730 if len(buffer$) > 64 and len(buffer$) <= 81 then
6740 buffer2$ = Mid$(buffer$,1,23)
6750 buffer3$ = Mid$(buffer$,24,20)
6760 buffer4$ = Mid$(buffer$,42,20)
6770 buffer5$ = Mid$(buffer$,63,(len(buffer$)-62))
6780 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13) + chr$(13) + chr$(13)
6790 if len(buffer$) > 81 and len(buffer$) <= 110 then
6800 buffer2$ = Mid$(buffer$,1,21)
6810 buffer3$ = Mid$(buffer$,22,20)
6820 buffer4$ = Mid$(buffer$,42,20)
6830 buffer5$ = Mid$(buffer$,62,20)
6840 buffer6$ = Mid$(buffer$,82,(len(buffer$) - 82))
6850 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13) + chr$(13) + chr$(13)
6860 endif
6870 endif
6880 endif
6890 endif
6900 endif
6910 'cls 3
6920 gload Gazo$ + "Screen1_Result2.png"
6930 color rgb(255,0,0)
6940 'print "診断結果 2" + chr$(13)
6950 print chr$(13)
6960 color rgb(127,255,212)
6970 print "入力文字:";buffer_moji$;chr$(13)
6980 print "数霊:";count;chr$(13)
6990 color rgb(255,255,255)
7000 print "数霊の説明:"+chr$(13)
7010 print buffer$
7020 color rgb(0,0,0)
7030 print "エンターキー:トップ,S:保存する" + chr$(13)
7040 key$=input$(1)
7050 if key$ = chr$(13) then
7060 buffer$="" : buffer_moji$="" : count=0:goto TopScreen:
7070 else
7080 if key$="s" or key$="S" then
7090 s=Save():ui_msg"保存しました":goto Surei_Result4:
7100 else
7110 talk"無効な文字です":goto Surei_Result4:
7120 endif
7130 endif
