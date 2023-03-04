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
520 'March(2023)
530 'Version 1.3.5_2023.02.27-2023.03.05(Release):正式版
540 '現在のバージョン
550 Version$ = "1.3.5_2023.03.05(正式版)"
560 'csvファイル 1.数霊 ベースファイル
570 FILE_csv$ = "./data/Kazutama.csv"
580 'csvファイル 2.数霊 ベースファイル 2
590 FILE_csv2$ = "./data/Surei_chart_20211207.csv"
600 'Save ファイル
610 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
620 'gazo ファイル
630 Gazo$ = "./data/Gazo/"
640 'System フォルダ:設定ファイルを保存するところ
650 System$ = "./System/config.sys"
660 '設定ファイル名:config.sys
670 'Sound File(Voice)
680 '1.ボイス TopScreen
690 Voice_File_TopScreen$ = "./data/Sound_data/"
700 'Message
710 buf_finish_Message$ = "メモリーを解放してプログラムを終了します"
720 '変数領域
730 'vcount:バーチャルパッド下の変数
740 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
750 count2 = 0:N=0:N2=0:m2 = 0
760 dim list$(4),moji_List$(2)
770 'ファイルの有無チェック
780 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
790 '1.ファイルが無いとき
800 cls :print "依存ファイルが見つかりません":
810 print "エンターキーを押してください" + chr$(13)
820 key$ = input$(1)
830 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
840 else
850 '2.ファイルが有るとき
860 cls:print "csv:file ok." + chr$(13)
870 n=0
880 'FILE_csv$:数霊データー入力
890 open FILE_csv$ for input as #1
900 while eof(1) = 0
910 input #1,line$
920 bufline$(n) = line$
930 'Print n;chr$(13)
940 '登録件数カウント:n
950 n = n + 1
960 wend
970 close #1
980 N=n
990 '2つ目のファイル読み込み
1000 'n = 0
1010 open FILE_csv2$ for input as #2
1020 for n=3 to 181
1030 for i=0 to 1
1040 input #2,line$
1050 bufline2$(n,i) = line$
1060 next i
1070 next n
1080 close #2
1090 N2 = n
1100 endif
1110 '2022.11.23----------------------
1120 '端末言語のチェック
1130 '日本語端末かチェックをして日本語以外なら英語で表示する
1140 'lang flag:0:日本語 1:英語(日本語以外)
1150 '--------------------------------
1160 lang_flag = 0
1170 if ex_info$(1) <> "JP" then
1180 lang_flag = 1
1190 endif
1200 'Top画面
1210 TopScreen:
1220 'バーチャルパッドを表示
1230 cls 3:font 48:screen 1,1,1,1:init"kb:4":init"crt:0"
1240 'play ""
1250 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
1260 'gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
1270 gload Gazo$ + "TopScreen_20230129.png",0,0,0
1280 '選択肢 1
1290 gload Gazo$ + "Selection.png",1,5,300
1300 '選択肢 2
1310 gload Gazo$ + "Selection.png",1,5,400
1320 '選択肢 3
1330 gload Gazo$ + "Selection.png",1,5,500
1340 '選択肢 4
1350 gload Gazo$ + "Selection.png",1,5,600
1360 color rgb(0,0,255)
1370 print chr$(13)
1380 if lang_flag = 1 then
1390 color rgb(255,255,255)
1400 print "Select Number" + chr$(13)
1410 print " :1.Kazutama check" + chr$(13)
1420 print " :2.Setting" + chr$(13)
1430 print " :3.Help" + chr$(13)
1440 print " :4.End Program" + chr$(13)
1450 color rgb(255,255,255)
1460 else
1470 color rgb(255,255,255)
1480 print chr$(13)
1490 print "番号を選んでください" + chr$(13)
1500 print " :1.数霊(かずたま)チェック" + chr$(13)
1510 print " :2.設定" + chr$(13)
1520 print " :3.ヘルプ" + chr$(13)
1530 print " :4.終　了" + chr$(13)
1540 color rgb(0,0,0)
1550 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
1560 'バーチャルパッドを表示
1570 No=1:
1580 'lang_flag:1 外国語,0:日本語
1590 if lang_flag = 1 then
1600 'lang_flag=1 英語
1610 locate 0,15:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
1620 else
1630 'lang_flag=0 日本語
1640 locate 0,15:color rgb(0,0,0):print " 1.数霊(かずたま)チェックを選択";chr$(13)
1650 endif
1660 endif
1670 'スプライト
1680 '選択肢 1 On
1690 sp_def 0,(5,300),32,32
1700 sp_on 0,1
1710 sp_put 0,(5,300),0,0
1720 '選択肢 2 Off
1730 sp_def 1,(5,400),32,32
1740 sp_on 1,0
1750 sp_put 1,(5,400),0,0
1760 '選択肢 3 Off
1770 sp_def 2,(5,500),32,32
1780 sp_on 2,0
1790 sp_put 2,(5,500),0,0
1800 '選択肢 4 Off
1810 sp_def 3,(5,600),32,32
1820 sp_on 3,0
1830 sp_put 3,(5,600),0,0
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
1950 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
1960 '1.バーチャルパッドの処理
1970 'バーチャルパッド下を押した時
1980 if y = 1 then
1990 select case No
2000 'No の初期値：No=1
2010 case 1:
2020 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
2030 if lang_flag = 1 then
2040 'lang_flag=1 英語
2050 locate 0,15:print "2.It has selected Setting":goto Main_Select:
2060 else
2070 'lang_flag=0 日本語
2080 locate 0,15:print " 2.設定を選択":goto Main_Select:
2090 endif
2100 'デバッグライン　ここから
2110 '0のとき
2120 'デバッグライン　ここまで
2130 'デバッグライン　ここから
2140 'バーチャルパッド　下
2150 case 2:
2160 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:
2170 print "                                         ":
2180 if lang_flag = 1 then
2190 color rgb(0,0,0):locate 0,15:
2200 print "3.It has selected Help":No=3:goto Main_Select:
2210 else
2220 color rgb(0,0,0):locate 0,15:print "                                                         ":locate 0,15:
2230 print " 3.ヘルプを選択":No=3:goto Main_Select:
2240 endif
2250 'デバッグライン　ここまで
2260 case 3:
2270 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print"                                               "
2280 if lang_flag = 1 then
2290 locate 0,15:print "4.It has selected finish program":No=0:goto Main_Select:
2300 else
2310 locate 0,15:print "                                                         " :locate 0,15:print " 4.終了を選択":No=0:goto Main_Select:
2320 endif
2330 'デバッグライン　ここから
2340 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
2350 'デバッグライン　ここまで
2360 case 0:
2370 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1
2380 if lang_flag = 1 then
2390 'lang_flag=1:英語
2400 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
2410 else
2420 'lang_flag=0:日本語
2430 locate 0,15:print "                                      ":locate 0,15:print " 1.数霊(かずたま)チェックを選択":goto Main_Select:
2440 'endif
2450 endif
2460 'デバッグライン　ここから
2470 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
2480 'デバッグライン　ここまで
2490 end select
2500 endif
2510 'バーチャルパッド　上 ここから
2520 if y = -1 then
2530 select case No
2540 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
2550 case 1:
2560 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       "
2570 'if lang_flag = 1 then
2580 'lang_flag=1 英語
2590 'locate 0,15:print "4.It has finished program":goto Main_Select:
2600 'else
2610 'lang_flag=0 日本語
2620 locate 0,15:print "                                                          ":
2630 locate 0,15:print " 4.終了を選択":goto Main_Select:
2640 'endif
2650 'endif
2660 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
2670 case 0:
2680 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":
2690 if lang_flag = 1 then
2700 '1:英語
2710 locate 0,15:print "3.It has selected Help":goto Main_Select:
2720 else
2730 '0:日本語
2740 locate 0,15:print "                                                                                        "
2750 locate 0,15:print " 3.ヘルプを選択":goto Main_Select:
2760 endif
2770 'No:3 3.Help→2.設定 No:2
2780 case 3:
2790 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      "
2800 if lang_flag = 1 then
2810 '1:英語
2820 locate 0,15:print "2.It has selected Setting":goto Main_Select:
2830 else
2840 '0:日本語
2850 locate 0,15:print" 2.設定を選択":goto Main_Select:
2860 endif
2870 case 2:
2880 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":
2890 if lang_flag = 1 then
2900 'lang_flag 1 英語
2910 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
2920 else
2930 'lang_flag 0 日本語
2940 locate 0,15:print" 1.数霊(かずたま)チェックを選択":goto Main_Select:
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
3110 cls 3:cls 4:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg buf_finish_Message$:pause 4.080*1000:color rgb(255,255,255):end
3120 'if lang_flag = 1 then
3130 'lang_flag = 1 英語
3140 'else
3150 'lang_flag = 0 日本語
3160 'endif
3170 end select
3180 '4.終了するを選択  パッドの右
3190 endif
3200 'バーチャルパッド　上　ここまで
3210 '2.カーソルの処理
3220 'カーソル　下 chr$(31)
3230 if (key$ = chr$(31)) then
3240 select case (No)
3250 '4
3260 '0 選択肢4 => 選択肢1
3270 case 0:
3280 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "              ":color rgb(0,0,0):
3290 if lang_flag = 1 then
3300 'lang flag:1 英語
3310 else
3320 'lang flag:0 日本語
3330 color rgb(0,0,0):locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
3340 endif
3350 '1 選択肢1 => 選択肢2
3360 case 1:
3370 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":
3380 if lang_flag = 1 then
3390 'lang_flag:1 英語
3400 else
3410 'lang_flag:0 日本語
3420 color rgb(0,0,0):locate 0,15:print "2.設定を選択":beep:goto Main_Select:
3430 endif
3440 '2 選択肢2 => 選択肢3
3450 case 2:
3460 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,15:print "               ":
3470 if lang_flag = 1 then
3480 'lang flag:1 英語
3490 else
3500 'lang flang:0 日本語
3510 color rgb(0,0,0):locate 0,15:print "3.ヘルプを選択":goto Main_Select:
3520 endif
3530 '3 選択肢３ => 選択肢4
3540 case 3:
3550 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "               ":color rgb(0,0,0)
3560 if lang_flag = 1 then
3570 'lang_flag = 1 英語
3580 else
3590 'lang_flag = 0 日本語
3600 color rgb(0,0,0):locate 0,15:print "4.終 了を選択":goto Main_Select:
3610 endif
3620 case else:
3630 goto Main_Select:
3640 end select
3650 endif
3660 'カーソル　上
3670 if key$=chr$(30) then
3680 select case (No)
3690 '選択肢1 => 選択肢4
3700 case 1:
3710 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:PRINT "                      ":
3720 if lang_flag = 1 then
3730 'lang_flag=1:英語
3740 'print "1.It has selected Kazutama check":goto Main_Select:
3750 else
3760 'lang_flag = 0:日本語
3770 else
3780 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
3790 endif
3800 '選択肢2 => 選択肢1
3810 case 2:
3820 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                 ":locate 1,15:print "2.設 定を選択":goto Main_Select:
3830 '選択肢3　=> 選択肢2
3840 case 3:
3850 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,500),0,0
3860 if lang_flag = 1 then
3870 'lang_flag = 1:英語
3880 locate 0,15:print "It has selected Help":goto Main_Select:
3890 else
3900 'lang_flag = 0:日本語
3910 locate 0,15:print "3.ヘルプを選択":goto Main_Select:
3920 endif
3930 '選択肢4 => 選択肢3
3940 case 0:
3950 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                ":locate 1,15:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
3960 if lang_flag = 1 then
3970 'lang flag=1 英語
3980 else
3990 'lang flag=0 日本語
4000 locate 1,15:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
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
4130 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg buf_finish_Message$:color rgb(255,255,255):pause 4.080 * 1000:end
4140 case 2:
4150 color rgb(255,255,255):sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
4160 end select
4170 endif
4180 '1-1.数霊チェック
4190 Surei_Check:
4200 cls 3:Font 48:
4210 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png"
4220 play ""
4230 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
4240 color rgb(255,0,0)
4250 'print "●数霊(かずたま)チェックトップ" + chr$(13)
4260 sp_on 0,1:sp_put 0,(5,300),0,0:screen 1,1,1
4270 if lang_flag = 1 then
4280 'lang_flag=1 英語
4290 else
4300 'lang_flag=0 日本語
4310 print chr$(13)+chr$(13)+chr$(13)
4320 color rgb(255,255,255)
4330 print "番号を選んでください" + chr$(13)
4340 print " :1.数霊(かずたま)1人用" + chr$(13)
4350 print " :2.数霊(かずたま)2人用" + chr$(13)
4360 print " :3.トップ画面に行く" + chr$(13)
4370 color rgb(0,0,0):No = 1
4380 locate 0,15:print "                                       "
4390 locate 0,15
4400 print " 1.数霊(かずたま)1人用を選択"
4410 endif
4420 Kazutama_main:
4430 'y:バーチャルパッドの処理
4440 'key$:カーソルの処理
4450 'bg:バーチャルパッドの右のボタン
4460 y = 0:key$ = "":bg=0
4470 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
4480 y = stick(1)
4490 key$ = inkey$
4500 bg=strig(1)
4510 y=stick(-1)
4520 pause 2
4530 wend
4540 'key$ = input$(1)
4550 if y = 1 then
4560 select case No
4570 'No の初期値：No=1
4580 case 1:
4590 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
4600 locate 0,15:print "                                     "
4610 locate 0,15
4620 print" 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
4630 'デバッグライン　ここから
4640 '0のとき
4650 'デバッグライン　ここまで
4660 'デバッグライン　ここから
4670 case 2:
4680 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                               "
4690 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に行くを選択":No=0:goto Kazutama_main:
4700 'デバッグライン　ここまで
4710 'デバッグライン　ここから
4720 'デバッグライン　ここまで
4730 case 0:
4740 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
4750 'デバッグライン　ここから
4760 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
4770 'デバッグライン　ここまで
4780 end select
4790 endif
4800 'バーチャルパッド　上 ここから
4810 if y = -1 then
4820 select case No
4830 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
4840 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
4850 case 1:
4860 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
4870 'No:3 3.Help→2.設定 No:2
4880 case 0:
4890 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 0,15:print" 2.数霊（かずたま）2人用を選択":goto Kazutama_main:
4900 case 2:
4910 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
4920 end select
4930 endif
4940 if bg=1 then
4950 select case No
4960 '1.数霊チェックを選択  パッドの右キー
4970 case 1:
4980 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
4990 '2.設定を選択    パッドの右キー
5000 case 2:
5010 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
5020 '3.ヘルプを選択 パッドの右
5030 case 0:
5040 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
5050 'プログラムの終了を選択
5060 end select
5070 '4.終了するを選択  パッドの右
5080 endif
5090 'バーチャルパッド　上　ここまで
5100 if key$ = chr$(31) then
5110 select case No
5120 case 0:
5130 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,15:print "                                                          ":
5140 if lang_flag = 1 then
5150 Else
5160 locate 0,15:print "                                      "
5170 No=2:locate 0,15:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
5180 endif
5190 case 1:
5200 No=0:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,12:print "                                                          ":
5210 if lang_flag = 1 then
5220 Else
5230 locate 0,15:print"                                      "
5240 locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
5250 endif
5260 case 2:
5270 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                      ":
5280 if lang_flag = 1 then
5290 Else
5300 No=1:locate 0,15:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
5310 endif
5320 end select
5330 endif
5340 if key$=chr$(13) then
5350 select case No
5360 case 1:
5370 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
5380 case 2:
5390 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
5400 case 3:
5410 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
5420 '終了はトップメニューのみにする
5430 end select
5440 endif
5450 '前の画面に戻る
5460 'プログラムの終了
5470 '1人用
5480 '2人用
5490 '数霊(かずたま) 文字入力  1人用
5500 Surei_Input:
5510 if mode = 0 then
5520 cls 3:font 32:init"kb:2"
5530 gload Gazo$ + "InputKotodama_20230131.png"
5540 play""
5550 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
5560 color rgb(255,0,0)
5570 if lang_flag=1 then
5580 '英語
5590 else
5600 print chr$(13)+chr$(13)+chr$(13)
5610 color rgb(255,255,255)
5620 print "文字を入れてください" + chr$(13)
5630 color rgb(255,255,255)
5640 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
5650 print chr$(13)
5660 color rgb(0,0,0)
5670 Input "入力文字:",buffer_moji$
5680 if buffer_moji$ = "" then
5690 ui_msg "未入力です":goto Surei_Input:
5700 else
5710 goto Surei_Result:
5720 endif
5730 endif
5740 endif
5750 if mode = 1 then
5760 cls 3:Font 32:
5770 gload Gazo$ + "InputKotodama.png"
5780 color rgb(255,0,0)
5790 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
5800 color rgb(255,255,255)
5810 print "文字を入れてください" + chr$(13)
5820 color rgb(255,0,0)
5830 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
5840 print "大文字のみ)" + chr$(13)
5850 color rgb(0,0,0)
5860 Input "文字入力:",buffer_moji2$
5870 goto Surei_Result3:
5880 'endif
5890 endif
5900 '数霊(かずたま)文字入力　2人用
5910 Surei_twoParson:
5920 cls 3:Font 32:init"kb:2"
5930 gload Gazo$ + "InputKotodama_20230131.png"
5940 '1人目入力
5950 if lang_flag = 1 then
5960 else
5970 print ""+chr$(13)+chr$(13)+chr$(13)
5980 color rgb(255,255,255)
5990 print "1人目の文字を入れてください" + chr$(13)
6000 color rgb(255,255,255)
6010 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
6020 color rgb(0,0,0)
6030 print chr$(13)
6040 Input "1人目文字入力:",buf_Parson1$
6050 endif
6060 Surei_twoParson2:
6070 cls 3:Font 32:init"kb:2"
6080 '2人目入力
6090 gload Gazo$ + "InputKotodama_20230131.png"
6100 if lang_falg = 1 then
6110 else
6120 print ""+chr$(13)+chr$(13)+chr$(13)
6130 color rgb(255,255,255)
6140 print "2人目の文字を入れてください" + chr$(13)
6150 color rgb(255,255,255)
6160 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
6170 color rgb(0,0,0)
6180 Input "2人目の文字入力:",buf_Parson2$
6190 goto Surei_Result2:
6200 endif
6210 '数霊　計算 パート
6220 '文字の計算関数
6230 'moji$:1文字を入れる
6240 func Complate(moji$)
6250 for n = 1 to 116
6260 if moji$ = bufline$(2*n) then
6270 buffcount = val(bufline$(2 * n + 1))
6280 endif
6290 next n
6300 endfunc buffcount
6310 '数霊　結果表示
6320 Surei_Result:
6330 cls 3:Font 32
6340 'ゼロカウント:zcount
6350 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
6360 '例 アカい:"い"の文字は無効な文字なので、はじく
6370 zcount=0
6380 'mojicount:入力文字数
6390 mojicount = len(buffer_moji$)
6400 for n=1 to mojicount
6410 for j=1 to 118
6420 if (bufcount$(n - 1) = bufline$(2 * j)) then
6430   bufcount$(n-1) = Mid$(buffer_moji$,n,1)
6440 endif
6450 next j
6460 next n
6470 ncount=0:count=0
6480    for i = 1 to mojicount
6490     bufcount$(i-1)=Mid$(buffer_moji$,i,1)
6500   'ンのカウント
6510    if (bufcount$(i-1) = "ン") then ncount = ncount + 1
6520    next i
6530    if (ncount > 0) then
6540    'Listを表示する
6550    moji_List$(0) = "この単語は目に見える物です"
6560    moji_List$(1) = "この単語は目に見えない物です"
6570    num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
6580    if (num2 = 0) then
6590    else
6600    if (num2 = 1) then
6610       n1 = 9 * ncount
6620    endif
6630    endif
6640    endif
6650    for j=1 to mojicount
6660    bufcount$(j-1) = Mid$(buffer_moji$,j,1)
6670    count = count + Complate(bufcount$(j - 1))
6680    next j
6690    count = count + n1
6700 if (ncount > 0) then count = count
6710 '182以上のとき,181を引く
6720 if buf_cofig_r = 0 then
6730      if (count > 181) then
6740         count = count - 181
6750      else
6760      if (buf_config_r = 1) then
6770        buf_count = Single_Complate(count)
6780      endif
6790 endif
6800 endif
6810 cls 3:Font 48+16
6820 gload Gazo$ + "Result_Screen3_20211226.png"
6830 if buf_config_r = 1 then
6840    print "入力文字:" + buffer_moji$ + chr$(13)
6850    print "数霊(かずたま):";buf_count;chr$(13)
6860 endif
6870 if lang_flag = 1 then
6880 else
6890 color rgb(255,0,0)
6900 print "入力文字:" + buffer_moji$ + chr$(13)
6910 endif
6920 if lang_flag = 1 then
6930 else
6940 color rgb(0,0,255)
6950 print "数霊(かずたま):";count;chr$(13)
6960 endif
6970 if lang_flag = 1 then
6980 else
6990 color rgb(0,0,0)
7000 print "エンター or スペース" + chr$(13)
7010 print  chr$(13)
7020 'endif
7030 endif
7040 key$ = input$(1)
7050 if ((key$ = chr$(13)) or (key$=" ")) then
7060 List$(0)="1.もう一度数霊を見る"
7070 List$(1)="2.トップ画面に行く"
7080 List$(2)="3.この数霊の説明を見る"
7090 List$(3)="4.数霊データーを保存"
7100 num=ui_select("List$","番号を選んでください")
7110 select case num
7120   case 0:
7130          goto Surei_Input:
7140   case 1:
7150        n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
7160          for i=0 to 9
7170             bufcount$(i)=""
7180          next i
7190          goto TopScreen:
7200   case 2:
7210        goto Surei_Result4:
7220   case 3:
7230         s=Surei_Result_Save_File()
7240         ui_msg "保存しました"
7250   case -1:
7260        'goto Surei_Result:
7270   case else:
7280        goto Surei_Result:
7290 end select
7300 'ファイルを保存する
7310 else
7320 goto Surei_Result:
7330 endif
7340 '3-1 バージョン情報
7350 Version:
7360 cls 3:Font 32
7370 gload Gazo$ + "Screen1_Version.png"
7380 play ""
7390 play Voice_File_TopScreen$ + "Voice_Version.mp3"
7400 color rgb(255,0,0)
7410 print chr$(13)
7420 color rgb(255,255,255)
7430 if lang_flag = 1 then
7440 else
7450 print chr$(13)+chr$(13)+chr$(13)
7460 print "Ver:";Version$ + chr$(13)
7470 print "アプリ名:数霊計算機" + chr$(13)
7480 print "Basic for Android Runtime" + chr$(13)
7490 print "Author:licksjp" + chr$(13)
7500 print "制作開始:2021.7.28" + chr$(13)
7510 print chr$(13)
7520 print "(C)Copy right licksjp " + chr$(13)
7530 print "All rights reserved" + chr$(13)
7540 print chr$(13)
7550 color rgb(0,0,0)
7560 print "パッドの右を押してください" + chr$(13)
7570 endif
7580 bg=0:key$=""
7590 while (bg <> 1 and key$ <> chr$(13))
7600 bg = strig(1)
7610 key$ = inkey$
7620 pause 2
7630 wend
7640 if key$ = chr$(13) then
7650 goto TopScreen:
7660 else
7670 if bg=1 then
7680 goto TopScreen:
7690 else
7700 if lang_flag = 1 then
7710 else
7720 talk "無効なキーです":goto Version:
7730 endif
7740 endif
7750 endif
7760 '3-2 参考文献
7770 Reference_Book:
7780 cls 3:Font 48:play""
7790 gload Gazo$ + "Screen1_Reference.png"
7800 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
7810 color rgb(255,0,0)
7820 print chr$(13)+chr$(13)
7830 if lang_flag = 1 then
7840 else
7850 color rgb(255,255,255)
7860 print "書名:数霊" + chr$(13)
7870 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
7880 print "出版社:徳間書店" + chr$(13)
7890 print "ISBN:978-4-19-" + chr$(13)
7900 print "         865309-5" + chr$(13)
7910 print "定価:2300円 + 税" + chr$(13)
7920 color rgb(0,0,0)
7930 print "パッドの右を押してください"
7940 endif
7950 bg = 0:key$ = ""
7960 while (bg <> 1 and key$ <> chr$(13))
7970 bg = strig(1)
7980 key$ = inkey$
7990 pause 2
8000 wend
8010 if key$ = chr$(13) then
8020 goto TopScreen:
8030 else
8040 if bg = 1 then
8050 goto TopScreen:
8060 else
8070 talk "無効なキーです":goto Reference_Book:
8080 endif
8090 endif
8100 'ヘルプ画面　トップ画面
8110 Help:
8120 No=1:c=0
8130 play ""
8140 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
8150 cls 3:Font 48:
8160 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
8170 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0
8180 color rgb(255,0,0)
8190 print chr$(13)+chr$(13)+chr$(13)
8200 color rgb(255,255,255)
8210 print "番号を選んでください" + chr$(13)
8220 print " :1.バージョン" + chr$(13)
8230 print " :2.参考文献" + chr$(13)
8240 print " :3.トップ画面に行く" + chr$(13)
8250 color rgb(0,0,0)
8260 locate 0,15:print "                                     "
8270 if No = 1 then locate 0,15:print " 1.バージョンを選択"
8280 'y:バーチャルパッドの処理
8290 'key$:カーソルの処理
8300 'bg:バーチャルパッドの右ボタン
8310 Help_key:
8320 y = 0:key$ = "":bg=0
8330 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
8340 y = stick(1)
8350 key$ = inkey$
8360 bg=strig(1)
8370 pause 2
8380 wend
8390 'バーチャルパッド　ここから'
8400 if y = 1 then
8410 select case No
8420 'No の初期値：No=1
8430 case 1:
8440 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
8450 if lang_flag = 1 then
8460 else
8470 locate 0,15:print" 2.参考文献を選択":goto Help_key:
8480 endif
8490 'デバッグライン　ここから
8500 '0のとき
8510 'デバッグライン　ここまで
8520 'デバッグライン　ここから
8530 case 2:
8540 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                  "
8550 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に行くを選択":No=0:goto Help_key:
8560 'デバッグライン　ここまで
8570 'デバッグライン　ここから
8580 'デバッグライン　ここまで
8590 case 0:
8600 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
8610 'デバッグライン　ここから
8620 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
8630 'デバッグライン　ここまで
8640 end select
8650 endif
8660 'バーチャルパッド　上 ここから
8670 if y = -1 then
8680 select case No
8690 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
8700 case 0:
8710 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=1:locate 0,15:print"                                       ":locate 0,15:print" 3.トップ画面に行くを選択":goto Help_key
8720 'No:3 3.Help→2.設定 No:2
8730 case 1:
8740 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
8750 case 2:
8760 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=0:locate 0,15:print "                                      ":locate 0,15:print" 1.バージョンを選択":goto Help_key:
8770 end select
8780 endif
8790 if bg = 1 then
8800 select case No
8810 '1.数霊チェックを選択  パッドの右キー
8820 case 1:
8830 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
8840 '2.設定を選択    パッドの右キー
8850 case 2:
8860 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
8870 '3.ヘルプを選択 パッドの右
8880 case 0:
8890 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
8900 'プログラムの終了を選択
8910 'if lang_flag = 1 then
8920 'lang_flag = 1:英語
8930 'Else
8940 'lang_flag = 0:日本語
8950 'endif
8960 end select
8970 '4.終了するを選択  パッドの右
8980 endif
8990 'バーチャルパッド　上　ここまで
9000 'バーチャルパッド　ここまで'
9010 'key$ = input$(1)
9020 'カーソルの下
9030 if key$ = chr$(31) then
9040 select case (No Mod 4)
9050 'バージョンから参考文献
9060 case 0:
9070 c=1:No=c:locate 0,15:Print "             ":locate 0,15:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
9080 '参考文献からトップ画面
9090 case 1:
9100 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "            ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
9110 'トップ画面から終了
9120 '終了からバージョン
9130 case 2:
9140 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                     ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
9150 case else:
9160 goto Help_key:
9170 end select
9180 endif
9190 'カーソル　上
9200 if key$ = chr$(30) then
9210 select case (c Mod 4)
9220 'バージョンから終了
9230 case 0:
9240 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:locate 0,15:print "                   ":locate 0,15:print " 4.終 了を選択":goto Help_key:
9250 '参考文献からバージョン
9260 case 1:
9270 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                   ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
9280 'トップ画面から参考文献
9290 case 2:
9300 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":locate 0,15:print " 2.参考文献を選択":goto Help_key:
9310 '終了からトップ画面を選択
9320 case 3:
9330 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print"                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
9340 case else:
9350 goto Help_key:
9360 end select
9370 endif
9380 'エンターキー：決定
9390 if key$=chr$(13) then
9400 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
9410 if No=0 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
9420 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
9430 else
9440 goto Help_key:
9450 endif
9460 '登録文字の確認
9470 '文字を1文字入れて登録されているか調べるメニュー
9480 '設定項目
9490 Setting:
9500 cls 3:Font 48
9510 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
9520 play ""
9530 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
9540 No=1
9550 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:
9560 color rgb(0,0,255)
9570 print chr$(13)
9580 if lang_flag = 1 then
9590 'lang_flag = 1:英語
9600 else
9610 'lang_flag = 0:日本語
9620 color rgb(255,255,255)
9630 print chr$(13)
9640 print "番号を選んでください" + chr$(13)
9650 '-------コメント----------------
9660 'print " :1.登録文字の確認" + chr$(13)
9670 'print " :2.数霊文字確認" + chr$(13)
9680 '-------コメント----------------
9690 'print chr$(13)
9700 print " :1.文字の項目" + chr$(13)
9710 print " :2.結果表示設定" + chr$(13)
9720 print " :3.言語設定" + chr$(13)
9730 print " :4.トップ画面に行く" + chr$(13)
9740 endif
9750 color rgb(0,0,0)
9760 locate 0,15
9770 if No=1 then locate 0,15:print  "                                     ":locate 0,15:print " 1.文字の項目を選択"
9780 'y:バーチャルパッドの処理
9790 'key$:カーソルの処理
9800 'bg:バーチャルパッドの右ボタン
9810 SettingScreen:
9820 y = 0:key$ = "":bg=0
9830 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
9840 y = stick(1)
9850 key$ = inkey$
9860 bg=strig(1)
9870 pause 2
9880 wend
9890 'バーチャルパッド　ここから'
9900 'バーチャルパッド　ここから'
9910 if y = 1 then
9920 select case No
9930 'No の初期値：No=1
9940 case 1:
9950 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":color rgb(0,0,0):locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
9960 'デバッグライン　ここから
9970 '0のとき
9980 'デバッグライン　ここまで
9990 'デバッグライン　ここから
10000 case 2:
10010 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                         "
10020 color rgb(0,0,0)::No=3
10030 if lang_flag = 1 then
10040 else
10050 locate 1,15:print "3.言語設定を選択":goto SettingScreen:
10060 endif
10070 'デバッグライン　ここまで
10080 case 3:
10090 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:locate 0,15:print"                                              ":locate 1,15:print "4.トップ画面に行くを選択":No=0:goto SettingScreen:
10100 'デバッグライン　ここから
10110 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
10120 'デバッグライン　ここまで
10130 case 0:
10140 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
10150 'デバッグライン　ここから
10160 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
10170 'デバッグライン　ここまで
10180 end select
10190 endif
10200 'バーチャルパッド　上 ここから
10210 if y = -1 then
10220 select case No
10230 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
10240 case 1:
10250 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 1,15:print"4.トップ画面に行くを選択":goto SettingScreen:
10260 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
10270 case 0:
10280 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
10290 'No:3 3.Help→2.設定 No:2
10300 case 3:
10310 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.結果表示設定を選択":goto SettingScreen:
10320 case 2:
10330 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 1,15:print"1.文字の項目を選択":goto SettingScreen:
10340 end select
10350 endif
10360 if bg=1 then
10370 select case No
10380 '1.数霊チェックを選択  パッドの右キー
10390 case 1:
10400 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
10410 '2.設定を選択    パッドの右キー
10420 case 2:
10430 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
10440 '3.ヘルプを選択 パッドの右
10450 case 0:
10460 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
10470 'プログラムの終了を選択
10480 case 3:
10490 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Setting_Language:
10500 end select
10510 endif
10520 '4.終了するを選択  パッドの右
10530 'バーチャルパッド　ここまで'
10540 'カーソル下'
10550 if key$ = chr$(31) then
10560 select case (No Mod 4)
10570 '登録文字から数霊文字の確認
10580 case 1:
10590 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                     ":locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
10600 '数霊文字の確認からトップ画面に行く
10610 case 2:
10620 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "                                     ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
10630 'トップ画面に行くから終了
10640 case 3:
10650 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                                       ":locate 1,15:print "4.トップ画面に行くを選択":goto SettingScreen:
10660 '終了から登録文字
10670 case 0:
10680 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
10690 end select
10700 endif
10710 'カーソル　上
10720 if key$ = chr$(30) then
10730 select case (No Mod 4)
10740 case 1:
10750 c=2:No=c:sp_on 0,1:sp_put 0,(5,300),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
10760 case 2:
10770 c=3:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
10780 case 3:
10790 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:goto SettingScreen:
10800 case 0:
10810 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,600),0,0:sp_on 0,0:goto SettingScreen:
10820 end select
10830 endif
10840 'エンターキーを押したとき
10850 if key$ = chr$(13) then
10860 if No=3 then goto Setting_Language:
10870 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
10880 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
10890 if No=0 then goto TopScreen:
10900 endif
10910 '文字検索項目  ここから
10920 Moji_Search:
10930 cls 4:cls 3:Font 32+16:init"kb:2"
10940 gload Gazo$ + "Moji_Search_Result.png"
10950 play ""
10960 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
10970 print "" + chr$(13)
10980 color rgb(255,255,255)
10990 if lang_flag = 1 then
11000 Else
11010 print "文字を一文字入れてください" + chr$(13)
11020 endif
11030 color rgb(0,0,0)
11040 if lang_flag=1 then
11050 Else
11060 Input "登録文字:",moji$
11070 endif
11080 moji_count = len(moji$)
11090 if moji_count > 1 then
11100 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Moji_Search:
11110 else
11120 count=0
11130 for n = 0 to 116
11140 if bufline$(2*n) = moji$ then
11150 cls 3:font 48:init"kb:4"
11160 gload Gazo$ + "Moji_Search_Result.png"
11170 play ""
11180 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
11190 if lang_flag = 1 then
11200 Else
11210 print chr$(13)
11220 color rgb(255,255,255)
11230 print moji$;"は、登録されています。" + chr$(13)
11240 color rgb(0,0,0)
11250 print "ジョイパッドの右を押してください"
11260 endif
11270 bg = 0:key$ = ""
11280 while (bg <> 1 and key$ <> chr$(13))
11290 key$ = inkey$
11300 bg = strig(1)
11310 pause 2
11320 wend
11330 if key$ = chr$(13) then goto TopScreen:
11340 if bg=1 then goto TopScreen:
11350 count = count + 1
11360 endif
11370 next n
11380 if count = 0 then
11390 cls 3:font 48:init "kb:4"
11400 gload Gazo$ + "Moji_check.png"
11410 play ""
11420 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
11430 print chr$(13)
11440 if lang_flag = 1 then
11450 Else
11460 color rgb(255,255,255)
11470 print moji$;"は、登録されていません。" + chr$(13)
11480 color rgb(0,0,0)
11490 print "パッドの右を押してください" + chr$(13)
11500 endif
11510 kg = 0:key$ = ""
11520 while (kg <> 1 and key$ <> chr$(13))
11530 key$ = inkey$
11540 kg = strig(1)
11550 pause 2
11560 wend
11570 if ((key$ = chr$(13)) or (kg=1)) then goto TopScreen:
11580 endif
11590 endif
11600 Surei_Result2:
11610 cls 3:Font 48
11620 zcount1=0:zcount2=0:count1=0:count2=0
11630 '1人目
11640 mojicount1=len(buf_Parson1$)
11650 '2人目
11660 mojicount2 = len(buf_Parson2$)
11670 '1人目
11680 for n = 1 to mojicount1
11690 for j = 1 to 116
11700 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
11710 if bufcount1$(n-1) = bufline$(2*j) then
11720 zcount1 = zcount1 + 1
11730 endif
11740 next j
11750 next n
11760 '2人目
11770 for n = 1 to mojicount2
11780 for j = 1 to 116
11790 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
11800 if bufcount2$(n-1) = bufline$(2*j) then
11810 zount2 = zcount2 + 1
11820 endif
11830 next j
11840 next n
11850 '1人目
11860 for i=1 to mojicount1
11870 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
11880 p1 = Complate(bufcount1$(i-1))
11890 count1 = count1 + p1
11900 next i
11910 '2人目
11920 for i = 1 to mojicount2
11930 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
11940 p2 = Complate(bufcount2$(i-1))
11950 count2 = count2 + p2
11960 next i
11970 cls 3:
11980 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
11990 color rgb(255,0,0)
12000 print ""+chr$(13)
12010 if lang_flag = 1 then
12020 else
12030 color rgb(255,255,255)
12040 print "1人目:";buf_Parson1$;chr$(13)
12050 print "数霊1:";count1;chr$(13)
12060 print "2人目:";buf_Parson2$;chr$(13)
12070 print "数霊2:";count2;chr$(13)
12080 print "数霊(合計):";count1 + count2;chr$(13)
12090 color rgb(0,0,0)
12100 print "エンターキーを押してください" + chr$(13)
12110 endif
12120 key$ = "":bg = 0
12130 while (bg <> 1 and key$ <> chr$(13))
12140 bg = strig(1)
12150 key$ = inkey$
12160 pause 2
12170 wend
12180 if (bg = 1 or key$ = chr$(13))  then goto TopScreen:
12190 Surei_Result3:
12200 cls 3:Font 48
12210 zcount2 = 0:count2 = 0
12220 mojicount2 = len(buffer_moji2$)
12230 for n = 1 to mojicount2
12240 for j = 1 to 116
12250 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
12260 if bufcount2$(n - 1) = bufline$(2 * j) then
12270 zcount2 = zcount2 + 1
12280 endif
12290 next j
12300 next n
12310 for i = 1 to mojicount2
12320 n2 = Complate(bufcount2$(i-1))
12330 count2 = count2 + n2
12340 next i
12350 gload Gazo$ + "Screen5.png"
12360 if lang_flag = 1 then
12370 else
12380 color rgb(255,0,0)
12390 print "数霊の結果表示" + chr$(13)
12400 color rgb(255,255,255)
12410 print "１回目回の文字入力:";buffer_moji$;chr$(13)
12420 print "１回目の数霊(かずたま)";count;chr$(13)
12430 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
12440 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
12450 color rgb(0,0,0)
12460 print "エンターキー:トップ画面";chr$(13)
12470 print "c or C キー:数霊の比較";chr$(13)
12480 endif
12490 key$ = "":bg = 0
12500 while (key$ <> chr$(13) and bg <> 1)
12510 bg = strig(1)
12520 key$ = inkey$
12530 pause 2
12540 wend
12550 if bg = 1 then goto TopScreen:
12560 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
12570 if key$ = "c" or key$ = "C" then
12580 if count = count2 then
12590 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
12600 else
12610 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
12620 endif
12630 endif
12640 Moji_Count_Check:
12650 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
12660 cls 3:Font 48
12670 gload Gazo$ + "Moji_check.png"
12680 n = 0
12690 open FILE_csv$ for input as #1
12700 while eof(1) = 0
12710 line input #1, line$
12720 n = n + 1
12730 wend
12740 close #1
12750 play ""
12760 if n = 118 then
12770 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
12780 if lang_flag = 1 then
12790 else
12800 print "" + chr$(13)
12810 color rgb(255,255,255)
12820 print "文字の登録文字数は";n;"文字" + chr$(13)
12830 color rgb(0,0,0)
12840 print "パッドの右を押してください" + chr$(13)
12850 endif
12860 endif
12870 key$ = "":bg = 0
12880 while (key$ <> chr$(13) and bg <> 1)
12890 key$=inkey$
12900 bg=strig(1)
12910 pause 2
12920 wend
12930 if bg = 1 then goto TopScreen:
12940 if key$ = chr$(13) then
12950 goto TopScreen:
12960 else
12970 goto Moji_Count_Check:
12980 endif
12990 'Save 関数
13000 file_kazutama = 0
13010 file_kazutama = Save_File()
13020 func Save_File()
13030 open SAVE_DATA1$  for output as #1
13040 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
13050 close #1
13060 endfunc
13070 Select_moji:
13080 cls 3:font 48:No = 1
13090 gload Gazo$ + "Screen1_mojicheck.png"
13100 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
13110 color rgb(255,0,0)
13120 if lang_flag = 1 then
13130 else
13140 play ""
13150 play Voice_File_TopScreen$ + "Voice_Select_Moji20230217.mp3"
13160 print chr$(13)+chr$(13)+chr$(13)
13170 color rgb(255,255,255)
13180 print "番号を選んでください" + chr$(13)
13190 print " :1.登録文字検索"+ chr$(13)
13200 print " :2.登録文字数の確認" + chr$(13)
13210 print " :3.トップ画面に戻る" + chr$(13)
13220 color rgb(0,0,0)
13230 locate 0,15
13240 if No = 1 then print " 1.登録文字検索を選択"
13250 endif
13260 Entry_check_key:
13270 y = 0:key$ = "":bg=0
13280 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
13290 y = stick(1)
13300 key$ = inkey$
13310 bg=strig(1)
13320 pause 2
13330 wend
13340 'バーチャルパッド　ここから'
13350 'バーチャルパッド　ここから'
13360 if y = 1 then
13370 select case No
13380 'No の初期値：No=1
13390 case 1:
13400 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
13410 'デバッグライン　ここから
13420 '0のとき
13430 'デバッグライン　ここまで
13440 'デバッグライン　ここから
13450 case 2:
13460 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                       "
13470 :No=0
13480 'if lang_flag = 1 then
13490 'Else
13500 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に戻るを選択":goto Entry_check_key:
13510 'endif
13520 'cls:color rgb(255,255,255):print"ok"
13530 'デバッグライン　ここまで
13540 'デバッグライン　ここから
13550 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
13560 'デバッグライン　ここまで
13570 case 0:
13580 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.登録文字数の確認を選択":goto Entry_check_key:
13590 'デバッグライン　ここから
13600 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
13610 'デバッグライン　ここまで
13620 end select
13630 endif
13640 'バーチャルパッド　上 ここから
13650 if y = -1 then
13660 select case No
13670 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
13680 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
13690 case 1:
13700 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print"3.トップ画面に戻るを選択":goto Entry_check_key:
13710 'No:3 3.Help→2.設定 No:2
13720 case 0:
13730 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
13740 case 2:
13750 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print "1.登録文字検索":goto Entry_check_key:
13760 end select
13770 endif
13780 if bg=1 then
13790 select case No
13800 '1.数霊チェックを選択  パッドの右キー
13810 case 1:
13820 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
13830 '2.設定を選択    パッドの右キー
13840 case 2:
13850 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
13860 '3.ヘルプを選択 パッドの右
13870 case 0:
13880 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
13890 end select
13900 endif
13910 '4.終了するを選択  パッドの右
13920 'バーチャルパッド　ここまで'
13930 'key$ = input$(1)
13940 'カーソルの下
13950 if key$ = chr$(31) then
13960 select case (No Mod 4)
13970 case 0:
13980 c=1:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
13990 case 1:
14000 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,500),0,0:sp_on 3,0:goto Entry_check_key:
14010 case 2:
14020 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:goto Entry_check_key:
14030 case 3:
14040 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
14050 end select
14060 endif
14070 'カーソル　上
14080 if key$ = chr$(30) then
14090 select case (No Mod 4)
14100 case 0:
14110 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
14120 case 1:
14130 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
14140 case 2:
14150 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
14160 case 3:
14170 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
14180 end select
14190 endif
14200 'エンターキーを押す
14210 if key$ = chr$(13) then
14220 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
14230 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
14240 if No = 0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
14250 endif
14260 '
14270 Kakunin_Surei_count:
14280 cls 3:font 48:No=1
14290 gload Gazo$ + "Kazutama_List_Top.png"
14300 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
14310 color rgb(255,0,0)
14320 print chr$(13)+chr$(13)+chr$(13)
14330 color rgb(255,255,255)
14340 print "番号を選んでください" + chr$(13)
14350 print " :1.数霊リスト 1人用" + chr$(13)
14360 print " :2.結果表示設定" + chr$(13)
14370 print " :3.トップ画面に行く" + chr$(13)
14380 print "" + chr$(13)
14390 color rgb(0,0,0)
14400 locate 0,15:print"                                                         "
14410 if No = 1 then locate 1,15:print "1.数霊リスト　1人用を選択"
14420 Entry_List:
14430 y = 0:key$ = "":bg=0
14440 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
14450 y = stick(1)
14460 key$ = inkey$
14470 bg = strig(1)
14480 pause 2
14490 wend
14500 'バーチャルパッド　ここから'
14510 'バーチャルパッド　ここから'
14520 'バーチャルパッド　下
14530 if y = 1 then
14540 select case No
14550 'No の初期値：No=1
14560 case 1:
14570 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.結果表示設定を選択":goto Entry_List:
14580 'デバッグライン　ここから
14590 '0のとき
14600 'デバッグライン　ここまで
14610 'デバッグライン　ここから
14620 'color rgb(0,0,0):locate 0,15:print " 4.終了を選択":goto Entry_List:
14630 'cls:color rgb(255,255,255):print"ok"
14640 'デバッグライン　ここまで
14650 case 0:
14660 sp_on 3,0:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 1.数霊リスト 1人用を選択":No=1:goto Entry_List:
14670 case 2:
14680 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                      ":No=0:locate 1,15:print "3．トップ画面に行くを選択":goto Entry_List:
14690 'デバッグライン　ここから
14700 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
14710 'デバッグライン　ここまで
14720 'デバッグライン　ここから
14730 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
14740 'デバッグライン　ここまで
14750 end select
14760 endif
14770 'バーチャルパッド　上 ここから
14780 if y = -1 then
14790 select case No
14800 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
14810 case 2:
14820 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 2.結果表示設定を選択":goto Entry_List:
14830 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
14840 case 0:
14850 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 1,15:print"3.トップ画面に行くを選択":goto Entry_List:
14860 'No:3 3.Help→2.設定 No:2
14870 case 1:
14880 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print "1.数霊リスト 1人用を選択":goto Entry_List:
14890 end select
14900 endif
14910 if bg = 1 then
14920 select case No
14930 '1.数霊リスト 一人用を選択を選択  パッドの右キー
14940 case 1:
14950 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
14960 '2.設定を選択  パッドの右キー
14970 case 2:
14980 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
14990 case 0:
15000  sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15010 end select
15020 endif
15030 if key$=chr$(13) then
15040 select case No
15050 case 0:
15060       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
15070 case 1:
15080       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
15090 case 2:
15100       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15110 end select
15120 endif
15130 '4.終了するを選択  パッドの右
15140 'バーチャルパッド　ここまで'
15150 Surei_List1:
15160 cls 3:font 48
15170 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
15180 file$ = dir$(SAVE_DATA1$,0)
15190 'ファイルが無いときの画面
15200 if file$ = ""  then
15210 gload "./data/Gazo/" + "KazutamaList1.png",0
15220 print chr$(13)
15230 color rgb(255,255,255):print "登録ファイルはございません" + chr$(13)
15240 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
15250 'else
15260 'endif
15270 bg = 0:key$ = ""
15280 while (key$ <> chr$(13) and bg<>1)
15290 key$ = inkey$
15300 bg = strig(1)
15310 pause 2
15320 wend
15330 'エンターキーもしくはバーチャルパッドの右でトップに行く
15340 if (bg = 1  or key$ = chr$(13)) then goto TopScreen:
15350 else
15360 cls 3:buffer_list_count = Loadcount()
15370 color rgb(255,255,255)
15380 if lang_flag = 1 then
15390 Else
15400 talk "登録件数は" + str$(buffer_list_count) + "件です"
15410 gload Gazo$ + "KazutamaList1_Entry.png",0
15420 color rgb(0,0,255)
15430 print chr$(13)
15440 color rgb(255,255,255)
15450 print "登録件数:";buffer_list_count;"件";chr$(13)
15460 color rgb(0,0,0)
15470 print "パッドの右を押してください" + chr$(13)
15480 endif
15490 bg = 0:key$ = "":bg2 = 0
15500 while (key$ <> chr$(13) and bg <> 1)
15510 key$ = inkey$
15520 bg = strig(1)
15530 bg2=strig(0)
15540 pause 2
15550 wend
15560 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
15570 if (key$ = chr$(13) or bg = 1) then pause 2:goto KotodamaList_page:
15580 endif
15590 if (bg2 = 1) then pause 2:goto TopScreen:
15600 func Loadcount()
15610 n = 0
15620 'while eof(1)=-1
15630 open SAVE_DATA1$  for input as #1
15640 while eof(1) <> -1
15650 line input #1,line$
15660 n = n + 1
15670 wend
15680 close #1
15690 count = n
15700 endfunc count
15710 count_line = Loadcount()
15720 func Kotodama$(buf$)
15730 color rgb(255,255,255)
15740 b = len("数霊:")
15750 a$ = Mid$(buf$,b+1,len(buf$))
15760 for i=0 to 118
15770 color rgb(255,255,255)
15780 if bufline3$(2 * i) ="数霊:" + a$  then
15790 moji_$ = bufline3$(2*i + 1)
15800 endif
15810 next i
15820 kotodama$ = moji_$
15830 endfunc kotodama$
15840 KotodamaList_page:
15850 cls 3:font 48:m = 0:
15860 gload Gazo$ + "Screen5_Surei_List.png"
15870 if SAVE_DATA1$ = "" then
15880 cls 3:color rgb(255,255,255):print"ファイルがありません"
15890 else
15900 a = Loadcount()
15910 open SAVE_DATA1$  for input as #1
15920 for i=0 to a-1
15930 for n=0 to 1
15940 input #1,line$
15950 bufKaztama$(i,n) = line$
15960 next n
15970 next i
15980 close #1
15990 l = 0:n=0
16000 gload Gazo$ + "Screen5_Surei_List.png"
16010 while (buffer_list_count >= l)
16020 cls
16030 color rgb(255,0,0)
16040 print chr$(13)
16050 color rgb(255,255,255)
16060 n=n+1
16070 print chr$(13)
16080 print "番号:";l+1;chr$(13)
16090 print bufKaztama$(l,0) + chr$(13)
16100 print bufKaztama$(l,1) + chr$(13)
16110 Kmoji$ = moji$
16120 print chr$(13) + chr$(13) + chr$(13)
16130 color rgb(0,0,0)
16140 print " :パッドの左:トップ画面" + chr$(13)
16150 print " :パッドの右:次へ行く" + chr$(13)
16160 key$ = "":bg = 0:bg2 = 0
16170 while (key$ <> chr$(13) and bg <> 1 and bg2 <> 1)
16180 key$ = inkey$
16190 bg = strig(1)
16200 bg2 = strig(0)
16210 pause 2
16220 wend
16230 if (key$ = " " OR bg = 1) then
16240 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
16250 else
16260 if ((bg2 = 1) or (key$=chr$(13))) then
16270    goto TopScreen:
16280 endif
16290 else
16300 goto KotodamaList_page:
16310 endif
16320 wend
16330 endif
16340 '結果表示２ Menu1
16350 Surei_Result4:
16360 cls 3:font 32+16:init"kb:4"
16370 for i=0 to 181 + 3 - 1
16380 if i = count  then
16390 buffer$ = bufline2$(count + 4,0)
16400 endif
16410 next i
16420 if len(buffer$) > 21 and len(buffer$) <= 45 then
16430 buffer2$ = Mid$(buffer$,1,22)
16440 buffer3$ = Mid$(buffer$,23,(len(buffer$) - 22))
16450 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13)
16460 else
16470 if len(buffer$) <= 21 then
16480 buffer2$ = Mid$(buffer$,1,21)
16490 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
16500 else
16510 if len(buffer$) > 45 and len(buffer$) <= 62 then
16520 buffer2$ = Mid$(buffer$,1,22)
16530 buffer3$ = Mid$(buffer$,23,22)
16540 buffer4$ = Mid$(buffer$,44,(len(buffer$)-44))
16550 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13)
16560 else
16570 if len(buffer$) > 64 and len(buffer$) <= 81 then
16580 buffer2$ = Mid$(buffer$,1,22)
16590 buffer3$ = Mid$(buffer$,23,20)
16600 buffer4$ = Mid$(buffer$,44,20)
16610 buffer5$ = Mid$(buffer$,65,(len(buffer$)-65))
16620 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13)
16630 if len(buffer$) > 81 and len(buffer$) <= 110 then
16640 buffer2$ = Mid$(buffer$,1,22)
16650 buffer3$ = Mid$(buffer$,23,20)
16660 buffer4$ = Mid$(buffer$,43,20)
16670 buffer5$ = Mid$(buffer$,63,20)
16680 buffer6$ = Mid$(buffer$,83,(len(buffer$) - 83))
16690 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13)
16700 endif
16710 endif
16720 endif
16730 endif
16740 endif
16750 Surei_Result4_2:
16760 gload Gazo$ + "Screen1_Result2.png"
16770 Result_Menu_List$(0)="1.トップ画面に行く"
16780 Result_Menu_List$(1)="2.数霊のデーターを保存"
16790 Result_Menu_List$(2)="3.もう一度、数霊を調べる"
16800 cls
16810 print chr$(13)
16820 if lang_flag = 1 then
16830 else
16840 color rgb(127,255,212)
16850 print chr$(13);chr$(13)
16860 print "入力文字:";buffer_moji$;chr$(13)
16870 print "数霊:";count;chr$(13)
16880 color rgb(255,255,255)
16890 print "数霊の説明:"+chr$(13)
16900 print buffer$
16910 color rgb(0,0,0)
16920 locate 0,15
16930 print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
16940 endif
16950 key$ = "":bg = 0:bg2 = 0
16960 while (bg<>1 and bg2<>1)
16970 key$ = inkey$
16980 bg = strig(1)
16990 bg2 = strig(0)
17000 pause 2
17010 wend
17020 if ((bg = 1) or (bg2 = 1)) then
17030 num = ui_select("Result_Menu_List$","番号を選んでください")
17040 endif
17050 if num = 0 then goto TopScreen:
17060 if num = 1 then goto File_save:
17070 if num = 2 then goto Surei_Input:
17080 if num = -1 then goto Surei_Result4
17090 File_save:
17100 'ファイルがない時
17110 if dir$(SAVE_DATA1$) = " " then
17120 open SAVE_DATA1$ for output as #1
17130 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
17140 close #1
17150 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
17160 'ファイルが有る時
17170 else
17180 open SAVE_DATA1$ for append as #1
17190 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
17200 close #1
17210 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
17220 endif
17230 func All_clear()
17240 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
17250 endfunc
17260 'ここから
17270 Config_moji1:
17280 cls 3:Font 48
17290 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
17300 play ""
17310 No=1
17320 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
17330 color rgb(0,0,255)
17340 print chr$(13)
17350 if lang_flag = 1 then
17360 'lang_flag = 1:英語
17370 else
17380 'lang_flag = 0:日本語
17390 color rgb(255,255,255)
17400 print "番号を選んでください" + chr$(13)
17410 print " :1.文字の項目" + chr$(13)
17420 print " :2.結果表示設定" + chr$(13)
17430 print " :3.トップ画面に行く" + chr$(13)
17440 print " :4.終 了" + chr$(13)
17450 endif
17460 color rgb(0,0,0)
17470 locate 1,12
17480 if No = 1 then print "1.文字の項目"
17490 'y:バーチャルパッドの処理
17500 'key$:カーソルの処理
17510 'bg:バーチャルパッドの右ボタン
17520 Config_moji1_Screen:
17530 y = 0:key$ = "":bg=0
17540 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
17550 y = stick(1)
17560 key$ = inkey$
17570 bg=strig(1)
17580 pause 2
17590 wend
17600 'バーチャルパッド　ここから'
17610 'バーチャルパッド　ここから'
17620 if y = 1 then
17630 select case No
17640 'No の初期値：No=1
17650 case 1:
17660 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
17670 'デバッグライン　ここから
17680 '0のとき
17690 'デバッグライン　ここまで
17700 'デバッグライン　ここから
17710 case 2:
17720 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
17730 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
17740 'if lang_flag = 1 then
17750 'else
17760 locate 1,12:print "3.トップ画面に行くを選択"
17770 'endif
17780 'デバッグライン　ここまで
17790 case 3:
17800 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
17810 'デバッグライン　ここから
17820 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
17830 'デバッグライン　ここまで
17840 case 0:
17850 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
17860 'デバッグライン　ここから
17870 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
17880 'デバッグライン　ここまで
17890 end select
17900 endif
17910 'バーチャルパッド　上 ここから
17920 if y = -1 then
17930 select case No
17940 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
17950 case 1:
17960 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
17970 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
17980 case 0:
17990 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
18000 'No:3 3.Help→2.設定 No:2
18010 case 3:
18020 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
18030 case 2:
18040 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
18050 end select
18060 endif
18070 if bg=1 then
18080 select case No
18090 '1.数霊チェックを選択  パッドの右キー
18100 case 1:
18110 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
18120 '2.設定を選択    パッドの右キー
18130 case 2:
18140 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
18150 '3.ヘルプを選択 パッドの右
18160 case 3:
18170 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
18180 'プログラムの終了を選択
18190 case 0:
18200 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
18210 'if lang_flag = 1 then
18220 'Else
18230 ui_msg "プログラムを終了します":end
18240 'endif
18250 end select
18260 endif
18270 '4.終了するを選択  パッドの右
18280 'バーチャルパッド　ここまで'
18290 'SettingScreen:
18300 'key$ = input$(1)
18310 'カーソル下'
18320 if key$ = chr$(31) then
18330 select case (No Mod 4)
18340 '登録文字から数霊文字の確認
18350 case 1:
18360 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
18370 '数霊文字の確認からトップ画面に行く
18380 case 2:
18390 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
18400 'トップ画面に行くから終了
18410 case 3:
18420 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
18430 '終了から登録文字
18440 case 0:
18450 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
18460 end select
18470 endif
18480 'カーソル　上
18490 if key$ = chr$(30) then
18500 select case (No Mod 4)
18510 case 1:
18520 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
18530 case 2:
18540 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
18550 case 3:
18560 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
18570 case 0:
18580 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
18590 end select
18600 endif
18610 'エンターキーを押したとき
18620 if key$ = chr$(13) then
18630 if No=3 then goto TopScreen:
18640 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
18650 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
18660 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
18670 'lse
18680 'o'o SettingScreen:
18690 endif
18700 'ここまで
18710 Config_moji2:
18720 cls 3:Font 48
18730 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
18740 play ""
18750 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
18760 No=1
18770 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
18780 color rgb(0,0,255)
18790 'print "●設定項目" + chr$(13)
18800 print chr$(13)
18810 if lang_flag = 1 then
18820 'lang_flag = 1:英語
18830 else
18840 'lang_flag = 0:日本語
18850 color rgb(255,255,255)
18860 print "番号を選んでください" + chr$(13)
18870 'print " :1.文字の項目" + chr$(13)
18880 'print " :2.結果表示設定" + chr$(13)
18890 print " :1.文字の項目" + chr$(13)
18900 print " :2.結果表示設定" + chr$(13)
18910 print " :3.トップ画面に行く" + chr$(13)
18920 print " :4.終 了" + chr$(13)
18930 endif
18940 color rgb(0,0,0)
18950 locate 1,12
18960 if No = 1 then print "1.文字の項目"
18970 'y:バーチャルパッドの処理
18980 'key$:カーソルの処理
18990 'bg:バーチャルパッドの右ボタン
19000 config_moji2:
19010 y = 0:key$ = "":bg=0
19020 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
19030 y = stick(1)
19040 key$ = inkey$
19050 bg = strig(1)
19060 pause 2
19070 wend
19080 'バーチャルパッド　ここから'
19090 'バーチャルパッド　ここから'
19100 if y = 1 then
19110 select case No
19120 'No の初期値：No=1
19130 case 1:
19140 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
19150 'デバッグライン　ここから
19160 '0のとき
19170 'デバッグライン　ここまで
19180 'デバッグライン　ここから
19190 case 2:
19200 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
19210 color rgb(0,0,0)::No=2:goto SettingScreen:
19220 if lang_flag = 1 then
19230 else
19240 locate 0,12:print " 3.トップ画面に行くを選択"
19250 endif
19260 'cls:color rgb(255,255,255):print"ok"
19270 'デバッグライン　ここまで
19280 case 3:
19290 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
19300 'デバッグライン　ここから
19310 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
19320 'デバッグライン　ここまで
19330 case 0:
19340 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
19350 'デバッグライン　ここから
19360 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
19370 'デバッグライン　ここまで
19380 end select
19390 endif
19400 'バーチャルパッド　上 ここから
19410 if y = -1 then
19420 select case No
19430 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
19440 case 1:
19450 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
19460 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
19470 case 0:
19480 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
19490 'No:3 3.Help→2.設定 No:2
19500 case 3:
19510 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
19520 case 2:
19530 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
19540 end select
19550 endif
19560 '決定ボタン
19570 if bg=1 then
19580 select case No
19590 '1.数霊チェックを選択  パッドの右キー
19600 case 1:
19610 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
19620 '2.設定を選択    パッドの右キー
19630 case 2:
19640 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
19650 '3.ヘルプを選択 パッドの右
19660 case 3:
19670 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
19680 'プログラムの終了を選択
19690 case 0:
19700 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
19710 'if lang_flag = 1 then
19720 'Else
19730 ui_msg "プログラムを終了します":end
19740 'endif
19750 end select
19760 endif
19770 '4.終了するを選択  パッドの右
19780 'バーチャルパッド　ここまで'
19790 'カーソル下'
19800 if key$ = chr$(31) then
19810 select case (No Mod 4)
19820 '登録文字から数霊文字の確認
19830 case 1:
19840 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
19850 '数霊文字の確認からトップ画面に行く
19860 case 2:
19870 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
19880 'トップ画面に行くから終了
19890 case 3:
19900 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
19910 '終了から登録文字
19920 case 0:
19930 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
19940 end select
19950 endif
19960 'カーソル　上
19970 if key$ = chr$(30) then
19980 select case (No Mod 4)
19990 case 1:
20000 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
20010 case 2:
20020 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
20030 case 3:
20040 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
20050 case 0:
20060 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
20070 end select
20080 endif
20090 'エンターキーを押したとき
20100 if key$ = chr$(13) then
20110 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
20120 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
20130 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
20140 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
20150 'lse
20160 'o'o SettingScreen:
20170 endif
20180 '結果表示設定
20190 Result_Setting:
20200 color rgb(255,255,255)
20210 'dim list$(4)
20220 'ファイル読み込み
20230 '1.ファイルが有るか無いかのチェック
20240 if Dir$(System$) = "" then
20250 '1-1.ファイルがないとき
20260 '上のSystemフォルダを作成
20270 mkdir "./System/"
20280 list$(0) = "●:出た数字から181を引く"
20290 list$(1) = " :出た数字から180を引き単数変換"
20300 open System$ for output as #1
20310 print #1,"config_r=0"
20320 close #1
20330 ui_msg "ファイルを作成しました"
20340 'ファイル作成
20350 else
20360 '1-2.ファイルが有るとき
20370 'config_r:0 出た数字から181を引く
20380 'config_r:1 出た数字から180を引いて単数変換
20390 'open "./System/config.sys" for input as #1
20400 'ファイルが有るときファイルを読み込み
20410 open System$ for input as #1
20420 line input #1,buf_line$
20430 'buf$にデーターをコピーする
20440 buf$ = buf_line$
20450 close #1
20460 if len(buf$) = 10 then
20470  if left$(buf$,9) = "config_r=" then
20480  buf$ = right$(buf_line$,1)
20490  if buf$ = "1" then
20500    '1.System$ ファイルを削除(config.sys)
20510    '2.1行目をconfig_r=1と書き、保存する
20520    buf_config_r = 1
20530    'list$(0) = "●:1.出た数字から180を引いて単数変換"
20540    'list$(1) = " :2.出た数字から181を引く"
20550    else
20560  if buf$ = "0" then
20570    buf_config_r = 0
20580   ' list$(0) = "●:1.出た数字から181を引く"
20590   'list$(1) = " :2.出た数字から180を引いて単数変換"
20600  endif
20610  endif
20620  endif
20630 endif
20640 endif
20650 '"●:1.出た数字から180を引く"をlist$(0)に代入
20660 if buf_config_r =  0 then
20670 list$(0) = "●:1.出た数字から181を引く"
20680 list$(1) = " :2.出た数字から180を引いて単数変換"
20690 else
20700 list$(0) = "●:1.出た数字から180を引いて単数変換"
20710 list$(1) = " :2.出た数字から181を引く"
20720 endif
20730 list$(2) = " :トップ画面に戻る"
20740 list_num = ui_select("list$","番号を選んでください")
20750 play ""
20760 Select case (list_num)
20770 case 0:
20780        if buf$ = "1" then
20790        buf_config_r = 0:
20800        'データーを変更したのでファイルを削除
20810        kill System$
20820        'ファイルを新しく作成
20830        open System$ for output as #1
20840        print #1,"config_r=0"
20850        close #1
20860        ui_msg "設定を変更しました。"
20870        else
20880        'if buf$ = "0" then
20890        'buf_config_r = 1
20900        'kill System$
20910        'open Syetem$ for output as #1
20920        'print #1,"config_r=1"
20930        'close #1
20940        'ui_msg "設定を変更しました"
20950        'endif
20960        endif
20970        goto config_moji2:
20980 case 1:
20990        if buf$ = "0" then
21000        buf_config_r = 1:
21010        'データーを変更したので、ファイルを削除
21020        kill System$
21030        'ファイルを新しく作成
21040        open System$ for output as #1
21050        print #1,"config_r=1"
21060        close #1
21070        ui_msg "設定を変更しました"
21080        else
21090        kill System$
21100        if buf$ = "1" then
21110        open System$ for output as #1
21120        print #1,"config_r=0"
21130        close #1
21140        ui_msg "設定を変更しました"
21150        endif
21160        endif
21170        goto config_moji2:
21180 case 2:
21190       'トップ画面に飛ぶ
21200        goto TopScreen:
21210 case 3:
21220       'プログラムを終了する
21230       cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
21240 end select
21250 '単数変換
21260 Func Single_Complate(num)
21270 '1.出てきた数字から180を引く
21280 a = num - 180
21290 'a:10〜99
21300 Re1:
21310 if (a > 9 and a < 100) then
21320  b1 = fix(a / 10)
21330  b2 = 10 * a - b1
21340  d1 = b1 + b2
21350 if c > 9 then
21360  goto Re1:
21370 else
21380  c = d1:goto Re2:
21390 endif
21400 endif
21410 Re2:
21420 buffer = c
21430 endfunc buffer
21440 Func Surei_Result_Save_File()
21450 'ファイルがないとき
21460 if dir$(SAVE_DATA1$) = "" then
21470 open SAVE_DATA1$ for output as #1
21480 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
21490 close #1
21500 ui_msg "保存しました":talk "保存しました":goto Surei_Result:
21510 else
21520 open SAVE_DATA1$ for append as #1
21530 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
21540 close #1
21550 ui_msg "保存しました":talk "保存しました":goto Surei_Result
21560 endif
21570 endfunc
21580 '言語設定
21590 Setting_Language:
21600 cls 3:gload Gazo$ + "Screen1.png":screen 1,1,1:No=2
21610 init "Kb:4"
21620 sp_on 1,1:sp_on 0,0
21630 sp_put 0,(0,300),0,0
21640 sp_put 1,(0,400),1,0
21650 color rgb(0,0,255)
21660 'print "番号を選んでください"+chr$(13)
21670 'if lang_flag=0 then
21680 'print "言語設定:日本語"+chr$(13)
21690 'else
21700 'print "言語設定:英 語"+chr$(13)
21710 Change_Language:
21720 if lang_flag = 1 then
21730 cls
21740 print "It has changed Language"+chr$(13)
21750 color rgb(255,255,255)
21760 print "Select the Number"+chr$(13)
21770 print " :1.English → Japanse"+chr$(13)
21780 print " :2.It goes to TopScreen"+chr$(13)
21790 print "Language:In English" +chr$(13)
21800 else
21810 cls:color rgb(255,255,255)
21820 print "設定変更(言語の変更)" + chr$(13)
21830 color rgb(255,255,255)
21840 print chr$(13)
21850 print "番号を選んでください"+chr$(13)
21860 print " :1.日本語 → 英語に変更" + chr$(13)
21870 print " :2.トップ画面に戻る" + chr$(13)
21880 print chr$(13)
21890 print "設定言語:日本語" + chr$(13)
21900 endif
21910 color rgb(0,0,0)
21920 locate 0,15:print "                                       ":locate 0,15:print "2.トップ画面に戻る　を選択" + chr$(13)
21930 Setting_Language_key:
21940 y=0:key$="":bg=0
21950 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y<> -1 and bg<> 1)
21960 y=stick(1)
21970 key$=inkey$
21980 bg=strig(1)
21990 pause 2
22000 wend
22010 '選択肢変更
22020 if ((y=1) or (y=-1)) then
22030 select case No
22040 case 2:
22050      '実装部分　ここから
22060      pause 200:No=1:sp_on 0,1:sp_on 1,0:locate 0,15:print "                                                         ":locate 0,15:print "1.日本語 → 英語に変更を選択": goto Setting_Language_key:
22070      '実装部分　ここまで
22080 case 1:
22090       pause 200: No=2:sp_on 0,0:sp_on 1,1:locate 0,15:print "                                                       ":locate 0,15:print "2.トップ画面に戻る を選択":goto Setting_Language_key:
22100 end select
22110 endif
22120 'Enter Key  決定ボタン
22130 if ((key$=chr$(13)) or (bg=1)) then
22140 select case No
22150 case 2:
22160         sp_on 0,0:sp_on 1,0:goto TopScreen:
22170 case 1:                                                     'lang_flag=1:sp_on 0,0:sp_on 1,0:goto Change_Language:
22180       '
22190 '未実装　ここから
22200  sp_on 0,1:sp_on 1,0:ui_msg "この機能は未実装です":goto Setting_Language_key:
22210 '
22220 '未実装　ここまで
22230 end select
22240 endif
22250  '配列削除
22260 buffer_clear:
22270 erase bufline$
22280 erase bufcount$
22290 erase bufcount1$
22300 erase bufcount2$
22310 erase bufline2$
22320 erase bufline3$
22330 erase bufKaztama$
22340 erase List$
22350 erase Result_Menu_List$
22360 erase list$
22370 erase moji_List$
22380 'ui_msg "メモリーをクリアしました"
22390 return
22400 '配列削除　ここまで
