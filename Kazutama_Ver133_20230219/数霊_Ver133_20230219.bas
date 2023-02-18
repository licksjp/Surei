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
420 'Jan(2023)
430 'Version 1.2.7_2023.01.03-2023.01.06(Release):正式版
440 'version 1.2.8_2023.01.07-2023.01.14(Release):正式版
450 'Version 1.2.9_2023.01.15-2023.01.22(Release):正式版
460 'Version 1.3.0_2023.01.23-2023.01.29(Release):正式版
470 'Feb(2023)
480 'Version 1.3.1_2023.01.29-2023.02.05(Release):正式版
490 'Version 1.3.2_2023.02.06-2023.02.12(Release):正式版
500 'Version 1.3.3_2023.02.12-2023.02.19(Release):正式版
510 '現在のバージョン
520 Version$ = "1.3.3_2023.02.19(正式版)"
530 'csvファイル 1.数霊 ベースファイル
540 FILE_csv$ = "data/Kazutama.csv"
550 'csvファイル 2.数霊 ベースファイル 2
560 FILE_csv2$ = "data/Surei_chart_20211207.csv"
570 'Save ファイル
580 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
590 'gazo ファイル
600 Gazo$ = "data/Gazo/"
610 'System フォルダ:設定ファイルを保存するところ
620 System$ = "System/config.sys"
630 '設定ファイル名:config.sys
640 'Sound File(Voice)
650 '1.ボイス TopScreen
660 Voice_File_TopScreen$ = "data/Sound_data/"
670 '変数領域
680 'vcount:バーチャルパッド下の変数
690 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
700 count2 = 0:N=0:N2=0:m2 = 0
710 dim list$(4),moji_List$(2)
720 'ファイルの有無チェック
730 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
740 '1.ファイルが無いとき
750 cls :print "依存ファイルが見つかりません":
760 print "エンターキーを押してください" + chr$(13)
770 key$ = input$(1)
780 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
790 else
800 '2.ファイルが有るとき
810 cls:print "csv:file ok." + chr$(13)
820 n=0
830 open FILE_csv$ for input as #1
840 while eof(1) = 0
850 input #1,line$
860 'print line$
870 bufline$(n) = line$
880 'Print n;chr$(13)
890 n = n + 1
900 wend
910 close #1
920 N=n
930 '2つ目のファイル読み込み
940 'n = 0
950 open FILE_csv2$ for input as #2
960 for n=3 to 181
970 for i=0 to 1
980 input #2,line$
990 bufline2$(n,i) = line$
1000 next i
1010 next n
1020 close #2
1030 N2 = n
1040 '
1050 endif
1060 '設定ファイルの読み込み
1070 'open System$ for input as #1
1080 'line input #1,buf_line$
1090  'if len(buf_line$) = 10 then
1100   'if left$(buf_line$,9)="config_r=" then
1110   ' buf$ = right$(buf_line$,1)
1120    'if buf$ = "1" then
1130    '   buf_config_r = 1
1140   ' else
1150   '    buf_config_r = 0
1160   ' endif
1170  ' endif
1180 'endif
1190 'close #1
1200 'or j = 3 to 181+3
1210 'ufline3$(j - 3,n) = bufline2$(i,n)
1220 'next j
1230 'moji$ = Kotodama$(bufline3$(16))
1240 'erase bufline2$
1250 '2022.11.23----------------------
1260 '端末言語のチェック
1270 '日本語端末かチェックをして日本語以外なら英語で表示する
1280 'lang flag:0:日本語 1:英語(日本語以外)
1290 '--------------------------------
1300 lang_flag = 0
1310 if ex_info$(1) <> "JP" then
1320 lang_flag = 1
1330 endif
1340 'Top画面
1350 TopScreen:
1360 'バーチャルパッドを表示
1370 cls 3:font 48:screen 1,1,1:init"kb:4":init"crt:0"
1380 'play ""
1390 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
1400 'gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
1410 gload Gazo$ + "TopScreen_20230129.png",0,0,0
1420 '選択肢 1
1430 gload Gazo$ + "Selection.png",1,5,300
1440 '選択肢 2
1450 gload Gazo$ + "Selection.png",1,5,400
1460 '選択肢 3
1470 gload Gazo$ + "Selection.png",1,5,500
1480 '選択肢 4
1490 gload Gazo$ + "Selection.png",1,5,600
1500 color rgb(0,0,255)
1510 print chr$(13)
1520 if lang_flag = 1 then
1530 color rgb(255,255,255)
1540 print "Select Number" + chr$(13)
1550 print " :1.Kazutama check" + chr$(13)
1560 print " :2.Setting" + chr$(13)
1570 print " :3.Help" + chr$(13)
1580 print " :4.End Program" + chr$(13)
1590 color rgb(255,255,255)
1600 else
1610 color rgb(255,255,255)
1620 print chr$(13)
1630 print "番号を選んでください" + chr$(13)
1640 print " :1.数霊(かずたま)チェック" + chr$(13)
1650 print " :2.設定" + chr$(13)
1660 print " :3.ヘルプ" + chr$(13)
1670 print " :4.終　了" + chr$(13)
1680 color rgb(0,0,0)
1690 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
1700 'バーチャルパッドを表示
1710 No=1:
1720 'lang_flag:1 外国語,0:日本語
1730 if lang_flag = 1 then
1740 'lang_flag=1 英語
1750 locate 0,15:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
1760 else
1770 'lang_flag=0 日本語
1780 locate 0,15:color rgb(0,0,0):print " 1.数霊(かずたま)チェックを選択";chr$(13)
1790 endif
1800 endif
1810 'スプライト
1820 '選択肢 1 On
1830 sp_def 0,(5,300),32,32
1840 sp_on 0,1
1850 sp_put 0,(5,300),0,0
1860 '選択肢 2 Off
1870 sp_def 1,(5,400),32,32
1880 sp_on 1,0
1890 sp_put 1,(5,400),0,0
1900 '選択肢 3 Off
1910 sp_def 2,(5,500),32,32
1920 sp_on 2,0
1930 sp_put 2,(5,500),0,0
1940 '選択肢 4 Off
1950 sp_def 3,(5,600),32,32
1960 sp_on 3,0
1970 sp_put 3,(5,600),0,0
1980 color rgb(0,0,0)
1990 Main_Select:
2000 'y:バーチャルパッドの処理
2010 'key$:カーソルの処理
2020 y = 0:key$ = "":bg = 0
2030 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
2040 y = stick(1)
2050 key$ = inkey$
2060 bg = strig(1)
2070 pause 2
2080 wend
2090 'if y=1 then
2100 'select case (No Mod 4)
2110 'ase 0:
2120 '     c=1:No=c:sp_on 0,1:sp_on 1,0 :sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print " 数霊(かずたま)チェックを選択":beep:goto Main_Select:
2130 'case 1:
2140 '       =2:No=c:sp_on 0,0:
2150 '"ase 2:
2160 'ase 3:
2170 'nd select
2180 'ndif
2190 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
2200 '1.バーチャルパッドの処理
2210 'バーチャルパッド下を押した時
2220 if y = 1 then
2230 select case No
2240 'No の初期値：No=1
2250 case 1:
2260 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
2270 if lang_flag = 1 then
2280 'lang_flag=1 英語
2290 locate 0,15:print "2.It has selected Setting":goto Main_Select:
2300 else
2310 'lang_flag=0 日本語
2320 locate 0,15:print " 2.設定を選択":goto Main_Select:
2330 endif
2340 'デバッグライン　ここから
2350 '0のとき
2360 'デバッグライン　ここまで
2370 'デバッグライン　ここから
2380 'バーチャルパッド　下
2390 case 2:
2400 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:
2410 print "                                         ":
2420 if lang_flag = 1 then
2430 color rgb(0,0,0):locate 0,15:
2440 print "3.It has selected Help":No=3:goto Main_Select:
2450 else
2460 color rgb(0,0,0):locate 0,15:print "                                                         ":locate 0,15:
2470 print " 3.ヘルプを選択":No=3:goto Main_Select:
2480 endif
2490 'cls:color rgb(255,255,255):print"ok"
2500 'デバッグライン　ここまで
2510 case 3:
2520 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print"                                               "
2530 if lang_flag = 1 then
2540 locate 0,15:print "4.It has selected finish program":No=0:goto Main_Select:
2550 else
2560 locate 0,15:print "                                                         " :locate 0,15:print " 4.終了を選択":No=0:goto Main_Select:
2570 endif
2580 'デバッグライン　ここから
2590 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
2600 'デバッグライン　ここまで
2610 case 0:
2620 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1
2630 if lang_flag = 1 then
2640 'lang_flag=1:英語
2650 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
2660 else
2670 'lang_flag=0:日本語
2680 locate 0,15:print "                                      ":locate 0,15:print " 1.数霊(かずたま)チェックを選択":goto Main_Select:
2690 'endif
2700 endif
2710 'デバッグライン　ここから
2720 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
2730 'デバッグライン　ここまで
2740 end select
2750 endif
2760 'バーチャルパッド　上 ここから
2770 if y = -1 then
2780 select case No
2790 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
2800 case 1:
2810 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       "
2820 if lang_flag = 1 then
2830 'lang_flag=1 英語
2840 locate 0,15:print "4.It has finished program":goto Main_Select:
2850 else
2860 'lang_flag=0 日本語
2870 locate 0,15:print "                                                          ":
2880 locate 0,15:print " 4.終了を選択":goto Main_Select:
2890 endif
2900 'endif
2910 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
2920 case 0:
2930 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":
2940 if lang_flag = 1 then
2950 '1:英語
2960 locate 0,15:print "3.It has selected Help":goto Main_Select:
2970 else
2980 '0:日本語
2990 locate 0,15:print "                                                                                        "
3000 locate 0,15:print " 3.ヘルプを選択":goto Main_Select:
3010 endif
3020 'No:3 3.Help→2.設定 No:2
3030 case 3:
3040 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      "
3050 if lang_flag = 1 then
3060 '1:英語
3070 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3080 else
3090 '0:日本語
3100 locate 0,15:print" 2.設定を選択":goto Main_Select:
3110 endif
3120 case 2:
3130 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":
3140 if lang_flag = 1 then
3150 'lang_flag 1 英語
3160 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3170 else
3180 'lang_flag 0 日本語
3190 locate 0,15:print" 1.数霊(かずたま)チェックを選択":goto Main_Select:
3200 endif
3210 end select
3220 endif
3230 if bg=1 then
3240 select case No
3250 '1.数霊チェックを選択  パッドの右キー(決定)
3260 case 1:
3270 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
3280 '2.設定を選択  パッドの右キー(決定)
3290 case 2:
3300 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
3310 '3.ヘルプを選択 パッドの右(決定)
3320 case 3:
3330 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
3340 'プログラムの終了を選択(決定)
3350 case 0:
3360 cls 3:cls 4:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:
3370 'if lang_flag = 1 then
3380 'lang_flag = 1 英語
3390 'else
3400 'lang_flag = 0 日本語
3410 ui_msg "プログラムを終了します":color rgb(255,255,255):end
3420 'endif
3430 end select
3440 '4.終了するを選択  パッドの右
3450 endif
3460 'バーチャルパッド　上　ここまで
3470 '2.カーソルの処理
3480 'カーソル　下 chr$(31)
3490 if (key$ = chr$(31)) then
3500 select case (No)
3510 '4
3520 '0 選択肢4 => 選択肢1
3530 case 0:
3540 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "              ":color rgb(0,0,0):
3550 if lang_flag = 1 then
3560 'lang flag:1 英語
3570 else
3580 'lang flag:0 日本語
3590 color rgb(0,0,0):locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
3600 endif
3610 '1 選択肢1 => 選択肢2
3620 case 1:
3630 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":
3640 if lang_flag = 1 then
3650 'lang_flag:1 英語
3660 else
3670 'lang_flag:0 日本語
3680 color rgb(0,0,0):locate 0,15:print "2.設定を選択":beep:goto Main_Select:
3690 endif
3700 '2 選択肢2 => 選択肢3
3710 case 2:
3720 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,15:print "               ":
3730 if lang_flag = 1 then
3740 'lang flag:1 英語
3750 else
3760 'lang flang:0 日本語
3770 color rgb(0,0,0):locate 0,15:print "3.ヘルプを選択":beep:goto Main_Select:
3780 endif
3790 '3 選択肢３ => 選択肢4
3800 case 3:
3810 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "               ":color rgb(0,0,0)
3820 if lang_flag = 1 then
3830 'lang_flag = 1 英語
3840 else
3850 'lang_flag = 0 日本語
3860 color rgb(0,0,0):locate 0,15:print "4.終 了を選択":beep:goto Main_Select:
3870 endif
3880 case else:
3890 goto Main_Select:
3900 end select
3910 endif
3920 'カーソル　上
3930 if key$=chr$(30) then
3940 select case (No)
3950 '選択肢1 => 選択肢4
3960 case 1:
3970 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:PRINT "                      ":
3980 if lang_flag = 1 then
3990 'lang_flag=1:英語
4000 'print "1.It has selected Kazutama check":goto Main_Select:
4010 else
4020 'lang_flag = 0:日本語
4030 else
4040 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4050 endif
4060 '選択肢2 => 選択肢1
4070 case 2:
4080 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                 ":locate 1,15:print "2.設 定を選択":goto Main_Select:
4090 '選択肢3　=> 選択肢2
4100 case 3:
4110 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,500),0,0
4120 if lang_flag = 1 then
4130 'lang_flag = 1:英語
4140 locate 0,15:print "It has selected Help":goto Main_Select:
4150 else
4160 'lang_flag = 0:日本語
4170 locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4180 endif
4190 '選択肢4 => 選択肢3
4200 case 0:
4210 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                ":locate 1,15:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
4220 if lang_flag = 1 then
4230 'lang flag=1 英語
4240 else
4250 'lang flag=0 日本語
4260 locate 1,15:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
4270 endif
4280 end select
4290 endif
4300 'Input "番号:",No
4310 'エンターキー入力:決定
4320 if key$ = chr$(13) then
4330 select case No
4340 case 1:
4350 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4360 case 3:
4370 Color rgb(255,255,255):goto Help:
4380 case 0:
4390 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
4400 case 2:
4410 color rgb(255,255,255):sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
4420 'else
4430 'goto Main_Select:
4440 end select
4450 endif
4460 'ndif
4470 'if N0=0 or No>4 then goto TopScreen:
4480 '1-1.数霊チェック
4490 Surei_Check:
4500 cls 3:Font 48:
4510 'gload Gazo$ + "Screen4.png"
4520 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png"
4530 play ""
4540 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
4550 color rgb(255,0,0)
4560 'print "●数霊(かずたま)チェックトップ" + chr$(13)
4570 sp_on 0,1:sp_put 0,(5,300),0,0:screen 1,1,1
4580 if lang_flag = 1 then
4590 'lang_flag=1 英語
4600 else
4610 'lang_flag=0 日本語
4620 print chr$(13)+chr$(13)+chr$(13)
4630 color rgb(255,255,255)
4640 print "番号を選んでください" + chr$(13)
4650 'print chr$(13)
4660 print " :1.数霊(かずたま)1人用" + chr$(13)
4670 print " :2.数霊(かずたま)2人用" + chr$(13)
4680 print " :3.トップ画面に行く" + chr$(13)
4690 'print " :4.終 了" + chr$(13)
4700 color rgb(0,0,0):No = 1
4710 locate 0,15:print "                                       "
4720 locate 0,15
4730 print " 1.数霊(かずたま)1人用を選択"
4740 endif
4750 Kazutama_main:
4760 'y:バーチャルパッドの処理
4770 'key$:カーソルの処理
4780 'bg:バーチャルパッドの右のボタン
4790 y = 0:key$ = "":bg=0
4800 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
4810 y = stick(1)
4820 key$ = inkey$
4830 bg=strig(1)
4840 y=stick(-1)
4850 pause 2
4860 wend
4870 'key$ = input$(1)
4880 if y = 1 then
4890 select case No
4900 'No の初期値：No=1
4910 case 1:
4920 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
4930 'if lang_flag=1 then
4940 'else
4950 locate 0,15:print "                                     "
4960 locate 0,15
4970 print" 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
4980 'endif
4990 'デバッグライン　ここから
5000 '0のとき
5010 'デバッグライン　ここまで
5020 'デバッグライン　ここから
5030 case 2:
5040 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                               "
5050 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に行くを選択":No=0:goto Kazutama_main:
5060 'cls:color rgb(255,255,255):print"ok"
5070 'デバッグライン　ここまで
5080 'case 3:
5090 'sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 4.終 了を選択":No=0:goto Kazutama_main:
5100 'デバッグライン　ここから
5110 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
5120 'デバッグライン　ここまで
5130 case 0:
5140 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5150 'デバッグライン　ここから
5160 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
5170 'デバッグライン　ここまで
5180 end select
5190 endif
5200 'バーチャルパッド　上 ここから
5210 if y = -1 then
5220 select case No
5230 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
5240 'case 1:
5250 'sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 0,15:print" 4.終了を選択":goto Kazutama_main:
5260 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
5270 case 1:
5280 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
5290 'No:3 3.Help→2.設定 No:2
5300 case 0:
5310 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 0,15:print" 2.数霊（かずたま）2人用を選択":goto Kazutama_main:
5320 case 2:
5330 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5340 end select
5350 endif
5360 if bg=1 then
5370 select case No
5380 '1.数霊チェックを選択  パッドの右キー
5390 case 1:
5400 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
5410 '2.設定を選択    パッドの右キー
5420 case 2:
5430 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
5440 '3.ヘルプを選択 パッドの右
5450 case 0:
5460 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
5470 'プログラムの終了を選択
5480 'case 0:
5490 'cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.05*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
5500 end select
5510 '4.終了するを選択  パッドの右
5520 endif
5530 'バーチャルパッド　上　ここまで
5540 if key$ = chr$(31) then
5550 select case No
5560 case 0:
5570 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,15:print "                                                          ":
5580 if lang_flag = 1 then
5590 Else
5600 locate 0,15:print "                                      "
5610 No=2:locate 0,15:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
5620 endif
5630 case 1:
5640 No=0:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,12:print "                                                          ":
5650 if lang_flag = 1 then
5660 Else
5670 locate 0,15:print"                                      "
5680 locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
5690 endif
5700 'case 2:
5710 'No=3:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,12:print"                                       ":
5720 'if lang_flag = 1 then
5730 'Else
5740 'locate 0,12:print" 4.終了を選択":goto Kazutama_main:
5750 'endif
5760 case 2:
5770 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                      ":
5780 if lang_flag = 1 then
5790 Else
5800 No=1:locate 0,15:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
5810 endif
5820 end select
5830 endif
5840 if key$=chr$(13) then
5850 select case No
5860 case 1:
5870 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
5880 case 2:
5890 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
5900 case 3:
5910 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
5920 'case 0:
5930 'cls 4:cls 3:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
5940 end select
5950 endif
5960 'Input "番号:",No
5970 '前の画面に戻る
5980 'if No = 3 then goto TopScreen:
5990 'プログラムの終了
6000 'if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":COLOR rgb(255,255,255):end
6010 '1人用
6020 'if No = 1 then goto Surei_Input:
6030 '2人用
6040 'if No = 2 then goto Surei_twoParson:
6050 'if No > 4 or No=0 then ui_msg"もう一度入れてください":goto Surei_Check:
6060 '数霊(かずたま) 文字入力  1人用
6070 Surei_Input:
6080 if mode = 0 then
6090 cls 3:font 32:init"kb:2"
6100 gload Gazo$ + "InputKotodama_20230131.png"
6110 play""
6120 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
6130 color rgb(255,0,0)
6140 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
6150 if lang_flag=1 then
6160 '英語
6170 else
6180 print chr$(13)+chr$(13)+chr$(13)
6190 color rgb(255,255,255)
6200 print "文字を入れてください" + chr$(13)
6210 color rgb(255,255,255)
6220 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
6230 print chr$(13)
6240 color rgb(0,0,0)
6250 Input "入力文字:",buffer_moji$
6260 if buffer_moji$ = "" then
6270 ui_msg "未入力です":goto Surei_Input:
6280 'endif
6290 else
6300 goto Surei_Result:
6310 endif
6320 endif
6330 endif
6340 'else
6350 if mode = 1 then
6360 cls 3:Font 32:
6370 gload Gazo$ + "InputKotodama.png"
6380 color rgb(255,0,0)
6390 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
6400 color rgb(255,255,255)
6410 print "文字を入れてください" + chr$(13)
6420 color rgb(255,0,0)
6430 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
6440 print "大文字のみ)" + chr$(13)
6450 color rgb(0,0,0)
6460 Input "文字入力:",buffer_moji2$
6470 goto Surei_Result3:
6480 'endif
6490 endif
6500 '数霊(かずたま)文字入力　2人用
6510 Surei_twoParson:
6520 cls 3:Font 32:init"kb:2"
6530 gload Gazo$ + "InputKotodama_20230131.png"
6540 '1人目入力
6550 if lang_flag = 1 then
6560 'color rgb(255,0,0)
6570 else
6580 print ""+chr$(13)+chr$(13)+chr$(13)
6590 'print "●数霊(かずたま) 1人目 入力" + chr$(13)
6600 color rgb(255,255,255)
6610 print "1人目の文字を入れてください" + chr$(13)
6620 color rgb(255,255,255)
6630 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
6640 color rgb(0,0,0)
6650 print chr$(13)
6660 Input "1人目文字入力:",buf_Parson1$
6670 endif
6680 Surei_twoParson2:
6690 cls 3:Font 32:init"kb:2"
6700 '2人目入力
6710 gload Gazo$ + "InputKotodama_20230131.png"
6720 'color rgb(255,0,0)
6730 'print "●数霊(かずたま) 2人目 入力" + chr$(13)
6740 if lang_falg = 1 then
6750 else
6760 print ""+chr$(13)+chr$(13)+chr$(13)
6770 color rgb(255,255,255)
6780 print "2人目の文字を入れてください" + chr$(13)
6790 color rgb(255,255,255)
6800 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
6810 color rgb(0,0,0)
6820 Input "2人目の文字入力:",buf_Parson2$
6830 goto Surei_Result2:
6840 endif
6850 '数霊　計算 パート
6860 '文字の計算関数
6870 'moji$:1文字を入れる
6880 func Complate(moji$)
6890 for n = 1 to 116
6900 if moji$ = bufline$(2*n) then
6910 buffcount = val(bufline$(2 * n + 1))
6920 endif
6930 next n
6940 endfunc buffcount
6950 '数霊　結果表示
6960 Surei_Result:
6970 cls 3:Font 32
6980 'ゼロカウント:zcount
6990 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
7000 '例 アカい:"い"の文字は無効な文字なので、はじく
7010 zcount=0
7020 'mojicount:入力文字数
7030 mojicount = len(buffer_moji$)
7040 for n=1 to mojicount
7050 for j=1 to 118
7060 if (bufcount$(n - 1) = bufline$(2 * j)) then
7070   bufcount$(n-1) = Mid$(buffer_moji$,n,1)
7080 endif
7090 next j
7100 next n
7110 'if mojicount > zcount then
7120 'cls 3:ui_msg "無効な文字です":talk "無効な文字があります。":zcount = 0:goto Surei_Input:
7130 ncount=0:count=0
7140    for i = 1 to mojicount
7150     bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7160   'ンのカウント
7170    if (bufcount$(i-1) = "ン") then ncount = ncount + 1
7180     'bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7190    next i
7200    if (ncount > 0) then
7210    'Listを表示する
7220    moji_List$(0) = "この単語は目に見える物です"
7230    moji_List$(1) = "この単語は目に見えない物です"
7240    num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
7250    if (num2 = 0) then
7260      ' n1 = n1 + 0
7270    else
7280    if (num2 = 1) then
7290       n1 = 9 * ncount
7300       'buf_count = 9 * ncount
7310    endif
7320    endif
7330    endif
7340 'else
7350    for j=1 to mojicount
7360    bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7370    count = count + Complate(bufcount$(j - 1))
7380   ' count = count + n1:count2 = count
7390 'endif
7400    'count = count + buf_count:
7410    next j
7420    count = count + n1
7430 if (ncount > 0) then count = count
7440 '182以上のとき,181を引く
7450 if buf_cofig_r = 0 then
7460      if (count > 181) then
7470 'if buf_config_r = 0 then
7480         count = count - 181
7490 'else
7500 'if buf_config_r = 1 then
7510 '   count=Single_Complate(count2)
7520 'endif
7530      else
7540      if (buf_config_r = 1) then
7550        'count2 = count - 180
7560        buf_count = Single_Complate(count)
7570      endif
7580 endif
7590 endif
7600 'if config_r = 0 then
7610 cls 3:Font 48+16
7620 gload Gazo$ + "Result_Screen3_20211226.png"
7630 if buf_config_r = 1 then
7640    print "入力文字:" + buffer_moji$ + chr$(13)
7650    print "数霊(かずたま):";buf_count;chr$(13)
7660 endif
7670 if lang_flag = 1 then
7680 else
7690 color rgb(255,0,0)
7700 print "入力文字:" + buffer_moji$ + chr$(13)
7710 endif
7720 'print chr$(13)
7730 if lang_flag = 1 then
7740 else
7750 color rgb(0,0,255)
7760 print "数霊(かずたま):";count;chr$(13)
7770 endif
7780 if lang_flag = 1 then
7790 else
7800 color rgb(0,0,0)
7810 print "エンター or スペース" + chr$(13)
7820 print  chr$(13)
7830 'endif
7840 endif
7850 key$ = input$(1)
7860 if ((key$ = chr$(13)) or (key$=" ")) then
7870 List$(0)="1.もう一度数霊を見る"
7880 List$(1)="2.トップ画面に行く"
7890 List$(2)="3.この数霊の説明を見る"
7900 List$(3)="4.数霊データーを保存"
7910 num=ui_select("List$","番号を選んでください")
7920 select case num
7930   case 0:
7940          goto Surei_Input:
7950   case 1:
7960        n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
7970          for i=0 to 9
7980             bufcount$(i)=""
7990          next i
8000          goto TopScreen:
8010   case 2:
8020        goto Surei_Result4:
8030   case 3:
8040         s=Surei_Result_Save_File()
8050         ui_msg "保存しました"
8060   case -1:
8070        'goto Surei_Result:
8080   case else:
8090        goto Surei_Result:
8100 end select
8110 'endif
8120 'if key$ = " " then
8130 '２回めの入力に行く
8140 'mode = 1:goto Surei_Input:
8150 'else
8160 'if key$ = "s" or key$ = "S" then
8170 'ファイルを保存する
8180 's = Save()
8190 'ui_msg"保存しました"
8200 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
8210 else
8220 goto Surei_Result:
8230 'endif
8240 endif
8250 '3-1 バージョン情報
8260 Version:
8270 cls 3:Font 32
8280 gload Gazo$ + "Screen1_Version.png"
8290 play ""
8300 play Voice_File_TopScreen$ + "Voice_Version.mp3"
8310 color rgb(255,0,0)
8320 'print"●バージョン情報"+chr$(13)
8330 print chr$(13)
8340 color rgb(255,255,255)
8350 if lang_flag = 1 then
8360 else
8370 print chr$(13)+chr$(13)+chr$(13)
8380 print "Ver:";Version$ + chr$(13)
8390 print "アプリ名:数霊"+ chr$(13)
8400 print "Basic for Android Runtime" + chr$(13)
8410 print "Author:licksjp" + chr$(13)
8420 print "制作開始:2021.7.28" + chr$(13)
8430 print chr$(13)
8440 print "(C)Copy right licksjp " + chr$(13)
8450 print "All rights reserved" + chr$(13)
8460 print chr$(13)
8470 color rgb(0,0,0)
8480 print "パッドの右を押してください" + chr$(13)
8490 endif
8500 'key$ = input$(1)
8510 bg=0:key$=""
8520 while (bg <> 1 and key$ <> chr$(13))
8530 bg = strig(1)
8540 key$ = inkey$
8550 pause 2
8560 wend
8570 if key$ = chr$(13) then
8580 goto TopScreen:
8590 'else
8600 'talk "無効なキーです":goto Version:
8610 else
8620 if bg=1 then
8630 goto TopScreen:
8640 else
8650 if lang_flag = 1 then
8660 else
8670 talk "無効なキーです":goto Version:
8680 endif
8690 endif
8700 endif
8710 '3-2 参考文献
8720 Reference_Book:
8730 cls 3:Font 48:play""
8740 gload Gazo$ + "Screen1_Reference.png"
8750 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
8760 color rgb(255,0,0)
8770 'print"●参考文献" + chr$(13)
8780 print chr$(13)+chr$(13)
8790 if lang_flag = 1 then
8800 else
8810 color rgb(255,255,255)
8820 print "書名:数霊" + chr$(13)
8830 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
8840 print "出版社:徳間書店" + chr$(13)
8850 print "ISBN:978-4-19-" + chr$(13)
8860 print "         865309-5" + chr$(13)
8870 print "定価:2300円 + 税" + chr$(13)
8880 'print chr$(13)
8890 color rgb(0,0,0)
8900 print "パッドの右を押してください"
8910 endif
8920 bg = 0:key$ = ""
8930 while (bg <> 1 and key$ <> chr$(13))
8940 bg = strig(1)
8950 key$ = inkey$
8960 pause 2
8970 wend
8980 if key$ = chr$(13) then
8990 goto TopScreen:
9000 'else
9010 'talk "無効なキーです":goto Reference_Book:
9020 else
9030 if bg = 1 then
9040 goto TopScreen:
9050 else
9060 talk "無効なキーです":goto Reference_Book:
9070 endif
9080 endif
9090 'key$=input$(1)
9100 'if key$=chr$(13) then
9110 'goto TopScreen:
9120 'else
9130 'talk"無効なキーです":goto Reference_Book:
9140 'endif
9150 'ヘルプ画面　トップ画面
9160 Help:
9170 No=1:c=0
9180 play ""
9190 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
9200 cls 3:Font 48:
9210 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9220 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0
9230 color rgb(255,0,0)
9240 'print "●3.ヘルプ　トップ画面" + chr$(13)
9250 print chr$(13)+chr$(13)+chr$(13)
9260 color rgb(255,255,255)
9270 print "番号を選んでください" + chr$(13)
9280 print " :1.バージョン" + chr$(13)
9290 print " :2.参考文献" + chr$(13)
9300 print " :3.トップ画面に行く" + chr$(13)
9310 'print " :4.終 了" + chr$(13)
9320 color rgb(0,0,0)
9330 'print " :3.トップ画面に行く" + chr$(13)+chr$(13)
9340 locate 0,15:print "                                     "
9350 if No = 1 then locate 0,15:print " 1.バージョンを選択"
9360 'y:バーチャルパッドの処理
9370 'key$:カーソルの処理
9380 'bg:バーチャルパッドの右ボタン
9390 Help_key:
9400 y = 0:key$ = "":bg=0
9410 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
9420 y = stick(1)
9430 key$ = inkey$
9440 bg=strig(1)
9450 pause 2
9460 wend
9470 'バーチャルパッド　ここから'
9480 if y = 1 then
9490 select case No
9500 'No の初期値：No=1
9510 case 1:
9520 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
9530 if lang_flag = 1 then
9540 else
9550 locate 0,15:print" 2.参考文献を選択":goto Help_key:
9560 endif
9570 'デバッグライン　ここから
9580 '0のとき
9590 'デバッグライン　ここまで
9600 'デバッグライン　ここから
9610 case 2:
9620 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                  "
9630 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に行くを選択":No=0:goto Help_key:
9640 'cls:color rgb(255,255,255):print"ok"
9650 'デバッグライン　ここまで
9660 'case 3:
9670 'sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print "                                       ":locate 0,15:print "4.終 了を選択":No=0:goto Help_key:
9680 'デバッグライン　ここから
9690 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
9700 'デバッグライン　ここまで
9710 case 0:
9720 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
9730 'デバッグライン　ここから
9740 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
9750 'デバッグライン　ここまで
9760 end select
9770 endif
9780 'バーチャルパッド　上 ここから
9790 if y = -1 then
9800 select case No
9810 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
9820 'case 1:
9830 'sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 0,15:print"4.終了を選択"::goto Help_key:
9840 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
9850 case 0:
9860 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=1:locate 0,15:print"                                       ":locate 0,15:print" 3.トップ画面に行くを選択":goto Help_key
9870 'No:3 3.Help→2.設定 No:2
9880 case 1:
9890 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
9900 case 2:
9910 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=0:locate 0,15:print "                                      ":locate 0,15:print" 1.バージョンを選択":goto Help_key:
9920 end select
9930 endif
9940 if bg = 1 then
9950 select case No
9960 '1.数霊チェックを選択  パッドの右キー
9970 case 1:
9980 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
9990 '2.設定を選択    パッドの右キー
10000 case 2:
10010 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
10020 '3.ヘルプを選択 パッドの右
10030 case 0:
10040 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
10050 'プログラムの終了を選択
10060 'case 0:
10070 'cls 3:cls 4:color rgb(255,255,255):play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
10080 'if lang_flag = 1 then
10090 'lang_flag = 1:英語
10100 'Else
10110 'lang_flag = 0:日本語
10120 'endif
10130 end select
10140 '4.終了するを選択  パッドの右
10150 endif
10160 'バーチャルパッド　上　ここまで
10170 'バーチャルパッド　ここまで'
10180 'key$ = input$(1)
10190 'カーソルの下
10200 if key$ = chr$(31) then
10210 select case (No Mod 4)
10220 'バージョンから参考文献
10230 case 0:
10240 c=1:No=c:locate 0,15:Print "             ":locate 0,15:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
10250 '参考文献からトップ画面
10260 case 1:
10270 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "            ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10280 'トップ画面から終了
10290 'case 2:
10300 'c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,12:print "                ":locate 0,12:print " 4.終 了を選択":goto Help_key:
10310 '終了からバージョン
10320 case 2:
10330 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                     ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10340 case else:
10350 goto Help_key:
10360 end select
10370 endif
10380 'カーソル　上
10390 if key$ = chr$(30) then
10400 select case (c Mod 4)
10410 'バージョンから終了
10420 case 0:
10430 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:locate 0,15:print "                   ":locate 0,15:print " 4.終 了を選択":goto Help_key:
10440 '参考文献からバージョン
10450 case 1:
10460 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                   ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10470 'トップ画面から参考文献
10480 case 2:
10490 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":locate 0,15:print " 2.参考文献を選択":goto Help_key:
10500 '終了からトップ画面を選択
10510 case 3:
10520 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print"                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10530 case else:
10540 goto Help_key:
10550 end select
10560 endif
10570 'Input "番号:",No
10580 'sp_def 0,(5,200),32,32
10590 'エンターキー：決定
10600 if key$=chr$(13) then
10610 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10620 if No=0 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10630 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10640 'if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg "プログラムを終了します":cls 3:cls 4:end
10650 else
10660 goto Help_key:
10670 endif
10680 'if (No = 0 or No > 4) then ui_msg "もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
10690 '登録文字の確認
10700 '文字を1文字入れて登録されているか調べるメニュー
10710 '設定項目
10720 Setting:
10730 cls 3:Font 48
10740 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
10750 play ""
10760 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
10770 No=1
10780 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:
10790 color rgb(0,0,255)
10800 'print "●設定項目" + chr$(13)
10810 print chr$(13)
10820 if lang_flag = 1 then
10830 'lang_flag = 1:英語
10840 else
10850 'lang_flag = 0:日本語
10860 color rgb(255,255,255)
10870 print chr$(13)
10880 print "番号を選んでください" + chr$(13)
10890 '-------コメント----------------
10900 'print " :1.登録文字の確認" + chr$(13)
10910 'print " :2.数霊文字確認" + chr$(13)
10920 '-------コメント----------------
10930 'print chr$(13)
10940 print " :1.文字の項目" + chr$(13)
10950 print " :2.結果表示設定" + chr$(13)
10960 print " :3.言語設定" + chr$(13)
10970 print " :4.トップ画面に行く" + chr$(13)
10980 endif
10990 color rgb(0,0,0)
11000 locate 0,15
11010 if No=1 then locate 0,15:print  "                                     ":locate 0,15:print " 1.文字の項目を選択"
11020 'y:バーチャルパッドの処理
11030 'key$:カーソルの処理
11040 'bg:バーチャルパッドの右ボタン
11050 SettingScreen:
11060 y = 0:key$ = "":bg=0
11070 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
11080 y = stick(1)
11090 key$ = inkey$
11100 bg=strig(1)
11110 pause 2
11120 wend
11130 'バーチャルパッド　ここから'
11140 'バーチャルパッド　ここから'
11150 if y = 1 then
11160 select case No
11170 'No の初期値：No=1
11180 case 1:
11190 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":color rgb(0,0,0):locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11200 'デバッグライン　ここから
11210 '0のとき
11220 'デバッグライン　ここまで
11230 'デバッグライン　ここから
11240 case 2:
11250 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                         "
11260 color rgb(0,0,0)::No=3
11270 if lang_flag = 1 then
11280 else
11290 locate 1,15:print "3.言語設定を選択":goto SettingScreen:
11300 endif
11310 'cls:color rgb(255,255,255):print"ok"
11320 'デバッグライン　ここまで
11330 case 3:
11340 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print"                                              ":locate 1,15:print "4.トップ画面に行くを選択":No=0:goto SettingScreen:
11350 'デバッグライン　ここから
11360 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11370 'デバッグライン　ここまで
11380 case 0:
11390 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
11400 'デバッグライン　ここから
11410 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11420 'デバッグライン　ここまで
11430 end select
11440 endif
11450 'バーチャルパッド　上 ここから
11460 if y = -1 then
11470 select case No
11480 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11490 case 1:
11500 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 1,15:print"4.トップ画面に行くを選択":goto SettingScreen:
11510 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11520 case 0:
11530 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
11540 'No:3 3.Help→2.設定 No:2
11550 case 3:
11560 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.結果表示設定を選択":goto SettingScreen:
11570 case 2:
11580 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 1,15:print"1.文字の項目を選択":goto SettingScreen:
11590 end select
11600 endif
11610 if bg=1 then
11620 select case No
11630 '1.数霊チェックを選択  パッドの右キー
11640 case 1:
11650 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
11660 '2.設定を選択    パッドの右キー
11670 case 2:
11680 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
11690 '3.ヘルプを選択 パッドの右
11700 case 0:
11710 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
11720 'プログラムの終了を選択
11730 case 3:
11740 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Setting_Language:
11750 'if lang_flag = 1 then
11760 'Else
11770 'ui_msg "プログラムを終了します"
11780 'endif
11790 end select
11800 endif
11810 '4.終了するを選択  パッドの右
11820 'バーチャルパッド　ここまで'
11830 'SettingScreen:
11840 'key$ = input$(1)
11850 'カーソル下'
11860 if key$ = chr$(31) then
11870 select case (No Mod 4)
11880 '登録文字から数霊文字の確認
11890 case 1:
11900 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                     ":locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11910 '数霊文字の確認からトップ画面に行く
11920 case 2:
11930 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "                                     ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
11940 'トップ画面に行くから終了
11950 case 3:
11960 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                                       ":locate 1,15:print "4.トップ画面に行くを選択":goto SettingScreen:
11970 '終了から登録文字
11980 case 0:
11990 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
12000 end select
12010 endif
12020 'カーソル　上
12030 if key$ = chr$(30) then
12040 select case (No Mod 4)
12050 case 1:
12060 c=2:No=c:sp_on 0,1:sp_put 0,(5,300),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
12070 case 2:
12080 c=3:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
12090 case 3:
12100 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:goto SettingScreen:
12110 case 0:
12120 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,600),0,0:sp_on 0,0:goto SettingScreen:
12130 end select
12140 endif
12150 'エンターキーを押したとき
12160 if key$ = chr$(13) then
12170 if No=3 then goto Setting_Language:
12180 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
12190 'if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji1:
12200 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
12210 if No=0 then goto TopScreen:
12220 'lse
12230 'o'o SettingScreen:
12240 endif
12250 'endif
12260 'endif
12270 '文字検索項目  ここから
12280 Moji_Search:
12290 cls 4:cls 3:Font 32+16:init"kb:2"
12300 gload Gazo$ + "Moji_Search_Result.png"
12310 play ""
12320 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
12330 print "" + chr$(13)
12340 color rgb(255,255,255)
12350 if lang_flag = 1 then
12360 Else
12370 print "文字を一文字入れてください" + chr$(13)
12380 endif
12390 color rgb(0,0,0)
12400 if lang_flag=1 then
12410 Else
12420 Input "登録文字:",moji$
12430 endif
12440 moji_count = len(moji$)
12450 if moji_count > 1 then
12460 'if lang_flag = 1 then
12470 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Moji_Search:
12480 'Else
12490 'endif
12500 else
12510 count=0
12520 for n = 0 to 116
12530 if bufline$(2*n) = moji$ then
12540 cls 3:font 48:init"kb:4"
12550 gload Gazo$ + "Moji_Search_Result.png"
12560 'talk"この文字は登録されています"
12570 play ""
12580 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12590 if lang_flag = 1 then
12600 Else
12610 print chr$(13)
12620 color rgb(255,255,255)
12630 print moji$;"は、登録されています。" + chr$(13)
12640 color rgb(0,0,0)
12650 print "ジョイパッドの右を押してください"
12660 endif
12670 bg = 0:key$ = ""
12680 while (bg <> 1 and key$ <> chr$(13))
12690 key$ = inkey$
12700 bg = strig(1)
12710 pause 2
12720 wend
12730 'y$=input$(1)
12740 if key$ = chr$(13) then goto TopScreen:
12750 if bg=1 then goto TopScreen:
12760 count = count + 1
12770 endif
12780 next n
12790 if count = 0 then
12800 cls 3:font 48:init "kb:4"
12810 gload Gazo$ + "Moji_check.png"
12820 play ""
12830 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
12840 print chr$(13)
12850 if lang_flag = 1 then
12860 Else
12870 color rgb(255,255,255)
12880 print moji$;"は、登録されていません。" + chr$(13)
12890 color rgb(0,0,0)
12900 print "パッドの右を押してください" + chr$(13)
12910 endif
12920 kg = 0:key$ = ""
12930 while (kg <> 1 and key$ <> chr$(13))
12940 key$ = inkey$
12950 kg = strig(1)
12960 pause 2
12970 wend
12980 if ((key$ = chr$(13)) or (kg=1)) then goto TopScreen:
12990 endif
13000 endif
13010 Surei_Result2:
13020 cls 3:Font 48
13030 zcount1=0:zcount2=0:count1=0:count2=0
13040 '1人目
13050 mojicount1=len(buf_Parson1$)
13060 '2人目
13070 mojicount2 = len(buf_Parson2$)
13080 '1人目
13090 for n = 1 to mojicount1
13100 for j = 1 to 116
13110 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
13120 if bufcount1$(n-1) = bufline$(2*j) then
13130 zcount1 = zcount1 + 1
13140 endif
13150 next j
13160 next n
13170 '2人目
13180 for n = 1 to mojicount2
13190 for j = 1 to 116
13200 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
13210 if bufcount2$(n-1) = bufline$(2*j) then
13220 zount2 = zcount2 + 1
13230 endif
13240 next j
13250 next n
13260 '1人目
13270 for i=1 to mojicount1
13280 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
13290 p1 = Complate(bufcount1$(i-1))
13300 count1 = count1 + p1
13310 next i
13320 '2人目
13330 for i = 1 to mojicount2
13340 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
13350 p2 = Complate(bufcount2$(i-1))
13360 count2 = count2 + p2
13370 next i
13380 cls 3:
13390 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
13400 color rgb(255,0,0)
13410 'print "数霊 2人用 結果表示"+chr$(13)
13420 print ""+chr$(13)
13430 if lang_flag = 1 then
13440 else
13450 color rgb(255,255,255)
13460 print "1人目:";buf_Parson1$;chr$(13)
13470 print "数霊1:";count1;chr$(13)
13480 print "2人目:";buf_Parson2$;chr$(13)
13490 print "数霊2:";count2;chr$(13)
13500 print "数霊(合計):";count1 + count2;chr$(13)
13510 color rgb(0,0,0)
13520 print "エンターキーを押してください" + chr$(13)
13530 endif
13540 key$ = "":bg = 0
13550 'ey$=input$(1)
13560 while (bg <> 1 and key$ <> chr$(13))
13570 bg = strig(1)
13580 key$ = inkey$
13590 pause 2
13600 wend
13610 if (bg = 1 or key$ = chr$(13))  then goto TopScreen:
13620 Surei_Result3:
13630 cls 3:Font 48
13640 zcount2 = 0:count2 = 0
13650 mojicount2 = len(buffer_moji2$)
13660 for n = 1 to mojicount2
13670 for j = 1 to 116
13680 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
13690 if bufcount2$(n - 1) = bufline$(2 * j) then
13700 zcount2 = zcount2 + 1
13710 endif
13720 next j
13730 next n
13740 for i = 1 to mojicount2
13750 n2 = Complate(bufcount2$(i-1))
13760 count2 = count2 + n2
13770 next i
13780 gload Gazo$ + "Screen5.png"
13790 if lang_flag = 1 then
13800 else
13810 color rgb(255,0,0)
13820 print "数霊の結果表示" + chr$(13)
13830 color rgb(255,255,255)
13840 print "１回目回の文字入力:";buffer_moji$;chr$(13)
13850 print "１回目の数霊(かずたま)";count;chr$(13)
13860 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
13870 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
13880 color rgb(0,0,0)
13890 print "エンターキー:トップ画面";chr$(13)
13900 print "c or C キー:数霊の比較";chr$(13)
13910 endif
13920 key$ = "":bg = 0
13930 while (key$ <> chr$(13) and bg <> 1)
13940 bg = strig(1)
13950 key$ = inkey$
13960 pause 2
13970 wend
13980 'key$ = input$(1)
13990 if bg = 1 then goto TopScreen:
14000 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
14010 if key$ = "c" or key$ = "C" then
14020 if count = count2 then
14030 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
14040 else
14050 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
14060 endif
14070 endif
14080 Moji_Count_Check:
14090 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
14100 cls 3:Font 48
14110 gload Gazo$ + "Moji_check.png"
14120 n = 0
14130 open FILE_csv$ for input as #1
14140 while eof(1) = 0
14150 line input #1, line$
14160 n = n + 1
14170 wend
14180 close #1
14190 'n = n - 1
14200 'talk "登録文字数は"+str$(n)+"文字です"
14210 play ""
14220 if n = 118 then
14230 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
14240 if lang_flag = 1 then
14250 else
14260 'talk "登録文字数は、" + str$(n) + "文字です"
14270 print "" + chr$(13)
14280 color rgb(255,255,255)
14290 print "文字の登録文字数は";n;"文字" + chr$(13)
14300 color rgb(0,0,0)
14310 print "パッドの右を押してください" + chr$(13)
14320 endif
14330 endif
14340 'key$ = input$(1)
14350 key$ = "":bg = 0
14360 while (key$ <> chr$(13) and bg <> 1)
14370 key$=inkey$
14380 bg=strig(1)
14390 pause 2
14400 wend
14410 if bg = 1 then goto TopScreen:
14420 if key$ = chr$(13) then
14430 goto TopScreen:
14440 else
14450 goto Moji_Count_Check:
14460 endif
14470 'Save 関数
14480 file_kazutama = 0
14490 file_kazutama = Save_File()
14500 func Save_File()
14510 open SAVE_DATA1$  for output as #1
14520 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
14530 close #1
14540 endfunc
14550 Select_moji:
14560 cls 3:font 48:No = 1
14570 gload Gazo$ + "Screen1_mojicheck.png"
14580 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
14590 color rgb(255,0,0)
14600 'print "文字の確認" + chr$(13)
14610 if lang_flag = 1 then
14620 else
14630 play ""
14640 play Voice_File_TopScreen$ + "Voice_Select_Moji20230217.mp3"
14650 print chr$(13)+chr$(13)+chr$(13)
14660 color rgb(255,255,255)
14670 print "番号を選んでください" + chr$(13)
14680 print " :1.登録文字検索"+ chr$(13)
14690 print " :2.登録文字数の確認" + chr$(13)
14700 print " :3.トップ画面に戻る" + chr$(13)
14710 'print " :4.終　了" + chr$(13)
14720 color rgb(0,0,0)
14730 locate 0,15
14740 if No = 1 then print " 1.登録文字検索を選択"
14750 endif
14760 Entry_check_key:
14770 y = 0:key$ = "":bg=0
14780 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
14790 y = stick(1)
14800 key$ = inkey$
14810 bg=strig(1)
14820 pause 2
14830 wend
14840 'バーチャルパッド　ここから'
14850 'バーチャルパッド　ここから'
14860 if y = 1 then
14870 select case No
14880 'No の初期値：No=1
14890 case 1:
14900 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
14910 'デバッグライン　ここから
14920 '0のとき
14930 'デバッグライン　ここまで
14940 'デバッグライン　ここから
14950 case 2:
14960 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                       "
14970 :No=0
14980 'if lang_flag = 1 then
14990 'Else
15000 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に戻るを選択":goto Entry_check_key:
15010 'endif
15020 'cls:color rgb(255,255,255):print"ok"
15030 'デバッグライン　ここまで
15040 'case 3:
15050 'sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 4.終 了を選択":No=0:goto Entry_check_key:
15060 'デバッグライン　ここから
15070 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
15080 'デバッグライン　ここまで
15090 case 0:
15100 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.登録文字数の確認を選択":goto Entry_check_key:
15110 'デバッグライン　ここから
15120 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
15130 'デバッグライン　ここまで
15140 end select
15150 endif
15160 'バーチャルパッド　上 ここから
15170 if y = -1 then
15180 select case No
15190 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15200 'case 1:
15210 'sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 1,15:print "                                       ":locate 0,15:print" 4.終了を選択"::goto Entry_check_key:
15220 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15230 case 1:
15240 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print"3.トップ画面に戻るを選択":goto Entry_check_key:
15250 'No:3 3.Help→2.設定 No:2
15260 case 0:
15270 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
15280 case 2:
15290 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print "1.登録文字検索":goto Entry_check_key:
15300 end select
15310 endif
15320 if bg=1 then
15330 select case No
15340 '1.数霊チェックを選択  パッドの右キー
15350 case 1:
15360 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15370 '2.設定を選択    パッドの右キー
15380 case 2:
15390 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15400 '3.ヘルプを選択 パッドの右
15410 case 0:
15420 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
15430 'プログラムの終了を選択
15440 'case 0:
15450 'cls 3:cls 4::play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":ui_msg "プログラムを終了します":color rgb(255,255,255):pause 2.052 * 1000:end
15460 'if lang_flag = 1 then
15470 'else
15480 'endif
15490 end select
15500 endif
15510 '4.終了するを選択  パッドの右
15520 'バーチャルパッド　ここまで'
15530 'key$ = input$(1)
15540 'カーソルの下
15550 if key$ = chr$(31) then
15560 select case (No Mod 4)
15570 case 0:
15580 c=1:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
15590 case 1:
15600 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,500),0,0:sp_on 3,0:goto Entry_check_key:
15610 case 2:
15620 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:goto Entry_check_key:
15630 case 3:
15640 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
15650 end select
15660 endif
15670 'カーソル　上
15680 if key$ = chr$(30) then
15690 select case (No Mod 4)
15700 case 0:
15710 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
15720 case 1:
15730 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
15740 case 2:
15750 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
15760 case 3:
15770 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
15780 end select
15790 endif
15800 'エンターキーを押す
15810 if key$ = chr$(13) then
15820 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15830 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15840 if No = 0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15850 'if No = 0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
15860 endif
15870 '
15880 Kakunin_Surei_count:
15890 cls 3:font 48:No=1
15900 gload Gazo$ + "Kazutama_List_Top.png"
15910 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
15920 color rgb(255,0,0)
15930 print chr$(13)+chr$(13)+chr$(13)
15940 color rgb(255,255,255)
15950 'if lang_flag = 1 then
15960 'else
15970 'print chr$(13)+chr$(13)
15980 print "番号を選んでください" + chr$(13)
15990 print " :1.数霊リスト 1人用" + chr$(13)
16000 print " :2.結果表示設定" + chr$(13)
16010 print " :3.トップ画面に行く" + chr$(13)
16020 'print " :4.終 了" + chr$(13)
16030 print "" + chr$(13)
16040 'endif
16050 color rgb(0,0,0)
16060 locate 0,15:print"                                                         "
16070 if No = 1 then locate 1,15:print "1.数霊リスト　1人用を選択"
16080 Entry_List:
16090 y = 0:key$ = "":bg=0
16100 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
16110 y = stick(1)
16120 key$ = inkey$
16130 bg = strig(1)
16140 pause 2
16150 wend
16160 'バーチャルパッド　ここから'
16170 'バーチャルパッド　ここから'
16180 'バーチャルパッド　下
16190 if y = 1 then
16200 select case No
16210 'No の初期値：No=1
16220 case 1:
16230 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.結果表示設定を選択":goto Entry_List:
16240 'デバッグライン　ここから
16250 '0のとき
16260 'デバッグライン　ここまで
16270 'デバッグライン　ここから
16280 'case 3:
16290 'sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:No=0:pause 200:locate 0,15:print "                                       "
16300 'color rgb(0,0,0):locate 0,15:print " 4.終了を選択":goto Entry_List:
16310 'cls:color rgb(255,255,255):print"ok"
16320 'デバッグライン　ここまで
16330 case 0:
16340 sp_on 3,0:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 1.数霊リスト 1人用を選択":No=1:goto Entry_List:
16350 case 2:
16360 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                      ":No=0:locate 1,15:print "3．トップ画面に行くを選択":goto Entry_List:
16370 'sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print "                                      "
16380 'case 1:
16390 'デバッグライン　ここから
16400 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
16410 'デバッグライン　ここまで
16420 'case 0:
16430 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_List:
16440 'デバッグライン　ここから
16450 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
16460 'デバッグライン　ここまで
16470 end select
16480 endif
16490 'バーチャルパッド　上 ここから
16500 if y = -1 then
16510 select case No
16520 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
16530 case 2:
16540 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 2.結果表示設定を選択":goto Entry_List:
16550 'case 1:
16560 'sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 0,15:print " 4.終了を選択":goto Entry_List:
16570 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
16580 case 0:
16590 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 1,15:print"3.トップ画面に行くを選択":goto Entry_List:
16600 'No:3 3.Help→2.設定 No:2
16610 case 1:
16620 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print "1.数霊リスト 1人用を選択":goto Entry_List:
16630 'case 2:
16640 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_List:
16650 end select
16660 endif
16670 if bg = 1 then
16680 select case No
16690 '1.数霊リスト 一人用を選択を選択  パッドの右キー
16700 case 1:
16710 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16720 '2.設定を選択  パッドの右キー
16730 case 2:
16740 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16750 case 0:
16760  sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16770 '4.終了を選択 パッドの右
16780 'case 0:
16790 'cls 3:cls 4:color rgb(255,255,255):
16800 'play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:
16810 'Else
16820 'ui_msg "プログラムを終了します":end
16830 'endif
16840 'プログラムの終了を選択
16850 end select
16860 endif
16870 if key$=chr$(13) then
16880 select case No
16890 'case 0:
16900  '     sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":end
16910 case 0:
16920       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16930 case 1:
16940       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16950 case 2:
16960       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16970 end select
16980 endif
16990 '4.終了するを選択  パッドの右
17000 'バーチャルパッド　ここまで'
17010 'Input "番号:",No
17020 'if No=2 then goto TopScreen:
17030 'if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
17040 'if No=1 then goto Surei_List1:
17050 'if No > 3 or No=0 then ui_msg"無効な数字です、入れ直してください":talk"無効な数字です":goto Kakunin_Surei_count:
17060 'if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
17070 Surei_List1:
17080 cls 3:font 48
17090 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
17100 file$ = dir$(SAVE_DATA1$,0)
17110 'ファイルが無いときの画面
17120 if file$ = ""  then
17130 gload "./data/Gazo/" + "KazutamaList1.png",0
17140 print chr$(13)
17150 color rgb(255,255,255):print "登録ファイルはございません" + chr$(13)
17160 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
17170 'else
17180 'endif
17190 bg = 0:key$ = ""
17200 while (key$ <> chr$(13) and bg<>1)
17210 key$ = inkey$
17220 bg = strig(1)
17230 pause 2
17240 wend
17250 'エンターキーもしくはバーチャルパッドの右でトップに行く
17260 if (bg = 1  or key$ = chr$(13)) then goto TopScreen:
17270 else
17280 cls 3:buffer_list_count = Loadcount()
17290 color rgb(255,255,255)
17300 if lang_flag = 1 then
17310 Else
17320 talk "登録件数は" + str$(buffer_list_count) + "件です"
17330 gload Gazo$ + "KazutamaList1_Entry.png",0
17340 color rgb(0,0,255)
17350 print chr$(13)
17360 color rgb(255,255,255)
17370 print "登録件数:";buffer_list_count;"件";chr$(13)
17380 color rgb(0,0,0)
17390 print "パッドの右を押してください" + chr$(13)
17400 endif
17410 bg = 0:key$ = "":bg2 = 0
17420 while (key$ <> chr$(13) and bg <> 1)
17430 key$ = inkey$
17440 bg = strig(1)
17450 bg2=strig(0)
17460 pause 2
17470 wend
17480 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
17490 if (key$ = chr$(13) or bg = 1) then pause 2:goto KotodamaList_page:
17500 endif
17510 if (bg2 = 1) then pause 2:goto TopScreen:
17520 func Loadcount()
17530 n = 0
17540 'while eof(1)=-1
17550 open SAVE_DATA1$  for input as #1
17560 while eof(1) <> -1
17570 line input #1,line$
17580 n = n + 1
17590 wend
17600 close #1
17610 count = n
17620 endfunc count
17630 count_line = Loadcount()
17640 func Kotodama$(buf$)
17650 color rgb(255,255,255)
17660 b = len("数霊:")
17670 a$ = Mid$(buf$,b+1,len(buf$))
17680 for i=0 to 118
17690 color rgb(255,255,255)
17700 if bufline3$(2 * i) ="数霊:" + a$  then
17710 moji_$ = bufline3$(2*i + 1)
17720 'moji_$ = bufline3$(21)
17730 'moji$ = a$
17740 endif
17750 next i
17760 'kotodama$ = a$
17770 kotodama$ = moji_$
17780 endfunc kotodama$
17790 KotodamaList_page:
17800 cls 3:font 48:m = 0:
17810 gload Gazo$ + "Screen5_Surei_List.png"
17820 if SAVE_DATA1$ = "" then
17830 cls 3:color rgb(255,255,255):print"ファイルがありません"
17840 else
17850 a = Loadcount()
17860 open SAVE_DATA1$  for input as #1
17870 for i=0 to a-1
17880 for n=0 to 1
17890 input #1,line$
17900 bufKaztama$(i,n) = line$
17910 next n
17920 next i
17930 close #1
17940 'endif
17950 l = 0:n=0
17960 gload Gazo$ + "Screen5_Surei_List.png"
17970 while (buffer_list_count >= l)
17980 'while (l<=a)
17990 cls
18000 color rgb(255,0,0)
18010 'print "数霊　リスト" + chr$(13)
18020 print chr$(13)
18030 color rgb(255,255,255)
18040 n=n+1
18050 'while (n <= a)
18060 print chr$(13)
18070 print "番号:";l+1;chr$(13)
18080 print bufKaztama$(l,0) + chr$(13)
18090 print bufKaztama$(l,1) + chr$(13)
18100 'n=n+1
18110 Kmoji$ = moji$
18120 print chr$(13) + chr$(13) + chr$(13)
18130 color rgb(0,0,0)
18140 print " :パッドの左:トップ画面" + chr$(13)
18150 print " :パッドの右:次へ行く" + chr$(13)
18160 'wend
18170 key$ = "":bg = 0:bg2 = 0
18180 while (key$ <> chr$(13) and bg <> 1 and bg2 <> 1)
18190 key$ = inkey$
18200 bg = strig(1)
18210 bg2 = strig(0)
18220 pause 2
18230 wend
18240 'key$ = input$(1)
18250 if (key$ = " " OR bg = 1) then
18260 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
18270 else
18280 if ((bg2 = 1) or (key$=chr$(13))) then
18290    goto TopScreen:
18300 endif
18310 else
18320 goto KotodamaList_page:
18330 endif
18340 wend
18350 'wend
18360 endif
18370 '結果表示２ Menu1
18380 Surei_Result4:
18390 cls 3:font 32+16:init"kb:4"
18400 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
18410 for i=0 to 181 + 3 - 1
18420 if i = count  then
18430 buffer$ = bufline2$(count + 4,0)
18440 endif
18450 next i
18460 if len(buffer$) > 21 and len(buffer$) <= 45 then
18470 buffer2$ = Mid$(buffer$,1,22)
18480 buffer3$ = Mid$(buffer$,23,(len(buffer$) - 22))
18490 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13)
18500 else
18510 if len(buffer$) <= 21 then
18520 buffer2$ = Mid$(buffer$,1,21)
18530 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
18540 else
18550 if len(buffer$) > 45 and len(buffer$) <= 62 then
18560 buffer2$ = Mid$(buffer$,1,22)
18570 buffer3$ = Mid$(buffer$,23,22)
18580 buffer4$ = Mid$(buffer$,44,(len(buffer$)-44))
18590 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13)
18600 else
18610 if len(buffer$) > 64 and len(buffer$) <= 81 then
18620 buffer2$ = Mid$(buffer$,1,22)
18630 buffer3$ = Mid$(buffer$,23,20)
18640 buffer4$ = Mid$(buffer$,44,20)
18650 buffer5$ = Mid$(buffer$,65,(len(buffer$)-65))
18660 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13)
18670 if len(buffer$) > 81 and len(buffer$) <= 110 then
18680 buffer2$ = Mid$(buffer$,1,22)
18690 buffer3$ = Mid$(buffer$,23,20)
18700 buffer4$ = Mid$(buffer$,43,20)
18710 buffer5$ = Mid$(buffer$,63,20)
18720 buffer6$ = Mid$(buffer$,83,(len(buffer$) - 83))
18730 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13)
18740 endif
18750 endif
18760 endif
18770 endif
18780 endif
18790 Surei_Result4_2:
18800 gload Gazo$ + "Screen1_Result2.png"
18810 Result_Menu_List$(0)="1.トップ画面に行く"
18820 Result_Menu_List$(1)="2.数霊のデーターを保存"
18830 Result_Menu_List$(2)="3.もう一度、数霊を調べる"
18840 cls
18850 'color rgb(255,0,0)
18860 'print "診断結果 2" + chr$(13)
18870 print chr$(13)
18880 if lang_flag = 1 then
18890 else
18900 color rgb(127,255,212)
18910 print chr$(13);chr$(13)
18920 print "入力文字:";buffer_moji$;chr$(13)
18930 print "数霊:";count;chr$(13)
18940 color rgb(255,255,255)
18950 print "数霊の説明:"+chr$(13)
18960 print buffer$
18970 color rgb(0,0,0)
18980 locate 0,15
18990 print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
19000 endif
19010 key$ = "":bg = 0:bg2 = 0
19020 while (bg<>1 and bg2<>1)
19030 key$ = inkey$
19040 bg = strig(1)
19050 bg2 = strig(0)
19060 pause 2
19070 wend
19080 if ((bg = 1) or (bg2 = 1)) then
19090 num = ui_select("Result_Menu_List$","番号を選んでください")
19100 endif
19110 if num = 0 then goto TopScreen:
19120 if num = 1 then goto File_save:
19130 if num = 2 then goto Surei_Input:
19140 if num = -1 then goto Surei_Result4
19150 ' if bg=1 then buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
19160 'if key$ = chr$(13) then
19170 'buffer$ = "":buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
19180 'endif
19190 'if bg2=1 then
19200 File_save:
19210 'ファイルがない時
19220 if dir$(SAVE_DATA1$) = " " then
19230 open SAVE_DATA1$ for output as #1
19240 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19250 close #1
19260 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19270 'ファイルが有る時
19280 else
19290 open SAVE_DATA1$ for append as #1
19300 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19310 close #1
19320 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19330 endif
19340 'endif
19350 'if key$="s" or key$="S" then
19360 'if dir$(SAVE_DATA1$) = "" then
19370 'open SAVE_DATA1$ for output as #1
19380 'print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19390 'close #1
19400 'ui_msg"保存しました":talk"保存しました":goto Surei_Result4_2:
19410 'else
19420 'open SAVE_DATA1$ for append as #1
19430 'print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19440 'close #1
19450 'ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19460 'endif
19470 'else
19480 'talk "無効な文字です":goto Surei_Result4_2:
19490 'endif
19500 'endif
19510 func All_clear()
19520 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
19530 endfunc
19540 'ここから
19550 Config_moji1:
19560 cls 3:Font 48
19570 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19580 play ""
19590 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
19600 No=1
19610 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19620 color rgb(0,0,255)
19630 'print "●設定項目" + chr$(13)
19640 print chr$(13)
19650 if lang_flag = 1 then
19660 'lang_flag = 1:英語
19670 else
19680 'lang_flag = 0:日本語
19690 color rgb(255,255,255)
19700 print "番号を選んでください" + chr$(13)
19710 'print " :1.文字の項目" + chr$(13)
19720 'print " :2.結果表示設定" + chr$(13)
19730 print " :1.文字の項目" + chr$(13)
19740 print " :2.結果表示設定" + chr$(13)
19750 print " :3.トップ画面に行く" + chr$(13)
19760 print " :4.終 了" + chr$(13)
19770 endif
19780 color rgb(0,0,0)
19790 locate 1,12
19800 if No = 1 then print "1.文字の項目"
19810 'y:バーチャルパッドの処理
19820 'key$:カーソルの処理
19830 'bg:バーチャルパッドの右ボタン
19840 Config_moji1_Screen:
19850 y = 0:key$ = "":bg=0
19860 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
19870 y = stick(1)
19880 key$ = inkey$
19890 bg=strig(1)
19900 pause 2
19910 wend
19920 'バーチャルパッド　ここから'
19930 'バーチャルパッド　ここから'
19940 if y = 1 then
19950 select case No
19960 'No の初期値：No=1
19970 case 1:
19980 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
19990 'デバッグライン　ここから
20000 '0のとき
20010 'デバッグライン　ここまで
20020 'デバッグライン　ここから
20030 case 2:
20040 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
20050 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
20060 'if lang_flag = 1 then
20070 'else
20080 locate 1,12:print "3.トップ画面に行くを選択"
20090 'endif
20100 'cls:color rgb(255,255,255):print"ok"
20110 'デバッグライン　ここまで
20120 case 3:
20130 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
20140 'デバッグライン　ここから
20150 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
20160 'デバッグライン　ここまで
20170 case 0:
20180 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20190 'デバッグライン　ここから
20200 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
20210 'デバッグライン　ここまで
20220 end select
20230 endif
20240 'バーチャルパッド　上 ここから
20250 if y = -1 then
20260 select case No
20270 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
20280 case 1:
20290 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
20300 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
20310 case 0:
20320 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
20330 'No:3 3.Help→2.設定 No:2
20340 case 3:
20350 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20360 case 2:
20370 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
20380 end select
20390 endif
20400 if bg=1 then
20410 select case No
20420 '1.数霊チェックを選択  パッドの右キー
20430 case 1:
20440 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
20450 '2.設定を選択    パッドの右キー
20460 case 2:
20470 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
20480 '3.ヘルプを選択 パッドの右
20490 case 3:
20500 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
20510 'プログラムの終了を選択
20520 case 0:
20530 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
20540 'if lang_flag = 1 then
20550 'Else
20560 ui_msg "プログラムを終了します":end
20570 'endif
20580 end select
20590 endif
20600 '4.終了するを選択  パッドの右
20610 'バーチャルパッド　ここまで'
20620 'SettingScreen:
20630 'key$ = input$(1)
20640 'カーソル下'
20650 if key$ = chr$(31) then
20660 select case (No Mod 4)
20670 '登録文字から数霊文字の確認
20680 case 1:
20690 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
20700 '数霊文字の確認からトップ画面に行く
20710 case 2:
20720 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
20730 'トップ画面に行くから終了
20740 case 3:
20750 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
20760 '終了から登録文字
20770 case 0:
20780 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20790 end select
20800 endif
20810 'カーソル　上
20820 if key$ = chr$(30) then
20830 select case (No Mod 4)
20840 case 1:
20850 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
20860 case 2:
20870 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
20880 case 3:
20890 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
20900 case 0:
20910 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
20920 end select
20930 endif
20940 'エンターキーを押したとき
20950 if key$ = chr$(13) then
20960 if No=3 then goto TopScreen:
20970 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
20980 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
20990 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
21000 'lse
21010 'o'o SettingScreen:
21020 endif
21030 'ここまで
21040 Config_moji2:
21050 cls 3:Font 48
21060 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
21070 play ""
21080 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
21090 No=1
21100 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
21110 color rgb(0,0,255)
21120 'print "●設定項目" + chr$(13)
21130 print chr$(13)
21140 if lang_flag = 1 then
21150 'lang_flag = 1:英語
21160 else
21170 'lang_flag = 0:日本語
21180 color rgb(255,255,255)
21190 print "番号を選んでください" + chr$(13)
21200 'print " :1.文字の項目" + chr$(13)
21210 'print " :2.結果表示設定" + chr$(13)
21220 print " :1.文字の項目" + chr$(13)
21230 print " :2.結果表示設定" + chr$(13)
21240 print " :3.トップ画面に行く" + chr$(13)
21250 print " :4.終 了" + chr$(13)
21260 endif
21270 color rgb(0,0,0)
21280 locate 1,12
21290 if No = 1 then print "1.文字の項目"
21300 'y:バーチャルパッドの処理
21310 'key$:カーソルの処理
21320 'bg:バーチャルパッドの右ボタン
21330 config_moji2:
21340 y = 0:key$ = "":bg=0
21350 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
21360 y = stick(1)
21370 key$ = inkey$
21380 bg = strig(1)
21390 pause 2
21400 wend
21410 'バーチャルパッド　ここから'
21420 'バーチャルパッド　ここから'
21430 if y = 1 then
21440 select case No
21450 'No の初期値：No=1
21460 case 1:
21470 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
21480 'デバッグライン　ここから
21490 '0のとき
21500 'デバッグライン　ここまで
21510 'デバッグライン　ここから
21520 case 2:
21530 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
21540 color rgb(0,0,0)::No=2:goto SettingScreen:
21550 if lang_flag = 1 then
21560 else
21570 locate 0,12:print " 3.トップ画面に行くを選択"
21580 endif
21590 'cls:color rgb(255,255,255):print"ok"
21600 'デバッグライン　ここまで
21610 case 3:
21620 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
21630 'デバッグライン　ここから
21640 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
21650 'デバッグライン　ここまで
21660 case 0:
21670 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21680 'デバッグライン　ここから
21690 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
21700 'デバッグライン　ここまで
21710 end select
21720 endif
21730 'バーチャルパッド　上 ここから
21740 if y = -1 then
21750 select case No
21760 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
21770 case 1:
21780 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
21790 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
21800 case 0:
21810 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
21820 'No:3 3.Help→2.設定 No:2
21830 case 3:
21840 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
21850 case 2:
21860 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
21870 end select
21880 endif
21890 '決定ボタン
21900 if bg=1 then
21910 select case No
21920 '1.数霊チェックを選択  パッドの右キー
21930 case 1:
21940 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
21950 '2.設定を選択    パッドの右キー
21960 case 2:
21970 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
21980 '3.ヘルプを選択 パッドの右
21990 case 3:
22000 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
22010 'プログラムの終了を選択
22020 case 0:
22030 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
22040 'if lang_flag = 1 then
22050 'Else
22060 ui_msg "プログラムを終了します":end
22070 'endif
22080 end select
22090 endif
22100 '4.終了するを選択  パッドの右
22110 'バーチャルパッド　ここまで'
22120 'SettingScreen:
22130 'key$ = input$(1)
22140 'カーソル下'
22150 if key$ = chr$(31) then
22160 select case (No Mod 4)
22170 '登録文字から数霊文字の確認
22180 case 1:
22190 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22200 '数霊文字の確認からトップ画面に行く
22210 case 2:
22220 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
22230 'トップ画面に行くから終了
22240 case 3:
22250 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
22260 '終了から登録文字
22270 case 0:
22280 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
22290 end select
22300 endif
22310 'カーソル　上
22320 if key$ = chr$(30) then
22330 select case (No Mod 4)
22340 case 1:
22350 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
22360 case 2:
22370 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
22380 case 3:
22390 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
22400 case 0:
22410 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
22420 end select
22430 endif
22440 'エンターキーを押したとき
22450 if key$ = chr$(13) then
22460 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
22470 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
22480 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
22490 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
22500 'lse
22510 'o'o SettingScreen:
22520 endif
22530 '結果表示設定
22540 Result_Setting:
22550 color rgb(255,255,255)
22560 'dim list$(4)
22570 'ファイル読み込み
22580 '1.ファイルが有るか無いかのチェック
22590 if Dir$(System$) = "" then
22600 '1-1.ファイルがないとき
22610 '上のSystemフォルダを作成
22620 mkdir "./System/"
22630 list$(0) = "●:出た数字から181を引く"
22640 list$(1) = " :出た数字から180を引き単数変換"
22650 open System$ for output as #1
22660 print #1,"config_r=0"
22670 close #1
22680 ui_msg "ファイルを作成しました"
22690 'ファイル作成
22700 else
22710 '1-2.ファイルが有るとき
22720 'config_r:0 出た数字から181を引く
22730 'config_r:1 出た数字から180を引いて単数変換
22740 'open "./System/config.sys" for input as #1
22750 'ファイルが有るときファイルを読み込み
22760 open System$ for input as #1
22770 line input #1,buf_line$
22780 'buf$にデーターをコピーする
22790 buf$ = buf_line$
22800 close #1
22810 if len(buf$) = 10 then
22820  if left$(buf$,9) = "config_r=" then
22830  buf$ = right$(buf_line$,1)
22840  if buf$ = "1" then
22850    '1.System$ ファイルを削除(config.sys)
22860    '2.1行目をconfig_r=1と書き、保存する
22870    buf_config_r = 1
22880    'list$(0) = "●:1.出た数字から180を引いて単数変換"
22890    'list$(1) = " :2.出た数字から181を引く"
22900    else
22910  if buf$ = "0" then
22920    buf_config_r = 0
22930   ' list$(0) = "●:1.出た数字から181を引く"
22940   'list$(1) = " :2.出た数字から180を引いて単数変換"
22950  endif
22960  endif
22970  endif
22980 endif
22990 endif
23000 '"●:1.出た数字から180を引く"をlist$(0)に代入
23010 if buf_config_r =  0 then
23020 list$(0) = "●:1.出た数字から181を引く"
23030 list$(1) = " :2.出た数字から180を引いて単数変換"
23040 else
23050 list$(0) = "●:1.出た数字から180を引いて単数変換"
23060 list$(1) = " :2.出た数字から181を引く"
23070 endif
23080 list$(2) = " :トップ画面に戻る"
23090 list$(3) = " :終 了"
23100 list_num = ui_select("list$","番号を選んでください")
23110 play ""
23120 Select case (list_num)
23130 case 0:
23140        if buf$ = "1" then
23150        buf_config_r = 0:
23160        'データーを変更したのでファイルを削除
23170        kill System$
23180        'ファイルを新しく作成
23190        open System$ for output as #1
23200        print #1,"config_r=0"
23210        close #1
23220        ui_msg "設定を変更しました。"
23230        else
23240        'if buf$ = "0" then
23250        'buf_config_r = 1
23260        'kill System$
23270        'open Syetem$ for output as #1
23280        'print #1,"config_r=1"
23290        'close #1
23300        'ui_msg "設定を変更しました"
23310        'endif
23320        endif
23330        goto config_moji2:
23340 case 1:
23350        if buf$ = "0" then
23360        buf_config_r = 1:
23370        'データーを変更したので、ファイルを削除
23380        kill System$
23390        'ファイルを新しく作成
23400        open System$ for output as #1
23410        print #1,"config_r=1"
23420        close #1
23430        ui_msg "設定を変更しました"
23440        else
23450        kill System$
23460        if buf$ = "1" then
23470        open System$ for output as #1
23480        print #1,"config_r=0"
23490        close #1
23500        ui_msg "設定を変更しました"
23510        endif
23520        endif
23530        goto config_moji2:
23540 case 2:
23550       'トップ画面に飛ぶ
23560        goto TopScreen:
23570 case 3:
23580       'プログラムを終了する
23590       cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
23600 end select
23610 '単数変換
23620 Func Single_Complate(num)
23630 '1.出てきた数字から180を引く
23640 a = num - 180
23650 'a:10〜99
23660 Re1:
23670 if (a > 9 and a < 100) then
23680  b1 = fix(a / 10)
23690  b2 = 10 * a - b1
23700  d1 = b1 + b2
23710 if c > 9 then
23720  goto Re1:
23730 else
23740  c = d1:goto Re2:
23750 endif
23760 endif
23770 Re2:
23780 buffer = c
23790 endfunc buffer
23800 Func Surei_Result_Save_File()
23810 'ファイルがないとき
23820 if dir$(SAVE_DATA1$) = "" then
23830 open SAVE_DATA1$ for output as #1
23840 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
23850 close #1
23860 ui_msg "保存しました":talk "保存しました":goto Surei_Result:
23870 else
23880 open SAVE_DATA1$ for append as #1
23890 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
23900 close #1
23910 ui_msg "保存しました":talk "保存しました":goto Surei_Result
23920 endif
23930 endfunc
23940 '言語設定
23950 Setting_Language:
23960 cls 3:gload Gazo$ + "Screen1.png":screen 1,1,1:No=2
23970 init "Kb:4"
23980 sp_on 1,1:sp_on 0,0
23990 sp_put 0,(0,300),0,0
24000 sp_put 1,(0,400),1,0
24010 color rgb(0,0,255)
24020 'print "番号を選んでください"+chr$(13)
24030 'if lang_flag=0 then
24040 'print "言語設定:日本語"+chr$(13)
24050 'else
24060 'print "言語設定:英 語"+chr$(13)
24070 Change_Language:
24080 if lang_flag = 1 then
24090 cls
24100 print "It has changed Language"+chr$(13)
24110 color rgb(255,255,255)
24120 print "Select the Number"+chr$(13)
24130 print " :1.English → Japanse"+chr$(13)
24140 print " :2.It goes to TopScreen"+chr$(13)
24150 print "Language:In English" +chr$(13)
24160 else
24170 cls:color rgb(255,255,255)
24180 print "設定変更(言語の変更)" + chr$(13)
24190 color rgb(255,255,255)
24200 print chr$(13)
24210 print "番号を選んでください"+chr$(13)
24220 print " :1.日本語 → 英語に変更" + chr$(13)
24230 print " :2.トップ画面に戻る" + chr$(13)
24240 print chr$(13)
24250 print "設定言語:日本語" + chr$(13)
24260 endif
24270 color rgb(0,0,0)
24280 locate 0,15:print "                                       ":locate 0,15:print "2.トップ画面に戻る　を選択" + chr$(13)
24290 Setting_Language_key:
24300 y=0:key$="":bg=0
24310 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y<> -1 and bg<> 1)
24320 y=stick(1)
24330 key$=inkey$
24340 bg=strig(1)
24350 pause 2
24360 wend
24370 '選択肢変更
24380 if ((y=1) or (y=-1)) then
24390 select case No
24400 case 2:
24410      '実装部分　ここから
24420      pause 200:No=1:sp_on 0,1:sp_on 1,0:locate 0,15:print "                                                         ":locate 0,15:print "1.日本語 → 英語に変更を選択": goto Setting_Language_key:
24430      '実装部分　ここまで
24440 case 1:
24450       pause 200: No=2:sp_on 0,0:sp_on 1,1:locate 0,15:print "                                                       ":locate 0,15:print "2.トップ画面に戻る を選択":goto Setting_Language_key:
24460 end select
24470 endif
24480 'Enter Key  決定ボタン
24490 if ((key$=chr$(13)) or (bg=1)) then
24500 select case No
24510 case 2:
24520         sp_on 0,0:sp_on 1,0:goto TopScreen:
24530 case 1:                                                     'lang_flag=1:sp_on 0,0:sp_on 1,0:goto Change_Language:
24540       '
24550 '未実装　ここから
24560  sp_on 0,1:sp_on 1,0:ui_msg "この機能は未実装です":goto Setting_Language_key:
24570 '未実装　ここまで
24580 end select
24590 endif
