100 '数霊(かずたま) 製作開始日:2021.07.28
110 'Version 0.0.1_2021.07.28 テスト版１
120 'Version 0.0.2_2021.11.27 テスト版２
130 'Version 0.0.3_2021.11.29 テスト版3
140 'Version 0.0.4_2021.11.30 - 12.01 α1
150 'Version 0.0.5_2021.12.02 - 12.03 α2
160 'Version 0.0.6_2021.12.10 (α3)
170 'Version 0.0.7_2021.12.11 (α4)
180 'Version 0.0.8_2021.12.13 (α5)
190 'Version 0.0.9_2021.12.16 - 2021.12.18 (α6)
200 'Version 0.1.0_2021.12.19 -2021.12.23 (β1)
210 'Version 0.1.1_2021.12.24 -2021.12.24 (β2)
220 '
230 Version$ = "0.1.1.2021.12.24(β2)"
240 'csvファイル 1.数霊 ベースファイル
250 FILE_csv$ = "data/Kazutama.csv"
260 'csvファイル 2.数霊 ベースファイル 2
270 FILE_csv2$ = "data/Surei_chart_20211207.csv"
280 'gazo ファイル
290 Gazo$ = "data/Gazo/"
300 'Sound File(Voice)
310 '1.ボイス TopScreen
320 Voice_File_TopScreen$ = "data/Sound_data/"
330 '変数領域
340 dim bufline$(118 * 2),bufcount$(10):count = 0:dim bufcount1$(10):dim bufcount2$(10):mode = 0:dim bufline2$(200 * 2 + 3):dim bufline3$(118 * 2 + 3):dim bufKaztama$(50)
350 count2 = 0:N=0:N2=0:m2 = 0
360 'ファイルの有無チェック
370 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
380 '1.ファイルが無いとき
390 cls :print "依存ファイルが見つかりません":
400 print "エンターキーを押してください"+chr$(13)
410 key$ = input$(1)
420 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
430 else
440 '2.ファイルが有るとき
450 cls:print "csv:file ok." + chr$(13)
460 n=0
470 open FILE_csv$ for input as #1
480 while eof(1) = 0
490 input #1,line$
500 'print line$
510 bufline$(n) = line$
520 'Print n;chr$(13)
530 n = n + 1
540 wend
550 close #1
560 N=n
570 '2つ目のファイル読み込み
580 n = 0
590 open FILE_csv2$ for input as #2
600 while eof(2) = 0
610 input #2,line$
620 'print line$
630 bufline2$(n) = line$
640 'print n;chr$(13)
650 n = n + 1
660 wend
670 close #2
680 N2 = n
690 '
700 endif
710 for j = 3 to 118*2+3
720 for i = 0 to 118*2
730 bufline3$(j-3) = bufline2$(i)
740 next i
750 next j
760 moji$ = Kotodama$(bufline3$(16))
770 erase bufline2$
780 'Top画面
790 TopScreen:
800 cls 3:font 48
810 play ""
820 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
830 gload Gazo$ + "Screen1.png"
840 color rgb(0,0,255)
850 print "●Top画面" + chr$(13)
860 color rgb(255,255,255)
870 print "番号を選んでください" + chr$(13)
880 print "1.数霊(かずたま)チェック" + chr$(13)
890 print "2.設定" + chr$(13)
900 print "3.ヘルプ" + chr$(13)
910 print "4.終　了" + chr$(13)
920 color rgb(0,0,0)
930 Input "番号:",No
940 if No=1 then goto Surei_Check:
950 if No=3 then Color rgb(255,255,255):goto Help:
960 if No=4 then cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "終了します":color rgb(255,255,255):end
970 if No=2 then color rgb(255,255,255):goto Setting:
980 '1-1.数霊チェック
990 Surei_Check:
1000 cls 3:Font 48
1010 'gload Gazo$ + "Screen4.png"
1020 gload Gazo$ + "Screen1.png"
1030 play ""
1040 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
1050 color rgb(255,0,0)
1060 print "●数霊(かずたま)チェックトップ" + chr$(13)
1070 color rgb(255,255,255)
1080 print "番号を選んでください"+chr$(13)
1090 print "1.数霊(かずたま)チェック(1人)" + chr$(13)
1100 print "2.数霊(かずたま)チェック(2人)" + chr$(13)
1110 print "3.前の画面に戻る" + chr$(13)
1120 print "4.終 了" + chr$(13)
1130 color rgb(0,0,0)
1140 Input "番号:",No
1150 '前の画面に戻る
1160 if No = 3 then goto TopScreen:
1170 'プログラムの終了
1180 if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:end
1190 '1人用
1200 if No = 1 then goto Surei_Input:
1210 '2人用
1220 if No = 2 then goto Surei_twoParson:
1230 if No > 4 then ui_msg"もう一度入れてください":goto Surei_Check:
1240 '数霊(かずたま) 文字入力  1人用
1250 Surei_Input:
1260 if mode = 0 then
1270 cls 3:font 32
1280 gload Gazo$ + "InputKotodama.png"
1290 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
1300 color rgb(255,0,0)
1310 print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
1320 color rgb(255,255,255)
1330 print "文字を入れてください" + chr$(13)
1340 color rgb(255,0,0)
1350 print "(有効文字:カタカナ、半角アルファベット"+chr$(13)
1360 print "大文字のみ)" +chr$(13)
1370 'print "" + chr$(13)
1380 color rgb(0,0,0)
1390 Input "入力文字:",buffer_moji$
1400 goto Surei_Result:
1410 else
1420 if mode = 1 then
1430 cls 3:Font 32
1440 gload Gazo$ + "InputKotodama.png"
1450 color rgb(255,0,0)
1460 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
1470 color rgb(255,255,255)
1480 print "文字を入れてください" + chr$(13)
1490 color rgb(255,0,0)
1500 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
1510 print "大文字のみ)" + chr$(13)
1520 color rgb(0,0,0)
1530 Input "文字入力:",buffer_moji2$
1540 goto Surei_Result3:
1550 endif
1560 endif
1570 '数霊(かずたま)文字入力　2人用
1580 Surei_twoParson:
1590 cls 3:Font 32
1600 gload Gazo$ + "InputKotodama.png"
1610 '1人目入力
1620 color rgb(255,0,0)
1630 print "●数霊(かずたま) 1人目 入力" + chr$(13)
1640 color rgb(255,0,0)
1650 print "1人目の文字を入れてください" + chr$(13)
1660 color rgb(255,0,0)
1670 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
1680 color rgb(0,0,0)
1690 print chr$(13)
1700 Input "1人目文字入力:",buf_Parson1$
1710 Surei_twoParson2:
1720 cls 3:Font 32
1730 '2人目入力
1740 gload Gazo$ + "InputKotodama.png"
1750 color rgb(255,0,0)
1760 print "●数霊(かずたま) 2人目 入力" + chr$(13)
1770 print "2人目の文字を入れてください" + chr$(13)
1780 color rgb(255,0,0)
1790 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13)
1800 color rgb(0,0,0)
1810 Input "2人目の文字入力:",buf_Parson2$
1820 goto Surei_Result2:
1830 '数霊　計算 パート
1840 '文字の計算関数
1850 'moji$:1文字を入れる
1860 func Complate(moji$)
1870 for n = 1 to 116
1880 if moji$ = bufline$(2*n) then
1890 buffcount = val(bufline$(2 * n + 1))
1900 endif
1910 next n
1920 endfunc buffcount
1930 '数霊　結果表示
1940 Surei_Result:
1950 cls 3:Font 32
1960 'ゼロカウント:zcount
1970 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
1980 '例 アカい:"い"の文字は無効な文字なので、はじく
1990 zcount=0
2000 'mojicount:入力文字数
2010 mojicount = len(buffer_moji$)
2020 for n=1 to mojicount
2030 for j=1 to 116
2040 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
2050 if bufcount$(n - 1) = bufline$(2 * j) then
2060   zcount = zcount + 1
2070 endif
2080 next j
2090 next n
2100 if mojicount > zcount then
2110 cls 3:ui_msg "無効な文字です":talk"無効な文字があります。":zcount = 0:goto Surei_Input:
2120 endif
2130 for i = 1 to mojicount
2140 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
2150 n1 = Complate(bufcount$(i - 1))
2160 count = count + n1
2170 next i
2180 '182以上のとき,181を引く
2190 if (count > 181) then count = count - 181
2200 cls 3:Font 48
2210 gload Gazo$ + "Result_Screen3.png"
2220 color rgb(255,0,0)
2230 print "入力文字:";buffer_moji$;chr$(13)
2240 color rgb(255,255,255)
2250 print "数霊(かずたま):";count;chr$(13)
2260 color rgb(255,255,255)
2270 print "エンターキー:トップ" + chr$(13)
2280 print "S or s:保存する"+ chr$(13)
2290 print "スペース:次 へ" + chr$(13)
2300 key$ = input$(1)
2310 if key$ = " " then goto Surei_Result4:
2320 if key$ = chr$(13) then
2330 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
2340 for i=0 to 9
2350 bufcount$(i) = " "
2360 next i
2370 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
2380 'else
2390 'if key$ = " " then
2400 '２回めの入力に行く
2410 'mode = 1:goto Surei_Input:
2420 else
2430 if key$ = "s" or key$ = "S" then
2440 'ファイルを保存する
2450 s = Save()
2460 ui_msg"保存しました"
2470 n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
2480 else
2490 goto Surei_Result:
2500 endif
2510 endif
2520 '3-1 バージョン情報
2530 Version:
2540 cls 3:Font 32
2550 gload Gazo$ + "Screen1.png"
2560 play ""
2570 play Voice_File_TopScreen$ + "Voice_Version.mp3"
2580 color rgb(255,0,0)
2590 print"●バージョン情報"+chr$(13)
2600 color rgb(255,255,255)
2610 print "Ver:";Version$ + chr$(13)
2620 print "アプリ名:数霊"+ chr$(13)
2630 print "for Basic for Android"+chr$(13)
2640 print "Author:licksjp"+chr$(13)
2650 print "制作開始:2021.7.28" + chr$(13)
2660 print chr$(13)
2670 print "(C)Copy right licksjp " + chr$(13)
2680 print "All rights reserved" + chr$(13)
2690 color rgb(0,0,0)
2700 print "エンターキーを押してください" + chr$(13)
2710 key$ = input$(1)
2720 if key$ = chr$(13) then goto TopScreen:
2730 '3-2 参考文献
2740 Reference_Book:
2750 cls 3:Font 48:play""
2760 gload Gazo$ + "Screen1.png"
2770 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
2780 color rgb(255,0,0)
2790 print"●参考文献" + chr$(13)
2800 color rgb(255,255,255)
2810 print "書名:数霊" + chr$(13)
2820 print "出版社:徳間書店" + chr$(13)
2830 print "ISBN:978-4-19-" + chr$(13)
2840 print "         865309-5" + chr$(13)
2850 print "定価:2300円 + 税" + chr$(13)
2860 color rgb(0,0,0)
2870 print "エンターキーを押してください"
2880 key$=input$(1)
2890 if key$=chr$(13) then goto TopScreen:
2900 'ヘルプ画面　トップ画面
2910 Help:
2920 play ""
2930 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
2940 cls 3:Font 48:
2950 gload Gazo$ + "Screen1.png"
2960 color rgb(255,0,0)
2970 print "●3.ヘルプ　トップ画面" + chr$(13)
2980 color rgb(255,255,255)
2990 print "番号を選んでください" + chr$(13)
3000 print "1.バージョン" + chr$(13)
3010 print "2.参考文献" + chr$(13)
3020 print "3.トップ画面" + chr$(13)
3030 print "4.終 了" + chr$(13)
3040 color rgb(0,0,0)
3050 Input "番号:",No
3060 if No=1 then goto Version:
3070 if No=3 then goto TopScreen:
3080 if No=2 then goto Reference_Book:
3090 if No=4 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 400:cls 3:pause 2.052 * 1000:end
3100 if (No = 0 or No > 4) then ui_msg"もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
3110 '登録文字の確認
3120 '文字を1文字入れて登録されているか調べるメニュー
3130 '設定項目
3140 Setting:
3150 cls 3:Font 48
3160 gload Gazo$ + "Screen1.png"
3170 play ""
3180 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
3190 color rgb(0,0,255)
3200 print "●設定項目" + chr$(13)
3210 color rgb(255,255,255)
3220 print "番号を選んでください" + chr$(13)
3230 print "1.文字の確認" + chr$(13)
3240 print "2.数霊文字確認" + chr$(13)
3250 print "3.トップ画面に行く" + chr$(13)
3260 print "4.終 了" + chr$(13)
3270 color rgb(0,0,0)
3280 Input "番号:",No
3290 if No=3 then goto TopScreen:
3300 if No=1 then goto Select_moji:
3310 if No=2 then goto Kakunin_Surei_count:
3320 if No=4 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:end
3330 if No > 4 then goto Setting:
3340 '文字検索項目  ここから
3350 Moji_Search:
3360 cls 3:Font 32
3370 gload Gazo$ + "Moji_check.png"
3380 play ""
3390 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
3400 print "" + chr$(13)
3410 color rgb(255,0,0):print chr$(13)
3420 print "文字を一文字入れてください" + chr$(13)
3430 color rgb(0,0,0)
3440 Input "登録文字:",moji$
3450 moji_count = len(moji$)
3460 if moji_count > 1 then
3470 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
3480 else
3490 count=0
3500 for n = 0 to 116
3510 if bufline$(2*n) = moji$ then
3520 cls 3:font 48
3530 gload Gazo$ + "Moji_check.png"
3540 'talk"この文字は登録されています"
3550 play ""
3560 play Voice_File_TopScreen$+"Voice_Entry_OK.mp3"
3570 print chr$(13)
3580 color rgb(255,0,0)
3590 print moji$;"は、登録されています。" + chr$(13)
3600 color rgb(0,0,0)
3610 print "エンターキーを押してください"
3620 key$=input$(1)
3630 if key$=chr$(13) then goto TopScreen:
3640 count = count + 1
3650 endif
3660 next n
3670 if count = 0 then
3680 cls 3:font 48
3690 gload Gazo$ + "Moji_check.png"
3700 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
3710 print chr$(13)
3720 color rgb(255,0,0)
3730 print moji$;"は、登録されていません。" + chr$(13)
3740 color rgb(0,0,0)
3750 print "エンターキーを押してください" + chr$(13)
3760 key$=input$(1)
3770 if key$=chr$(13) then goto TopScreen:
3780 endif
3790 endif
3800 Surei_Result2:
3810 cls 3:Font 48
3820 zcount1=0:zcount2=0:count1=0:count2=0
3830 '1人目
3840 mojicount1=len(buf_Parson1$)
3850 '2人目
3860 mojicount2=len(buf_Parson2$)
3870 '1人目
3880 for n=1 to mojicount1
3890 for j=1 to 116
3900 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
3910 if bufcount1$(n-1) = bufline$(2*j) then
3920 zcount1 = zcount1 + 1
3930 endif
3940 next j
3950 next n
3960 '2人目
3970 for n=1 to mojicount2
3980 for j=1 to 116
3990 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
4000 if bufcount2$(n-1) = bufline$(2*j) then
4010 zount2 = zcount2 + 1
4020 endif
4030 next j
4040 next n
4050 '1人目
4060 for i=1 to mojicount1
4070 bufcount1$(i-1)=Mid$(buf_Parson1$,i,1)
4080 p1=Complate(bufcount1$(i-1))
4090 count1 = count1 + p1
4100 next i
4110 '2人目
4120 for i=1 to mojicount2
4130 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
4140 p2 = Complate(bufcount2$(i-1))
4150 count2 = count2 + p2
4160 next i
4170 cls 3:
4180 gload Gazo$ + "Screen1.png"
4190 color rgb(255,0,0)
4200 print "数霊 2人用 結果表示"+chr$(13)
4210 color rgb(255,255,255)
4220 print "1人目:";buf_Parson1$;chr$(13)
4230 print "数霊1:";count1;chr$(13)
4240 print "2人目:";buf_Parson2$;chr$(13)
4250 print "数霊2:";count2;chr$(13)
4260 print "数霊(合計):";count1 + count2;chr$(13)
4270 color rgb(0,0,0)
4280 print "エンターキーを押してください" + chr$(13)
4290 key$=input$(1)
4300 if key$=chr$(13) then goto TopScreen:
4310 Surei_Result3:
4320 cls 3:Font 48
4330 zcount2 = 0:count2 = 0
4340 mojicount2 = len(buffer_moji2$)
4350 for n=1 to mojicount2
4360 for j=1 to 116
4370 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
4380 if bufcount2$(n - 1) = bufline$(2 * j) then
4390 zcount2 = zcount2 + 1
4400 endif
4410 next j
4420 next n
4430 for i=1 to mojicount2
4440 n2 = Complate(bufcount2$(i-1))
4450 count2 = count2 + n2
4460 next i
4470 gload Gazo$ + "Screen5.png"
4480 color rgb(255,0,0)
4490 print "数霊の結果表示" + chr$(13)
4500 color rgb(255,255,255)
4510 print "１回目回の文字入力:";buffer_moji$;chr$(13)
4520 print "１回目の数霊(かずたま)";count;chr$(13)
4530 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
4540 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
4550 color rgb(0,0,0)
4560 print "エンターキー:トップ画面";chr$(13)
4570 print "c or C キー:数霊の比較";chr$(13)
4580 key$ = input$(1)
4590 if key$ = chr$(13) then mode=0:count=0:count2=0:goto TopScreen:
4600 if key$ = "c" or key$ = "C" then
4610 if count = count2 then
4620 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
4630 else
4640 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
4650 endif
4660 endif
4670 Moji_Count_Check:
4680 cls 3:Font 48
4690 gload Gazo$ + "Moji_check.png"
4700 n=0
4710 open FILE_csv$ for input as #1
4720 while eof(1)=0
4730 line input #1, line$
4740 n = n + 1
4750 wend
4760 close #1
4770 'n = n - 1
4780 'talk "登録文字数は"+str$(n)+"文字です"
4790 play ""
4800 if n = 118 then
4810 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
4820 else
4830 talk"登録文字数は、"+str$(n)+"文字です"
4840 endif
4850 print "" + chr$(13)
4860 color rgb(255,0,0)
4870 print "文字の登録文字数は";n;"文字" + chr$(13)
4880 color rgb(0,0,0)
4890 print "エンターキーを押してください"+chr$(13)
4900 key$ = input$(1)
4910 if key$ = chr$(13) then
4920 goto TopScreen:
4930 else
4940 goto Moji_Count_Check:
4950 endif
4960 'Save 関数
4970 func Save()
4980 open "data/Parsonal_list1.csv" for append as #1
4990 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
5000 close #1
5010 endfunc
5020 Select_moji:
5030 cls 3:font 48
5040 gload Gazo$ + "Screen1.png"
5050 color rgb(255,0,0)
5060 print "文字の確認" + chr$(13)
5070 color rgb(255,255,255)
5080 print "番号を選んでください" + chr$(13)
5090 print "1.文字検索"+chr$(13)
5100 print "2.登録文字の確認" + chr$(13)
5110 print "3.前の画面に戻る" + chr$(13)
5120 print "4.終　了" + chr$(13)
5130 color rgb(0,0,0)
5140 Input "番号:",No
5150 if No=1 then goto Moji_Search:
5160 if No=2 then goto Moji_Count_Check:
5170 if No=3 then goto TopScreen:
5180 if No=4 then color rgb(255,255,255):cls 3:pause 2.052*1000:end
5190 '
5200 Kakunin_Surei_count:
5210 cls 3:font 48
5220 gload Gazo$ + "Screen1.png"
5230 color rgb(255,0,0)
5240 print "数霊の確認" + chr$(13)
5250 color rgb(255,255,255)
5260 print "番号を選んでください" + chr$(13)
5270 print "1.数霊リスト 1人用" + chr$(13)
5280 print "2.数霊リスト 2人用:未実装" + chr$(13)
5290 print "3.トップ画面に行く" + chr$(13)
5300 print "4.終 了" + chr$(13)
5310 color rgb(0,0,0)
5320 Input "番号:",No
5330 if No=3 then goto TopScreen:
5340 if No=4 then color rgb(255,255,255):cls 3:pause 2.052*1000:end
5350 if No=1 then goto Surei_List1:
5360 if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
5370 Surei_List1:
5380 cls 3:font 48
5390 if dir$ = "data/Parsonal_list1.csv" then
5400 cls 3:print"登録ファイルがございません" + chr$(13)
5410 else
5420 buffer_list_count=Loadcount()
5430 talk"登録件数は"+str$(buffer_list_count)+"件です"
5440 gload Gazo$ + "KazutamaList1.png"
5450 color rgb(0,0,255)
5460 print"数霊リスト  登録件数" + chr$(13)
5470 color rgb(255,0,0)
5480 print "登録件数:";buffer_list_count;"件";chr$(13)
5490 color rgb(0,0,0)
5500 print "エンターキーを押してください"+chr$(13)
5510 key$=input$(1)
5520 if key$=chr$(13) then goto KotodamaList_page:
5530 endif
5540 func Loadcount()
5550 n = 0
5560 open "data/Parsonal_list1.csv" for input as #1
5570 while eof(1) = 0
5580 line input #1,line$
5590 n = n + 1
5600 wend
5610 close #1
5620 count_line = n
5630 endfunc count_line
5640 func Kotodama$(buf$)
5650 b = len("数霊:")
5660 a$ = Mid$(buf$,b+1,len(buf$))
5670 for i=0 to 118
5680 if bufline3$(2 * i) ="数霊:" + a$  then
5690 moji_$ = bufline3$(2*i + 1)
5700 'moji_$ = bufline3$(21)
5710 'moji$ = a$
5720 endif
5730 next i
5740 'kotodama$ = a$
5750 kotodama$ = moji_$
5760 endfunc kotodama$
5770 KotodamaList_page:
5780 cls 3:font 48:m = 0
5790 gload Gazo$ + "Screen5.png"
5800 open "data/Parsonal_list1.csv" for input as #1
5810 while eof(1) = 0
5820 input #1,line$
5830 bufKaztama$(m) = line$
5840 'input #1,line$
5850 'bufKaztama$(m,2*m + 1) = line$
5860 m = m + 1
5870 wend
5880 close #1
5890 l=0
5900 while buffer_list_count > l
5910 cls
5920 color rgb(255,0,0)
5930 print "数霊　リスト" + chr$(13)
5940 color rgb(255,255,255)
5950 n3 = l:n3 = n3 + 1
5960 print "番号:";n3;chr$(13)
5970 print bufKaztama$(2*l) + chr$(13)
5980 print bufKaztama$(2*l+ 1) + chr$(13)
5990 'Kmoji$ = Kotodama$(str$(36))
6000 Kmoji$=moji$
6010 print chr$(13) + chr$(13)
6020 color rgb(0,0,0)
6030 print "スペース:次へ行く" + chr$(13)
6040 print "エンターキー:トップ画面" + chr$(13)
6050 key$ = input$(1)
6060 if key$ = " " then
6070 l = ((l + 1) Mod buffer_list_count)
6080 else
6090 if key$ = chr$(13) then
6100 goto TopScreen:
6110 endif
6120 endif
6130 wend
6140 '
6150 '結果表示２ Menu1
6160 Surei_Result4:
6170 cls 3
6180 for i=0 to 181 * 2 - 1
6190 if i = count then
6200 cls:n = i
6210 color rgb(255,255,255)
6220 buffer$ = bufline3$(n)
6230 endif
6240 next i
6250 print "bufline3$(";n;")";buffer$;chr$(13)
6260 print count;chr$(13)
