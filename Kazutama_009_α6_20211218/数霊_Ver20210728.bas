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
200 '
210 Version$ = "0.0.9.2021.12.16 (α6)"
220 'csvファイル 1.数霊 ベースファイル
230 FILE_csv$ = "data/Kazutama.csv"
240 'csvファイル 2.数霊 ベースファイル 2
250 FILE_csv2$ = "data/Surei_chart_20211207.csv"
260 'gazo ファイル
270 Gazo$ = "data/Gazo/"
280 'Sound File(Voice)
290 '1.ボイス TopScreen
300 Voice_File_TopScreen$ = "data/Sound_data/"
310 '変数領域
320 dim bufline$(118 * 2),bufcount$(10):count = 0:dim bufcount1$(10):dim bufcount2$(10):mode = 0:dim bufline2$(118 * 2+3):dim bufline3$(118 * 2+3):dim bufKaztama$(50)
330 count2 = 0:N=0:N2=0:m2=0
340 'ファイルの有無チェック
350 if (dir$(FILE_csv$) = " " or dir$(FILE_csv2$) = " " ) then
360 '1.ファイルが無いとき
370 cls :print "依存ファイルが見つかりません":
380 print "エンターキーを押してください"+chr$(13)
390 key$ = input$(1)
400 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
410 else
420 '2.ファイルが有るとき
430 cls:print "csv:file ok." + chr$(13)
440 n=0
450 open FILE_csv$ for input as #1
460 while eof(1) = 0
470 input #1,line$
480 bufline$(n) = line$
490 n = n + 1
500 wend
510 close #1
520 N2=n
530 '2つ目のファイル読み込み
540 m2= 0
550 open FILE_csv2$ for input as #4
560 while eof(1) = 0
570 input #4,bufline$
580 bufline2$(m2) = bufline$
590 m2 = m2 + 1
600 wend
610 N=m2
620 close #4
630 ' = m
640 endif
650 for j=3 to 118*2+3
660 for i = 0 to 118*2
670 bufline3$(j-3) = bufline2$(i)
680 next i
690 next j
700 moji$ = Kotodama$(bufline3$(16))
710 'erase bufline2$
720 'Top画面
730 TopScreen:
740 cls 3:font 48
750 play ""
760 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
770 gload Gazo$ + "Screen1.png"
780 color rgb(0,0,255)
790 print "●Top画面" + chr$(13)
800 color rgb(255,255,255)
810 print "番号を選んでください" + chr$(13)
820 print "1.数霊(かずたま)チェック" + chr$(13)
830 print "2.設定" + chr$(13)
840 print "3.ヘルプ" + chr$(13)
850 print "4.終　了" + chr$(13)
860 color rgb(0,0,0)
870 Input "番号:",No
880 if No=1 then goto Surei_Check:
890 if No=3 then Color rgb(255,255,255):goto Help:
900 if No=4 then cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":ui_msg "終了します":color rgb(255,255,255):end
910 if No=2 then color rgb(255,255,255):goto Setting:
920 '1-1.数霊チェック
930 Surei_Check:
940 cls 3:Font 32
950 gload Gazo$ + "Screen4.png"
960 play ""
970 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
980 color rgb(255,0,0)
990 print "●数霊(かずたま)チェックトップ" + chr$(13)
1000 color rgb(255,255,255)
1010 print "番号を選んでください"+chr$(13)
1020 print "1.数霊(かずたま)チェック(1人用)" + chr$(13)
1030 print "2.数霊(かずたま)チェック(2人用)" + chr$(13)
1040 print "3.前の画面に戻る" + chr$(13)
1050 print "4.終 了" + chr$(13)
1060 color rgb(0,0,0)
1070 Input "番号:",No
1080 '前の画面に戻る
1090 if No = 3 then goto TopScreen:
1100 'プログラムの終了
1110 if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":end
1120 '1人用
1130 if No = 1 then goto Surei_Input:
1140 '2人用
1150 if No = 2 then goto Surei_twoParson:
1160 if No > 4 then ui_msg"もう一度入れてください":goto Surei_Check:
1170 '数霊(かずたま) 文字入力  1人用
1180 Surei_Input:
1190 if mode = 0 then
1200 cls 3:font 32
1210 gload Gazo$ + "InputKotodama.png"
1220 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
1230 color rgb(255,0,0)
1240 print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
1250 color rgb(255,255,255)
1260 print "文字を入れてください" + chr$(13)
1270 color rgb(255,0,0)
1280 print "(有効文字:カタカナ、半角アルファベット"+chr$(13)
1290 print "大文字のみ)" +chr$(13)
1300 'print "" + chr$(13)
1310 color rgb(0,0,0)
1320 Input "入力文字:",buffer_moji$
1330 goto Surei_Result:
1340 else
1350 if mode = 1 then
1360 cls 3:Font 32
1370 gload Gazo$ + "InputKotodama.png"
1380 color rgb(255,0,0)
1390 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
1400 color rgb(255,255,255)
1410 print "文字を入れてください" + chr$(13)
1420 color rgb(255,0,0)
1430 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
1440 print "大文字のみ)" + chr$(13)
1450 color rgb(0,0,0)
1460 Input "文字入力:",buffer_moji2$
1470 goto Surei_Result3:
1480 endif
1490 endif
1500 '数霊(かずたま)文字入力　2人用
1510 Surei_twoParson:
1520 cls 3:Font 32
1530 gload Gazo$ + "InputKotodama.png"
1540 '1人目入力
1550 color rgb(255,0,0)
1560 print "●数霊(かずたま) 1人目 入力" + chr$(13)
1570 color rgb(255,0,0)
1580 print "1人目の文字を入れてください" + chr$(13)
1590 color rgb(255,0,0)
1600 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
1610 color rgb(0,0,0)
1620 print chr$(13)
1630 Input "1人目文字入力:",buf_Parson1$
1640 Surei_twoParson2:
1650 cls 3:Font 32
1660 '2人目入力
1670 gload Gazo$ + "InputKotodama.png"
1680 color rgb(255,0,0)
1690 print "●数霊(かずたま) 2人目 入力" + chr$(13)
1700 print "2人目の文字を入れてください" + chr$(13)
1710 color rgb(255,0,0)
1720 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13)
1730 color rgb(0,0,0)
1740 Input "2人目の文字入力:",buf_Parson2$
1750 goto Surei_Result2:
1760 '数霊　計算 パート
1770 '文字の計算関数
1780 'moji$:1文字を入れる
1790 func Complate(moji$)
1800 for n = 1 to 116
1810 if moji$ = bufline$(2*n) then
1820 buffcount = val(bufline$(2 * n + 1))
1830 endif
1840 next n
1850 endfunc buffcount
1860 '数霊　結果表示
1870 Surei_Result:
1880 cls 3:Font 32
1890 'ゼロカウント:zcount
1900 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
1910 '例 アカい:"い"の文字は無効な文字なので、はじく
1920 zcount=0
1930 'mojicount:入力文字数
1940 mojicount = len(buffer_moji$)
1950 for n=1 to mojicount
1960 for j=1 to 116
1970 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
1980 if bufcount$(n - 1) = bufline$(2 * j) then
1990   zcount = zcount + 1
2000 endif
2010 next j
2020 next n
2030 if mojicount > zcount then
2040 cls 3:ui_msg "無効な文字です":talk"無効な文字があります。":zcount = 0:goto Surei_Input:
2050 endif
2060 for i = 1 to mojicount
2070 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
2080 n1 = Complate(bufcount$(i - 1))
2090 count = count + n1
2100 next i
2110 '182以上のとき,181を引く
2120 if (count > 181) then count = count - 181
2130 cls 3:Font 48
2140 gload Gazo$ + "Result_Screen3.png"
2150 color rgb(255,0,0)
2160 print "入力文字:";buffer_moji$;chr$(13)
2170 color rgb(255,255,255)
2180 print "数霊(かずたま):";count;chr$(13)
2190 color rgb(0,0,0)
2200 print "エンターキー:トップ" + chr$(13)
2210 print "S or s:保存する"+ chr$(13)
2220 key$ = input$(1)
2230 if key$ = chr$(13) then
2240 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
2250 for i=0 to 9
2260 bufcount$(i) = " "
2270 next i
2280 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
2290 'else
2300 'if key$ = " " then
2310 '２回めの入力に行く
2320 'mode = 1:goto Surei_Input:
2330 else
2340 if key$ = "s" or key$ = "S" then
2350 'ファイルを保存する
2360 s = Save()
2370 ui_msg"保存しました"
2380 n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
2390 else
2400 goto Surei_Result:
2410 'endif
2420 endif
2430 endif
2440 '3-1 バージョン情報
2450 Version:
2460 cls 3:Font 32
2470 gload Gazo$ + "Screen1.png"
2480 play ""
2490 play Voice_File_TopScreen$ + "Voice_Version.mp3"
2500 color rgb(255,0,0)
2510 print"●バージョン情報"+chr$(13)
2520 color rgb(255,255,255)
2530 print "Ver:";Version$ + chr$(13)
2540 print "アプリ名:数霊"+ chr$(13)
2550 print "for Basic for Android"+chr$(13)
2560 print "Author:licksjp"+chr$(13)
2570 print "制作開始:2021.7.28" + chr$(13)
2580 print chr$(13)
2590 print "(C)Copy right licksjp " + chr$(13)
2600 print "All rights reserved" + chr$(13)
2610 color rgb(0,0,0)
2620 print "エンターキーを押してください" + chr$(13)
2630 key$ = input$(1)
2640 if key$ = chr$(13) then goto TopScreen:
2650 '3-2 参考文献
2660 Reference_Book:
2670 cls 3:Font 48:play""
2680 gload Gazo$ + "Screen1.png"
2690 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
2700 color rgb(255,0,0)
2710 print"●参考文献" + chr$(13)
2720 color rgb(255,255,255)
2730 print "書名:数霊" + chr$(13)
2740 print "出版社:徳間書店" + chr$(13)
2750 print "ISBN:978-4-19-" + chr$(13)
2760 print "         865309-5" + chr$(13)
2770 print "定価:2300円 + 税" + chr$(13)
2780 color rgb(0,0,0)
2790 print "エンターキーを押してください"
2800 key$=input$(1)
2810 if key$=chr$(13) then goto TopScreen:
2820 'ヘルプ画面　トップ画面
2830 Help:
2840 play ""
2850 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
2860 cls 3:Font 48:
2870 gload Gazo$ + "Screen1.png"
2880 print "●3.ヘルプ　トップ画面" + chr$(13)
2890 print "番号を選んでください" + chr$(13)
2900 print "1.バージョン" + chr$(13)
2910 print "2.参考文献" + chr$(13)
2920 print "3.トップ画面" + chr$(13)
2930 print "4.終 了" + chr$(13)
2940 color rgb(0,0,0)
2950 Input "番号:",No
2960 if No=1 then goto Version:
2970 if No=3 then goto TopScreen:
2980 if No=2 then goto Reference_Book:
2990 if No=4 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":cls 3:end
3000 if (No = 0 or No > 4) then ui_msg"もう一度入れてください":talk "もう一度、入れてください":goto Help:
3010 '登録文字の確認
3020 '文字を1文字入れて登録されているか調べるメニュー
3030 '設定項目
3040 Setting:
3050 cls 3:Font 48
3060 gload Gazo$ + "Screen1.png"
3070 play ""
3080 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
3090 color rgb(0,0,255)
3100 print "●設定項目" + chr$(13)
3110 color rgb(255,255,255)
3120 print "番号を選んでください" + chr$(13)
3130 print "1.文字の確認" + chr$(13)
3140 print "2.数霊文字確認" + chr$(13)
3150 print "3.トップ画面に行く" + chr$(13)
3160 print "4.終 了" + chr$(13)
3170 color rgb(0,0,0)
3180 Input "番号:",No
3190 if No=3 then goto TopScreen:
3200 if No=1 then goto Select_moji:
3210 if No=2 then goto Kakunin_Surei_count:
3220 if No=4 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
3230 if No > 4 then goto Setting:
3240 '文字検索項目  ここから
3250 Moji_Search:
3260 cls 3:Font 32
3270 gload Gazo$ + "Moji_check.png"
3280 play ""
3290 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
3300 print "" + chr$(13)
3310 color rgb(255,0,0):print chr$(13)
3320 print "文字を一文字入れてください" + chr$(13)
3330 color rgb(0,0,0)
3340 Input "登録文字:",moji$
3350 moji_count = len(moji$)
3360 if moji_count > 1 then
3370 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
3380 else
3390 count=0
3400 for n = 0 to 116
3410 if bufline$(2*n) = moji$ then
3420 cls 3:font 48
3430 gload Gazo$ + "Moji_check.png"
3440 'talk"この文字は登録されています"
3450 play ""
3460 play Voice_File_TopScreen$+"Voice_Entry_OK.mp3"
3470 print chr$(13)
3480 color rgb(255,0,0)
3490 print moji$;"は、登録されています。" + chr$(13)
3500 color rgb(0,0,0)
3510 print "エンターキーを押してください"
3520 key$=input$(1)
3530 if key$=chr$(13) then goto TopScreen:
3540 count = count + 1
3550 endif
3560 next n
3570 if count = 0 then
3580 cls 3:font 48
3590 gload Gazo$ + "Moji_check.png"
3600 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
3610 print chr$(13)
3620 color rgb(255,0,0)
3630 print moji$;"は、登録されていません。" + chr$(13)
3640 color rgb(0,0,0)
3650 print "エンターキーを押してください" + chr$(13)
3660 key$=input$(1)
3670 if key$=chr$(13) then goto TopScreen:
3680 endif
3690 endif
3700 Surei_Result2:
3710 cls 3:Font 48
3720 zcount1=0:zcount2=0:count1=0:count2=0
3730 '1人目
3740 mojicount1=len(buf_Parson1$)
3750 '2人目
3760 mojicount2=len(buf_Parson2$)
3770 '1人目
3780 for n=1 to mojicount1
3790 for j=1 to 116
3800 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
3810 if bufcount1$(n-1) = bufline$(2*j) then
3820 zcount1 = zcount1 + 1
3830 endif
3840 next j
3850 next n
3860 '2人目
3870 for n=1 to mojicount2
3880 for j=1 to 116
3890 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
3900 if bufcount2$(n-1) = bufline$(2*j) then
3910 zount2 = zcount2 + 1
3920 endif
3930 next j
3940 next n
3950 '1人目
3960 for i=1 to mojicount1
3970 bufcount1$(i-1)=Mid$(buf_Parson1$,i,1)
3980 p1=Complate(bufcount1$(i-1))
3990 count1 = count1 + p1
4000 next i
4010 '2人目
4020 for i=1 to mojicount2
4030 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
4040 p2 = Complate(bufcount2$(i-1))
4050 count2 = count2 + p2
4060 next i
4070 cls 3:
4080 gload Gazo$ + "Screen1.png"
4090 color rgb(255,0,0)
4100 print "数霊 2人用 結果表示"+chr$(13)
4110 color rgb(255,255,255)
4120 print "1人目:";buf_Parson1$;chr$(13)
4130 print "数霊1:";count1;chr$(13)
4140 print "2人目:";buf_Parson2$;chr$(13)
4150 print "数霊2:";count2;chr$(13)
4160 print "数霊(合計):";count1 + count2;chr$(13)
4170 color rgb(0,0,0)
4180 print "エンターキーを押してください" + chr$(13)
4190 key$=input$(1)
4200 if key$=chr$(13) then goto TopScreen:
4210 Surei_Result3:
4220 cls 3:Font 48
4230 zcount2 = 0:count2 = 0
4240 mojicount2 = len(buffer_moji2$)
4250 for n=1 to mojicount2
4260 for j=1 to 116
4270 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
4280 if bufcount2$(n - 1) = bufline$(2 * j) then
4290 zcount2 = zcount2 + 1
4300 endif
4310 next j
4320 next n
4330 for i=1 to mojicount2
4340 n2 = Complate(bufcount2$(i-1))
4350 count2 = count2 + n2
4360 next i
4370 gload Gazo$ + "Screen5.png"
4380 color rgb(255,0,0)
4390 print "数霊の結果表示" + chr$(13)
4400 color rgb(255,255,255)
4410 print "１回目回の文字入力:";buffer_moji$;chr$(13)
4420 print "１回目の数霊(かずたま)";count;chr$(13)
4430 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
4440 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
4450 color rgb(0,0,0)
4460 print "エンターキー:トップ画面";chr$(13)
4470 print "c or C キー:数霊の比較";chr$(13)
4480 key$ = input$(1)
4490 if key$ = chr$(13) then mode=0:count=0:count2=0:goto TopScreen:
4500 if key$ = "c" or key$ = "C" then
4510 if count = count2 then
4520 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
4530 else
4540 play Voice_File_TopScreen$+"Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
4550 endif
4560 endif
4570 Moji_Count_Check:
4580 cls 3:Font 48
4590 gload Gazo$ + "Moji_check.png"
4600 n=0
4610 open FILE_csv$ for input as #1
4620 while eof(1)=0
4630 line input #1, line$
4640 n = n + 1
4650 wend
4660 close #1
4670 'n = n - 1
4680 'talk "登録文字数は"+str$(n)+"文字です"
4690 play ""
4700 if n = 117 then
4710 play Voice_File_TopScreen$+"Voice_Entry_moji_count.mp3"
4720 else
4730 talk"登録文字数は、"+str$(n)+"文字です"
4740 endif
4750 print ""+chr$(13)
4760 color rgb(255,0,0)
4770 print "文字の登録文字数は";n;"文字" + chr$(13)
4780 color rgb(0,0,0)
4790 print "エンターキーを押してください"+chr$(13)
4800 key$=input$(1)
4810 if key$ = chr$(13) then
4820 goto TopScreen:
4830 else
4840 goto Moji_Count_Check:
4850 endif
4860 'Save 関数
4870 func Save()
4880 open "data/Parsonal_list1.csv" for append as #1
4890 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
4900 close #1
4910 endfunc
4920 Select_moji:
4930 cls 3:font 48
4940 gload Gazo$ + "Screen1.png"
4950 color rgb(255,0,0)
4960 print "文字の確認" + chr$(13)
4970 color rgb(255,255,255)
4980 print "番号を選んでください" + chr$(13)
4990 print "1.文字検索"+chr$(13)
5000 print "2.登録文字の確認" + chr$(13)
5010 print "3.前の画面に戻る" + chr$(13)
5020 print "4.終　了" + chr$(13)
5030 color rgb(0,0,0)
5040 Input "番号:",No
5050 if No=1 then goto Moji_Search:
5060 if No=2 then goto Moji_Count_Check:
5070 if No=3 then goto TopScreen:
5080 if No=4 then color rgb(255,255,255):cls 3:end
5090 '
5100 Kakunin_Surei_count:
5110 cls 3:font 48
5120 gload Gazo$ + "Screen1.png"
5130 color rgb(255,0,0)
5140 print "数霊の確認" + chr$(13)
5150 color rgb(255,255,255)
5160 print "番号を選んでください" + chr$(13)
5170 print "1.数霊リスト 1人用" + chr$(13)
5180 print "2.数霊リスト 2人用:未実装" + chr$(13)
5190 print "3.トップ画面に行く" + chr$(13)
5200 print "4.終 了" + chr$(13)
5210 color rgb(0,0,0)
5220 Input "番号:",No
5230 if No=3 then goto TopScreen:
5240 if No=4 then color rgb(255,255,255):cls 3:end
5250 if No=1 then goto Surei_List1:
5260 if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
5270 Surei_List1:
5280 cls 3:font 48
5290 if dir$ = "data/Parsonal_list1.csv" then
5300 cls 3:print"登録ファイルがございません" + chr$(13)
5310 else
5320 buffer_list_count=Loadcount()
5330 talk"登録件数は"+str$(buffer_list_count)+"件です"
5340 gload Gazo$ + "KazutamaList1.png"
5350 color rgb(0,0,255)
5360 print"数霊リスト  登録件数" + chr$(13)
5370 color rgb(255,0,0)
5380 print "登録件数:";buffer_list_count;"件";chr$(13)
5390 color rgb(0,0,0)
5400 print "エンターキーを押してください"+chr$(13)
5410 key$=input$(1)
5420 if key$=chr$(13) then goto KotodamaList_page:
5430 endif
5440 func Loadcount()
5450 n = 0
5460 open "data/Parsonal_list1.csv" for input as #1
5470 while eof(1) = 0
5480 line input #1,line$
5490 n = n + 1
5500 wend
5510 close #1
5520 count_line = n
5530 endfunc count_line
5540 func Kotodama$(buf$)
5550 b = len("数霊:")
5560 a$ = Mid$(buf$,b+1,len(buf$))
5570 for i=0 to 118
5580 if bufline3$(2 * i) ="数霊:" + a$  then
5590 moji_$ = bufline3$(2*i + 1)
5600 'moji_$ = bufline3$(21)
5610 'moji$ = a$
5620 endif
5630 next i
5640 'kotodama$ = a$
5650 kotodama$ = moji_$
5660 endfunc kotodama$
5670 KotodamaList_page:
5680 cls 3:font 48:m = 0
5690 gload Gazo$ + "Screen5.png"
5700 open "data/Parsonal_list1.csv" for input as #1
5710 while eof(1) = 0
5720 input #1,line$
5730 bufKaztama$(m) = line$
5740 'input #1,line$
5750 'bufKaztama$(m,2*m + 1) = line$
5760 m = m + 1
5770 wend
5780 close #1
5790 l=0
5800 while buffer_list_count > l
5810 cls
5820 color rgb(255,0,0)
5830 print "数霊　リスト" + chr$(13)
5840 color rgb(255,255,255)
5850 n3 = l:n3 = n3 + 1
5860 print "番号:";n3;chr$(13)
5870 print bufKaztama$(2*l) + chr$(13)
5880 print bufKaztama$(2*l+ 1) + chr$(13)
5890 'Kmoji$ = Kotodama$(str$(36))
5900 Kmoji$=moji$
5910 print chr$(13) + chr$(13)
5920 color rgb(0,0,0)
5930 print "スペース:次へ行く" + chr$(13)
5940 print "エンターキー:トップ画面" + chr$(13)
5950 key$ = input$(1)
5960 if key$ = " " then
5970 l = ((l + 1) Mod buffer_list_count)
5980 else
5990 if key$ = chr$(13) then
6000 goto TopScreen:
6010 endif
6020 endif
6030 wend
