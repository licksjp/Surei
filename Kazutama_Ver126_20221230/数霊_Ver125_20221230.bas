100 '数霊(かずたま) 製作開始日:2021.07.28
110 'Version 0.0.1_2021.07.28 テスト版１
120 'Version 0.0.2_2021.11.27 テスト版２
130 'Version 0.0.3_2021.11.29 テスト版3
140 'Version 0.0.4_2021.11.30 - 12.01 α1
150 'Version 0.0.5_2021.12.02 - 12.03 α2
160 'Version 0.0.6_2021.12.10 (α3)
170 'Version 0.0.7_2021.12.11 (α4)
180 'Version 0.0.8_2021.12.13 (α5)
190 'Version 0.0.9_2021.12.16 -2021.12.18 (α6)
200 'Version 0.1.0_2021.12.19 -2021.12.23 (β1)
210 'Version 0.1.1_2021.12.24 -2021.12.27 (β2)
220 'Version 0.1.2_2021.12.27 -2021.12.31 (β3)
230 '2022年度
240 'Version 0.1.3_2021.12.31 -2022.01.03 (β4)
250 'Version 0.1.4_2022.01.09 -2022.01.15 (β5)
260 'Version 0.1.5_2022.01.26 -2022.01.30 (Release1):R1
270 'Version 1.0.1_2022.02.12(Release2):R3
280 'Version 1.0.2_2022.02.20(Release):正式版
290 'Version 1.0.3_2022.03.27(Release)  正式版
300 'Version 1.0.9_2022.10.20(Release):正式版
310 'Version 1.1.1_2022.11.04(Release):正式版
320 'Version 1.1.2_2022.11.05(Release):正式版
330 'Version 1.1.3_2022.11.06(Release):正式版
340 'Version 1.1.4_2022.11.09(Release):正式版
350 'Version 1.1.6_2022.11.12(Release):正式版
360 'Version 1.1.7_2022.11.16(Release):正式版
370 'Version 1.1.8_2022.11.23(Release):正式版
380 'Version 1.2.0_2022.11.30-2022.11.02(Release):正式版
390 'Version 1.2.1_2022.12.06-2022.12.10(Release):正式版
400 'Version 1.2.2_2022.12.17-2022.12.20(Release):正式版
410 '現在のバージョン
420 Version$ = "1.2.3_2022.12.22(正式版)"
430 'csvファイル 1.数霊 ベースファイル
440 FILE_csv$ = "data/Kazutama.csv"
450 'csvファイル 2.数霊 ベースファイル 2
460 FILE_csv2$ = "data/Surei_chart_20211207.csv"
470 'Save ファイル
480 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
490 'gazo ファイル
500 Gazo$ = "data/Gazo/"
510 'System フォルダ:設定ファイルを保存するところ
520 System$ = "System/config.sys"
530 '設定ファイル名:config.sys
540 'Sound File(Voice)
550 '1.ボイス TopScreen
560 Voice_File_TopScreen$ = "data/Sound_data/"
570 '変数領域
580 'vcount:バーチャルパッド下の変数
590 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0
600 count2 = 0:N=0:N2=0:m2 = 0
610 dim list$(4),moji_List$(2)
620 'ファイルの有無チェック
630 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
640 '1.ファイルが無いとき
650 cls :print "依存ファイルが見つかりません":
660 print "エンターキーを押してください" + chr$(13)
670 key$ = input$(1)
680 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
690 else
700 '2.ファイルが有るとき
710 cls:print "csv:file ok." + chr$(13)
720 n=0
730 open FILE_csv$ for input as #1
740 while eof(1) = 0
750 input #1,line$
760 'print line$
770 bufline$(n) = line$
780 'Print n;chr$(13)
790 n = n + 1
800 wend
810 close #1
820 N=n
830 '2つ目のファイル読み込み
840 'n = 0
850 open FILE_csv2$ for input as #2
860 for n=3 to 181
870 for i=0 to 1
880 input #2,line$
890 bufline2$(n,i) = line$
900 next i
910 next n
920 close #2
930 N2 = n
940 '
950 endif
960 '設定ファイルの読み込み
970 'open System$ for input as #1
980 'line input #1,buf_line$
990  'if len(buf_line$) = 10 then
1000   'if left$(buf_line$,9)="config_r=" then
1010   ' buf$ = right$(buf_line$,1)
1020    'if buf$ = "1" then
1030    '   buf_config_r = 1
1040   ' else
1050   '    buf_config_r = 0
1060   ' endif
1070  ' endif
1080 'endif
1090 'close #1
1100 'or j = 3 to 181+3
1110 'ufline3$(j - 3,n) = bufline2$(i,n)
1120 'next j
1130 'moji$ = Kotodama$(bufline3$(16))
1140 'erase bufline2$
1150 '2022.11.23----------------------
1160 '端末言語のチェック
1170 '日本語端末かチェックをして日本語以外なら英語で表示する
1180 'lang flag:0:日本語 1:英語(日本語以外)
1190 '--------------------------------
1200 lang_flag = 0
1210 if ex_info$(1) <> "JP" then
1220 lang_flag = 1
1230 endif
1240 'Top画面
1250 TopScreen:
1260 'バーチャルパッドを表示
1270 cls 3:font 48:screen 1,1,1:init"kb:4"
1280 'play ""
1290 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
1300 gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
1310 '選択肢 1
1320 gload Gazo$ + "Selection.png",1,5,200
1330 '選択肢 2
1340 gload Gazo$ + "Selection.png",1,5,300
1350 '選択肢 3
1360 gload Gazo$ + "Selection.png",1,5,400
1370 '選択肢 4
1380 gload Gazo$ + "Selection.png",1,5,500
1390 color rgb(0,0,255)
1400 print chr$(13)
1410 if lang_flag = 1 then
1420 color rgb(255,255,255)
1430 print "Select Number" + chr$(13)
1440 print " :1.Kazutama check" + chr$(13)
1450 print " :2.Setting" + chr$(13)
1460 print " :3.Help" + chr$(13)
1470 print " :4.End Program" + chr$(13)
1480 color rgb(255,255,255)
1490 else
1500 color rgb(255,255,255)
1510 print "番号を選んでください" + chr$(13)
1520 print " :1.数霊(かずたま)チェック" + chr$(13)
1530 print " :2.設定" + chr$(13)
1540 print " :3.ヘルプ" + chr$(13)
1550 print " :4.終　了" + chr$(13)
1560 color rgb(0,0,0)
1570 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
1580 'バーチャルパッドを表示
1590 No=1:
1600 'lang_flag:1 外国語,0:日本語
1610 if lang_flag = 1 then
1620 'lang_flag=1 英語
1630 else
1640 'lang_flag=0 日本語
1650 locate 0,12:color rgb(0,0,0):print "1.数霊(かずたま)チェックを選択";chr$(13)
1660 endif
1670 endif
1680 'スプライト
1690 '選択肢 1 On
1700 sp_def 0,(5,200),32,32
1710 sp_on 0,1
1720 sp_put 0,(5,200),0,0
1730 '選択肢 2 Off
1740 sp_def 1,(5,300),32,32
1750 sp_on 1,0
1760 sp_put 1,(5,300),0,0
1770 '選択肢 3 Off
1780 sp_def 2,(5,400),32,32
1790 sp_on 2,0
1800 sp_put 2,(5,400),0,0
1810 '選択肢 4 Off
1820 sp_def 3,(5,500),32,32
1830 sp_on 3,0
1840 sp_put 3,(5,500),0,0
1850 color rgb(0,0,0)
1860 Main_Select:
1870 'y:バーチャルパッドの処理
1880 'key$:カーソルの処理
1890 y = 0:key$ = "":bg = 0
1900 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
1910 y = stick(1)
1920 key$ = inkey$
1930 bg = strig(1)
1940 pause 2
1950 wend
1960 'if y=1 then
1970 'select case (No Mod 4)
1980 'ase 0:
1990 '     c=1:No=c:sp_on 0,1:sp_on 1,0 :sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print " 数霊(かずたま)チェックを選択":beep:goto Main_Select:
2000 'case 1:
2010 '       =2:No=c:sp_on 0,0:
2020 '"ase 2:
2030 'ase 3:
2040 'nd select
2050 'ndif
2060 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
2070 '1.バーチャルパッドの処理
2080 'バーチャルパッド下を押した時
2090 if y = 1 then
2100 select case No
2110 'No の初期値：No=1
2120 case 1:
2130 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":
2140 if lang_flag = 1 then
2150 'lang_flag=1 英語
2160 else
2170 'lang_flag=0 日本語
2180 locate 0,12:print "2.設定を選択":goto Main_Select:
2190 endif
2200 'デバッグライン　ここから
2210 '0のとき
2220 'デバッグライン　ここまで
2230 'デバッグライン　ここから
2240 'バーチャルパッド　下
2250 case 2:
2260 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:
2270 if lang_flag = 1 then
2280 else
2290 print "                                         ":
2300 color rgb(0,0,0):locate 0,12:
2310 print "3.ヘルプを選択":No=3:goto Main_Select:
2320 endif
2330 'cls:color rgb(255,255,255):print"ok"
2340 'デバッグライン　ここまで
2350 case 3:
2360 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                               "
2370 if lang_flag = 1 then
2380 else
2390 locate 0,12:print "4.終了を選択":No=0:goto Main_Select:
2400 endif
2410 'デバッグライン　ここから
2420 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
2430 'デバッグライン　ここまで
2440 case 0:
2450 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1
2460 if lang_flag = 1 then
2470 'lang_flag=1:英語
2480 else
2490 'lang_flag=0:日本語
2500 locate 0,12:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
2510 'endif
2520 endif
2530 'デバッグライン　ここから
2540 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
2550 'デバッグライン　ここまで
2560 end select
2570 endif
2580 'バーチャルパッド　上 ここから
2590 if y = -1 then
2600 select case No
2610 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
2620 case 1:
2630 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       "
2640 if lang_flag = 1 then
2650 'lang_flag=1 英語
2660 else
2670 'lang_flag=0 日本語
2680 locate 0,12:print "4.終了を選択":goto Main_Select:
2690 endif
2700 'endif
2710 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
2720 case 0:
2730 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":
2740 if lang_flag = 1 then
2750 '1:英語
2760 else
2770 '0:日本語
2780 locate 0,12:print "3.ヘルプを選択":goto Main_Select:
2790 endif
2800 'No:3 3.Help→2.設定 No:2
2810 case 3:
2820 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      "
2830 if lang_flag = 1 then
2840 '1:英語
2850 else
2860 '0:日本語
2870 locate 0,12:print"2.設定を選択":goto Main_Select:
2880 endif
2890 case 2:
2900 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":
2910 if lang_flag = 1 then
2920 'lang_flag 1 英語
2930 else
2940 'lang_flag 0 日本語
2950 locate 0,12:print"1.数霊(かずたま)チェックを選択":goto Main_Select:
2960 endif
2970 end select
2980 endif
2990 if bg=1 then
3000 select case No
3010 '1.数霊チェックを選択  パッドの右キー(決定)
3020 case 1:
3030 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
3040 '2.設定を選択  パッドの右キー(決定)
3050 case 2:
3060 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
3070 '3.ヘルプを選択 パッドの右(決定)
3080 case 3:
3090 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
3100 'プログラムの終了を選択(決定)
3110 case 0:
3120 cls 3:cls 4:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:
3130 if lang_flag = 1 then
3140 'lang_flag = 1 英語
3150 else
3160 'lang_flag = 0 日本語
3170 ui_msg "プログラムを終了します":color rgb(255,255,255):end
3180 endif
3190 end select
3200 '4.終了するを選択  パッドの右
3210 endif
3220 'バーチャルパッド　上　ここまで
3230 '2.カーソルの処理
3240 'カーソル　下 chr$(31)
3250 if (key$ = chr$(31)) then
3260 select case (No)
3270 '4
3280 '0 選択肢4 => 選択肢1
3290 case 0:
3300 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "              ":color rgb(0,0,0):
3310 if lang_flag = 1 then
3320 'lang flag:1 英語
3330 else
3340 'lang flag:0 日本語
3350 color rgb(0,0,0):locate 0,12:print "1.数霊(かずたま)チェックを選択":beep:goto Main_Select:
3360 endif
3370 '1 選択肢1 => 選択肢2
3380 case 1:
3390 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":
3400 if lang_flag = 1 then
3410 'lang_flag:1 英語
3420 else
3430 'lang_flag:0 日本語
3440 color rgb(0,0,0):locate 0,12:print "2.設定を選択":beep:goto Main_Select:
3450 endif
3460 '2 選択肢2 => 選択肢3
3470 case 2:
3480 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "               ":
3490 if lang_flag = 1 then
3500 'lang flag:1 英語
3510 else
3520 'lang flang:0 日本語
3530 color rgb(0,0,0):locate 0,12:print "3.ヘルプを選択":beep:goto Main_Select:
3540 endif
3550 '3 選択肢３ => 選択肢4
3560 case 3:
3570 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "               ":color rgb(0,0,0)
3580 if lang_flag = 1 then
3590 'lang_flag = 1 英語
3600 else
3610 'lang_flag = 0 日本語
3620 color rgb(0,0,0):locate 0,12:print "4.終 了を選択":beep:goto Main_Select:
3630 endif
3640 case else:
3650 goto Main_Select:
3660 end select
3670 endif
3680 'カーソル　上
3690 if key$=chr$(30) then
3700 select case (No)
3710 '選択肢1 => 選択肢4
3720 case 1:
3730 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:PRINT "                      ":
3740 if lang_flag = 1 then
3750 'lang_flag=1:英語
3760 else
3770 'lang_flag = 0:日本語
3780 else
3790 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
3800 endif
3810 '選択肢2 => 選択肢1
3820 case 2:
3830 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                 ":locate 1,12:beep:print "2.設 定を選択":beep:goto Main_Select:
3840 '選択肢3　=> 選択肢2
3850 case 3:
3860 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0
3870 if lang_flag = 1 then
3880 'lang_flag = 1:英語
3890 else
3900 'lang_flag = 0:日本語
3910 locate 0,12:beep:print "3.ヘルプを選択":goto Main_Select:
3920 endif
3930 '選択肢4 => 選択肢3
3940 case 0:
3950 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 1,12:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
3960 if lang_flag = 1 then
3970 'lang flag=1 英語
3980 else
3990 'lang flag=0 日本語
4000 locate 1,12:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
4010 endif
4020 end select
4030 endif
4040 'Input "番号:",No
4050 'エンターキー入力:決定
4060 if key$ = chr$(13) then
4070 select case No
4080 case 1:
4090 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4100 case 3:
4110 Color rgb(255,255,255):goto Help:
4120 case 0:
4130 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
4140 case 2:
4150 color rgb(255,255,255):goto Setting:
4160 'else
4170 'goto Main_Select:
4180 end select
4190 endif
4200 'ndif
4210 'if N0=0 or No>4 then goto TopScreen:
4220 '1-1.数霊チェック
4230 Surei_Check:
4240 cls 3:Font 48:
4250 'gload Gazo$ + "Screen4.png"
4260 gload Gazo$ + "Screen1_Sureicheck_Top20211226.png"
4270 play ""
4280 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
4290 color rgb(255,0,0)
4300 'print "●数霊(かずたま)チェックトップ" + chr$(13)
4310 sp_on 0,1:sp_put 0,(5,200),0,0:screen 1,1,1
4320 if lang_flag = 1 then
4330 'lang_flag=1 英語
4340 else
4350 'lang_flag=0 日本語
4360 print chr$(13)
4370 color rgb(255,255,255)
4380 print "番号を選んでください" + chr$(13)
4390 print " :1.数霊(かずたま)1人用" + chr$(13)
4400 print " :2.数霊(かずたま)2人用" + chr$(13)
4410 print " :3.前の画面に戻る" + chr$(13)
4420 print " :4.終 了" + chr$(13)
4430 color rgb(0,0,0):No = 1
4440 locate 0,12
4450 print "1.数霊1人用を選択"
4460 endif
4470 Kazutama_main:
4480 'y:バーチャルパッドの処理
4490 'key$:カーソルの処理
4500 'bg:バーチャルパッドの右のボタン
4510 y = 0:key$ = "":bg=0
4520 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
4530 y = stick(1)
4540 key$ = inkey$
4550 bg=strig(1)
4560 pause 2
4570 wend
4580 'key$ = input$(1)
4590 if y = 1 then
4600 select case No
4610 'No の初期値：No=1
4620 case 1:
4630 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":
4640 if lang_flag=1 then
4650 else
4660 locate 0,12
4670 print"2.数霊(かずたま)2人用を選択":goto Kazutama_main:
4680 endif
4690 'デバッグライン　ここから
4700 '0のとき
4710 'デバッグライン　ここまで
4720 'デバッグライン　ここから
4730 case 2:
4740 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                               "
4750 color rgb(0,0,0):locate 1,12:print "3.前の画面に戻るを選択":No=3:goto Kazutama_main:
4760 'cls:color rgb(255,255,255):print"ok"
4770 'デバッグライン　ここまで
4780 case 3:
4790 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Kazutama_main:
4800 'デバッグライン　ここから
4810 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
4820 'デバッグライン　ここまで
4830 case 0:
4840 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.数霊(かずたま)1人用を選択":goto Surei_Input:
4850 'デバッグライン　ここから
4860 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
4870 'デバッグライン　ここまで
4880 end select
4890 endif
4900 'バーチャルパッド　上 ここから
4910 if y = -1 then
4920 select case No
4930 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
4940 case 1:
4950 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択":goto Kazutama_main:
4960 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
4970 case 0:
4980 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.ヘルプを選択":goto Kazutama_main:
4990 'No:3 3.Help→2.設定 No:2
5000 case 3:
5010 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.設定を選択":goto Kazutama_main:
5020 case 2:
5030 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.数霊(かずたま)チェックを選択":goto Kazutama_main:
5040 end select
5050 endif
5060 if bg=1 then
5070 select case No
5080 '1.数霊チェックを選択  パッドの右キー
5090 case 1:
5100 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
5110 '2.設定を選択    パッドの右キー
5120 case 2:
5130 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
5140 '3.ヘルプを選択 パッドの右
5150 case 3:
5160 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
5170 'プログラムの終了を選択
5180 case 0:
5190 cls 3:cls 4:ui_msg "プログラムを終了します":color rgb(255,255,255):end
5200 end select
5210 '4.終了するを選択  パッドの右
5220 endif
5230 'バーチャルパッド　上　ここまで
5240 if key$ = chr$(31) then
5250 select case No
5260 case 0:
5270 No=1:sp_on 0,0:sp_on 1,1:sp_put 0,(5,300),0,0:locate 1,12:print "                                                          ":
5280 if lang_flag = 1 then
5290 Else
5300 No=2:locate 0,12:print "2.数霊(かずたま)2人用を選択":goto Kazutama_main:
5310 endif
5320 case 1:
5330 No=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                                          ":
5340 if lang_flag = 1 then
5350 Else
5360 locate 1,12:print"3.前の画面に戻るを選択":goto Kazutama_main:
5370 endif
5380 case 2:
5390 No=3:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print"                                       ":
5400 if lang_flag = 1 then
5410 Else
5420 locate 1,12:print"4.終了を選択":goto Kazutama_main:
5430 endif
5440 case 3:
5450 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":
5460 if lang_flag = 1 then
5470 Else
5480 No=1:locate 1,12:print"1.数霊（かずたま)1人用を選択":goto Kazutama_main:
5490 endif
5500 end select
5510 endif
5520 if key$=chr$(13) then
5530 select case No
5540 case 1:
5550 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
5560 case 2:
5570 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
5580 case 3:
5590 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
5600 case 0:
5610 cls 4:cls 3:talk"プログラムを終了します":ui_text"プログラムを終了します":end
5620 end select
5630 endif
5640 'Input "番号:",No
5650 '前の画面に戻る
5660 'if No = 3 then goto TopScreen:
5670 'プログラムの終了
5680 'if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":COLOR rgb(255,255,255):end
5690 '1人用
5700 'if No = 1 then goto Surei_Input:
5710 '2人用
5720 'if No = 2 then goto Surei_twoParson:
5730 'if No > 4 or No=0 then ui_msg"もう一度入れてください":goto Surei_Check:
5740 '数霊(かずたま) 文字入力  1人用
5750 Surei_Input:
5760 if mode = 0 then
5770 cls 3:font 32:init"kb:2"
5780 gload Gazo$ + "InputKotodama_20211226.png"
5790 play""
5800 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
5810 color rgb(255,0,0)
5820 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
5830 if lang_flag=1 then
5840 '英語
5850 else
5860 print chr$(13)
5870 color rgb(0,0,0)
5880 print "文字を入れてください" + chr$(13)
5890 color rgb(255,0,0)
5900 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
5910 print chr$(13)
5920 color rgb(0,0,0)
5930 Input "入力文字:",buffer_moji$
5940 if buffer_moji$ = "" then
5950 ui_msg "未入力です":goto Surei_Input:
5960 'endif
5970 else
5980 goto Surei_Result:
5990 endif
6000 endif
6010 endif
6020 'else
6030 if mode = 1 then
6040 cls 3:Font 32:
6050 gload Gazo$ + "InputKotodama.png"
6060 color rgb(255,0,0)
6070 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
6080 color rgb(255,255,255)
6090 print "文字を入れてください" + chr$(13)
6100 color rgb(255,0,0)
6110 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
6120 print "大文字のみ)" + chr$(13)
6130 color rgb(0,0,0)
6140 Input "文字入力:",buffer_moji2$
6150 goto Surei_Result3:
6160 'endif
6170 endif
6180 '数霊(かずたま)文字入力　2人用
6190 Surei_twoParson:
6200 cls 3:Font 32:init"kb:2"
6210 gload Gazo$ + "InputKotodama_20211226.png"
6220 '1人目入力
6230 if lang_flag = 1 then
6240 'color rgb(255,0,0)
6250 else
6260 print ""+chr$(13)
6270 'print "●数霊(かずたま) 1人目 入力" + chr$(13)
6280 color rgb(255,0,0)
6290 print "1人目の文字を入れてください" + chr$(13)
6300 color rgb(255,0,0)
6310 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
6320 color rgb(0,0,0)
6330 print chr$(13)
6340 Input "1人目文字入力:",buf_Parson1$
6350 endif
6360 Surei_twoParson2:
6370 cls 3:Font 32:init"kb:2"
6380 '2人目入力
6390 gload Gazo$ + "InputKotodama_20211226.png"
6400 'color rgb(255,0,0)
6410 'print "●数霊(かずたま) 2人目 入力" + chr$(13)
6420 if lang_falg = 1 then
6430 else
6440 print ""+chr$(13)
6450 print "2人目の文字を入れてください" + chr$(13)
6460 color rgb(255,0,0)
6470 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
6480 color rgb(0,0,0)
6490 Input "2人目の文字入力:",buf_Parson2$
6500 goto Surei_Result2:
6510 endif
6520 '数霊　計算 パート
6530 '文字の計算関数
6540 'moji$:1文字を入れる
6550 func Complate(moji$)
6560 for n = 1 to 116
6570 if moji$ = bufline$(2*n) then
6580 buffcount = val(bufline$(2 * n + 1))
6590 endif
6600 next n
6610 endfunc buffcount
6620 '数霊　結果表示
6630 Surei_Result:
6640 cls 3:Font 32
6650 'ゼロカウント:zcount
6660 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
6670 '例 アカい:"い"の文字は無効な文字なので、はじく
6680 zcount=0
6690 'mojicount:入力文字数
6700 mojicount = len(buffer_moji$)
6710 for n=1 to mojicount
6720 for j=1 to 118
6730 if (bufcount$(n - 1) = bufline$(2 * j)) then
6740   bufcount$(n-1) = Mid$(buffer_moji$,n,1)
6750 endif
6760 next j
6770 next n
6780 'if mojicount > zcount then
6790 'cls 3:ui_msg "無効な文字です":talk "無効な文字があります。":zcount = 0:goto Surei_Input:
6800 ncount=0:count=0
6810    for i = 1 to mojicount
6820     bufcount$(i-1)=Mid$(buffer_moji$,i,1)
6830   'ンのカウント
6840    if (bufcount$(i-1) = "ン") then ncount = ncount + 1
6850     'bufcount$(i-1)=Mid$(buffer_moji$,i,1)
6860    next i
6870    if (ncount > 0) then
6880    'Listを表示する
6890    moji_List$(0) = "この単語は目に見える物です"
6900    moji_List$(1) = "この単語は目に見えない物です"
6910    num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
6920    if (num2 = 0) then
6930      ' n1 = n1 + 0
6940    else
6950    if (num2 = 1) then
6960       n1 = 9 * ncount
6970       'buf_count = 9 * ncount
6980    endif
6990    endif
7000    endif
7010 'else
7020    for j=1 to mojicount
7030    bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7040    count = count + Complate(bufcount$(j - 1))
7050   ' count = count + n1:count2 = count
7060 'endif
7070    'count = count + buf_count:
7080    next j
7090    count = count + n1
7100 if (ncount > 0) then count = count
7110 '182以上のとき,181を引く
7120 if buf_cofig_r = 0 then
7130      if (count > 181) then
7140 'if buf_config_r = 0 then
7150         count = count - 181
7160 'else
7170 'if buf_config_r = 1 then
7180 '   count=Single_Complate(count2)
7190 'endif
7200      else
7210      if (buf_config_r = 1) then
7220        'count2 = count - 180
7230        buf_count = Single_Complate(count)
7240      endif
7250 endif
7260 endif
7270 'if config_r = 0 then
7280 cls 3:Font 48+16
7290 gload Gazo$ + "Result_Screen3_20211226.png"
7300 if buf_config_r = 1 then
7310    print "入力文字:" + buffer_moji$ + chr$(13)
7320    print "数霊(かずたま):";buf_count;chr$(13)
7330 endif
7340 if lang_flag = 1 then
7350 else
7360 color rgb(255,0,0)
7370 print "入力文字:" + buffer_moji$ + chr$(13)
7380 endif
7390 'print chr$(13)
7400 if lang_flag = 1 then
7410 else
7420 color rgb(0,0,255)
7430 print "数霊(かずたま):";count;chr$(13)
7440 endif
7450 if lang_flag = 1 then
7460 else
7470 color rgb(0,0,0)
7480 print "エンターキー:トップ" + chr$(13)
7490 print "スペース:次 へ" + chr$(13)
7500 'endif
7510 endif
7520 key$ = input$(1)
7530 if key$ = " " then goto Surei_Result4:
7540 if key$ = chr$(13) then
7550 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
7560 for i=0 to 9
7570 bufcount$(i) = " "
7580 next i
7590 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
7600 'else
7610 'if key$ = " " then
7620 '２回めの入力に行く
7630 'mode = 1:goto Surei_Input:
7640 'else
7650 'if key$ = "s" or key$ = "S" then
7660 'ファイルを保存する
7670 's = Save()
7680 'ui_msg"保存しました"
7690 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
7700 else
7710 goto Surei_Result:
7720 'endif
7730 endif
7740 '3-1 バージョン情報
7750 Version:
7760 cls 3:Font 32
7770 gload Gazo$ + "Screen1_Version.png"
7780 play ""
7790 play Voice_File_TopScreen$ + "Voice_Version.mp3"
7800 color rgb(255,0,0)
7810 'print"●バージョン情報"+chr$(13)
7820 print chr$(13)
7830 color rgb(255,255,255)
7840 if lang_flag = 1 then
7850 else
7860 print "Ver:";Version$ + chr$(13)
7870 print "アプリ名:数霊"+ chr$(13)
7880 print "Basic for Android Runtime" + chr$(13)
7890 print "Author:licksjp" + chr$(13)
7900 print "制作開始:2021.7.28" + chr$(13)
7910 print chr$(13)
7920 print "(C)Copy right licksjp " + chr$(13)
7930 print "All rights reserved" + chr$(13)
7940 color rgb(0,0,0)
7950 print "パッドの右を押してください" + chr$(13)
7960 endif
7970 'key$ = input$(1)
7980 bg=0:key$=""
7990 while (bg <> 1 and key$ <> chr$(13))
8000 bg = strig(1)
8010 key$ = inkey$
8020 pause 2
8030 wend
8040 if key$ = chr$(13) then
8050 goto TopScreen:
8060 'else
8070 'talk "無効なキーです":goto Version:
8080 else
8090 if bg=1 then
8100 goto TopScreen:
8110 else
8120 if lang_flag = 1 then
8130 else
8140 talk "無効なキーです":goto Version:
8150 endif
8160 endif
8170 endif
8180 '3-2 参考文献
8190 Reference_Book:
8200 cls 3:Font 48:play""
8210 gload Gazo$ + "Screen1_Reference.png"
8220 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
8230 color rgb(255,0,0)
8240 'print"●参考文献" + chr$(13)
8250 print chr$(13)
8260 if lang_flag = 1 then
8270 else
8280 color rgb(255,255,255)
8290 print "書名:数霊" + chr$(13)
8300 print "出版社:徳間書店" + chr$(13)
8310 print "ISBN:978-4-19-" + chr$(13)
8320 print "         865309-5" + chr$(13)
8330 print "定価:2300円 + 税" + chr$(13)
8340 color rgb(0,0,0)
8350 print "パッドの右を押してください"
8360 endif
8370 bg = 0:key$ = ""
8380 while (bg <> 1 and key$ <> chr$(13))
8390 bg = strig(1)
8400 key$ = inkey$
8410 pause 2
8420 wend
8430 if key$ = chr$(13) then
8440 goto TopScreen:
8450 'else
8460 'talk "無効なキーです":goto Reference_Book:
8470 else
8480 if bg = 1 then
8490 goto TopScreen:
8500 else
8510 talk "無効なキーです":goto Reference_Book:
8520 endif
8530 endif
8540 'key$=input$(1)
8550 'if key$=chr$(13) then
8560 'goto TopScreen:
8570 'else
8580 'talk"無効なキーです":goto Reference_Book:
8590 'endif
8600 'ヘルプ画面　トップ画面
8610 Help:
8620 No=1:c=0
8630 play ""
8640 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
8650 cls 3:Font 48:
8660 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
8670 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0
8680 color rgb(255,0,0)
8690 'print "●3.ヘルプ　トップ画面" + chr$(13)
8700 print chr$(13)
8710 color rgb(255,255,255)
8720 print "番号を選んでください" + chr$(13)
8730 print " :1.バージョン" + chr$(13)
8740 print " :2.参考文献" + chr$(13)
8750 print " :3.トップ画面" + chr$(13)
8760 print " :4.終 了" + chr$(13)
8770 color rgb(0,0,0)
8780 if No = 1 then print " バージョンを選択"
8790 'y:バーチャルパッドの処理
8800 'key$:カーソルの処理
8810 'bg:バーチャルパッドの右ボタン
8820 Help_key:
8830 y = 0:key$ = "":bg=0
8840 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
8850 y = stick(1)
8860 key$ = inkey$
8870 bg=strig(1)
8880 pause 2
8890 wend
8900 'バーチャルパッド　ここから'
8910 if y = 1 then
8920 select case No
8930 'No の初期値：No=1
8940 case 1:
8950 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.参考文献を選択":goto Help_key:
8960 if lang_flag = 1 then
8970 else
8980 locate 1,12:print"2.参考文献を選択":goto Help_key:
8990 endif
9000 'デバッグライン　ここから
9010 '0のとき
9020 'デバッグライン　ここまで
9030 'デバッグライン　ここから
9040 case 2:
9050 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 1,12:print "                  "
9060 color rgb(0,0,0):locate 1,12:print "3.トップ画面に行くを選択":No=3:goto Help_key:
9070 'cls:color rgb(255,255,255):print"ok"
9080 'デバッグライン　ここまで
9090 case 3:
9100 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print "                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Help_key:
9110 'デバッグライン　ここから
9120 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
9130 'デバッグライン　ここまで
9140 case 0:
9150 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.バージョンを選択":goto Help_key:
9160 'デバッグライン　ここから
9170 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
9180 'デバッグライン　ここまで
9190 end select
9200 endif
9210 'バーチャルパッド　上 ここから
9220 if y = -1 then
9230 select case No
9240 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
9250 case 1:
9260 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Kazutama_main:
9270 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
9280 case 0:
9290 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面に行くを選択":goto Kazutama_main:
9300 'No:3 3.Help→2.設定 No:2
9310 case 3:
9320 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.参考文献を選択":goto Kazutama_main:
9330 case 2:
9340 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.バージョンを選択":goto Kazutama_main:
9350 end select
9360 endif
9370 if bg = 1 then
9380 select case No
9390 '1.数霊チェックを選択  パッドの右キー
9400 case 1:
9410 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
9420 '2.設定を選択    パッドの右キー
9430 case 2:
9440 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
9450 '3.ヘルプを選択 パッドの右
9460 case 3:
9470 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
9480 'プログラムの終了を選択
9490 case 0:
9500 cls 3:cls 4:color rgb(255,255,255):end
9510 if lang_flag = 1 then
9520 'lang_flag = 1:英語
9530 Else
9540 'lang_flag = 0:日本語
9550 print "プログラムを終了します"
9560 endif
9570 end select
9580 '4.終了するを選択  パッドの右
9590 endif
9600 'バーチャルパッド　上　ここまで
9610 'バーチャルパッド　ここまで'
9620 'key$ = input$(1)
9630 'カーソルの下
9640 if key$ = chr$(31) then
9650 select case (No Mod 4)
9660 'バージョンから参考文献
9670 case 0:
9680 c=1:No=c:locate 0,12:Print "             ":locate 0,12:print " 参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
9690 '参考文献からトップ画面
9700 case 1:
9710 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "            ":locate 0,12:print " トップ画面を選択":goto Help_key:
9720 'トップ画面から終了
9730 case 2:
9740 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 0,12:print " 終 了を選択":goto Help_key:
9750 '終了からバージョン
9760 case 3:
9770 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                     ":locate 0,12:print " バージョンを選択":goto Help_key:
9780 case else:
9790 goto Help_key:
9800 end select
9810 endif
9820 'カーソル　上
9830 if key$ = chr$(30) then
9840 select case (c Mod 4)
9850 'バージョンから終了
9860 case 0:
9870 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:locate 0,12:print "                   ":locate 0,12:print " 終 了を選択":goto Help_key:
9880 '参考文献からバージョン
9890 case 1:
9900 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                   ":locate 0,12:print " バージョンを選択":goto Help_key:
9910 'トップ画面から参考文献
9920 case 2:
9930 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":locate 0,12:print " 参考文献を選択":goto Help_key:
9940 '終了からトップ画面を選択
9950 case 3:
9960 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print"                      ":locate 0,12:print " トップ画面を選択":goto Help_key:
9970 case else:
9980 goto Help_key:
9990 end select
10000 endif
10010 'Input "番号:",No
10020 'sp_def 0,(5,200),32,32
10030 'エンターキー：決定
10040 if key$=chr$(13) then
10050 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10060 if No=3 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10070 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10080 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg "プログラムを終了します":cls 3:cls 4:end
10090 else
10100 goto Help_key:
10110 endif
10120 'if (No = 0 or No > 4) then ui_msg "もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
10130 '登録文字の確認
10140 '文字を1文字入れて登録されているか調べるメニュー
10150 '設定項目
10160 Setting:
10170 cls 3:Font 48
10180 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
10190 play ""
10200 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
10210 No=1
10220 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
10230 color rgb(0,0,255)
10240 'print "●設定項目" + chr$(13)
10250 print chr$(13)
10260 if lang_flag = 1 then
10270 'lang_flag = 1:英語
10280 else
10290 'lang_flag = 0:日本語
10300 color rgb(255,255,255)
10310 print "番号を選んでください" + chr$(13)
10320 '-------コメント----------------
10330 'print " :1.登録文字の確認" + chr$(13)
10340 'print " :2.数霊文字確認" + chr$(13)
10350 '-------コメント----------------
10360 print " :1.文字の項目" + chr$(13)
10370 print " :2.結果表示設定" + chr$(13)
10380 print " :3.トップ画面に行く" + chr$(13)
10390 print " :4.終 了" + chr$(13)
10400 endif
10410 color rgb(0,0,0)
10420 locate 1,12
10430 if No=1 then print "1.文字の項目を選択"
10440 'y:バーチャルパッドの処理
10450 'key$:カーソルの処理
10460 'bg:バーチャルパッドの右ボタン
10470 SettingScreen:
10480 y = 0:key$ = "":bg=0
10490 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
10500 y = stick(1)
10510 key$ = inkey$
10520 bg=strig(1)
10530 pause 2
10540 wend
10550 'バーチャルパッド　ここから'
10560 'バーチャルパッド　ここから'
10570 if y = 1 then
10580 select case No
10590 'No の初期値：No=1
10600 case 1:
10610 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":color rgb(0,0,0):locate 1,12:print "2.結果表示設定を選択":goto SettingScreen:
10620 'デバッグライン　ここから
10630 '0のとき
10640 'デバッグライン　ここまで
10650 'デバッグライン　ここから
10660 case 2:
10670 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                         "
10680 color rgb(0,0,0)::No=3
10690 if lang_flag = 1 then
10700 else
10710 locate 1,12:print "3.トップ画面に行くを選択":goto SettingScreen:
10720 endif
10730 'cls:color rgb(255,255,255):print"ok"
10740 'デバッグライン　ここまで
10750 case 3:
10760 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                              ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
10770 'デバッグライン　ここから
10780 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
10790 'デバッグライン　ここまで
10800 case 0:
10810 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.文字の項目を選択":goto SettingScreen:
10820 'デバッグライン　ここから
10830 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
10840 'デバッグライン　ここまで
10850 end select
10860 endif
10870 'バーチャルパッド　上 ここから
10880 if y = -1 then
10890 select case No
10900 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
10910 case 1:
10920 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択":goto SettingScreen:
10930 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
10940 case 0:
10950 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
10960 'No:3 3.Help→2.設定 No:2
10970 case 3:
10980 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.結果表示設定を選択":goto SettingScreen:
10990 case 2:
11000 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.文字の項目を選択":goto SettingScreen:
11010 end select
11020 endif
11030 if bg=1 then
11040 select case No
11050 '1.数霊チェックを選択  パッドの右キー
11060 case 1:
11070 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
11080 '2.設定を選択    パッドの右キー
11090 case 2:
11100 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
11110 '3.ヘルプを選択 パッドの右
11120 case 3:
11130 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
11140 'プログラムの終了を選択
11150 case 0:
11160 cls 3:cls 4::color rgb(255,255,255):pause 2.052*1000:end
11170 if lang_flag = 1 then
11180 Else
11190 ui_msg "プログラムを終了します"
11200 endif
11210 end select
11220 endif
11230 '4.終了するを選択  パッドの右
11240 'バーチャルパッド　ここまで'
11250 'SettingScreen:
11260 'key$ = input$(1)
11270 'カーソル下'
11280 if key$ = chr$(31) then
11290 select case (No Mod 4)
11300 '登録文字から数霊文字の確認
11310 case 1:
11320 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                     ":locate 1,12:print "2.結果表示設定を選択":goto SettingScreen:
11330 '数霊文字の確認からトップ画面に行く
11340 case 2:
11350 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
11360 'トップ画面に行くから終了
11370 case 3:
11380 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
11390 '終了から登録文字
11400 case 0:
11410 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print "1.文字の項目を選択":goto SettingScreen:
11420 end select
11430 endif
11440 'カーソル　上
11450 if key$ = chr$(30) then
11460 select case (No Mod 4)
11470 case 1:
11480 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
11490 case 2:
11500 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
11510 case 3:
11520 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
11530 case 0:
11540 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
11550 end select
11560 endif
11570 'エンターキーを押したとき
11580 if key$ = chr$(13) then
11590 if No=3 then goto TopScreen:
11600 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
11610 'if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji1:
11620 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
11630 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:color rgb(255,255,255):pause 3*120:end
11640 'lse
11650 'o'o SettingScreen:
11660 endif
11670 'endif
11680 'endif
11690 '文字検索項目  ここから
11700 Moji_Search:
11710 cls 4:cls 3:Font 32+16:init"kb:2"
11720 gload Gazo$ + "Moji_Search_Result.png"
11730 play ""
11740 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
11750 print "" + chr$(13)
11760 color rgb(255,0,0)
11770 if lang_flag = 1 then
11780 Else
11790 print "文字を一文字入れてください" + chr$(13)
11800 endif
11810 color rgb(0,0,0)
11820 if lang_flag=1 then
11830 Else
11840 Input "登録文字:",moji$
11850 endif
11860 moji_count = len(moji$)
11870 if moji_count > 1 then
11880 if lang_flag = 1 then
11890 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
11900 Else
11910 endif
11920 else
11930 count=0
11940 for n = 0 to 116
11950 if bufline$(2*n) = moji$ then
11960 cls 3:font 48:init"kb:4"
11970 gload Gazo$ + "Moji_Search_Result.png"
11980 'talk"この文字は登録されています"
11990 play ""
12000 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12010 if lang_flag = 1 then
12020 Else
12030 print chr$(13)
12040 color rgb(255,0,0)
12050 print moji$;"は、登録されています。" + chr$(13)
12060 color rgb(0,0,0)
12070 print "エンターキーを押してください"
12080 endif
12090 bg = 0:key$ = ""
12100 while (bg <> 1 and key$ <> chr$(13))
12110 key$ = inkey$
12120 bg = strig(1)
12130 pause 2
12140 wend
12150 'y$=input$(1)
12160 if key$ = chr$(13) then goto TopScreen:
12170 if bg=1 then goto TopScreen:
12180 count = count + 1
12190 endif
12200 next n
12210 if count = 0 then
12220 cls 3:font 48:init "kb:2"
12230 gload Gazo$ + "Moji_check.png"
12240 play ""
12250 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
12260 print chr$(13)
12270 if lang_flag = 1 then
12280 Else
12290 color rgb(255,0,0)
12300 print moji$;"は、登録されていません。" + chr$(13)
12310 color rgb(0,0,0)
12320 print "パッドの右を押してください" + chr$(13)
12330 endif
12340 kg = 0:key$ = ""
12350 while (kg <> 1 and key$ <> chr$(13))
12360 key$ = inkey$
12370 kg = strig(1)
12380 pause 2
12390 wend
12400 if key$ = chr$(13) then goto TopScreen:
12410 endif
12420 endif
12430 Surei_Result2:
12440 cls 3:Font 48
12450 zcount1=0:zcount2=0:count1=0:count2=0
12460 '1人目
12470 mojicount1=len(buf_Parson1$)
12480 '2人目
12490 mojicount2 = len(buf_Parson2$)
12500 '1人目
12510 for n = 1 to mojicount1
12520 for j = 1 to 116
12530 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
12540 if bufcount1$(n-1) = bufline$(2*j) then
12550 zcount1 = zcount1 + 1
12560 endif
12570 next j
12580 next n
12590 '2人目
12600 for n = 1 to mojicount2
12610 for j = 1 to 116
12620 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
12630 if bufcount2$(n-1) = bufline$(2*j) then
12640 zount2 = zcount2 + 1
12650 endif
12660 next j
12670 next n
12680 '1人目
12690 for i=1 to mojicount1
12700 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
12710 p1 = Complate(bufcount1$(i-1))
12720 count1 = count1 + p1
12730 next i
12740 '2人目
12750 for i = 1 to mojicount2
12760 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
12770 p2 = Complate(bufcount2$(i-1))
12780 count2 = count2 + p2
12790 next i
12800 cls 3:
12810 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
12820 color rgb(255,0,0)
12830 'print "数霊 2人用 結果表示"+chr$(13)
12840 print ""+chr$(13)
12850 if lang_flag = 1 then
12860 else
12870 color rgb(255,255,255)
12880 print "1人目:";buf_Parson1$;chr$(13)
12890 print "数霊1:";count1;chr$(13)
12900 print "2人目:";buf_Parson2$;chr$(13)
12910 print "数霊2:";count2;chr$(13)
12920 print "数霊(合計):";count1 + count2;chr$(13)
12930 color rgb(0,0,0)
12940 print "エンターキーを押してください" + chr$(13)
12950 endif
12960 key$ = "":bg = 0
12970 'ey$=input$(1)
12980 while (bg <> 1 and key$ <> chr$(13))
12990 bg = strig(1)
13000 key$ = inkey$
13010 pause 2
13020 wend
13030 if (bg = 1 or key$ = chr$(13))  then goto TopScreen:
13040 Surei_Result3:
13050 cls 3:Font 48
13060 zcount2 = 0:count2 = 0
13070 mojicount2 = len(buffer_moji2$)
13080 for n = 1 to mojicount2
13090 for j = 1 to 116
13100 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
13110 if bufcount2$(n - 1) = bufline$(2 * j) then
13120 zcount2 = zcount2 + 1
13130 endif
13140 next j
13150 next n
13160 for i = 1 to mojicount2
13170 n2 = Complate(bufcount2$(i-1))
13180 count2 = count2 + n2
13190 next i
13200 gload Gazo$ + "Screen5.png"
13210 if lang_flag = 1 then
13220 else
13230 color rgb(255,0,0)
13240 print "数霊の結果表示" + chr$(13)
13250 color rgb(255,255,255)
13260 print "１回目回の文字入力:";buffer_moji$;chr$(13)
13270 print "１回目の数霊(かずたま)";count;chr$(13)
13280 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
13290 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
13300 color rgb(0,0,0)
13310 print "エンターキー:トップ画面";chr$(13)
13320 print "c or C キー:数霊の比較";chr$(13)
13330 endif
13340 key$ = "":bg = 0
13350 while (key$ <> chr$(13) and bg <> 1)
13360 bg = strig(1)
13370 key$ = inkey$
13380 pause 2
13390 wend
13400 'key$ = input$(1)
13410 if bg = 1 then goto TopScreen:
13420 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
13430 if key$ = "c" or key$ = "C" then
13440 if count = count2 then
13450 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
13460 else
13470 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
13480 endif
13490 endif
13500 Moji_Count_Check:
13510 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
13520 cls 3:Font 48
13530 gload Gazo$ + "Moji_check.png"
13540 n = 0
13550 open FILE_csv$ for input as #1
13560 while eof(1) = 0
13570 line input #1, line$
13580 n = n + 1
13590 wend
13600 close #1
13610 'n = n - 1
13620 'talk "登録文字数は"+str$(n)+"文字です"
13630 play ""
13640 if n = 118 then
13650 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
13660 if lang_flag = 1 then
13670 else
13680 'talk "登録文字数は、" + str$(n) + "文字です"
13690 print "" + chr$(13)
13700 color rgb(255,0,0)
13710 print "文字の登録文字数は";n;"文字" + chr$(13)
13720 color rgb(0,0,0)
13730 print "パッドの右を押してください" + chr$(13)
13740 endif
13750 endif
13760 'key$ = input$(1)
13770 key$ = "":bg = 0
13780 while (key$ <> chr$(13) and bg <> 1)
13790 key$=inkey$
13800 bg=strig(1)
13810 pause 2
13820 wend
13830 if bg = 1 then goto TopScreen:
13840 if key$ = chr$(13) then
13850 goto TopScreen:
13860 else
13870 goto Moji_Count_Check:
13880 endif
13890 'Save 関数
13900 file_kazutama = 0
13910 file_kazutama = Save_File()
13920 func Save_File()
13930 open SAVE_DATA1$  for output as #1
13940 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
13950 close #1
13960 endfunc
13970 Select_moji:
13980 cls 3:font 48:No = 1
13990 gload Gazo$ + "Screen1_mojicheck.png"
14000 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
14010 color rgb(255,0,0)
14020 'print "文字の確認" + chr$(13)
14030 if lang_flag = 1 then
14040 else
14050 print chr$(13)
14060 color rgb(255,255,255)
14070 print "番号を選んでください" + chr$(13)
14080 print " :1.登録文字検索"+ chr$(13)
14090 print " :2.登録文字数の確認" + chr$(13)
14100 print " :3.前の画面に戻る" + chr$(13)
14110 print " :4.終　了" + chr$(13)
14120 color rgb(0,0,0)
14130 if No = 1 then print "1.登録文字の確認を選択"
14140 endif
14150 Entry_check_key:
14160 y = 0:key$ = "":bg=0
14170 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
14180 y = stick(1)
14190 key$ = inkey$
14200 bg=strig(1)
14210 pause 2
14220 wend
14230 'バーチャルパッド　ここから'
14240 'バーチャルパッド　ここから'
14250 if y = 1 then
14260 select case No
14270 'No の初期値：No=1
14280 case 1:
14290 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.登録文字数の確認":goto Entry_check_key:
14300 'デバッグライン　ここから
14310 '0のとき
14320 'デバッグライン　ここまで
14330 'デバッグライン　ここから
14340 case 2:
14350 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                       "
14360 :No=3:goto Entry_check_key:
14370 if lang_flag = 1 then
14380 Else
14390 color rgb(0,0,0):locate 0,12:print " 3.トップ画面に行く"
14400 endif
14410 'cls:color rgb(255,255,255):print"ok"
14420 'デバッグライン　ここまで
14430 case 3:
14440 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Entry_check_key:
14450 'デバッグライン　ここから
14460 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
14470 'デバッグライン　ここまで
14480 case 0:
14490 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_check_key:
14500 'デバッグライン　ここから
14510 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
14520 'デバッグライン　ここまで
14530 end select
14540 endif
14550 'バーチャルパッド　上 ここから
14560 if y = -1 then
14570 select case No
14580 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
14590 case 1:
14600 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Entry_check_key:
14610 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
14620 case 0:
14630 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                      ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
14640 'No:3 3.Help→2.設定 No:2
14650 case 3:
14660 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
14670 case 2:
14680 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_check_key:
14690 end select
14700 endif
14710 if bg=1 then
14720 select case No
14730 '1.数霊チェックを選択  パッドの右キー
14740 case 1:
14750 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
14760 '2.設定を選択    パッドの右キー
14770 case 2:
14780 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
14790 '3.ヘルプを選択 パッドの右
14800 case 3:
14810 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
14820 'プログラムの終了を選択
14830 case 0:
14840 cls 3:cls 4::color rgb(255,255,255):pause 2.052 * 1000:end
14850 if lang_flag = 1 then
14860 else
14870 ui_msg "プログラムを終了します"
14880 endif
14890 end select
14900 endif
14910 '4.終了するを選択  パッドの右
14920 'バーチャルパッド　ここまで'
14930 'key$ = input$(1)
14940 'カーソルの下
14950 if key$ = chr$(31) then
14960 select case (No Mod 4)
14970 case 0:
14980 c=1:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
14990 case 1:
15000 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:sp_on 3,0:goto Entry_check_key:
15010 case 2:
15020 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:goto Entry_check_key:
15030 case 3:
15040 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
15050 end select
15060 endif
15070 'カーソル　上
15080 if key$ = chr$(30) then
15090 select case (No Mod 4)
15100 case 0:
15110 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
15120 case 1:
15130 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
15140 case 2:
15150 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
15160 case 3:
15170 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
15180 end select
15190 endif
15200 'エンターキーを押す
15210 if key$ = chr$(13) then
15220 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15230 if No = 2 then goto Moji_Count_Check:
15240 if No = 3 then goto TopScreen:
15250 if No = 0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg
15260 endif
15270 '
15280 Kakunin_Surei_count:
15290 cls 3:font 48:No=1
15300 gload Gazo$ + "Kazutama_List_Top.png"
15310 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
15320 color rgb(255,0,0)
15330 print chr$(13)
15340 color rgb(255,255,255)
15350 if lang_flag = 1 then
15360 else
15370 print "番号を選んでください" + chr$(13)
15380 print " :1.数霊リスト 1人用" + chr$(13)
15390 print " :2.結果表示設定" + chr$(13)
15400 print " :3.トップ画面に行く" + chr$(13)
15410 print " :4.終 了" + chr$(13)
15420 print "" + chr$(13)
15430 endif
15440 color rgb(0,0,0)
15450 locate 0,12:print"                                                         "
15460 if No = 1 then locate 1,12:print "1.数霊リスト　1人用を選択"
15470 Entry_List:
15480 y = 0:key$ = "":bg=0
15490 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
15500 y = stick(1)
15510 key$ = inkey$
15520 bg = strig(1)
15530 pause 2
15540 wend
15550 'バーチャルパッド　ここから'
15560 'バーチャルパッド　ここから'
15570 'バーチャルパッド　下
15580 if y = 1 then
15590 select case No
15600 'No の初期値：No=1
15610 case 1:
15620 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.結果表示設定":goto Entry_List:
15630 'デバッグライン　ここから
15640 '0のとき
15650 'デバッグライン　ここまで
15660 'デバッグライン　ここから
15670 case 3:
15680 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,12:print "                                       "
15690 color rgb(0,0,0):locate 1,12:print "4.終了を選択":No=0:goto Entry_List:
15700 'cls:color rgb(255,255,255):print"ok"
15710 'デバッグライン　ここまで
15720 case 0:
15730 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,200),0,0:pause 200:locate 0,12:print"                                       ":locate 0,12:print "1.数霊リスト 1人用を選択":No=1:goto Entry_List:
15740 case 2:
15750 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 1,12:print "                                      ":No=2:locate 1,12:print "3．トップ画面に行く":goto Entry_List:
15760 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print "                        15110 'デバッグライン　ここから3:locate 1,12:print "15120 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
15770 case 1:
15780 'デバッグライン　ここから
15790 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
15800 'デバッグライン　ここまで
15810 'case 0:
15820 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_List:
15830 'デバッグライン　ここから
15840 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
15850 'デバッグライン　ここまで
15860 end select
15870 endif
15880 'バーチャルパッド　上 ここから
15890 if y = -1 then
15900 select case No
15910 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15920 case 1:
15930 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 1,12:print "                                       ":locate 1,12:print "4.終了を選択"::goto Entry_List:
15940 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15950 case 0:
15960 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print "                                      ":locate 1,12:print"2.トップ画面に行くを選択":goto Entry_List:
15970 'No:3 3.Help→2.設定 No:2
15980 case 2:
15990 sp_on 1,0:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.数霊リスト 1人用を選択":goto Entry_List:
16000 'case 2:
16010 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_List:
16020 end select
16030 endif
16040 if bg = 1 then
16050 select case No
16060 '1.数霊リスト 一人用を選択を選択  パッドの右キー
16070 case 1:
16080 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16090 '2.設定を選択  パッドの右キー
16100 case 2:
16110 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16120 '4.終了を選択 パッドの右
16130 case 0:
16140 cls 3:cls 4:color rgb(255,255,255):
16150 if lang_flag = 1 then
16160 Else
16170 ui_msg"プログラムを終了します":end
16180 endif
16190 'プログラムの終了を選択
16200 end select
16210 endif
16220 '4.終了するを選択  パッドの右
16230 'バーチャルパッド　ここまで'
16240 'Input "番号:",No
16250 'if No=2 then goto TopScreen:
16260 'if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
16270 'if No=1 then goto Surei_List1:
16280 'if No > 3 or No=0 then ui_msg"無効な数字です、入れ直してください":talk"無効な数字です":goto Kakunin_Surei_count:
16290 'if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
16300 Surei_List1:
16310 cls 3:font 48
16320 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
16330 file$ = dir$(SAVE_DATA1$,0)
16340 'ファイルが無いときの画面
16350 if file$ = ""  then
16360 gload "./data/Gazo/" + "KazutamaList1.png",0
16370 print chr$(13)
16380 color rgb(255,0,0):print "登録ファイルはございません" + chr$(13)
16390 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
16400 'else
16410 'endif
16420 bg = 0:key$ = ""
16430 while (key$ <> chr$(13) and bg<>1)
16440 key$ = inkey$
16450 bg = strig(1)
16460 pause 2
16470 wend
16480 'エンターキーもしくはバーチャルパッドの右でトップに行く
16490 if (bg = 1  or key$ = chr$(13)) then goto TopScreen:
16500 else
16510 cls 3:buffer_list_count = Loadcount()
16520 color rgb(255,255,255)
16530 if lang_flag = 1 then
16540 Else
16550 talk "登録件数は" + str$(buffer_list_count) + "件です"
16560 gload Gazo$ + "KazutamaList1_Entry.png",0
16570 color rgb(0,0,255)
16580 print chr$(13)
16590 color rgb(255,0,0)
16600 print "登録件数:";buffer_list_count;"件";chr$(13)
16610 color rgb(0,0,0)
16620 print "パッドの右を押してください" + chr$(13)
16630 endif
16640 bg = 0:key$ = "":bg2 = 0
16650 while (key$ <> chr$(13) and bg <> 1)
16660 key$ = inkey$
16670 bg = strig(1)
16680 bg2=strig(0)
16690 pause 2
16700 wend
16710 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
16720 if (key$ = chr$(13) or bg = 1) then pause 2:goto KotodamaList_page:
16730 endif
16740 if (bg2 = 1) then pause 2:goto TopScreen:
16750 func Loadcount()
16760 n = 0
16770 'while eof(1)=-1
16780 open SAVE_DATA1$  for input as #1
16790 while eof(1) <> -1
16800 line input #1,line$
16810 n = n + 1
16820 wend
16830 close #1
16840 count = n
16850 endfunc count
16860 count_line = Loadcount()
16870 func Kotodama$(buf$)
16880 color rgb(255,255,255)
16890 b = len("数霊:")
16900 a$ = Mid$(buf$,b+1,len(buf$))
16910 for i=0 to 118
16920 color rgb(255,255,255)
16930 if bufline3$(2 * i) ="数霊:" + a$  then
16940 moji_$ = bufline3$(2*i + 1)
16950 'moji_$ = bufline3$(21)
16960 'moji$ = a$
16970 endif
16980 next i
16990 'kotodama$ = a$
17000 kotodama$ = moji_$
17010 endfunc kotodama$
17020 KotodamaList_page:
17030 cls 3:font 48:m = 0:
17040 gload Gazo$ + "Screen5_Surei_List.png"
17050 if SAVE_DATA1$ = "" then
17060 cls 3:print"ファイルがありません"
17070 else
17080 a = Loadcount()
17090 open SAVE_DATA1$  for input as #1
17100 for i=0 to a-1
17110 for n=0 to 1
17120 input #1,line$
17130 bufKaztama$(i,n) = line$
17140 next n
17150 next i
17160 close #1
17170 'endif
17180 l = 0:n=0
17190 gload Gazo$ + "Screen5_Surei_List.png"
17200 while (buffer_list_count >= l)
17210 'while (l<=a)
17220 cls
17230 color rgb(255,0,0)
17240 'print "数霊　リスト" + chr$(13)
17250 print chr$(13)
17260 color rgb(255,255,255)
17270 n=n+1
17280 'while (n <= a)
17290 print "番号:";l+1;chr$(13)
17300 print bufKaztama$(l,0) + chr$(13)
17310 print bufKaztama$(l,1) + chr$(13)
17320 'n=n+1
17330 Kmoji$ = moji$
17340 print chr$(13) + chr$(13)
17350 color rgb(0,0,0)
17360 print " :パッドの左:トップ画面" + chr$(13)
17370 print " :パッドの右:次へ行く" + chr$(13)
17380 'wend
17390 key$ = "":bg = 0:bg2 = 0
17400 while (key$ <> chr$(13) and bg <> 1 and bg2 <> 1)
17410 key$ = inkey$
17420 bg = strig(1)
17430 bg2 = strig(0)
17440 pause 2
17450 wend
17460 'key$ = input$(1)
17470 if (key$ = " " OR bg = 1) then
17480 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
17490 else
17500 if ((bg2 = 1) or (key$=chr$(13))) then
17510    goto TopScreen:
17520 endif
17530 else
17540 goto KotodamaList_page:
17550 endif
17560 wend
17570 'wend
17580 endif
17590 '結果表示２ Menu1
17600 Surei_Result4:
17610 cls 3:font (48-16):init"kb:4"
17620 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
17630 for i=0 to 181 + 3 - 1
17640 if i = count  then
17650 buffer$ = bufline2$(count + 4,0)
17660 endif
17670 next i
17680 if len(buffer$) > 23 and len(buffer$) <= 45 then
17690 buffer2$ = Mid$(buffer$,1,24)
17700 buffer3$ = Mid$(buffer$,25,(len(buffer$) - 25))
17710 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)
17720 else
17730 if len(buffer$) <= 23 then
17740 buffer2$ = Mid$(buffer$,1,22)
17750 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
17760 else
17770 if len(buffer$) > 45 and len(buffer$) <= 64 then
17780 buffer2$ = Mid$(buffer$,1,22)
17790 buffer3$ = Mid$(buffer$,23,20)
17800 buffer4$ = Mid$(buffer$,43,(len(buffer$)-43))
17810 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)+chr$(13)
17820 else
17830 if len(buffer$) > 64 and len(buffer$) <= 81 then
17840 buffer2$ = Mid$(buffer$,1,23)
17850 buffer3$ = Mid$(buffer$,24,20)
17860 buffer4$ = Mid$(buffer$,42,20)
17870 buffer5$ = Mid$(buffer$,63,(len(buffer$)-62))
17880 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13) + chr$(13) + chr$(13)
17890 if len(buffer$) > 81 and len(buffer$) <= 110 then
17900 buffer2$ = Mid$(buffer$,1,21)
17910 buffer3$ = Mid$(buffer$,22,20)
17920 buffer4$ = Mid$(buffer$,42,20)
17930 buffer5$ = Mid$(buffer$,62,20)
17940 buffer6$ = Mid$(buffer$,82,(len(buffer$) - 82))
17950 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13) + chr$(13) + chr$(13)
17960 endif
17970 endif
17980 endif
17990 endif
18000 endif
18010 Surei_Result4_2:
18020 gload Gazo$ + "Screen1_Result2.png"
18030 cls
18040 color rgb(255,0,0)
18050 'print "診断結果 2" + chr$(13)
18060 print chr$(13)
18070 if lang_flag = 1 then
18080 else
18090 color rgb(127,255,212)
18100 print "入力文字:";buffer_moji$;chr$(13)
18110 print "数霊:";count;chr$(13)
18120 color rgb(255,255,255)
18130 print "数霊の説明:"+chr$(13)
18140 print buffer$
18150 color rgb(0,0,0)
18160 print "(パッド 左):保存,S(パッド 右):トップ画面" + chr$(13)
18170 endif
18180 key$ = "":bg = 0:bg2 = 0
18190 while (key$<>chr$(13) and bg<>1 and bg2<>1)
18200 key$=inkey$
18210 bg=strig(1)
18220 bg2=strig(0)
18230 pause 2
18240 wend
18250 if bg=1 then buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
18260 if key$ = chr$(13) then
18270 buffer$ = "":buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
18280 endif
18290 if bg2=1 then
18300 'ファイルがない時
18310 if dir$(SAVE_DATA1$) = "" then
18320 open SAVE_DATA1$ for output as #1
18330 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18340 close #1
18350 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
18360 'ファイルが有る時
18370 else
18380 open SAVE_DATA1$ for append as #1
18390 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18400 close #1
18410 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
18420 endif
18430 endif
18440 if key$="s" or key$="S" then
18450 if dir$(SAVE_DATA1$) = "" then
18460 open SAVE_DATA1$ for output as #1
18470 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18480 close #1
18490 ui_msg"保存しました":talk"保存しました":goto Surei_Result4_2:
18500 else
18510 open SAVE_DATA1$ for append as #1
18520 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18530 close #1
18540 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
18550 endif
18560 else
18570 talk "無効な文字です":goto Surei_Result4_2:
18580 endif
18590 'endif
18600 func All_clear()
18610 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
18620 endfunc
18630 'ここから
18640 Config_moji1:
18650 cls 3:Font 48
18660 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
18670 play ""
18680 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
18690 No=1
18700 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
18710 color rgb(0,0,255)
18720 'print "●設定項目" + chr$(13)
18730 print chr$(13)
18740 if lang_flag = 1 then
18750 'lang_flag = 1:英語
18760 else
18770 'lang_flag = 0:日本語
18780 color rgb(255,255,255)
18790 print "番号を選んでください" + chr$(13)
18800 'print " :1.文字の項目" + chr$(13)
18810 'print " :2.結果表示設定" + chr$(13)
18820 print " :1.文字の項目" + chr$(13)
18830 print " :2.結果表示設定" + chr$(13)
18840 print " :3.トップ画面に行く" + chr$(13)
18850 print " :4.終 了" + chr$(13)
18860 endif
18870 color rgb(0,0,0)
18880 locate 1,12
18890 if No = 1 then print "1.文字の項目"
18900 'y:バーチャルパッドの処理
18910 'key$:カーソルの処理
18920 'bg:バーチャルパッドの右ボタン
18930 Config_moji1_Screen:
18940 y = 0:key$ = "":bg=0
18950 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
18960 y = stick(1)
18970 key$ = inkey$
18980 bg=strig(1)
18990 pause 2
19000 wend
19010 'バーチャルパッド　ここから'
19020 'バーチャルパッド　ここから'
19030 if y = 1 then
19040 select case No
19050 'No の初期値：No=1
19060 case 1:
19070 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
19080 'デバッグライン　ここから
19090 '0のとき
19100 'デバッグライン　ここまで
19110 'デバッグライン　ここから
19120 case 2:
19130 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
19140 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
19150 if lang_flag = 1 then
19160 else
19170 locate 1,12:print "3.トップ画面に行くを選択"
19180 endif
19190 'cls:color rgb(255,255,255):print"ok"
19200 'デバッグライン　ここまで
19210 case 3:
19220 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
19230 'デバッグライン　ここから
19240 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
19250 'デバッグライン　ここまで
19260 case 0:
19270 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
19280 'デバッグライン　ここから
19290 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
19300 'デバッグライン　ここまで
19310 end select
19320 endif
19330 'バーチャルパッド　上 ここから
19340 if y = -1 then
19350 select case No
19360 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
19370 case 1:
19380 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
19390 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
19400 case 0:
19410 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
19420 'No:3 3.Help→2.設定 No:2
19430 case 3:
19440 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
19450 case 2:
19460 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
19470 end select
19480 endif
19490 if bg=1 then
19500 select case No
19510 '1.数霊チェックを選択  パッドの右キー
19520 case 1:
19530 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
19540 '2.設定を選択    パッドの右キー
19550 case 2:
19560 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
19570 '3.ヘルプを選択 パッドの右
19580 case 3:
19590 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
19600 'プログラムの終了を選択
19610 case 0:
19620 cls 3:cls 4::color rgb(255,255,255):pause 2.052*1000:end
19630 if lang_flag = 1 then
19640 Else
19650 ui_msg "プログラムを終了します"
19660 endif
19670 end select
19680 endif
19690 '4.終了するを選択  パッドの右
19700 'バーチャルパッド　ここまで'
19710 'SettingScreen:
19720 'key$ = input$(1)
19730 'カーソル下'
19740 if key$ = chr$(31) then
19750 select case (No Mod 4)
19760 '登録文字から数霊文字の確認
19770 case 1:
19780 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
19790 '数霊文字の確認からトップ画面に行く
19800 case 2:
19810 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
19820 'トップ画面に行くから終了
19830 case 3:
19840 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
19850 '終了から登録文字
19860 case 0:
19870 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
19880 end select
19890 endif
19900 'カーソル　上
19910 if key$ = chr$(30) then
19920 select case (No Mod 4)
19930 case 1:
19940 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
19950 case 2:
19960 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
19970 case 3:
19980 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
19990 case 0:
20000 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
20010 end select
20020 endif
20030 'エンターキーを押したとき
20040 if key$ = chr$(13) then
20050 if No=3 then goto TopScreen:
20060 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
20070 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
20080 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:color rgb(255,255,255):pause 3*120:end
20090 'lse
20100 'o'o SettingScreen:
20110 endif
20120 'ここまで
20130 Config_moji2:
20140 cls 3:Font 48
20150 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
20160 play ""
20170 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
20180 No=1
20190 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
20200 color rgb(0,0,255)
20210 'print "●設定項目" + chr$(13)
20220 print chr$(13)
20230 if lang_flag = 1 then
20240 'lang_flag = 1:英語
20250 else
20260 'lang_flag = 0:日本語
20270 color rgb(255,255,255)
20280 print "番号を選んでください" + chr$(13)
20290 'print " :1.文字の項目" + chr$(13)
20300 'print " :2.結果表示設定" + chr$(13)
20310 print " :1.文字の項目" + chr$(13)
20320 print " :2.結果表示設定" + chr$(13)
20330 print " :3.トップ画面に行く" + chr$(13)
20340 print " :4.終 了" + chr$(13)
20350 endif
20360 color rgb(0,0,0)
20370 locate 1,12
20380 if No = 1 then print "1.文字の項目"
20390 'y:バーチャルパッドの処理
20400 'key$:カーソルの処理
20410 'bg:バーチャルパッドの右ボタン
20420 config_moji2:
20430 y = 0:key$ = "":bg=0
20440 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
20450 y = stick(1)
20460 key$ = inkey$
20470 bg = strig(1)
20480 pause 2
20490 wend
20500 'バーチャルパッド　ここから'
20510 'バーチャルパッド　ここから'
20520 if y = 1 then
20530 select case No
20540 'No の初期値：No=1
20550 case 1:
20560 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
20570 'デバッグライン　ここから
20580 '0のとき
20590 'デバッグライン　ここまで
20600 'デバッグライン　ここから
20610 case 2:
20620 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
20630 color rgb(0,0,0)::No=3:goto SettingScreen:
20640 if lang_flag = 1 then
20650 else
20660 locate 1,12:print "3.トップ画面に行くを選択"
20670 endif
20680 'cls:color rgb(255,255,255):print"ok"
20690 'デバッグライン　ここまで
20700 case 3:
20710 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
20720 'デバッグライン　ここから
20730 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
20740 'デバッグライン　ここまで
20750 case 0:
20760 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
20770 'デバッグライン　ここから
20780 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
20790 'デバッグライン　ここまで
20800 end select
20810 endif
20820 'バーチャルパッド　上 ここから
20830 if y = -1 then
20840 select case No
20850 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
20860 case 1:
20870 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
20880 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
20890 case 0:
20900 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
20910 'No:3 3.Help→2.設定 No:2
20920 case 3:
20930 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
20940 case 2:
20950 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
20960 end select
20970 endif
20980 '決定ボタン
20990 if bg=1 then
21000 select case No
21010 '1.数霊チェックを選択  パッドの右キー
21020 case 1:
21030 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
21040 '2.設定を選択    パッドの右キー
21050 case 2:
21060 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
21070 '3.ヘルプを選択 パッドの右
21080 case 3:
21090 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
21100 'プログラムの終了を選択
21110 case 0:
21120 cls 3:cls 4::color rgb(255,255,255):pause 2.052*1000:end
21130 if lang_flag = 1 then
21140 Else
21150 ui_msg "プログラムを終了します"
21160 endif
21170 end select
21180 endif
21190 '4.終了するを選択  パッドの右
21200 'バーチャルパッド　ここまで'
21210 'SettingScreen:
21220 'key$ = input$(1)
21230 'カーソル下'
21240 if key$ = chr$(31) then
21250 select case (No Mod 4)
21260 '登録文字から数霊文字の確認
21270 case 1:
21280 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
21290 '数霊文字の確認からトップ画面に行く
21300 case 2:
21310 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
21320 'トップ画面に行くから終了
21330 case 3:
21340 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
21350 '終了から登録文字
21360 case 0:
21370 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21380 end select
21390 endif
21400 'カーソル　上
21410 if key$ = chr$(30) then
21420 select case (No Mod 4)
21430 case 1:
21440 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
21450 case 2:
21460 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
21470 case 3:
21480 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
21490 case 0:
21500 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
21510 end select
21520 endif
21530 'エンターキーを押したとき
21540 if key$ = chr$(13) then
21550 if No=3 then goto TopScreen:
21560 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
21570 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
21580 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4:color rgb(255,255,255):pause 3 * 120:end
21590 'lse
21600 'o'o SettingScreen:
21610 endif
21620 '結果表示設定
21630 Result_Setting:
21640 color rgb(255,255,255)
21650 'dim list$(4)
21660 'ファイル読み込み
21670 '1.ファイルが有るか無いかのチェック
21680 if Dir$(System$) = "" then
21690 '1-1.ファイルがないとき
21700 '上のSystemフォルダを作成
21710 mkdir "./System/"
21720 list$(0) = "●:出た数字から181を引く"
21730 list$(1) = " :出た数字から180を引き単数変換"
21740 open System$ for output as #1
21750 print #1,"config_r=0"
21760 close #1
21770 ui_msg "ファイルを作成しました"
21780 'ファイル作成
21790 else
21800 '1-2.ファイルが有るとき
21810 'config_r:0 出た数字から181を引く
21820 'config_r:1 出た数字から180を引いて単数変換
21830 'open "./System/config.sys" for input as #1
21840 'ファイルが有るときファイルを読み込み
21850 open System$ for input as #1
21860 line input #1,buf_line$
21870 'buf$にデーターをコピーする
21880 buf$ = buf_line$
21890 close #1
21900 if len(buf$) = 10 then
21910  if left$(buf$,9) = "config_r=" then
21920  buf$ = right$(buf_line$,1)
21930  if buf$ = "1" then
21940    '1.System$ ファイルを削除(config.sys)
21950    '2.1行目をconfig_r=1と書き、保存する
21960    buf_config_r = 1
21970    'list$(0) = "●:1.出た数字から180を引いて単数変換"
21980    'list$(1) = " :2.出た数字から181を引く"
21990    else
22000  if buf$ = "0" then
22010    buf_config_r = 0
22020   ' list$(0) = "●:1.出た数字から181を引く"
22030   'list$(1) = " :2.出た数字から180を引いて単数変換"
22040  endif
22050  endif
22060  endif
22070 endif
22080 endif
22090 '"●:1.出た数字から180を引く"をlist$(0)に代入
22100 if buf_config_r =  0 then
22110 list$(0) = "●:1.出た数字から181を引く"
22120 list$(1) = " :2.出た数字から180を引いて単数変換"
22130 else
22140 list$(0) = "●:1.出た数字から180を引いて単数変換"
22150 list$(1) = " :2.出た数字から181を引く"
22160 endif
22170 list$(2) = " :トップ画面に戻る"
22180 list$(3) = " :終 了"
22190 list_num = ui_select("list$","番号を選んでください")
22200 play ""
22210 Select case (list_num)
22220 case 0:
22230        if buf$ = "1" then
22240        buf_config_r = 0:
22250        'データーを変更したのでファイルを削除
22260        kill System$
22270        'ファイルを新しく作成
22280        open System$ for output as #1
22290        print #1,"config_r=0"
22300        close #1
22310        ui_msg "設定を変更しました。"
22320        else
22330        'if buf$ = "0" then
22340        'buf_config_r = 1
22350        'kill System$
22360        'open Syetem$ for output as #1
22370        'print #1,"config_r=1"
22380        'close #1
22390        'ui_msg "設定を変更しました"
22400        'endif
22410        endif
22420        goto config_moji2:
22430 case 1:
22440        if buf$ = "0" then
22450        buf_config_r = 1:
22460        'データーを変更したので、ファイルを削除
22470        kill System$
22480        'ファイルを新しく作成
22490        open System$ for output as #1
22500        print #1,"config_r=1"
22510        close #1
22520        ui_msg "設定を変更しました"
22530        else
22540        kill System$
22550        if buf$ = "1" then
22560        open System$ for output as #1
22570        print #1,"config_r=0"
22580        close #1
22590        ui_msg "設定を変更しました"
22600        endif
22610        endif
22620        goto config_moji2:
22630 case 2:
22640       'トップ画面に飛ぶ
22650        goto TopScreen:
22660 case 3:
22670       'プログラムを終了する
22680       cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
22690 end select
22700 '単数変換
22710 Func Single_Complate(num)
22720 '1.出てきた数字から180を引く
22730 a = num - 180
22740 'a:10〜99
22750 Re1:
22760 if (a > 9 and a < 100) then
22770  b1 = fix(a / 10)
22780  b2 = 10 * a - b1
22790  d1 = b1 + b2
22800 if c>9 then
22810  goto Re1:
22820 else
22830  c=d1:goto Re2:
22840 endif
22850 endif
22860 Re2:
22870 buffer = c
22880 endfunc buffer
