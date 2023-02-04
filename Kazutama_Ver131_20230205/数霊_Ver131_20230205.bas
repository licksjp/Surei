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
410 '2023年度
420 'Version 1.2.7_2023.01.03-2023.01.06(Release):正式版
430 'version 1.2.8_2023.01.07-2023.01.14(Release):正式版
440 'Version 1.2.9_2023.01.15-2023.01.22(Release):正式版
450 'Version 1.3.0_2023.01.23-2023.01.29(Release):正式版
460 'Version 1.3.1_2023.01.29-2023.02.05(Release):正式版
470 '現在のバージョン
480 Version$ = "1.3.1_2023.02.05(正式版)"
490 'csvファイル 1.数霊 ベースファイル
500 FILE_csv$ = "data/Kazutama.csv"
510 'csvファイル 2.数霊 ベースファイル 2
520 FILE_csv2$ = "data/Surei_chart_20211207.csv"
530 'Save ファイル
540 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
550 'gazo ファイル
560 Gazo$ = "data/Gazo/"
570 'System フォルダ:設定ファイルを保存するところ
580 System$ = "System/config.sys"
590 '設定ファイル名:config.sys
600 'Sound File(Voice)
610 '1.ボイス TopScreen
620 Voice_File_TopScreen$ = "data/Sound_data/"
630 '変数領域
640 'vcount:バーチャルパッド下の変数
650 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
660 count2 = 0:N=0:N2=0:m2 = 0
670 dim list$(4),moji_List$(2)
680 'ファイルの有無チェック
690 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
700 '1.ファイルが無いとき
710 cls :print "依存ファイルが見つかりません":
720 print "エンターキーを押してください" + chr$(13)
730 key$ = input$(1)
740 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
750 else
760 '2.ファイルが有るとき
770 cls:print "csv:file ok." + chr$(13)
780 n=0
790 open FILE_csv$ for input as #1
800 while eof(1) = 0
810 input #1,line$
820 'print line$
830 bufline$(n) = line$
840 'Print n;chr$(13)
850 n = n + 1
860 wend
870 close #1
880 N=n
890 '2つ目のファイル読み込み
900 'n = 0
910 open FILE_csv2$ for input as #2
920 for n=3 to 181
930 for i=0 to 1
940 input #2,line$
950 bufline2$(n,i) = line$
960 next i
970 next n
980 close #2
990 N2 = n
1000 '
1010 endif
1020 '設定ファイルの読み込み
1030 'open System$ for input as #1
1040 'line input #1,buf_line$
1050  'if len(buf_line$) = 10 then
1060   'if left$(buf_line$,9)="config_r=" then
1070   ' buf$ = right$(buf_line$,1)
1080    'if buf$ = "1" then
1090    '   buf_config_r = 1
1100   ' else
1110   '    buf_config_r = 0
1120   ' endif
1130  ' endif
1140 'endif
1150 'close #1
1160 'or j = 3 to 181+3
1170 'ufline3$(j - 3,n) = bufline2$(i,n)
1180 'next j
1190 'moji$ = Kotodama$(bufline3$(16))
1200 'erase bufline2$
1210 '2022.11.23----------------------
1220 '端末言語のチェック
1230 '日本語端末かチェックをして日本語以外なら英語で表示する
1240 'lang flag:0:日本語 1:英語(日本語以外)
1250 '--------------------------------
1260 lang_flag = 0
1270 if ex_info$(1) <> "JP" then
1280 lang_flag = 1
1290 endif
1300 'Top画面
1310 TopScreen:
1320 'バーチャルパッドを表示
1330 cls 3:font 48:screen 1,1,1:init"kb:4"
1340 'play ""
1350 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
1360 'gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
1370 gload Gazo$ + "TopScreen_20230129.png",0,0,0
1380 '選択肢 1
1390 gload Gazo$ + "Selection.png",1,5,300
1400 '選択肢 2
1410 gload Gazo$ + "Selection.png",1,5,400
1420 '選択肢 3
1430 gload Gazo$ + "Selection.png",1,5,500
1440 '選択肢 4
1450 gload Gazo$ + "Selection.png",1,5,600
1460 color rgb(0,0,255)
1470 print chr$(13)
1480 if lang_flag = 1 then
1490 color rgb(255,255,255)
1500 print "Select Number" + chr$(13)
1510 print " :1.Kazutama check" + chr$(13)
1520 print " :2.Setting" + chr$(13)
1530 print " :3.Help" + chr$(13)
1540 print " :4.End Program" + chr$(13)
1550 color rgb(255,255,255)
1560 else
1570 color rgb(255,255,255)
1580 print chr$(13)
1590 print "番号を選んでください" + chr$(13)
1600 print " :1.数霊(かずたま)チェック" + chr$(13)
1610 print " :2.設定" + chr$(13)
1620 print " :3.ヘルプ" + chr$(13)
1630 print " :4.終　了" + chr$(13)
1640 color rgb(0,0,0)
1650 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
1660 'バーチャルパッドを表示
1670 No=1:
1680 'lang_flag:1 外国語,0:日本語
1690 if lang_flag = 1 then
1700 'lang_flag=1 英語
1710 locate 0,15:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
1720 else
1730 'lang_flag=0 日本語
1740 locate 0,15:color rgb(0,0,0):print "1.数霊(かずたま)チェックを選択";chr$(13)
1750 endif
1760 endif
1770 'スプライト
1780 '選択肢 1 On
1790 sp_def 0,(5,300),32,32
1800 sp_on 0,1
1810 sp_put 0,(5,300),0,0
1820 '選択肢 2 Off
1830 sp_def 1,(5,400),32,32
1840 sp_on 1,0
1850 sp_put 1,(5,400),0,0
1860 '選択肢 3 Off
1870 sp_def 2,(5,500),32,32
1880 sp_on 2,0
1890 sp_put 2,(5,500),0,0
1900 '選択肢 4 Off
1910 sp_def 3,(5,600),32,32
1920 sp_on 3,0
1930 sp_put 3,(5,600),0,0
1940 color rgb(0,0,0)
1950 Main_Select:
1960 'y:バーチャルパッドの処理
1970 'key$:カーソルの処理
1980 y = 0:key$ = "":bg = 0
1990 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
2000 y = stick(1)
2010 key$ = inkey$
2020 bg = strig(1)
2030 pause 2
2040 wend
2050 'if y=1 then
2060 'select case (No Mod 4)
2070 'ase 0:
2080 '     c=1:No=c:sp_on 0,1:sp_on 1,0 :sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print " 数霊(かずたま)チェックを選択":beep:goto Main_Select:
2090 'case 1:
2100 '       =2:No=c:sp_on 0,0:
2110 '"ase 2:
2120 'ase 3:
2130 'nd select
2140 'ndif
2150 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
2160 '1.バーチャルパッドの処理
2170 'バーチャルパッド下を押した時
2180 if y = 1 then
2190 select case No
2200 'No の初期値：No=1
2210 case 1:
2220 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
2230 if lang_flag = 1 then
2240 'lang_flag=1 英語
2250 locate 0,15:print "2.It has selected Setting":goto Main_Select:
2260 else
2270 'lang_flag=0 日本語
2280 locate 0,15:print "2.設定を選択":goto Main_Select:
2290 endif
2300 'デバッグライン　ここから
2310 '0のとき
2320 'デバッグライン　ここまで
2330 'デバッグライン　ここから
2340 'バーチャルパッド　下
2350 case 2:
2360 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:
2370 print "                                         ":
2380 if lang_flag = 1 then
2390 color rgb(0,0,0):locate 0,15:
2400 print "3.It has selected Help":No=3:goto Main_Select:
2410 else
2420 color rgb(0,0,0):locate 0,15:
2430 print "3.ヘルプを選択":No=3:goto Main_Select:
2440 endif
2450 'cls:color rgb(255,255,255):print"ok"
2460 'デバッグライン　ここまで
2470 case 3:
2480 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print"                                               "
2490 if lang_flag = 1 then
2500 locate 0,15:print "4.It has selected finish program":No=0:goto Main_Select:
2510 else
2520 locate 0,15:print "4.終了を選択":No=0:goto Main_Select:
2530 endif
2540 'デバッグライン　ここから
2550 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
2560 'デバッグライン　ここまで
2570 case 0:
2580 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1
2590 if lang_flag = 1 then
2600 'lang_flag=1:英語
2610 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
2620 else
2630 'lang_flag=0:日本語
2640 locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
2650 'endif
2660 endif
2670 'デバッグライン　ここから
2680 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
2690 'デバッグライン　ここまで
2700 end select
2710 endif
2720 'バーチャルパッド　上 ここから
2730 if y = -1 then
2740 select case No
2750 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
2760 case 1:
2770 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       "
2780 if lang_flag = 1 then
2790 'lang_flag=1 英語
2800 locate 0,15:print "4.It has finished program":goto Main_Select:
2810 else
2820 'lang_flag=0 日本語
2830 locate 0,15:print "4.終了を選択":goto Main_Select:
2840 endif
2850 'endif
2860 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
2870 case 0:
2880 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":
2890 if lang_flag = 1 then
2900 '1:英語
2910 locate 0,15:print "3.It has selected Help":goto Main_Select:
2920 else
2930 '0:日本語
2940 locate 0,15:print "3.ヘルプを選択":goto Main_Select:
2950 endif
2960 'No:3 3.Help→2.設定 No:2
2970 case 3:
2980 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      "
2990 if lang_flag = 1 then
3000 '1:英語
3010 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3020 else
3030 '0:日本語
3040 locate 0,15:print"2.設定を選択":goto Main_Select:
3050 endif
3060 case 2:
3070 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":
3080 if lang_flag = 1 then
3090 'lang_flag 1 英語
3100 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3110 else
3120 'lang_flag 0 日本語
3130 locate 0,15:print"1.数霊(かずたま)チェックを選択":goto Main_Select:
3140 endif
3150 end select
3160 endif
3170 if bg=1 then
3180 select case No
3190 '1.数霊チェックを選択  パッドの右キー(決定)
3200 case 1:
3210 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
3220 '2.設定を選択  パッドの右キー(決定)
3230 case 2:
3240 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
3250 '3.ヘルプを選択 パッドの右(決定)
3260 case 3:
3270 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
3280 'プログラムの終了を選択(決定)
3290 case 0:
3300 cls 3:cls 4:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:
3310 'if lang_flag = 1 then
3320 'lang_flag = 1 英語
3330 'else
3340 'lang_flag = 0 日本語
3350 ui_msg "プログラムを終了します":color rgb(255,255,255):end
3360 'endif
3370 end select
3380 '4.終了するを選択  パッドの右
3390 endif
3400 'バーチャルパッド　上　ここまで
3410 '2.カーソルの処理
3420 'カーソル　下 chr$(31)
3430 if (key$ = chr$(31)) then
3440 select case (No)
3450 '4
3460 '0 選択肢4 => 選択肢1
3470 case 0:
3480 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "              ":color rgb(0,0,0):
3490 if lang_flag = 1 then
3500 'lang flag:1 英語
3510 else
3520 'lang flag:0 日本語
3530 color rgb(0,0,0):locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
3540 endif
3550 '1 選択肢1 => 選択肢2
3560 case 1:
3570 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":
3580 if lang_flag = 1 then
3590 'lang_flag:1 英語
3600 else
3610 'lang_flag:0 日本語
3620 color rgb(0,0,0):locate 0,15:print "2.設定を選択":beep:goto Main_Select:
3630 endif
3640 '2 選択肢2 => 選択肢3
3650 case 2:
3660 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,15:print "               ":
3670 if lang_flag = 1 then
3680 'lang flag:1 英語
3690 else
3700 'lang flang:0 日本語
3710 color rgb(0,0,0):locate 0,15:print "3.ヘルプを選択":beep:goto Main_Select:
3720 endif
3730 '3 選択肢３ => 選択肢4
3740 case 3:
3750 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "               ":color rgb(0,0,0)
3760 if lang_flag = 1 then
3770 'lang_flag = 1 英語
3780 else
3790 'lang_flag = 0 日本語
3800 color rgb(0,0,0):locate 0,15:print "4.終 了を選択":beep:goto Main_Select:
3810 endif
3820 case else:
3830 goto Main_Select:
3840 end select
3850 endif
3860 'カーソル　上
3870 if key$=chr$(30) then
3880 select case (No)
3890 '選択肢1 => 選択肢4
3900 case 1:
3910 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:PRINT "                      ":
3920 if lang_flag = 1 then
3930 'lang_flag=1:英語
3940 'print "1.It has selected Kazutama check":goto Main_Select:
3950 else
3960 'lang_flag = 0:日本語
3970 else
3980 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
3990 endif
4000 '選択肢2 => 選択肢1
4010 case 2:
4020 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                 ":locate 1,15:print "2.設 定を選択":goto Main_Select:
4030 '選択肢3　=> 選択肢2
4040 case 3:
4050 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,500),0,0
4060 if lang_flag = 1 then
4070 'lang_flag = 1:英語
4080 locate 0,15:print "It has selected Help":goto Main_Select:
4090 else
4100 'lang_flag = 0:日本語
4110 locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4120 endif
4130 '選択肢4 => 選択肢3
4140 case 0:
4150 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                ":locate 1,15:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
4160 if lang_flag = 1 then
4170 'lang flag=1 英語
4180 else
4190 'lang flag=0 日本語
4200 locate 1,15:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
4210 endif
4220 end select
4230 endif
4240 'Input "番号:",No
4250 'エンターキー入力:決定
4260 if key$ = chr$(13) then
4270 select case No
4280 case 1:
4290 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4300 case 3:
4310 Color rgb(255,255,255):goto Help:
4320 case 0:
4330 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
4340 case 2:
4350 color rgb(255,255,255):sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
4360 'else
4370 'goto Main_Select:
4380 end select
4390 endif
4400 'ndif
4410 'if N0=0 or No>4 then goto TopScreen:
4420 '1-1.数霊チェック
4430 Surei_Check:
4440 cls 3:Font 48:
4450 'gload Gazo$ + "Screen4.png"
4460 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png"
4470 play ""
4480 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
4490 color rgb(255,0,0)
4500 'print "●数霊(かずたま)チェックトップ" + chr$(13)
4510 sp_on 0,1:sp_put 0,(5,300),0,0:screen 1,1,1
4520 if lang_flag = 1 then
4530 'lang_flag=1 英語
4540 else
4550 'lang_flag=0 日本語
4560 print chr$(13)+chr$(13)+chr$(13)
4570 color rgb(255,255,255)
4580 print "番号を選んでください" + chr$(13)
4590 'print chr$(13)
4600 print " :1.数霊(かずたま)1人用" + chr$(13)
4610 print " :2.数霊(かずたま)2人用" + chr$(13)
4620 print " :3.トップ画面に行く" + chr$(13)
4630 print " :4.終 了" + chr$(13)
4640 color rgb(0,0,0):No = 1
4650 locate 0,15
4660 print " 1.数霊(かずたま)1人用を選択"
4670 endif
4680 Kazutama_main:
4690 'y:バーチャルパッドの処理
4700 'key$:カーソルの処理
4710 'bg:バーチャルパッドの右のボタン
4720 y = 0:key$ = "":bg=0
4730 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
4740 y = stick(1)
4750 key$ = inkey$
4760 bg=strig(1)
4770 y=stick(-1)
4780 pause 2
4790 wend
4800 'key$ = input$(1)
4810 if y = 1 then
4820 select case No
4830 'No の初期値：No=1
4840 case 1:
4850 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
4860 'if lang_flag=1 then
4870 'else
4880 locate 0,15
4890 print" 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
4900 'endif
4910 'デバッグライン　ここから
4920 '0のとき
4930 'デバッグライン　ここまで
4940 'デバッグライン　ここから
4950 case 2:
4960 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                               "
4970 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に行くを選択":No=3:goto Kazutama_main:
4980 'cls:color rgb(255,255,255):print"ok"
4990 'デバッグライン　ここまで
5000 case 3:
5010 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 4.終 了を選択":No=0:goto Kazutama_main:
5020 'デバッグライン　ここから
5030 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
5040 'デバッグライン　ここまで
5050 case 0:
5060 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5070 'デバッグライン　ここから
5080 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
5090 'デバッグライン　ここまで
5100 end select
5110 endif
5120 'バーチャルパッド　上 ここから
5130 if y = -1 then
5140 select case No
5150 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
5160 case 1:
5170 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 0,15:print" 4.終了を選択":goto Kazutama_main:
5180 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
5190 case 0:
5200 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
5210 'No:3 3.Help→2.設定 No:2
5220 case 3:
5230 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 0,15:print" 2.数霊（かずたま）2人用を選択":goto Kazutama_main:
5240 case 2:
5250 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5260 end select
5270 endif
5280 if bg=1 then
5290 select case No
5300 '1.数霊チェックを選択  パッドの右キー
5310 case 1:
5320 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
5330 '2.設定を選択    パッドの右キー
5340 case 2:
5350 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
5360 '3.ヘルプを選択 パッドの右
5370 case 3:
5380 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
5390 'プログラムの終了を選択
5400 case 0:
5410 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.05*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
5420 end select
5430 '4.終了するを選択  パッドの右
5440 endif
5450 'バーチャルパッド　上　ここまで
5460 if key$ = chr$(31) then
5470 select case No
5480 case 0:
5490 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,15:print "                                                          ":
5500 if lang_flag = 1 then
5510 Else
5520 No=2:locate 0,15:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
5530 endif
5540 case 1:
5550 No=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,12:print "                                                          ":
5560 if lang_flag = 1 then
5570 Else
5580 locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
5590 endif
5600 case 2:
5610 No=3:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,12:print"                                       ":
5620 if lang_flag = 1 then
5630 Else
5640 locate 0,12:print" 4.終了を選択":goto Kazutama_main:
5650 endif
5660 case 3:
5670 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                      ":
5680 if lang_flag = 1 then
5690 Else
5700 No=1:locate 0,15:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
5710 endif
5720 end select
5730 endif
5740 if key$=chr$(13) then
5750 select case No
5760 case 1:
5770 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
5780 case 2:
5790 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
5800 case 3:
5810 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
5820 case 0:
5830 cls 4:cls 3:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
5840 end select
5850 endif
5860 'Input "番号:",No
5870 '前の画面に戻る
5880 'if No = 3 then goto TopScreen:
5890 'プログラムの終了
5900 'if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":COLOR rgb(255,255,255):end
5910 '1人用
5920 'if No = 1 then goto Surei_Input:
5930 '2人用
5940 'if No = 2 then goto Surei_twoParson:
5950 'if No > 4 or No=0 then ui_msg"もう一度入れてください":goto Surei_Check:
5960 '数霊(かずたま) 文字入力  1人用
5970 Surei_Input:
5980 if mode = 0 then
5990 cls 3:font 32:init"kb:2"
6000 gload Gazo$ + "InputKotodama_20230131.png"
6010 play""
6020 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
6030 color rgb(255,0,0)
6040 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
6050 if lang_flag=1 then
6060 '英語
6070 else
6080 print chr$(13)+chr$(13)+chr$(13)
6090 color rgb(255,255,255)
6100 print "文字を入れてください" + chr$(13)
6110 color rgb(255,255,255)
6120 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
6130 print chr$(13)
6140 color rgb(0,0,0)
6150 Input "入力文字:",buffer_moji$
6160 if buffer_moji$ = "" then
6170 ui_msg "未入力です":goto Surei_Input:
6180 'endif
6190 else
6200 goto Surei_Result:
6210 endif
6220 endif
6230 endif
6240 'else
6250 if mode = 1 then
6260 cls 3:Font 32:
6270 gload Gazo$ + "InputKotodama.png"
6280 color rgb(255,0,0)
6290 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
6300 color rgb(255,255,255)
6310 print "文字を入れてください" + chr$(13)
6320 color rgb(255,0,0)
6330 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
6340 print "大文字のみ)" + chr$(13)
6350 color rgb(0,0,0)
6360 Input "文字入力:",buffer_moji2$
6370 goto Surei_Result3:
6380 'endif
6390 endif
6400 '数霊(かずたま)文字入力　2人用
6410 Surei_twoParson:
6420 cls 3:Font 32:init"kb:2"
6430 gload Gazo$ + "InputKotodama_20211226.png"
6440 '1人目入力
6450 if lang_flag = 1 then
6460 'color rgb(255,0,0)
6470 else
6480 print ""+chr$(13)
6490 'print "●数霊(かずたま) 1人目 入力" + chr$(13)
6500 color rgb(255,0,0)
6510 print "1人目の文字を入れてください" + chr$(13)
6520 color rgb(255,0,0)
6530 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
6540 color rgb(0,0,0)
6550 print chr$(13)
6560 Input "1人目文字入力:",buf_Parson1$
6570 endif
6580 Surei_twoParson2:
6590 cls 3:Font 32:init"kb:2"
6600 '2人目入力
6610 gload Gazo$ + "InputKotodama_20211226.png"
6620 'color rgb(255,0,0)
6630 'print "●数霊(かずたま) 2人目 入力" + chr$(13)
6640 if lang_falg = 1 then
6650 else
6660 print ""+chr$(13)
6670 print "2人目の文字を入れてください" + chr$(13)
6680 color rgb(255,0,0)
6690 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
6700 color rgb(0,0,0)
6710 Input "2人目の文字入力:",buf_Parson2$
6720 goto Surei_Result2:
6730 endif
6740 '数霊　計算 パート
6750 '文字の計算関数
6760 'moji$:1文字を入れる
6770 func Complate(moji$)
6780 for n = 1 to 116
6790 if moji$ = bufline$(2*n) then
6800 buffcount = val(bufline$(2 * n + 1))
6810 endif
6820 next n
6830 endfunc buffcount
6840 '数霊　結果表示
6850 Surei_Result:
6860 cls 3:Font 32
6870 'ゼロカウント:zcount
6880 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
6890 '例 アカい:"い"の文字は無効な文字なので、はじく
6900 zcount=0
6910 'mojicount:入力文字数
6920 mojicount = len(buffer_moji$)
6930 for n=1 to mojicount
6940 for j=1 to 118
6950 if (bufcount$(n - 1) = bufline$(2 * j)) then
6960   bufcount$(n-1) = Mid$(buffer_moji$,n,1)
6970 endif
6980 next j
6990 next n
7000 'if mojicount > zcount then
7010 'cls 3:ui_msg "無効な文字です":talk "無効な文字があります。":zcount = 0:goto Surei_Input:
7020 ncount=0:count=0
7030    for i = 1 to mojicount
7040     bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7050   'ンのカウント
7060    if (bufcount$(i-1) = "ン") then ncount = ncount + 1
7070     'bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7080    next i
7090    if (ncount > 0) then
7100    'Listを表示する
7110    moji_List$(0) = "この単語は目に見える物です"
7120    moji_List$(1) = "この単語は目に見えない物です"
7130    num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
7140    if (num2 = 0) then
7150      ' n1 = n1 + 0
7160    else
7170    if (num2 = 1) then
7180       n1 = 9 * ncount
7190       'buf_count = 9 * ncount
7200    endif
7210    endif
7220    endif
7230 'else
7240    for j=1 to mojicount
7250    bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7260    count = count + Complate(bufcount$(j - 1))
7270   ' count = count + n1:count2 = count
7280 'endif
7290    'count = count + buf_count:
7300    next j
7310    count = count + n1
7320 if (ncount > 0) then count = count
7330 '182以上のとき,181を引く
7340 if buf_cofig_r = 0 then
7350      if (count > 181) then
7360 'if buf_config_r = 0 then
7370         count = count - 181
7380 'else
7390 'if buf_config_r = 1 then
7400 '   count=Single_Complate(count2)
7410 'endif
7420      else
7430      if (buf_config_r = 1) then
7440        'count2 = count - 180
7450        buf_count = Single_Complate(count)
7460      endif
7470 endif
7480 endif
7490 'if config_r = 0 then
7500 cls 3:Font 48+16
7510 gload Gazo$ + "Result_Screen3_20211226.png"
7520 if buf_config_r = 1 then
7530    print "入力文字:" + buffer_moji$ + chr$(13)
7540    print "数霊(かずたま):";buf_count;chr$(13)
7550 endif
7560 if lang_flag = 1 then
7570 else
7580 color rgb(255,0,0)
7590 print "入力文字:" + buffer_moji$ + chr$(13)
7600 endif
7610 'print chr$(13)
7620 if lang_flag = 1 then
7630 else
7640 color rgb(0,0,255)
7650 print "数霊(かずたま):";count;chr$(13)
7660 endif
7670 if lang_flag = 1 then
7680 else
7690 color rgb(0,0,0)
7700 print "エンター or スペース" + chr$(13)
7710 print  chr$(13)
7720 'endif
7730 endif
7740 key$ = input$(1)
7750 if ((key$ = chr$(13)) or (key$=" ")) then
7760 List$(0)="1.もう一度数霊を見る"
7770 List$(1)="2.トップ画面に行く"
7780 List$(2)="3.この数霊の説明を見る"
7790 List$(3)="4.数霊データーを保存"
7800 num=ui_select("List$","番号を選んでください")
7810 select case num
7820   case 0:
7830          goto Surei_Input:
7840   case 1:
7850        n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
7860          for i=0 to 9
7870             bufcount$(i)=""
7880          next i
7890          goto TopScreen:
7900   case 2:
7910        goto Surei_Result4:
7920   case 3:
7930         s=Surei_Result_Save_File()
7940         ui_msg "保存しました"
7950   case -1:
7960        'goto Surei_Result:
7970   case else:
7980        goto Surei_Result:
7990 end select
8000 'endif
8010 'if key$ = " " then
8020 '２回めの入力に行く
8030 'mode = 1:goto Surei_Input:
8040 'else
8050 'if key$ = "s" or key$ = "S" then
8060 'ファイルを保存する
8070 's = Save()
8080 'ui_msg"保存しました"
8090 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
8100 else
8110 goto Surei_Result:
8120 'endif
8130 endif
8140 '3-1 バージョン情報
8150 Version:
8160 cls 3:Font 32
8170 gload Gazo$ + "Screen1_Version.png"
8180 play ""
8190 play Voice_File_TopScreen$ + "Voice_Version.mp3"
8200 color rgb(255,0,0)
8210 'print"●バージョン情報"+chr$(13)
8220 print chr$(13)
8230 color rgb(255,255,255)
8240 if lang_flag = 1 then
8250 else
8260 print chr$(13)+chr$(13)+chr$(13)
8270 print "Ver:";Version$ + chr$(13)
8280 print "アプリ名:数霊"+ chr$(13)
8290 print "Basic for Android Runtime" + chr$(13)
8300 print "Author:licksjp" + chr$(13)
8310 print "制作開始:2021.7.28" + chr$(13)
8320 print chr$(13)
8330 print "(C)Copy right licksjp " + chr$(13)
8340 print "All rights reserved" + chr$(13)
8350 print chr$(13)
8360 color rgb(0,0,0)
8370 print "パッドの右を押してください" + chr$(13)
8380 endif
8390 'key$ = input$(1)
8400 bg=0:key$=""
8410 while (bg <> 1 and key$ <> chr$(13))
8420 bg = strig(1)
8430 key$ = inkey$
8440 pause 2
8450 wend
8460 if key$ = chr$(13) then
8470 goto TopScreen:
8480 'else
8490 'talk "無効なキーです":goto Version:
8500 else
8510 if bg=1 then
8520 goto TopScreen:
8530 else
8540 if lang_flag = 1 then
8550 else
8560 talk "無効なキーです":goto Version:
8570 endif
8580 endif
8590 endif
8600 '3-2 参考文献
8610 Reference_Book:
8620 cls 3:Font 48:play""
8630 gload Gazo$ + "Screen1_Reference.png"
8640 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
8650 color rgb(255,0,0)
8660 'print"●参考文献" + chr$(13)
8670 print chr$(13)+chr$(13)
8680 if lang_flag = 1 then
8690 else
8700 color rgb(255,255,255)
8710 print "書名:数霊" + chr$(13)
8720 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
8730 print "出版社:徳間書店" + chr$(13)
8740 print "ISBN:978-4-19-" + chr$(13)
8750 print "         865309-5" + chr$(13)
8760 print "定価:2300円 + 税" + chr$(13)
8770 'print chr$(13)
8780 color rgb(0,0,0)
8790 print "パッドの右を押してください"
8800 endif
8810 bg = 0:key$ = ""
8820 while (bg <> 1 and key$ <> chr$(13))
8830 bg = strig(1)
8840 key$ = inkey$
8850 pause 2
8860 wend
8870 if key$ = chr$(13) then
8880 goto TopScreen:
8890 'else
8900 'talk "無効なキーです":goto Reference_Book:
8910 else
8920 if bg = 1 then
8930 goto TopScreen:
8940 else
8950 talk "無効なキーです":goto Reference_Book:
8960 endif
8970 endif
8980 'key$=input$(1)
8990 'if key$=chr$(13) then
9000 'goto TopScreen:
9010 'else
9020 'talk"無効なキーです":goto Reference_Book:
9030 'endif
9040 'ヘルプ画面　トップ画面
9050 Help:
9060 No=1:c=0
9070 play ""
9080 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
9090 cls 3:Font 48:
9100 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9110 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0
9120 color rgb(255,0,0)
9130 'print "●3.ヘルプ　トップ画面" + chr$(13)
9140 print chr$(13)+chr$(13)+chr$(13)
9150 color rgb(255,255,255)
9160 print "番号を選んでください" + chr$(13)
9170 print " :1.バージョン" + chr$(13)
9180 print " :2.参考文献" + chr$(13)
9190 print " :3.トップ画面に行く" + chr$(13)
9200 print " :4.終 了" + chr$(13)
9210 color rgb(0,0,0)
9220 'print " :3.トップ画面に行く" + chr$(13)+chr$(13)
9230 locate 0,15
9240 if No = 1 then print " 1.バージョンを選択"
9250 'y:バーチャルパッドの処理
9260 'key$:カーソルの処理
9270 'bg:バーチャルパッドの右ボタン
9280 Help_key:
9290 y = 0:key$ = "":bg=0
9300 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
9310 y = stick(1)
9320 key$ = inkey$
9330 bg=strig(1)
9340 pause 2
9350 wend
9360 'バーチャルパッド　ここから'
9370 if y = 1 then
9380 select case No
9390 'No の初期値：No=1
9400 case 1:
9410 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 0,15:print"2.参考文献を選択":goto Help_key:
9420 if lang_flag = 1 then
9430 else
9440 locate 0,15:print"2.参考文献を選択":goto Help_key:
9450 endif
9460 'デバッグライン　ここから
9470 '0のとき
9480 'デバッグライン　ここまで
9490 'デバッグライン　ここから
9500 case 2:
9510 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                  "
9520 color rgb(0,0,0):locate 0,15:print "3.トップ画面に行くを選択":No=3:goto Help_key:
9530 'cls:color rgb(255,255,255):print"ok"
9540 'デバッグライン　ここまで
9550 case 3:
9560 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print "                                       ":locate 0,15:print "4.終 了を選択":No=0:goto Help_key:
9570 'デバッグライン　ここから
9580 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
9590 'デバッグライン　ここまで
9600 case 0:
9610 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print "1.バージョンを選択":goto Help_key:
9620 'デバッグライン　ここから
9630 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
9640 'デバッグライン　ここまで
9650 end select
9660 endif
9670 'バーチャルパッド　上 ここから
9680 if y = -1 then
9690 select case No
9700 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
9710 case 1:
9720 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 0,15:print"4.終了を選択"::goto Help_key:
9730 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
9740 case 0:
9750 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 0,15:print"3.トップ画面に行くを選択":goto Help_key
9760 'No:3 3.Help→2.設定 No:2
9770 case 3:
9780 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 0,15:print"2.参考文献を選択":goto Help_key:
9790 case 2:
9800 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print"1.バージョンを選択":goto Help_key:
9810 end select
9820 endif
9830 if bg = 1 then
9840 select case No
9850 '1.数霊チェックを選択  パッドの右キー
9860 case 1:
9870 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
9880 '2.設定を選択    パッドの右キー
9890 case 2:
9900 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
9910 '3.ヘルプを選択 パッドの右
9920 case 3:
9930 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
9940 'プログラムの終了を選択
9950 case 0:
9960 cls 3:cls 4:color rgb(255,255,255):play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
9970 'if lang_flag = 1 then
9980 'lang_flag = 1:英語
9990 'Else
10000 'lang_flag = 0:日本語
10010 'endif
10020 end select
10030 '4.終了するを選択  パッドの右
10040 endif
10050 'バーチャルパッド　上　ここまで
10060 'バーチャルパッド　ここまで'
10070 'key$ = input$(1)
10080 'カーソルの下
10090 if key$ = chr$(31) then
10100 select case (No Mod 4)
10110 'バージョンから参考文献
10120 case 0:
10130 c=1:No=c:locate 0,12:Print "             ":locate 0,12:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
10140 '参考文献からトップ画面
10150 case 1:
10160 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,12:print "            ":locate 0,12:print " 3.トップ画面に行くを選択":goto Help_key:
10170 'トップ画面から終了
10180 case 2:
10190 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,12:print "                ":locate 0,12:print " 4.終 了を選択":goto Help_key:
10200 '終了からバージョン
10210 case 3:
10220 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                     ":locate 0,12:print " 1.バージョンを選択":goto Help_key:
10230 case else:
10240 goto Help_key:
10250 end select
10260 endif
10270 'カーソル　上
10280 if key$ = chr$(30) then
10290 select case (c Mod 4)
10300 'バージョンから終了
10310 case 0:
10320 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:locate 0,12:print "                   ":locate 0,12:print " 4.終 了を選択":goto Help_key:
10330 '参考文献からバージョン
10340 case 1:
10350 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                   ":locate 0,12:print " 1.バージョンを選択":goto Help_key:
10360 'トップ画面から参考文献
10370 case 2:
10380 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,12:print "                    ":locate 0,12:print " 2.参考文献を選択":goto Help_key:
10390 '終了からトップ画面を選択
10400 case 3:
10410 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,12:print"                      ":locate 0,12:print "3.トップ画面に行くを選択":goto Help_key:
10420 case else:
10430 goto Help_key:
10440 end select
10450 endif
10460 'Input "番号:",No
10470 'sp_def 0,(5,200),32,32
10480 'エンターキー：決定
10490 if key$=chr$(13) then
10500 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10510 if No=3 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10520 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10530 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg "プログラムを終了します":cls 3:cls 4:end
10540 else
10550 goto Help_key:
10560 endif
10570 'if (No = 0 or No > 4) then ui_msg "もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
10580 '登録文字の確認
10590 '文字を1文字入れて登録されているか調べるメニュー
10600 '設定項目
10610 Setting:
10620 cls 3:Font 48
10630 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
10640 play ""
10650 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
10660 No=1
10670 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:
10680 color rgb(0,0,255)
10690 'print "●設定項目" + chr$(13)
10700 print chr$(13)
10710 if lang_flag = 1 then
10720 'lang_flag = 1:英語
10730 else
10740 'lang_flag = 0:日本語
10750 color rgb(255,255,255)
10760 print chr$(13)
10770 print "番号を選んでください" + chr$(13)
10780 '-------コメント----------------
10790 'print " :1.登録文字の確認" + chr$(13)
10800 'print " :2.数霊文字確認" + chr$(13)
10810 '-------コメント----------------
10820 'print chr$(13)
10830 print " :1.文字の項目" + chr$(13)
10840 print " :2.結果表示設定" + chr$(13)
10850 print " :3.言語設定" + chr$(13)
10860 print " :4.トップ画面に行く" + chr$(13)
10870 endif
10880 color rgb(0,0,0)
10890 locate 0,15
10900 if No=1 then print " 1.文字の項目を選択"
10910 'y:バーチャルパッドの処理
10920 'key$:カーソルの処理
10930 'bg:バーチャルパッドの右ボタン
10940 SettingScreen:
10950 y = 0:key$ = "":bg=0
10960 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
10970 y = stick(1)
10980 key$ = inkey$
10990 bg=strig(1)
11000 pause 2
11010 wend
11020 'バーチャルパッド　ここから'
11030 'バーチャルパッド　ここから'
11040 if y = 1 then
11050 select case No
11060 'No の初期値：No=1
11070 case 1:
11080 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":color rgb(0,0,0):locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11090 'デバッグライン　ここから
11100 '0のとき
11110 'デバッグライン　ここまで
11120 'デバッグライン　ここから
11130 case 2:
11140 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                         "
11150 color rgb(0,0,0)::No=3
11160 if lang_flag = 1 then
11170 else
11180 locate 1,15:print "3.言語設定を選択":goto SettingScreen:
11190 endif
11200 'cls:color rgb(255,255,255):print"ok"
11210 'デバッグライン　ここまで
11220 case 3:
11230 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 1,15:print"                                              ":locate 1,15:print "4.トップ画面に行くを選択":No=0:goto SettingScreen:
11240 'デバッグライン　ここから
11250 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11260 'デバッグライン　ここまで
11270 case 0:
11280 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 1,15:print"                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
11290 'デバッグライン　ここから
11300 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11310 'デバッグライン　ここまで
11320 end select
11330 endif
11340 'バーチャルパッド　上 ここから
11350 if y = -1 then
11360 select case No
11370 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11380 case 1:
11390 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 1,15:print"4.トップ画面に行くを選択":goto SettingScreen:
11400 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11410 case 0:
11420 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
11430 'No:3 3.Help→2.設定 No:2
11440 case 3:
11450 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.結果表示設定を選択":goto SettingScreen:
11460 case 2:
11470 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 1,15:print"1.文字の項目を選択":goto SettingScreen:
11480 end select
11490 endif
11500 if bg=1 then
11510 select case No
11520 '1.数霊チェックを選択  パッドの右キー
11530 case 1:
11540 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
11550 '2.設定を選択    パッドの右キー
11560 case 2:
11570 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
11580 '3.ヘルプを選択 パッドの右
11590 case 0:
11600 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
11610 'プログラムの終了を選択
11620 case 3:
11630 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Setting_Language:
11640 'if lang_flag = 1 then
11650 'Else
11660 'ui_msg "プログラムを終了します"
11670 'endif
11680 end select
11690 endif
11700 '4.終了するを選択  パッドの右
11710 'バーチャルパッド　ここまで'
11720 'SettingScreen:
11730 'key$ = input$(1)
11740 'カーソル下'
11750 if key$ = chr$(31) then
11760 select case (No Mod 4)
11770 '登録文字から数霊文字の確認
11780 case 1:
11790 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                     ":locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11800 '数霊文字の確認からトップ画面に行く
11810 case 2:
11820 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "                                     ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
11830 'トップ画面に行くから終了
11840 case 3:
11850 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                                       ":locate 1,15:print "4.トップ画面に行くを選択":goto SettingScreen:
11860 '終了から登録文字
11870 case 0:
11880 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
11890 end select
11900 endif
11910 'カーソル　上
11920 if key$ = chr$(30) then
11930 select case (No Mod 4)
11940 case 1:
11950 c=2:No=c:sp_on 0,1:sp_put 0,(5,300),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
11960 case 2:
11970 c=3:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
11980 case 3:
11990 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:goto SettingScreen:
12000 case 0:
12010 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,600),0,0:sp_on 0,0:goto SettingScreen:
12020 end select
12030 endif
12040 'エンターキーを押したとき
12050 if key$ = chr$(13) then
12060 if No=3 then goto Setting_Language:
12070 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
12080 'if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji1:
12090 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
12100 if No=0 then goto TopScreen:
12110 'lse
12120 'o'o SettingScreen:
12130 endif
12140 'endif
12150 'endif
12160 '文字検索項目  ここから
12170 Moji_Search:
12180 cls 4:cls 3:Font 32+16:init"kb:2"
12190 gload Gazo$ + "Moji_Search_Result.png"
12200 play ""
12210 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
12220 print "" + chr$(13)
12230 color rgb(255,0,0)
12240 if lang_flag = 1 then
12250 Else
12260 print "文字を一文字入れてください" + chr$(13)
12270 endif
12280 color rgb(0,0,0)
12290 if lang_flag=1 then
12300 Else
12310 Input "登録文字:",moji$
12320 endif
12330 moji_count = len(moji$)
12340 if moji_count > 1 then
12350 'if lang_flag = 1 then
12360 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Moji_Search:
12370 'Else
12380 'endif
12390 else
12400 count=0
12410 for n = 0 to 116
12420 if bufline$(2*n) = moji$ then
12430 cls 3:font 48:init"kb:4"
12440 gload Gazo$ + "Moji_Search_Result.png"
12450 'talk"この文字は登録されています"
12460 play ""
12470 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12480 if lang_flag = 1 then
12490 Else
12500 print chr$(13)
12510 color rgb(255,255,255)
12520 print moji$;"は、登録されています。" + chr$(13)
12530 color rgb(0,0,0)
12540 print "ジョイパッドの右を押してください"
12550 endif
12560 bg = 0:key$ = ""
12570 while (bg <> 1 and key$ <> chr$(13))
12580 key$ = inkey$
12590 bg = strig(1)
12600 pause 2
12610 wend
12620 'y$=input$(1)
12630 if key$ = chr$(13) then goto TopScreen:
12640 if bg=1 then goto TopScreen:
12650 count = count + 1
12660 endif
12670 next n
12680 if count = 0 then
12690 cls 3:font 48:init "kb:2"
12700 gload Gazo$ + "Moji_check.png"
12710 play ""
12720 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
12730 print chr$(13)
12740 if lang_flag = 1 then
12750 Else
12760 color rgb(255,0,0)
12770 print moji$;"は、登録されていません。" + chr$(13)
12780 color rgb(0,0,0)
12790 print "パッドの右を押してください" + chr$(13)
12800 endif
12810 kg = 0:key$ = ""
12820 while (kg <> 1 and key$ <> chr$(13))
12830 key$ = inkey$
12840 kg = strig(1)
12850 pause 2
12860 wend
12870 if key$ = chr$(13) then goto TopScreen:
12880 endif
12890 endif
12900 Surei_Result2:
12910 cls 3:Font 48
12920 zcount1=0:zcount2=0:count1=0:count2=0
12930 '1人目
12940 mojicount1=len(buf_Parson1$)
12950 '2人目
12960 mojicount2 = len(buf_Parson2$)
12970 '1人目
12980 for n = 1 to mojicount1
12990 for j = 1 to 116
13000 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
13010 if bufcount1$(n-1) = bufline$(2*j) then
13020 zcount1 = zcount1 + 1
13030 endif
13040 next j
13050 next n
13060 '2人目
13070 for n = 1 to mojicount2
13080 for j = 1 to 116
13090 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
13100 if bufcount2$(n-1) = bufline$(2*j) then
13110 zount2 = zcount2 + 1
13120 endif
13130 next j
13140 next n
13150 '1人目
13160 for i=1 to mojicount1
13170 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
13180 p1 = Complate(bufcount1$(i-1))
13190 count1 = count1 + p1
13200 next i
13210 '2人目
13220 for i = 1 to mojicount2
13230 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
13240 p2 = Complate(bufcount2$(i-1))
13250 count2 = count2 + p2
13260 next i
13270 cls 3:
13280 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
13290 color rgb(255,0,0)
13300 'print "数霊 2人用 結果表示"+chr$(13)
13310 print ""+chr$(13)
13320 if lang_flag = 1 then
13330 else
13340 color rgb(255,255,255)
13350 print "1人目:";buf_Parson1$;chr$(13)
13360 print "数霊1:";count1;chr$(13)
13370 print "2人目:";buf_Parson2$;chr$(13)
13380 print "数霊2:";count2;chr$(13)
13390 print "数霊(合計):";count1 + count2;chr$(13)
13400 color rgb(0,0,0)
13410 print "エンターキーを押してください" + chr$(13)
13420 endif
13430 key$ = "":bg = 0
13440 'ey$=input$(1)
13450 while (bg <> 1 and key$ <> chr$(13))
13460 bg = strig(1)
13470 key$ = inkey$
13480 pause 2
13490 wend
13500 if (bg = 1 or key$ = chr$(13))  then goto TopScreen:
13510 Surei_Result3:
13520 cls 3:Font 48
13530 zcount2 = 0:count2 = 0
13540 mojicount2 = len(buffer_moji2$)
13550 for n = 1 to mojicount2
13560 for j = 1 to 116
13570 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
13580 if bufcount2$(n - 1) = bufline$(2 * j) then
13590 zcount2 = zcount2 + 1
13600 endif
13610 next j
13620 next n
13630 for i = 1 to mojicount2
13640 n2 = Complate(bufcount2$(i-1))
13650 count2 = count2 + n2
13660 next i
13670 gload Gazo$ + "Screen5.png"
13680 if lang_flag = 1 then
13690 else
13700 color rgb(255,0,0)
13710 print "数霊の結果表示" + chr$(13)
13720 color rgb(255,255,255)
13730 print "１回目回の文字入力:";buffer_moji$;chr$(13)
13740 print "１回目の数霊(かずたま)";count;chr$(13)
13750 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
13760 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
13770 color rgb(0,0,0)
13780 print "エンターキー:トップ画面";chr$(13)
13790 print "c or C キー:数霊の比較";chr$(13)
13800 endif
13810 key$ = "":bg = 0
13820 while (key$ <> chr$(13) and bg <> 1)
13830 bg = strig(1)
13840 key$ = inkey$
13850 pause 2
13860 wend
13870 'key$ = input$(1)
13880 if bg = 1 then goto TopScreen:
13890 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
13900 if key$ = "c" or key$ = "C" then
13910 if count = count2 then
13920 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
13930 else
13940 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
13950 endif
13960 endif
13970 Moji_Count_Check:
13980 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
13990 cls 3:Font 48
14000 gload Gazo$ + "Moji_check.png"
14010 n = 0
14020 open FILE_csv$ for input as #1
14030 while eof(1) = 0
14040 line input #1, line$
14050 n = n + 1
14060 wend
14070 close #1
14080 'n = n - 1
14090 'talk "登録文字数は"+str$(n)+"文字です"
14100 play ""
14110 if n = 118 then
14120 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
14130 if lang_flag = 1 then
14140 else
14150 'talk "登録文字数は、" + str$(n) + "文字です"
14160 print "" + chr$(13)
14170 color rgb(255,255,255)
14180 print "文字の登録文字数は";n;"文字" + chr$(13)
14190 color rgb(0,0,0)
14200 print "パッドの右を押してください" + chr$(13)
14210 endif
14220 endif
14230 'key$ = input$(1)
14240 key$ = "":bg = 0
14250 while (key$ <> chr$(13) and bg <> 1)
14260 key$=inkey$
14270 bg=strig(1)
14280 pause 2
14290 wend
14300 if bg = 1 then goto TopScreen:
14310 if key$ = chr$(13) then
14320 goto TopScreen:
14330 else
14340 goto Moji_Count_Check:
14350 endif
14360 'Save 関数
14370 file_kazutama = 0
14380 file_kazutama = Save_File()
14390 func Save_File()
14400 open SAVE_DATA1$  for output as #1
14410 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
14420 close #1
14430 endfunc
14440 Select_moji:
14450 cls 3:font 48:No = 1
14460 gload Gazo$ + "Screen1_mojicheck.png"
14470 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
14480 color rgb(255,0,0)
14490 'print "文字の確認" + chr$(13)
14500 if lang_flag = 1 then
14510 else
14520 print chr$(13)+chr$(13)+chr$(13)
14530 color rgb(255,255,255)
14540 print "番号を選んでください" + chr$(13)
14550 print " :1.登録文字検索"+ chr$(13)
14560 print " :2.登録文字数の確認" + chr$(13)
14570 print " :3.トップ画面に戻る" + chr$(13)
14580 print " :4.終　了" + chr$(13)
14590 color rgb(0,0,0)
14600 locate 0,15
14610 if No = 1 then print " 1.登録文字検索を選択"
14620 endif
14630 Entry_check_key:
14640 y = 0:key$ = "":bg=0
14650 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
14660 y = stick(1)
14670 key$ = inkey$
14680 bg=strig(1)
14690 pause 2
14700 wend
14710 'バーチャルパッド　ここから'
14720 'バーチャルパッド　ここから'
14730 if y = 1 then
14740 select case No
14750 'No の初期値：No=1
14760 case 1:
14770 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
14780 'デバッグライン　ここから
14790 '0のとき
14800 'デバッグライン　ここまで
14810 'デバッグライン　ここから
14820 case 2:
14830 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                       "
14840 :No=3
14850 'if lang_flag = 1 then
14860 'Else
14870 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に戻るを選択":goto Entry_check_key:
14880 'endif
14890 'cls:color rgb(255,255,255):print"ok"
14900 'デバッグライン　ここまで
14910 case 3:
14920 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 4.終 了を選択":No=0:goto Entry_check_key:
14930 'デバッグライン　ここから
14940 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
14950 'デバッグライン　ここまで
14960 case 0:
14970 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.登録文字数の確認を選択":goto Entry_check_key:
14980 'デバッグライン　ここから
14990 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
15000 'デバッグライン　ここまで
15010 end select
15020 endif
15030 'バーチャルパッド　上 ここから
15040 if y = -1 then
15050 select case No
15060 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15070 case 1:
15080 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 1,15:print "                                       ":locate 0,15:print" 4.終了を選択"::goto Entry_check_key:
15090 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15100 case 0:
15110 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                      ":locate 1,15:print"3.トップ画面に戻るを選択":goto Entry_check_key:
15120 'No:3 3.Help→2.設定 No:2
15130 case 3:
15140 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
15150 case 2:
15160 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                       ":locate 1,15:print"1.登録文字検索を選択":goto Entry_check_key:
15170 end select
15180 endif
15190 if bg=1 then
15200 select case No
15210 '1.数霊チェックを選択  パッドの右キー
15220 case 1:
15230 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15240 '2.設定を選択    パッドの右キー
15250 case 2:
15260 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15270 '3.ヘルプを選択 パッドの右
15280 case 3:
15290 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
15300 'プログラムの終了を選択
15310 case 0:
15320 cls 3:cls 4::play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":ui_msg "プログラムを終了します":color rgb(255,255,255):pause 2.052 * 1000:end
15330 'if lang_flag = 1 then
15340 'else
15350 'endif
15360 end select
15370 endif
15380 '4.終了するを選択  パッドの右
15390 'バーチャルパッド　ここまで'
15400 'key$ = input$(1)
15410 'カーソルの下
15420 if key$ = chr$(31) then
15430 select case (No Mod 4)
15440 case 0:
15450 c=1:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
15460 case 1:
15470 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,500),0,0:sp_on 3,0:goto Entry_check_key:
15480 case 2:
15490 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:goto Entry_check_key:
15500 case 3:
15510 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
15520 end select
15530 endif
15540 'カーソル　上
15550 if key$ = chr$(30) then
15560 select case (No Mod 4)
15570 case 0:
15580 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
15590 case 1:
15600 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
15610 case 2:
15620 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
15630 case 3:
15640 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
15650 end select
15660 endif
15670 'エンターキーを押す
15680 if key$ = chr$(13) then
15690 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15700 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15710 if No = 3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15720 if No = 0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
15730 endif
15740 '
15750 Kakunin_Surei_count:
15760 cls 3:font 48:No=1
15770 gload Gazo$ + "Kazutama_List_Top.png"
15780 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
15790 color rgb(255,0,0)
15800 print chr$(13)+chr$(13)+chr$(13)
15810 color rgb(255,255,255)
15820 'if lang_flag = 1 then
15830 'else
15840 'print chr$(13)+chr$(13)
15850 print "番号を選んでください" + chr$(13)
15860 print " :1.数霊リスト 1人用" + chr$(13)
15870 print " :2.結果表示設定" + chr$(13)
15880 print " :3.トップ画面に行く" + chr$(13)
15890 print " :4.終 了" + chr$(13)
15900 print "" + chr$(13)
15910 'endif
15920 color rgb(0,0,0)
15930 locate 0,15:print"                                                         "
15940 if No = 1 then locate 1,15:print "1.数霊リスト　1人用を選択"
15950 Entry_List:
15960 y = 0:key$ = "":bg=0
15970 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
15980 y = stick(1)
15990 key$ = inkey$
16000 bg = strig(1)
16010 pause 2
16020 wend
16030 'バーチャルパッド　ここから'
16040 'バーチャルパッド　ここから'
16050 'バーチャルパッド　下
16060 if y = 1 then
16070 select case No
16080 'No の初期値：No=1
16090 case 1:
16100 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.結果表示設定を選択":goto Entry_List:
16110 'デバッグライン　ここから
16120 '0のとき
16130 'デバッグライン　ここまで
16140 'デバッグライン　ここから
16150 case 3:
16160 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:No=0:pause 200:locate 0,15:print "                                       "
16170 color rgb(0,0,0):locate 0,15:print " 4.終了を選択":goto Entry_List:
16180 'cls:color rgb(255,255,255):print"ok"
16190 'デバッグライン　ここまで
16200 case 0:
16210 sp_on 3,0:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 1.数霊リスト 1人用を選択":No=1:goto Entry_List:
16220 case 2:
16230 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                      ":No=3:locate 1,15:print "3．トップ画面に行くを選択":goto Entry_List:
16240 'sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print "                                      "
16250 'case 1:
16260 'デバッグライン　ここから
16270 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
16280 'デバッグライン　ここまで
16290 'case 0:
16300 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_List:
16310 'デバッグライン　ここから
16320 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
16330 'デバッグライン　ここまで
16340 end select
16350 endif
16360 'バーチャルパッド　上 ここから
16370 if y = -1 then
16380 select case No
16390 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
16400 case 3:
16410 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 0,15:print " 2.結果表示設定を選択":goto Entry_List:
16420 case 1:
16430 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 0,15:print " 4.終了を選択":goto Entry_List:
16440 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
16450 case 0:
16460 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print "                                      ":locate 1,15:print"3.トップ画面に行くを選択":goto Entry_List:
16470 'No:3 3.Help→2.設定 No:2
16480 case 2:
16490 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 1,15:print "1.数霊リスト 1人用を選択":goto Entry_List:
16500 'case 2:
16510 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_List:
16520 end select
16530 endif
16540 if bg = 1 then
16550 select case No
16560 '1.数霊リスト 一人用を選択を選択  パッドの右キー
16570 case 1:
16580 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16590 '2.設定を選択  パッドの右キー
16600 case 2:
16610 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16620 case 3:
16630  sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16640 '4.終了を選択 パッドの右
16650 case 0:
16660 cls 3:cls 4:color rgb(255,255,255):
16670 play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:
16680 'Else
16690 ui_msg "プログラムを終了します":end
16700 'endif
16710 'プログラムの終了を選択
16720 end select
16730 endif
16740 if key$=chr$(13) then
16750 select case No
16760 case 0:
16770       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":end
16780 case 1:
16790       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16800 case 2:
16810       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16820 case 3:
16830       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16840 end select
16850 endif
16860 '4.終了するを選択  パッドの右
16870 'バーチャルパッド　ここまで'
16880 'Input "番号:",No
16890 'if No=2 then goto TopScreen:
16900 'if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
16910 'if No=1 then goto Surei_List1:
16920 'if No > 3 or No=0 then ui_msg"無効な数字です、入れ直してください":talk"無効な数字です":goto Kakunin_Surei_count:
16930 'if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
16940 Surei_List1:
16950 cls 3:font 48
16960 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
16970 file$ = dir$(SAVE_DATA1$,0)
16980 'ファイルが無いときの画面
16990 if file$ = ""  then
17000 gload "./data/Gazo/" + "KazutamaList1.png",0
17010 print chr$(13)
17020 color rgb(255,0,0):print "登録ファイルはございません" + chr$(13)
17030 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
17040 'else
17050 'endif
17060 bg = 0:key$ = ""
17070 while (key$ <> chr$(13) and bg<>1)
17080 key$ = inkey$
17090 bg = strig(1)
17100 pause 2
17110 wend
17120 'エンターキーもしくはバーチャルパッドの右でトップに行く
17130 if (bg = 1  or key$ = chr$(13)) then goto TopScreen:
17140 else
17150 cls 3:buffer_list_count = Loadcount()
17160 color rgb(255,255,255)
17170 if lang_flag = 1 then
17180 Else
17190 talk "登録件数は" + str$(buffer_list_count) + "件です"
17200 gload Gazo$ + "KazutamaList1_Entry.png",0
17210 color rgb(0,0,255)
17220 print chr$(13)
17230 color rgb(255,0,0)
17240 print "登録件数:";buffer_list_count;"件";chr$(13)
17250 color rgb(0,0,0)
17260 print "パッドの右を押してください" + chr$(13)
17270 endif
17280 bg = 0:key$ = "":bg2 = 0
17290 while (key$ <> chr$(13) and bg <> 1)
17300 key$ = inkey$
17310 bg = strig(1)
17320 bg2=strig(0)
17330 pause 2
17340 wend
17350 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
17360 if (key$ = chr$(13) or bg = 1) then pause 2:goto KotodamaList_page:
17370 endif
17380 if (bg2 = 1) then pause 2:goto TopScreen:
17390 func Loadcount()
17400 n = 0
17410 'while eof(1)=-1
17420 open SAVE_DATA1$  for input as #1
17430 while eof(1) <> -1
17440 line input #1,line$
17450 n = n + 1
17460 wend
17470 close #1
17480 count = n
17490 endfunc count
17500 count_line = Loadcount()
17510 func Kotodama$(buf$)
17520 color rgb(255,255,255)
17530 b = len("数霊:")
17540 a$ = Mid$(buf$,b+1,len(buf$))
17550 for i=0 to 118
17560 color rgb(255,255,255)
17570 if bufline3$(2 * i) ="数霊:" + a$  then
17580 moji_$ = bufline3$(2*i + 1)
17590 'moji_$ = bufline3$(21)
17600 'moji$ = a$
17610 endif
17620 next i
17630 'kotodama$ = a$
17640 kotodama$ = moji_$
17650 endfunc kotodama$
17660 KotodamaList_page:
17670 cls 3:font 48:m = 0:
17680 gload Gazo$ + "Screen5_Surei_List.png"
17690 if SAVE_DATA1$ = "" then
17700 cls 3:print"ファイルがありません"
17710 else
17720 a = Loadcount()
17730 open SAVE_DATA1$  for input as #1
17740 for i=0 to a-1
17750 for n=0 to 1
17760 input #1,line$
17770 bufKaztama$(i,n) = line$
17780 next n
17790 next i
17800 close #1
17810 'endif
17820 l = 0:n=0
17830 gload Gazo$ + "Screen5_Surei_List.png"
17840 while (buffer_list_count >= l)
17850 'while (l<=a)
17860 cls
17870 color rgb(255,0,0)
17880 'print "数霊　リスト" + chr$(13)
17890 print chr$(13)
17900 color rgb(255,255,255)
17910 n=n+1
17920 'while (n <= a)
17930 print "番号:";l+1;chr$(13)
17940 print bufKaztama$(l,0) + chr$(13)
17950 print bufKaztama$(l,1) + chr$(13)
17960 'n=n+1
17970 Kmoji$ = moji$
17980 print chr$(13) + chr$(13)
17990 color rgb(0,0,0)
18000 print " :パッドの左:トップ画面" + chr$(13)
18010 print " :パッドの右:次へ行く" + chr$(13)
18020 'wend
18030 key$ = "":bg = 0:bg2 = 0
18040 while (key$ <> chr$(13) and bg <> 1 and bg2 <> 1)
18050 key$ = inkey$
18060 bg = strig(1)
18070 bg2 = strig(0)
18080 pause 2
18090 wend
18100 'key$ = input$(1)
18110 if (key$ = " " OR bg = 1) then
18120 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
18130 else
18140 if ((bg2 = 1) or (key$=chr$(13))) then
18150    goto TopScreen:
18160 endif
18170 else
18180 goto KotodamaList_page:
18190 endif
18200 wend
18210 'wend
18220 endif
18230 '結果表示２ Menu1
18240 Surei_Result4:
18250 cls 3:font 32+16:init"kb:4"
18260 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
18270 for i=0 to 181 + 3 - 1
18280 if i = count  then
18290 buffer$ = bufline2$(count + 4,0)
18300 endif
18310 next i
18320 if len(buffer$) > 21 and len(buffer$) <= 45 then
18330 buffer2$ = Mid$(buffer$,1,22)
18340 buffer3$ = Mid$(buffer$,23,(len(buffer$) - 22))
18350 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13)
18360 else
18370 if len(buffer$) <= 21 then
18380 buffer2$ = Mid$(buffer$,1,21)
18390 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
18400 else
18410 if len(buffer$) > 45 and len(buffer$) <= 62 then
18420 buffer2$ = Mid$(buffer$,1,22)
18430 buffer3$ = Mid$(buffer$,23,22)
18440 buffer4$ = Mid$(buffer$,44,(len(buffer$)-44))
18450 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13)
18460 else
18470 if len(buffer$) > 64 and len(buffer$) <= 81 then
18480 buffer2$ = Mid$(buffer$,1,22)
18490 buffer3$ = Mid$(buffer$,23,20)
18500 buffer4$ = Mid$(buffer$,44,20)
18510 buffer5$ = Mid$(buffer$,65,(len(buffer$)-65))
18520 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13)
18530 if len(buffer$) > 81 and len(buffer$) <= 110 then
18540 buffer2$ = Mid$(buffer$,1,22)
18550 buffer3$ = Mid$(buffer$,23,20)
18560 buffer4$ = Mid$(buffer$,43,20)
18570 buffer5$ = Mid$(buffer$,63,20)
18580 buffer6$ = Mid$(buffer$,83,(len(buffer$) - 83))
18590 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13)
18600 endif
18610 endif
18620 endif
18630 endif
18640 endif
18650 Surei_Result4_2:
18660 gload Gazo$ + "Screen1_Result2.png"
18670 Result_Menu_List$(0)="1.トップ画面に行く"
18680 Result_Menu_List$(1)="2.数霊のデーターを保存"
18690 Result_Menu_List$(2)="3.もう一度、数霊を調べる"
18700 cls
18710 'color rgb(255,0,0)
18720 'print "診断結果 2" + chr$(13)
18730 print chr$(13)
18740 if lang_flag = 1 then
18750 else
18760 color rgb(127,255,212)
18770 print chr$(13);chr$(13)
18780 print "入力文字:";buffer_moji$;chr$(13)
18790 print "数霊:";count;chr$(13)
18800 color rgb(255,255,255)
18810 print "数霊の説明:"+chr$(13)
18820 print buffer$
18830 color rgb(0,0,0)
18840 locate 0,15
18850 print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
18860 endif
18870 key$ = "":bg = 0:bg2 = 0
18880 while (bg<>1 and bg2<>1)
18890 key$ = inkey$
18900 bg = strig(1)
18910 bg2 = strig(0)
18920 pause 2
18930 wend
18940 if ((bg = 1) or (bg2 = 1)) then
18950 num = ui_select("Result_Menu_List$","番号を選んでください")
18960 endif
18970 if num = 0 then goto TopScreen:
18980 if num = 1 then goto File_save:
18990 if num = 2 then goto Surei_Input:
19000 if num = -1 then goto Surei_Result4
19010 ' if bg=1 then buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
19020 'if key$ = chr$(13) then
19030 'buffer$ = "":buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
19040 'endif
19050 'if bg2=1 then
19060 File_save:
19070 'ファイルがない時
19080 if dir$(SAVE_DATA1$) = " " then
19090 open SAVE_DATA1$ for output as #1
19100 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19110 close #1
19120 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19130 'ファイルが有る時
19140 else
19150 open SAVE_DATA1$ for append as #1
19160 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19170 close #1
19180 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19190 endif
19200 'endif
19210 'if key$="s" or key$="S" then
19220 'if dir$(SAVE_DATA1$) = "" then
19230 'open SAVE_DATA1$ for output as #1
19240 'print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19250 'close #1
19260 'ui_msg"保存しました":talk"保存しました":goto Surei_Result4_2:
19270 'else
19280 'open SAVE_DATA1$ for append as #1
19290 'print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19300 'close #1
19310 'ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19320 'endif
19330 'else
19340 'talk "無効な文字です":goto Surei_Result4_2:
19350 'endif
19360 'endif
19370 func All_clear()
19380 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
19390 endfunc
19400 'ここから
19410 Config_moji1:
19420 cls 3:Font 48
19430 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19440 play ""
19450 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
19460 No=1
19470 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19480 color rgb(0,0,255)
19490 'print "●設定項目" + chr$(13)
19500 print chr$(13)
19510 if lang_flag = 1 then
19520 'lang_flag = 1:英語
19530 else
19540 'lang_flag = 0:日本語
19550 color rgb(255,255,255)
19560 print "番号を選んでください" + chr$(13)
19570 'print " :1.文字の項目" + chr$(13)
19580 'print " :2.結果表示設定" + chr$(13)
19590 print " :1.文字の項目" + chr$(13)
19600 print " :2.結果表示設定" + chr$(13)
19610 print " :3.トップ画面に行く" + chr$(13)
19620 print " :4.終 了" + chr$(13)
19630 endif
19640 color rgb(0,0,0)
19650 locate 1,12
19660 if No = 1 then print "1.文字の項目"
19670 'y:バーチャルパッドの処理
19680 'key$:カーソルの処理
19690 'bg:バーチャルパッドの右ボタン
19700 Config_moji1_Screen:
19710 y = 0:key$ = "":bg=0
19720 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
19730 y = stick(1)
19740 key$ = inkey$
19750 bg=strig(1)
19760 pause 2
19770 wend
19780 'バーチャルパッド　ここから'
19790 'バーチャルパッド　ここから'
19800 if y = 1 then
19810 select case No
19820 'No の初期値：No=1
19830 case 1:
19840 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
19850 'デバッグライン　ここから
19860 '0のとき
19870 'デバッグライン　ここまで
19880 'デバッグライン　ここから
19890 case 2:
19900 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
19910 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
19920 'if lang_flag = 1 then
19930 'else
19940 locate 1,12:print "3.トップ画面に行くを選択"
19950 'endif
19960 'cls:color rgb(255,255,255):print"ok"
19970 'デバッグライン　ここまで
19980 case 3:
19990 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
20000 'デバッグライン　ここから
20010 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
20020 'デバッグライン　ここまで
20030 case 0:
20040 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20050 'デバッグライン　ここから
20060 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
20070 'デバッグライン　ここまで
20080 end select
20090 endif
20100 'バーチャルパッド　上 ここから
20110 if y = -1 then
20120 select case No
20130 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
20140 case 1:
20150 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
20160 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
20170 case 0:
20180 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
20190 'No:3 3.Help→2.設定 No:2
20200 case 3:
20210 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20220 case 2:
20230 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
20240 end select
20250 endif
20260 if bg=1 then
20270 select case No
20280 '1.数霊チェックを選択  パッドの右キー
20290 case 1:
20300 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
20310 '2.設定を選択    パッドの右キー
20320 case 2:
20330 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
20340 '3.ヘルプを選択 パッドの右
20350 case 3:
20360 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
20370 'プログラムの終了を選択
20380 case 0:
20390 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
20400 'if lang_flag = 1 then
20410 'Else
20420 ui_msg "プログラムを終了します":end
20430 'endif
20440 end select
20450 endif
20460 '4.終了するを選択  パッドの右
20470 'バーチャルパッド　ここまで'
20480 'SettingScreen:
20490 'key$ = input$(1)
20500 'カーソル下'
20510 if key$ = chr$(31) then
20520 select case (No Mod 4)
20530 '登録文字から数霊文字の確認
20540 case 1:
20550 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
20560 '数霊文字の確認からトップ画面に行く
20570 case 2:
20580 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
20590 'トップ画面に行くから終了
20600 case 3:
20610 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
20620 '終了から登録文字
20630 case 0:
20640 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20650 end select
20660 endif
20670 'カーソル　上
20680 if key$ = chr$(30) then
20690 select case (No Mod 4)
20700 case 1:
20710 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
20720 case 2:
20730 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
20740 case 3:
20750 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
20760 case 0:
20770 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
20780 end select
20790 endif
20800 'エンターキーを押したとき
20810 if key$ = chr$(13) then
20820 if No=3 then goto TopScreen:
20830 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
20840 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
20850 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
20860 'lse
20870 'o'o SettingScreen:
20880 endif
20890 'ここまで
20900 Config_moji2:
20910 cls 3:Font 48
20920 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
20930 play ""
20940 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
20950 No=1
20960 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
20970 color rgb(0,0,255)
20980 'print "●設定項目" + chr$(13)
20990 print chr$(13)
21000 if lang_flag = 1 then
21010 'lang_flag = 1:英語
21020 else
21030 'lang_flag = 0:日本語
21040 color rgb(255,255,255)
21050 print "番号を選んでください" + chr$(13)
21060 'print " :1.文字の項目" + chr$(13)
21070 'print " :2.結果表示設定" + chr$(13)
21080 print " :1.文字の項目" + chr$(13)
21090 print " :2.結果表示設定" + chr$(13)
21100 print " :3.トップ画面に行く" + chr$(13)
21110 print " :4.終 了" + chr$(13)
21120 endif
21130 color rgb(0,0,0)
21140 locate 1,12
21150 if No = 1 then print "1.文字の項目"
21160 'y:バーチャルパッドの処理
21170 'key$:カーソルの処理
21180 'bg:バーチャルパッドの右ボタン
21190 config_moji2:
21200 y = 0:key$ = "":bg=0
21210 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
21220 y = stick(1)
21230 key$ = inkey$
21240 bg = strig(1)
21250 pause 2
21260 wend
21270 'バーチャルパッド　ここから'
21280 'バーチャルパッド　ここから'
21290 if y = 1 then
21300 select case No
21310 'No の初期値：No=1
21320 case 1:
21330 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
21340 'デバッグライン　ここから
21350 '0のとき
21360 'デバッグライン　ここまで
21370 'デバッグライン　ここから
21380 case 2:
21390 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
21400 color rgb(0,0,0)::No=2:goto SettingScreen:
21410 if lang_flag = 1 then
21420 else
21430 locate 0,12:print " 3.トップ画面に行くを選択"
21440 endif
21450 'cls:color rgb(255,255,255):print"ok"
21460 'デバッグライン　ここまで
21470 case 3:
21480 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
21490 'デバッグライン　ここから
21500 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
21510 'デバッグライン　ここまで
21520 case 0:
21530 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21540 'デバッグライン　ここから
21550 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
21560 'デバッグライン　ここまで
21570 end select
21580 endif
21590 'バーチャルパッド　上 ここから
21600 if y = -1 then
21610 select case No
21620 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
21630 case 1:
21640 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
21650 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
21660 case 0:
21670 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
21680 'No:3 3.Help→2.設定 No:2
21690 case 3:
21700 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
21710 case 2:
21720 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
21730 end select
21740 endif
21750 '決定ボタン
21760 if bg=1 then
21770 select case No
21780 '1.数霊チェックを選択  パッドの右キー
21790 case 1:
21800 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
21810 '2.設定を選択    パッドの右キー
21820 case 2:
21830 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
21840 '3.ヘルプを選択 パッドの右
21850 case 3:
21860 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
21870 'プログラムの終了を選択
21880 case 0:
21890 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
21900 'if lang_flag = 1 then
21910 'Else
21920 ui_msg "プログラムを終了します":end
21930 'endif
21940 end select
21950 endif
21960 '4.終了するを選択  パッドの右
21970 'バーチャルパッド　ここまで'
21980 'SettingScreen:
21990 'key$ = input$(1)
22000 'カーソル下'
22010 if key$ = chr$(31) then
22020 select case (No Mod 4)
22030 '登録文字から数霊文字の確認
22040 case 1:
22050 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22060 '数霊文字の確認からトップ画面に行く
22070 case 2:
22080 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
22090 'トップ画面に行くから終了
22100 case 3:
22110 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
22120 '終了から登録文字
22130 case 0:
22140 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
22150 end select
22160 endif
22170 'カーソル　上
22180 if key$ = chr$(30) then
22190 select case (No Mod 4)
22200 case 1:
22210 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
22220 case 2:
22230 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
22240 case 3:
22250 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
22260 case 0:
22270 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
22280 end select
22290 endif
22300 'エンターキーを押したとき
22310 if key$ = chr$(13) then
22320 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
22330 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
22340 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
22350 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
22360 'lse
22370 'o'o SettingScreen:
22380 endif
22390 '結果表示設定
22400 Result_Setting:
22410 color rgb(255,255,255)
22420 'dim list$(4)
22430 'ファイル読み込み
22440 '1.ファイルが有るか無いかのチェック
22450 if Dir$(System$) = "" then
22460 '1-1.ファイルがないとき
22470 '上のSystemフォルダを作成
22480 mkdir "./System/"
22490 list$(0) = "●:出た数字から181を引く"
22500 list$(1) = " :出た数字から180を引き単数変換"
22510 open System$ for output as #1
22520 print #1,"config_r=0"
22530 close #1
22540 ui_msg "ファイルを作成しました"
22550 'ファイル作成
22560 else
22570 '1-2.ファイルが有るとき
22580 'config_r:0 出た数字から181を引く
22590 'config_r:1 出た数字から180を引いて単数変換
22600 'open "./System/config.sys" for input as #1
22610 'ファイルが有るときファイルを読み込み
22620 open System$ for input as #1
22630 line input #1,buf_line$
22640 'buf$にデーターをコピーする
22650 buf$ = buf_line$
22660 close #1
22670 if len(buf$) = 10 then
22680  if left$(buf$,9) = "config_r=" then
22690  buf$ = right$(buf_line$,1)
22700  if buf$ = "1" then
22710    '1.System$ ファイルを削除(config.sys)
22720    '2.1行目をconfig_r=1と書き、保存する
22730    buf_config_r = 1
22740    'list$(0) = "●:1.出た数字から180を引いて単数変換"
22750    'list$(1) = " :2.出た数字から181を引く"
22760    else
22770  if buf$ = "0" then
22780    buf_config_r = 0
22790   ' list$(0) = "●:1.出た数字から181を引く"
22800   'list$(1) = " :2.出た数字から180を引いて単数変換"
22810  endif
22820  endif
22830  endif
22840 endif
22850 endif
22860 '"●:1.出た数字から180を引く"をlist$(0)に代入
22870 if buf_config_r =  0 then
22880 list$(0) = "●:1.出た数字から181を引く"
22890 list$(1) = " :2.出た数字から180を引いて単数変換"
22900 else
22910 list$(0) = "●:1.出た数字から180を引いて単数変換"
22920 list$(1) = " :2.出た数字から181を引く"
22930 endif
22940 list$(2) = " :トップ画面に戻る"
22950 list$(3) = " :終 了"
22960 list_num = ui_select("list$","番号を選んでください")
22970 play ""
22980 Select case (list_num)
22990 case 0:
23000        if buf$ = "1" then
23010        buf_config_r = 0:
23020        'データーを変更したのでファイルを削除
23030        kill System$
23040        'ファイルを新しく作成
23050        open System$ for output as #1
23060        print #1,"config_r=0"
23070        close #1
23080        ui_msg "設定を変更しました。"
23090        else
23100        'if buf$ = "0" then
23110        'buf_config_r = 1
23120        'kill System$
23130        'open Syetem$ for output as #1
23140        'print #1,"config_r=1"
23150        'close #1
23160        'ui_msg "設定を変更しました"
23170        'endif
23180        endif
23190        goto config_moji2:
23200 case 1:
23210        if buf$ = "0" then
23220        buf_config_r = 1:
23230        'データーを変更したので、ファイルを削除
23240        kill System$
23250        'ファイルを新しく作成
23260        open System$ for output as #1
23270        print #1,"config_r=1"
23280        close #1
23290        ui_msg "設定を変更しました"
23300        else
23310        kill System$
23320        if buf$ = "1" then
23330        open System$ for output as #1
23340        print #1,"config_r=0"
23350        close #1
23360        ui_msg "設定を変更しました"
23370        endif
23380        endif
23390        goto config_moji2:
23400 case 2:
23410       'トップ画面に飛ぶ
23420        goto TopScreen:
23430 case 3:
23440       'プログラムを終了する
23450       cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
23460 end select
23470 '単数変換
23480 Func Single_Complate(num)
23490 '1.出てきた数字から180を引く
23500 a = num - 180
23510 'a:10〜99
23520 Re1:
23530 if (a > 9 and a < 100) then
23540  b1 = fix(a / 10)
23550  b2 = 10 * a - b1
23560  d1 = b1 + b2
23570 if c > 9 then
23580  goto Re1:
23590 else
23600  c = d1:goto Re2:
23610 endif
23620 endif
23630 Re2:
23640 buffer = c
23650 endfunc buffer
23660 Func Surei_Result_Save_File()
23670 'ファイルがないとき
23680 if dir$(SAVE_DATA1$) = "" then
23690 open SAVE_DATA1$ for output as #1
23700 print #1,"入力文字:"+buffer_moji$+"数霊:"+str$(count)
23710 close #1
23720 ui_msg "保存しました":talk "保存しました":goto Surei_Result:
23730 else
23740 open SAVE_DATA1$ for append as #1
23750 print #1,"入力文字:" + buffer_moji$ + "数霊:" + str$(count)
23760 close #1
23770 ui_msg "保存しました":talk "保存しました":goto Surei_Result
23780 endif
23790 endfunc
23800 '言語設定
23810 Setting_Language:
23820 cls 3:gload Gazo$ + "Screen1.png":screen 1,1,1:No=2
23830 init "Kb:4"
23840 sp_on 1,1:sp_on 0,0
23850 sp_put 0,(0,200),0,0
23860 sp_put 1,(0,300),1,0
23870 color rgb(0,0,255)
23880 'print "番号を選んでください"+chr$(13)
23890 'if lang_flag=0 then
23900 'print "言語設定:日本語"+chr$(13)
23910 'else
23920 'print "言語設定:英 語"+chr$(13)
23930 Change_Language:
23940 if lang_flag = 1 then
23950 cls
23960 print "It has changed Language"+chr$(13)
23970 color rgb(255,255,255)
23980 print "Select the Number"+chr$(13)
23990 print " :1.English → Japanse"+chr$(13)
24000 print " :2.It goes to TopScreen"+chr$(13)
24010 print "Language:In English" +chr$(13)
24020 else
24030 cls
24040 print "設定変更(言語の変更)" + chr$(13)
24050 color rgb(255,255,255)
24060 print "番号を選んでください"+chr$(13)
24070 print " :1.日本語 → 英語に変更" + chr$(13)
24080 print " :2.トップ画面に戻る" + chr$(13)
24090 'print chr$(13)
24100 print "設定言語:日本語" + chr$(13)
24110 endif
24120 color rgb(0,0,0)
24130 locate 0,12:print "                                       ":locate 0,12:print "2.トップ画面に戻る　を選択" + chr$(13)
24140 Setting_Language_key:
24150 y=0:key$="":bg=0
24160 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y<> -1 and bg<> 1)
24170 y=stick(1)
24180 key$=inkey$
24190 bg=strig(1)
24200 pause 2
24210 wend
24220 '選択肢変更
24230 if ((y=1) or (y=-1)) then
24240 select case No
24250 case 2:
24260      '実装部分　ここから
24270      pause 200:No=1:sp_on 0,1:sp_on 1,0:locate 0,12:print "                                                         ":locate 0,12:print "1.日本語 → 英語に変更を選択": goto Setting_Language_key:
24280      '実装部分　ここまで
24290 case 1:
24300       pause 200: No=2:sp_on 0,0:sp_on 1,1:locate 0,12:print "                                                       ":locate 0,12:print "2.トップ画面に戻る を選択":goto Setting_Language_key:
24310 end select
24320 endif
24330 'Enter Key  決定ボタン
24340 if ((key$=chr$(13)) or (bg=1)) then
24350 select case No
24360 case 2:
24370         sp_on 0,0:sp_on 1,0:goto TopScreen:
24380 case 1:                                                     'lang_flag=1:sp_on 0,0:sp_on 1,0:goto Change_Language:
24390       '
24400 '未実装　ここから
24410  sp_on 0,1:sp_on 1,0:ui_msg "この機能は未実装です":goto Setting_Language_key:
24420 '未実装　ここまで
24430 end select
24440 endif
