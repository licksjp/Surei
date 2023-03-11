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
290 'Version 1.0.3_2022.03.27(Release):正式版
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
520 'March(2023)
530 'Version 1.3.5_2023.02.27-2023.03.05(Release):正式版
540 'Version 1.3.6_2023.03.05-2023.03.12(Release):正式版
550 '現在のバージョン
560 Version$ = "1.3.6_2023.03.12(正式版)"
570 'csvファイル 1.数霊 ベースファイル
580 FILE_csv$ = "./data/Kazutama.csv"
590 'csvファイル 2.数霊 ベースファイル 2
600 FILE_csv2$ = "./data/Surei_chart_20211207.csv"
610 'Save ファイル
620 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
630 'gazo ファイル
640 Gazo$ = "./data/Gazo/"
650 'System フォルダ:設定ファイルを保存するところ
660 System$ = "./System/config.sys"
670 '設定ファイル名:config.sys
680 'Sound File(Voice)
690 '1.ボイス TopScreen
700 Voice_File_TopScreen$ = "./data/Sound_data/"
710 'Message
720 buf_finish_Message$ = "メモリーを解放してプログラムを終了します"
730 '変数領域
740 'vcount:バーチャルパッド下の変数
750 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
760 count2 = 0:N=0:N2=0:m2 = 0
770 dim list$(4),moji_List$(2)
780 'ファイルの有無チェック
790 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
800 '1.ファイルが無いとき
810 cls :print "依存ファイルが見つかりません":
820 print "エンターキーを押してください" + chr$(13)
830 key$ = input$(1)
840 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
850 else
860 '2.ファイルが有るとき
870 cls:print "csv:file ok." + chr$(13)
880 n=0
890 'FILE_csv$:数霊データー入力
900 open FILE_csv$ for input as #1
910 while eof(1) = 0
920 input #1,line$
930 bufline$(n) = line$
940 'Print n;chr$(13)
950 '登録件数カウント:n
960 n = n + 1
970 wend
980 close #1
990 N=n
1000 '2つ目のファイル読み込み
1010 'n = 0
1020 open FILE_csv2$ for input as #2
1030 for n=3 to 181
1040 for i=0 to 1
1050 input #2,line$
1060 bufline2$(n,i) = line$
1070 next i
1080 next n
1090 close #2
1100 N2 = n
1110 endif
1120 '2022.11.23----------------------
1130 '端末言語のチェック
1140 '日本語端末かチェックをして日本語以外なら英語で表示する
1150 'lang flag:0:日本語 1:英語(日本語以外)
1160 '--------------------------------
1170 lang_flag = 0
1180 if ex_info$(1) <> "JP" then
1190 lang_flag = 1
1200 endif
1210 'Top画面
1220 TopScreen:
1230 'バーチャルパッドを表示
1240 cls 3:font 48:screen 1,1,1,1:init"kb:4":init"crt:0"
1250 'play ""
1260 play ""
1270 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
1280 'gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
1290 gload Gazo$ + "TopScreen_20230310.png",0,0,0
1300 'バーチャルパッドの背景を白にする
1310 gload Gazo$ + "downscreen.png",0,0,800
1320 '選択肢 1
1330 gload Gazo$ + "Selection.png",1,5,300
1340 '選択肢 2
1350 gload Gazo$ + "Selection.png",1,5,400
1360 '選択肢 3
1370 gload Gazo$ + "Selection.png",1,5,500
1380 '選択肢 4
1390 gload Gazo$ + "Selection.png",1,5,595
1400 color rgb(0,0,255)
1410 print chr$(13)
1420 if lang_flag = 1 then
1430 color rgb(255,255,255)
1440 print "Select Number" + chr$(13)
1450 print " :1.Kazutama check" + chr$(13)
1460 print " :2.Setting" + chr$(13)
1470 print " :3.Help" + chr$(13)
1480 print " :4.End Program" + chr$(13)
1490 color rgb(255,255,255)
1500 else
1510 color rgb(255,255,255)
1520 print chr$(13)
1530 print "番号を選んでください" + chr$(13)
1540 print " :1.数霊(かずたま)チェック" + chr$(13)
1550 print " :2.設定" + chr$(13)
1560 print " :3.ヘルプ" + chr$(13)
1570 print " :4.終　了" + chr$(13)
1580 color rgb(0,0,0)
1590 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
1600 'バーチャルパッドを表示
1610 No=1:
1620 'lang_flag:1 外国語,0:日本語
1630 if lang_flag = 1 then
1640 'lang_flag=1 英語
1650 locate 0,15:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
1660 else
1670 'lang_flag=0 日本語
1680 locate 0,15:color rgb(0,0,0):print " 1.数霊(かずたま)チェックを選択";chr$(13)
1690 endif
1700 endif
1710 'スプライト
1720 '選択肢 1 On
1730 sp_def 0,(5,300),32,32
1740 sp_on 0,1
1750 sp_put 0,(5,300),0,0
1760 '選択肢 2 Off
1770 sp_def 1,(5,400),32,32
1780 sp_on 1,0
1790 sp_put 1,(5,400),0,0
1800 '選択肢 3 Off
1810 sp_def 2,(5,500),32,32
1820 sp_on 2,0
1830 sp_put 2,(5,500),0,0
1840 '選択肢 4 Off
1850 sp_def 3,(5,600),32,32
1860 sp_on 3,0
1870 sp_put 3,(5,600),0,0
1880 color rgb(0,0,0)
1890 Main_Select:
1900 'y:バーチャルパッドの処理
1910 'key$:カーソルの処理
1920 y = 0:key$ = "":bg = 0
1930 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
1940 y = stick(1)
1950 key$ = inkey$
1960 bg = strig(1)
1970 pause 2
1980 wend
1990 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
2000 '1.バーチャルパッドの処理
2010 'バーチャルパッド下を押した時
2020 if y = 1 then
2030 select case No
2040 'No の初期値：No=1
2050 case 1:
2060 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
2070 if lang_flag = 1 then
2080 'lang_flag=1 英語
2090 locate 0,15:print "2.It has selected Setting":goto Main_Select:
2100 else
2110 'lang_flag=0 日本語
2120 locate 0,15:print " 2.設定を選択":goto Main_Select:
2130 endif
2140 'デバッグライン　ここから
2150 '0のとき
2160 'デバッグライン　ここまで
2170 'デバッグライン　ここから
2180 'バーチャルパッド　下
2190 case 2:
2200 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:
2210 print "                                         ":
2220 if lang_flag = 1 then
2230 color rgb(0,0,0):locate 0,15:
2240 print "3.It has selected Help":No=3:goto Main_Select:
2250 else
2260 color rgb(0,0,0):locate 0,15:print "                                                         ":locate 0,15:
2270 print " 3.ヘルプを選択":No=3:goto Main_Select:
2280 endif
2290 'デバッグライン　ここまで
2300 case 3:
2310 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                               "
2320 if lang_flag = 1 then
2330 locate 0,15:print "4.It has selected finish program":No=0:goto Main_Select:
2340 else
2350 locate 0,15:print "                                                         " :locate 0,15:print " 4.終了を選択":No=0:goto Main_Select:
2360 endif
2370 'デバッグライン　ここから
2380 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
2390 'デバッグライン　ここまで
2400 case 0:
2410 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1
2420 if lang_flag = 1 then
2430 'lang_flag=1:英語
2440 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
2450 else
2460 'lang_flag=0:日本語
2470 locate 0,15:print "                                      ":locate 0,15:print " 1.数霊(かずたま)チェックを選択":goto Main_Select:
2480 'endif
2490 endif
2500 'デバッグライン　ここから
2510 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
2520 'デバッグライン　ここまで
2530 end select
2540 endif
2550 'バーチャルパッド　上 ここから
2560 if y = -1 then
2570 select case No
2580 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
2590 case 1:
2600 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                       "
2610 'if lang_flag = 1 then
2620 'lang_flag=1 英語
2630 'locate 0,15:print "4.It has finished program":goto Main_Select:
2640 'else
2650 'lang_flag=0 日本語
2660 locate 0,15:print "                                                          ":
2670 locate 0,15:print " 4.終了を選択":goto Main_Select:
2680 'endif
2690 'endif
2700 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
2710 case 0:
2720 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":
2730 if lang_flag = 1 then
2740 '1:英語
2750 locate 0,15:print "3.It has selected Help":goto Main_Select:
2760 else
2770 '0:日本語
2780 locate 0,15:print "                                                                                        "
2790 locate 0,15:print " 3.ヘルプを選択":goto Main_Select:
2800 endif
2810 'No:3 3.Help→2.設定 No:2
2820 case 3:
2830 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      "
2840 if lang_flag = 1 then
2850 '1:英語
2860 locate 0,15:print "2.It has selected Setting":goto Main_Select:
2870 else
2880 '0:日本語
2890 locate 0,15:print" 2.設定を選択":goto Main_Select:
2900 endif
2910 case 2:
2920 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":
2930 if lang_flag = 1 then
2940 'lang_flag 1 英語
2950 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
2960 else
2970 'lang_flag 0 日本語
2980 locate 0,15:print" 1.数霊(かずたま)チェックを選択":goto Main_Select:
2990 endif
3000 end select
3010 endif
3020 if bg=1 then
3030 select case No
3040 '1.数霊チェックを選択  パッドの右キー(決定)
3050 case 1:
3060 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
3070 '2.設定を選択  パッドの右キー(決定)
3080 case 2:
3090 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
3100 '3.ヘルプを選択 パッドの右(決定)
3110 case 3:
3120 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
3130 'プログラムの終了を選択(決定)
3140 case 0:
3150 cls 3:cls 4:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg buf_finish_Message$:pause 4.080*1000:color rgb(255,255,255):end
3160 'if lang_flag = 1 then
3170 'lang_flag = 1 英語
3180 'else
3190 'lang_flag = 0 日本語
3200 'endif
3210 end select
3220 '4.終了するを選択  パッドの右
3230 endif
3240 'バーチャルパッド　上　ここまで
3250 '2.カーソルの処理
3260 'カーソル　下 chr$(31)
3270 if (key$ = chr$(31)) then
3280 select case (No)
3290 '4
3300 '0 選択肢4 => 選択肢1
3310 case 0:
3320 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "              ":color rgb(0,0,0):
3330 if lang_flag = 1 then
3340 'lang flag:1 英語
3350 else
3360 'lang flag:0 日本語
3370 color rgb(0,0,0):locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
3380 endif
3390 '1 選択肢1 => 選択肢2
3400 case 1:
3410 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":
3420 if lang_flag = 1 then
3430 'lang_flag:1 英語
3440 else
3450 'lang_flag:0 日本語
3460 color rgb(0,0,0):locate 0,15:print "2.設定を選択":beep:goto Main_Select:
3470 endif
3480 '2 選択肢2 => 選択肢3
3490 case 2:
3500 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,15:print "               ":
3510 if lang_flag = 1 then
3520 'lang flag:1 英語
3530 else
3540 'lang flang:0 日本語
3550 color rgb(0,0,0):locate 0,15:print "3.ヘルプを選択":goto Main_Select:
3560 endif
3570 '3 選択肢３ => 選択肢4
3580 case 3:
3590 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,595),0,0:locate 0,15:print "               ":color rgb(0,0,0)
3600 if lang_flag = 1 then
3610 'lang_flag = 1 英語
3620 else
3630 'lang_flag = 0 日本語
3640 color rgb(0,0,0):locate 0,15:print "4.終 了を選択":goto Main_Select:
3650 endif
3660 case else:
3670 goto Main_Select:
3680 end select
3690 endif
3700 'カーソル　上
3710 if key$=chr$(30) then
3720 select case (No)
3730 '選択肢1 => 選択肢4
3740 case 1:
3750 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:PRINT "                      ":
3760 if lang_flag = 1 then
3770 'lang_flag=1:英語
3780 'print "1.It has selected Kazutama check":goto Main_Select:
3790 else
3800 'lang_flag = 0:日本語
3810 else
3820 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
3830 endif
3840 '選択肢2 => 選択肢1
3850 case 2:
3860 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                 ":locate 1,15:print "2.設 定を選択":goto Main_Select:
3870 '選択肢3　=> 選択肢2
3880 case 3:
3890 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,500),0,0
3900 if lang_flag = 1 then
3910 'lang_flag = 1:英語
3920 locate 0,15:print "It has selected Help":goto Main_Select:
3930 else
3940 'lang_flag = 0:日本語
3950 locate 0,15:print "3.ヘルプを選択":goto Main_Select:
3960 endif
3970 '選択肢4 => 選択肢3
3980 case 0:
3990 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                ":locate 1,15:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
4000 if lang_flag = 1 then
4010 'lang flag=1 英語
4020 else
4030 'lang flag=0 日本語
4040 locate 1,15:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
4050 endif
4060 end select
4070 endif
4080 'Input "番号:",No
4090 'エンターキー入力:決定
4100 if key$ = chr$(13) then
4110 select case No
4120 case 1:
4130 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4140 case 3:
4150 Color rgb(255,255,255):goto Help:
4160 case 0:
4170 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg buf_finish_Message$:color rgb(255,255,255):pause 4.080 * 1000:end
4180 case 2:
4190 color rgb(255,255,255):sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
4200 end select
4210 endif
4220 '1-1.数霊チェック
4230 Surei_Check:
4240 cls 3:Font 48:
4250 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png"
4260 gload Gazo$ + "downscreen.png",0,0,800
4270 play ""
4280 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
4290 color rgb(255,0,0)
4300 'print "●数霊(かずたま)チェックトップ" + chr$(13)
4310 sp_on 0,1:sp_put 0,(5,300),0,0:screen 1,1,1
4320 if lang_flag = 1 then
4330 'lang_flag=1 英語
4340 else
4350 'lang_flag=0 日本語
4360 print chr$(13)+chr$(13)+chr$(13)
4370 color rgb(255,255,255)
4380 print "番号を選んでください" + chr$(13)
4390 print " :1.数霊(かずたま)1人用" + chr$(13)
4400 print " :2.数霊(かずたま)リスト 1人用　" + chr$(13)
4410 print " :3.数霊(かずたま)2人用" + chr$(13)
4420 print " :4.トップ画面に行く" + chr$(13)
4430 color rgb(0,0,0):No = 1
4440 locate 0,15:print "                                       "
4450 locate 0,15
4460 print " 1.数霊(かずたま)1人用を選択"
4470 endif
4480 Kazutama_main:
4490 'y:バーチャルパッドの処理
4500 'key$:カーソルの処理
4510 'bg:バーチャルパッドの右のボタン
4520 y = 0:key$ = "":bg=0
4530 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
4540 y = stick(1)
4550 key$ = inkey$
4560 bg=strig(1)
4570 y=stick(-1)
4580 pause 2
4590 wend
4600 'key$ = input$(1)
4610 if y = 1 then
4620 select case No
4630 'No の初期値：No=1
4640 case 2:
4650 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                       ":
4660 locate 0,15:print "                                     "
4670 locate 0,15
4680 print" 3.数霊(かずたま)2人用を選択":goto Kazutama_main:
4690 'デバッグライン　ここから
4700 '0のとき
4710 'デバッグライン　ここまで
4720 'デバッグライン　ここから
4730 case 3:
4740 sp_on 2,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_on 0,1:sp_put 0,(5,600),0,0:pause 200:locate 0,15:print "                                               "
4750 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":No=0:goto Kazutama_main:
4760 'デバッグライン　ここまで
4770 'デバッグライン　ここから
4780 'デバッグライン　ここまで
4790 case 0:
4800 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
4810 case 1:
4820 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                          ":locate 0,15:print " 2.数霊（かずたま）リスト 1人用":goto Kazutama_main:
4830 'デバッグライン　ここから
4840 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
4850 'デバッグライン　ここまで
4860 end select
4870 endif
4880 'バーチャルパッド　上 ここから
4890 if y = -1 then
4900 select case No
4910 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
4920 case 1:
4930 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 0,15:print" 4.トップ画面に行くを選択":goto Kazutama_main:
4940 'No:3 3.Help→2.設定 No:2
4950 case 0:
4960 sp_on 1,0:sp_on 0,0:sp_on 3,1:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                     ":locate 0,15:print" 3.数霊（かずたま）2人用を選択":goto Kazutama_main:
4970 case 2:
4980 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                    ":locate 0,15:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
4990 case 3:
5000 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                               ":locate 0,15:print "2.数霊(かずたま)リスト1人用を選択":goto Kazutama_main:
5010 end select
5020 endif
5030 if bg=1 then
5040 select case No
5050 '1.数霊チェックを選択  パッドの右キー
5060 case 1:
5070 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
5080 '2.数霊チェック2人用   パッドの右キー
5090 case 3:
5100 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
5110 '3.トップ画面に行く パッドの右
5120 case 0:
5130 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
5140 '2.数霊リスト1人用 パッドの右キー
5150 case 2:
5160 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_List1:
5170 'プログラムの終了を選択
5180 end select
5190 '4.終了するを選択  パッドの右
5200 endif
5210 'バーチャルパッド　上　ここまで
5220 if key$ = chr$(31) then
5230 select case No
5240 case 0:
5250 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,15:print "                                                          ":
5260 if lang_flag = 1 then
5270 Else
5280 locate 0,15:print "                                      "
5290 No=2:locate 0,15:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
5300 endif
5310 case 1:
5320 No=0:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,12:print "                                                          ":
5330 if lang_flag = 1 then
5340 Else
5350 locate 0,15:print"                                      "
5360 locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
5370 endif
5380 case 2:
5390 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                      ":
5400 if lang_flag = 1 then
5410 Else
5420 No=1:locate 0,15:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
5430 endif
5440 end select
5450 endif
5460 if key$=chr$(13) then
5470 select case No
5480 case 1:
5490 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
5500 case 2:
5510 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
5520 case 3:
5530 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
5540 '終了はトップメニューのみにする
5550 end select
5560 endif
5570 '前の画面に戻る
5580 'プログラムの終了
5590 '1人用
5600 '2人用
5610 '数霊(かずたま) 文字入力  1人用
5620 Surei_Input:
5630 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
5640 if mode = 0 then
5650 cls 3:font 32:init"kb:2"
5660 gload Gazo$ + "InputKotodama_20230131.png"
5670 play""
5680 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
5690 color rgb(255,0,0)
5700 if lang_flag=1 then
5710 '英語
5720 else
5730 print chr$(13)+chr$(13)+chr$(13)
5740 color rgb(255,255,255)
5750 print "文字を入れてください" + chr$(13)
5760 color rgb(255,255,255)
5770 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
5780 print chr$(13)
5790 color rgb(0,0,0)
5800 Input "入力文字:",buffer_moji$
5810 if buffer_moji$ = "" then
5820 ui_msg "未入力です":goto Surei_Input:
5830 else
5840 goto Surei_Result:
5850 endif
5860 endif
5870 endif
5880 if mode = 1 then
5890 cls 3:Font 32:
5900 gload Gazo$ + "InputKotodama.png"
5910 color rgb(255,0,0)
5920 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
5930 color rgb(255,255,255)
5940 print "文字を入れてください" + chr$(13)
5950 color rgb(255,0,0)
5960 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
5970 print "大文字のみ)" + chr$(13)
5980 color rgb(0,0,0)
5990 Input "文字入力:",buffer_moji2$
6000 goto Surei_Result3:
6010 'endif
6020 endif
6030 '数霊(かずたま)文字入力　2人用
6040 Surei_twoParson:
6050 cls 3:Font 32:init"kb:2"
6060 gload Gazo$ + "InputKotodama_20230131.png"
6070 '1人目入力
6080 if lang_flag = 1 then
6090 else
6100 print ""+chr$(13)+chr$(13)+chr$(13)
6110 color rgb(255,255,255)
6120 print "1人目の文字を入れてください" + chr$(13)
6130 color rgb(255,255,255)
6140 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
6150 color rgb(0,0,0)
6160 print chr$(13)
6170 Input "1人目文字入力:",buf_Parson1$
6180 endif
6190 Surei_twoParson2:
6200 cls 3:Font 32:init"kb:2"
6210 '2人目入力
6220 gload Gazo$ + "InputKotodama_20230131.png"
6230 if lang_falg = 1 then
6240 else
6250 print ""+chr$(13)+chr$(13)+chr$(13)
6260 color rgb(255,255,255)
6270 print "2人目の文字を入れてください" + chr$(13)
6280 color rgb(255,255,255)
6290 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
6300 color rgb(0,0,0)
6310 Input "2人目の文字入力:",buf_Parson2$
6320 goto Surei_Result2:
6330 endif
6340 '数霊　計算 パート
6350 '文字の計算関数
6360 'moji$:1文字を入れる
6370 func Complate(moji$)
6380 for n = 1 to 116
6390 if moji$ = bufline$(2*n) then
6400 buffcount = val(bufline$(2 * n + 1))
6410 endif
6420 next n
6430 endfunc buffcount
6440 '数霊　結果表示
6450 Surei_Result:
6460 cls 3:Font 32
6470 'ゼロカウント:zcount
6480 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
6490 '例 アカい:"い"の文字は無効な文字なので、はじく
6500 zcount=0
6510 'mojicount:入力文字数
6520 mojicount = len(buffer_moji$)
6530 for n=1 to mojicount
6540 for j=1 to 118
6550 if (bufcount$(n - 1) = bufline$(2 * j)) then
6560   bufcount$(n-1) = Mid$(buffer_moji$,n,1)
6570 endif
6580 next j
6590 next n
6600 ncount=0:count=0
6610    for i = 1 to mojicount
6620     bufcount$(i-1)=Mid$(buffer_moji$,i,1)
6630   'ンのカウント
6640    if (bufcount$(i-1) = "ン") then ncount = ncount + 1
6650    next i
6660    if (ncount > 0) then
6670    'Listを表示する
6680    moji_List$(0) = "この単語は目に見える物です"
6690    moji_List$(1) = "この単語は目に見えない物です"
6700    num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
6710    if (num2 = 0) then
6720    else
6730    if (num2 = 1) then
6740       n1 = 9 * ncount
6750    endif
6760    endif
6770    endif
6780    for j=1 to mojicount
6790    bufcount$(j-1) = Mid$(buffer_moji$,j,1)
6800    count = count + Complate(bufcount$(j - 1))
6810    next j
6820    count = count + n1
6830 if (ncount > 0) then count = count
6840 '182以上のとき,181を引く
6850 if buf_cofig_r = 0 then
6860      if (count > 181) then
6870         count = count - 181
6880      else
6890      if (buf_config_r = 1) then
6900        buf_count = Single_Complate(count)
6910      endif
6920 endif
6930 endif
6940 cls 3:Font 48+16
6950 gload Gazo$ + "Result_Screen3_20211226.png"
6960 if buf_config_r = 1 then
6970    print "入力文字:" + buffer_moji$ + chr$(13)
6980    print "数霊(かずたま):";buf_count;chr$(13)
6990 endif
7000 if lang_flag = 1 then
7010 else
7020 color rgb(255,0,0)
7030 print "入力文字:" + buffer_moji$ + chr$(13)
7040 endif
7050 if lang_flag = 1 then
7060 else
7070 color rgb(0,0,255)
7080 print "数霊(かずたま):";count;chr$(13)
7090 endif
7100 if lang_flag = 1 then
7110 else
7120 color rgb(0,0,0)
7130 print "エンター or スペース" + chr$(13)
7140 print  chr$(13)
7150 'endif
7160 endif
7170 key$ = input$(1)
7180 if ((key$ = chr$(13)) or (key$=" ")) then
7190 List$(0)="1.もう一度数霊を見る"
7200 List$(1)="2.トップ画面に行く"
7210 List$(2)="3.この数霊の説明を見る"
7220 List$(3)="4.数霊データーを保存"
7230 num=ui_select("List$","番号を選んでください")
7240 select case num
7250   case 0:
7260          goto Surei_Input:
7270   case 1:
7280        n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
7290          for i=0 to 9
7300             bufcount$(i)=""
7310          next i
7320          goto TopScreen:
7330   case 2:
7340        goto Surei_Result4:
7350   case 3:
7360         s=Surei_Result_Save_File()
7370         ui_msg "保存しました"
7380   case -1:
7390        'goto Surei_Result:
7400   case else:
7410        goto Surei_Result:
7420 end select
7430 'ファイルを保存する
7440 else
7450 goto Surei_Result:
7460 endif
7470 '3-1 バージョン情報
7480 Version:
7490 cls 3:Font 32
7500 gload Gazo$ + "Screen1_Version.png"
7510 gload Gazo$ + "downscreen.png",0,0,800
7520 play ""
7530 play Voice_File_TopScreen$ + "Voice_Version.mp3"
7540 color rgb(255,0,0)
7550 print chr$(13)
7560 color rgb(255,255,255)
7570 if lang_flag = 1 then
7580 else
7590 print chr$(13)+chr$(13)+chr$(13)
7600 print "Ver:";Version$ + chr$(13)
7610 print "アプリ名:数霊計算機" + chr$(13)
7620 print "Basic for Android Runtime" + chr$(13)
7630 print "Author:licksjp" + chr$(13)
7640 print "制作開始:2021.7.28" + chr$(13)
7650 print chr$(13)
7660 print "(C)Copy right licksjp " + chr$(13)
7670 print "All rights reserved" + chr$(13)
7680 print chr$(13)
7690 color rgb(0,0,0)
7700 print "パッドの右を押してください" + chr$(13)
7710 endif
7720 bg=0:key$=""
7730 while (bg <> 1 and key$ <> chr$(13))
7740 bg = strig(1)
7750 key$ = inkey$
7760 pause 2
7770 wend
7780 if key$ = chr$(13) then
7790 goto TopScreen:
7800 else
7810 if bg=1 then
7820 goto TopScreen:
7830 else
7840 if lang_flag = 1 then
7850 else
7860 talk "無効なキーです":goto Version:
7870 endif
7880 endif
7890 endif
7900 '3-2 参考文献
7910 Reference_Book:
7920 cls 3:Font 48:play""
7930 gload Gazo$ + "Screen1_Reference.png"
7940 gload Gazo$ + "downscreen.png",0,0,800
7950 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
7960 color rgb(255,0,0)
7970 print chr$(13)+chr$(13)
7980 if lang_flag = 1 then
7990 else
8000 color rgb(255,255,255)
8010 print "書名:数霊" + chr$(13)
8020 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
8030 print "出版社:徳間書店" + chr$(13)
8040 print "ISBN:978-4-19-" + chr$(13)
8050 print "         865309-5" + chr$(13)
8060 print "定価:2300円 + 税" + chr$(13)
8070 color rgb(0,0,0)
8080 print "パッドの右を押してください"
8090 endif
8100 bg = 0:key$ = ""
8110 while (bg <> 1 and key$ <> chr$(13))
8120 bg = strig(1)
8130 key$ = inkey$
8140 pause 2
8150 wend
8160 if key$ = chr$(13) then
8170 goto TopScreen:
8180 else
8190 if bg = 1 then
8200 goto TopScreen:
8210 else
8220 talk "無効なキーです":goto Reference_Book:
8230 endif
8240 endif
8250 'ヘルプ画面　トップ画面
8260 Help:
8270 No=1:c=0
8280 play ""
8290 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
8300 cls 3:Font 48:
8310 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
8320 gload Gazo$ + "downscreen.png",0,0,800
8330 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0
8340 color rgb(255,0,0)
8350 print chr$(13)+chr$(13)+chr$(13)
8360 color rgb(255,255,255)
8370 print "番号を選んでください" + chr$(13)
8380 print " :1.バージョン" + chr$(13)
8390 print " :2.参考文献" + chr$(13)
8400 print " :3.トップ画面に行く" + chr$(13)
8410 color rgb(0,0,0)
8420 locate 0,15:print "                                     "
8430 if No = 1 then locate 0,15:print " 1.バージョンを選択"
8440 'y:バーチャルパッドの処理
8450 'key$:カーソルの処理
8460 'bg:バーチャルパッドの右ボタン
8470 Help_key:
8480 y = 0:key$ = "":bg=0
8490 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
8500 y = stick(1)
8510 key$ = inkey$
8520 bg=strig(1)
8530 pause 2
8540 wend
8550 'バーチャルパッド　ここから'
8560 if y = 1 then
8570 select case No
8580 'No の初期値：No=1
8590 case 1:
8600 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
8610 if lang_flag = 1 then
8620 else
8630 locate 0,15:print" 2.参考文献を選択":goto Help_key:
8640 endif
8650 'デバッグライン　ここから
8660 '0のとき
8670 'デバッグライン　ここまで
8680 'デバッグライン　ここから
8690 case 2:
8700 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                  "
8710 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に行くを選択":No=0:goto Help_key:
8720 'デバッグライン　ここまで
8730 'デバッグライン　ここから
8740 'デバッグライン　ここまで
8750 case 0:
8760 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
8770 'デバッグライン　ここから
8780 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
8790 'デバッグライン　ここまで
8800 end select
8810 endif
8820 'バーチャルパッド　上 ここから
8830 if y = -1 then
8840 select case No
8850 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
8860 case 0:
8870 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=1:locate 0,15:print"                                       ":locate 0,15:print" 3.トップ画面に行くを選択":goto Help_key
8880 'No:3 3.Help→2.設定 No:2
8890 case 1:
8900 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
8910 case 2:
8920 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=0:locate 0,15:print "                                      ":locate 0,15:print" 1.バージョンを選択":goto Help_key:
8930 end select
8940 endif
8950 if bg = 1 then
8960 select case No
8970 '1.数霊チェックを選択  パッドの右キー
8980 case 1:
8990 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
9000 '2.設定を選択    パッドの右キー
9010 case 2:
9020 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
9030 '3.ヘルプを選択 パッドの右
9040 case 0:
9050 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
9060 'プログラムの終了を選択
9070 'if lang_flag = 1 then
9080 'lang_flag = 1:英語
9090 'Else
9100 'lang_flag = 0:日本語
9110 'endif
9120 end select
9130 '4.終了するを選択  パッドの右
9140 endif
9150 'バーチャルパッド　上　ここまで
9160 'バーチャルパッド　ここまで'
9170 'key$ = input$(1)
9180 'カーソルの下
9190 if key$ = chr$(31) then
9200 select case (No Mod 4)
9210 'バージョンから参考文献
9220 case 0:
9230 c=1:No=c:locate 0,15:Print "             ":locate 0,15:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
9240 '参考文献からトップ画面
9250 case 1:
9260 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "            ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
9270 'トップ画面から終了
9280 '終了からバージョン
9290 case 2:
9300 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                     ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
9310 case else:
9320 goto Help_key:
9330 end select
9340 endif
9350 'カーソル　上
9360 if key$ = chr$(30) then
9370 select case (c Mod 4)
9380 'バージョンから終了
9390 case 0:
9400 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:locate 0,15:print "                   ":locate 0,15:print " 4.終 了を選択":goto Help_key:
9410 '参考文献からバージョン
9420 case 1:
9430 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                   ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
9440 'トップ画面から参考文献
9450 case 2:
9460 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":locate 0,15:print " 2.参考文献を選択":goto Help_key:
9470 '終了からトップ画面を選択
9480 case 3:
9490 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print"                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
9500 case else:
9510 goto Help_key:
9520 end select
9530 endif
9540 'エンターキー：決定
9550 if key$=chr$(13) then
9560 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
9570 if No=0 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
9580 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
9590 else
9600 goto Help_key:
9610 endif
9620 '登録文字の確認
9630 '文字を1文字入れて登録されているか調べるメニュー
9640 '設定項目
9650 Setting:
9660 cls 3:Font 48
9670 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
9680 gload Gazo$ + "downscreen.png",0,0,800
9690 play ""
9700 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
9710 No=1
9720 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:
9730 color rgb(0,0,255)
9740 print chr$(13)
9750 if lang_flag = 1 then
9760 'lang_flag = 1:英語
9770 else
9780 'lang_flag = 0:日本語
9790 color rgb(255,255,255)
9800 print chr$(13)
9810 print "番号を選んでください" + chr$(13)
9820 '-------コメント----------------
9830 'print " :1.登録文字の確認" + chr$(13)
9840 'print " :2.数霊文字確認" + chr$(13)
9850 '-------コメント----------------
9860 'print chr$(13)
9870 print " :1.文字の項目" + chr$(13)
9880 print " :2.結果表示設定" + chr$(13)
9890 print " :3.言語設定" + chr$(13)
9900 print " :4.トップ画面に行く" + chr$(13)
9910 endif
9920 color rgb(0,0,0)
9930 locate 0,15
9940 if No=1 then locate 0,15:print  "                                     ":locate 0,15:print " 1.文字の項目を選択"
9950 'y:バーチャルパッドの処理
9960 'key$:カーソルの処理
9970 'bg:バーチャルパッドの右ボタン
9980 SettingScreen:
9990 y = 0:key$ = "":bg=0
10000 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
10010 y = stick(1)
10020 key$ = inkey$
10030 bg=strig(1)
10040 pause 2
10050 wend
10060 'バーチャルパッド　ここから'
10070 'バーチャルパッド　ここから'
10080 if y = 1 then
10090 select case No
10100 'No の初期値：No=1
10110 case 1:
10120 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":color rgb(0,0,0):locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
10130 'デバッグライン　ここから
10140 '0のとき
10150 'デバッグライン　ここまで
10160 'デバッグライン　ここから
10170 case 2:
10180 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                         "
10190 color rgb(0,0,0)::No=3
10200 if lang_flag = 1 then
10210 else
10220 locate 1,15:print "3.言語設定を選択":goto SettingScreen:
10230 endif
10240 'デバッグライン　ここまで
10250 case 3:
10260 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                              ":locate 1,15:print "4.トップ画面に行くを選択":No=0:goto SettingScreen:
10270 'デバッグライン　ここから
10280 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
10290 'デバッグライン　ここまで
10300 case 0:
10310 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
10320 'デバッグライン　ここから
10330 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
10340 'デバッグライン　ここまで
10350 end select
10360 endif
10370 'バーチャルパッド　上 ここから
10380 if y = -1 then
10390 select case No
10400 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
10410 case 1:
10420 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 1,15:print"4.トップ画面に行くを選択":goto SettingScreen:
10430 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
10440 case 0:
10450 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
10460 'No:3 3.Help→2.設定 No:2
10470 case 3:
10480 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.結果表示設定を選択":goto SettingScreen:
10490 case 2:
10500 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 1,15:print"1.文字の項目を選択":goto SettingScreen:
10510 end select
10520 endif
10530 if bg=1 then
10540 select case No
10550 '1.数霊チェックを選択  パッドの右キー
10560 case 1:
10570 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
10580 '2.設定を選択    パッドの右キー
10590 case 2:
10600 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
10610 '3.ヘルプを選択 パッドの右
10620 case 0:
10630 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
10640 'プログラムの終了を選択
10650 case 3:
10660 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Setting_Language:
10670 end select
10680 endif
10690 '4.終了するを選択  パッドの右
10700 'バーチャルパッド　ここまで'
10710 'カーソル下'
10720 if key$ = chr$(31) then
10730 select case (No Mod 4)
10740 '登録文字から数霊文字の確認
10750 case 1:
10760 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                     ":locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
10770 '数霊文字の確認からトップ画面に行く
10780 case 2:
10790 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "                                     ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
10800 'トップ画面に行くから終了
10810 case 3:
10820 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,590),0,0:locate 0,15:print "                                       ":locate 1,15:print "4.トップ画面に行くを選択":goto SettingScreen:
10830 '終了から登録文字
10840 case 0:
10850 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
10860 end select
10870 endif
10880 'カーソル　上
10890 if key$ = chr$(30) then
10900 select case (No Mod 4)
10910 case 1:
10920 c=2:No=c:sp_on 0,1:sp_put 0,(5,300),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
10930 case 2:
10940 c=3:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
10950 case 3:
10960 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:goto SettingScreen:
10970 case 0:
10980 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,590),0,0:sp_on 0,0:goto SettingScreen:
10990 end select
11000 endif
11010 'エンターキーを押したとき
11020 if key$ = chr$(13) then
11030 if No=3 then goto Setting_Language:
11040 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
11050 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
11060 if No=0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
11070 endif
11080 '文字検索項目  ここから
11090 Moji_Search:
11100 cls 4:cls 3:Font 32+16:init"kb:2"
11110 gload Gazo$ + "Moji_Search_Result.png"
11120 play ""
11130 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
11140 print "" + chr$(13)
11150 color rgb(255,255,255)
11160 if lang_flag = 1 then
11170 Else
11180 print "文字を一文字入れてください" + chr$(13)
11190 endif
11200 color rgb(0,0,0)
11210 if lang_flag=1 then
11220 Else
11230 Input "登録文字:",moji$
11240 endif
11250 moji_count = len(moji$)
11260 if moji_count > 1 then
11270 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Moji_Search:
11280 else
11290 count=0
11300 for n = 0 to 116
11310 if bufline$(2*n) = moji$ then
11320 cls 3:font 48:init"kb:4"
11330 gload Gazo$ + "downscreen.png",0,0,800
11340 gload Gazo$ + "Moji_Search_Result.png"
11350 play ""
11360 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
11370 if lang_flag = 1 then
11380 Else
11390 print chr$(13)
11400 color rgb(255,255,255)
11410 print moji$;"は、登録されています。" + chr$(13)
11420 color rgb(0,0,0)
11430 print "ジョイパッドの右を押してください"
11440 endif
11450 bg = 0:key$ = ""
11460 while (bg <> 1 and key$ <> chr$(13))
11470 key$ = inkey$
11480 bg = strig(1)
11490 pause 2
11500 wend
11510 if key$ = chr$(13) then goto TopScreen:
11520 if bg=1 then goto TopScreen:
11530 count = count + 1
11540 endif
11550 next n
11560 if count = 0 then
11570 cls 3:font 48:init "kb:4"
11580 gload Gazo$ + "Moji_check.png"
11590 play ""
11600 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
11610 print chr$(13)
11620 if lang_flag = 1 then
11630 Else
11640 color rgb(255,255,255)
11650 print moji$;"は、登録されていません。" + chr$(13)
11660 color rgb(0,0,0)
11670 print "パッドの右を押してください" + chr$(13)
11680 endif
11690 kg = 0:key$ = ""
11700 while (kg <> 1 and key$ <> chr$(13))
11710 key$ = inkey$
11720 kg = strig(1)
11730 pause 2
11740 wend
11750 if ((key$ = chr$(13)) or (kg=1)) then goto TopScreen:
11760 endif
11770 endif
11780 Surei_Result2:
11790 cls 3:Font 48
11800 zcount1=0:zcount2=0:count1=0:count2=0
11810 '1人目
11820 mojicount1=len(buf_Parson1$)
11830 '2人目
11840 mojicount2 = len(buf_Parson2$)
11850 '1人目
11860 for n = 1 to mojicount1
11870 for j = 1 to 116
11880 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
11890 if bufcount1$(n-1) = bufline$(2*j) then
11900 zcount1 = zcount1 + 1
11910 endif
11920 next j
11930 next n
11940 '2人目
11950 for n = 1 to mojicount2
11960 for j = 1 to 116
11970 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
11980 if bufcount2$(n-1) = bufline$(2*j) then
11990 zount2 = zcount2 + 1
12000 endif
12010 next j
12020 next n
12030 '1人目
12040 for i=1 to mojicount1
12050 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
12060 p1 = Complate(bufcount1$(i-1))
12070 count1 = count1 + p1
12080 next i
12090 '2人目
12100 for i = 1 to mojicount2
12110 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
12120 p2 = Complate(bufcount2$(i-1))
12130 count2 = count2 + p2
12140 next i
12150 cls 3:
12160 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
12170 gload Gazo$ + "downscreen.png",0,0,800
12180 color rgb(255,0,0)
12190 print ""+chr$(13)
12200 if lang_flag = 1 then
12210 else
12220 color rgb(255,255,255)
12230 print chr$(13)+chr$(13)
12240 print "1人目:";buf_Parson1$;chr$(13)
12250 print "数霊1:";count1;chr$(13)
12260 print "2人目:";buf_Parson2$;chr$(13)
12270 print "数霊2:";count2;chr$(13)
12280 print "数霊(合計):";count1 + count2;chr$(13)
12290 color rgb(0,0,0)
12300 print "バーチャルパッドの右" + chr$(13)
12310 endif
12320 key$ = "":bg = 0
12330 while (bg <> 1 and key$ <> chr$(13))
12340 bg = strig(1)
12350 key$ = inkey$
12360 pause 2
12370 wend
12380 if (bg = 1 or key$ = chr$(13))  then goto TopScreen:
12390 Surei_Result3:
12400 cls 3:Font 48
12410 zcount2 = 0:count2 = 0
12420 mojicount2 = len(buffer_moji2$)
12430 for n = 1 to mojicount2
12440 for j = 1 to 116
12450 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
12460 if bufcount2$(n - 1) = bufline$(2 * j) then
12470 zcount2 = zcount2 + 1
12480 endif
12490 next j
12500 next n
12510 for i = 1 to mojicount2
12520 n2 = Complate(bufcount2$(i-1))
12530 count2 = count2 + n2
12540 next i
12550 gload Gazo$ + "Screen5.png"
12560 if lang_flag = 1 then
12570 else
12580 color rgb(255,0,0)
12590 print "数霊の結果表示" + chr$(13)
12600 color rgb(255,255,255)
12610 print "１回目回の文字入力:";buffer_moji$;chr$(13)
12620 print "１回目の数霊(かずたま)";count;chr$(13)
12630 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
12640 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
12650 color rgb(0,0,0)
12660 print "エンターキー:トップ画面";chr$(13)
12670 print "c or C キー:数霊の比較";chr$(13)
12680 endif
12690 key$ = "":bg = 0
12700 while (key$ <> chr$(13) and bg <> 1)
12710 bg = strig(1)
12720 key$ = inkey$
12730 pause 2
12740 wend
12750 if bg = 1 then goto TopScreen:
12760 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
12770 if key$ = "c" or key$ = "C" then
12780 if count = count2 then
12790 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
12800 else
12810 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
12820 endif
12830 endif
12840 Moji_Count_Check:
12850 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
12860 cls 3:Font 48
12870 gload Gazo$ + "Moji_check.png"
12880 gload Gazo$ + "downscreen.png",0,0,800
12890 n = 0
12900 open FILE_csv$ for input as #1
12910 while eof(1) = 0
12920 line input #1, line$
12930 n = n + 1
12940 wend
12950 close #1
12960 play ""
12970 if n = 118 then
12980 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
12990 if lang_flag = 1 then
13000 else
13010 print "" + chr$(13)
13020 color rgb(255,255,255)
13030 print "文字の登録文字数は";n;"文字" + chr$(13)
13040 color rgb(0,0,0)
13050 print "パッドの右を押してください" + chr$(13)
13060 endif
13070 endif
13080 key$ = "":bg = 0
13090 while (key$ <> chr$(13) and bg <> 1)
13100 key$=inkey$
13110 bg=strig(1)
13120 pause 2
13130 wend
13140 if bg = 1 then goto TopScreen:
13150 if key$ = chr$(13) then
13160 goto TopScreen:
13170 else
13180 goto Moji_Count_Check:
13190 endif
13200 'Save 関数
13210 file_kazutama = 0
13220 file_kazutama = Save_File()
13230 func Save_File()
13240 open SAVE_DATA1$  for output as #1
13250 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
13260 close #1
13270 endfunc
13280 Select_moji:
13290 cls 3:font 48:No = 1
13300 gload Gazo$ + "Screen1_mojicheck.png"
13310 gload Gazo$ + "downscreen.png",0,0,800
13320 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
13330 color rgb(255,0,0)
13340 if lang_flag = 1 then
13350 else
13360 play ""
13370 play Voice_File_TopScreen$ + "Voice_Select_Moji20230217.mp3"
13380 print chr$(13)+chr$(13)+chr$(13)
13390 color rgb(255,255,255)
13400 print "番号を選んでください" + chr$(13)
13410 print " :1.登録文字検索"+ chr$(13)
13420 print " :2.登録文字数の確認" + chr$(13)
13430 print " :3.トップ画面に戻る" + chr$(13)
13440 color rgb(0,0,0)
13450 locate 0,15
13460 if No = 1 then print " 1.登録文字検索を選択"
13470 endif
13480 Entry_check_key:
13490 y = 0:key$ = "":bg=0
13500 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
13510 y = stick(1)
13520 key$ = inkey$
13530 bg=strig(1)
13540 pause 2
13550 wend
13560 'バーチャルパッド　ここから'
13570 'バーチャルパッド　ここから'
13580 if y = 1 then
13590 select case No
13600 'No の初期値：No=1
13610 case 1:
13620 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
13630 'デバッグライン　ここから
13640 '0のとき
13650 'デバッグライン　ここまで
13660 'デバッグライン　ここから
13670 case 2:
13680 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                       "
13690 :No=0
13700 'if lang_flag = 1 then
13710 'Else
13720 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に戻るを選択":goto Entry_check_key:
13730 'endif
13740 'cls:color rgb(255,255,255):print"ok"
13750 'デバッグライン　ここまで
13760 'デバッグライン　ここから
13770 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
13780 'デバッグライン　ここまで
13790 case 0:
13800 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.登録文字数の確認を選択":goto Entry_check_key:
13810 'デバッグライン　ここから
13820 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
13830 'デバッグライン　ここまで
13840 end select
13850 endif
13860 'バーチャルパッド　上 ここから
13870 if y = -1 then
13880 select case No
13890 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
13900 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
13910 case 1:
13920 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print"3.トップ画面に戻るを選択":goto Entry_check_key:
13930 'No:3 3.Help→2.設定 No:2
13940 case 0:
13950 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
13960 case 2:
13970 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print "1.登録文字検索":goto Entry_check_key:
13980 end select
13990 endif
14000 if bg=1 then
14010 select case No
14020 '1.数霊チェックを選択  パッドの右キー
14030 case 1:
14040 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
14050 '2.設定を選択    パッドの右キー
14060 case 2:
14070 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
14080 '3.ヘルプを選択 パッドの右
14090 case 0:
14100 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
14110 end select
14120 endif
14130 '4.終了するを選択  パッドの右
14140 'バーチャルパッド　ここまで'
14150 'key$ = input$(1)
14160 'カーソルの下
14170 if key$ = chr$(31) then
14180 select case (No Mod 4)
14190 case 0:
14200 c=1:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
14210 case 1:
14220 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,500),0,0:sp_on 3,0:goto Entry_check_key:
14230 case 2:
14240 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:goto Entry_check_key:
14250 case 3:
14260 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
14270 end select
14280 endif
14290 'カーソル　上
14300 if key$ = chr$(30) then
14310 select case (No Mod 4)
14320 case 0:
14330 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
14340 case 1:
14350 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
14360 case 2:
14370 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
14380 case 3:
14390 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
14400 end select
14410 endif
14420 'エンターキーを押す
14430 if key$ = chr$(13) then
14440 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
14450 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
14460 if No = 0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
14470 endif
14480 '
14490 Kakunin_Surei_count:
14500 cls 3:font 48:No=1
14510 gload Gazo$ + "Kazutama_List_Top.png"
14520 gload Gazo$ + "downscreen.png",0,0,800
14530 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
14540 color rgb(255,0,0)
14550 print chr$(13)+chr$(13)+chr$(13)
14560 color rgb(255,255,255)
14570 print "番号を選んでください" + chr$(13)
14580 print " :1.数霊リスト 1人用" + chr$(13)
14590 print " :2.結果表示設定" + chr$(13)
14600 print " :3.トップ画面に行く" + chr$(13)
14610 print "" + chr$(13)
14620 color rgb(0,0,0)
14630 locate 0,15:print"                                                         "
14640 if No = 1 then locate 1,15:print "1.数霊リスト　1人用を選択"
14650 Entry_List:
14660 y = 0:key$ = "":bg=0
14670 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
14680 y = stick(1)
14690 key$ = inkey$
14700 bg = strig(1)
14710 pause 2
14720 wend
14730 'バーチャルパッド　ここから'
14740 'バーチャルパッド　ここから'
14750 'バーチャルパッド　下
14760 if y = 1 then
14770 select case No
14780 'No の初期値：No=1
14790 case 1:
14800 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.結果表示設定を選択":goto Entry_List:
14810 'デバッグライン　ここから
14820 '0のとき
14830 'デバッグライン　ここまで
14840 'デバッグライン　ここから
14850 'color rgb(0,0,0):locate 0,15:print " 4.終了を選択":goto Entry_List:
14860 'cls:color rgb(255,255,255):print"ok"
14870 'デバッグライン　ここまで
14880 case 0:
14890 sp_on 3,0:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 1.数霊リスト 1人用を選択":No=1:goto Entry_List:
14900 case 2:
14910 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                      ":No=0:locate 1,15:print "3．トップ画面に行くを選択":goto Entry_List:
14920 'デバッグライン　ここから
14930 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
14940 'デバッグライン　ここまで
14950 'デバッグライン　ここから
14960 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
14970 'デバッグライン　ここまで
14980 end select
14990 endif
15000 'バーチャルパッド　上 ここから
15010 if y = -1 then
15020 select case No
15030 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15040 case 2:
15050 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 2.結果表示設定を選択":goto Entry_List:
15060 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15070 case 0:
15080 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 1,15:print"3.トップ画面に行くを選択":goto Entry_List:
15090 'No:3 3.Help→2.設定 No:2
15100 case 1:
15110 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print "1.数霊リスト 1人用を選択":goto Entry_List:
15120 end select
15130 endif
15140 if bg = 1 then
15150 select case No
15160 '1.数霊リスト 一人用を選択を選択  パッドの右キー
15170 case 1:
15180 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
15190 '2.設定を選択  パッドの右キー
15200 case 2:
15210 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
15220 case 0:
15230  sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15240 end select
15250 endif
15260 if key$=chr$(13) then
15270 select case No
15280 case 0:
15290       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
15300 case 1:
15310       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
15320 case 2:
15330       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15340 end select
15350 endif
15360 '4.終了するを選択  パッドの右
15370 'バーチャルパッド　ここまで'
15380 Surei_List1:
15390 cls 3:font 48
15400 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
15410 file$ = dir$(SAVE_DATA1$,0)
15420 'ファイルが無いときの画面
15430 if file$ = ""  then
15440 gload "./data/Gazo/" + "KazutamaList1.png",0
15450 gload Gazo$+"downscreen.png",0,0,800
15460 print chr$(13)
15470 color rgb(255,255,255):print "登録ファイルはございません" + chr$(13)
15480 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
15490 'else
15500 'endif
15510 bg = 0:key$ = ""
15520 while (key$ <> chr$(13) and bg<>1)
15530 key$ = inkey$
15540 bg = strig(1)
15550 pause 2
15560 wend
15570 'エンターキーもしくはバーチャルパッドの右でトップに行く
15580 if (bg = 1  or key$ = chr$(13)) then goto TopScreen:
15590 else
15600 cls 3:buffer_list_count = Loadcount()
15610 color rgb(255,255,255)
15620 if lang_flag = 1 then
15630 Else
15640 talk "登録件数は" + str$(buffer_list_count) + "件です"
15650 gload Gazo$ + "KazutamaList1_Entry.png",0
15660 gload Gazo$ + "downscreen.png",0,0,800
15670 color rgb(0,0,255)
15680 print chr$(13)
15690 color rgb(255,255,255)
15700 print "登録件数:";buffer_list_count;"件";chr$(13)
15710 color rgb(0,0,0)
15720 print "パッドの右を押してください" + chr$(13)
15730 endif
15740 bg = 0:key$ = "":bg2 = 0
15750 while (key$ <> chr$(13) and bg <> 1)
15760 key$ = inkey$
15770 bg = strig(1)
15780 bg2=strig(0)
15790 pause 2
15800 wend
15810 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
15820 if (key$ = chr$(13) or bg = 1) then pause 2:goto KotodamaList_page:
15830 endif
15840 if (bg2 = 1) then pause 2:goto TopScreen:
15850 func Loadcount()
15860 n = 0
15870 'while eof(1)=-1
15880 open SAVE_DATA1$  for input as #1
15890 while eof(1) <> -1
15900 line input #1,line$
15910 n = n + 1
15920 wend
15930 close #1
15940 count = n
15950 endfunc count
15960 count_line = Loadcount()
15970 func Kotodama$(buf$)
15980 color rgb(255,255,255)
15990 b = len("数霊:")
16000 a$ = Mid$(buf$,b+1,len(buf$))
16010 for i=0 to 118
16020 color rgb(255,255,255)
16030 if bufline3$(2 * i) ="数霊:" + a$  then
16040 moji_$ = bufline3$(2*i + 1)
16050 endif
16060 next i
16070 kotodama$ = moji_$
16080 endfunc kotodama$
16090 KotodamaList_page:
16100 cls 3:font 48:m = 0:
16110 gload Gazo$ + "Screen5_Surei_List.png"
16120 gload Gazo$ + "downscreen.png",0,0,800
16130 if SAVE_DATA1$ = "" then
16140 cls 3:color rgb(255,255,255):print"ファイルがありません"
16150 else
16160 a = Loadcount()
16170 open SAVE_DATA1$  for input as #1
16180 for i=0 to a-1
16190 for n=0 to 1
16200 input #1,line$
16210 bufKaztama$(i,n) = line$
16220 next n
16230 next i
16240 close #1
16250 l = 0:n=0
16260 gload Gazo$ + "Screen5_Surei_List.png"
16270 gload Gazo$ + "downscreen.png",0,0,800
16280 while (buffer_list_count >= l)
16290 cls
16300 color rgb(255,0,0)
16310 print chr$(13)
16320 color rgb(255,255,255)
16330 n=n+1
16340 print chr$(13)
16350 print "番号:";l+1;chr$(13)
16360 print bufKaztama$(l,0) + chr$(13)
16370 print bufKaztama$(l,1) + chr$(13)
16380 Kmoji$ = moji$
16390 print chr$(13) + chr$(13) + chr$(13)
16400 color rgb(0,0,0)
16410 if buffer_list_count=1 then
16420 print " :パッドの左:トップ画面"+chr$(13)
16430 ui_msg "登録件数は1件です。"
16440 else
16450 if buffer_list_count > 1 then
16460 print " :パッドの左:トップ画面" + chr$(13)
16470 print " :パッドの右:次へ行く" + chr$(13)
16480 endif
16490 endif
16500 key$ = "":bg = 0:bg2 = 0
16510 while (key$ <> chr$(13) and bg <> 1 and bg2 <> 1)
16520 key$ = inkey$
16530 bg = strig(1)
16540 bg2 = strig(0)
16550 pause 2
16560 wend
16570 'if n > 1 then
16580 if (key$ = " " OR bg = 1) then
16590 if n > 1 then
16600 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
16610 endif
16620 else
16630 if ((bg2 = 1) or (key$=chr$(13))) then
16640    goto TopScreen:
16650 endif
16660 else
16670 goto KotodamaList_page:
16680 endif
16690 wend
16700 endif
16710 'ndif
16720 '結果表示２ Menu1
16730 Surei_Result4:
16740 cls 3:font 32+16:init"kb:4"
16750 for i=0 to 181 + 3 - 1
16760 if i = count  then
16770 buffer$ = bufline2$(count + 4,0)
16780 endif
16790 next i
16800 if len(buffer$) > 21 and len(buffer$) <= 45 then
16810 buffer2$ = Mid$(buffer$,1,22)
16820 buffer3$ = Mid$(buffer$,23,(len(buffer$) - 22))
16830 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13)
16840 else
16850 if len(buffer$) <= 21 then
16860 buffer2$ = Mid$(buffer$,1,21)
16870 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
16880 else
16890 if len(buffer$) > 45 and len(buffer$) <= 62 then
16900 buffer2$ = Mid$(buffer$,1,22)
16910 buffer3$ = Mid$(buffer$,23,22)
16920 buffer4$ = Mid$(buffer$,44,(len(buffer$)-44))
16930 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13)
16940 else
16950 if len(buffer$) > 64 and len(buffer$) <= 81 then
16960 buffer2$ = Mid$(buffer$,1,22)
16970 buffer3$ = Mid$(buffer$,23,20)
16980 buffer4$ = Mid$(buffer$,44,20)
16990 buffer5$ = Mid$(buffer$,65,(len(buffer$)-65))
17000 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13)
17010 if len(buffer$) > 81 and len(buffer$) <= 110 then
17020 buffer2$ = Mid$(buffer$,1,22)
17030 buffer3$ = Mid$(buffer$,23,20)
17040 buffer4$ = Mid$(buffer$,43,20)
17050 buffer5$ = Mid$(buffer$,63,20)
17060 buffer6$ = Mid$(buffer$,83,(len(buffer$) - 83))
17070 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13)
17080 endif
17090 endif
17100 endif
17110 endif
17120 endif
17130 Surei_Result4_2:
17140 gload Gazo$ + "Screen1_Result2.png"
17150 gload Gazo$ + "downscreen.png",0,0,800
17160 Result_Menu_List$(0)="1.トップ画面に行く"
17170 Result_Menu_List$(1)="2.数霊のデーターを保存"
17180 Result_Menu_List$(2)="3.もう一度、数霊を調べる"
17190 cls
17200 print chr$(13)
17210 if lang_flag = 1 then
17220 else
17230 color rgb(127,255,212)
17240 print chr$(13);chr$(13)
17250 print "入力文字:";buffer_moji$;chr$(13)
17260 print "数霊:";count;chr$(13)
17270 color rgb(255,255,255)
17280 print "数霊の説明:"+chr$(13)
17290 print buffer$
17300 color rgb(0,0,0)
17310 locate 0,15
17320 print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
17330 endif
17340 key$ = "":bg = 0:bg2 = 0
17350 while (bg<>1 and bg2<>1)
17360 key$ = inkey$
17370 bg = strig(1)
17380 bg2 = strig(0)
17390 pause 2
17400 wend
17410 if ((bg = 1) or (bg2 = 1)) then
17420 num = ui_select("Result_Menu_List$","番号を選んでください")
17430 endif
17440 if num = 0 then goto TopScreen:
17450 if num = 1 then goto File_save:
17460 if num = 2 then goto Surei_Input:
17470 if num = -1 then goto Surei_Result4
17480 File_save:
17490 'ファイルがない時
17500 if dir$(SAVE_DATA1$) = " " then
17510 open SAVE_DATA1$ for output as #1
17520 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
17530 close #1
17540 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
17550 'ファイルが有る時
17560 else
17570 open SAVE_DATA1$ for append as #1
17580 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
17590 close #1
17600 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
17610 endif
17620 func All_clear()
17630 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
17640 endfunc
17650 'ここから
17660 Config_moji1:
17670 cls 3:Font 48
17680 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
17690 gload Gazo$ + "downscreen.png",0,0,800
17700 play ""
17710 No=1
17720 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
17730 color rgb(0,0,255)
17740 print chr$(13)
17750 if lang_flag = 1 then
17760 'lang_flag = 1:英語
17770 else
17780 'lang_flag = 0:日本語
17790 color rgb(255,255,255)
17800 print "番号を選んでください" + chr$(13)
17810 print " :1.文字の項目" + chr$(13)
17820 print " :2.結果表示設定" + chr$(13)
17830 print " :3.トップ画面に行く" + chr$(13)
17840 print " :4.終 了" + chr$(13)
17850 endif
17860 color rgb(0,0,0)
17870 locate 1,12
17880 if No = 1 then print "1.文字の項目"
17890 'y:バーチャルパッドの処理
17900 'key$:カーソルの処理
17910 'bg:バーチャルパッドの右ボタン
17920 Config_moji1_Screen:
17930 y = 0:key$ = "":bg=0
17940 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
17950 y = stick(1)
17960 key$ = inkey$
17970 bg=strig(1)
17980 pause 2
17990 wend
18000 'バーチャルパッド　ここから'
18010 'バーチャルパッド　ここから'
18020 if y = 1 then
18030 select case No
18040 'No の初期値：No=1
18050 case 1:
18060 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
18070 'デバッグライン　ここから
18080 '0のとき
18090 'デバッグライン　ここまで
18100 'デバッグライン　ここから
18110 case 2:
18120 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
18130 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
18140 'if lang_flag = 1 then
18150 'else
18160 locate 1,12:print "3.トップ画面に行くを選択"
18170 'endif
18180 'デバッグライン　ここまで
18190 case 3:
18200 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
18210 'デバッグライン　ここから
18220 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
18230 'デバッグライン　ここまで
18240 case 0:
18250 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
18260 'デバッグライン　ここから
18270 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
18280 'デバッグライン　ここまで
18290 end select
18300 endif
18310 'バーチャルパッド　上 ここから
18320 if y = -1 then
18330 select case No
18340 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
18350 case 1:
18360 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
18370 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
18380 case 0:
18390 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
18400 'No:3 3.Help→2.設定 No:2
18410 case 3:
18420 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
18430 case 2:
18440 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
18450 end select
18460 endif
18470 if bg=1 then
18480 select case No
18490 '1.数霊チェックを選択  パッドの右キー
18500 case 1:
18510 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
18520 '2.設定を選択    パッドの右キー
18530 case 2:
18540 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
18550 '3.ヘルプを選択 パッドの右
18560 case 3:
18570 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
18580 'プログラムの終了を選択
18590 case 0:
18600 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
18610 'if lang_flag = 1 then
18620 'Else
18630 ui_msg "プログラムを終了します":end
18640 'endif
18650 end select
18660 endif
18670 '4.終了するを選択  パッドの右
18680 'バーチャルパッド　ここまで'
18690 'SettingScreen:
18700 'key$ = input$(1)
18710 'カーソル下'
18720 if key$ = chr$(31) then
18730 select case (No Mod 4)
18740 '登録文字から数霊文字の確認
18750 case 1:
18760 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
18770 '数霊文字の確認からトップ画面に行く
18780 case 2:
18790 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
18800 'トップ画面に行くから終了
18810 case 3:
18820 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
18830 '終了から登録文字
18840 case 0:
18850 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
18860 end select
18870 endif
18880 'カーソル　上
18890 if key$ = chr$(30) then
18900 select case (No Mod 4)
18910 case 1:
18920 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
18930 case 2:
18940 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
18950 case 3:
18960 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
18970 case 0:
18980 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
18990 end select
19000 endif
19010 'エンターキーを押したとき
19020 if key$ = chr$(13) then
19030 if No=3 then goto TopScreen:
19040 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
19050 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
19060 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
19070 'lse
19080 'o'o SettingScreen:
19090 endif
19100 'ここまで
19110 Config_moji2:
19120 cls 3:Font 48
19130 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19140 gload Gazo$ + "downscreen.png",0,0,800
19150 play ""
19160 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
19170 No=1
19180 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19190 color rgb(0,0,255)
19200 'print "●設定項目" + chr$(13)
19210 print chr$(13)
19220 if lang_flag = 1 then
19230 'lang_flag = 1:英語
19240 else
19250 'lang_flag = 0:日本語
19260 color rgb(255,255,255)
19270 print "番号を選んでください" + chr$(13)
19280 'print " :1.文字の項目" + chr$(13)
19290 'print " :2.結果表示設定" + chr$(13)
19300 print " :1.文字の項目" + chr$(13)
19310 print " :2.結果表示設定" + chr$(13)
19320 print " :3.トップ画面に行く" + chr$(13)
19330 print " :4.終 了" + chr$(13)
19340 endif
19350 color rgb(0,0,0)
19360 locate 1,12
19370 if No = 1 then print "1.文字の項目"
19380 'y:バーチャルパッドの処理
19390 'key$:カーソルの処理
19400 'bg:バーチャルパッドの右ボタン
19410 config_moji2:
19420 y = 0:key$ = "":bg=0
19430 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
19440 y = stick(1)
19450 key$ = inkey$
19460 bg = strig(1)
19470 pause 2
19480 wend
19490 'バーチャルパッド　ここから'
19500 'バーチャルパッド　ここから'
19510 if y = 1 then
19520 select case No
19530 'No の初期値：No=1
19540 case 1:
19550 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
19560 'デバッグライン　ここから
19570 '0のとき
19580 'デバッグライン　ここまで
19590 'デバッグライン　ここから
19600 case 2:
19610 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
19620 color rgb(0,0,0)::No=2:goto SettingScreen:
19630 if lang_flag = 1 then
19640 else
19650 locate 0,12:print " 3.トップ画面に行くを選択"
19660 endif
19670 'cls:color rgb(255,255,255):print"ok"
19680 'デバッグライン　ここまで
19690 case 3:
19700 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
19710 'デバッグライン　ここから
19720 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
19730 'デバッグライン　ここまで
19740 case 0:
19750 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
19760 'デバッグライン　ここから
19770 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
19780 'デバッグライン　ここまで
19790 end select
19800 endif
19810 'バーチャルパッド　上 ここから
19820 if y = -1 then
19830 select case No
19840 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
19850 case 1:
19860 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
19870 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
19880 case 0:
19890 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
19900 'No:3 3.Help→2.設定 No:2
19910 case 3:
19920 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
19930 case 2:
19940 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
19950 end select
19960 endif
19970 '決定ボタン
19980 if bg=1 then
19990 select case No
20000 '1.数霊チェックを選択  パッドの右キー
20010 case 1:
20020 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
20030 '2.設定を選択    パッドの右キー
20040 case 2:
20050 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
20060 '3.ヘルプを選択 パッドの右
20070 case 3:
20080 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
20090 'プログラムの終了を選択
20100 case 0:
20110 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
20120 'if lang_flag = 1 then
20130 'Else
20140 ui_msg "プログラムを終了します":end
20150 'endif
20160 end select
20170 endif
20180 '4.終了するを選択  パッドの右
20190 'バーチャルパッド　ここまで'
20200 'カーソル下'
20210 if key$ = chr$(31) then
20220 select case (No Mod 4)
20230 '登録文字から数霊文字の確認
20240 case 1:
20250 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
20260 '数霊文字の確認からトップ画面に行く
20270 case 2:
20280 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
20290 'トップ画面に行くから終了
20300 case 3:
20310 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
20320 '終了から登録文字
20330 case 0:
20340 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
20350 end select
20360 endif
20370 'カーソル　上
20380 if key$ = chr$(30) then
20390 select case (No Mod 4)
20400 case 1:
20410 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
20420 case 2:
20430 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
20440 case 3:
20450 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
20460 case 0:
20470 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
20480 end select
20490 endif
20500 'エンターキーを押したとき
20510 if key$ = chr$(13) then
20520 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
20530 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
20540 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
20550 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
20560 'lse
20570 'o'o SettingScreen:
20580 endif
20590 '結果表示設定
20600 Result_Setting:
20610 color rgb(255,255,255)
20620 'dim list$(4)
20630 'ファイル読み込み
20640 '1.ファイルが有るか無いかのチェック
20650 if Dir$(System$) = "" then
20660 '1-1.ファイルがないとき
20670 '上のSystemフォルダを作成
20680 mkdir "./System/"
20690 list$(0) = "●:出た数字から181を引く"
20700 list$(1) = " :出た数字から180を引き単数変換"
20710 open System$ for output as #1
20720 print #1,"config_r=0"
20730 close #1
20740 ui_msg "ファイルを作成しました"
20750 'ファイル作成
20760 else
20770 '1-2.ファイルが有るとき
20780 'config_r:0 出た数字から181を引く
20790 'config_r:1 出た数字から180を引いて単数変換
20800 'open "./System/config.sys" for input as #1
20810 'ファイルが有るときファイルを読み込み
20820 open System$ for input as #1
20830 line input #1,buf_line$
20840 'buf$にデーターをコピーする
20850 buf$ = buf_line$
20860 close #1
20870 if len(buf$) = 10 then
20880  if left$(buf$,9) = "config_r=" then
20890  buf$ = right$(buf_line$,1)
20900  if buf$ = "1" then
20910    '1.System$ ファイルを削除(config.sys)
20920    '2.1行目をconfig_r=1と書き、保存する
20930    buf_config_r = 1
20940    'list$(0) = "●:1.出た数字から180を引いて単数変換"
20950    'list$(1) = " :2.出た数字から181を引く"
20960    else
20970  if buf$ = "0" then
20980    buf_config_r = 0
20990   ' list$(0) = "●:1.出た数字から181を引く"
21000   'list$(1) = " :2.出た数字から180を引いて単数変換"
21010  endif
21020  endif
21030  endif
21040 endif
21050 endif
21060 '"●:1.出た数字から180を引く"をlist$(0)に代入
21070 if buf_config_r =  0 then
21080 list$(0) = "●:1.出た数字から181を引く"
21090 list$(1) = " :2.出た数字から180を引いて単数変換"
21100 else
21110 list$(0) = "●:1.出た数字から180を引いて単数変換"
21120 list$(1) = " :2.出た数字から181を引く"
21130 endif
21140 list$(2) = " :トップ画面に戻る"
21150 list_num = ui_select("list$","番号を選んでください")
21160 play ""
21170 Select case (list_num)
21180 case 0:
21190        if buf$ = "1" then
21200        buf_config_r = 0:
21210        'データーを変更したのでファイルを削除
21220        kill System$
21230        'ファイルを新しく作成
21240        open System$ for output as #1
21250        print #1,"config_r=0"
21260        close #1
21270        ui_msg "設定を変更しました。"
21280        else
21290        'if buf$ = "0" then
21300        'buf_config_r = 1
21310        'kill System$
21320        'open Syetem$ for output as #1
21330        'print #1,"config_r=1"
21340        'close #1
21350        'ui_msg "設定を変更しました"
21360        'endif
21370        endif
21380        goto config_moji2:
21390 case 1:
21400        if buf$ = "0" then
21410        buf_config_r = 1:
21420        'データーを変更したので、ファイルを削除
21430        kill System$
21440        'ファイルを新しく作成
21450        open System$ for output as #1
21460        print #1,"config_r=1"
21470        close #1
21480        ui_msg "設定を変更しました"
21490        else
21500        kill System$
21510        if buf$ = "1" then
21520        open System$ for output as #1
21530        print #1,"config_r=0"
21540        close #1
21550        ui_msg "設定を変更しました"
21560        endif
21570        endif
21580        goto config_moji2:
21590 case 2:
21600       'トップ画面に飛ぶ
21610        goto TopScreen:
21620 case 3:
21630       'プログラムを終了する
21640       cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
21650 end select
21660 '単数変換
21670 Func Single_Complate(num)
21680 '1.出てきた数字から180を引く
21690 a = num - 180
21700 'a:10〜99
21710 Re1:
21720 if (a > 9 and a < 100) then
21730  b1 = fix(a / 10)
21740  b2 = 10 * a - b1
21750  d1 = b1 + b2
21760 if c > 9 then
21770  goto Re1:
21780 else
21790  c = d1:goto Re2:
21800 endif
21810 endif
21820 Re2:
21830 buffer = c
21840 endfunc buffer
21850 Func Surei_Result_Save_File()
21860 'ファイルがないとき
21870 if dir$(SAVE_DATA1$) = "" then
21880 open SAVE_DATA1$ for output as #1
21890 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
21900 close #1
21910 ui_msg "保存しました":talk "保存しました":goto Surei_Result:
21920 else
21930 open SAVE_DATA1$ for append as #1
21940 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
21950 close #1
21960 ui_msg "保存しました":talk "保存しました":goto Surei_Result
21970 endif
21980 endfunc
21990 '言語設定
22000 Setting_Language:
22010 cls 3:gload Gazo$ + "Screen1.png":screen 1,1,1:No=2
22020 gload Gazo$ + "downscreen.png",0,0,800
22030 init "Kb:4"
22040 sp_on 1,1:sp_on 0,0
22050 sp_put 0,(0,300),0,0
22060 sp_put 1,(0,400),1,0
22070 color rgb(0,0,255)
22080 'print "番号を選んでください"+chr$(13)
22090 'if lang_flag=0 then
22100 'print "言語設定:日本語"+chr$(13)
22110 'else
22120 'print "言語設定:英 語"+chr$(13)
22130 Change_Language:
22140 if lang_flag = 1 then
22150 cls
22160 print "It has changed Language"+chr$(13)
22170 color rgb(255,255,255)
22180 print "Select the Number"+chr$(13)
22190 print " :1.English → Japanse"+chr$(13)
22200 print " :2.It goes to TopScreen"+chr$(13)
22210 print "Language:In English" +chr$(13)
22220 else
22230 cls:color rgb(255,255,255)
22240 print "設定変更(言語の変更)" + chr$(13)
22250 color rgb(255,255,255)
22260 print chr$(13)
22270 print "番号を選んでください"+chr$(13)
22280 print " :1.日本語 → 英語に変更" + chr$(13)
22290 print " :2.トップ画面に戻る" + chr$(13)
22300 print chr$(13)
22310 print "設定言語:日本語" + chr$(13)
22320 endif
22330 color rgb(0,0,0)
22340 locate 0,15:print "                                       ":locate 0,15:print "2.トップ画面に戻る　を選択" + chr$(13)
22350 Setting_Language_key:
22360 y=0:key$="":bg=0
22370 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y<> -1 and bg<> 1)
22380 y=stick(1)
22390 key$=inkey$
22400 bg=strig(1)
22410 pause 2
22420 wend
22430 '選択肢変更
22440 if ((y=1) or (y=-1)) then
22450 select case No
22460 case 2:
22470      '実装部分　ここから
22480      pause 200:No=1:sp_on 0,1:sp_on 1,0:locate 0,15:print "                                                         ":locate 0,15:print "1.日本語 → 英語に変更を選択": goto Setting_Language_key:
22490      '実装部分　ここまで
22500 case 1:
22510       pause 200: No=2:sp_on 0,0:sp_on 1,1:locate 0,15:print "                                                       ":locate 0,15:print "2.トップ画面に戻る を選択":goto Setting_Language_key:
22520 end select
22530 endif
22540 'Enter Key  決定ボタン
22550 if ((key$=chr$(13)) or (bg=1)) then
22560 select case No
22570 case 2:
22580         sp_on 0,0:sp_on 1,0:goto TopScreen:
22590 case 1:                                                     'lang_flag=1:sp_on 0,0:sp_on 1,0:goto Change_Language:
22600       '
22610 '未実装　ここから
22620  sp_on 0,1:sp_on 1,0:ui_msg "この機能は未実装です":goto Setting_Language_key:
22630 '
22640 '未実装　ここまで
22650 end select
22660 endif
22670  '配列削除
22680 buffer_clear:
22690 erase bufline$
22700 erase bufcount$
22710 erase bufcount1$
22720 erase bufcount2$
22730 erase bufline2$
22740 erase bufline3$
22750 erase bufKaztama$
22760 erase List$
22770 erase Result_Menu_List$
22780 erase list$
22790 erase moji_List$
22800 'ui_msg "メモリーをクリアしました"
22810 return
22820 '配列削除　ここまで
