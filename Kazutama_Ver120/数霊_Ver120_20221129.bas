100 '数霊(かずたま) 製作開始日:2021.07.28
110 'デバッグライン　ここから3:locate 1,12:print "15120 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
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
300 'Version 1.0.3_2022.03.27(Release)  正式版
310 'Version 1.0.9_2022.10.20(Release):正式版
320 'Version 1.1.1_2022.11.04(Release):正式版
330 'Version 1.1.2_2022.11.05(Release):正式版
340 'Version 1.1.3_2022.11.06(Release):正式版
350 'Version 1.1.4_2022.11.09(Release):正式版
360 'Version 1.1.6_2022.11.12(Release):正式版
370 'Version 1.1.7_2022.11.16(Release):正式版
380 'Version 1.1.8_2022.11.23(Release):正式版
390 'Version 1.2.0_2022.11.30-2022.11.02(Release):正式版
400 '現在のバージョン
410 Version$ = "1.2.0_2022.12.02(正式版)"
420 'csvファイル 1.数霊 ベースファイル
430 FILE_csv$ = "data/Kazutama.csv"
440 'csvファイル 2.数霊 ベースファイル 2
450 FILE_csv2$ = "data/Surei_chart_20211207.csv"
460 'Save ファイル
470 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
480 'gazo ファイル
490 Gazo$ = "data/Gazo/"
500 'System フォルダ:設定ファイルを保存するところ
510 System$ = "System/config.sys"
520 '設定ファイル名:config.sys
530 'Sound File(Voice)
540 '1.ボイス TopScreen
550 Voice_File_TopScreen$ = "data/Sound_data/"
560 '変数領域
570 'vcount:バーチャルパッド下の変数
580 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50):c=1:vcount=0:timer=0
590 count2 = 0:N=0:N2=0:m2 = 0
600 dim list$(4),moji_List$(2)
610 'ファイルの有無チェック
620 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
630 '1.ファイルが無いとき
640 cls :print "依存ファイルが見つかりません":
650 print "エンターキーを押してください" + chr$(13)
660 key$ = input$(1)
670 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
680 else
690 '2.ファイルが有るとき
700 cls:print "csv:file ok." + chr$(13)
710 n=0
720 open FILE_csv$ for input as #1
730 while eof(1) = 0
740 input #1,line$
750 'print line$
760 bufline$(n) = line$
770 'Print n;chr$(13)
780 n = n + 1
790 wend
800 close #1
810 N=n
820 '2つ目のファイル読み込み
830 'n = 0
840 open FILE_csv2$ for input as #2
850 for n=3 to 181
860 for i=0 to 1
870 input #2,line$
880 bufline2$(n,i) = line$
890 next i
900 next n
910 close #2
920 N2 = n
930 '
940 endif
950 '設定ファイルの読み込み
960 open System$ for input as #1
970 line input #1,buf_line$
980  if len(buf_line$) = 10 then
990   if left$(buf_line$,9)="config_r=" then
1000    buf$=right$(buf_line$,1)
1010    if buf$ = "1" then
1020       buf_config_r = 1
1030    else
1040       buf_config_r = 0
1050    endif
1060   endif
1070 endif
1080 close #1
1090 'or j = 3 to 181+3
1100 'ufline3$(j - 3,n) = bufline2$(i,n)
1110 'next j
1120 'moji$ = Kotodama$(bufline3$(16))
1130 'erase bufline2$
1140 '2022.11.23----------------------
1150 '端末言語のチェック
1160 '日本語端末かチェックをして日本語以外なら英語で表示する
1170 'lang flag:0:日本語 1:英語(日本語以外)
1180 '--------------------------------
1190 lang_flag = 0
1200 if ex_info$(1) <> "JP" then
1210 lang_flag = 1
1220 endif
1230 'Top画面
1240 TopScreen:
1250 'バーチャルパッドを表示
1260 cls 3:font 48:screen 1,1,1:init"kb:4"
1270 'play ""
1280 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
1290 gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
1300 '選択肢 1
1310 gload Gazo$ + "Selection.png",1,5,200
1320 '選択肢 2
1330 gload Gazo$ + "Selection.png",1,5,300
1340 '選択肢 3
1350 gload Gazo$ + "Selection.png",1,5,400
1360 '選択肢 4
1370 gload Gazo$ + "Selection.png",1,5,500
1380 color rgb(0,0,255)
1390 print chr$(13)
1400 if lang_flag = 1 then
1410 color rgb(255,255,255)
1420 print "Select Number" + chr$(13)
1430 print " :1.Kazutama check" + chr$(13)
1440 print " :2.Setting" + chr$(13)
1450 print " :3.Help" + chr$(13)
1460 print " :4.End Program" + chr$(13)
1470 color rgb(255,255,255)
1480 else
1490 color rgb(255,255,255)
1500 print "番号を選んでください" + chr$(13)
1510 print " :1.数霊(かずたま)チェック" + chr$(13)
1520 print " :2.設定" + chr$(13)
1530 print " :3.ヘルプ" + chr$(13)
1540 print " :4.終　了" + chr$(13)
1550 color rgb(0,0,0)
1560 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
1570 'バーチャルパッドを表示
1580 No=1:
1590 'lang_flag:1 外国語,0:日本語
1600 if lang_flag = 1 then
1610 'lang_flag=1 英語
1620 else
1630 'lang_flag=0 日本語
1640 locate 0,12:color rgb(0,0,0):print "1.数霊(かずたま)チェックを選択";chr$(13)
1650 endif
1660 endif
1670 'スプライト
1680 '選択肢 1 On
1690 sp_def 0,(5,200),32,32
1700 sp_on 0,1
1710 sp_put 0,(5,200),0,0
1720 '選択肢 2 Off
1730 sp_def 1,(5,300),32,32
1740 sp_on 1,0
1750 sp_put 1,(5,300),0,0
1760 '選択肢 3 Off
1770 sp_def 2,(5,400),32,32
1780 sp_on 2,0
1790 sp_put 2,(5,400),0,0
1800 '選択肢 4 Off
1810 sp_def 3,(5,500),32,32
1820 sp_on 3,0
1830 sp_put 3,(5,500),0,0
1840 color rgb(0,0,0)
1850 Main_Select:
1860 'y:バーチャルパッドの処理
1870 'key$:カーソルの処理
1880 y = 0:key$ = "":bg = 0
1890 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
1900 y = stick(1)
1910 key$ = inkey$
1920 bg = strig(1)
1930 pause 2
1940 wend
1950 'if y=1 then
1960 'select case (No Mod 4)
1970 'ase 0:
1980 '     c=1:No=c:sp_on 0,1:sp_on 1,0 :sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print " 数霊(かずたま)チェックを選択":beep:goto Main_Select:
1990 'case 1:
2000 '       =2:No=c:sp_on 0,0:
2010 '"ase 2:
2020 'ase 3:
2030 'nd select
2040 'ndif
2050 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
2060 '1.バーチャルパッドの処理
2070 'バーチャルパッド下を押した時
2080 if y = 1 then
2090 select case No
2100 'No の初期値：No=1
2110 case 1:
2120 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":
2130 if lang_flag = 1 then
2140 'lang_flag=1 英語
2150 else
2160 'lang_flag=0 日本語
2170 locate 0,12:print "2.設定を選択":goto Main_Select:
2180 endif
2190 'デバッグライン　ここから
2200 '0のとき
2210 'デバッグライン　ここまで
2220 'デバッグライン　ここから
2230 'バーチャルパッド　下
2240 case 2:
2250 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:
2260 if lang_flag = 1 then
2270 else
2280 print "                                         ":
2290 color rgb(0,0,0):locate 0,12:
2300 print "3.ヘルプを選択":No=3:goto Main_Select:
2310 endif
2320 'cls:color rgb(255,255,255):print"ok"
2330 'デバッグライン　ここまで
2340 case 3:
2350 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                               "
2360 if lang_flag = 1 then
2370 else
2380 locate 0,12:print "4.終了を選択":No=0:goto Main_Select:
2390 endif
2400 'デバッグライン　ここから
2410 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
2420 'デバッグライン　ここまで
2430 case 0:
2440 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1
2450 if lang_flag = 1 then
2460 'lang_flag=1:英語
2470 else
2480 'lang_flag=0:日本語
2490 locate 0,12:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
2500 'endif
2510 endif
2520 'デバッグライン　ここから
2530 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
2540 'デバッグライン　ここまで
2550 end select
2560 endif
2570 'バーチャルパッド　上 ここから
2580 if y = -1 then
2590 select case No
2600 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
2610 case 1:
2620 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       "
2630 if lang_flag = 1 then
2640 'lang_flag=1 英語
2650 else
2660 'lang_flag=0 日本語
2670 locate 0,12:print "4.終了を選択":goto Main_Select:
2680 endif
2690 'endif
2700 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
2710 case 0:
2720 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":
2730 if lang_flag = 1 then
2740 '1:英語
2750 else
2760 '0:日本語
2770 locate 0,12:print "3.ヘルプを選択":goto Main_Select:
2780 endif
2790 'No:3 3.Help→2.設定 No:2
2800 case 3:
2810 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      "
2820 if lang_flag = 1 then
2830 '1:英語
2840 else
2850 '0:日本語
2860 locate 0,12:print"2.設定を選択":goto Main_Select:
2870 endif
2880 case 2:
2890 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":
2900 if lang_flag = 1 then
2910 'lang_flag 1 英語
2920 else
2930 'lang_flag 0 日本語
2940 locate 0,12:print"1.数霊(かずたま)チェックを選択":goto Main_Select:
2950 endif
2960 end select
2970 endif
2980 if bg=1 then
2990 select case No
3000 '1.数霊チェックを選択  パッドの右キー(決定)
3010 case 1:
3020 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
3030 '2.設定を選択  パッドの右キー(決定)
3040 case 2:
3050 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
3060 '3.ヘルプを選択 パッドの右(決定)
3070 case 3:
3080 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
3090 'プログラムの終了を選択(決定)
3100 case 0:
3110 cls 3:cls 4:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:
3120 if lang_flag = 1 then
3130 'lang_flag = 1 英語
3140 else
3150 'lang_flag = 0 日本語
3160 ui_msg "プログラムを終了します":color rgb(255,255,255):end
3170 endif
3180 end select
3190 '4.終了するを選択  パッドの右
3200 endif
3210 'バーチャルパッド　上　ここまで
3220 '2.カーソルの処理
3230 'カーソル　下 chr$(31)
3240 if (key$ = chr$(31)) then
3250 select case (No)
3260 '4
3270 '0 選択肢4 => 選択肢1
3280 case 0:
3290 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "              ":color rgb(0,0,0):
3300 if lang_flag = 1 then
3310 'lang flag:1 英語
3320 else
3330 'lang flag:0 日本語
3340 color rgb(0,0,0):locate 0,12:print "1.数霊(かずたま)チェックを選択":beep:goto Main_Select:
3350 endif
3360 '1 選択肢1 => 選択肢2
3370 case 1:
3380 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":
3390 if lang_flag = 1 then
3400 'lang_flag:1 英語
3410 else
3420 'lang_flag:0 日本語
3430 color rgb(0,0,0):locate 0,12:print "2.設定を選択":beep:goto Main_Select:
3440 endif
3450 '2 選択肢2 => 選択肢3
3460 case 2:
3470 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "               ":
3480 if lang_flag = 1 then
3490 'lang flag:1 英語
3500 else
3510 'lang flang:0 日本語
3520 color rgb(0,0,0):locate 0,12:print "3.ヘルプを選択":beep:goto Main_Select:
3530 endif
3540 '3 選択肢３ => 選択肢4
3550 case 3:
3560 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "               ":color rgb(0,0,0)
3570 if lang_flag = 1 then
3580 'lang_flag = 1 英語
3590 else
3600 'lang_flag = 0 日本語
3610 color rgb(0,0,0):locate 0,12:print "4.終 了を選択":beep:goto Main_Select:
3620 endif
3630 case else:
3640 goto Main_Select:
3650 end select
3660 endif
3670 'カーソル　上
3680 if key$=chr$(30) then
3690 select case (No)
3700 '選択肢1 => 選択肢4
3710 case 1:
3720 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:PRINT "                      ":
3730 if lang_flag = 1 then
3740 'lang_flag=1:英語
3750 else
3760 'lang_flag = 0:日本語
3770 else
3780 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
3790 endif
3800 '選択肢2 => 選択肢1
3810 case 2:
3820 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                 ":locate 1,12:beep:print "2.設 定を選択":beep:goto Main_Select:
3830 '選択肢3　=> 選択肢2
3840 case 3:
3850 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0
3860 if lang_flag = 1 then
3870 'lang_flag = 1:英語
3880 else
3890 'lang_flag = 0:日本語
3900 locate 0,12:beep:print "3.ヘルプを選択":goto Main_Select:
3910 endif
3920 '選択肢4 => 選択肢3
3930 case 0:
3940 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 1,12:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
3950 if lang_flag = 1 then
3960 'lang flag=1 英語
3970 else
3980 'lang flag=0 日本語
3990 locate 1,12:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
4000 endif
4010 end select
4020 endif
4030 'Input "番号:",No
4040 'エンターキー入力:決定
4050 if key$ = chr$(13) then
4060 select case No
4070 case 1:
4080 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4090 case 3:
4100 Color rgb(255,255,255):goto Help:
4110 case 0:
4120 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg "プログラムを終了します":color rgb(255,255,255):end
4130 case 2:
4140 color rgb(255,255,255):goto Setting:
4150 'else
4160 'goto Main_Select:
4170 end select
4180 endif
4190 'ndif
4200 'if N0=0 or No>4 then goto TopScreen:
4210 '1-1.数霊チェック
4220 Surei_Check:
4230 cls 3:Font 48:
4240 'gload Gazo$ + "Screen4.png"
4250 gload Gazo$ + "Screen1_Sureicheck_Top20211226.png"
4260 play ""
4270 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
4280 color rgb(255,0,0)
4290 'print "●数霊(かずたま)チェックトップ" + chr$(13)
4300 sp_on 0,1:sp_put 0,(5,200),0,0:screen 1,1,1
4310 if lang_flag = 1 then
4320 'lang_flag=1 英語
4330 else
4340 'lang_flag=0 日本語
4350 print chr$(13)
4360 color rgb(255,255,255)
4370 print "番号を選んでください" + chr$(13)
4380 print " :1.数霊(かずたま)1人用" + chr$(13)
4390 print " :2.数霊(かずたま)2人用" + chr$(13)
4400 print " :3.前の画面に戻る" + chr$(13)
4410 print " :4.終 了" + chr$(13)
4420 color rgb(0,0,0):No = 1
4430 locate 0,12
4440 print "1.数霊1人用を選択"
4450 endif
4460 Kazutama_main:
4470 'y:バーチャルパッドの処理
4480 'key$:カーソルの処理
4490 'bg:バーチャルパッドの右のボタン
4500 y = 0:key$ = "":bg=0
4510 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
4520 y = stick(1)
4530 key$ = inkey$
4540 bg=strig(1)
4550 pause 2
4560 wend
4570 'key$ = input$(1)
4580 if y = 1 then
4590 select case No
4600 'No の初期値：No=1
4610 case 1:
4620 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":
4630 if lang_flag=1 then
4640 else
4650 locate 0,12
4660 print"2.数霊(かずたま)2人用を選択":goto Kazutama_main:
4670 endif
4680 'デバッグライン　ここから
4690 '0のとき
4700 'デバッグライン　ここまで
4710 'デバッグライン　ここから
4720 case 2:
4730 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                               "
4740 color rgb(0,0,0):locate 1,12:print "3.前の画面に戻るを選択":No=3:goto Kazutama_main:
4750 'cls:color rgb(255,255,255):print"ok"
4760 'デバッグライン　ここまで
4770 case 3:
4780 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Kazutama_main:
4790 'デバッグライン　ここから
4800 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
4810 'デバッグライン　ここまで
4820 case 0:
4830 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.数霊(かずたま)1人用を選択":goto Surei_Input:
4840 'デバッグライン　ここから
4850 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
4860 'デバッグライン　ここまで
4870 end select
4880 endif
4890 'バーチャルパッド　上 ここから
4900 if y = -1 then
4910 select case No
4920 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
4930 case 1:
4940 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択":goto Kazutama_main:
4950 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
4960 case 0:
4970 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.ヘルプを選択":goto Kazutama_main:
4980 'No:3 3.Help→2.設定 No:2
4990 case 3:
5000 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.設定を選択":goto Kazutama_main:
5010 case 2:
5020 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.数霊(かずたま)チェックを選択":goto Kazutama_main:
5030 end select
5040 endif
5050 if bg=1 then
5060 select case No
5070 '1.数霊チェックを選択  パッドの右キー
5080 case 1:
5090 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
5100 '2.設定を選択    パッドの右キー
5110 case 2:
5120 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
5130 '3.ヘルプを選択 パッドの右
5140 case 3:
5150 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
5160 'プログラムの終了を選択
5170 case 0:
5180 cls 3:cls 4:ui_msg "プログラムを終了します":color rgb(255,255,255):end
5190 end select
5200 '4.終了するを選択  パッドの右
5210 endif
5220 'バーチャルパッド　上　ここまで
5230 if key$ = chr$(31) then
5240 select case No
5250 case 0:
5260 No=1:sp_on 0,0:sp_on 1,1:sp_put 0,(5,300),0,0:locate 1,12:print "                                                          ":
5270 if lang_flag = 1 then
5280 Else
5290 No=2:locate 0,12:print "2.数霊(かずたま)2人用を選択":goto Kazutama_main:
5300 endif
5310 case 1:
5320 No=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                                          ":
5330 if lang_flag = 1 then
5340 Else
5350 locate 1,12:print"3.前の画面に戻るを選択":goto Kazutama_main:
5360 endif
5370 case 2:
5380 No=3:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print"                                       ":
5390 if lang_flag = 1 then
5400 Else
5410 locate 1,12:print"4.終了を選択":goto Kazutama_main:
5420 endif
5430 case 3:
5440 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":
5450 if lang_flag = 1 then
5460 Else
5470 No=1:locate 1,12:print"1.数霊（かずたま)1人用を選択":goto Kazutama_main:
5480 endif
5490 end select
5500 endif
5510 if key$=chr$(13) then
5520 select case No
5530 case 1:
5540 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
5550 case 2:
5560 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
5570 case 3:
5580 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
5590 case 0:
5600 cls 4:cls 3:talk"プログラムを終了します":ui_text"プログラムを終了します":end
5610 end select
5620 endif
5630 'Input "番号:",No
5640 '前の画面に戻る
5650 'if No = 3 then goto TopScreen:
5660 'プログラムの終了
5670 'if No = 4 then cls 3:pLAY"":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":COLOR rgb(255,255,255):end
5680 '1人用
5690 'if No = 1 then goto Surei_Input:
5700 '2人用
5710 'if No = 2 then goto Surei_twoParson:
5720 'if No > 4 or No=0 then ui_msg"もう一度入れてください":goto Surei_Check:
5730 '数霊(かずたま) 文字入力  1人用
5740 Surei_Input:
5750 if mode = 0 then
5760 cls 3:font 32:init"kb:2"
5770 gload Gazo$ + "InputKotodama_20211226.png"
5780 play""
5790 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
5800 color rgb(255,0,0)
5810 'print "●数霊(かずたま)文字入力(1回目)" + chr$(13)
5820 if lang_flag=1 then
5830 '英語
5840 else
5850 print chr$(13)
5860 color rgb(0,0,0)
5870 print "文字を入れてください" + chr$(13)
5880 color rgb(255,0,0)
5890 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
5900 print chr$(13)
5910 color rgb(0,0,0)
5920 Input "入力文字:",buffer_moji$
5930 if buffer_moji$ = "" then
5940 ui_msg "未入力です":goto Surei_Input:
5950 'endif
5960 else
5970 goto Surei_Result:
5980 endif
5990 endif
6000 endif
6010 'else
6020 if mode = 1 then
6030 cls 3:Font 32:
6040 gload Gazo$ + "InputKotodama.png"
6050 color rgb(255,0,0)
6060 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
6070 color rgb(255,255,255)
6080 print "文字を入れてください" + chr$(13)
6090 color rgb(255,0,0)
6100 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
6110 print "大文字のみ)" + chr$(13)
6120 color rgb(0,0,0)
6130 Input "文字入力:",buffer_moji2$
6140 goto Surei_Result3:
6150 'endif
6160 endif
6170 '数霊(かずたま)文字入力　2人用
6180 Surei_twoParson:
6190 cls 3:Font 32:init"kb:2"
6200 gload Gazo$ + "InputKotodama_20211226.png"
6210 '1人目入力
6220 if lang_flag = 1 then
6230 'color rgb(255,0,0)
6240 else
6250 print ""+chr$(13)
6260 'print "●数霊(かずたま) 1人目 入力" + chr$(13)
6270 color rgb(255,0,0)
6280 print "1人目の文字を入れてください" + chr$(13)
6290 color rgb(255,0,0)
6300 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
6310 color rgb(0,0,0)
6320 print chr$(13)
6330 Input "1人目文字入力:",buf_Parson1$
6340 endif
6350 Surei_twoParson2:
6360 cls 3:Font 32:init"kb:2"
6370 '2人目入力
6380 gload Gazo$ + "InputKotodama_20211226.png"
6390 'color rgb(255,0,0)
6400 'print "●数霊(かずたま) 2人目 入力" + chr$(13)
6410 if lang_falg = 1 then
6420 else
6430 print ""+chr$(13)
6440 print "2人目の文字を入れてください" + chr$(13)
6450 color rgb(255,0,0)
6460 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
6470 color rgb(0,0,0)
6480 Input "2人目の文字入力:",buf_Parson2$
6490 goto Surei_Result2:
6500 endif
6510 '数霊　計算 パート
6520 '文字の計算関数
6530 'moji$:1文字を入れる
6540 func Complate(moji$)
6550 for n = 1 to 116
6560 if moji$ = bufline$(2*n) then
6570 buffcount = val(bufline$(2 * n + 1))
6580 endif
6590 next n
6600 endfunc buffcount
6610 '数霊　結果表示
6620 Surei_Result:
6630 cls 3:Font 32
6640 'ゼロカウント:zcount
6650 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
6660 '例 アカい:"い"の文字は無効な文字なので、はじく
6670 zcount=0
6680 'mojicount:入力文字数
6690 mojicount = len(buffer_moji$)
6700 for n=1 to mojicount
6710 for j=1 to 118
6720 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
6730 if bufcount$(n - 1) = bufline$(2 * j) then
6740 endif
6750 next j
6760 next n
6770 'if mojicount > zcount then
6780 'cls 3:ui_msg "無効な文字です":talk "無効な文字があります。":zcount = 0:goto Surei_Input:
6790 'endif
6800 for i = 1 to mojicount
6810 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
6820 if bufcount$(i-1) = "ン" then
6830    'Listを表示する
6840    moji_List$(0) = "この単語は目に見える物です"
6850    moji_List$(1) = "この単語は目に見えない物です"
6860    num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
6870    if num2 = 0 then n1 = 1
6880    if num2 = 1 then n1 = 10
6890    '
6900 else
6910    'bufcount$(i-1) = Mid$(buffer_moji$,i,1)
6920    n1 = Complate(bufcount$(i - 1))
6930    'count = count + n1:count2 = count
6940 endif
6950    count = count + n1:count2 = count
6960 next i
6970 '182以上のとき,181を引く
6980 if buf_cofig_r = 0 then
6990 if (count > 181) then count = count - 181
7000 else
7010 if (buf_config_r = 1) then
7020 count2 = count2 - 180
7030 count = Single_Complate(count2)
7040 endif
7050 endif
7060 'if config_r = 0 then
7070 cls 3:Font 48+16
7080 gload Gazo$ + "Result_Screen3_20211226.png"
7090 if lang_flag = 1 then
7100 else
7110 color rgb(255,0,0)
7120 print "入力文字:" + buffer_moji$ + chr$(13)
7130 endif
7140 'print chr$(13)
7150 if lang_flag = 1 then
7160 else
7170 color rgb(0,0,255)
7180 print "数霊(かずたま):";count;chr$(13)
7190 endif
7200 if lang_flag = 1 then
7210 else
7220 color rgb(0,0,0)
7230 print "エンターキー:トップ" + chr$(13)
7240 print "スペース:次 へ" + chr$(13)
7250 'endif
7260 endif
7270 key$ = input$(1)
7280 if key$ = " " then goto Surei_Result4:
7290 if key$ = chr$(13) then
7300 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
7310 for i=0 to 9
7320 bufcount$(i) = " "
7330 next i
7340 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
7350 'else
7360 'if key$ = " " then
7370 '２回めの入力に行く
7380 'mode = 1:goto Surei_Input:
7390 'else
7400 'if key$ = "s" or key$ = "S" then
7410 'ファイルを保存する
7420 's = Save()
7430 'ui_msg"保存しました"
7440 'n = 0:count = 0:count2 = 0:mode = 0:mojicount = 0:n1 = 0:zcount = 0:goto TopScreen:
7450 else
7460 goto Surei_Result:
7470 'endif
7480 endif
7490 '3-1 バージョン情報
7500 Version:
7510 cls 3:Font 32
7520 gload Gazo$ + "Screen1_Version.png"
7530 play ""
7540 play Voice_File_TopScreen$ + "Voice_Version.mp3"
7550 color rgb(255,0,0)
7560 'print"●バージョン情報"+chr$(13)
7570 print chr$(13)
7580 color rgb(255,255,255)
7590 if lang_flag = 1 then
7600 else
7610 print "Ver:";Version$ + chr$(13)
7620 print "アプリ名:数霊"+ chr$(13)
7630 print "Basic for Android Runtime" + chr$(13)
7640 print "Author:licksjp" + chr$(13)
7650 print "制作開始:2021.7.28" + chr$(13)
7660 print chr$(13)
7670 print "(C)Copy right licksjp " + chr$(13)
7680 print "All rights reserved" + chr$(13)
7690 color rgb(0,0,0)
7700 print "パッドの右を押してください" + chr$(13)
7710 endif
7720 'key$ = input$(1)
7730 bg=0:key$=""
7740 while (bg <> 1 and key$ <> chr$(13))
7750 bg = strig(1)
7760 key$ = inkey$
7770 pause 2
7780 wend
7790 if key$ = chr$(13) then
7800 goto TopScreen:
7810 'else
7820 'talk "無効なキーです":goto Version:
7830 else
7840 if bg=1 then
7850 goto TopScreen:
7860 else
7870 if lang_flag = 1 then
7880 else
7890 talk "無効なキーです":goto Version:
7900 endif
7910 endif
7920 endif
7930 '3-2 参考文献
7940 Reference_Book:
7950 cls 3:Font 48:play""
7960 gload Gazo$ + "Screen1_Reference.png"
7970 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
7980 color rgb(255,0,0)
7990 'print"●参考文献" + chr$(13)
8000 print chr$(13)
8010 if lang_flag = 1 then
8020 else
8030 color rgb(255,255,255)
8040 print "書名:数霊" + chr$(13)
8050 print "出版社:徳間書店" + chr$(13)
8060 print "ISBN:978-4-19-" + chr$(13)
8070 print "         865309-5" + chr$(13)
8080 print "定価:2300円 + 税" + chr$(13)
8090 color rgb(0,0,0)
8100 print "パッドの右を押してください"
8110 endif
8120 bg = 0:key$ = ""
8130 while (bg <> 1 and key$ <> chr$(13))
8140 bg = strig(1)
8150 key$ = inkey$
8160 pause 2
8170 wend
8180 if key$ = chr$(13) then
8190 goto TopScreen:
8200 'else
8210 'talk "無効なキーです":goto Reference_Book:
8220 else
8230 if bg = 1 then
8240 goto TopScreen:
8250 else
8260 talk "無効なキーです":goto Reference_Book:
8270 endif
8280 endif
8290 'key$=input$(1)
8300 'if key$=chr$(13) then
8310 'goto TopScreen:
8320 'else
8330 'talk"無効なキーです":goto Reference_Book:
8340 'endif
8350 'ヘルプ画面　トップ画面
8360 Help:
8370 No=1:c=0
8380 play ""
8390 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
8400 cls 3:Font 48:
8410 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
8420 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0
8430 color rgb(255,0,0)
8440 'print "●3.ヘルプ　トップ画面" + chr$(13)
8450 print chr$(13)
8460 color rgb(255,255,255)
8470 print "番号を選んでください" + chr$(13)
8480 print " :1.バージョン" + chr$(13)
8490 print " :2.参考文献" + chr$(13)
8500 print " :3.トップ画面" + chr$(13)
8510 print " :4.終 了" + chr$(13)
8520 color rgb(0,0,0)
8530 if No = 1 then print " バージョンを選択"
8540 'y:バーチャルパッドの処理
8550 'key$:カーソルの処理
8560 'bg:バーチャルパッドの右ボタン
8570 Help_key:
8580 y = 0:key$ = "":bg=0
8590 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
8600 y = stick(1)
8610 key$ = inkey$
8620 bg=strig(1)
8630 pause 2
8640 wend
8650 'バーチャルパッド　ここから'
8660 if y = 1 then
8670 select case No
8680 'No の初期値：No=1
8690 case 1:
8700 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.参考文献を選択":goto Help_key:
8710 if lang_flag = 1 then
8720 else
8730 locate 1,12:print"2.参考文献を選択":goto Help_key:
8740 endif
8750 'デバッグライン　ここから
8760 '0のとき
8770 'デバッグライン　ここまで
8780 'デバッグライン　ここから
8790 case 2:
8800 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 1,12:print "                  "
8810 color rgb(0,0,0):locate 1,12:print "3.トップ画面に行くを選択":No=3:goto Help_key:
8820 'cls:color rgb(255,255,255):print"ok"
8830 'デバッグライン　ここまで
8840 case 3:
8850 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print "                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Help_key:
8860 'デバッグライン　ここから
8870 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
8880 'デバッグライン　ここまで
8890 case 0:
8900 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.バージョンを選択":goto Help_key:
8910 'デバッグライン　ここから
8920 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
8930 'デバッグライン　ここまで
8940 end select
8950 endif
8960 'バーチャルパッド　上 ここから
8970 if y = -1 then
8980 select case No
8990 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
9000 case 1:
9010 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Kazutama_main:
9020 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
9030 case 0:
9040 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面に行くを選択":goto Kazutama_main:
9050 'No:3 3.Help→2.設定 No:2
9060 case 3:
9070 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.参考文献を選択":goto Kazutama_main:
9080 case 2:
9090 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.バージョンを選択":goto Kazutama_main:
9100 end select
9110 endif
9120 if bg = 1 then
9130 select case No
9140 '1.数霊チェックを選択  パッドの右キー
9150 case 1:
9160 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
9170 '2.設定を選択    パッドの右キー
9180 case 2:
9190 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
9200 '3.ヘルプを選択 パッドの右
9210 case 3:
9220 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
9230 'プログラムの終了を選択
9240 case 0:
9250 cls 3:cls 4:color rgb(255,255,255):end
9260 if lang_flag = 1 then
9270 'lang_flag = 1:英語
9280 Else
9290 'lang_flag = 0:日本語
9300 print "プログラムを終了します"
9310 endif
9320 end select
9330 '4.終了するを選択  パッドの右
9340 endif
9350 'バーチャルパッド　上　ここまで
9360 'バーチャルパッド　ここまで'
9370 'key$ = input$(1)
9380 'カーソルの下
9390 if key$ = chr$(31) then
9400 select case (No Mod 4)
9410 'バージョンから参考文献
9420 case 0:
9430 c=1:No=c:locate 0,12:Print "             ":locate 0,12:print " 参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
9440 '参考文献からトップ画面
9450 case 1:
9460 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "            ":locate 0,12:print " トップ画面を選択":goto Help_key:
9470 'トップ画面から終了
9480 case 2:
9490 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                ":locate 0,12:print " 終 了を選択":goto Help_key:
9500 '終了からバージョン
9510 case 3:
9520 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                     ":locate 0,12:print " バージョンを選択":goto Help_key:
9530 case else:
9540 goto Help_key:
9550 end select
9560 endif
9570 'カーソル　上
9580 if key$ = chr$(30) then
9590 select case (c Mod 4)
9600 'バージョンから終了
9610 case 0:
9620 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:locate 0,12:print "                   ":locate 0,12:print " 終 了を選択":goto Help_key:
9630 '参考文献からバージョン
9640 case 1:
9650 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                   ":locate 0,12:print " バージョンを選択":goto Help_key:
9660 'トップ画面から参考文献
9670 case 2:
9680 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:locate 0,12:print "                    ":locate 0,12:print " 参考文献を選択":goto Help_key:
9690 '終了からトップ画面を選択
9700 case 3:
9710 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print"                      ":locate 0,12:print " トップ画面を選択":goto Help_key:
9720 case else:
9730 goto Help_key:
9740 end select
9750 endif
9760 'Input "番号:",No
9770 'sp_def 0,(5,200),32,32
9780 'エンターキー：決定
9790 if key$=chr$(13) then
9800 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
9810 if No=3 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
9820 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
9830 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg "プログラムを終了します":cls 3:cls 4:end
9840 else
9850 goto Help_key:
9860 endif
9870 'if (No = 0 or No > 4) then ui_msg "もう一度入れてください":play "":talk "もう一度、入れてください":goto Help:
9880 '登録文字の確認
9890 '文字を1文字入れて登録されているか調べるメニュー
9900 '設定項目
9910 Setting:
9920 cls 3:Font 48
9930 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
9940 play ""
9950 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
9960 No=1
9970 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
9980 color rgb(0,0,255)
9990 'print "●設定項目" + chr$(13)
10000 print chr$(13)
10010 if lang_flag = 1 then
10020 'lang_flag = 1:英語
10030 else
10040 'lang_flag = 0:日本語
10050 color rgb(255,255,255)
10060 print "番号を選んでください" + chr$(13)
10070 '-------コメント----------------
10080 'print " :1.登録文字の確認" + chr$(13)
10090 'print " :2.数霊文字確認" + chr$(13)
10100 '-------コメント----------------
10110 print " :1.文字の項目" + chr$(13)
10120 print " :2.結果表示設定" + chr$(13)
10130 print " :3.トップ画面に行く" + chr$(13)
10140 print " :4.終 了" + chr$(13)
10150 endif
10160 color rgb(0,0,0)
10170 locate 1,12
10180 if No=1 then print "1.文字の項目を選択"
10190 'y:バーチャルパッドの処理
10200 'key$:カーソルの処理
10210 'bg:バーチャルパッドの右ボタン
10220 SettingScreen:
10230 y = 0:key$ = "":bg=0
10240 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
10250 y = stick(1)
10260 key$ = inkey$
10270 bg=strig(1)
10280 pause 2
10290 wend
10300 'バーチャルパッド　ここから'
10310 'バーチャルパッド　ここから'
10320 if y = 1 then
10330 select case No
10340 'No の初期値：No=1
10350 case 1:
10360 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":color rgb(0,0,0):locate 1,12:print "2.結果表示設定を選択":goto SettingScreen:
10370 'デバッグライン　ここから
10380 '0のとき
10390 'デバッグライン　ここまで
10400 'デバッグライン　ここから
10410 case 2:
10420 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                         "
10430 color rgb(0,0,0)::No=3
10440 if lang_flag = 1 then
10450 else
10460 locate 1,12:print "3.トップ画面に行くを選択":goto SettingScreen:
10470 endif
10480 'cls:color rgb(255,255,255):print"ok"
10490 'デバッグライン　ここまで
10500 case 3:
10510 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                              ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
10520 'デバッグライン　ここから
10530 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
10540 'デバッグライン　ここまで
10550 case 0:
10560 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.文字の項目を選択":goto SettingScreen:
10570 'デバッグライン　ここから
10580 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
10590 'デバッグライン　ここまで
10600 end select
10610 endif
10620 'バーチャルパッド　上 ここから
10630 if y = -1 then
10640 select case No
10650 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
10660 case 1:
10670 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択":goto SettingScreen:
10680 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
10690 case 0:
10700 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
10710 'No:3 3.Help→2.設定 No:2
10720 case 3:
10730 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.結果表示設定を選択":goto SettingScreen:
10740 case 2:
10750 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.文字の項目を選択":goto SettingScreen:
10760 end select
10770 endif
10780 if bg=1 then
10790 select case No
10800 '1.数霊チェックを選択  パッドの右キー
10810 case 1:
10820 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
10830 '2.設定を選択    パッドの右キー
10840 case 2:
10850 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
10860 '3.ヘルプを選択 パッドの右
10870 case 3:
10880 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
10890 'プログラムの終了を選択
10900 case 0:
10910 cls 3:cls 4::color rgb(255,255,255):pause 2.052*1000:end
10920 if lang_flag = 1 then
10930 Else
10940 ui_msg "プログラムを終了します"
10950 endif
10960 end select
10970 endif
10980 '4.終了するを選択  パッドの右
10990 'バーチャルパッド　ここまで'
11000 'SettingScreen:
11010 'key$ = input$(1)
11020 'カーソル下'
11030 if key$ = chr$(31) then
11040 select case (No Mod 4)
11050 '登録文字から数霊文字の確認
11060 case 1:
11070 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                     ":locate 1,12:print "2.結果表示設定を選択":goto SettingScreen:
11080 '数霊文字の確認からトップ画面に行く
11090 case 2:
11100 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
11110 'トップ画面に行くから終了
11120 case 3:
11130 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
11140 '終了から登録文字
11150 case 0:
11160 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print "1.文字の項目を選択":goto SettingScreen:
11170 end select
11180 endif
11190 'カーソル　上
11200 if key$ = chr$(30) then
11210 select case (No Mod 4)
11220 case 1:
11230 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
11240 case 2:
11250 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
11260 case 3:
11270 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
11280 case 0:
11290 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
11300 end select
11310 endif
11320 'エンターキーを押したとき
11330 if key$ = chr$(13) then
11340 if No=3 then goto TopScreen:
11350 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
11360 'if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji1:
11370 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
11380 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:color rgb(255,255,255):pause 3*120:end
11390 'lse
11400 'o'o SettingScreen:
11410 endif
11420 'endif
11430 'endif
11440 '文字検索項目  ここから
11450 Moji_Search:
11460 cls 4:cls 3:Font 32+16:init"kb:2"
11470 gload Gazo$ + "Moji_Search_Result.png"
11480 play ""
11490 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
11500 print "" + chr$(13)
11510 color rgb(255,0,0)
11520 if lang_flag = 1 then
11530 Else
11540 print "文字を一文字入れてください" + chr$(13)
11550 endif
11560 color rgb(0,0,0)
11570 if lang_flag=1 then
11580 Else
11590 Input "登録文字:",moji$
11600 endif
11610 moji_count = len(moji$)
11620 if moji_count > 1 then
11630 if lang_flag = 1 then
11640 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Setting:
11650 Else
11660 endif
11670 else
11680 count=0
11690 for n = 0 to 116
11700 if bufline$(2*n) = moji$ then
11710 cls 3:font 48:init"kb:4"
11720 gload Gazo$ + "Moji_Search_Result.png"
11730 'talk"この文字は登録されています"
11740 play ""
11750 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
11760 if lang_flag = 1 then
11770 Else
11780 print chr$(13)
11790 color rgb(255,0,0)
11800 print moji$;"は、登録されています。" + chr$(13)
11810 color rgb(0,0,0)
11820 print "エンターキーを押してください"
11830 endif
11840 bg = 0:key$ = ""
11850 while (bg <> 1 and key$ <> chr$(13))
11860 key$ = inkey$
11870 bg = strig(1)
11880 pause 2
11890 wend
11900 'y$=input$(1)
11910 if key$ = chr$(13) then goto TopScreen:
11920 if bg=1 then goto TopScreen:
11930 count = count + 1
11940 endif
11950 next n
11960 if count = 0 then
11970 cls 3:font 48:init "kb:2"
11980 gload Gazo$ + "Moji_check.png"
11990 play ""
12000 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
12010 print chr$(13)
12020 if lang_flag = 1 then
12030 Else
12040 color rgb(255,0,0)
12050 print moji$;"は、登録されていません。" + chr$(13)
12060 color rgb(0,0,0)
12070 print "パッドの右を押してください" + chr$(13)
12080 endif
12090 kg = 0:key$ = ""
12100 while (kg <> 1 and key$ <> chr$(13))
12110 key$ = inkey$
12120 kg = strig(1)
12130 pause 2
12140 wend
12150 if key$ = chr$(13) then goto TopScreen:
12160 endif
12170 endif
12180 Surei_Result2:
12190 cls 3:Font 48
12200 zcount1=0:zcount2=0:count1=0:count2=0
12210 '1人目
12220 mojicount1=len(buf_Parson1$)
12230 '2人目
12240 mojicount2 = len(buf_Parson2$)
12250 '1人目
12260 for n = 1 to mojicount1
12270 for j = 1 to 116
12280 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
12290 if bufcount1$(n-1) = bufline$(2*j) then
12300 zcount1 = zcount1 + 1
12310 endif
12320 next j
12330 next n
12340 '2人目
12350 for n = 1 to mojicount2
12360 for j = 1 to 116
12370 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
12380 if bufcount2$(n-1) = bufline$(2*j) then
12390 zount2 = zcount2 + 1
12400 endif
12410 next j
12420 next n
12430 '1人目
12440 for i=1 to mojicount1
12450 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
12460 p1 = Complate(bufcount1$(i-1))
12470 count1 = count1 + p1
12480 next i
12490 '2人目
12500 for i = 1 to mojicount2
12510 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
12520 p2 = Complate(bufcount2$(i-1))
12530 count2 = count2 + p2
12540 next i
12550 cls 3:
12560 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
12570 color rgb(255,0,0)
12580 'print "数霊 2人用 結果表示"+chr$(13)
12590 print ""+chr$(13)
12600 if lang_flag = 1 then
12610 else
12620 color rgb(255,255,255)
12630 print "1人目:";buf_Parson1$;chr$(13)
12640 print "数霊1:";count1;chr$(13)
12650 print "2人目:";buf_Parson2$;chr$(13)
12660 print "数霊2:";count2;chr$(13)
12670 print "数霊(合計):";count1 + count2;chr$(13)
12680 color rgb(0,0,0)
12690 print "エンターキーを押してください" + chr$(13)
12700 endif
12710 key$ = "":bg = 0
12720 'ey$=input$(1)
12730 while (bg <> 1 and key$ <> chr$(13))
12740 bg = strig(1)
12750 key$ = inkey$
12760 pause 2
12770 wend
12780 if (bg = 1 or key$ = chr$(13))  then goto TopScreen:
12790 Surei_Result3:
12800 cls 3:Font 48
12810 zcount2 = 0:count2 = 0
12820 mojicount2 = len(buffer_moji2$)
12830 for n = 1 to mojicount2
12840 for j = 1 to 116
12850 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
12860 if bufcount2$(n - 1) = bufline$(2 * j) then
12870 zcount2 = zcount2 + 1
12880 endif
12890 next j
12900 next n
12910 for i = 1 to mojicount2
12920 n2 = Complate(bufcount2$(i-1))
12930 count2 = count2 + n2
12940 next i
12950 gload Gazo$ + "Screen5.png"
12960 if lang_flag = 1 then
12970 else
12980 color rgb(255,0,0)
12990 print "数霊の結果表示" + chr$(13)
13000 color rgb(255,255,255)
13010 print "１回目回の文字入力:";buffer_moji$;chr$(13)
13020 print "１回目の数霊(かずたま)";count;chr$(13)
13030 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
13040 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
13050 color rgb(0,0,0)
13060 print "エンターキー:トップ画面";chr$(13)
13070 print "c or C キー:数霊の比較";chr$(13)
13080 endif
13090 key$ = "":bg = 0
13100 while (key$ <> chr$(13) and bg <> 1)
13110 bg = strig(1)
13120 key$ = inkey$
13130 pause 2
13140 wend
13150 'key$ = input$(1)
13160 if bg = 1 then goto TopScreen:
13170 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
13180 if key$ = "c" or key$ = "C" then
13190 if count = count2 then
13200 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
13210 else
13220 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
13230 endif
13240 endif
13250 Moji_Count_Check:
13260 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
13270 cls 3:Font 48
13280 gload Gazo$ + "Moji_check.png"
13290 n = 0
13300 open FILE_csv$ for input as #1
13310 while eof(1) = 0
13320 line input #1, line$
13330 n = n + 1
13340 wend
13350 close #1
13360 'n = n - 1
13370 'talk "登録文字数は"+str$(n)+"文字です"
13380 play ""
13390 if n = 118 then
13400 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
13410 if lang_flag = 1 then
13420 else
13430 'talk "登録文字数は、" + str$(n) + "文字です"
13440 print "" + chr$(13)
13450 color rgb(255,0,0)
13460 print "文字の登録文字数は";n;"文字" + chr$(13)
13470 color rgb(0,0,0)
13480 print "パッドの右を押してください" + chr$(13)
13490 endif
13500 endif
13510 'key$ = input$(1)
13520 key$ = "":bg = 0
13530 while (key$ <> chr$(13) and bg <> 1)
13540 key$=inkey$
13550 bg=strig(1)
13560 pause 2
13570 wend
13580 if bg = 1 then goto TopScreen:
13590 if key$ = chr$(13) then
13600 goto TopScreen:
13610 else
13620 goto Moji_Count_Check:
13630 endif
13640 'Save 関数
13650 file_kazutama = 0
13660 file_kazutama = Save_File()
13670 func Save_File()
13680 open SAVE_DATA1$  for output as #1
13690 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
13700 close #1
13710 endfunc
13720 Select_moji:
13730 cls 3:font 48:No = 1
13740 gload Gazo$ + "Screen1_mojicheck.png"
13750 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
13760 color rgb(255,0,0)
13770 'print "文字の確認" + chr$(13)
13780 if lang_flag = 1 then
13790 else
13800 print chr$(13)
13810 color rgb(255,255,255)
13820 print "番号を選んでください" + chr$(13)
13830 print " :1.登録文字検索"+ chr$(13)
13840 print " :2.登録文字数の確認" + chr$(13)
13850 print " :3.前の画面に戻る" + chr$(13)
13860 print " :4.終　了" + chr$(13)
13870 color rgb(0,0,0)
13880 if No = 1 then print "1.登録文字の確認を選択"
13890 endif
13900 Entry_check_key:
13910 y = 0:key$ = "":bg=0
13920 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
13930 y = stick(1)
13940 key$ = inkey$
13950 bg=strig(1)
13960 pause 2
13970 wend
13980 'バーチャルパッド　ここから'
13990 'バーチャルパッド　ここから'
14000 if y = 1 then
14010 select case No
14020 'No の初期値：No=1
14030 case 1:
14040 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.登録文字数の確認":goto Entry_check_key:
14050 'デバッグライン　ここから
14060 '0のとき
14070 'デバッグライン　ここまで
14080 'デバッグライン　ここから
14090 case 2:
14100 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                                       "
14110 :No=3:goto Entry_check_key:
14120 if lang_flag = 1 then
14130 Else
14140 color rgb(0,0,0):locate 0,12:print " 3.トップ画面に行く"
14150 endif
14160 'cls:color rgb(255,255,255):print"ok"
14170 'デバッグライン　ここまで
14180 case 3:
14190 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Entry_check_key:
14200 'デバッグライン　ここから
14210 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
14220 'デバッグライン　ここまで
14230 case 0:
14240 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_check_key:
14250 'デバッグライン　ここから
14260 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
14270 'デバッグライン　ここまで
14280 end select
14290 endif
14300 'バーチャルパッド　上 ここから
14310 if y = -1 then
14320 select case No
14330 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
14340 case 1:
14350 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Entry_check_key:
14360 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
14370 case 0:
14380 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                      ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
14390 'No:3 3.Help→2.設定 No:2
14400 case 3:
14410 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.登録文字数の確認を選択":goto Entry_check_key:
14420 case 2:
14430 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_check_key:
14440 end select
14450 endif
14460 if bg=1 then
14470 select case No
14480 '1.数霊チェックを選択  パッドの右キー
14490 case 1:
14500 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
14510 '2.設定を選択    パッドの右キー
14520 case 2:
14530 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
14540 '3.ヘルプを選択 パッドの右
14550 case 3:
14560 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
14570 'プログラムの終了を選択
14580 case 0:
14590 cls 3:cls 4::color rgb(255,255,255):pause 2.052 * 1000:end
14600 if lang_flag = 1 then
14610 else
14620 ui_msg "プログラムを終了します"
14630 endif
14640 end select
14650 endif
14660 '4.終了するを選択  パッドの右
14670 'バーチャルパッド　ここまで'
14680 'key$ = input$(1)
14690 'カーソルの下
14700 if key$ = chr$(31) then
14710 select case (No Mod 4)
14720 case 0:
14730 c=1:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
14740 case 1:
14750 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:sp_on 3,0:goto Entry_check_key:
14760 case 2:
14770 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:goto Entry_check_key:
14780 case 3:
14790 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
14800 end select
14810 endif
14820 'カーソル　上
14830 if key$ = chr$(30) then
14840 select case (No Mod 4)
14850 case 0:
14860 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
14870 case 1:
14880 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
14890 case 2:
14900 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
14910 case 3:
14920 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
14930 end select
14940 endif
14950 'エンターキーを押す
14960 if key$ = chr$(13) then
14970 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
14980 if No = 2 then goto Moji_Count_Check:
14990 if No = 3 then goto TopScreen:
15000 if No = 0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg
15010 endif
15020 '
15030 Kakunin_Surei_count:
15040 cls 3:font 48:No=1
15050 gload Gazo$ + "Kazutama_List_Top.png"
15060 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,200),0,0
15070 color rgb(255,0,0)
15080 print chr$(13)
15090 color rgb(255,255,255)
15100 if lang_flag = 1 then
15110 else
15120 print "番号を選んでください" + chr$(13)
15130 print " :1.数霊リスト 1人用" + chr$(13)
15140 print " :2.結果表示設定" + chr$(13)
15150 print " :3.トップ画面に行く" + chr$(13)
15160 print " :4.終 了" + chr$(13)
15170 print "" + chr$(13)
15180 endif
15190 color rgb(0,0,0)
15200 locate 0,12:print"                                                         "
15210 if No = 1 then locate 1,12:print "1.数霊リスト　1人用を選択"
15220 Entry_List:
15230 y = 0:key$ = "":bg=0
15240 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
15250 y = stick(1)
15260 key$ = inkey$
15270 bg = strig(1)
15280 pause 2
15290 wend
15300 'バーチャルパッド　ここから'
15310 'バーチャルパッド　ここから'
15320 'バーチャルパッド　下
15330 if y = 1 then
15340 select case No
15350 'No の初期値：No=1
15360 case 1:
15370 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.結果表示設定":goto Entry_List:
15380 'デバッグライン　ここから
15390 '0のとき
15400 'デバッグライン　ここまで
15410 'デバッグライン　ここから
15420 case 3:
15430 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,12:print "                                       "
15440 color rgb(0,0,0):locate 1,12:print "4.終了を選択":No=0:goto Entry_List:
15450 'cls:color rgb(255,255,255):print"ok"
15460 'デバッグライン　ここまで
15470 case 0:
15480 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,200),0,0:pause 200:locate 0,12:print"                                       ":locate 0,12:print "1.数霊リスト 1人用を選択":No=1:goto Entry_List:
15490 case 2:
15500 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 1,12:print "                                      ":No=2:locate 1,12:print "3．トップ画面に行く":goto Entry_List:
15510 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print "                        15110 'デバッグライン　ここから3:locate 1,12:print "15120 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
15520 case 1:
15530 'デバッグライン　ここから
15540 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
15550 'デバッグライン　ここまで
15560 'case 0:
15570 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字検索を選択":goto Entry_List:
15580 'デバッグライン　ここから
15590 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
15600 'デバッグライン　ここまで
15610 end select
15620 endif
15630 'バーチャルパッド　上 ここから
15640 if y = -1 then
15650 select case No
15660 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15670 case 1:
15680 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 1,12:print "                                       ":locate 1,12:print "4.終了を選択"::goto Entry_List:
15690 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15700 case 0:
15710 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print "                                      ":locate 1,12:print"2.トップ画面に行くを選択":goto Entry_List:
15720 'No:3 3.Help→2.設定 No:2
15730 case 2:
15740 sp_on 1,0:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.数霊リスト 1人用を選択":goto Entry_List:
15750 'case 2:
15760 'sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字検索を選択":goto Entry_List:
15770 end select
15780 endif
15790 if bg = 1 then
15800 select case No
15810 '1.数霊リスト 一人用を選択を選択  パッドの右キー
15820 case 1:
15830 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
15840 '2.設定を選択  パッドの右キー
15850 case 2:
15860 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
15870 '4.終了を選択 パッドの右
15880 case 0:
15890 cls 3:cls 4:color rgb(255,255,255):
15900 if lang_flag = 1 then
15910 Else
15920 ui_msg"プログラムを終了します":end
15930 endif
15940 'プログラムの終了を選択
15950 end select
15960 endif
15970 '4.終了するを選択  パッドの右
15980 'バーチャルパッド　ここまで'
15990 'Input "番号:",No
16000 'if No=2 then goto TopScreen:
16010 'if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:end
16020 'if No=1 then goto Surei_List1:
16030 'if No > 3 or No=0 then ui_msg"無効な数字です、入れ直してください":talk"無効な数字です":goto Kakunin_Surei_count:
16040 'if No=2 then ui_msg"未実装です":goto Kakunin_Surei_count:
16050 Surei_List1:
16060 cls 3:font 48
16070 file$ = dir$(SAVE_DATA1$,0)
16080 'ファイルが無いときの画面
16090 if file$ = ""  then
16100 gload "./data/Gazo/" + "KazutamaList1.png",0
16110 print chr$(13)
16120 color rgb(255,0,0):print "登録ファイルはございません" + chr$(13)
16130 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
16140 'else
16150 endif
16160 bg = 0:key$ = ""
16170 while (key$ <> chr$(13) and bg<>1)
16180 key$ = inkey$
16190 bg = strig(1)
16200 pause 2
16210 wend
16220 'エンターキーもしくはバーチャルパッドの右でトップに行く
16230 if (bg = 1 or key$ = chr$(13)) then goto TopScreen:
16240 'else
16250 cls 3:buffer_list_count = Loadcount()
16260 if lang_flag = 1 then
16270 Else
16280 talk"登録件数は" + str$(buffer_list_count) + "件です"
16290 gload Gazo$ + "KazutamaList1_Entry.png",0
16300 color rgb(0,0,255)
16310 print chr$(13)
16320 color rgb(255,0,0)
16330 print "登録件数:";buffer_list_count;"件";chr$(13)
16340 color rgb(0,0,0)
16350 print "パッドの右を押してください" + chr$(13)
16360 endif
16370 bg = 0:key$ = ""
16380 while (key$ <> chr$(13) and bg <> 1)
16390 key$ = inkey$
16400 bg = strig(1)
16410 pause 2
16420 wend
16430 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
16440 if (key$ = chr$(13) or bg = 1) then pause 2:goto KotodamaList_page:
16450 'endif
16460 func Loadcount()
16470 n = 0
16480 open SAVE_DATA1$  for input as #1
16490 while eof(1) = 0
16500 line input #1,line$
16510 n = n + 1
16520 wend
16530 close #1
16540 count_line = n
16550 endfunc count_line
16560 func Kotodama$(buf$)
16570 color rgb(255,255,255)
16580 b = len("数霊:")
16590 a$ = Mid$(buf$,b+1,len(buf$))
16600 for i=0 to 118
16610 color rgb(255,255,255)
16620 if bufline3$(2 * i) ="数霊:" + a$  then
16630 moji_$ = bufline3$(2*i + 1)
16640 'moji_$ = bufline3$(21)
16650 'moji$ = a$
16660 endif
16670 next i
16680 'kotodama$ = a$
16690 kotodama$ = moji_$
16700 endfunc kotodama$
16710 KotodamaList_page:
16720 cls 3:font 48:m = 0:
16730 gload Gazo$ + "Screen5_Surei_List.png"
16740 if SAVE_DATA1$ = "" then
16750 cls 3:print"ファイルがありません"
16760 else
16770 open SAVE_DATA1$  for input as #1
16780 while 2*buffer_list_count > m
16790 input #1,line$
16800 bufKaztama$(m) = line$
16810 m = m + 1
16820 wend
16830 close #1
16840 endif
16850 l = 0
16860 gload Gazo$ + "Screen5_Surei_List.png"
16870 while buffer_list_count > l
16880 cls
16890 color rgb(255,0,0)
16900 'print "数霊　リスト" + chr$(13)
16910 print chr$(13)
16920 color rgb(255,255,255)
16930 'n3 = l:l = l + 1
16940 print "番号:";l+1;chr$(13)
16950 print bufKaztama$(l) + chr$(13)
16960 print bufKaztama$(l + 1) + chr$(13)
16970 'n3 = l:l = l + 1
16980 Kmoji$ = moji$
16990 print chr$(13) + chr$(13)
17000 color rgb(0,0,0)
17010 print "パッドの左:トップ画面" + chr$(13)
17020 print "パッドの右:次へ行く" + chr$(13)
17030 key$="":bg=0:bg2=0
17040 while (key$ <> chr$(13) and bg <> 1 and bg2 <> 1)
17050 key$ = inkey$
17060 bg = strig(1)
17070 bg2 = strig(0)
17080 pause 2
17090 wend
17100 'key$ = input$(1)
17110 if (key$ = " " or bg2 = 1) then
17120 l = ((l + 1) Mod buffer_list_count):pause 1.58*1000
17130 else
17140 if (key$ = chr$(13) or bg = 1) then
17150 goto TopScreen:
17160 else
17170 goto KotodamaList_page:
17180 endif
17190 endif
17200 wend
17210 '
17220 '結果表示２ Menu1
17230 Surei_Result4:
17240 cls 3:font (48-16):init"kb:4"
17250 'buffer2$="":buffer3$="":buffer4$="":buffer5$="":buffer$=""
17260 for i=0 to 181 + 3 - 1
17270 if i = count  then
17280 buffer$ = bufline2$(count + 4,0)
17290 endif
17300 next i
17310 if len(buffer$) > 23 and len(buffer$) <= 45 then
17320 buffer2$ = Mid$(buffer$,1,24)
17330 buffer3$ = Mid$(buffer$,25,(len(buffer$) - 25))
17340 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)
17350 else
17360 if len(buffer$) <= 23 then
17370 buffer2$ = Mid$(buffer$,1,22)
17380 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
17390 else
17400 if len(buffer$) > 45 and len(buffer$) <= 64 then
17410 buffer2$ = Mid$(buffer$,1,22)
17420 buffer3$ = Mid$(buffer$,23,20)
17430 buffer4$ = Mid$(buffer$,43,(len(buffer$)-43))
17440 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)+chr$(13)
17450 else
17460 if len(buffer$) > 64 and len(buffer$) <= 81 then
17470 buffer2$ = Mid$(buffer$,1,23)
17480 buffer3$ = Mid$(buffer$,24,20)
17490 buffer4$ = Mid$(buffer$,42,20)
17500 buffer5$ = Mid$(buffer$,63,(len(buffer$)-62))
17510 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13) + chr$(13) + chr$(13)
17520 if len(buffer$) > 81 and len(buffer$) <= 110 then
17530 buffer2$ = Mid$(buffer$,1,21)
17540 buffer3$ = Mid$(buffer$,22,20)
17550 buffer4$ = Mid$(buffer$,42,20)
17560 buffer5$ = Mid$(buffer$,62,20)
17570 buffer6$ = Mid$(buffer$,82,(len(buffer$) - 82))
17580 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13) + chr$(13) + chr$(13)
17590 endif
17600 endif
17610 endif
17620 endif
17630 endif
17640 Surei_Result4_2:
17650 gload Gazo$ + "Screen1_Result2.png"
17660 cls
17670 color rgb(255,0,0)
17680 'print "診断結果 2" + chr$(13)
17690 print chr$(13)
17700 if lang_flag = 1 then
17710 else
17720 color rgb(127,255,212)
17730 print "入力文字:";buffer_moji$;chr$(13)
17740 print "数霊:";count;chr$(13)
17750 color rgb(255,255,255)
17760 print "数霊の説明:"+chr$(13)
17770 print buffer$
17780 color rgb(0,0,0)
17790 print "(パッド 左):保存,S(パッド 右):トップ画面" + chr$(13)
17800 endif
17810 key$ = "":bg = 0:bg2 = 0
17820 while (key$<>chr$(13) and bg<>1 and bg2<>1)
17830 key$=inkey$
17840 bg=strig(1)
17850 bg2=strig(0)
17860 pause 2
17870 wend
17880 if bg=1 then buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
17890 if key$ = chr$(13) then
17900 buffer$ = "":buffer_moji$="":count=0:count2=0:mojicount=0:n1=0:zcount=0:goto TopScreen:
17910 endif
17920 if bg2=1 then
17930 'ファイルがない時
17940 if dir$(SAVE_DATA1$) = "" then
17950 open SAVE_DATA1$ for output as #1
17960 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
17970 close #1
17980 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
17990 'ファイルが有る時
18000 else
18010 open SAVE_DATA1$ for append as #1
18020 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18030 close #1
18040 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
18050 endif
18060 endif
18070 if key$="s" or key$="S" then
18080 if dir$(SAVE_DATA1$) = "" then
18090 open SAVE_DATA1$ for output as #1
18100 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18110 close #1
18120 ui_msg"保存しました":talk"保存しました":goto Surei_Result4_2:
18130 else
18140 open SAVE_DATA1$ for append as #1
18150 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
18160 close #1
18170 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
18180 endif
18190 else
18200 talk "無効な文字です":goto Surei_Result4_2:
18210 endif
18220 'endif
18230 func All_clear()
18240 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
18250 endfunc
18260 'ここから
18270 Config_moji1:
18280 cls 3:Font 48
18290 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
18300 play ""
18310 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
18320 No=1
18330 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
18340 color rgb(0,0,255)
18350 'print "●設定項目" + chr$(13)
18360 print chr$(13)
18370 if lang_flag = 1 then
18380 'lang_flag = 1:英語
18390 else
18400 'lang_flag = 0:日本語
18410 color rgb(255,255,255)
18420 print "番号を選んでください" + chr$(13)
18430 'print " :1.文字の項目" + chr$(13)
18440 'print " :2.結果表示設定" + chr$(13)
18450 print " :1.文字の項目" + chr$(13)
18460 print " :2.結果表示設定" + chr$(13)
18470 print " :3.トップ画面に行く" + chr$(13)
18480 print " :4.終 了" + chr$(13)
18490 endif
18500 color rgb(0,0,0)
18510 locate 1,12
18520 if No = 1 then print "1.文字の項目"
18530 'y:バーチャルパッドの処理
18540 'key$:カーソルの処理
18550 'bg:バーチャルパッドの右ボタン
18560 Config_moji1_Screen:
18570 y = 0:key$ = "":bg=0
18580 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
18590 y = stick(1)
18600 key$ = inkey$
18610 bg=strig(1)
18620 pause 2
18630 wend
18640 'バーチャルパッド　ここから'
18650 'バーチャルパッド　ここから'
18660 if y = 1 then
18670 select case No
18680 'No の初期値：No=1
18690 case 1:
18700 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
18710 'デバッグライン　ここから
18720 '0のとき
18730 'デバッグライン　ここまで
18740 'デバッグライン　ここから
18750 case 2:
18760 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
18770 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
18780 if lang_flag = 1 then
18790 else
18800 locate 1,12:print "3.トップ画面に行くを選択"
18810 endif
18820 'cls:color rgb(255,255,255):print"ok"
18830 'デバッグライン　ここまで
18840 case 3:
18850 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
18860 'デバッグライン　ここから
18870 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
18880 'デバッグライン　ここまで
18890 case 0:
18900 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
18910 'デバッグライン　ここから
18920 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
18930 'デバッグライン　ここまで
18940 end select
18950 endif
18960 'バーチャルパッド　上 ここから
18970 if y = -1 then
18980 select case No
18990 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
19000 case 1:
19010 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
19020 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
19030 case 0:
19040 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
19050 'No:3 3.Help→2.設定 No:2
19060 case 3:
19070 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
19080 case 2:
19090 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
19100 end select
19110 endif
19120 if bg=1 then
19130 select case No
19140 '1.数霊チェックを選択  パッドの右キー
19150 case 1:
19160 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
19170 '2.設定を選択    パッドの右キー
19180 case 2:
19190 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
19200 '3.ヘルプを選択 パッドの右
19210 case 3:
19220 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
19230 'プログラムの終了を選択
19240 case 0:
19250 cls 3:cls 4::color rgb(255,255,255):pause 2.052*1000:end
19260 if lang_flag = 1 then
19270 Else
19280 ui_msg "プログラムを終了します"
19290 endif
19300 end select
19310 endif
19320 '4.終了するを選択  パッドの右
19330 'バーチャルパッド　ここまで'
19340 'SettingScreen:
19350 'key$ = input$(1)
19360 'カーソル下'
19370 if key$ = chr$(31) then
19380 select case (No Mod 4)
19390 '登録文字から数霊文字の確認
19400 case 1:
19410 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
19420 '数霊文字の確認からトップ画面に行く
19430 case 2:
19440 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
19450 'トップ画面に行くから終了
19460 case 3:
19470 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
19480 '終了から登録文字
19490 case 0:
19500 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
19510 end select
19520 endif
19530 'カーソル　上
19540 if key$ = chr$(30) then
19550 select case (No Mod 4)
19560 case 1:
19570 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
19580 case 2:
19590 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
19600 case 3:
19610 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
19620 case 0:
19630 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
19640 end select
19650 endif
19660 'エンターキーを押したとき
19670 if key$ = chr$(13) then
19680 if No=3 then goto TopScreen:
19690 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
19700 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
19710 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:color rgb(255,255,255):pause 3*120:end
19720 'lse
19730 'o'o SettingScreen:
19740 endif
19750 'ここまで
19760 Config_moji2:
19770 cls 3:Font 48
19780 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19790 play ""
19800 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
19810 No=1
19820 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19830 color rgb(0,0,255)
19840 'print "●設定項目" + chr$(13)
19850 print chr$(13)
19860 if lang_flag = 1 then
19870 'lang_flag = 1:英語
19880 else
19890 'lang_flag = 0:日本語
19900 color rgb(255,255,255)
19910 print "番号を選んでください" + chr$(13)
19920 'print " :1.文字の項目" + chr$(13)
19930 'print " :2.結果表示設定" + chr$(13)
19940 print " :1.文字の項目" + chr$(13)
19950 print " :2.結果表示設定" + chr$(13)
19960 print " :3.トップ画面に行く" + chr$(13)
19970 print " :4.終 了" + chr$(13)
19980 endif
19990 color rgb(0,0,0)
20000 locate 1,12
20010 if No = 1 then print "1.文字の項目"
20020 'y:バーチャルパッドの処理
20030 'key$:カーソルの処理
20040 'bg:バーチャルパッドの右ボタン
20050 config_moji2:
20060 y = 0:key$ = "":bg=0
20070 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
20080 y = stick(1)
20090 key$ = inkey$
20100 bg = strig(1)
20110 pause 2
20120 wend
20130 'バーチャルパッド　ここから'
20140 'バーチャルパッド　ここから'
20150 if y = 1 then
20160 select case No
20170 'No の初期値：No=1
20180 case 1:
20190 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 1,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
20200 'デバッグライン　ここから
20210 '0のとき
20220 'デバッグライン　ここまで
20230 'デバッグライン　ここから
20240 case 2:
20250 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
20260 color rgb(0,0,0)::No=3:goto SettingScreen:
20270 if lang_flag = 1 then
20280 else
20290 locate 1,12:print "3.トップ画面に行くを選択"
20300 endif
20310 'cls:color rgb(255,255,255):print"ok"
20320 'デバッグライン　ここまで
20330 case 3:
20340 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 1,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
20350 'デバッグライン　ここから
20360 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
20370 'デバッグライン　ここまで
20380 case 0:
20390 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
20400 'デバッグライン　ここから
20410 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
20420 'デバッグライン　ここまで
20430 end select
20440 endif
20450 'バーチャルパッド　上 ここから
20460 if y = -1 then
20470 select case No
20480 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
20490 case 1:
20500 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 1,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
20510 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
20520 case 0:
20530 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 1,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
20540 'No:3 3.Help→2.設定 No:2
20550 case 3:
20560 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 1,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
20570 case 2:
20580 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 1,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
20590 end select
20600 endif
20610 '決定ボタン
20620 if bg=1 then
20630 select case No
20640 '1.数霊チェックを選択  パッドの右キー
20650 case 1:
20660 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
20670 '2.設定を選択    パッドの右キー
20680 case 2:
20690 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
20700 '3.ヘルプを選択 パッドの右
20710 case 3:
20720 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
20730 'プログラムの終了を選択
20740 case 0:
20750 cls 3:cls 4::color rgb(255,255,255):pause 2.052*1000:end
20760 if lang_flag = 1 then
20770 Else
20780 ui_msg "プログラムを終了します"
20790 endif
20800 end select
20810 endif
20820 '4.終了するを選択  パッドの右
20830 'バーチャルパッド　ここまで'
20840 'SettingScreen:
20850 'key$ = input$(1)
20860 'カーソル下'
20870 if key$ = chr$(31) then
20880 select case (No Mod 4)
20890 '登録文字から数霊文字の確認
20900 case 1:
20910 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 1,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
20920 '数霊文字の確認からトップ画面に行く
20930 case 2:
20940 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 1,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
20950 'トップ画面に行くから終了
20960 case 3:
20970 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 1,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
20980 '終了から登録文字
20990 case 0:
21000 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 1,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21010 end select
21020 endif
21030 'カーソル　上
21040 if key$ = chr$(30) then
21050 select case (No Mod 4)
21060 case 1:
21070 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
21080 case 2:
21090 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
21100 case 3:
21110 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
21120 case 0:
21130 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
21140 end select
21150 endif
21160 'エンターキーを押したとき
21170 if key$ = chr$(13) then
21180 if No=3 then goto TopScreen:
21190 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
21200 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
21210 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4:color rgb(255,255,255):pause 3 * 120:end
21220 'lse
21230 'o'o SettingScreen:
21240 endif
21250 '結果表示設定
21260 Result_Setting:
21270 color rgb(255,255,255)
21280 'dim list$(4)
21290 'ファイル読み込み
21300 '1.ファイルが有るか無いかのチェック
21310 if Dir$("System/config.sys") = "" then
21320 '1-1.ファイルがないとき
21330 '上のフォルダを作成
21340 mkdir "System"
21350 list$(0) = "●:出た数字から181を引く"
21360 list$(1) = " :出た数字から180を引き単数変換"
21370 open "./System/config.sys" for output as #1
21380 print #1,"config_r=0"
21390 close #1
21400 ui_msg "ファイルを作成しました"
21410 'ファイル作成
21420 else
21430 '1-2.ファイルが有るとき
21440 'config_r:0 出た数字から181を引く
21450 'config_r:1 出た数字から180を引いて単数変換
21460 'open "./System/config.sys" for input as #1
21470 open System$ for input as #1
21480 line input #1,buf_line$
21490 if len(buf_line$) = 10 then
21500  if left$(buf_line$,9) = "config_r=" then
21510  buf$ = right$(buf_line$,1)
21520  if buf$ = "1" then
21530    buf_config_r = 1
21540    list$(0)="●:出た数字から180を引いて単数変換"
21550    list$(1)=" :出た数字から181を引く"
21560  else
21570    buf_config_r = 0
21580    list$(0)="●:出た数字から181を引く"
21590    list$(1)=" :出た数字から180を引いて単数変換"
21600  endif
21610  endif
21620 endif
21630 close #1
21640 endif
21650 '"●:1.出た数字から180を引く"をlist$(0)に代入
21660 'list$(0) = "●:出た数字から181を引く"
21670 'list$(1) = " :出た数字から180を引いて単数変換"
21680 list$(2) = " :前の画面に戻る"
21690 list$(3) = " :終 了"
21700 list_num = ui_select("list$","番号を選んでください")
21710 play ""
21720 Select case (list_num)
21730 case 0:
21740        buf_config_r=1:goto config_moji2:
21750 case 1:
21760        buf_config_r=0:goto config_moji2:
21770 case 2:
21780       '前の画面に飛ぶ
21790        goto Kakunin_Surei_count:
21800 case 3:
21810       'プログラムを終了する
21820       cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
21830 end select
21840 '単数変換
21850 Func Single_Complate(num)
21860 a = num - 180
21870 if a>9 and a < 100 then
21880  b1 = fix(a / 10)
21890  b2 = 10 * a - b1
21900  c = b1 + b2
21910 endif
21920 buffer = c
21930 endfunc buffer
