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
500 '現在のバージョン
510 Version$ = "1.3.2_2023.02.12(正式版)"
520 'csvファイル 1.数霊 ベースファイル
530 FILE_csv$ = "data/Kazutama.csv"
540 'csvファイル 2.数霊 ベースファイル 2
550 FILE_csv2$ = "data/Surei_chart_20211207.csv"
560 'Save ファイル
570 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
580 'gazo ファイル
590 Gazo$ = "data/Gazo/"
600 'System フォルダ:設定ファイルを保存するところ
610 System$ = "System/config.sys"
620 '設定ファイル名:config.sys
630 'Sound File(Voice)
640 '1.ボイス TopScreen
650 Voice_File_TopScreen$ = "data/Sound_data/"
660 '変数領域
670 'vcount:バーチャルパッド下の変数
680 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
690 count2 = 0:N=0:N2=0:m2 = 0
700 dim list$(4),moji_List$(2)
710 'ファイルの有無チェック
720 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
730 '1.ファイルが無いとき
740 cls :print "依存ファイルが見つかりません":
750 print "エンターキーを押してください" + chr$(13)
760 key$ = input$(1)
770 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
780 else
790 '2.ファイルが有るとき
800 cls:print "csv:file ok." + chr$(13)
810 n=0
820 open FILE_csv$ for input as #1
830 while eof(1) = 0
840 input #1,line$
850 'print line$
860 bufline$(n) = line$
870 'Print n;chr$(13)
880 n = n + 1
890 wend
900 close #1
910 N=n
920 '2つ目のファイル読み込み
930 'n = 0
940 open FILE_csv2$ for input as #2
950 for n=3 to 181
960 for i=0 to 1
970 input #2,line$
980 bufline2$(n,i) = line$
990 next i
1000 next n
1010 close #2
1020 N2 = n
1030 '
1040 endif
1050 '設定ファイルの読み込み
1060 'open System$ for input as #1
1070 'line input #1,buf_line$
1080  'if len(buf_line$) = 10 then
1090   'if left$(buf_line$,9)="config_r=" then
1100   ' buf$ = right$(buf_line$,1)
1110    'if buf$ = "1" then
1120    '   buf_config_r = 1
1130   ' else
1140   '    buf_config_r = 0
1150   ' endif
1160  ' endif
1170 'endif
1180 'close #1
1190 'or j = 3 to 181+3
1200 'ufline3$(j - 3,n) = bufline2$(i,n)
1210 'next j
1220 'moji$ = Kotodama$(bufline3$(16))
1230 'erase bufline2$
1240 '2022.11.23----------------------
1250 '端末言語のチェック
1260 '日本語端末かチェックをして日本語以外なら英語で表示する
1270 'lang flag:0:日本語 1:英語(日本語以外)
1280 '--------------------------------
1290 lang_flag = 0
1300 if ex_info$(1) <> "JP" then
1310 lang_flag = 1
1320 endif
1330 'Top画面
1340 TopScreen:
1350 'バーチャルパッドを表示
1360 cls 3:font 48:screen 1,1,1:init"kb:4":init"crt:0"
1370 'play ""
1380 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
1390 'gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
1400 gload Gazo$ + "TopScreen_20230129.png",0,0,0
1410 '選択肢 1
1420 gload Gazo$ + "Selection.png",1,5,300
1430 '選択肢 2
1440 gload Gazo$ + "Selection.png",1,5,400
1450 '選択肢 3
1460 gload Gazo$ + "Selection.png",1,5,500
1470 '選択肢 4
1480 gload Gazo$ + "Selection.png",1,5,600
1490 color rgb(0,0,255)
1500 print chr$(13)
1510 if lang_flag = 1 then
1520 color rgb(255,255,255)
1530 print "Select Number" + chr$(13)
1540 print " :1.Kazutama check" + chr$(13)
1550 print " :2.Setting" + chr$(13)
1560 print " :3.Help" + chr$(13)
1570 print " :4.End Program" + chr$(13)
1580 color rgb(255,255,255)
1590 else
1600 color rgb(255,255,255)
1610 print chr$(13)
1620 print "番号を選んでください" + chr$(13)
1630 print " :1.数霊(かずたま)チェック" + chr$(13)
1640 print " :2.設定" + chr$(13)
1650 print " :3.ヘルプ" + chr$(13)
1660 print " :4.終　了" + chr$(13)
1670 color rgb(0,0,0)
1680 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
1690 'バーチャルパッドを表示
1700 No=1:
1710 'lang_flag:1 外国語,0:日本語
1720 if lang_flag = 1 then
1730 'lang_flag=1 英語
1740 locate 0,15:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
1750 else
1760 'lang_flag=0 日本語
1770 locate 0,15:color rgb(0,0,0):print "1.数霊(かずたま)チェックを選択";chr$(13)
1780 endif
1790 endif
1800 'スプライト
1810 '選択肢 1 On
1820 sp_def 0,(5,300),32,32
1830 sp_on 0,1
1840 sp_put 0,(5,300),0,0
1850 '選択肢 2 Off
1860 sp_def 1,(5,400),32,32
1870 sp_on 1,0
1880 sp_put 1,(5,400),0,0
1890 '選択肢 3 Off
1900 sp_def 2,(5,500),32,32
1910 sp_on 2,0
1920 sp_put 2,(5,500),0,0
1930 '選択肢 4 Off
1940 sp_def 3,(5,600),32,32
1950 sp_on 3,0
1960 sp_put 3,(5,600),0,0
1970 color rgb(0,0,0)
1980 Main_Select:
1990 'y:バーチャルパッドの処理
2000 'key$:カーソルの処理
2010 y = 0:key$ = "":bg = 0
2020 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
2030 y = stick(1)
2040 key$ = inkey$
2050 bg = strig(1)
2060 pause 2
2070 wend
2080 'if y=1 then
2090 'select case (No Mod 4)
2100 'ase 0:
2110 '     c=1:No=c:sp_on 0,1:sp_on 1,0 :sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print " 数霊(かずたま)チェックを選択":beep:goto Main_Select:
2120 'case 1:
2130 '       =2:No=c:sp_on 0,0:
2140 '"ase 2:
2150 'ase 3:
2160 'nd select
2170 'ndif
2180 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
2190 '1.バーチャルパッドの処理
2200 'バーチャルパッド下を押した時
2210 if y = 1 then
2220 select case No
2230 'No の初期値：No=1
2240 case 1:
2250 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
2260 if lang_flag = 1 then
2270 'lang_flag=1 英語
2280 locate 0,15:print "2.It has selected Setting":goto Main_Select:
2290 else
2300 'lang_flag=0 日本語
2310 locate 0,15:print "2.設定を選択":goto Main_Select:
2320 endif
2330 'デバッグライン　ここから
2340 '0のとき
2350 'デバッグライン　ここまで
2360 'デバッグライン　ここから
2370 'バーチャルパッド　下
2380 case 2:
2390 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:
2400 print "                                         ":
2410 if lang_flag = 1 then
2420 color rgb(0,0,0):locate 0,15:
2430 print "3.It has selected Help":No=3:goto Main_Select:
2440 else
2450 color rgb(0,0,0):locate 0,15:
2460 print "3.ヘルプを選択":No=3:goto Main_Select:
2470 endif
2480 'cls:color rgb(255,255,255):print"ok"
2490 'デバッグライン　ここまで
2500 case 3:
2510 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print"                                               "
2520 if lang_flag = 1 then
2530 locate 0,15:print "4.It has selected finish program":No=0:goto Main_Select:
2540 else
2550 locate 0,15:print "4.終了を選択":No=0:goto Main_Select:
2560 endif
2570 'デバッグライン　ここから
2580 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
2590 'デバッグライン　ここまで
2600 case 0:
2610 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1
2620 if lang_flag = 1 then
2630 'lang_flag=1:英語
2640 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
2650 else
2660 'lang_flag=0:日本語
2670 locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
2680 'endif
2690 endif
2700 'デバッグライン　ここから
2710 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
2720 'デバッグライン　ここまで
2730 end select
2740 endif
2750 'バーチャルパッド　上 ここから
2760 if y = -1 then
2770 select case No
2780 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
2790 case 1:
2800 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       "
2810 if lang_flag = 1 then
2820 'lang_flag=1 英語
2830 locate 0,15:print "4.It has finished program":goto Main_Select:
2840 else
2850 'lang_flag=0 日本語
2860 locate 0,15:print "4.終了を選択":goto Main_Select:
2870 endif
2880 'endif
2890 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
2900 case 0:
2910 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":
2920 if lang_flag = 1 then
2930 '1:英語
2940 locate 0,15:print "3.It has selected Help":goto Main_Select:
2950 else
2960 '0:日本語
2970 locate 0,15:print "3.ヘルプを選択":goto Main_Select:
2980 endif
2990 'No:3 3.Help→2.設定 No:2
3000 case 3:
3010 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      "
3020 if lang_flag = 1 then
3030 '1:英語
3040 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3050 else
3060 '0:日本語
3070 locate 0,15:print"2.設定を選択":goto Main_Select:
3080 endif
3090 case 2:
3100 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":
3110 if lang_flag = 1 then
3120 'lang_flag 1 英語
3130 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3140 else
3150 'lang_flag 0 日本語
3160 locate 0,15:print"1.数霊(かずたま)チェックを選択":goto Main_Select:
3170 endif
3180 end select
3190 endif
3200 if bg=1 then
3210 select case No
3220 '1.数霊チェックを選択  パッドの右キー(決定)
3230 case 1:
3240 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
3250 '2.設定を選択  パッドの右キー(決定)
3260 case 2:
3270 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
3280 '3.ヘルプを選択 パッドの右(決定)
3290 case 3:
3300 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
3310 'プログラムの終了を選択(決定)
3320 case 0:
3330 cls 3:cls 4:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:
3340 'if lang_flag = 1 then
3350 'lang_flag = 1 英語
3360 'else
3370 'lang_flag = 0 日本語
3380 ui_msg "プログラムを終了します":color rgb(255,255,255):end
3390 'endif
3400 end select
3410 '4.終了するを選択  パッドの右
3420 endif
3430 'バーチャルパッド　上　ここまで
3440 '2.カーソルの処理
3450 'カーソル　下 chr$(31)
3460 if (key$ = chr$(31)) then
3470 select case (No)
3480 '4
3490 '0 選択肢4 => 選択肢1
3500 case 0:
3510 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "              ":color rgb(0,0,0):
3520 if lang_flag = 1 then
3530 'lang flag:1 英語
3540 else
3550 'lang flag:0 日本語
3560 color rgb(0,0,0):locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
3570 endif
3580 '1 選択肢1 => 選択肢2
3590 case 1:
3600 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":
3610 if lang_flag = 1 then
3620 'lang_flag:1 英語
3630 else
3640 'lang_flag:0 日本語
3650 color rgb(0,0,0):locate 0,15:print "2.設定を選択":beep:goto Main_Select:
3660 endif
3670 '2 選択肢2 => 選択肢3
3680 case 2:
3690 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,15:print "               ":
3700 if lang_flag = 1 then
3710 'lang flag:1 英語
3720 else
3730 'lang flang:0 日本語
3740 color rgb(0,0,0):locate 0,15:print "3.ヘルプを選択":beep:goto Main_Select:
3750 endif
3760 '3 選択肢３ => 選択肢4
3770 case 3:
3780 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "               ":color rgb(0,0,0)
3790 if lang_flag = 1 then
3800 'lang_flag = 1 英語
3810 else
3820 'lang_flag = 0 日本語
3830 color rgb(0,0,0):locate 0,15:print "4.終 了を選択":beep:goto Main_Select:
3840 endif
3850 case else:
3860 goto Main_Select:
3870 end select
3880 endif
3890 'カーソル　上
3900 if key$=chr$(30) then
3910 select case (No)
3920 '選択肢1 => 選択肢4
3930 case 1:
3940 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:PRINT "                      ":
3950 if lang_flag = 1 then
3960 'lang_flag=1:英語
3970 'print "1.It has selected Kazutama check":goto Main_Select:
3980 else
3990 'lang_flag = 0:日本語
4000 else
4010 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4020 endif
4030 '選択肢2 => 選択肢1
4040 case 2:
4050 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                 ":locate 1,15:print "2.設 定を選択":goto Main_Select:
4060 '選択肢3　=> 選択肢2
4070 case 3:
4080 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,500),0,0
4090 if lang_flag = 1 then
4100 'lang_flag = 1:英語
4110 locate 0,15:print "It has selected Help":goto Main_Select:
4120 else
4130 'lang_flag = 0:日本語
4140 locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4150 endif
4160 '選択肢4 => 選択肢3
4170 case 0:
4180 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                ":locate 1,15:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
4190 if lang_flag = 1 then
4200 'lang flag=1 英語
4210 else
4220 'lang flag=0 日本語
4230 locate 1,15:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
4240 endif
4250 end select
4260 endif
4270 'Input "番号:",No
4280 'エンターキー入力:決定
4290 if key$ = chr$(13) then
4300 select case No
4310 case 1:
4320 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4330 case 3:
4340 Color rgb(255,255,255):goto Help:
4350 case 0:
4360 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
4370 case 2:
4380 color rgb(255,255,255):sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
4390 'else
4400 'goto Main_Select:
4410 end select
4420 endif
4430 'ndif
4440 'if N0=0 or No>4 then goto TopScreen:
4450 '1-1.数霊チェック
4460 Surei_Check:
4470 cls 3:Font 48:
4480 'gload Gazo$ + "Screen4.png"
4490 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png"
4500 play ""
4510 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
4520 color rgb(255,0,0)
4530 'print "●数霊(かずたま)チェックトップ" + chr$(13)
4540 sp_on 0,1:sp_put 0,(5,300),0,0:screen 1,1,1
4550 if lang_flag = 1 then
4560 'lang_flag=1 英語
4570 else
4580 'lang_flag=0 日本語
4590 print chr$(13)+chr$(13)+chr$(13)
4600 color rgb(255,255,255)
4610 print "番号を選んでください" + chr$(13)
4620 'print chr$(13)
4630 print " :1.数霊(かずたま)1人用" + chr$(13)
4640 print " :2.数霊(かずたま)2人用" + chr$(13)
4650 print " :3.トップ画面に行く" + chr$(13)
4660 print " :4.終 了" + chr$(13)
4670 color rgb(0,0,0):No = 1
4680 locate 0,15
4690 print " 1.数霊(かずたま)1人用を選択"
4700 endif
4710 Kazutama_main:
4720 'y:バーチャルパッドの処理
4730 'key$:カーソルの処理
4740 'bg:バーチャルパッドの右のボタン
4750 y = 0:key$ = "":bg=0
4760 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
4770 y = stick(1)
4780 key$ = inkey$
4790 bg=strig(1)
4800 y=stick(-1)
4810 pause 2
4820 wend
4830 'key$ = input$(1)
4840 if y = 1 then
4850 select case No
4860 'No の初期値：No=1
4870 case 1:
4880 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
4890 'if lang_flag=1 then
4900 'else
4910 locate 0,15
4920 print" 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
4930 'endif
4940 'デバッグライン　ここから
4950 '0のとき
4960 'デバッグライン　ここまで
4970 'デバッグライン　ここから
4980 case 2:
4990 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                               "
5000 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に行くを選択":No=3:goto Kazutama_main:
5010 'cls:color rgb(255,255,255):print"ok"
5020 'デバッグライン　ここまで
5030 case 3:
5040 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 4.終 了を選択":No=0:goto Kazutama_main:
5050 'デバッグライン　ここから
5060 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
5070 'デバッグライン　ここまで
5080 case 0:
5090 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5100 'デバッグライン　ここから
5110 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
5120 'デバッグライン　ここまで
5130 end select
5140 endif
5150 'バーチャルパッド　上 ここから
5160 if y = -1 then
5170 select case No
5180 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
5190 case 1:
5200 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 0,15:print" 4.終了を選択":goto Kazutama_main:
5210 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
5220 case 0:
5230 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
5240 'No:3 3.Help→2.設定 No:2
5250 case 3:
5260 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 0,15:print" 2.数霊（かずたま）2人用を選択":goto Kazutama_main:
5270 case 2:
5280 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5290 end select
5300 endif
5310 if bg=1 then
5320 select case No
5330 '1.数霊チェックを選択  パッドの右キー
5340 case 1:
5350 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
5360 '2.設定を選択    パッドの右キー
5370 case 2:
5380 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
5390 '3.ヘルプを選択 パッドの右
5400 case 3:
5410 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
5420 'プログラムの終了を選択
5430 case 0:
5440 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.05*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
5450 end select
5460 '4.終了するを選択  パッドの右
5470 endif
5480 'バーチャルパッド　上　ここまで
5490 if key$ = chr$(31) then
5500 select case No
5510 case 0:
5520 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,15:print "                                                          ":
5530 if lang_flag = 1 then
5540 Else
5550 No=2:locate 0,15:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
5560 endif
5570 case 1:
5580 No=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,12:print "                                                          ":
5590 if lang_flag = 1 then
5600 Else
5610 locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
5620 endif
5630 case 2:
5640 No=3:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,12:print"                                       ":
5650 if lang_flag = 1 then
5660 Else
5670 locate 0,12:print" 4.終了を選択":goto Kazutama_main:
5680 endif
5690 case 3:
5700 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                      ":
5710 if lang_flag = 1 then
5720 Else
5730 No=1:locate 0,15:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
5740 endif
5750 end select
5760 endif
5770 if key$=chr$(13) then
5780 select case No
5790 case 1:
5800 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
5810 case 2:
5820 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
5830 case 3:
5840 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
5850 case 0:
5860 cls 4:cls 3:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
5870 end select
5880 endif
5890 'Input "番号:",No
5900 '前の画面に戻る
5910 'if No = 3 then goto TopScreen:
5920 'プログラムの終了
5930 'if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":COLOR rgb(255,255,255):end
5940 '1人用
5950 'if No = 1 then goto Surei_Input:
5960 '2人用
5970 'if No = 2 then goto Surei_twoParson:
5980 'if No > 4 or No=0 then ui_msg"もう一度入れてください":goto Surei_Check:
5990 '数霊(かずたま) 文字入力  1人用
6000 Surei_Input:
6010 if mode = 0 then
6020 cls 3:font 32:init"kb:2"
6030 gload Gazo$ + "InputKotodama_20230131.png"
6040 play""
6050 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
6060 color rgb(255,0,0)
6070 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
6080 if lang_flag=1 then
6090 '英語
6100 else
6110 print chr$(13)+chr$(13)+chr$(13)
6120 color rgb(255,255,255)
6130 print "文字を入れてください" + chr$(13)
6140 color rgb(255,255,255)
6150 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
6160 print chr$(13)
6170 color rgb(0,0,0)
6180 Input "入力文字:",buffer_moji$
6190 if buffer_moji$ = "" then
6200 ui_msg "未入力です":goto Surei_Input:
6210 'endif
6220 else
6230 goto Surei_Result:
6240 endif
6250 endif
6260 endif
6270 'else
6280 if mode = 1 then
6290 cls 3:Font 32:
6300 gload Gazo$ + "InputKotodama.png"
6310 color rgb(255,0,0)
6320 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
6330 color rgb(255,255,255)
6340 print "文字を入れてください" + chr$(13)
6350 color rgb(255,0,0)
6360 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
6370 print "大文字のみ)" + chr$(13)
6380 color rgb(0,0,0)
6390 Input "文字入力:",buffer_moji2$
6400 goto Surei_Result3:
6410 'endif
6420 endif
6430 '数霊(かずたま)文字入力　2人用
6440 Surei_twoParson:
6450 cls 3:Font 32:init"kb:2"
6460 gload Gazo$ + "InputKotodama_20211226.png"
6470 '1人目入力
6480 if lang_flag = 1 then
6490 'color rgb(255,0,0)
6500 else
6510 print ""+chr$(13)
6520 'print "●数霊(かずたま) 1人目 入力" + chr$(13)
6530 color rgb(255,0,0)
6540 print "1人目の文字を入れてください" + chr$(13)
6550 color rgb(255,0,0)
6560 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
6570 color rgb(0,0,0)
6580 print chr$(13)
6590 Input "1人目文字入力:",buf_Parson1$
6600 endif
6610 Surei_twoParson2:
6620 cls 3:Font 32:init"kb:2"
6630 '2人目入力
6640 gload Gazo$ + "InputKotodama_20211226.png"
6650 'color rgb(255,0,0)
6660 'print "●数霊(かずたま) 2人目 入力" + chr$(13)
6670 if lang_falg = 1 then
6680 else
6690 print ""+chr$(13)
6700 print "2人目の文字を入れてください" + chr$(13)
6710 color rgb(255,0,0)
6720 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
6730 color rgb(0,0,0)
6740 Input "2人目の文字入力:",buf_Parson2$
6750 goto Surei_Result2:
6760 endif
6770 '数霊　計算 パート
6780 '文字の計算関数
6790 'moji$:1文字を入れる
6800 func Complate(moji$)
6810 for n = 1 to 116
6820 if moji$ = bufline$(2*n) then
6830 buffcount = val(bufline$(2 * n + 1))
6840 endif
6850 next n
6860 endfunc buffcount
6870 '数霊　結果表示
6880 Surei_Result:
6890 cls 3:Font 32
6900 'ゼロカウント:zcount
6910 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
6920 '例 アカい:"い"の文字は無効な文字なので、はじく
6930 zcount=0
6940 'mojicount:入力文字数
6950 mojicount = len(buffer_moji$)
6960 for n=1 to mojicount
6970 for j=1 to 118
6980 if (bufcount$(n - 1) = bufline$(2 * j)) then
6990   bufcount$(n-1) = Mid$(buffer_moji$,n,1)
7000 endif
7010 next j
7020 next n
7030 'if mojicount > zcount then
7040 'cls 3:ui_msg "無効な文字です":talk "無効な文字があります。":zcount = 0:goto Surei_Input:
7050 ncount=0:count=0
7060    for i = 1 to mojicount
7070     bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7080   'ンのカウント
7090    if (bufcount$(i-1) = "ン") then ncount = ncount + 1
7100     'bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7110    next i
7120    if (ncount > 0) then
7130    'Listを表示する
7140    moji_List$(0) = "この単語は目に見える物です"
7150    moji_List$(1) = "この単語は目に見えない物です"
7160    num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
7170    if (num2 = 0) then
7180      ' n1 = n1 + 0
7190    else
7200    if (num2 = 1) then
7210       n1 = 9 * ncount
7220       'buf_count = 9 * ncount
7230    endif
7240    endif
7250    endif
7260 'else
7270    for j=1 to mojicount
7280    bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7290    count = count + Complate(bufcount$(j - 1))
7300   ' count = count + n1:count2 = count
7310 'endif
7320    'count = count + buf_count:
7330    next j
7340    count = count + n1
7350 if (ncount > 0) then count = count
7360 '182以上のとき,181を引く
7370 if buf_cofig_r = 0 then
7380      if (count > 181) then
7390 'if buf_config_r = 0 then
7400         count = count - 181
7410 'else
7420 'if buf_config_r = 1 then
7430 '   count=Single_Complate(count2)
7440 'endif
7450      else
7460      if (buf_config_r = 1) then
7470        'count2 = count - 180
7480        buf_count = Single_Complate(count)
7490      endif
7500 endif
7510 endif
7520 'if config_r = 0 then
7530 cls 3:Font 48+16
7540 gload Gazo$ + "Result_Screen3_20211226.png"
7550 if buf_config_r = 1 then
7560    print "入力文字:" + buffer_moji$ + chr$(13)
7570    print "数霊(かずたま):";buf_count;chr$(13)
7580 endif
7590 if lang_flag = 1 then
7600 else
7610 color rgb(255,0,0)
7620 print "入力文字:" + buffer_moji$ + chr$(13)
7630 endif
7640 'print chr$(13)
7650 if lang_flag = 1 then
7660 else
7670 color rgb(0,0,255)
7680 print "数霊(かずたま):";count;chr$(13)
7690 endif
7700 if lang_flag = 1 then
7710 else
7720 color rgb(0,0,0)
7730 print "エンター or スペース" + chr$(13)
7740 print  chr$(13)
7750 'endif
7760 endif
7770 key$ = input$(1)
7780 if ((key$ = chr$(13)) or (key$=" ")) then
7790 List$(0)="1.もう一度数霊を見る"
7800 List$(1)="2.トップ画面に行く"
7810 List$(2)="3.この数霊の説明を見る"
7820 List$(3)="4.数霊データーを保存"
7830 num=ui_select("List$","番号を選んでください")
7840 select case num
7850   case 0:
7860          goto Surei_Input:
7870   case 1:
7880        n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
7890          for i=0 to 9
7900             bufcount$(i)=""
7910          next i
7920          goto TopScreen:
7930   case 2:
7940        goto Surei_Result4:
7950   case 3:
7960         s=Surei_Result_Save_File()
7970         ui_msg "保存しました"
7980   case -1:
7990        'goto Surei_Result:
8000   case else:
8010        goto Surei_Result:
8020 end select
8030 'endif
8040 'if key$ = " " then
8050 '２回めの入力に行く
8060 'mode = 1:goto Surei_Input:
8070 'else
8080 'if key$ = "s" or key$ = "S" then
8090 'ファイルを保存する
8100 's = Save()
8110 'ui_msg"保存しました"
8120 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
8130 else
8140 goto Surei_Result:
8150 'endif
8160 endif
8170 '3-1 バージョン情報
8180 Version:
8190 cls 3:Font 32
8200 gload Gazo$ + "Screen1_Version.png"
8210 play ""
8220 play Voice_File_TopScreen$ + "Voice_Version.mp3"
8230 color rgb(255,0,0)
8240 'print"●バージョン情報"+chr$(13)
8250 print chr$(13)
8260 color rgb(255,255,255)
8270 if lang_flag = 1 then
8280 else
8290 print chr$(13)+chr$(13)+chr$(13)
8300 print "Ver:";Version$ + chr$(13)
8310 print "アプリ名:数霊"+ chr$(13)
8320 print "Basic for Android Runtime" + chr$(13)
8330 print "Author:licksjp" + chr$(13)
8340 print "制作開始:2021.7.28" + chr$(13)
8350 print chr$(13)
8360 print "(C)Copy right licksjp " + chr$(13)
8370 print "All rights reserved" + chr$(13)
8380 print chr$(13)
8390 color rgb(0,0,0)
8400 print "パッドの右を押してください" + chr$(13)
8410 endif
8420 'key$ = input$(1)
8430 bg=0:key$=""
8440 while (bg <> 1 and key$ <> chr$(13))
8450 bg = strig(1)
8460 key$ = inkey$
8470 pause 2
8480 wend
8490 if key$ = chr$(13) then
8500 goto TopScreen:
8510 'else
8520 'talk "無効なキーです":goto Version:
8530 else
8540 if bg=1 then
8550 goto TopScreen:
8560 else
8570 if lang_flag = 1 then
8580 else
8590 talk "無効なキーです":goto Version:
8600 endif
8610 endif
8620 endif
8630 '3-2 参考文献
8640 Reference_Book:
8650 cls 3:Font 48:play""
8660 gload Gazo$ + "Screen1_Reference.png"
8670 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
8680 color rgb(255,0,0)
8690 'print"●参考文献" + chr$(13)
8700 print chr$(13)+chr$(13)
8710 if lang_flag = 1 then
8720 else
8730 color rgb(255,255,255)
8740 print "書名:数霊" + chr$(13)
8750 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
8760 print "出版社:徳間書店" + chr$(13)
8770 print "ISBN:978-4-19-" + chr$(13)
8780 print "         865309-5" + chr$(13)
8790 print "定価:2300円 + 税" + chr$(13)
8800 'print chr$(13)
8810 color rgb(0,0,0)
8820 print "パッドの右を押してください"
8830 endif
8840 bg = 0:key$ = ""
8850 while (bg <> 1 and key$ <> chr$(13))
8860 bg = strig(1)
8870 key$ = inkey$
8880 pause 2
8890 wend
8900 if key$ = chr$(13) then
8910 goto TopScreen:
8920 'else
8930 'talk "無効なキーです":goto Reference_Book:
8940 else
8950 if bg = 1 then
8960 goto TopScreen:
8970 else
8980 talk "無効なキーです":goto Reference_Book:
8990 endif
9000 endif
9010 'key$=input$(1)
9020 'if key$=chr$(13) then
9030 'goto TopScreen:
9040 'else
9050 'talk"無効なキーです":goto Reference_Book:
9060 'endif
9070 'ヘルプ画面　トップ画面
9080 Help:
9090 No=1:c=0
9100 play ""
9110 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
9120 cls 3:Font 48:
9130 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9140 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0
9150 color rgb(255,0,0)
9160 'print "●3.ヘルプ　トップ画面" + chr$(13)
9170 print chr$(13)+chr$(13)+chr$(13)
9180 color rgb(255,255,255)
9190 print "番号を選んでください" + chr$(13)
9200 print " :1.バージョン" + chr$(13)
9210 print " :2.参考文献" + chr$(13)
9220 print " :3.トップ画面に行く" + chr$(13)
9230 print " :4.終 了" + chr$(13)
9240 color rgb(0,0,0)
9250 'print " :3.トップ画面に行く" + chr$(13)+chr$(13)
9260 locate 0,15
9270 if No = 1 then print " 1.バージョンを選択"
9280 'y:バーチャルパッドの処理
9290 'key$:カーソルの処理
9300 'bg:バーチャルパッドの右ボタン
9310 Help_key:
9320 y = 0:key$ = "":bg=0
9330 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
9340 y = stick(1)
9350 key$ = inkey$
9360 bg=strig(1)
9370 pause 2
9380 wend
9390 'バーチャルパッド　ここから'
9400 if y = 1 then
9410 select case No
9420 'No の初期値：No=1
9430 case 1:
9440 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 0,15:print"2.参考文献を選択":goto Help_key:
9450 if lang_flag = 1 then
9460 else
9470 locate 0,15:print"2.参考文献を選択":goto Help_key:
9480 endif
9490 'デバッグライン　ここから
9500 '0のとき
9510 'デバッグライン　ここまで
9520 'デバッグライン　ここから
9530 case 2:
9540 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                  "
9550 color rgb(0,0,0):locate 0,15:print "3.トップ画面に行くを選択":No=3:goto Help_key:
9560 'cls:color rgb(255,255,255):print"ok"
9570 'デバッグライン　ここまで
9580 case 3:
9590 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print "                                       ":locate 0,15:print "4.終 了を選択":No=0:goto Help_key:
9600 'デバッグライン　ここから
9610 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
9620 'デバッグライン　ここまで
9630 case 0:
9640 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print "1.バージョンを選択":goto Help_key:
9650 'デバッグライン　ここから
9660 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
9670 'デバッグライン　ここまで
9680 end select
9690 endif
9700 'バーチャルパッド　上 ここから
9710 if y = -1 then
9720 select case No
9730 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
9740 case 1:
9750 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 0,15:print"4.終了を選択"::goto Help_key:
9760 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
9770 case 0:
9780 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 0,15:print"3.トップ画面に行くを選択":goto Help_key
9790 'No:3 3.Help→2.設定 No:2
9800 case 3:
9810 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 0,15:print"2.参考文献を選択":goto Help_key:
9820 case 2:
9830 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print"1.バージョンを選択":goto Help_key:
9840 end select
9850 endif
9860 if bg = 1 then
9870 select case No
9880 '1.数霊チェックを選択  パッドの右キー
9890 case 1:
9900 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
9910 '2.設定を選択    パッドの右キー
9920 case 2:
9930 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
9940 '3.ヘルプを選択 パッドの右
9950 case 3:
9960 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
9970 'プログラムの終了を選択
9980 case 0:
9990 cls 3:cls 4:color rgb(255,255,255):play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
10000 'if lang_flag = 1 then
10010 'lang_flag = 1:英語
10020 'Else
10030 'lang_flag = 0:日本語
10040 'endif
10050 end select
10060 '4.終了するを選択  パッドの右
10070 endif
10080 'バーチャルパッド　上　ここまで
10090 'バーチャルパッド　ここまで'
10100 'key$ = input$(1)
10110 'カーソルの下
10120 if key$ = chr$(31) then
10130 select case (No Mod 4)
10140 'バージョンから参考文献
10150 case 0:
10160 c=1:No=c:locate 0,12:Print "             ":locate 0,12:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
10170 '参考文献からトップ画面
10180 case 1:
10190 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,12:print "            ":locate 0,12:print " 3.トップ画面に行くを選択":goto Help_key:
10200 'トップ画面から終了
10210 case 2:
10220 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,12:print "                ":locate 0,12:print " 4.終 了を選択":goto Help_key:
10230 '終了からバージョン
10240 case 3:
10250 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                     ":locate 0,12:print " 1.バージョンを選択":goto Help_key:
10260 case else:
10270 goto Help_key:
10280 end select
10290 endif
10300 'カーソル　上
10310 if key$ = chr$(30) then
10320 select case (c Mod 4)
10330 'バージョンから終了
10340 case 0:
10350 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:locate 0,12:print "                   ":locate 0,12:print " 4.終 了を選択":goto Help_key:
10360 '参考文献からバージョン
10370 case 1:
10380 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                   ":locate 0,12:print " 1.バージョンを選択":goto Help_key:
10390 'トップ画面から参考文献
10400 case 2:
10410 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,12:print "                    ":locate 0,12:print " 2.参考文献を選択":goto Help_key:
10420 '終了からトップ画面を選択
10430 case 3:
10440 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,12:print"                      ":locate 0,12:print "3.トップ画面に行くを選択":goto Help_key:
10450 case else:
10460 goto Help_key:
10470 end select
10480 endif
10490 'Input "番号:",No
10500 'sp_def 0,(5,200),32,32
10510 'エンターキー：決定
10520 if key$=chr$(13) then
10530 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10540 if No=3 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10550 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10560 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg "プログラムを終了します":cls 3:cls 4:end
10570 else
10580 goto Help_key:
10590 endif
10600 'if (No = 0 or No > 4) then ui_msg "もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
10610 '登録文字の確認
10620 '文字を1文字入れて登録されているか調べるメニュー
10630 '設定項目
10640 Setting:
10650 cls 3:Font 48
10660 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
10670 play ""
10680 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
10690 No=1
10700 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:
10710 color rgb(0,0,255)
10720 'print "●設定項目" + chr$(13)
10730 print chr$(13)
10740 if lang_flag = 1 then
10750 'lang_flag = 1:英語
10760 else
10770 'lang_flag = 0:日本語
10780 color rgb(255,255,255)
10790 print chr$(13)
10800 print "番号を選んでください" + chr$(13)
10810 '-------コメント----------------
10820 'print " :1.登録文字の確認" + chr$(13)
10830 'print " :2.数霊文字確認" + chr$(13)
10840 '-------コメント----------------
10850 'print chr$(13)
10860 print " :1.文字の項目" + chr$(13)
10870 print " :2.結果表示設定" + chr$(13)
10880 print " :3.言語設定" + chr$(13)
10890 print " :4.トップ画面に行く" + chr$(13)
10900 endif
10910 color rgb(0,0,0)
10920 locate 0,15
10930 if No=1 then print " 1.文字の項目を選択"
10940 'y:バーチャルパッドの処理
10950 'key$:カーソルの処理
10960 'bg:バーチャルパッドの右ボタン
10970 SettingScreen:
10980 y = 0:key$ = "":bg=0
10990 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
11000 y = stick(1)
11010 key$ = inkey$
11020 bg=strig(1)
11030 pause 2
11040 wend
11050 'バーチャルパッド　ここから'
11060 'バーチャルパッド　ここから'
11070 if y = 1 then
11080 select case No
11090 'No の初期値：No=1
11100 case 1:
11110 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":color rgb(0,0,0):locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11120 'デバッグライン　ここから
11130 '0のとき
11140 'デバッグライン　ここまで
11150 'デバッグライン　ここから
11160 case 2:
11170 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                         "
11180 color rgb(0,0,0)::No=3
11190 if lang_flag = 1 then
11200 else
11210 locate 1,15:print "3.言語設定を選択":goto SettingScreen:
11220 endif
11230 'cls:color rgb(255,255,255):print"ok"
11240 'デバッグライン　ここまで
11250 case 3:
11260 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 1,15:print"                                              ":locate 1,15:print "4.トップ画面に行くを選択":No=0:goto SettingScreen:
11270 'デバッグライン　ここから
11280 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11290 'デバッグライン　ここまで
11300 case 0:
11310 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 1,15:print"                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
11320 'デバッグライン　ここから
11330 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11340 'デバッグライン　ここまで
11350 end select
11360 endif
11370 'バーチャルパッド　上 ここから
11380 if y = -1 then
11390 select case No
11400 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11410 case 1:
11420 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 1,15:print"4.トップ画面に行くを選択":goto SettingScreen:
11430 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11440 case 0:
11450 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
11460 'No:3 3.Help→2.設定 No:2
11470 case 3:
11480 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.結果表示設定を選択":goto SettingScreen:
11490 case 2:
11500 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 1,15:print"1.文字の項目を選択":goto SettingScreen:
11510 end select
11520 endif
11530 if bg=1 then
11540 select case No
11550 '1.数霊チェックを選択  パッドの右キー
11560 case 1:
11570 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
11580 '2.設定を選択    パッドの右キー
11590 case 2:
11600 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
11610 '3.ヘルプを選択 パッドの右
11620 case 0:
11630 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
11640 'プログラムの終了を選択
11650 case 3:
11660 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Setting_Language:
11670 'if lang_flag = 1 then
11680 'Else
11690 'ui_msg "プログラムを終了します"
11700 'endif
11710 end select
11720 endif
11730 '4.終了するを選択  パッドの右
11740 'バーチャルパッド　ここまで'
11750 'SettingScreen:
11760 'key$ = input$(1)
11770 'カーソル下'
11780 if key$ = chr$(31) then
11790 select case (No Mod 4)
11800 '登録文字から数霊文字の確認
11810 case 1:
11820 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                     ":locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11830 '数霊文字の確認からトップ画面に行く
11840 case 2:
11850 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "                                     ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
11860 'トップ画面に行くから終了
11870 case 3:
11880 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                                       ":locate 1,15:print "4.トップ画面に行くを選択":goto SettingScreen:
11890 '終了から登録文字
11900 case 0:
11910 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
11920 end select
11930 endif
11940 'カーソル　上
11950 if key$ = chr$(30) then
11960 select case (No Mod 4)
11970 case 1:
11980 c=2:No=c:sp_on 0,1:sp_put 0,(5,300),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
11990 case 2:
12000 c=3:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
12010 case 3:
12020 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:goto SettingScreen:
12030 case 0:
12040 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,600),0,0:sp_on 0,0:goto SettingScreen:
12050 end select
12060 endif
12070 'エンターキーを押したとき
12080 if key$ = chr$(13) then
12090 if No=3 then goto Setting_Language:
12100 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
12110 'if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji1:
12120 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
12130 if No=0 then goto TopScreen:
12140 'lse
12150 'o'o SettingScreen:
12160 endif
12170 'endif
12180 'endif
12190 '文字検索項目  ここから
12200 Moji_Search:
12210 cls 4:cls 3:Font 32+16:init"kb:2"
12220 gload Gazo$ + "Moji_Search_Result.png"
12230 play ""
12240 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
12250 print "" + chr$(13)
12260 color rgb(255,255,255)
12270 if lang_flag = 1 then
12280 Else
12290 print "文字を一文字入れてください" + chr$(13)
12300 endif
12310 color rgb(0,0,0)
12320 if lang_flag=1 then
12330 Else
12340 Input "登録文字:",moji$
12350 endif
12360 moji_count = len(moji$)
12370 if moji_count > 1 then
12380 'if lang_flag = 1 then
12390 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Moji_Search:
12400 'Else
12410 'endif
12420 else
12430 count=0
12440 for n = 0 to 116
12450 if bufline$(2*n) = moji$ then
12460 cls 3:font 48:init"kb:4"
12470 gload Gazo$ + "Moji_Search_Result.png"
12480 'talk"この文字は登録されています"
12490 play ""
12500 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12510 if lang_flag = 1 then
12520 Else
12530 print chr$(13)
12540 color rgb(255,255,255)
12550 print moji$;"は、登録されています。" + chr$(13)
12560 color rgb(0,0,0)
12570 print "ジョイパッドの右を押してください"
12580 endif
12590 bg = 0:key$ = ""
12600 while (bg <> 1 and key$ <> chr$(13))
12610 key$ = inkey$
12620 bg = strig(1)
12630 pause 2
12640 wend
12650 'y$=input$(1)
12660 if key$ = chr$(13) then goto TopScreen:
12670 if bg=1 then goto TopScreen:
12680 count = count + 1
12690 endif
12700 next n
12710 if count = 0 then
12720 cls 3:font 48:init "kb:4"
12730 gload Gazo$ + "Moji_check.png"
12740 play ""
12750 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
12760 print chr$(13)
12770 if lang_flag = 1 then
12780 Else
12790 color rgb(255,255,255)
12800 print moji$;"は、登録されていません。" + chr$(13)
12810 color rgb(0,0,0)
12820 print "パッドの右を押してください" + chr$(13)
12830 endif
12840 kg = 0:key$ = ""
12850 while (kg <> 1 and key$ <> chr$(13))
12860 key$ = inkey$
12870 kg = strig(1)
12880 pause 2
12890 wend
12900 if ((key$ = chr$(13)) or (kg=1)) then goto TopScreen:
12910 endif
12920 endif
12930 Surei_Result2:
12940 cls 3:Font 48
12950 zcount1=0:zcount2=0:count1=0:count2=0
12960 '1人目
12970 mojicount1=len(buf_Parson1$)
12980 '2人目
12990 mojicount2 = len(buf_Parson2$)
13000 '1人目
13010 for n = 1 to mojicount1
13020 for j = 1 to 116
13030 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
13040 if bufcount1$(n-1) = bufline$(2*j) then
13050 zcount1 = zcount1 + 1
13060 endif
13070 next j
13080 next n
13090 '2人目
13100 for n = 1 to mojicount2
13110 for j = 1 to 116
13120 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
13130 if bufcount2$(n-1) = bufline$(2*j) then
13140 zount2 = zcount2 + 1
13150 endif
13160 next j
13170 next n
13180 '1人目
13190 for i=1 to mojicount1
13200 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
13210 p1 = Complate(bufcount1$(i-1))
13220 count1 = count1 + p1
13230 next i
13240 '2人目
13250 for i = 1 to mojicount2
13260 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
13270 p2 = Complate(bufcount2$(i-1))
13280 count2 = count2 + p2
13290 next i
13300 cls 3:
13310 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
13320 color rgb(255,0,0)
13330 'print "数霊 2人用 結果表示"+chr$(13)
13340 print ""+chr$(13)
13350 if lang_flag = 1 then
13360 else
13370 color rgb(255,255,255)
13380 print "1人目:";buf_Parson1$;chr$(13)
13390 print "数霊1:";count1;chr$(13)
13400 print "2人目:";buf_Parson2$;chr$(13)
13410 print "数霊2:";count2;chr$(13)
13420 print "数霊(合計):";count1 + count2;chr$(13)
13430 color rgb(0,0,0)
13440 print "エンターキーを押してください" + chr$(13)
13450 endif
13460 key$ = "":bg = 0
13470 'ey$=input$(1)
13480 while (bg <> 1 and key$ <> chr$(13))
13490 bg = strig(1)
13500 key$ = inkey$
13510 pause 2
13520 wend
13530 if (bg = 1 or key$ = chr$(13))  then goto TopScreen:
13540 Surei_Result3:
13550 cls 3:Font 48
13560 zcount2 = 0:count2 = 0
13570 mojicount2 = len(buffer_moji2$)
13580 for n = 1 to mojicount2
13590 for j = 1 to 116
13600 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
13610 if bufcount2$(n - 1) = bufline$(2 * j) then
13620 zcount2 = zcount2 + 1
13630 endif
13640 next j
13650 next n
13660 for i = 1 to mojicount2
13670 n2 = Complate(bufcount2$(i-1))
13680 count2 = count2 + n2
13690 next i
13700 gload Gazo$ + "Screen5.png"
13710 if lang_flag = 1 then
13720 else
13730 color rgb(255,0,0)
13740 print "数霊の結果表示" + chr$(13)
13750 color rgb(255,255,255)
13760 print "１回目回の文字入力:";buffer_moji$;chr$(13)
13770 print "１回目の数霊(かずたま)";count;chr$(13)
13780 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
13790 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
13800 color rgb(0,0,0)
13810 print "エンターキー:トップ画面";chr$(13)
13820 print "c or C キー:数霊の比較";chr$(13)
13830 endif
13840 key$ = "":bg = 0
13850 while (key$ <> chr$(13) and bg <> 1)
13860 bg = strig(1)
13870 key$ = inkey$
13880 pause 2
13890 wend
13900 'key$ = input$(1)
13910 if bg = 1 then goto TopScreen:
13920 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
13930 if key$ = "c" or key$ = "C" then
13940 if count = count2 then
13950 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
13960 else
13970 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
13980 endif
13990 endif
14000 Moji_Count_Check:
14010 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
14020 cls 3:Font 48
14030 gload Gazo$ + "Moji_check.png"
14040 n = 0
14050 open FILE_csv$ for input as #1
14060 while eof(1) = 0
14070 line input #1, line$
14080 n = n + 1
14090 wend
14100 close #1
14110 'n = n - 1
14120 'talk "登録文字数は"+str$(n)+"文字です"
14130 play ""
14140 if n = 118 then
14150 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
14160 if lang_flag = 1 then
14170 else
14180 'talk "登録文字数は、" + str$(n) + "文字です"
14190 print "" + chr$(13)
14200 color rgb(255,255,255)
14210 print "文字の登録文字数は";n;"文字" + chr$(13)
14220 color rgb(0,0,0)
14230 print "パッドの右を押してください" + chr$(13)
14240 endif
14250 endif
14260 'key$ = input$(1)
14270 key$ = "":bg = 0
14280 while (key$ <> chr$(13) and bg <> 1)
14290 key$=inkey$
14300 bg=strig(1)
14310 pause 2
14320 wend
14330 if bg = 1 then goto TopScreen:
14340 if key$ = chr$(13) then
14350 goto TopScreen:
14360 else
14370 goto Moji_Count_Check:
14380 endif
14390 'Save 関数
14400 file_kazutama = 0
14410 file_kazutama = Save_File()
14420 func Save_File()
14430 open SAVE_DATA1$  for output as #1
14440 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
14450 close #1
14460 endfunc
14470 Select_moji:
14480 cls 3:font 48:No = 1
14490 gload Gazo$ + "Screen1_mojicheck.png"
14500 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
14510 color rgb(255,0,0)
14520 'print "文字の確認" + chr$(13)
14530 if lang_flag = 1 then
14540 else
14550 print chr$(13)+chr$(13)+chr$(13)
14560 color rgb(255,255,255)
14570 print "番号を選んでください" + chr$(13)
14580 print " :1.登録文字検索"+ chr$(13)
14590 print " :2.登録文字数の確認" + chr$(13)
14600 print " :3.トップ画面に戻る" + chr$(13)
14610 print " :4.終　了" + chr$(13)
14620 color rgb(0,0,0)
14630 locate 0,15
14640 if No = 1 then print " 1.登録文字検索を選択"
14650 endif
14660 Entry_check_key:
14670 y = 0:key$ = "":bg=0
14680 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
14690 y = stick(1)
14700 key$ = inkey$
14710 bg=strig(1)
14720 pause 2
14730 wend
14740 'バーチャルパッド　ここから'
14750 'バーチャルパッド　ここから'
14760 if y = 1 then
14770 select case No
14780 'No の初期値：No=1
14790 case 1:
14800 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
14810 'デバッグライン　ここから
14820 '0のとき
14830 'デバッグライン　ここまで
14840 'デバッグライン　ここから
14850 case 2:
14860 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                       "
14870 :No=3
14880 'if lang_flag = 1 then
14890 'Else
14900 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に戻るを選択":goto Entry_check_key:
14910 'endif
14920 'cls:color rgb(255,255,255):print"ok"
14930 'デバッグライン　ここまで
14940 case 3:
14950 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 4.終 了を選択":No=0:goto Entry_check_key:
14960 'デバッグライン　ここから
14970 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
14980 'デバッグライン　ここまで
14990 case 0:
15000 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.登録文字数の確認を選択":goto Entry_check_key:
15010 'デバッグライン　ここから
15020 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
15030 'デバッグライン　ここまで
15040 end select
15050 endif
15060 'バーチャルパッド　上 ここから
15070 if y = -1 then
15080 select case No
15090 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15100 case 1:
15110 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 1,15:print "                                       ":locate 0,15:print" 4.終了を選択"::goto Entry_check_key:
15120 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15130 case 0:
15140 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                      ":locate 1,15:print"3.トップ画面に戻るを選択":goto Entry_check_key:
15150 'No:3 3.Help→2.設定 No:2
15160 case 3:
15170 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
15180 case 2:
15190 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                       ":locate 1,15:print"1.登録文字検索を選択":goto Entry_check_key:
15200 end select
15210 endif
15220 if bg=1 then
15230 select case No
15240 '1.数霊チェックを選択  パッドの右キー
15250 case 1:
15260 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15270 '2.設定を選択    パッドの右キー
15280 case 2:
15290 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15300 '3.ヘルプを選択 パッドの右
15310 case 3:
15320 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
15330 'プログラムの終了を選択
15340 case 0:
15350 cls 3:cls 4::play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":ui_msg "プログラムを終了します":color rgb(255,255,255):pause 2.052 * 1000:end
15360 'if lang_flag = 1 then
15370 'else
15380 'endif
15390 end select
15400 endif
15410 '4.終了するを選択  パッドの右
15420 'バーチャルパッド　ここまで'
15430 'key$ = input$(1)
15440 'カーソルの下
15450 if key$ = chr$(31) then
15460 select case (No Mod 4)
15470 case 0:
15480 c=1:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
15490 case 1:
15500 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,500),0,0:sp_on 3,0:goto Entry_check_key:
15510 case 2:
15520 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:goto Entry_check_key:
15530 case 3:
15540 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
15550 end select
15560 endif
15570 'カーソル　上
15580 if key$ = chr$(30) then
15590 select case (No Mod 4)
15600 case 0:
15610 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
15620 case 1:
15630 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
15640 case 2:
15650 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
15660 case 3:
15670 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
15680 end select
15690 endif
15700 'エンターキーを押す
15710 if key$ = chr$(13) then
15720 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15730 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15740 if No = 3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15750 if No = 0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
15760 endif
15770 '
15780 Kakunin_Surei_count:
15790 cls 3:font 48:No=1
15800 gload Gazo$ + "Kazutama_List_Top.png"
15810 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
15820 color rgb(255,0,0)
15830 print chr$(13)+chr$(13)+chr$(13)
15840 color rgb(255,255,255)
15850 'if lang_flag = 1 then
15860 'else
15870 'print chr$(13)+chr$(13)
15880 print "番号を選んでください" + chr$(13)
15890 print " :1.数霊リスト 1人用" + chr$(13)
15900 print " :2.結果表示設定" + chr$(13)
15910 print " :3.トップ画面に行く" + chr$(13)
15920 print " :4.終 了" + chr$(13)
15930 print "" + chr$(13)
15940 'endif
15950 color rgb(0,0,0)
15960 locate 0,15:print"                                                         "
15970 if No = 1 then locate 1,15:print "1.数霊リスト　1人用を選択"
15980 Entry_List:
15990 y = 0:key$ = "":bg=0
16000 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
16010 y = stick(1)
16020 key$ = inkey$
16030 bg = strig(1)
16040 pause 2
16050 wend
16060 'バーチャルパッド　ここから'
16070 'バーチャルパッド　ここから'
16080 'バーチャルパッド　下
16090 if y = 1 then
16100 select case No
16110 'No の初期値：No=1
16120 case 1:
16130 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.結果表示設定を選択":goto Entry_List:
16140 'デバッグライン　ここから
16150 '0のとき
16160 'デバッグライン　ここまで
16170 'デバッグライン　ここから
16180 case 3:
16190 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:No=0:pause 200:locate 0,15:print "                                       "
16200 color rgb(0,0,0):locate 0,15:print " 4.終了を選択":goto Entry_List:
16210 'cls:color rgb(255,255,255):print"ok"
16220 'デバッグライン　ここまで
16230 case 0:
16240 sp_on 3,0:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 1.数霊リスト 1人用を選択":No=1:goto Entry_List:
16250 case 2:
16260 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                      ":No=3:locate 1,15:print "3．トップ画面に行くを選択":goto Entry_List:
16270 'sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print "                                      "
16280 'case 1:
16290 'デバッグライン　ここから
16300 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
16310 'デバッグライン　ここまで
16320 'case 0:
16330 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_List:
16340 'デバッグライン　ここから
16350 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
16360 'デバッグライン　ここまで
16370 end select
16380 endif
16390 'バーチャルパッド　上 ここから
16400 if y = -1 then
16410 select case No
16420 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
16430 case 3:
16440 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 0,15:print " 2.結果表示設定を選択":goto Entry_List:
16450 case 1:
16460 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 0,15:print " 4.終了を選択":goto Entry_List:
16470 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
16480 case 0:
16490 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print "                                      ":locate 1,15:print"3.トップ画面に行くを選択":goto Entry_List:
16500 'No:3 3.Help→2.設定 No:2
16510 case 2:
16520 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 1,15:print "1.数霊リスト 1人用を選択":goto Entry_List:
16530 'case 2:
16540 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_List:
16550 end select
16560 endif
16570 if bg = 1 then
16580 select case No
16590 '1.数霊リスト 一人用を選択を選択  パッドの右キー
16600 case 1:
16610 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16620 '2.設定を選択  パッドの右キー
16630 case 2:
16640 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16650 case 3:
16660  sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16670 '4.終了を選択 パッドの右
16680 case 0:
16690 cls 3:cls 4:color rgb(255,255,255):
16700 play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:
16710 'Else
16720 ui_msg "プログラムを終了します":end
16730 'endif
16740 'プログラムの終了を選択
16750 end select
16760 endif
16770 if key$=chr$(13) then
16780 select case No
16790 case 0:
16800       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":end
16810 case 1:
16820       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16830 case 2:
16840       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16850 case 3:
16860       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16870 end select
16880 endif
16890 '4.終了するを選択  パッドの右
16900 'バーチャルパッド　ここまで'
16910 'Input "番号:",No
16920 'if No=2 then goto TopScreen:
16930 'if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
16940 'if No=1 then goto Surei_List1:
16950 'if No > 3 or No=0 then ui_msg"無効な数字です、入れ直してください":talk"無効な数字です":goto Kakunin_Surei_count:
16960 'if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
16970 Surei_List1:
16980 cls 3:font 48
16990 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
17000 file$ = dir$(SAVE_DATA1$,0)
17010 'ファイルが無いときの画面
17020 if file$ = ""  then
17030 gload "./data/Gazo/" + "KazutamaList1.png",0
17040 print chr$(13)
17050 color rgb(255,255,255):print "登録ファイルはございません" + chr$(13)
17060 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
17070 'else
17080 'endif
17090 bg = 0:key$ = ""
17100 while (key$ <> chr$(13) and bg<>1)
17110 key$ = inkey$
17120 bg = strig(1)
17130 pause 2
17140 wend
17150 'エンターキーもしくはバーチャルパッドの右でトップに行く
17160 if (bg = 1  or key$ = chr$(13)) then goto TopScreen:
17170 else
17180 cls 3:buffer_list_count = Loadcount()
17190 color rgb(255,255,255)
17200 if lang_flag = 1 then
17210 Else
17220 talk "登録件数は" + str$(buffer_list_count) + "件です"
17230 gload Gazo$ + "KazutamaList1_Entry.png",0
17240 color rgb(0,0,255)
17250 print chr$(13)
17260 color rgb(255,255,255)
17270 print "登録件数:";buffer_list_count;"件";chr$(13)
17280 color rgb(0,0,0)
17290 print "パッドの右を押してください" + chr$(13)
17300 endif
17310 bg = 0:key$ = "":bg2 = 0
17320 while (key$ <> chr$(13) and bg <> 1)
17330 key$ = inkey$
17340 bg = strig(1)
17350 bg2=strig(0)
17360 pause 2
17370 wend
17380 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
17390 if (key$ = chr$(13) or bg = 1) then pause 2:goto KotodamaList_page:
17400 endif
17410 if (bg2 = 1) then pause 2:goto TopScreen:
17420 func Loadcount()
17430 n = 0
17440 'while eof(1)=-1
17450 open SAVE_DATA1$  for input as #1
17460 while eof(1) <> -1
17470 line input #1,line$
17480 n = n + 1
17490 wend
17500 close #1
17510 count = n
17520 endfunc count
17530 count_line = Loadcount()
17540 func Kotodama$(buf$)
17550 color rgb(255,255,255)
17560 b = len("数霊:")
17570 a$ = Mid$(buf$,b+1,len(buf$))
17580 for i=0 to 118
17590 color rgb(255,255,255)
17600 if bufline3$(2 * i) ="数霊:" + a$  then
17610 moji_$ = bufline3$(2*i + 1)
17620 'moji_$ = bufline3$(21)
17630 'moji$ = a$
17640 endif
17650 next i
17660 'kotodama$ = a$
17670 kotodama$ = moji_$
17680 endfunc kotodama$
17690 KotodamaList_page:
17700 cls 3:font 48:m = 0:
17710 gload Gazo$ + "Screen5_Surei_List.png"
17720 if SAVE_DATA1$ = "" then
17730 cls 3:color rgb(255,255,255):print"ファイルがありません"
17740 else
17750 a = Loadcount()
17760 open SAVE_DATA1$  for input as #1
17770 for i=0 to a-1
17780 for n=0 to 1
17790 input #1,line$
17800 bufKaztama$(i,n) = line$
17810 next n
17820 next i
17830 close #1
17840 'endif
17850 l = 0:n=0
17860 gload Gazo$ + "Screen5_Surei_List.png"
17870 while (buffer_list_count >= l)
17880 'while (l<=a)
17890 cls
17900 color rgb(255,0,0)
17910 'print "数霊　リスト" + chr$(13)
17920 print chr$(13)
17930 color rgb(255,255,255)
17940 n=n+1
17950 'while (n <= a)
17960 print chr$(13)
17970 print "番号:";l+1;chr$(13)
17980 print bufKaztama$(l,0) + chr$(13)
17990 print bufKaztama$(l,1) + chr$(13)
18000 'n=n+1
18010 Kmoji$ = moji$
18020 print chr$(13) + chr$(13) + chr$(13)
18030 color rgb(0,0,0)
18040 print " :パッドの左:トップ画面" + chr$(13)
18050 print " :パッドの右:次へ行く" + chr$(13)
18060 'wend
18070 key$ = "":bg = 0:bg2 = 0
18080 while (key$ <> chr$(13) and bg <> 1 and bg2 <> 1)
18090 key$ = inkey$
18100 bg = strig(1)
18110 bg2 = strig(0)
18120 pause 2
18130 wend
18140 'key$ = input$(1)
18150 if (key$ = " " OR bg = 1) then
18160 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
18170 else
18180 if ((bg2 = 1) or (key$=chr$(13))) then
18190    goto TopScreen:
18200 endif
18210 else
18220 goto KotodamaList_page:
18230 endif
18240 wend
18250 'wend
18260 endif
18270 '結果表示２ Menu1
18280 Surei_Result4:
18290 cls 3:font 32+16:init"kb:4"
18300 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
18310 for i=0 to 181 + 3 - 1
18320 if i = count  then
18330 buffer$ = bufline2$(count + 4,0)
18340 endif
18350 next i
18360 if len(buffer$) > 21 and len(buffer$) <= 45 then
18370 buffer2$ = Mid$(buffer$,1,22)
18380 buffer3$ = Mid$(buffer$,23,(len(buffer$) - 22))
18390 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13)
18400 else
18410 if len(buffer$) <= 21 then
18420 buffer2$ = Mid$(buffer$,1,21)
18430 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
18440 else
18450 if len(buffer$) > 45 and len(buffer$) <= 62 then
18460 buffer2$ = Mid$(buffer$,1,22)
18470 buffer3$ = Mid$(buffer$,23,22)
18480 buffer4$ = Mid$(buffer$,44,(len(buffer$)-44))
18490 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13)
18500 else
18510 if len(buffer$) > 64 and len(buffer$) <= 81 then
18520 buffer2$ = Mid$(buffer$,1,22)
18530 buffer3$ = Mid$(buffer$,23,20)
18540 buffer4$ = Mid$(buffer$,44,20)
18550 buffer5$ = Mid$(buffer$,65,(len(buffer$)-65))
18560 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13)
18570 if len(buffer$) > 81 and len(buffer$) <= 110 then
18580 buffer2$ = Mid$(buffer$,1,22)
18590 buffer3$ = Mid$(buffer$,23,20)
18600 buffer4$ = Mid$(buffer$,43,20)
18610 buffer5$ = Mid$(buffer$,63,20)
18620 buffer6$ = Mid$(buffer$,83,(len(buffer$) - 83))
18630 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13)
18640 endif
18650 endif
18660 endif
18670 endif
18680 endif
18690 Surei_Result4_2:
18700 gload Gazo$ + "Screen1_Result2.png"
18710 Result_Menu_List$(0)="1.トップ画面に行く"
18720 Result_Menu_List$(1)="2.数霊のデーターを保存"
18730 Result_Menu_List$(2)="3.もう一度、数霊を調べる"
18740 cls
18750 'color rgb(255,0,0)
18760 'print "診断結果 2" + chr$(13)
18770 print chr$(13)
18780 if lang_flag = 1 then
18790 else
18800 color rgb(127,255,212)
18810 print chr$(13);chr$(13)
18820 print "入力文字:";buffer_moji$;chr$(13)
18830 print "数霊:";count;chr$(13)
18840 color rgb(255,255,255)
18850 print "数霊の説明:"+chr$(13)
18860 print buffer$
18870 color rgb(0,0,0)
18880 locate 0,15
18890 print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
18900 endif
18910 key$ = "":bg = 0:bg2 = 0
18920 while (bg<>1 and bg2<>1)
18930 key$ = inkey$
18940 bg = strig(1)
18950 bg2 = strig(0)
18960 pause 2
18970 wend
18980 if ((bg = 1) or (bg2 = 1)) then
18990 num = ui_select("Result_Menu_List$","番号を選んでください")
19000 endif
19010 if num = 0 then goto TopScreen:
19020 if num = 1 then goto File_save:
19030 if num = 2 then goto Surei_Input:
19040 if num = -1 then goto Surei_Result4
19050 ' if bg=1 then buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
19060 'if key$ = chr$(13) then
19070 'buffer$ = "":buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
19080 'endif
19090 'if bg2=1 then
19100 File_save:
19110 'ファイルがない時
19120 if dir$(SAVE_DATA1$) = " " then
19130 open SAVE_DATA1$ for output as #1
19140 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19150 close #1
19160 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19170 'ファイルが有る時
19180 else
19190 open SAVE_DATA1$ for append as #1
19200 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19210 close #1
19220 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19230 endif
19240 'endif
19250 'if key$="s" or key$="S" then
19260 'if dir$(SAVE_DATA1$) = "" then
19270 'open SAVE_DATA1$ for output as #1
19280 'print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19290 'close #1
19300 'ui_msg"保存しました":talk"保存しました":goto Surei_Result4_2:
19310 'else
19320 'open SAVE_DATA1$ for append as #1
19330 'print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19340 'close #1
19350 'ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19360 'endif
19370 'else
19380 'talk "無効な文字です":goto Surei_Result4_2:
19390 'endif
19400 'endif
19410 func All_clear()
19420 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
19430 endfunc
19440 'ここから
19450 Config_moji1:
19460 cls 3:Font 48
19470 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19480 play ""
19490 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
19500 No=1
19510 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19520 color rgb(0,0,255)
19530 'print "●設定項目" + chr$(13)
19540 print chr$(13)
19550 if lang_flag = 1 then
19560 'lang_flag = 1:英語
19570 else
19580 'lang_flag = 0:日本語
19590 color rgb(255,255,255)
19600 print "番号を選んでください" + chr$(13)
19610 'print " :1.文字の項目" + chr$(13)
19620 'print " :2.結果表示設定" + chr$(13)
19630 print " :1.文字の項目" + chr$(13)
19640 print " :2.結果表示設定" + chr$(13)
19650 print " :3.トップ画面に行く" + chr$(13)
19660 print " :4.終 了" + chr$(13)
19670 endif
19680 color rgb(0,0,0)
19690 locate 1,12
19700 if No = 1 then print "1.文字の項目"
19710 'y:バーチャルパッドの処理
19720 'key$:カーソルの処理
19730 'bg:バーチャルパッドの右ボタン
19740 Config_moji1_Screen:
19750 y = 0:key$ = "":bg=0
19760 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
19770 y = stick(1)
19780 key$ = inkey$
19790 bg=strig(1)
19800 pause 2
19810 wend
19820 'バーチャルパッド　ここから'
19830 'バーチャルパッド　ここから'
19840 if y = 1 then
19850 select case No
19860 'No の初期値：No=1
19870 case 1:
19880 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
19890 'デバッグライン　ここから
19900 '0のとき
19910 'デバッグライン　ここまで
19920 'デバッグライン　ここから
19930 case 2:
19940 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
19950 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
19960 'if lang_flag = 1 then
19970 'else
19980 locate 1,12:print "3.トップ画面に行くを選択"
19990 'endif
20000 'cls:color rgb(255,255,255):print"ok"
20010 'デバッグライン　ここまで
20020 case 3:
20030 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
20040 'デバッグライン　ここから
20050 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
20060 'デバッグライン　ここまで
20070 case 0:
20080 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20090 'デバッグライン　ここから
20100 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
20110 'デバッグライン　ここまで
20120 end select
20130 endif
20140 'バーチャルパッド　上 ここから
20150 if y = -1 then
20160 select case No
20170 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
20180 case 1:
20190 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
20200 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
20210 case 0:
20220 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
20230 'No:3 3.Help→2.設定 No:2
20240 case 3:
20250 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20260 case 2:
20270 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
20280 end select
20290 endif
20300 if bg=1 then
20310 select case No
20320 '1.数霊チェックを選択  パッドの右キー
20330 case 1:
20340 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
20350 '2.設定を選択    パッドの右キー
20360 case 2:
20370 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
20380 '3.ヘルプを選択 パッドの右
20390 case 3:
20400 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
20410 'プログラムの終了を選択
20420 case 0:
20430 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
20440 'if lang_flag = 1 then
20450 'Else
20460 ui_msg "プログラムを終了します":end
20470 'endif
20480 end select
20490 endif
20500 '4.終了するを選択  パッドの右
20510 'バーチャルパッド　ここまで'
20520 'SettingScreen:
20530 'key$ = input$(1)
20540 'カーソル下'
20550 if key$ = chr$(31) then
20560 select case (No Mod 4)
20570 '登録文字から数霊文字の確認
20580 case 1:
20590 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
20600 '数霊文字の確認からトップ画面に行く
20610 case 2:
20620 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
20630 'トップ画面に行くから終了
20640 case 3:
20650 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
20660 '終了から登録文字
20670 case 0:
20680 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20690 end select
20700 endif
20710 'カーソル　上
20720 if key$ = chr$(30) then
20730 select case (No Mod 4)
20740 case 1:
20750 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
20760 case 2:
20770 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
20780 case 3:
20790 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
20800 case 0:
20810 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
20820 end select
20830 endif
20840 'エンターキーを押したとき
20850 if key$ = chr$(13) then
20860 if No=3 then goto TopScreen:
20870 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
20880 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
20890 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
20900 'lse
20910 'o'o SettingScreen:
20920 endif
20930 'ここまで
20940 Config_moji2:
20950 cls 3:Font 48
20960 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
20970 play ""
20980 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
20990 No=1
21000 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
21010 color rgb(0,0,255)
21020 'print "●設定項目" + chr$(13)
21030 print chr$(13)
21040 if lang_flag = 1 then
21050 'lang_flag = 1:英語
21060 else
21070 'lang_flag = 0:日本語
21080 color rgb(255,255,255)
21090 print "番号を選んでください" + chr$(13)
21100 'print " :1.文字の項目" + chr$(13)
21110 'print " :2.結果表示設定" + chr$(13)
21120 print " :1.文字の項目" + chr$(13)
21130 print " :2.結果表示設定" + chr$(13)
21140 print " :3.トップ画面に行く" + chr$(13)
21150 print " :4.終 了" + chr$(13)
21160 endif
21170 color rgb(0,0,0)
21180 locate 1,12
21190 if No = 1 then print "1.文字の項目"
21200 'y:バーチャルパッドの処理
21210 'key$:カーソルの処理
21220 'bg:バーチャルパッドの右ボタン
21230 config_moji2:
21240 y = 0:key$ = "":bg=0
21250 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
21260 y = stick(1)
21270 key$ = inkey$
21280 bg = strig(1)
21290 pause 2
21300 wend
21310 'バーチャルパッド　ここから'
21320 'バーチャルパッド　ここから'
21330 if y = 1 then
21340 select case No
21350 'No の初期値：No=1
21360 case 1:
21370 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
21380 'デバッグライン　ここから
21390 '0のとき
21400 'デバッグライン　ここまで
21410 'デバッグライン　ここから
21420 case 2:
21430 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
21440 color rgb(0,0,0)::No=2:goto SettingScreen:
21450 if lang_flag = 1 then
21460 else
21470 locate 0,12:print " 3.トップ画面に行くを選択"
21480 endif
21490 'cls:color rgb(255,255,255):print"ok"
21500 'デバッグライン　ここまで
21510 case 3:
21520 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
21530 'デバッグライン　ここから
21540 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
21550 'デバッグライン　ここまで
21560 case 0:
21570 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21580 'デバッグライン　ここから
21590 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
21600 'デバッグライン　ここまで
21610 end select
21620 endif
21630 'バーチャルパッド　上 ここから
21640 if y = -1 then
21650 select case No
21660 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
21670 case 1:
21680 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
21690 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
21700 case 0:
21710 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
21720 'No:3 3.Help→2.設定 No:2
21730 case 3:
21740 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
21750 case 2:
21760 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
21770 end select
21780 endif
21790 '決定ボタン
21800 if bg=1 then
21810 select case No
21820 '1.数霊チェックを選択  パッドの右キー
21830 case 1:
21840 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
21850 '2.設定を選択    パッドの右キー
21860 case 2:
21870 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
21880 '3.ヘルプを選択 パッドの右
21890 case 3:
21900 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
21910 'プログラムの終了を選択
21920 case 0:
21930 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
21940 'if lang_flag = 1 then
21950 'Else
21960 ui_msg "プログラムを終了します":end
21970 'endif
21980 end select
21990 endif
22000 '4.終了するを選択  パッドの右
22010 'バーチャルパッド　ここまで'
22020 'SettingScreen:
22030 'key$ = input$(1)
22040 'カーソル下'
22050 if key$ = chr$(31) then
22060 select case (No Mod 4)
22070 '登録文字から数霊文字の確認
22080 case 1:
22090 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22100 '数霊文字の確認からトップ画面に行く
22110 case 2:
22120 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
22130 'トップ画面に行くから終了
22140 case 3:
22150 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
22160 '終了から登録文字
22170 case 0:
22180 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
22190 end select
22200 endif
22210 'カーソル　上
22220 if key$ = chr$(30) then
22230 select case (No Mod 4)
22240 case 1:
22250 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
22260 case 2:
22270 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
22280 case 3:
22290 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
22300 case 0:
22310 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
22320 end select
22330 endif
22340 'エンターキーを押したとき
22350 if key$ = chr$(13) then
22360 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
22370 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
22380 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
22390 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
22400 'lse
22410 'o'o SettingScreen:
22420 endif
22430 '結果表示設定
22440 Result_Setting:
22450 color rgb(255,255,255)
22460 'dim list$(4)
22470 'ファイル読み込み
22480 '1.ファイルが有るか無いかのチェック
22490 if Dir$(System$) = "" then
22500 '1-1.ファイルがないとき
22510 '上のSystemフォルダを作成
22520 mkdir "./System/"
22530 list$(0) = "●:出た数字から181を引く"
22540 list$(1) = " :出た数字から180を引き単数変換"
22550 open System$ for output as #1
22560 print #1,"config_r=0"
22570 close #1
22580 ui_msg "ファイルを作成しました"
22590 'ファイル作成
22600 else
22610 '1-2.ファイルが有るとき
22620 'config_r:0 出た数字から181を引く
22630 'config_r:1 出た数字から180を引いて単数変換
22640 'open "./System/config.sys" for input as #1
22650 'ファイルが有るときファイルを読み込み
22660 open System$ for input as #1
22670 line input #1,buf_line$
22680 'buf$にデーターをコピーする
22690 buf$ = buf_line$
22700 close #1
22710 if len(buf$) = 10 then
22720  if left$(buf$,9) = "config_r=" then
22730  buf$ = right$(buf_line$,1)
22740  if buf$ = "1" then
22750    '1.System$ ファイルを削除(config.sys)
22760    '2.1行目をconfig_r=1と書き、保存する
22770    buf_config_r = 1
22780    'list$(0) = "●:1.出た数字から180を引いて単数変換"
22790    'list$(1) = " :2.出た数字から181を引く"
22800    else
22810  if buf$ = "0" then
22820    buf_config_r = 0
22830   ' list$(0) = "●:1.出た数字から181を引く"
22840   'list$(1) = " :2.出た数字から180を引いて単数変換"
22850  endif
22860  endif
22870  endif
22880 endif
22890 endif
22900 '"●:1.出た数字から180を引く"をlist$(0)に代入
22910 if buf_config_r =  0 then
22920 list$(0) = "●:1.出た数字から181を引く"
22930 list$(1) = " :2.出た数字から180を引いて単数変換"
22940 else
22950 list$(0) = "●:1.出た数字から180を引いて単数変換"
22960 list$(1) = " :2.出た数字から181を引く"
22970 endif
22980 list$(2) = " :トップ画面に戻る"
22990 list$(3) = " :終 了"
23000 list_num = ui_select("list$","番号を選んでください")
23010 play ""
23020 Select case (list_num)
23030 case 0:
23040        if buf$ = "1" then
23050        buf_config_r = 0:
23060        'データーを変更したのでファイルを削除
23070        kill System$
23080        'ファイルを新しく作成
23090        open System$ for output as #1
23100        print #1,"config_r=0"
23110        close #1
23120        ui_msg "設定を変更しました。"
23130        else
23140        'if buf$ = "0" then
23150        'buf_config_r = 1
23160        'kill System$
23170        'open Syetem$ for output as #1
23180        'print #1,"config_r=1"
23190        'close #1
23200        'ui_msg "設定を変更しました"
23210        'endif
23220        endif
23230        goto config_moji2:
23240 case 1:
23250        if buf$ = "0" then
23260        buf_config_r = 1:
23270        'データーを変更したので、ファイルを削除
23280        kill System$
23290        'ファイルを新しく作成
23300        open System$ for output as #1
23310        print #1,"config_r=1"
23320        close #1
23330        ui_msg "設定を変更しました"
23340        else
23350        kill System$
23360        if buf$ = "1" then
23370        open System$ for output as #1
23380        print #1,"config_r=0"
23390        close #1
23400        ui_msg "設定を変更しました"
23410        endif
23420        endif
23430        goto config_moji2:
23440 case 2:
23450       'トップ画面に飛ぶ
23460        goto TopScreen:
23470 case 3:
23480       'プログラムを終了する
23490       cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
23500 end select
23510 '単数変換
23520 Func Single_Complate(num)
23530 '1.出てきた数字から180を引く
23540 a = num - 180
23550 'a:10〜99
23560 Re1:
23570 if (a > 9 and a < 100) then
23580  b1 = fix(a / 10)
23590  b2 = 10 * a - b1
23600  d1 = b1 + b2
23610 if c > 9 then
23620  goto Re1:
23630 else
23640  c = d1:goto Re2:
23650 endif
23660 endif
23670 Re2:
23680 buffer = c
23690 endfunc buffer
23700 Func Surei_Result_Save_File()
23710 'ファイルがないとき
23720 if dir$(SAVE_DATA1$) = "" then
23730 open SAVE_DATA1$ for output as #1
23740 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
23750 close #1
23760 ui_msg "保存しました":talk "保存しました":goto Surei_Result:
23770 else
23780 open SAVE_DATA1$ for append as #1
23790 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
23800 close #1
23810 ui_msg "保存しました":talk "保存しました":goto Surei_Result
23820 endif
23830 endfunc
23840 '言語設定
23850 Setting_Language:
23860 cls 3:gload Gazo$ + "Screen1.png":screen 1,1,1:No=2
23870 init "Kb:4"
23880 sp_on 1,1:sp_on 0,0
23890 sp_put 0,(0,300),0,0
23900 sp_put 1,(0,400),1,0
23910 color rgb(0,0,255)
23920 'print "番号を選んでください"+chr$(13)
23930 'if lang_flag=0 then
23940 'print "言語設定:日本語"+chr$(13)
23950 'else
23960 'print "言語設定:英 語"+chr$(13)
23970 Change_Language:
23980 if lang_flag = 1 then
23990 cls
24000 print "It has changed Language"+chr$(13)
24010 color rgb(255,255,255)
24020 print "Select the Number"+chr$(13)
24030 print " :1.English → Japanse"+chr$(13)
24040 print " :2.It goes to TopScreen"+chr$(13)
24050 print "Language:In English" +chr$(13)
24060 else
24070 cls:color rgb(255,255,255)
24080 print "設定変更(言語の変更)" + chr$(13)
24090 color rgb(255,255,255)
24100 print chr$(13)
24110 print "番号を選んでください"+chr$(13)
24120 print " :1.日本語 → 英語に変更" + chr$(13)
24130 print " :2.トップ画面に戻る" + chr$(13)
24140 print chr$(13)
24150 print "設定言語:日本語" + chr$(13)
24160 endif
24170 color rgb(0,0,0)
24180 locate 0,15:print "                                       ":locate 0,15:print "2.トップ画面に戻る　を選択" + chr$(13)
24190 Setting_Language_key:
24200 y=0:key$="":bg=0
24210 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y<> -1 and bg<> 1)
24220 y=stick(1)
24230 key$=inkey$
24240 bg=strig(1)
24250 pause 2
24260 wend
24270 '選択肢変更
24280 if ((y=1) or (y=-1)) then
24290 select case No
24300 case 2:
24310      '実装部分　ここから
24320      pause 200:No=1:sp_on 0,1:sp_on 1,0:locate 0,15:print "                                                         ":locate 0,15:print "1.日本語 → 英語に変更を選択": goto Setting_Language_key:
24330      '実装部分　ここまで
24340 case 1:
24350       pause 200: No=2:sp_on 0,0:sp_on 1,1:locate 0,15:print "                                                       ":locate 0,15:print "2.トップ画面に戻る を選択":goto Setting_Language_key:
24360 end select
24370 endif
24380 'Enter Key  決定ボタン
24390 if ((key$=chr$(13)) or (bg=1)) then
24400 select case No
24410 case 2:
24420         sp_on 0,0:sp_on 1,0:goto TopScreen:
24430 case 1:                                                     'lang_flag=1:sp_on 0,0:sp_on 1,0:goto Change_Language:
24440       '
24450 '未実装　ここから
24460  sp_on 0,1:sp_on 1,0:ui_msg "この機能は未実装です":goto Setting_Language_key:
24470 '未実装　ここまで
24480 end select
24490 endif
