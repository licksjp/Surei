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
510 'Version 1.3.4_2023.02.19-2023.02.26(Release):正式版
520 '現在のバージョン
530 Version$ = "1.3.4_2023.02.26(正式版)"
540 'csvファイル 1.数霊 ベースファイル
550 FILE_csv$ = "./data/Kazutama.csv"
560 'csvファイル 2.数霊 ベースファイル 2
570 FILE_csv2$ = "./data/Surei_chart_20211207.csv"
580 'Save ファイル
590 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
600 'gazo ファイル
610 Gazo$ = "./data/Gazo/"
620 'System フォルダ:設定ファイルを保存するところ
630 System$ = "./System/config.sys"
640 '設定ファイル名:config.sys
650 'Sound File(Voice)
660 '1.ボイス TopScreen
670 Voice_File_TopScreen$ = "./data/Sound_data/"
680 '変数領域
690 'vcount:バーチャルパッド下の変数
700 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
710 count2 = 0:N=0:N2=0:m2 = 0
720 dim list$(4),moji_List$(2)
730 'ファイルの有無チェック
740 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
750 '1.ファイルが無いとき
760 cls :print "依存ファイルが見つかりません":
770 print "エンターキーを押してください" + chr$(13)
780 key$ = input$(1)
790 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
800 else
810 '2.ファイルが有るとき
820 cls:print "csv:file ok." + chr$(13)
830 n=0
840 'FILE_csv$:数霊データー入力
850 open FILE_csv$ for input as #1
860 while eof(1) = 0
870 input #1,line$
880 'print line$
890 bufline$(n) = line$
900 'Print n;chr$(13)
910 '登録件数カウント:n
920 n = n + 1
930 wend
940 close #1
950 N=n
960 '2つ目のファイル読み込み
970 'n = 0
980 open FILE_csv2$ for input as #2
990 for n=3 to 181
1000 for i=0 to 1
1010 input #2,line$
1020 bufline2$(n,i) = line$
1030 next i
1040 next n
1050 close #2
1060 N2 = n
1070 '
1080 endif
1090 '設定ファイルの読み込み
1100 'open System$ for input as #1
1110 'line input #1,buf_line$
1120  'if len(buf_line$) = 10 then
1130   'if left$(buf_line$,9)="config_r=" then
1140   ' buf$ = right$(buf_line$,1)
1150    'if buf$ = "1" then
1160    '   buf_config_r = 1
1170   ' else
1180   '    buf_config_r = 0
1190   ' endif
1200  ' endif
1210 'endif
1220 'close #1
1230 'or j = 3 to 181+3
1240 'ufline3$(j - 3,n) = bufline2$(i,n)
1250 'next j
1260 'moji$ = Kotodama$(bufline3$(16))
1270 'erase bufline2$
1280 '2022.11.23----------------------
1290 '端末言語のチェック
1300 '日本語端末かチェックをして日本語以外なら英語で表示する
1310 'lang flag:0:日本語 1:英語(日本語以外)
1320 '--------------------------------
1330 lang_flag = 0
1340 if ex_info$(1) <> "JP" then
1350 lang_flag = 1
1360 endif
1370 'Top画面
1380 TopScreen:
1390 'バーチャルパッドを表示
1400 cls 3:font 48:screen 1,1,1:init"kb:4":init"crt:0"
1410 'play ""
1420 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
1430 'gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
1440 gload Gazo$ + "TopScreen_20230129.png",0,0,0
1450 '選択肢 1
1460 gload Gazo$ + "Selection.png",1,5,300
1470 '選択肢 2
1480 gload Gazo$ + "Selection.png",1,5,400
1490 '選択肢 3
1500 gload Gazo$ + "Selection.png",1,5,500
1510 '選択肢 4
1520 gload Gazo$ + "Selection.png",1,5,600
1530 color rgb(0,0,255)
1540 print chr$(13)
1550 if lang_flag = 1 then
1560 color rgb(255,255,255)
1570 print "Select Number" + chr$(13)
1580 print " :1.Kazutama check" + chr$(13)
1590 print " :2.Setting" + chr$(13)
1600 print " :3.Help" + chr$(13)
1610 print " :4.End Program" + chr$(13)
1620 color rgb(255,255,255)
1630 else
1640 color rgb(255,255,255)
1650 print chr$(13)
1660 print "番号を選んでください" + chr$(13)
1670 print " :1.数霊(かずたま)チェック" + chr$(13)
1680 print " :2.設定" + chr$(13)
1690 print " :3.ヘルプ" + chr$(13)
1700 print " :4.終　了" + chr$(13)
1710 color rgb(0,0,0)
1720 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
1730 'バーチャルパッドを表示
1740 No=1:
1750 'lang_flag:1 外国語,0:日本語
1760 if lang_flag = 1 then
1770 'lang_flag=1 英語
1780 locate 0,15:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
1790 else
1800 'lang_flag=0 日本語
1810 locate 0,15:color rgb(0,0,0):print " 1.数霊(かずたま)チェックを選択";chr$(13)
1820 endif
1830 endif
1840 'スプライト
1850 '選択肢 1 On
1860 sp_def 0,(5,300),32,32
1870 sp_on 0,1
1880 sp_put 0,(5,300),0,0
1890 '選択肢 2 Off
1900 sp_def 1,(5,400),32,32
1910 sp_on 1,0
1920 sp_put 1,(5,400),0,0
1930 '選択肢 3 Off
1940 sp_def 2,(5,500),32,32
1950 sp_on 2,0
1960 sp_put 2,(5,500),0,0
1970 '選択肢 4 Off
1980 sp_def 3,(5,600),32,32
1990 sp_on 3,0
2000 sp_put 3,(5,600),0,0
2010 color rgb(0,0,0)
2020 Main_Select:
2030 'y:バーチャルパッドの処理
2040 'key$:カーソルの処理
2050 y = 0:key$ = "":bg = 0
2060 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
2070 y = stick(1)
2080 key$ = inkey$
2090 bg = strig(1)
2100 pause 2
2110 wend
2120 'if y=1 then
2130 'select case (No Mod 4)
2140 'ase 0:
2150 '     c=1:No=c:sp_on 0,1:sp_on 1,0 :sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print " 数霊(かずたま)チェックを選択":beep:goto Main_Select:
2160 'case 1:
2170 '       =2:No=c:sp_on 0,0:
2180 '"ase 2:
2190 'ase 3:
2200 'nd select
2210 'ndif
2220 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
2230 '1.バーチャルパッドの処理
2240 'バーチャルパッド下を押した時
2250 if y = 1 then
2260 select case No
2270 'No の初期値：No=1
2280 case 1:
2290 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
2300 if lang_flag = 1 then
2310 'lang_flag=1 英語
2320 locate 0,15:print "2.It has selected Setting":goto Main_Select:
2330 else
2340 'lang_flag=0 日本語
2350 locate 0,15:print " 2.設定を選択":goto Main_Select:
2360 endif
2370 'デバッグライン　ここから
2380 '0のとき
2390 'デバッグライン　ここまで
2400 'デバッグライン　ここから
2410 'バーチャルパッド　下
2420 case 2:
2430 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:
2440 print "                                         ":
2450 if lang_flag = 1 then
2460 color rgb(0,0,0):locate 0,15:
2470 print "3.It has selected Help":No=3:goto Main_Select:
2480 else
2490 color rgb(0,0,0):locate 0,15:print "                                                         ":locate 0,15:
2500 print " 3.ヘルプを選択":No=3:goto Main_Select:
2510 endif
2520 'cls:color rgb(255,255,255):print"ok"
2530 'デバッグライン　ここまで
2540 case 3:
2550 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print"                                               "
2560 if lang_flag = 1 then
2570 locate 0,15:print "4.It has selected finish program":No=0:goto Main_Select:
2580 else
2590 locate 0,15:print "                                                         " :locate 0,15:print " 4.終了を選択":No=0:goto Main_Select:
2600 endif
2610 'デバッグライン　ここから
2620 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
2630 'デバッグライン　ここまで
2640 case 0:
2650 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1
2660 if lang_flag = 1 then
2670 'lang_flag=1:英語
2680 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
2690 else
2700 'lang_flag=0:日本語
2710 locate 0,15:print "                                      ":locate 0,15:print " 1.数霊(かずたま)チェックを選択":goto Main_Select:
2720 'endif
2730 endif
2740 'デバッグライン　ここから
2750 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
2760 'デバッグライン　ここまで
2770 end select
2780 endif
2790 'バーチャルパッド　上 ここから
2800 if y = -1 then
2810 select case No
2820 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
2830 case 1:
2840 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       "
2850 if lang_flag = 1 then
2860 'lang_flag=1 英語
2870 locate 0,15:print "4.It has finished program":goto Main_Select:
2880 else
2890 'lang_flag=0 日本語
2900 locate 0,15:print "                                                          ":
2910 locate 0,15:print " 4.終了を選択":goto Main_Select:
2920 endif
2930 'endif
2940 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
2950 case 0:
2960 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":
2970 if lang_flag = 1 then
2980 '1:英語
2990 locate 0,15:print "3.It has selected Help":goto Main_Select:
3000 else
3010 '0:日本語
3020 locate 0,15:print "                                                                                        "
3030 locate 0,15:print " 3.ヘルプを選択":goto Main_Select:
3040 endif
3050 'No:3 3.Help→2.設定 No:2
3060 case 3:
3070 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      "
3080 if lang_flag = 1 then
3090 '1:英語
3100 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3110 else
3120 '0:日本語
3130 locate 0,15:print" 2.設定を選択":goto Main_Select:
3140 endif
3150 case 2:
3160 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":
3170 if lang_flag = 1 then
3180 'lang_flag 1 英語
3190 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3200 else
3210 'lang_flag 0 日本語
3220 locate 0,15:print" 1.数霊(かずたま)チェックを選択":goto Main_Select:
3230 endif
3240 end select
3250 endif
3260 if bg=1 then
3270 select case No
3280 '1.数霊チェックを選択  パッドの右キー(決定)
3290 case 1:
3300 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
3310 '2.設定を選択  パッドの右キー(決定)
3320 case 2:
3330 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
3340 '3.ヘルプを選択 パッドの右(決定)
3350 case 3:
3360 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
3370 'プログラムの終了を選択(決定)
3380 case 0:
3390 cls 3:cls 4:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg "メモリーを解放してプログラムを終了します":pause 2.052*1000:
3400 'if lang_flag = 1 then
3410 'lang_flag = 1 英語
3420 'else
3430 'lang_flag = 0 日本語
3440 color rgb(255,255,255):end
3450 'endif
3460 end select
3470 '4.終了するを選択  パッドの右
3480 endif
3490 'バーチャルパッド　上　ここまで
3500 '2.カーソルの処理
3510 'カーソル　下 chr$(31)
3520 if (key$ = chr$(31)) then
3530 select case (No)
3540 '4
3550 '0 選択肢4 => 選択肢1
3560 case 0:
3570 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "              ":color rgb(0,0,0):
3580 if lang_flag = 1 then
3590 'lang flag:1 英語
3600 else
3610 'lang flag:0 日本語
3620 color rgb(0,0,0):locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
3630 endif
3640 '1 選択肢1 => 選択肢2
3650 case 1:
3660 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":
3670 if lang_flag = 1 then
3680 'lang_flag:1 英語
3690 else
3700 'lang_flag:0 日本語
3710 color rgb(0,0,0):locate 0,15:print "2.設定を選択":beep:goto Main_Select:
3720 endif
3730 '2 選択肢2 => 選択肢3
3740 case 2:
3750 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,15:print "               ":
3760 if lang_flag = 1 then
3770 'lang flag:1 英語
3780 else
3790 'lang flang:0 日本語
3800 color rgb(0,0,0):locate 0,15:print "3.ヘルプを選択":beep:goto Main_Select:
3810 endif
3820 '3 選択肢３ => 選択肢4
3830 case 3:
3840 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "               ":color rgb(0,0,0)
3850 if lang_flag = 1 then
3860 'lang_flag = 1 英語
3870 else
3880 'lang_flag = 0 日本語
3890 color rgb(0,0,0):locate 0,15:print "4.終 了を選択":beep:goto Main_Select:
3900 endif
3910 case else:
3920 goto Main_Select:
3930 end select
3940 endif
3950 'カーソル　上
3960 if key$=chr$(30) then
3970 select case (No)
3980 '選択肢1 => 選択肢4
3990 case 1:
4000 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:PRINT "                      ":
4010 if lang_flag = 1 then
4020 'lang_flag=1:英語
4030 'print "1.It has selected Kazutama check":goto Main_Select:
4040 else
4050 'lang_flag = 0:日本語
4060 else
4070 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4080 endif
4090 '選択肢2 => 選択肢1
4100 case 2:
4110 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                 ":locate 1,15:print "2.設 定を選択":goto Main_Select:
4120 '選択肢3　=> 選択肢2
4130 case 3:
4140 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,500),0,0
4150 if lang_flag = 1 then
4160 'lang_flag = 1:英語
4170 locate 0,15:print "It has selected Help":goto Main_Select:
4180 else
4190 'lang_flag = 0:日本語
4200 locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4210 endif
4220 '選択肢4 => 選択肢3
4230 case 0:
4240 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                ":locate 1,15:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
4250 if lang_flag = 1 then
4260 'lang flag=1 英語
4270 else
4280 'lang flag=0 日本語
4290 locate 1,15:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
4300 endif
4310 end select
4320 endif
4330 'Input "番号:",No
4340 'エンターキー入力:決定
4350 if key$ = chr$(13) then
4360 select case No
4370 case 1:
4380 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4390 case 3:
4400 Color rgb(255,255,255):goto Help:
4410 case 0:
4420 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg "メモリーを解放してプログラムを終了します":color rgb(255,255,255):pause 3.00*1000:end
4430 case 2:
4440 color rgb(255,255,255):sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
4450 'else
4460 'goto Main_Select:
4470 end select
4480 endif
4490 'ndif
4500 'if N0=0 or No>4 then goto TopScreen:
4510 '1-1.数霊チェック
4520 Surei_Check:
4530 cls 3:Font 48:
4540 'gload Gazo$ + "Screen4.png"
4550 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png"
4560 play ""
4570 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
4580 color rgb(255,0,0)
4590 'print "●数霊(かずたま)チェックトップ" + chr$(13)
4600 sp_on 0,1:sp_put 0,(5,300),0,0:screen 1,1,1
4610 if lang_flag = 1 then
4620 'lang_flag=1 英語
4630 else
4640 'lang_flag=0 日本語
4650 print chr$(13)+chr$(13)+chr$(13)
4660 color rgb(255,255,255)
4670 print "番号を選んでください" + chr$(13)
4680 'print chr$(13)
4690 print " :1.数霊(かずたま)1人用" + chr$(13)
4700 print " :2.数霊(かずたま)2人用" + chr$(13)
4710 print " :3.トップ画面に行く" + chr$(13)
4720 'print " :4.終 了" + chr$(13)
4730 color rgb(0,0,0):No = 1
4740 locate 0,15:print "                                       "
4750 locate 0,15
4760 print " 1.数霊(かずたま)1人用を選択"
4770 endif
4780 Kazutama_main:
4790 'y:バーチャルパッドの処理
4800 'key$:カーソルの処理
4810 'bg:バーチャルパッドの右のボタン
4820 y = 0:key$ = "":bg=0
4830 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
4840 y = stick(1)
4850 key$ = inkey$
4860 bg=strig(1)
4870 y=stick(-1)
4880 pause 2
4890 wend
4900 'key$ = input$(1)
4910 if y = 1 then
4920 select case No
4930 'No の初期値：No=1
4940 case 1:
4950 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
4960 'if lang_flag=1 then
4970 'else
4980 locate 0,15:print "                                     "
4990 locate 0,15
5000 print" 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
5010 'endif
5020 'デバッグライン　ここから
5030 '0のとき
5040 'デバッグライン　ここまで
5050 'デバッグライン　ここから
5060 case 2:
5070 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                               "
5080 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に行くを選択":No=0:goto Kazutama_main:
5090 'cls:color rgb(255,255,255):print"ok"
5100 'デバッグライン　ここまで
5110 'case 3:
5120 'sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 4.終 了を選択":No=0:goto Kazutama_main:
5130 'デバッグライン　ここから
5140 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
5150 'デバッグライン　ここまで
5160 case 0:
5170 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5180 'デバッグライン　ここから
5190 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
5200 'デバッグライン　ここまで
5210 end select
5220 endif
5230 'バーチャルパッド　上 ここから
5240 if y = -1 then
5250 select case No
5260 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
5270 'case 1:
5280 'sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 0,15:print" 4.終了を選択":goto Kazutama_main:
5290 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
5300 case 1:
5310 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
5320 'No:3 3.Help→2.設定 No:2
5330 case 0:
5340 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 0,15:print" 2.数霊（かずたま）2人用を選択":goto Kazutama_main:
5350 case 2:
5360 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5370 end select
5380 endif
5390 if bg=1 then
5400 select case No
5410 '1.数霊チェックを選択  パッドの右キー
5420 case 1:
5430 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
5440 '2.設定を選択    パッドの右キー
5450 case 2:
5460 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
5470 '3.ヘルプを選択 パッドの右
5480 case 0:
5490 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
5500 'プログラムの終了を選択
5510 'case 0:
5520 'cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.05*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
5530 end select
5540 '4.終了するを選択  パッドの右
5550 endif
5560 'バーチャルパッド　上　ここまで
5570 if key$ = chr$(31) then
5580 select case No
5590 case 0:
5600 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,15:print "                                                          ":
5610 if lang_flag = 1 then
5620 Else
5630 locate 0,15:print "                                      "
5640 No=2:locate 0,15:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
5650 endif
5660 case 1:
5670 No=0:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,12:print "                                                          ":
5680 if lang_flag = 1 then
5690 Else
5700 locate 0,15:print"                                      "
5710 locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
5720 endif
5730 'case 2:
5740 'No=3:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,12:print"                                       ":
5750 'if lang_flag = 1 then
5760 'Else
5770 'locate 0,12:print" 4.終了を選択":goto Kazutama_main:
5780 'endif
5790 case 2:
5800 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                      ":
5810 if lang_flag = 1 then
5820 Else
5830 No=1:locate 0,15:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
5840 endif
5850 end select
5860 endif
5870 if key$=chr$(13) then
5880 select case No
5890 case 1:
5900 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
5910 case 2:
5920 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
5930 case 3:
5940 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
5950 'case 0:
5960 'cls 4:cls 3:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
5970 end select
5980 endif
5990 'Input "番号:",No
6000 '前の画面に戻る
6010 'if No = 3 then goto TopScreen:
6020 'プログラムの終了
6030 'if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":COLOR rgb(255,255,255):end
6040 '1人用
6050 'if No = 1 then goto Surei_Input:
6060 '2人用
6070 'if No = 2 then goto Surei_twoParson:
6080 'if No > 4 or No=0 then ui_msg"もう一度入れてください":goto Surei_Check:
6090 '数霊(かずたま) 文字入力  1人用
6100 Surei_Input:
6110 if mode = 0 then
6120 cls 3:font 32:init"kb:2"
6130 gload Gazo$ + "InputKotodama_20230131.png"
6140 play""
6150 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
6160 color rgb(255,0,0)
6170 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
6180 if lang_flag=1 then
6190 '英語
6200 else
6210 print chr$(13)+chr$(13)+chr$(13)
6220 color rgb(255,255,255)
6230 print "文字を入れてください" + chr$(13)
6240 color rgb(255,255,255)
6250 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
6260 print chr$(13)
6270 color rgb(0,0,0)
6280 Input "入力文字:",buffer_moji$
6290 if buffer_moji$ = "" then
6300 ui_msg "未入力です":goto Surei_Input:
6310 'endif
6320 else
6330 goto Surei_Result:
6340 endif
6350 endif
6360 endif
6370 'else
6380 if mode = 1 then
6390 cls 3:Font 32:
6400 gload Gazo$ + "InputKotodama.png"
6410 color rgb(255,0,0)
6420 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
6430 color rgb(255,255,255)
6440 print "文字を入れてください" + chr$(13)
6450 color rgb(255,0,0)
6460 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
6470 print "大文字のみ)" + chr$(13)
6480 color rgb(0,0,0)
6490 Input "文字入力:",buffer_moji2$
6500 goto Surei_Result3:
6510 'endif
6520 endif
6530 '数霊(かずたま)文字入力　2人用
6540 Surei_twoParson:
6550 cls 3:Font 32:init"kb:2"
6560 gload Gazo$ + "InputKotodama_20230131.png"
6570 '1人目入力
6580 if lang_flag = 1 then
6590 'color rgb(255,0,0)
6600 else
6610 print ""+chr$(13)+chr$(13)+chr$(13)
6620 'print "●数霊(かずたま) 1人目 入力" + chr$(13)
6630 color rgb(255,255,255)
6640 print "1人目の文字を入れてください" + chr$(13)
6650 color rgb(255,255,255)
6660 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
6670 color rgb(0,0,0)
6680 print chr$(13)
6690 Input "1人目文字入力:",buf_Parson1$
6700 endif
6710 Surei_twoParson2:
6720 cls 3:Font 32:init"kb:2"
6730 '2人目入力
6740 gload Gazo$ + "InputKotodama_20230131.png"
6750 'color rgb(255,0,0)
6760 'print "●数霊(かずたま) 2人目 入力" + chr$(13)
6770 if lang_falg = 1 then
6780 else
6790 print ""+chr$(13)+chr$(13)+chr$(13)
6800 color rgb(255,255,255)
6810 print "2人目の文字を入れてください" + chr$(13)
6820 color rgb(255,255,255)
6830 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
6840 color rgb(0,0,0)
6850 Input "2人目の文字入力:",buf_Parson2$
6860 goto Surei_Result2:
6870 endif
6880 '数霊　計算 パート
6890 '文字の計算関数
6900 'moji$:1文字を入れる
6910 func Complate(moji$)
6920 for n = 1 to 116
6930 if moji$ = bufline$(2*n) then
6940 buffcount = val(bufline$(2 * n + 1))
6950 endif
6960 next n
6970 endfunc buffcount
6980 '数霊　結果表示
6990 Surei_Result:
7000 cls 3:Font 32
7010 'ゼロカウント:zcount
7020 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
7030 '例 アカい:"い"の文字は無効な文字なので、はじく
7040 zcount=0
7050 'mojicount:入力文字数
7060 mojicount = len(buffer_moji$)
7070 for n=1 to mojicount
7080 for j=1 to 118
7090 if (bufcount$(n - 1) = bufline$(2 * j)) then
7100   bufcount$(n-1) = Mid$(buffer_moji$,n,1)
7110 endif
7120 next j
7130 next n
7140 'if mojicount > zcount then
7150 'cls 3:ui_msg "無効な文字です":talk "無効な文字があります。":zcount = 0:goto Surei_Input:
7160 ncount=0:count=0
7170    for i = 1 to mojicount
7180     bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7190   'ンのカウント
7200    if (bufcount$(i-1) = "ン") then ncount = ncount + 1
7210     'bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7220    next i
7230    if (ncount > 0) then
7240    'Listを表示する
7250    moji_List$(0) = "この単語は目に見える物です"
7260    moji_List$(1) = "この単語は目に見えない物です"
7270    num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
7280    if (num2 = 0) then
7290      ' n1 = n1 + 0
7300    else
7310    if (num2 = 1) then
7320       n1 = 9 * ncount
7330       'buf_count = 9 * ncount
7340    endif
7350    endif
7360    endif
7370 'else
7380    for j=1 to mojicount
7390    bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7400    count = count + Complate(bufcount$(j - 1))
7410   ' count = count + n1:count2 = count
7420 'endif
7430    'count = count + buf_count:
7440    next j
7450    count = count + n1
7460 if (ncount > 0) then count = count
7470 '182以上のとき,181を引く
7480 if buf_cofig_r = 0 then
7490      if (count > 181) then
7500 'if buf_config_r = 0 then
7510         count = count - 181
7520 'else
7530 'if buf_config_r = 1 then
7540 '   count=Single_Complate(count2)
7550 'endif
7560      else
7570      if (buf_config_r = 1) then
7580        'count2 = count - 180
7590        buf_count = Single_Complate(count)
7600      endif
7610 endif
7620 endif
7630 'if config_r = 0 then
7640 cls 3:Font 48+16
7650 gload Gazo$ + "Result_Screen3_20211226.png"
7660 if buf_config_r = 1 then
7670    print "入力文字:" + buffer_moji$ + chr$(13)
7680    print "数霊(かずたま):";buf_count;chr$(13)
7690 endif
7700 if lang_flag = 1 then
7710 else
7720 color rgb(255,0,0)
7730 print "入力文字:" + buffer_moji$ + chr$(13)
7740 endif
7750 'print chr$(13)
7760 if lang_flag = 1 then
7770 else
7780 color rgb(0,0,255)
7790 print "数霊(かずたま):";count;chr$(13)
7800 endif
7810 if lang_flag = 1 then
7820 else
7830 color rgb(0,0,0)
7840 print "エンター or スペース" + chr$(13)
7850 print  chr$(13)
7860 'endif
7870 endif
7880 key$ = input$(1)
7890 if ((key$ = chr$(13)) or (key$=" ")) then
7900 List$(0)="1.もう一度数霊を見る"
7910 List$(1)="2.トップ画面に行く"
7920 List$(2)="3.この数霊の説明を見る"
7930 List$(3)="4.数霊データーを保存"
7940 num=ui_select("List$","番号を選んでください")
7950 select case num
7960   case 0:
7970          goto Surei_Input:
7980   case 1:
7990        n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
8000          for i=0 to 9
8010             bufcount$(i)=""
8020          next i
8030          goto TopScreen:
8040   case 2:
8050        goto Surei_Result4:
8060   case 3:
8070         s=Surei_Result_Save_File()
8080         ui_msg "保存しました"
8090   case -1:
8100        'goto Surei_Result:
8110   case else:
8120        goto Surei_Result:
8130 end select
8140 'endif
8150 'if key$ = " " then
8160 '２回めの入力に行く
8170 'mode = 1:goto Surei_Input:
8180 'else
8190 'if key$ = "s" or key$ = "S" then
8200 'ファイルを保存する
8210 's = Save()
8220 'ui_msg"保存しました"
8230 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
8240 else
8250 goto Surei_Result:
8260 'endif
8270 endif
8280 '3-1 バージョン情報
8290 Version:
8300 cls 3:Font 32
8310 gload Gazo$ + "Screen1_Version.png"
8320 play ""
8330 play Voice_File_TopScreen$ + "Voice_Version.mp3"
8340 color rgb(255,0,0)
8350 'print"●バージョン情報"+chr$(13)
8360 print chr$(13)
8370 color rgb(255,255,255)
8380 if lang_flag = 1 then
8390 else
8400 print chr$(13)+chr$(13)+chr$(13)
8410 print "Ver:";Version$ + chr$(13)
8420 print "アプリ名:数霊計算機" + chr$(13)
8430 print "Basic for Android Runtime" + chr$(13)
8440 print "Author:licksjp" + chr$(13)
8450 print "制作開始:2021.7.28" + chr$(13)
8460 print chr$(13)
8470 print "(C)Copy right licksjp " + chr$(13)
8480 print "All rights reserved" + chr$(13)
8490 print chr$(13)
8500 color rgb(0,0,0)
8510 print "パッドの右を押してください" + chr$(13)
8520 endif
8530 'key$ = input$(1)
8540 bg=0:key$=""
8550 while (bg <> 1 and key$ <> chr$(13))
8560 bg = strig(1)
8570 key$ = inkey$
8580 pause 2
8590 wend
8600 if key$ = chr$(13) then
8610 goto TopScreen:
8620 'else
8630 'talk "無効なキーです":goto Version:
8640 else
8650 if bg=1 then
8660 goto TopScreen:
8670 else
8680 if lang_flag = 1 then
8690 else
8700 talk "無効なキーです":goto Version:
8710 endif
8720 endif
8730 endif
8740 '3-2 参考文献
8750 Reference_Book:
8760 cls 3:Font 48:play""
8770 gload Gazo$ + "Screen1_Reference.png"
8780 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
8790 color rgb(255,0,0)
8800 'print"●参考文献" + chr$(13)
8810 print chr$(13)+chr$(13)
8820 if lang_flag = 1 then
8830 else
8840 color rgb(255,255,255)
8850 print "書名:数霊" + chr$(13)
8860 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
8870 print "出版社:徳間書店" + chr$(13)
8880 print "ISBN:978-4-19-" + chr$(13)
8890 print "         865309-5" + chr$(13)
8900 print "定価:2300円 + 税" + chr$(13)
8910 'print chr$(13)
8920 color rgb(0,0,0)
8930 print "パッドの右を押してください"
8940 endif
8950 bg = 0:key$ = ""
8960 while (bg <> 1 and key$ <> chr$(13))
8970 bg = strig(1)
8980 key$ = inkey$
8990 pause 2
9000 wend
9010 if key$ = chr$(13) then
9020 goto TopScreen:
9030 'else
9040 'talk "無効なキーです":goto Reference_Book:
9050 else
9060 if bg = 1 then
9070 goto TopScreen:
9080 else
9090 talk "無効なキーです":goto Reference_Book:
9100 endif
9110 endif
9120 'key$=input$(1)
9130 'if key$=chr$(13) then
9140 'goto TopScreen:
9150 'else
9160 'talk"無効なキーです":goto Reference_Book:
9170 'endif
9180 'ヘルプ画面　トップ画面
9190 Help:
9200 No=1:c=0
9210 play ""
9220 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
9230 cls 3:Font 48:
9240 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9250 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0
9260 color rgb(255,0,0)
9270 'print "●3.ヘルプ　トップ画面" + chr$(13)
9280 print chr$(13)+chr$(13)+chr$(13)
9290 color rgb(255,255,255)
9300 print "番号を選んでください" + chr$(13)
9310 print " :1.バージョン" + chr$(13)
9320 print " :2.参考文献" + chr$(13)
9330 print " :3.トップ画面に行く" + chr$(13)
9340 'print " :4.終 了" + chr$(13)
9350 color rgb(0,0,0)
9360 'print " :3.トップ画面に行く" + chr$(13)+chr$(13)
9370 locate 0,15:print "                                     "
9380 if No = 1 then locate 0,15:print " 1.バージョンを選択"
9390 'y:バーチャルパッドの処理
9400 'key$:カーソルの処理
9410 'bg:バーチャルパッドの右ボタン
9420 Help_key:
9430 y = 0:key$ = "":bg=0
9440 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
9450 y = stick(1)
9460 key$ = inkey$
9470 bg=strig(1)
9480 pause 2
9490 wend
9500 'バーチャルパッド　ここから'
9510 if y = 1 then
9520 select case No
9530 'No の初期値：No=1
9540 case 1:
9550 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
9560 if lang_flag = 1 then
9570 else
9580 locate 0,15:print" 2.参考文献を選択":goto Help_key:
9590 endif
9600 'デバッグライン　ここから
9610 '0のとき
9620 'デバッグライン　ここまで
9630 'デバッグライン　ここから
9640 case 2:
9650 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                  "
9660 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に行くを選択":No=0:goto Help_key:
9670 'cls:color rgb(255,255,255):print"ok"
9680 'デバッグライン　ここまで
9690 'case 3:
9700 'sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print "                                       ":locate 0,15:print "4.終 了を選択":No=0:goto Help_key:
9710 'デバッグライン　ここから
9720 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
9730 'デバッグライン　ここまで
9740 case 0:
9750 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
9760 'デバッグライン　ここから
9770 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
9780 'デバッグライン　ここまで
9790 end select
9800 endif
9810 'バーチャルパッド　上 ここから
9820 if y = -1 then
9830 select case No
9840 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
9850 'case 1:
9860 'sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 0,15:print"4.終了を選択"::goto Help_key:
9870 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
9880 case 0:
9890 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=1:locate 0,15:print"                                       ":locate 0,15:print" 3.トップ画面に行くを選択":goto Help_key
9900 'No:3 3.Help→2.設定 No:2
9910 case 1:
9920 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
9930 case 2:
9940 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=0:locate 0,15:print "                                      ":locate 0,15:print" 1.バージョンを選択":goto Help_key:
9950 end select
9960 endif
9970 if bg = 1 then
9980 select case No
9990 '1.数霊チェックを選択  パッドの右キー
10000 case 1:
10010 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
10020 '2.設定を選択    パッドの右キー
10030 case 2:
10040 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
10050 '3.ヘルプを選択 パッドの右
10060 case 0:
10070 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
10080 'プログラムの終了を選択
10090 'case 0:
10100 'cls 3:cls 4:color rgb(255,255,255):play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
10110 'if lang_flag = 1 then
10120 'lang_flag = 1:英語
10130 'Else
10140 'lang_flag = 0:日本語
10150 'endif
10160 end select
10170 '4.終了するを選択  パッドの右
10180 endif
10190 'バーチャルパッド　上　ここまで
10200 'バーチャルパッド　ここまで'
10210 'key$ = input$(1)
10220 'カーソルの下
10230 if key$ = chr$(31) then
10240 select case (No Mod 4)
10250 'バージョンから参考文献
10260 case 0:
10270 c=1:No=c:locate 0,15:Print "             ":locate 0,15:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
10280 '参考文献からトップ画面
10290 case 1:
10300 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "            ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10310 'トップ画面から終了
10320 'case 2:
10330 'c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,12:print "                ":locate 0,12:print " 4.終 了を選択":goto Help_key:
10340 '終了からバージョン
10350 case 2:
10360 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                     ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10370 case else:
10380 goto Help_key:
10390 end select
10400 endif
10410 'カーソル　上
10420 if key$ = chr$(30) then
10430 select case (c Mod 4)
10440 'バージョンから終了
10450 case 0:
10460 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:locate 0,15:print "                   ":locate 0,15:print " 4.終 了を選択":goto Help_key:
10470 '参考文献からバージョン
10480 case 1:
10490 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                   ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10500 'トップ画面から参考文献
10510 case 2:
10520 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":locate 0,15:print " 2.参考文献を選択":goto Help_key:
10530 '終了からトップ画面を選択
10540 case 3:
10550 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print"                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10560 case else:
10570 goto Help_key:
10580 end select
10590 endif
10600 'Input "番号:",No
10610 'sp_def 0,(5,200),32,32
10620 'エンターキー：決定
10630 if key$=chr$(13) then
10640 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10650 if No=0 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10660 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10670 'if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg "プログラムを終了します":cls 3:cls 4:end
10680 else
10690 goto Help_key:
10700 endif
10710 'if (No = 0 or No > 4) then ui_msg "もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
10720 '登録文字の確認
10730 '文字を1文字入れて登録されているか調べるメニュー
10740 '設定項目
10750 Setting:
10760 cls 3:Font 48
10770 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
10780 play ""
10790 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
10800 No=1
10810 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:
10820 color rgb(0,0,255)
10830 'print "●設定項目" + chr$(13)
10840 print chr$(13)
10850 if lang_flag = 1 then
10860 'lang_flag = 1:英語
10870 else
10880 'lang_flag = 0:日本語
10890 color rgb(255,255,255)
10900 print chr$(13)
10910 print "番号を選んでください" + chr$(13)
10920 '-------コメント----------------
10930 'print " :1.登録文字の確認" + chr$(13)
10940 'print " :2.数霊文字確認" + chr$(13)
10950 '-------コメント----------------
10960 'print chr$(13)
10970 print " :1.文字の項目" + chr$(13)
10980 print " :2.結果表示設定" + chr$(13)
10990 print " :3.言語設定" + chr$(13)
11000 print " :4.トップ画面に行く" + chr$(13)
11010 endif
11020 color rgb(0,0,0)
11030 locate 0,15
11040 if No=1 then locate 0,15:print  "                                     ":locate 0,15:print " 1.文字の項目を選択"
11050 'y:バーチャルパッドの処理
11060 'key$:カーソルの処理
11070 'bg:バーチャルパッドの右ボタン
11080 SettingScreen:
11090 y = 0:key$ = "":bg=0
11100 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
11110 y = stick(1)
11120 key$ = inkey$
11130 bg=strig(1)
11140 pause 2
11150 wend
11160 'バーチャルパッド　ここから'
11170 'バーチャルパッド　ここから'
11180 if y = 1 then
11190 select case No
11200 'No の初期値：No=1
11210 case 1:
11220 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":color rgb(0,0,0):locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11230 'デバッグライン　ここから
11240 '0のとき
11250 'デバッグライン　ここまで
11260 'デバッグライン　ここから
11270 case 2:
11280 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                         "
11290 color rgb(0,0,0)::No=3
11300 if lang_flag = 1 then
11310 else
11320 locate 1,15:print "3.言語設定を選択":goto SettingScreen:
11330 endif
11340 'cls:color rgb(255,255,255):print"ok"
11350 'デバッグライン　ここまで
11360 case 3:
11370 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print"                                              ":locate 1,15:print "4.トップ画面に行くを選択":No=0:goto SettingScreen:
11380 'デバッグライン　ここから
11390 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11400 'デバッグライン　ここまで
11410 case 0:
11420 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
11430 'デバッグライン　ここから
11440 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11450 'デバッグライン　ここまで
11460 end select
11470 endif
11480 'バーチャルパッド　上 ここから
11490 if y = -1 then
11500 select case No
11510 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11520 case 1:
11530 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 1,15:print"4.トップ画面に行くを選択":goto SettingScreen:
11540 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11550 case 0:
11560 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
11570 'No:3 3.Help→2.設定 No:2
11580 case 3:
11590 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.結果表示設定を選択":goto SettingScreen:
11600 case 2:
11610 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 1,15:print"1.文字の項目を選択":goto SettingScreen:
11620 end select
11630 endif
11640 if bg=1 then
11650 select case No
11660 '1.数霊チェックを選択  パッドの右キー
11670 case 1:
11680 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
11690 '2.設定を選択    パッドの右キー
11700 case 2:
11710 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
11720 '3.ヘルプを選択 パッドの右
11730 case 0:
11740 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
11750 'プログラムの終了を選択
11760 case 3:
11770 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Setting_Language:
11780 'if lang_flag = 1 then
11790 'Else
11800 'ui_msg "プログラムを終了します"
11810 'endif
11820 end select
11830 endif
11840 '4.終了するを選択  パッドの右
11850 'バーチャルパッド　ここまで'
11860 'SettingScreen:
11870 'key$ = input$(1)
11880 'カーソル下'
11890 if key$ = chr$(31) then
11900 select case (No Mod 4)
11910 '登録文字から数霊文字の確認
11920 case 1:
11930 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                     ":locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11940 '数霊文字の確認からトップ画面に行く
11950 case 2:
11960 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "                                     ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
11970 'トップ画面に行くから終了
11980 case 3:
11990 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                                       ":locate 1,15:print "4.トップ画面に行くを選択":goto SettingScreen:
12000 '終了から登録文字
12010 case 0:
12020 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
12030 end select
12040 endif
12050 'カーソル　上
12060 if key$ = chr$(30) then
12070 select case (No Mod 4)
12080 case 1:
12090 c=2:No=c:sp_on 0,1:sp_put 0,(5,300),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
12100 case 2:
12110 c=3:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
12120 case 3:
12130 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:goto SettingScreen:
12140 case 0:
12150 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,600),0,0:sp_on 0,0:goto SettingScreen:
12160 end select
12170 endif
12180 'エンターキーを押したとき
12190 if key$ = chr$(13) then
12200 if No=3 then goto Setting_Language:
12210 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
12220 'if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji1:
12230 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
12240 if No=0 then goto TopScreen:
12250 'lse
12260 'o'o SettingScreen:
12270 endif
12280 'endif
12290 'endif
12300 '文字検索項目  ここから
12310 Moji_Search:
12320 cls 4:cls 3:Font 32+16:init"kb:2"
12330 gload Gazo$ + "Moji_Search_Result.png"
12340 play ""
12350 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
12360 print "" + chr$(13)
12370 color rgb(255,255,255)
12380 if lang_flag = 1 then
12390 Else
12400 print "文字を一文字入れてください" + chr$(13)
12410 endif
12420 color rgb(0,0,0)
12430 if lang_flag=1 then
12440 Else
12450 Input "登録文字:",moji$
12460 endif
12470 moji_count = len(moji$)
12480 if moji_count > 1 then
12490 'if lang_flag = 1 then
12500 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Moji_Search:
12510 'Else
12520 'endif
12530 else
12540 count=0
12550 for n = 0 to 116
12560 if bufline$(2*n) = moji$ then
12570 cls 3:font 48:init"kb:4"
12580 gload Gazo$ + "Moji_Search_Result.png"
12590 'talk"この文字は登録されています"
12600 play ""
12610 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12620 if lang_flag = 1 then
12630 Else
12640 print chr$(13)
12650 color rgb(255,255,255)
12660 print moji$;"は、登録されています。" + chr$(13)
12670 color rgb(0,0,0)
12680 print "ジョイパッドの右を押してください"
12690 endif
12700 bg = 0:key$ = ""
12710 while (bg <> 1 and key$ <> chr$(13))
12720 key$ = inkey$
12730 bg = strig(1)
12740 pause 2
12750 wend
12760 'y$=input$(1)
12770 if key$ = chr$(13) then goto TopScreen:
12780 if bg=1 then goto TopScreen:
12790 count = count + 1
12800 endif
12810 next n
12820 if count = 0 then
12830 cls 3:font 48:init "kb:4"
12840 gload Gazo$ + "Moji_check.png"
12850 play ""
12860 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
12870 print chr$(13)
12880 if lang_flag = 1 then
12890 Else
12900 color rgb(255,255,255)
12910 print moji$;"は、登録されていません。" + chr$(13)
12920 color rgb(0,0,0)
12930 print "パッドの右を押してください" + chr$(13)
12940 endif
12950 kg = 0:key$ = ""
12960 while (kg <> 1 and key$ <> chr$(13))
12970 key$ = inkey$
12980 kg = strig(1)
12990 pause 2
13000 wend
13010 if ((key$ = chr$(13)) or (kg=1)) then goto TopScreen:
13020 endif
13030 endif
13040 Surei_Result2:
13050 cls 3:Font 48
13060 zcount1=0:zcount2=0:count1=0:count2=0
13070 '1人目
13080 mojicount1=len(buf_Parson1$)
13090 '2人目
13100 mojicount2 = len(buf_Parson2$)
13110 '1人目
13120 for n = 1 to mojicount1
13130 for j = 1 to 116
13140 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
13150 if bufcount1$(n-1) = bufline$(2*j) then
13160 zcount1 = zcount1 + 1
13170 endif
13180 next j
13190 next n
13200 '2人目
13210 for n = 1 to mojicount2
13220 for j = 1 to 116
13230 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
13240 if bufcount2$(n-1) = bufline$(2*j) then
13250 zount2 = zcount2 + 1
13260 endif
13270 next j
13280 next n
13290 '1人目
13300 for i=1 to mojicount1
13310 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
13320 p1 = Complate(bufcount1$(i-1))
13330 count1 = count1 + p1
13340 next i
13350 '2人目
13360 for i = 1 to mojicount2
13370 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
13380 p2 = Complate(bufcount2$(i-1))
13390 count2 = count2 + p2
13400 next i
13410 cls 3:
13420 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
13430 color rgb(255,0,0)
13440 'print "数霊 2人用 結果表示"+chr$(13)
13450 print ""+chr$(13)
13460 if lang_flag = 1 then
13470 else
13480 color rgb(255,255,255)
13490 print "1人目:";buf_Parson1$;chr$(13)
13500 print "数霊1:";count1;chr$(13)
13510 print "2人目:";buf_Parson2$;chr$(13)
13520 print "数霊2:";count2;chr$(13)
13530 print "数霊(合計):";count1 + count2;chr$(13)
13540 color rgb(0,0,0)
13550 print "エンターキーを押してください" + chr$(13)
13560 endif
13570 key$ = "":bg = 0
13580 'ey$=input$(1)
13590 while (bg <> 1 and key$ <> chr$(13))
13600 bg = strig(1)
13610 key$ = inkey$
13620 pause 2
13630 wend
13640 if (bg = 1 or key$ = chr$(13))  then goto TopScreen:
13650 Surei_Result3:
13660 cls 3:Font 48
13670 zcount2 = 0:count2 = 0
13680 mojicount2 = len(buffer_moji2$)
13690 for n = 1 to mojicount2
13700 for j = 1 to 116
13710 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
13720 if bufcount2$(n - 1) = bufline$(2 * j) then
13730 zcount2 = zcount2 + 1
13740 endif
13750 next j
13760 next n
13770 for i = 1 to mojicount2
13780 n2 = Complate(bufcount2$(i-1))
13790 count2 = count2 + n2
13800 next i
13810 gload Gazo$ + "Screen5.png"
13820 if lang_flag = 1 then
13830 else
13840 color rgb(255,0,0)
13850 print "数霊の結果表示" + chr$(13)
13860 color rgb(255,255,255)
13870 print "１回目回の文字入力:";buffer_moji$;chr$(13)
13880 print "１回目の数霊(かずたま)";count;chr$(13)
13890 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
13900 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
13910 color rgb(0,0,0)
13920 print "エンターキー:トップ画面";chr$(13)
13930 print "c or C キー:数霊の比較";chr$(13)
13940 endif
13950 key$ = "":bg = 0
13960 while (key$ <> chr$(13) and bg <> 1)
13970 bg = strig(1)
13980 key$ = inkey$
13990 pause 2
14000 wend
14010 'key$ = input$(1)
14020 if bg = 1 then goto TopScreen:
14030 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
14040 if key$ = "c" or key$ = "C" then
14050 if count = count2 then
14060 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
14070 else
14080 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
14090 endif
14100 endif
14110 Moji_Count_Check:
14120 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
14130 cls 3:Font 48
14140 gload Gazo$ + "Moji_check.png"
14150 n = 0
14160 open FILE_csv$ for input as #1
14170 while eof(1) = 0
14180 line input #1, line$
14190 n = n + 1
14200 wend
14210 close #1
14220 'n = n - 1
14230 'talk "登録文字数は"+str$(n)+"文字です"
14240 play ""
14250 if n = 118 then
14260 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
14270 if lang_flag = 1 then
14280 else
14290 'talk "登録文字数は、" + str$(n) + "文字です"
14300 print "" + chr$(13)
14310 color rgb(255,255,255)
14320 print "文字の登録文字数は";n;"文字" + chr$(13)
14330 color rgb(0,0,0)
14340 print "パッドの右を押してください" + chr$(13)
14350 endif
14360 endif
14370 'key$ = input$(1)
14380 key$ = "":bg = 0
14390 while (key$ <> chr$(13) and bg <> 1)
14400 key$=inkey$
14410 bg=strig(1)
14420 pause 2
14430 wend
14440 if bg = 1 then goto TopScreen:
14450 if key$ = chr$(13) then
14460 goto TopScreen:
14470 else
14480 goto Moji_Count_Check:
14490 endif
14500 'Save 関数
14510 file_kazutama = 0
14520 file_kazutama = Save_File()
14530 func Save_File()
14540 open SAVE_DATA1$  for output as #1
14550 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
14560 close #1
14570 endfunc
14580 Select_moji:
14590 cls 3:font 48:No = 1
14600 gload Gazo$ + "Screen1_mojicheck.png"
14610 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
14620 color rgb(255,0,0)
14630 'print "文字の確認" + chr$(13)
14640 if lang_flag = 1 then
14650 else
14660 play ""
14670 play Voice_File_TopScreen$ + "Voice_Select_Moji20230217.mp3"
14680 print chr$(13)+chr$(13)+chr$(13)
14690 color rgb(255,255,255)
14700 print "番号を選んでください" + chr$(13)
14710 print " :1.登録文字検索"+ chr$(13)
14720 print " :2.登録文字数の確認" + chr$(13)
14730 print " :3.トップ画面に戻る" + chr$(13)
14740 'print " :4.終　了" + chr$(13)
14750 color rgb(0,0,0)
14760 locate 0,15
14770 if No = 1 then print " 1.登録文字検索を選択"
14780 endif
14790 Entry_check_key:
14800 y = 0:key$ = "":bg=0
14810 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
14820 y = stick(1)
14830 key$ = inkey$
14840 bg=strig(1)
14850 pause 2
14860 wend
14870 'バーチャルパッド　ここから'
14880 'バーチャルパッド　ここから'
14890 if y = 1 then
14900 select case No
14910 'No の初期値：No=1
14920 case 1:
14930 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
14940 'デバッグライン　ここから
14950 '0のとき
14960 'デバッグライン　ここまで
14970 'デバッグライン　ここから
14980 case 2:
14990 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                       "
15000 :No=0
15010 'if lang_flag = 1 then
15020 'Else
15030 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に戻るを選択":goto Entry_check_key:
15040 'endif
15050 'cls:color rgb(255,255,255):print"ok"
15060 'デバッグライン　ここまで
15070 'case 3:
15080 'sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 4.終 了を選択":No=0:goto Entry_check_key:
15090 'デバッグライン　ここから
15100 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
15110 'デバッグライン　ここまで
15120 case 0:
15130 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.登録文字数の確認を選択":goto Entry_check_key:
15140 'デバッグライン　ここから
15150 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
15160 'デバッグライン　ここまで
15170 end select
15180 endif
15190 'バーチャルパッド　上 ここから
15200 if y = -1 then
15210 select case No
15220 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15230 'case 1:
15240 'sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 1,15:print "                                       ":locate 0,15:print" 4.終了を選択"::goto Entry_check_key:
15250 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15260 case 1:
15270 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print"3.トップ画面に戻るを選択":goto Entry_check_key:
15280 'No:3 3.Help→2.設定 No:2
15290 case 0:
15300 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
15310 case 2:
15320 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print "1.登録文字検索":goto Entry_check_key:
15330 end select
15340 endif
15350 if bg=1 then
15360 select case No
15370 '1.数霊チェックを選択  パッドの右キー
15380 case 1:
15390 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15400 '2.設定を選択    パッドの右キー
15410 case 2:
15420 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15430 '3.ヘルプを選択 パッドの右
15440 case 0:
15450 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
15460 'プログラムの終了を選択
15470 'case 0:
15480 'cls 3:cls 4::play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":ui_msg "プログラムを終了します":color rgb(255,255,255):pause 2.052 * 1000:end
15490 'if lang_flag = 1 then
15500 'else
15510 'endif
15520 end select
15530 endif
15540 '4.終了するを選択  パッドの右
15550 'バーチャルパッド　ここまで'
15560 'key$ = input$(1)
15570 'カーソルの下
15580 if key$ = chr$(31) then
15590 select case (No Mod 4)
15600 case 0:
15610 c=1:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
15620 case 1:
15630 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,500),0,0:sp_on 3,0:goto Entry_check_key:
15640 case 2:
15650 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:goto Entry_check_key:
15660 case 3:
15670 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
15680 end select
15690 endif
15700 'カーソル　上
15710 if key$ = chr$(30) then
15720 select case (No Mod 4)
15730 case 0:
15740 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
15750 case 1:
15760 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
15770 case 2:
15780 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
15790 case 3:
15800 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
15810 end select
15820 endif
15830 'エンターキーを押す
15840 if key$ = chr$(13) then
15850 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15860 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15870 if No = 0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15880 'if No = 0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":end
15890 endif
15900 '
15910 Kakunin_Surei_count:
15920 cls 3:font 48:No=1
15930 gload Gazo$ + "Kazutama_List_Top.png"
15940 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
15950 color rgb(255,0,0)
15960 print chr$(13)+chr$(13)+chr$(13)
15970 color rgb(255,255,255)
15980 'if lang_flag = 1 then
15990 'else
16000 'print chr$(13)+chr$(13)
16010 print "番号を選んでください" + chr$(13)
16020 print " :1.数霊リスト 1人用" + chr$(13)
16030 print " :2.結果表示設定" + chr$(13)
16040 print " :3.トップ画面に行く" + chr$(13)
16050 'print " :4.終 了" + chr$(13)
16060 print "" + chr$(13)
16070 'endif
16080 color rgb(0,0,0)
16090 locate 0,15:print"                                                         "
16100 if No = 1 then locate 1,15:print "1.数霊リスト　1人用を選択"
16110 Entry_List:
16120 y = 0:key$ = "":bg=0
16130 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
16140 y = stick(1)
16150 key$ = inkey$
16160 bg = strig(1)
16170 pause 2
16180 wend
16190 'バーチャルパッド　ここから'
16200 'バーチャルパッド　ここから'
16210 'バーチャルパッド　下
16220 if y = 1 then
16230 select case No
16240 'No の初期値：No=1
16250 case 1:
16260 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.結果表示設定を選択":goto Entry_List:
16270 'デバッグライン　ここから
16280 '0のとき
16290 'デバッグライン　ここまで
16300 'デバッグライン　ここから
16310 'case 3:
16320 'sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:No=0:pause 200:locate 0,15:print "                                       "
16330 'color rgb(0,0,0):locate 0,15:print " 4.終了を選択":goto Entry_List:
16340 'cls:color rgb(255,255,255):print"ok"
16350 'デバッグライン　ここまで
16360 case 0:
16370 sp_on 3,0:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 1.数霊リスト 1人用を選択":No=1:goto Entry_List:
16380 case 2:
16390 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                      ":No=0:locate 1,15:print "3．トップ画面に行くを選択":goto Entry_List:
16400 'sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print "                                      "
16410 'case 1:
16420 'デバッグライン　ここから
16430 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
16440 'デバッグライン　ここまで
16450 'case 0:
16460 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_List:
16470 'デバッグライン　ここから
16480 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
16490 'デバッグライン　ここまで
16500 end select
16510 endif
16520 'バーチャルパッド　上 ここから
16530 if y = -1 then
16540 select case No
16550 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
16560 case 2:
16570 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 2.結果表示設定を選択":goto Entry_List:
16580 'case 1:
16590 'sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 0,15:print " 4.終了を選択":goto Entry_List:
16600 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
16610 case 0:
16620 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 1,15:print"3.トップ画面に行くを選択":goto Entry_List:
16630 'No:3 3.Help→2.設定 No:2
16640 case 1:
16650 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print "1.数霊リスト 1人用を選択":goto Entry_List:
16660 'case 2:
16670 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_List:
16680 end select
16690 endif
16700 if bg = 1 then
16710 select case No
16720 '1.数霊リスト 一人用を選択を選択  パッドの右キー
16730 case 1:
16740 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16750 '2.設定を選択  パッドの右キー
16760 case 2:
16770 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16780 case 0:
16790  sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16800 '4.終了を選択 パッドの右
16810 'case 0:
16820 'cls 3:cls 4:color rgb(255,255,255):
16830 'play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:
16840 'Else
16850 'ui_msg "プログラムを終了します":end
16860 'endif
16870 'プログラムの終了を選択
16880 end select
16890 endif
16900 if key$=chr$(13) then
16910 select case No
16920 'case 0:
16930  '     sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":end
16940 case 0:
16950       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16960 case 1:
16970       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16980 case 2:
16990       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
17000 end select
17010 endif
17020 '4.終了するを選択  パッドの右
17030 'バーチャルパッド　ここまで'
17040 'Input "番号:",No
17050 'if No=2 then goto TopScreen:
17060 'if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
17070 'if No=1 then goto Surei_List1:
17080 'if No > 3 or No=0 then ui_msg"無効な数字です、入れ直してください":talk"無効な数字です":goto Kakunin_Surei_count:
17090 'if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
17100 Surei_List1:
17110 cls 3:font 48
17120 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
17130 file$ = dir$(SAVE_DATA1$,0)
17140 'ファイルが無いときの画面
17150 if file$ = ""  then
17160 gload "./data/Gazo/" + "KazutamaList1.png",0
17170 print chr$(13)
17180 color rgb(255,255,255):print "登録ファイルはございません" + chr$(13)
17190 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
17200 'else
17210 'endif
17220 bg = 0:key$ = ""
17230 while (key$ <> chr$(13) and bg<>1)
17240 key$ = inkey$
17250 bg = strig(1)
17260 pause 2
17270 wend
17280 'エンターキーもしくはバーチャルパッドの右でトップに行く
17290 if (bg = 1  or key$ = chr$(13)) then goto TopScreen:
17300 else
17310 cls 3:buffer_list_count = Loadcount()
17320 color rgb(255,255,255)
17330 if lang_flag = 1 then
17340 Else
17350 talk "登録件数は" + str$(buffer_list_count) + "件です"
17360 gload Gazo$ + "KazutamaList1_Entry.png",0
17370 color rgb(0,0,255)
17380 print chr$(13)
17390 color rgb(255,255,255)
17400 print "登録件数:";buffer_list_count;"件";chr$(13)
17410 color rgb(0,0,0)
17420 print "パッドの右を押してください" + chr$(13)
17430 endif
17440 bg = 0:key$ = "":bg2 = 0
17450 while (key$ <> chr$(13) and bg <> 1)
17460 key$ = inkey$
17470 bg = strig(1)
17480 bg2=strig(0)
17490 pause 2
17500 wend
17510 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
17520 if (key$ = chr$(13) or bg = 1) then pause 2:goto KotodamaList_page:
17530 endif
17540 if (bg2 = 1) then pause 2:goto TopScreen:
17550 func Loadcount()
17560 n = 0
17570 'while eof(1)=-1
17580 open SAVE_DATA1$  for input as #1
17590 while eof(1) <> -1
17600 line input #1,line$
17610 n = n + 1
17620 wend
17630 close #1
17640 count = n
17650 endfunc count
17660 count_line = Loadcount()
17670 func Kotodama$(buf$)
17680 color rgb(255,255,255)
17690 b = len("数霊:")
17700 a$ = Mid$(buf$,b+1,len(buf$))
17710 for i=0 to 118
17720 color rgb(255,255,255)
17730 if bufline3$(2 * i) ="数霊:" + a$  then
17740 moji_$ = bufline3$(2*i + 1)
17750 'moji_$ = bufline3$(21)
17760 'moji$ = a$
17770 endif
17780 next i
17790 'kotodama$ = a$
17800 kotodama$ = moji_$
17810 endfunc kotodama$
17820 KotodamaList_page:
17830 cls 3:font 48:m = 0:
17840 gload Gazo$ + "Screen5_Surei_List.png"
17850 if SAVE_DATA1$ = "" then
17860 cls 3:color rgb(255,255,255):print"ファイルがありません"
17870 else
17880 a = Loadcount()
17890 open SAVE_DATA1$  for input as #1
17900 for i=0 to a-1
17910 for n=0 to 1
17920 input #1,line$
17930 bufKaztama$(i,n) = line$
17940 next n
17950 next i
17960 close #1
17970 'endif
17980 l = 0:n=0
17990 gload Gazo$ + "Screen5_Surei_List.png"
18000 while (buffer_list_count >= l)
18010 'while (l<=a)
18020 cls
18030 color rgb(255,0,0)
18040 'print "数霊　リスト" + chr$(13)
18050 print chr$(13)
18060 color rgb(255,255,255)
18070 n=n+1
18080 'while (n <= a)
18090 print chr$(13)
18100 print "番号:";l+1;chr$(13)
18110 print bufKaztama$(l,0) + chr$(13)
18120 print bufKaztama$(l,1) + chr$(13)
18130 'n=n+1
18140 Kmoji$ = moji$
18150 print chr$(13) + chr$(13) + chr$(13)
18160 color rgb(0,0,0)
18170 print " :パッドの左:トップ画面" + chr$(13)
18180 print " :パッドの右:次へ行く" + chr$(13)
18190 'wend
18200 key$ = "":bg = 0:bg2 = 0
18210 while (key$ <> chr$(13) and bg <> 1 and bg2 <> 1)
18220 key$ = inkey$
18230 bg = strig(1)
18240 bg2 = strig(0)
18250 pause 2
18260 wend
18270 'key$ = input$(1)
18280 if (key$ = " " OR bg = 1) then
18290 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
18300 else
18310 if ((bg2 = 1) or (key$=chr$(13))) then
18320    goto TopScreen:
18330 endif
18340 else
18350 goto KotodamaList_page:
18360 endif
18370 wend
18380 'wend
18390 endif
18400 '結果表示２ Menu1
18410 Surei_Result4:
18420 cls 3:font 32+16:init"kb:4"
18430 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
18440 for i=0 to 181 + 3 - 1
18450 if i = count  then
18460 buffer$ = bufline2$(count + 4,0)
18470 endif
18480 next i
18490 if len(buffer$) > 21 and len(buffer$) <= 45 then
18500 buffer2$ = Mid$(buffer$,1,22)
18510 buffer3$ = Mid$(buffer$,23,(len(buffer$) - 22))
18520 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13)
18530 else
18540 if len(buffer$) <= 21 then
18550 buffer2$ = Mid$(buffer$,1,21)
18560 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
18570 else
18580 if len(buffer$) > 45 and len(buffer$) <= 62 then
18590 buffer2$ = Mid$(buffer$,1,22)
18600 buffer3$ = Mid$(buffer$,23,22)
18610 buffer4$ = Mid$(buffer$,44,(len(buffer$)-44))
18620 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13)
18630 else
18640 if len(buffer$) > 64 and len(buffer$) <= 81 then
18650 buffer2$ = Mid$(buffer$,1,22)
18660 buffer3$ = Mid$(buffer$,23,20)
18670 buffer4$ = Mid$(buffer$,44,20)
18680 buffer5$ = Mid$(buffer$,65,(len(buffer$)-65))
18690 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13)
18700 if len(buffer$) > 81 and len(buffer$) <= 110 then
18710 buffer2$ = Mid$(buffer$,1,22)
18720 buffer3$ = Mid$(buffer$,23,20)
18730 buffer4$ = Mid$(buffer$,43,20)
18740 buffer5$ = Mid$(buffer$,63,20)
18750 buffer6$ = Mid$(buffer$,83,(len(buffer$) - 83))
18760 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13)
18770 endif
18780 endif
18790 endif
18800 endif
18810 endif
18820 Surei_Result4_2:
18830 gload Gazo$ + "Screen1_Result2.png"
18840 Result_Menu_List$(0)="1.トップ画面に行く"
18850 Result_Menu_List$(1)="2.数霊のデーターを保存"
18860 Result_Menu_List$(2)="3.もう一度、数霊を調べる"
18870 cls
18880 'color rgb(255,0,0)
18890 'print "診断結果 2" + chr$(13)
18900 print chr$(13)
18910 if lang_flag = 1 then
18920 else
18930 color rgb(127,255,212)
18940 print chr$(13);chr$(13)
18950 print "入力文字:";buffer_moji$;chr$(13)
18960 print "数霊:";count;chr$(13)
18970 color rgb(255,255,255)
18980 print "数霊の説明:"+chr$(13)
18990 print buffer$
19000 color rgb(0,0,0)
19010 locate 0,15
19020 print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
19030 endif
19040 key$ = "":bg = 0:bg2 = 0
19050 while (bg<>1 and bg2<>1)
19060 key$ = inkey$
19070 bg = strig(1)
19080 bg2 = strig(0)
19090 pause 2
19100 wend
19110 if ((bg = 1) or (bg2 = 1)) then
19120 num = ui_select("Result_Menu_List$","番号を選んでください")
19130 endif
19140 if num = 0 then goto TopScreen:
19150 if num = 1 then goto File_save:
19160 if num = 2 then goto Surei_Input:
19170 if num = -1 then goto Surei_Result4
19180 ' if bg=1 then buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
19190 'if key$ = chr$(13) then
19200 'buffer$ = "":buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
19210 'endif
19220 'if bg2=1 then
19230 File_save:
19240 'ファイルがない時
19250 if dir$(SAVE_DATA1$) = " " then
19260 open SAVE_DATA1$ for output as #1
19270 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19280 close #1
19290 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19300 'ファイルが有る時
19310 else
19320 open SAVE_DATA1$ for append as #1
19330 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19340 close #1
19350 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19360 endif
19370 'endif
19380 'if key$="s" or key$="S" then
19390 'if dir$(SAVE_DATA1$) = "" then
19400 'open SAVE_DATA1$ for output as #1
19410 'print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19420 'close #1
19430 'ui_msg"保存しました":talk"保存しました":goto Surei_Result4_2:
19440 'else
19450 'open SAVE_DATA1$ for append as #1
19460 'print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19470 'close #1
19480 'ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19490 'endif
19500 'else
19510 'talk "無効な文字です":goto Surei_Result4_2:
19520 'endif
19530 'endif
19540 func All_clear()
19550 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
19560 endfunc
19570 'ここから
19580 Config_moji1:
19590 cls 3:Font 48
19600 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19610 play ""
19620 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
19630 No=1
19640 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19650 color rgb(0,0,255)
19660 'print "●設定項目" + chr$(13)
19670 print chr$(13)
19680 if lang_flag = 1 then
19690 'lang_flag = 1:英語
19700 else
19710 'lang_flag = 0:日本語
19720 color rgb(255,255,255)
19730 print "番号を選んでください" + chr$(13)
19740 'print " :1.文字の項目" + chr$(13)
19750 'print " :2.結果表示設定" + chr$(13)
19760 print " :1.文字の項目" + chr$(13)
19770 print " :2.結果表示設定" + chr$(13)
19780 print " :3.トップ画面に行く" + chr$(13)
19790 print " :4.終 了" + chr$(13)
19800 endif
19810 color rgb(0,0,0)
19820 locate 1,12
19830 if No = 1 then print "1.文字の項目"
19840 'y:バーチャルパッドの処理
19850 'key$:カーソルの処理
19860 'bg:バーチャルパッドの右ボタン
19870 Config_moji1_Screen:
19880 y = 0:key$ = "":bg=0
19890 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
19900 y = stick(1)
19910 key$ = inkey$
19920 bg=strig(1)
19930 pause 2
19940 wend
19950 'バーチャルパッド　ここから'
19960 'バーチャルパッド　ここから'
19970 if y = 1 then
19980 select case No
19990 'No の初期値：No=1
20000 case 1:
20010 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20020 'デバッグライン　ここから
20030 '0のとき
20040 'デバッグライン　ここまで
20050 'デバッグライン　ここから
20060 case 2:
20070 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
20080 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
20090 'if lang_flag = 1 then
20100 'else
20110 locate 1,12:print "3.トップ画面に行くを選択"
20120 'endif
20130 'cls:color rgb(255,255,255):print"ok"
20140 'デバッグライン　ここまで
20150 case 3:
20160 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
20170 'デバッグライン　ここから
20180 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
20190 'デバッグライン　ここまで
20200 case 0:
20210 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20220 'デバッグライン　ここから
20230 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
20240 'デバッグライン　ここまで
20250 end select
20260 endif
20270 'バーチャルパッド　上 ここから
20280 if y = -1 then
20290 select case No
20300 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
20310 case 1:
20320 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
20330 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
20340 case 0:
20350 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
20360 'No:3 3.Help→2.設定 No:2
20370 case 3:
20380 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20390 case 2:
20400 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
20410 end select
20420 endif
20430 if bg=1 then
20440 select case No
20450 '1.数霊チェックを選択  パッドの右キー
20460 case 1:
20470 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
20480 '2.設定を選択    パッドの右キー
20490 case 2:
20500 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
20510 '3.ヘルプを選択 パッドの右
20520 case 3:
20530 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
20540 'プログラムの終了を選択
20550 case 0:
20560 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
20570 'if lang_flag = 1 then
20580 'Else
20590 ui_msg "プログラムを終了します":end
20600 'endif
20610 end select
20620 endif
20630 '4.終了するを選択  パッドの右
20640 'バーチャルパッド　ここまで'
20650 'SettingScreen:
20660 'key$ = input$(1)
20670 'カーソル下'
20680 if key$ = chr$(31) then
20690 select case (No Mod 4)
20700 '登録文字から数霊文字の確認
20710 case 1:
20720 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
20730 '数霊文字の確認からトップ画面に行く
20740 case 2:
20750 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
20760 'トップ画面に行くから終了
20770 case 3:
20780 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
20790 '終了から登録文字
20800 case 0:
20810 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20820 end select
20830 endif
20840 'カーソル　上
20850 if key$ = chr$(30) then
20860 select case (No Mod 4)
20870 case 1:
20880 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
20890 case 2:
20900 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
20910 case 3:
20920 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
20930 case 0:
20940 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
20950 end select
20960 endif
20970 'エンターキーを押したとき
20980 if key$ = chr$(13) then
20990 if No=3 then goto TopScreen:
21000 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
21010 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
21020 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
21030 'lse
21040 'o'o SettingScreen:
21050 endif
21060 'ここまで
21070 Config_moji2:
21080 cls 3:Font 48
21090 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
21100 play ""
21110 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
21120 No=1
21130 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
21140 color rgb(0,0,255)
21150 'print "●設定項目" + chr$(13)
21160 print chr$(13)
21170 if lang_flag = 1 then
21180 'lang_flag = 1:英語
21190 else
21200 'lang_flag = 0:日本語
21210 color rgb(255,255,255)
21220 print "番号を選んでください" + chr$(13)
21230 'print " :1.文字の項目" + chr$(13)
21240 'print " :2.結果表示設定" + chr$(13)
21250 print " :1.文字の項目" + chr$(13)
21260 print " :2.結果表示設定" + chr$(13)
21270 print " :3.トップ画面に行く" + chr$(13)
21280 print " :4.終 了" + chr$(13)
21290 endif
21300 color rgb(0,0,0)
21310 locate 1,12
21320 if No = 1 then print "1.文字の項目"
21330 'y:バーチャルパッドの処理
21340 'key$:カーソルの処理
21350 'bg:バーチャルパッドの右ボタン
21360 config_moji2:
21370 y = 0:key$ = "":bg=0
21380 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
21390 y = stick(1)
21400 key$ = inkey$
21410 bg = strig(1)
21420 pause 2
21430 wend
21440 'バーチャルパッド　ここから'
21450 'バーチャルパッド　ここから'
21460 if y = 1 then
21470 select case No
21480 'No の初期値：No=1
21490 case 1:
21500 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
21510 'デバッグライン　ここから
21520 '0のとき
21530 'デバッグライン　ここまで
21540 'デバッグライン　ここから
21550 case 2:
21560 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
21570 color rgb(0,0,0)::No=2:goto SettingScreen:
21580 if lang_flag = 1 then
21590 else
21600 locate 0,12:print " 3.トップ画面に行くを選択"
21610 endif
21620 'cls:color rgb(255,255,255):print"ok"
21630 'デバッグライン　ここまで
21640 case 3:
21650 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
21660 'デバッグライン　ここから
21670 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
21680 'デバッグライン　ここまで
21690 case 0:
21700 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21710 'デバッグライン　ここから
21720 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
21730 'デバッグライン　ここまで
21740 end select
21750 endif
21760 'バーチャルパッド　上 ここから
21770 if y = -1 then
21780 select case No
21790 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
21800 case 1:
21810 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
21820 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
21830 case 0:
21840 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
21850 'No:3 3.Help→2.設定 No:2
21860 case 3:
21870 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
21880 case 2:
21890 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
21900 end select
21910 endif
21920 '決定ボタン
21930 if bg=1 then
21940 select case No
21950 '1.数霊チェックを選択  パッドの右キー
21960 case 1:
21970 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
21980 '2.設定を選択    パッドの右キー
21990 case 2:
22000 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
22010 '3.ヘルプを選択 パッドの右
22020 case 3:
22030 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
22040 'プログラムの終了を選択
22050 case 0:
22060 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
22070 'if lang_flag = 1 then
22080 'Else
22090 ui_msg "プログラムを終了します":end
22100 'endif
22110 end select
22120 endif
22130 '4.終了するを選択  パッドの右
22140 'バーチャルパッド　ここまで'
22150 'SettingScreen:
22160 'key$ = input$(1)
22170 'カーソル下'
22180 if key$ = chr$(31) then
22190 select case (No Mod 4)
22200 '登録文字から数霊文字の確認
22210 case 1:
22220 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22230 '数霊文字の確認からトップ画面に行く
22240 case 2:
22250 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
22260 'トップ画面に行くから終了
22270 case 3:
22280 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
22290 '終了から登録文字
22300 case 0:
22310 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
22320 end select
22330 endif
22340 'カーソル　上
22350 if key$ = chr$(30) then
22360 select case (No Mod 4)
22370 case 1:
22380 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
22390 case 2:
22400 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
22410 case 3:
22420 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
22430 case 0:
22440 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
22450 end select
22460 endif
22470 'エンターキーを押したとき
22480 if key$ = chr$(13) then
22490 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
22500 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
22510 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
22520 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
22530 'lse
22540 'o'o SettingScreen:
22550 endif
22560 '結果表示設定
22570 Result_Setting:
22580 color rgb(255,255,255)
22590 'dim list$(4)
22600 'ファイル読み込み
22610 '1.ファイルが有るか無いかのチェック
22620 if Dir$(System$) = "" then
22630 '1-1.ファイルがないとき
22640 '上のSystemフォルダを作成
22650 mkdir "./System/"
22660 list$(0) = "●:出た数字から181を引く"
22670 list$(1) = " :出た数字から180を引き単数変換"
22680 open System$ for output as #1
22690 print #1,"config_r=0"
22700 close #1
22710 ui_msg "ファイルを作成しました"
22720 'ファイル作成
22730 else
22740 '1-2.ファイルが有るとき
22750 'config_r:0 出た数字から181を引く
22760 'config_r:1 出た数字から180を引いて単数変換
22770 'open "./System/config.sys" for input as #1
22780 'ファイルが有るときファイルを読み込み
22790 open System$ for input as #1
22800 line input #1,buf_line$
22810 'buf$にデーターをコピーする
22820 buf$ = buf_line$
22830 close #1
22840 if len(buf$) = 10 then
22850  if left$(buf$,9) = "config_r=" then
22860  buf$ = right$(buf_line$,1)
22870  if buf$ = "1" then
22880    '1.System$ ファイルを削除(config.sys)
22890    '2.1行目をconfig_r=1と書き、保存する
22900    buf_config_r = 1
22910    'list$(0) = "●:1.出た数字から180を引いて単数変換"
22920    'list$(1) = " :2.出た数字から181を引く"
22930    else
22940  if buf$ = "0" then
22950    buf_config_r = 0
22960   ' list$(0) = "●:1.出た数字から181を引く"
22970   'list$(1) = " :2.出た数字から180を引いて単数変換"
22980  endif
22990  endif
23000  endif
23010 endif
23020 endif
23030 '"●:1.出た数字から180を引く"をlist$(0)に代入
23040 if buf_config_r =  0 then
23050 list$(0) = "●:1.出た数字から181を引く"
23060 list$(1) = " :2.出た数字から180を引いて単数変換"
23070 else
23080 list$(0) = "●:1.出た数字から180を引いて単数変換"
23090 list$(1) = " :2.出た数字から181を引く"
23100 endif
23110 list$(2) = " :トップ画面に戻る"
23120 list$(3) = " :終 了"
23130 list_num = ui_select("list$","番号を選んでください")
23140 play ""
23150 Select case (list_num)
23160 case 0:
23170        if buf$ = "1" then
23180        buf_config_r = 0:
23190        'データーを変更したのでファイルを削除
23200        kill System$
23210        'ファイルを新しく作成
23220        open System$ for output as #1
23230        print #1,"config_r=0"
23240        close #1
23250        ui_msg "設定を変更しました。"
23260        else
23270        'if buf$ = "0" then
23280        'buf_config_r = 1
23290        'kill System$
23300        'open Syetem$ for output as #1
23310        'print #1,"config_r=1"
23320        'close #1
23330        'ui_msg "設定を変更しました"
23340        'endif
23350        endif
23360        goto config_moji2:
23370 case 1:
23380        if buf$ = "0" then
23390        buf_config_r = 1:
23400        'データーを変更したので、ファイルを削除
23410        kill System$
23420        'ファイルを新しく作成
23430        open System$ for output as #1
23440        print #1,"config_r=1"
23450        close #1
23460        ui_msg "設定を変更しました"
23470        else
23480        kill System$
23490        if buf$ = "1" then
23500        open System$ for output as #1
23510        print #1,"config_r=0"
23520        close #1
23530        ui_msg "設定を変更しました"
23540        endif
23550        endif
23560        goto config_moji2:
23570 case 2:
23580       'トップ画面に飛ぶ
23590        goto TopScreen:
23600 case 3:
23610       'プログラムを終了する
23620       cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
23630 end select
23640 '単数変換
23650 Func Single_Complate(num)
23660 '1.出てきた数字から180を引く
23670 a = num - 180
23680 'a:10〜99
23690 Re1:
23700 if (a > 9 and a < 100) then
23710  b1 = fix(a / 10)
23720  b2 = 10 * a - b1
23730  d1 = b1 + b2
23740 if c > 9 then
23750  goto Re1:
23760 else
23770  c = d1:goto Re2:
23780 endif
23790 endif
23800 Re2:
23810 buffer = c
23820 endfunc buffer
23830 Func Surei_Result_Save_File()
23840 'ファイルがないとき
23850 if dir$(SAVE_DATA1$) = "" then
23860 open SAVE_DATA1$ for output as #1
23870 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
23880 close #1
23890 ui_msg "保存しました":talk "保存しました":goto Surei_Result:
23900 else
23910 open SAVE_DATA1$ for append as #1
23920 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
23930 close #1
23940 ui_msg "保存しました":talk "保存しました":goto Surei_Result
23950 endif
23960 endfunc
23970 '言語設定
23980 Setting_Language:
23990 cls 3:gload Gazo$ + "Screen1.png":screen 1,1,1:No=2
24000 init "Kb:4"
24010 sp_on 1,1:sp_on 0,0
24020 sp_put 0,(0,300),0,0
24030 sp_put 1,(0,400),1,0
24040 color rgb(0,0,255)
24050 'print "番号を選んでください"+chr$(13)
24060 'if lang_flag=0 then
24070 'print "言語設定:日本語"+chr$(13)
24080 'else
24090 'print "言語設定:英 語"+chr$(13)
24100 Change_Language:
24110 if lang_flag = 1 then
24120 cls
24130 print "It has changed Language"+chr$(13)
24140 color rgb(255,255,255)
24150 print "Select the Number"+chr$(13)
24160 print " :1.English → Japanse"+chr$(13)
24170 print " :2.It goes to TopScreen"+chr$(13)
24180 print "Language:In English" +chr$(13)
24190 else
24200 cls:color rgb(255,255,255)
24210 print "設定変更(言語の変更)" + chr$(13)
24220 color rgb(255,255,255)
24230 print chr$(13)
24240 print "番号を選んでください"+chr$(13)
24250 print " :1.日本語 → 英語に変更" + chr$(13)
24260 print " :2.トップ画面に戻る" + chr$(13)
24270 print chr$(13)
24280 print "設定言語:日本語" + chr$(13)
24290 endif
24300 color rgb(0,0,0)
24310 locate 0,15:print "                                       ":locate 0,15:print "2.トップ画面に戻る　を選択" + chr$(13)
24320 Setting_Language_key:
24330 y=0:key$="":bg=0
24340 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y<> -1 and bg<> 1)
24350 y=stick(1)
24360 key$=inkey$
24370 bg=strig(1)
24380 pause 2
24390 wend
24400 '選択肢変更
24410 if ((y=1) or (y=-1)) then
24420 select case No
24430 case 2:
24440      '実装部分　ここから
24450      pause 200:No=1:sp_on 0,1:sp_on 1,0:locate 0,15:print "                                                         ":locate 0,15:print "1.日本語 → 英語に変更を選択": goto Setting_Language_key:
24460      '実装部分　ここまで
24470 case 1:
24480       pause 200: No=2:sp_on 0,0:sp_on 1,1:locate 0,15:print "                                                       ":locate 0,15:print "2.トップ画面に戻る を選択":goto Setting_Language_key:
24490 end select
24500 endif
24510 'Enter Key  決定ボタン
24520 if ((key$=chr$(13)) or (bg=1)) then
24530 select case No
24540 case 2:
24550         sp_on 0,0:sp_on 1,0:goto TopScreen:
24560 case 1:                                                     'lang_flag=1:sp_on 0,0:sp_on 1,0:goto Change_Language:
24570       '
24580 '未実装　ここから
24590  sp_on 0,1:sp_on 1,0:ui_msg "この機能は未実装です":goto Setting_Language_key:
24600 '
24610 '未実装　ここまで
24620 end select
24630 endif
24640  '配列削除
24650 buffer_clear:
24660 erase bufline$
24670 erase bufcount$
24680 erase bufcount1$
24690 erase bufcount2$
24700 erase bufline2$
24710 erase bufline3$
24720 erase bufKaztama$
24730 erase List$
24740 erase Result_Menu_List$
24750 erase list$
24760 erase moji_List$
24770 ui_msg "メモリーをクリアしました"
24780 return
24790 '配列削除　ここまで
