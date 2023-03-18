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
550 'Version 1.3.7_2023.03.12-2023.03.19(Release):正式版
560 '現在のバージョン
570 Version$ = "1.3.7_2023.03.19(正式版)"
580 'csvファイル 1.数霊 ベースファイル
590 FILE_csv$ = "./data/Kazutama.csv"
600 'csvファイル 2.数霊 ベースファイル 2
610 FILE_csv2$ = "./data/Surei_chart_20211207.csv"
620 'Save ファイル
630 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
640 'gazo ファイル
650 Gazo$ = "./data/Gazo/"
660 'System フォルダ:設定ファイルを保存するところ
670 System$ = "./data/System/config.sys"
680 '設定ファイル名:config.sys
690 'Sound File(Voice)
700 '1.ボイス TopScreen
710 Voice_File_TopScreen$ = "./data/Sound_data/"
720 'Message
730 buf_finish_Message$ = "メモリーを解放してプログラムを終了します"
740 '変数領域
750 'vcount:バーチャルパッド下の変数
760 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
770 count2 = 0:N=0:N2=0:m2 = 0:device_No=0
780 dim list$(4),moji_List$(2)
790 'ファイルの有無チェック
800 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
810 '1.ファイルが無いとき
820 cls :print "依存ファイルが見つかりません":
830 print "エンターキーを押してください" + chr$(13)
840 key$ = input$(1)
850 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
860 else
870 '2.ファイルが有るとき
880 cls:print "csv:file ok." + chr$(13)
890 n=0
900 'FILE_csv$:数霊データー入力
910 open FILE_csv$ for input as #1
920 while eof(1) = 0
930 input #1,line$
940 bufline$(n) = line$
950 'Print n;chr$(13)
960 '登録件数カウント:n
970 n = n + 1
980 wend
990 close #1
1000 N=n
1010 '2つ目のファイル読み込み
1020 'n = 0
1030 open FILE_csv2$ for input as #2
1040 for n=3 to 181
1050 for i=0 to 1
1060 input #2,line$
1070 bufline2$(n,i) = line$
1080 next i
1090 next n
1100 close #2
1110 N2 = n
1120 endif
1130 '2022.11.23----------------------
1140 '端末言語のチェック
1150 '日本語端末かチェックをして日本語以外なら英語で表示する
1160 'lang flag:0:日本語 1:英語(日本語以外)
1170 '--------------------------------
1180 lang_flag = 0
1190 if ex_info$(1) <> "JP" then
1200 lang_flag = 1
1210 endif
1220 cls 3:font 48:screen 1,1,1,1:int "kb:4":init "crt:0"
1230 play ""
1240 'gload Gazo$ + "TopScreen_20230310.png",0,0,0
1250 '選択ポインター 1 - 4
1260 'スプライトの定義
1270 gload Gazo$ + "Selection.png",1,5,300
1280 gload Gazo$ + "Selection.png",1,5,400
1290 gload Gazo$ + "Selection.png",1,5,500
1300 gload Gazo$ + "Selection.png",1,5,595
1310 sp_def 0,(5,300),32,32
1320 sp_def 1,(5,400),32,32
1330 sp_def 2,(5,500),32,32
1340 sp_def 3,(5,595),32,32
1350 'First_Select_Screen:
1360 'タブレット　or　スマホの選択を起動時にする
1370 Device_Select:
1380 font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
1390 gload Gazo$ + "device_select_20230313.png",0,0,0
1400 init "kb:4"
1410 play ""
1420 play Voice_File_TopScreen$+"Select_device_select.mp3"
1430 'y=0:key$="":bg=0
1440 print chr$(13)+chr$(13)+chr$(13)
1450 color  rgb(255,255,255)
1460 print "番号を選んでください"+chr$(13)
1470 'print chr$(13)
1480 print " :1.スマートフォン"+chr$(13)
1490 print " :2.タブレット端末"+chr$(13)
1500 locate 0,11:No=1
1510 color rgb(0,0,0)
1520 Print " 1.スマートフォンを選択"+chr$(13)
1530 sp_on 0,1:sp_put 0,(5,300),0,0
1540 sp_on 1,0:sp_on 2,0:sp_on 3,0
1550 device_selection:
1560 y=0:key$="":bg=0:
1570 While (key$ <> chr$(30) and key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 1)
1580 y = stick(1)
1590 key$ = inkey$
1600 bg = strig(1)
1610 pause 2
1620 wend
1630 if ((y=1) or (y=-1) or (key$=chr$(30)) or (key$=chr$(31)) ) then
1640 select case No
1650 case 1:
1660       No=2:sp_on 1,1:sp_on 0,0:locate 0,11:pause 300:sp_put 1,(5,400),0,0:print "                                ":locate 0,11:print " 2.タブレット端末を選択":goto device_selection:
1670 case 2:
1680       No=1:sp_on 1,0:sp_on 0,1:pause 300:sp_put 0,(5,300),0,0:locate 0,11:print "                                   ":locate 0,11:print " 1.スマートフォンを選択":goto device_selection:
1690 end select
1700 endif
1710 if ((bg=1) or (key$=chr$(13)))  then
1720 select case No
1730 case 1:
1740       sp_on 0,0:sp_on 1,0:device_No=1:goto TopScreen:
1750 case 2:
1760       sp_on 0,0:sp_on 1,0:device_No=2:goto TopScreen:
1770 end select
1780 endif
1790 'Top画面
1800 TopScreen:
1810 'バーチャルパッドを表示
1820 cls 3:font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
1830 'play ""
1840 play ""
1850 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
1860 'gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
1870 select case device_No
1880 case 1:
1890 'Top画面の背景画像
1900 gload Gazo$ + "TopScreen_20230310.png",0,0,0
1910 gload Gazo$ + "downscreen.png",0,0,800
1920 case 2:
1930 gload Gazo$ + "TopScreen_20230310.png",0,0,0
1940 end select
1950 'key$=input$(1)
1960 'バーチャルパッドの背景を白にする for smartphone screen
1970 'gload Gazo$ + "downscreen.png",0,0,800
1980 '選択肢 1
1990 gload Gazo$ + "Selection.png",1,5,300
2000 '選択肢 2
2010 gload Gazo$ + "Selection.png",1,5,400
2020 '選択肢 3
2030 gload Gazo$ + "Selection.png",1,5,500
2040 '選択肢 4
2050 'TopScreen:
2060 'select case device_No
2070 'case 1:
2080 gload Gazo$ + "Selection.png",1,5,590
2090 'case 2:
2100 'gload Gazo$ +
2110 'end select
2120 color rgb(0,0,255)
2130 print chr$(13)
2140 if lang_flag = 1 then
2150 color rgb(255,255,255)
2160 print "Select Number" + chr$(13)
2170 print " :1.Kazutama check" + chr$(13)
2180 print " :2.Setting" + chr$(13)
2190 print " :3.Help" + chr$(13)
2200 print " :4.End Program" + chr$(13)
2210 color rgb(255,255,255)
2220 else
2230 color rgb(255,255,255)
2240 print chr$(13)
2250 sp_on 0,1:sp_put 0,(5,300),0,0
2260 print "番号を選んでください" + chr$(13)
2270 print " :1.数霊(かずたま)チェック" + chr$(13)
2280 print " :2.設定" + chr$(13)
2290 print " :3.ヘルプ" + chr$(13)
2300 print " :4.(プログラムを)終　了する" + chr$(13)
2310 color rgb(0,0,0)
2320 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
2330 'バーチャルパッドを表示
2340 No=1:
2350 'lang_flag:1 外国語,0:日本語
2360 if lang_flag = 1 then
2370 'lang_flag=1 英語
2380 locate 0,15:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
2390 else
2400 'lang_flag=0 日本語
2410 locate 0,15:color rgb(0,0,0):print " 1.数霊(かずたま)チェックを選択";chr$(13)
2420 endif
2430 endif
2440 'TopScreen sprite
2450 'スプライト
2460 '選択肢 1 On
2470 'sp_def 0,(5,300),32,32
2480 'sp_on 0,1
2490 'sp_put 0,(5,300),0,0
2500 '選択肢 2 Off
2510 sp_def 1,(5,400),32,32
2520 sp_on 1,0
2530 sp_put 1,(5,400),0,0
2540 '選択肢 3 Off
2550 sp_def 2,(5,500),32,32
2560 sp_on 2,0
2570 sp_put 2,(5,500),0,0
2580 '選択肢 4 Off
2590 sp_def 3,(5,600),32,32
2600 sp_on 3,0
2610 sp_put 3,(5,600),0,0
2620 color rgb(0,0,0)
2630 Main_Select:
2640 'y:バーチャルパッドの処理
2650 'key$:カーソルの処理
2660 y = 0:key$ = "":bg = 0
2670 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
2680 y = stick(1)
2690 key$ = inkey$
2700 bg = strig(1)
2710 pause 2
2720 wend
2730 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
2740 '1.バーチャルパッドの処理
2750 'バーチャルパッド下を押した時
2760 if y = 1 then
2770 select case No
2780 'No の初期値：No=1
2790 case 1:
2800 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
2810 if lang_flag = 1 then
2820 'lang_flag=1 英語
2830 locate 0,15:print "2.It has selected Setting":goto Main_Select:
2840 else
2850 'lang_flag=0 日本語
2860 locate 0,15:print " 2.設定を選択":goto Main_Select:
2870 endif
2880 'デバッグライン　ここから
2890 '0のとき
2900 'デバッグライン　ここまで
2910 'デバッグライン　ここから
2920 'バーチャルパッド　下
2930 case 2:
2940 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:
2950 print "                                         ":
2960 if lang_flag = 1 then
2970 color rgb(0,0,0):locate 0,15:
2980 print "3.It has selected Help":No=3:goto Main_Select:
2990 else
3000 color rgb(0,0,0):locate 0,15:print "                                                         ":locate 0,15:
3010 print " 3.ヘルプを選択":No=3:goto Main_Select:
3020 endif
3030 'デバッグライン　ここまで
3040 case 3:
3050 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                               "
3060 if lang_flag = 1 then
3070 locate 0,15:print "4.It has selected finish program":No=0:goto Main_Select:
3080 else
3090 locate 0,15:print "                                                         " :locate 0,15:print " 4.(プログラムを)終了するを選択":No=0:goto Main_Select:
3100 endif
3110 'デバッグライン　ここから
3120 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
3130 'デバッグライン　ここまで
3140 case 0:
3150 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1
3160 if lang_flag = 1 then
3170 'lang_flag=1:英語
3180 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3190 else
3200 'lang_flag=0:日本語
3210 locate 0,15:print "                                      ":locate 0,15:print " 1.数霊(かずたま)チェックを選択":goto Main_Select:
3220 'endif
3230 endif
3240 'デバッグライン　ここから
3250 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
3260 'デバッグライン　ここまで
3270 end select
3280 endif
3290 'バーチャルパッド　上 ここから
3300 if y = -1 then
3310 select case No
3320 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
3330 case 1:
3340 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                                          "
3350 'if lang_flag = 1 then
3360 'lang_flag=1 英語
3370 'locate 0,15:print "4.It has finished program":goto Main_Select:
3380 'else
3390 'lang_flag=0 日本語
3400 locate 0,15:print "                                                          ":
3410 locate 0,15:print " 4.(プログラムを)終了するを選択":goto Main_Select:
3420 'endif
3430 'endif
3440 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
3450 case 0:
3460 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":
3470 if lang_flag = 1 then
3480 '1:英語
3490 locate 0,15:print "3.It has selected Help":goto Main_Select:
3500 else
3510 '0:日本語
3520 locate 0,15:print "                                                                                        "
3530 locate 0,15:print " 3.ヘルプを選択":goto Main_Select:
3540 endif
3550 'No:3 3.Help→2.設定 No:2
3560 case 3:
3570 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      "
3580 if lang_flag = 1 then
3590 '1:英語
3600 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3610 else
3620 '0:日本語
3630 locate 0,15:print" 2.設定を選択":goto Main_Select:
3640 endif
3650 case 2:
3660 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":
3670 if lang_flag = 1 then
3680 'lang_flag 1 英語
3690 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3700 else
3710 'lang_flag 0 日本語
3720 locate 0,15:print" 1.数霊(かずたま)チェックを選択":goto Main_Select:
3730 endif
3740 end select
3750 endif
3760 if bg=1 then
3770 select case No
3780 '1.数霊チェックを選択  パッドの右キー(決定)
3790 case 1:
3800 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
3810 '2.設定を選択  パッドの右キー(決定)
3820 case 2:
3830 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
3840 '3.ヘルプを選択 パッドの右(決定)
3850 case 3:
3860 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
3870 'プログラムの終了を選択(決定)
3880 case 0:
3890 cls 3:cls 4:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg buf_finish_Message$:pause 4.080*1000:color rgb(255,255,255):end
3900 'if lang_flag = 1 then
3910 'lang_flag = 1 英語
3920 'else
3930 'lang_flag = 0 日本語
3940 'endif
3950 end select
3960 '4.終了するを選択  パッドの右
3970 endif
3980 'バーチャルパッド　上　ここまで
3990 '2.カーソルの処理
4000 'カーソル　下 chr$(31)
4010 if (key$ = chr$(31)) then
4020 select case (No)
4030 '4
4040 '0 選択肢4 => 選択肢1
4050 case 0:
4060 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "              ":color rgb(0,0,0):
4070 if lang_flag = 1 then
4080 'lang flag:1 英語
4090 else
4100 'lang flag:0 日本語
4110 color rgb(0,0,0):locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4120 endif
4130 '1 選択肢1 => 選択肢2
4140 case 1:
4150 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":
4160 if lang_flag = 1 then
4170 'lang_flag:1 英語
4180 else
4190 'lang_flag:0 日本語
4200 color rgb(0,0,0):locate 0,15:print "2.設定を選択":beep:goto Main_Select:
4210 endif
4220 '2 選択肢2 => 選択肢3
4230 case 2:
4240 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,15:print "               ":
4250 if lang_flag = 1 then
4260 'lang flag:1 英語
4270 else
4280 'lang flang:0 日本語
4290 color rgb(0,0,0):locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4300 endif
4310 '3 選択肢３ => 選択肢4
4320 case 3:
4330 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,595),0,0:locate 0,15:print "               ":color rgb(0,0,0)
4340 if lang_flag = 1 then
4350 'lang_flag = 1 英語
4360 else
4370 'lang_flag = 0 日本語
4380 color rgb(0,0,0):locate 0,15:print "4.終 了を選択":goto Main_Select:
4390 endif
4400 case else:
4410 goto Main_Select:
4420 end select
4430 endif
4440 'カーソル　上
4450 if key$=chr$(30) then
4460 select case (No)
4470 '選択肢1 => 選択肢4
4480 case 1:
4490 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:PRINT "                      ":
4500 if lang_flag = 1 then
4510 'lang_flag=1:英語
4520 'print "1.It has selected Kazutama check":goto Main_Select:
4530 else
4540 'lang_flag = 0:日本語
4550 else
4560 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4570 endif
4580 '選択肢2 => 選択肢1
4590 case 2:
4600 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                 ":locate 1,15:print "2.設 定を選択":goto Main_Select:
4610 '選択肢3　=> 選択肢2
4620 case 3:
4630 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,500),0,0
4640 if lang_flag = 1 then
4650 'lang_flag = 1:英語
4660 locate 0,15:print "It has selected Help":goto Main_Select:
4670 else
4680 'lang_flag = 0:日本語
4690 locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4700 endif
4710 '選択肢4 => 選択肢3
4720 case 0:
4730 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                ":locate 1,15:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
4740 if lang_flag = 1 then
4750 'lang flag=1 英語
4760 else
4770 'lang flag=0 日本語
4780 locate 1,15:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
4790 endif
4800 end select
4810 endif
4820 'Input "番号:",No
4830 'エンターキー入力:決定
4840 if key$ = chr$(13) then
4850 select case No
4860 case 1:
4870 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4880 case 3:
4890 Color rgb(255,255,255):goto Help:
4900 case 0:
4910 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg buf_finish_Message$:color rgb(255,255,255):pause 4.080 * 1000:end
4920 case 2:
4930 color rgb(255,255,255):sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
4940 end select
4950 endif
4960 '1-1.数霊チェック
4970 Surei_Check:
4980 cls 3:Font 48:
4990 select case device_No
5000  case 1:
5010 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5020 gload Gazo$ + "downscreen.png",0,0,800
5030 case 2:
5040 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5050 end select
5060 play ""
5070 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
5080 color rgb(255,0,0)
5090 'print "●数霊(かずたま)チェックトップ" + chr$(13)
5100 sp_on 0,1:sp_put 0,(5,300),0,0:screen 1,1,1
5110 if lang_flag = 1 then
5120 'lang_flag=1 英語
5130 else
5140 'lang_flag=0 日本語
5150 print chr$(13)+chr$(13)+chr$(13)
5160 color rgb(255,255,255)
5170 print "番号を選んでください" + chr$(13)
5180 print " :1.数霊(かずたま)1人用" + chr$(13)
5190 print " :2.数霊(かずたま)リスト 1人用　" + chr$(13)
5200 print " :3.数霊(かずたま)2人用" + chr$(13)
5210 print " :4.トップ画面に行く" + chr$(13)
5220 color rgb(0,0,0):No = 1
5230 locate 0,15:print "                                       "
5240 locate 0,15
5250 print " 1.数霊(かずたま)1人用を選択"
5260 endif
5270 Kazutama_main:
5280 'y:バーチャルパッドの処理
5290 'key$:カーソルの処理
5300 'bg:バーチャルパッドの右のボタン
5310 y = 0:key$ = "":bg=0
5320 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
5330 y = stick(1)
5340 key$ = inkey$
5350 bg=strig(1)
5360 y=stick(-1)
5370 pause 2
5380 wend
5390 'key$ = input$(1)
5400 if y = 1 then
5410 select case No
5420 'No の初期値：No=1
5430 case 2:
5440 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                       ":
5450 locate 0,15:print "                                     "
5460 locate 0,15
5470 print" 3.数霊(かずたま)2人用を選択":goto Kazutama_main:
5480 'デバッグライン　ここから
5490 '0のとき
5500 'デバッグライン　ここまで
5510 'デバッグライン　ここから
5520 case 3:
5530 sp_on 2,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_on 0,1:sp_put 0,(5,600),0,0:pause 200:locate 0,15:print "                                               "
5540 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":No=0:goto Kazutama_main:
5550 'デバッグライン　ここまで
5560 'デバッグライン　ここから
5570 'デバッグライン　ここまで
5580 case 0:
5590 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5600 case 1:
5610 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                          ":locate 0,15:print " 2.数霊（かずたま）リスト 1人用":goto Kazutama_main:
5620 'デバッグライン　ここから
5630 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
5640 'デバッグライン　ここまで
5650 end select
5660 endif
5670 'バーチャルパッド　上 ここから
5680 if y = -1 then
5690 select case No
5700 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
5710 case 1:
5720 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 0,15:print" 4.トップ画面に行くを選択":goto Kazutama_main:
5730 'No:3 3.Help→2.設定 No:2
5740 case 0:
5750 sp_on 1,0:sp_on 0,0:sp_on 3,1:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                     ":locate 0,15:print" 3.数霊（かずたま）2人用を選択":goto Kazutama_main:
5760 case 2:
5770 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                    ":locate 0,15:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5780 case 3:
5790 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                               ":locate 0,15:print "2.数霊(かずたま)リスト1人用を選択":goto Kazutama_main:
5800 end select
5810 endif
5820 if bg=1 then
5830 select case No
5840 '1.数霊チェックを選択  パッドの右キー
5850 case 1:
5860 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
5870 '2.数霊チェック2人用   パッドの右キー
5880 case 3:
5890 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
5900 '3.トップ画面に行く パッドの右
5910 case 0:
5920 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
5930 '2.数霊リスト1人用 パッドの右キー
5940 case 2:
5950 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_List1:
5960 'プログラムの終了を選択
5970 end select
5980 '4.終了するを選択  パッドの右
5990 endif
6000 'バーチャルパッド　上　ここまで
6010 if key$ = chr$(31) then
6020 select case No
6030 case 0:
6040 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,15:print "                                                          ":
6050 if lang_flag = 1 then
6060 Else
6070 locate 0,15:print "                                      "
6080 No=2:locate 0,15:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
6090 endif
6100 case 1:
6110 No=0:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,12:print "                                                          ":
6120 if lang_flag = 1 then
6130 Else
6140 locate 0,15:print"                                      "
6150 locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
6160 endif
6170 case 2:
6180 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                      ":
6190 if lang_flag = 1 then
6200 Else
6210 No=1:locate 0,15:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
6220 endif
6230 end select
6240 endif
6250 if key$=chr$(13) then
6260 select case No
6270 case 1:
6280 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
6290 case 2:
6300 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
6310 case 3:
6320 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
6330 '終了はトップメニューのみにする
6340 end select
6350 endif
6360 '前の画面に戻る
6370 'プログラムの終了
6380 '1人用
6390 '2人用
6400 '数霊(かずたま) 文字入力  1人用
6410 Surei_Input:
6420 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
6430 if mode = 0 then
6440 cls 3:font 32:init"kb:2"
6450 gload Gazo$ + "InputKotodama_20230131.png"
6460 play""
6470 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
6480 color rgb(255,0,0)
6490 if lang_flag=1 then
6500 '英語
6510 else
6520 print chr$(13)+chr$(13)+chr$(13)
6530 color rgb(255,255,255)
6540 print "文字を入れてください" + chr$(13)
6550 color rgb(255,255,255)
6560 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
6570 print chr$(13)
6580 color rgb(0,0,0)
6590 Input "入力文字:",buffer_moji$
6600 if buffer_moji$ = "" then
6610 ui_msg "未入力です":goto Surei_Input:
6620 else
6630 goto Surei_Result:
6640 endif
6650 endif
6660 endif
6670 if mode = 1 then
6680 cls 3:Font 32:
6690 gload Gazo$ + "InputKotodama.png"
6700 color rgb(255,0,0)
6710 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
6720 color rgb(255,255,255)
6730 print "文字を入れてください" + chr$(13)
6740 color rgb(255,0,0)
6750 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
6760 print "大文字のみ)" + chr$(13)
6770 color rgb(0,0,0)
6780 Input "文字入力:",buffer_moji2$
6790 goto Surei_Result3:
6800 'endif
6810 endif
6820 '数霊(かずたま)文字入力　2人用
6830 Surei_twoParson:
6840 cls 3:Font 32:init"kb:2"
6850 gload Gazo$ + "InputKotodama_20230131.png"
6860 '1人目入力
6870 if lang_flag = 1 then
6880 else
6890 print ""+chr$(13)+chr$(13)+chr$(13)
6900 color rgb(255,255,255)
6910 print "1人目の文字を入れてください" + chr$(13)
6920 color rgb(255,255,255)
6930 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
6940 color rgb(0,0,0)
6950 print chr$(13)
6960 Input "1人目文字入力:",buf_Parson1$
6970 endif
6980 Surei_twoParson2:
6990 cls 3:Font 32:init"kb:2"
7000 '2人目入力
7010 gload Gazo$ + "InputKotodama_20230131.png"
7020 if lang_falg = 1 then
7030 else
7040 print ""+chr$(13)+chr$(13)+chr$(13)
7050 color rgb(255,255,255)
7060 print "2人目の文字を入れてください" + chr$(13)
7070 color rgb(255,255,255)
7080 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
7090 color rgb(0,0,0)
7100 Input "2人目の文字入力:",buf_Parson2$
7110 goto Surei_Result2:
7120 endif
7130 '数霊　計算 パート
7140 '文字の計算関数
7150 'moji$:1文字を入れる
7160 func Complate(moji$)
7170 for n = 1 to 116
7180 if moji$ = bufline$(2*n) then
7190 buffcount = val(bufline$(2 * n + 1))
7200 endif
7210 next n
7220 endfunc buffcount
7230 '数霊　結果表示
7240 Surei_Result:
7250 cls 3:Font 32
7260 'ゼロカウント:zcount
7270 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
7280 '例 アカい:"い"の文字は無効な文字なので、はじく
7290 zcount=0
7300 'mojicount:入力文字数
7310 mojicount = len(buffer_moji$)
7320 for n=1 to mojicount
7330 for j=1 to 118
7340 if (bufcount$(n - 1) = bufline$(2 * j)) then
7350 bufcount$(n-1) = Mid$(buffer_moji$,n,1)
7360 endif
7370 next j
7380 next n
7390 ncount=0:count=0
7400 for i = 1 to mojicount
7410 bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7420 'ンのカウント
7430 if (bufcount$(i-1) = "ン") then ncount = ncount + 1
7440 next i
7450 if (ncount > 0) then
7460 'Listを表示する
7470 moji_List$(0) = "この単語は目に見える物です"
7480 moji_List$(1) = "この単語は目に見えない物です"
7490 num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
7500 if (num2 = 0) then
7510 else
7520 if (num2 = 1) then
7530 n1 = 9 * ncount
7540 endif
7550 endif
7560 endif
7570 for j=1 to mojicount
7580 bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7590 count = count + Complate(bufcount$(j - 1))
7600 next j
7610 count = count + n1
7620 if (ncount > 0) then count = count
7630 '182以上のとき,181を引く
7640 if buf_cofig_r = 0 then
7650 if (count > 181) then
7660 count = count - 181
7670 else
7680 if (buf_config_r = 1) then
7690 buf_count = Single_Complate(count)
7700 endif
7710 endif
7720 endif
7730 cls 3:Font 48+16
7740 gload Gazo$ + "Result_Screen3_20211226.png"
7750 if buf_config_r = 1 then
7760 print "入力文字:" + buffer_moji$ + chr$(13)
7770 print "数霊(かずたま):";buf_count;chr$(13)
7780 endif
7790 if lang_flag = 1 then
7800 else
7810 color rgb(255,0,0)
7820 print "入力文字:" + buffer_moji$ + chr$(13)
7830 endif
7840 if lang_flag = 1 then
7850 else
7860 color rgb(0,0,255)
7870 print "数霊(かずたま):";count;chr$(13)
7880 endif
7890 if lang_flag = 1 then
7900 else
7910 color rgb(0,0,0)
7920 print "エンター or スペース" + chr$(13)
7930 print  chr$(13)
7940 'endif
7950 endif
7960 key$ = input$(1)
7970 if ((key$ = chr$(13)) or (key$=" ")) then
7980 List$(0)="1.もう一度数霊を見る"
7990 List$(1)="2.トップ画面に行く"
8000 List$(2)="3.この数霊の説明を見る"
8010 List$(3)="4.数霊データーを保存"
8020 num=ui_select("List$","番号を選んでください")
8030 select case num
8040 case 0:
8050 goto Surei_Input:
8060 case 1:
8070 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
8080 for i=0 to 9
8090 bufcount$(i)=""
8100 next i
8110 goto TopScreen:
8120 case 2:
8130 goto Surei_Result4:
8140 case 3:
8150 s=Surei_Result_Save_File()
8160 ui_msg "保存しました"
8170 case -1:
8180 'goto Surei_Result:
8190 case else:
8200 goto Surei_Result:
8210 end select
8220 'ファイルを保存する
8230 else
8240 goto Surei_Result:
8250 endif
8260 '3-1 バージョン情報
8270 Version:
8280 cls 3:Font 32
8290 select case device_No
8300 case 1:
8310 gload Gazo$ + "Screen1_Version.png"
8320 gload Gazo$ + "downscreen.png",0,0,800
8330 case 2:
8340 gload Gazo$ + "Screen1_version.png"
8350 end select
8360 play ""
8370 play Voice_File_TopScreen$ + "Voice_Version.mp3"
8380 color rgb(255,0,0)
8390 print chr$(13)
8400 color rgb(255,255,255)
8410 if lang_flag = 1 then
8420 else
8430 print chr$(13)+chr$(13)+chr$(13)
8440 print "Ver:";Version$ + chr$(13)
8450 print "アプリ名:数霊計算機" + chr$(13)
8460 print "Basic for Android Runtime" + chr$(13)
8470 print "Author:licksjp" + chr$(13)
8480 print "制作開始:2021.7.28" + chr$(13)
8490 print chr$(13)
8500 print "(C)Copy right licksjp " + chr$(13)
8510 print "All rights reserved" + chr$(13)
8520 print chr$(13)
8530 color rgb(0,0,0)
8540 print "パッドの右を押してください" + chr$(13)
8550 endif
8560 bg=0:key$=""
8570 while (bg <> 1 and key$ <> chr$(13))
8580 bg = strig(1)
8590 key$ = inkey$
8600 pause 2
8610 wend
8620 if key$ = chr$(13) then
8630 goto TopScreen:
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
8770 select case device_No
8780 case 1:
8790 gload Gazo$ + "Screen1_Reference.png"
8800 gload Gazo$ + "downscreen.png",0,0,800
8810 case 2:
8820 gload Gazo$ + "Screen1_Reference.png"
8830 end select
8840 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
8850 color rgb(255,0,0)
8860 print chr$(13)+chr$(13)
8870 if lang_flag = 1 then
8880 else
8890 color rgb(255,255,255)
8900 print "書名:数霊" + chr$(13)
8910 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
8920 print "出版社:徳間書店" + chr$(13)
8930 print "ISBN:978-4-19-" + chr$(13)
8940 print "         865309-5" + chr$(13)
8950 print "定価:2300円 + 税" + chr$(13)
8960 color rgb(0,0,0)
8970 print "パッドの右を押してください"
8980 endif
8990 bg = 0:key$ = ""
9000 while (bg <> 1 and key$ <> chr$(13))
9010 bg = strig(1)
9020 key$ = inkey$
9030 pause 2
9040 wend
9050 if key$ = chr$(13) then
9060 goto TopScreen:
9070 else
9080 if bg = 1 then
9090 goto TopScreen:
9100 else
9110 talk "無効なキーです":goto Reference_Book:
9120 endif
9130 endif
9140 'ヘルプ画面　トップ画面
9150 Help:
9160 No=1:c=0
9170 play ""
9180 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
9190 cls 3:Font 48:
9200 select case device_No
9210 case 1:
9220 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9230 gload Gazo$ + "downscreen.png",0,0,800
9240 case 2:
9250 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9260 end select
9270 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0
9280 color rgb(255,0,0)
9290 print chr$(13)+chr$(13)+chr$(13)
9300 color rgb(255,255,255)
9310 print "番号を選んでください" + chr$(13)
9320 print " :1.バージョン" + chr$(13)
9330 print " :2.参考文献" + chr$(13)
9340 print " :3.トップ画面に行く" + chr$(13)
9350 color rgb(0,0,0)
9360 locate 0,15:print "                                     "
9370 if No = 1 then locate 0,15:print " 1.バージョンを選択"
9380 'y:バーチャルパッドの処理
9390 'key$:カーソルの処理
9400 'bg:バーチャルパッドの右ボタン
9410 Help_key:
9420 y = 0:key$ = "":bg=0
9430 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
9440 y = stick(1)
9450 key$ = inkey$
9460 bg=strig(1)
9470 pause 2
9480 wend
9490 'バーチャルパッド　ここから'
9500 if y = 1 then
9510 select case No
9520 'No の初期値：No=1
9530 case 1:
9540 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
9550 if lang_flag = 1 then
9560 else
9570 locate 0,15:print" 2.参考文献を選択":goto Help_key:
9580 endif
9590 'デバッグライン　ここから
9600 '0のとき
9610 'デバッグライン　ここまで
9620 'デバッグライン　ここから
9630 case 2:
9640 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                  "
9650 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に行くを選択":No=0:goto Help_key:
9660 'デバッグライン　ここまで
9670 'デバッグライン　ここから
9680 'デバッグライン　ここまで
9690 case 0:
9700 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
9710 'デバッグライン　ここから
9720 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
9730 'デバッグライン　ここまで
9740 end select
9750 endif
9760 'バーチャルパッド　上 ここから
9770 if y = -1 then
9780 select case No
9790 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
9800 case 0:
9810 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=1:locate 0,15:print"                                       ":locate 0,15:print" 3.トップ画面に行くを選択":goto Help_key
9820 'No:3 3.Help→2.設定 No:2
9830 case 1:
9840 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
9850 case 2:
9860 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=0:locate 0,15:print "                                      ":locate 0,15:print" 1.バージョンを選択":goto Help_key:
9870 end select
9880 endif
9890 if bg = 1 then
9900 select case No
9910 '1.数霊チェックを選択  パッドの右キー
9920 case 1:
9930 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
9940 '2.設定を選択    パッドの右キー
9950 case 2:
9960 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
9970 '3.ヘルプを選択 パッドの右
9980 case 0:
9990 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
10000 'プログラムの終了を選択
10010 'if lang_flag = 1 then
10020 'lang_flag = 1:英語
10030 'Else
10040 'lang_flag = 0:日本語
10050 'endif
10060 end select
10070 '4.終了するを選択  パッドの右
10080 endif
10090 'バーチャルパッド　上　ここまで
10100 'バーチャルパッド　ここまで'
10110 'key$ = input$(1)
10120 'カーソルの下
10130 if key$ = chr$(31) then
10140 select case (No Mod 4)
10150 'バージョンから参考文献
10160 case 0:
10170 c=1:No=c:locate 0,15:Print "             ":locate 0,15:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
10180 '参考文献からトップ画面
10190 case 1:
10200 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "            ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10210 'トップ画面から終了
10220 '終了からバージョン
10230 case 2:
10240 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                     ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10250 case else:
10260 goto Help_key:
10270 end select
10280 endif
10290 'カーソル　上
10300 if key$ = chr$(30) then
10310 select case (c Mod 4)
10320 'バージョンから終了
10330 case 0:
10340 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:locate 0,15:print "                   ":locate 0,15:print " 4.終 了を選択":goto Help_key:
10350 '参考文献からバージョン
10360 case 1:
10370 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                   ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10380 'トップ画面から参考文献
10390 case 2:
10400 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":locate 0,15:print " 2.参考文献を選択":goto Help_key:
10410 '終了からトップ画面を選択
10420 case 3:
10430 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print"                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10440 case else:
10450 goto Help_key:
10460 end select
10470 endif
10480 'エンターキー：決定
10490 if key$=chr$(13) then
10500 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10510 if No=0 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10520 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10530 else
10540 goto Help_key:
10550 endif
10560 '登録文字の確認
10570 '文字を1文字入れて登録されているか調べるメニュー
10580 '設定項目
10590 Setting:
10600 cls 3:Font 48
10610 select case device_No
10620 case 1:
10630 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
10640 gload Gazo$ + "downscreen.png",0,0,800
10650  case 2:
10660 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
10670 end select
10680 play ""
10690 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
10700 No=1
10710 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:
10720 color rgb(0,0,255)
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
10930 if No=1 then locate 0,15:print  "                                     ":locate 0,15:print " 1.文字の項目を選択"
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
11230 'デバッグライン　ここまで
11240 case 3:
11250 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                              ":locate 1,15:print "4.トップ画面に行くを選択":No=0:goto SettingScreen:
11260 'デバッグライン　ここから
11270 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11280 'デバッグライン　ここまで
11290 case 0:
11300 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
11310 'デバッグライン　ここから
11320 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11330 'デバッグライン　ここまで
11340 end select
11350 endif
11360 'バーチャルパッド　上 ここから
11370 if y = -1 then
11380 select case No
11390 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11400 case 1:
11410 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 1,15:print"4.トップ画面に行くを選択":goto SettingScreen:
11420 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11430 case 0:
11440 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
11450 'No:3 3.Help→2.設定 No:2
11460 case 3:
11470 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.結果表示設定を選択":goto SettingScreen:
11480 case 2:
11490 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 1,15:print"1.文字の項目を選択":goto SettingScreen:
11500 end select
11510 endif
11520 if bg=1 then
11530 select case No
11540 '1.数霊チェックを選択  パッドの右キー
11550 case 1:
11560 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
11570 '2.設定を選択    パッドの右キー
11580 case 2:
11590 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
11600 '3.ヘルプを選択 パッドの右
11610 case 0:
11620 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
11630 'プログラムの終了を選択
11640 case 3:
11650 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Setting_Language:
11660 end select
11670 endif
11680 '4.終了するを選択  パッドの右
11690 'バーチャルパッド　ここまで'
11700 'カーソル下'
11710 if key$ = chr$(31) then
11720 select case (No Mod 4)
11730 '登録文字から数霊文字の確認
11740 case 1:
11750 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                     ":locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11760 '数霊文字の確認からトップ画面に行く
11770 case 2:
11780 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "                                     ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
11790 'トップ画面に行くから終了
11800 case 3:
11810 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,590),0,0:locate 0,15:print "                                       ":locate 1,15:print "4.トップ画面に行くを選択":goto SettingScreen:
11820 '終了から登録文字
11830 case 0:
11840 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
11850 end select
11860 endif
11870 'カーソル　上
11880 if key$ = chr$(30) then
11890 select case (No Mod 4)
11900 case 1:
11910 c=2:No=c:sp_on 0,1:sp_put 0,(5,300),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
11920 case 2:
11930 c=3:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
11940 case 3:
11950 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:goto SettingScreen:
11960 case 0:
11970 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,590),0,0:sp_on 0,0:goto SettingScreen:
11980 end select
11990 endif
12000 'エンターキーを押したとき
12010 if key$ = chr$(13) then
12020 if No=3 then goto Setting_Language:
12030 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
12040 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
12050 if No=0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
12060 endif
12070 '文字検索項目  ここから
12080 Moji_Search:
12090 cls 4:cls 3:Font 32+16:init"kb:2"
12100 gload Gazo$ + "Moji_Search_Result.png"
12110 play ""
12120 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
12130 print "" + chr$(13)
12140 color rgb(255,255,255)
12150 if lang_flag = 1 then
12160 Else
12170 print "文字を一文字入れてください" + chr$(13)
12180 endif
12190 color rgb(0,0,0)
12200 if lang_flag=1 then
12210 Else
12220 Input "登録文字:",moji$
12230 endif
12240 moji_count = len(moji$)
12250 if moji_count > 1 then
12260 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Moji_Search:
12270 else
12280 count=0
12290 for n = 0 to 116
12300 if bufline$(2*n) = moji$ then
12310 cls 3:font 48:init"kb:4"
12320 select case device_No
12330 case 1:
12340 gload Gazo$ + "downscreen.png",0,0,800
12350 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12360 case 2:
12370 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12380 end select
12390 play ""
12400 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12410 if lang_flag = 1 then
12420 Else
12430 print chr$(13)
12440 color rgb(255,255,255)
12450 print moji$;"は、登録されています。" + chr$(13)
12460 color rgb(0,0,0)
12470 print "ジョイパッドの右を押してください"
12480 endif
12490 bg = 0:key$ = ""
12500 while (bg <> 1 and key$ <> chr$(13))
12510 key$ = inkey$
12520 bg = strig(1)
12530 pause 2
12540 wend
12550 if key$ = chr$(13) then goto TopScreen:
12560 if bg=1 then goto TopScreen:
12570 count = count + 1
12580 endif
12590 next n
12600 if count = 0 then
12610 cls 3:font 48:init "kb:4"
12620 gload Gazo$ + "Moji_check.png"
12630 play ""
12640 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
12650 print chr$(13)
12660 if lang_flag = 1 then
12670 Else
12680 color rgb(255,255,255)
12690 print moji$;"は、登録されていません。" + chr$(13)
12700 color rgb(0,0,0)
12710 print "パッドの右を押してください" + chr$(13)
12720 endif
12730 kg = 0:key$ = ""
12740 while (kg <> 1 and key$ <> chr$(13))
12750 key$ = inkey$
12760 kg = strig(1)
12770 pause 2
12780 wend
12790 if ((key$ = chr$(13)) or (kg=1)) then goto TopScreen:
12800 endif
12810 endif
12820 Surei_Result2:
12830 cls 3:Font 48
12840 zcount1=0:zcount2=0:count1=0:count2=0
12850 '1人目
12860 mojicount1=len(buf_Parson1$)
12870 '2人目
12880 mojicount2 = len(buf_Parson2$)
12890 '1人目
12900 for n = 1 to mojicount1
12910 for j = 1 to 116
12920 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
12930 if bufcount1$(n-1) = bufline$(2*j) then
12940 zcount1 = zcount1 + 1
12950 endif
12960 next j
12970 next n
12980 '2人目
12990 for n = 1 to mojicount2
13000 for j = 1 to 116
13010 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
13020 if bufcount2$(n-1) = bufline$(2*j) then
13030 zount2 = zcount2 + 1
13040 endif
13050 next j
13060 next n
13070 '1人目
13080 for i=1 to mojicount1
13090 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
13100 p1 = Complate(bufcount1$(i-1))
13110 count1 = count1 + p1
13120 next i
13130 '2人目
13140 for i = 1 to mojicount2
13150 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
13160 p2 = Complate(bufcount2$(i-1))
13170 count2 = count2 + p2
13180 next i
13190 cls 3:
13200 select case device_No
13210 case 1:
13220 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
13230 gload Gazo$ + "downscreen.png",0,0,800
13240 case 2:
13250 gload Gazo$ + "downscreen.png",0,0,0
13260 end select
13270 color rgb(255,0,0)
13280 print ""+chr$(13)
13290 if lang_flag = 1 then
13300 else
13310 color rgb(255,255,255)
13320 print chr$(13)+chr$(13)
13330 print "1人目:";buf_Parson1$;chr$(13)
13340 print "数霊1:";count1;chr$(13)
13350 print "2人目:";buf_Parson2$;chr$(13)
13360 print "数霊2:";count2;chr$(13)
13370 print "数霊(合計):";count1 + count2;chr$(13)
13380 color rgb(0,0,0)
13390 print "バーチャルパッドの右" + chr$(13)
13400 endif
13410 key$ = "":bg = 0
13420 while (bg <> 1 and key$ <> chr$(13))
13430 bg = strig(1)
13440 key$ = inkey$
13450 pause 2
13460 wend
13470 if (bg = 1 or key$ = chr$(13))  then goto TopScreen:
13480 Surei_Result3:
13490 cls 3:Font 48
13500 zcount2 = 0:count2 = 0
13510 mojicount2 = len(buffer_moji2$)
13520 for n = 1 to mojicount2
13530 for j = 1 to 116
13540 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
13550 if bufcount2$(n - 1) = bufline$(2 * j) then
13560 zcount2 = zcount2 + 1
13570 endif
13580 next j
13590 next n
13600 for i = 1 to mojicount2
13610 n2 = Complate(bufcount2$(i-1))
13620 count2 = count2 + n2
13630 next i
13640 gload Gazo$ + "Screen5.png"
13650 if lang_flag = 1 then
13660 else
13670 color rgb(255,0,0)
13680 print "数霊の結果表示" + chr$(13)
13690 color rgb(255,255,255)
13700 print "１回目回の文字入力:";buffer_moji$;chr$(13)
13710 print "１回目の数霊(かずたま)";count;chr$(13)
13720 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
13730 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
13740 color rgb(0,0,0)
13750 print "エンターキー:トップ画面";chr$(13)
13760 print "c or C キー:数霊の比較";chr$(13)
13770 endif
13780 key$ = "":bg = 0
13790 while (key$ <> chr$(13) and bg <> 1)
13800 bg = strig(1)
13810 key$ = inkey$
13820 pause 2
13830 wend
13840 if bg = 1 then goto TopScreen:
13850 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
13860 if key$ = "c" or key$ = "C" then
13870 if count = count2 then
13880 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
13890 else
13900 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
13910 endif
13920 endif
13930 Moji_Count_Check:
13940 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
13950 cls 3:Font 48
13960 select case device_No
13970 case 1:
13980 gload Gazo$ + "Moji_check.png"
13990 gload Gazo$ + "downscreen.png",0,0,800
14000 case 2:
14010 gload Gazo$ + "Moji_check.png",0,0,0
14020 end select
14030 n = 0
14040 open FILE_csv$ for input as #1
14050 while eof(1) = 0
14060 line input #1, line$
14070 n = n + 1
14080 wend
14090 close #1
14100 play ""
14110 if n = 118 then
14120 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
14130 if lang_flag = 1 then
14140 else
14150 print "" + chr$(13)
14160 color rgb(255,255,255)
14170 print "文字の登録文字数は";n;"文字" + chr$(13)
14180 color rgb(0,0,0)
14190 print "パッドの右を押してください" + chr$(13)
14200 endif
14210 endif
14220 key$ = "":bg = 0
14230 while (key$ <> chr$(13) and bg <> 1)
14240 key$=inkey$
14250 bg=strig(1)
14260 pause 2
14270 wend
14280 if bg = 1 then goto TopScreen:
14290 if key$ = chr$(13) then
14300 goto TopScreen:
14310 else
14320 goto Moji_Count_Check:
14330 endif
14340 'Save 関数
14350 file_kazutama = 0
14360 file_kazutama = Save_File()
14370 func Save_File()
14380 open SAVE_DATA1$  for output as #1
14390 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
14400 close #1
14410 endfunc
14420 Select_moji:
14430 cls 3:font 48:No = 1
14440 select case device_No
14450 case 1:
14460 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
14470 gload Gazo$ + "downscreen.png",0,0,800
14480 case 2:
14490 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
14500 end select
14510 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
14520 color rgb(255,0,0)
14530 if lang_flag = 1 then
14540 else
14550 play ""
14560 play Voice_File_TopScreen$ + "Voice_Select_Moji20230217.mp3"
14570 print chr$(13)+chr$(13)+chr$(13)
14580 color rgb(255,255,255)
14590 print "番号を選んでください" + chr$(13)
14600 print " :1.登録文字検索"+ chr$(13)
14610 print " :2.登録文字数の確認" + chr$(13)
14620 print " :3.トップ画面に戻る" + chr$(13)
14630 color rgb(0,0,0)
14640 locate 0,15
14650 if No = 1 then print " 1.登録文字検索を選択"
14660 endif
14670 Entry_check_key:
14680 y = 0:key$ = "":bg=0
14690 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
14700 y = stick(1)
14710 key$ = inkey$
14720 bg=strig(1)
14730 pause 2
14740 wend
14750 'バーチャルパッド　ここから'
14760 'バーチャルパッド　ここから'
14770 if y = 1 then
14780 select case No
14790 'No の初期値：No=1
14800 case 1:
14810 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
14820 'デバッグライン　ここから
14830 '0のとき
14840 'デバッグライン　ここまで
14850 'デバッグライン　ここから
14860 case 2:
14870 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                       "
14880 :No=0
14890 'if lang_flag = 1 then
14900 'Else
14910 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に戻るを選択":goto Entry_check_key:
14920 'endif
14930 'cls:color rgb(255,255,255):print"ok"
14940 'デバッグライン　ここまで
14950 'デバッグライン　ここから
14960 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
14970 'デバッグライン　ここまで
14980 case 0:
14990 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.登録文字数の確認を選択":goto Entry_check_key:
15000 'デバッグライン　ここから
15010 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
15020 'デバッグライン　ここまで
15030 end select
15040 endif
15050 'バーチャルパッド　上 ここから
15060 if y = -1 then
15070 select case No
15080 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15090 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15100 case 1:
15110 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print"3.トップ画面に戻るを選択":goto Entry_check_key:
15120 'No:3 3.Help→2.設定 No:2
15130 case 0:
15140 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
15150 case 2:
15160 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print "1.登録文字検索":goto Entry_check_key:
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
15280 case 0:
15290 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
15300 end select
15310 endif
15320 '4.終了するを選択  パッドの右
15330 'バーチャルパッド　ここまで'
15340 'key$ = input$(1)
15350 'カーソルの下
15360 if key$ = chr$(31) then
15370 select case (No Mod 4)
15380 case 0:
15390 c=1:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
15400 case 1:
15410 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,500),0,0:sp_on 3,0:goto Entry_check_key:
15420 case 2:
15430 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:goto Entry_check_key:
15440 case 3:
15450 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
15460 end select
15470 endif
15480 'カーソル　上
15490 if key$ = chr$(30) then
15500 select case (No Mod 4)
15510 case 0:
15520 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
15530 case 1:
15540 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
15550 case 2:
15560 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
15570 case 3:
15580 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
15590 end select
15600 endif
15610 'エンターキーを押す
15620 if key$ = chr$(13) then
15630 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15640 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15650 if No = 0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15660 endif
15670 '
15680 Kakunin_Surei_count:
15690 cls 3:font 48:No=1
15700 select case device_No
15710 case 1:
15720 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
15730 gload Gazo$ + "downscreen.png",0,0,800
15740 case 2:
15750 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
15760  end select
15770 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
15780 color rgb(255,0,0)
15790 print chr$(13)+chr$(13)+chr$(13)
15800 color rgb(255,255,255)
15810 print "番号を選んでください" + chr$(13)
15820 print " :1.数霊リスト 1人用" + chr$(13)
15830 print " :2.結果表示設定" + chr$(13)
15840 print " :3.トップ画面に行く" + chr$(13)
15850 print "" + chr$(13)
15860 color rgb(0,0,0)
15870 locate 0,15:print"                                                         "
15880 if No = 1 then locate 1,15:print "1.数霊リスト　1人用を選択"
15890 Entry_List:
15900 y = 0:key$ = "":bg=0
15910 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
15920 y = stick(1)
15930 key$ = inkey$
15940 bg = strig(1)
15950 pause 2
15960 wend
15970 'バーチャルパッド　ここから'
15980 'バーチャルパッド　ここから'
15990 'バーチャルパッド　下
16000 if y = 1 then
16010 select case No
16020 'No の初期値：No=1
16030 case 1:
16040 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.結果表示設定を選択":goto Entry_List:
16050 'デバッグライン　ここから
16060 '0のとき
16070 'デバッグライン　ここまで
16080 'デバッグライン　ここから
16090 'color rgb(0,0,0):locate 0,15:print " 4.終了を選択":goto Entry_List:
16100 'cls:color rgb(255,255,255):print"ok"
16110 'デバッグライン　ここまで
16120 case 0:
16130 sp_on 3,0:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 1.数霊リスト 1人用を選択":No=1:goto Entry_List:
16140 case 2:
16150 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                      ":No=0:locate 1,15:print "3．トップ画面に行くを選択":goto Entry_List:
16160 'デバッグライン　ここから
16170 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
16180 'デバッグライン　ここまで
16190 'デバッグライン　ここから
16200 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
16210 'デバッグライン　ここまで
16220 end select
16230 endif
16240 'バーチャルパッド　上 ここから
16250 if y = -1 then
16260 select case No
16270 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
16280 case 2:
16290 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 2.結果表示設定を選択":goto Entry_List:
16300 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
16310 case 0:
16320 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 1,15:print"3.トップ画面に行くを選択":goto Entry_List:
16330 'No:3 3.Help→2.設定 No:2
16340 case 1:
16350 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print "1.数霊リスト 1人用を選択":goto Entry_List:
16360 end select
16370 endif
16380 if bg = 1 then
16390 select case No
16400 '1.数霊リスト 一人用を選択を選択  パッドの右キー
16410 case 1:
16420 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16430 '2.設定を選択  パッドの右キー
16440 case 2:
16450 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16460 case 0:
16470 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16480 end select
16490 endif
16500 if key$=chr$(13) then
16510 select case No
16520 case 0:
16530 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16540 case 1:
16550 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16560 case 2:
16570 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16580 end select
16590 endif
16600 '4.終了するを選択  パッドの右
16610 'バーチャルパッド　ここまで'
16620 Surei_List1:
16630 cls 3:font 48
16640 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
16650 file$ = dir$(SAVE_DATA1$,0)
16660 'ファイルが無いときの画面
16670 if file$ = ""  then
16680 select case device_No
16690 case 1:
16700 gload Gazo$ + "KazutamaList1.png",0
16710 gload Gazo$+"downscreen.png",0,0,800
16720 case 2:
16730 gload Gazo$ + "KazutamaList1.png"
16740 end select
16750 print chr$(13)
16760 color rgb(255,255,255):print "登録ファイルはございません" + chr$(13)
16770 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
16780 'else
16790 'endif
16800 bg = 0:key$ = ""
16810 while (key$ <> chr$(13) and bg<>1)
16820 key$ = inkey$
16830 bg = strig(1)
16840 pause 2
16850 wend
16860 'エンターキーもしくはバーチャルパッドの右でトップに行く
16870 if (bg = 1  or key$ = chr$(13)) then goto TopScreen:
16880 else
16890 cls 3:buffer_list_count = Loadcount()
16900 color rgb(255,255,255)
16910 if lang_flag = 1 then
16920 Else
16930 talk "登録件数は" + str$(buffer_list_count) + "件です"
16940 select case device_No
16950 Case 1:
16960 gload Gazo$ + "KazutamaList1_Entry.png",0
16970 gload Gazo$ + "downscreen.png",0,0,800
16980 case 2:
16990 gload Gazo$+"KazutamaList1_Entry.png",0,0,0
17000 end select
17010 color rgb(0,0,255)
17020 print chr$(13)
17030 color rgb(255,255,255)
17040 print "登録件数:";buffer_list_count;"件";chr$(13)
17050 color rgb(0,0,0)
17060 print "パッドの右を押してください" + chr$(13)
17070 endif
17080 bg = 0:key$ = "":bg2 = 0
17090 while (key$ <> chr$(13) and bg <> 1)
17100 key$ = inkey$
17110 bg = strig(1)
17120 bg2=strig(0)
17130 pause 2
17140 wend
17150 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
17160 if (key$ = chr$(13) or bg = 1) then pause 2:goto KotodamaList_page:
17170 endif
17180 if (bg2 = 1) then pause 2:goto TopScreen:
17190 func Loadcount()
17200 n = 0
17210 'while eof(1)=-1
17220 open SAVE_DATA1$  for input as #1
17230 while eof(1) <> -1
17240 line input #1,line$
17250 n = n + 1
17260 wend
17270 close #1
17280 count = n
17290 endfunc count
17300 count_line = Loadcount()
17310 func Kotodama$(buf$)
17320 color rgb(255,255,255)
17330 b = len("数霊:")
17340 a$ = Mid$(buf$,b+1,len(buf$))
17350 for i=0 to 118
17360 color rgb(255,255,255)
17370 if bufline3$(2 * i) ="数霊:" + a$  then
17380 moji_$ = bufline3$(2*i + 1)
17390 endif
17400 next i
17410 kotodama$ = moji_$
17420 endfunc kotodama$
17430 KotodamaList_page:
17440 cls 3:font 48:m = 0:
17450 select case device_No
17460 case 1:
17470 gload Gazo$ + "Screen5_Surei_List.png"
17480 gload Gazo$ + "downscreen.png",0,0,800
17490 case 2:
17500 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
17510 end select
17520 if SAVE_DATA1$ = "" then
17530 cls 3:color rgb(255,255,255):print"ファイルがありません"
17540 else
17550 a = Loadcount()
17560 open SAVE_DATA1$  for input as #1
17570 for i=0 to a-1
17580 for n=0 to 1
17590 input #1,line$
17600 bufKaztama$(i,n) = line$
17610 next n
17620 next i
17630 close #1
17640 l = 0:n=0
17650 select case device_No
17660 case 1:
17670 gload Gazo$ + "Screen5_Surei_List.png"
17680 gload Gazo$ + "downscreen.png",0,0,800
17690 case 2:
17700 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
17710 end select
17720 while (buffer_list_count >= l)
17730 cls
17740 color rgb(255,0,0)
17750 print chr$(13)
17760 color rgb(255,255,255)
17770 n=n+1
17780 print chr$(13)
17790 print "番号:";l+1;chr$(13)
17800 print bufKaztama$(l,0) + chr$(13)
17810 print bufKaztama$(l,1) + chr$(13)
17820 Kmoji$ = moji$
17830 print chr$(13) + chr$(13) + chr$(13)
17840 color rgb(0,0,0)
17850 if buffer_list_count=1 then
17860 print " :パッドの左:トップ画面"+chr$(13)
17870 ui_msg "登録件数は1件です。"
17880 else
17890 if buffer_list_count > 1 then
17900 print " :パッドの左:トップ画面" + chr$(13)
17910 print " :パッドの右:次へ行く" + chr$(13)
17920 endif
17930 endif
17940 key$ = "":bg = 0:bg2 = 0
17950 while (key$ <> chr$(13) and bg <> 1 and bg2 <> 1)
17960 key$ = inkey$
17970 bg = strig(1)
17980 bg2 = strig(0)
17990 pause 2
18000 wend
18010 'if n > 1 then
18020 if (key$ = " " OR bg = 1) then
18030 if n > 1 then
18040 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
18050 endif
18060 else
18070 if ((bg2 = 1) or (key$=chr$(13))) then
18080 goto TopScreen:
18090 endif
18100 else
18110 goto KotodamaList_page:
18120 endif
18130 wend
18140 endif
18150 'ndif
18160 '結果表示２ Menu1
18170 Surei_Result4:
18180 cls 3:font 32+16:init"kb:4"
18190 for i=0 to 181 + 3 - 1
18200 if i = count  then
18210 buffer$ = bufline2$(count + 4,0)
18220 endif
18230 next i
18240 if len(buffer$) > 21 and len(buffer$) <= 45 then
18250 buffer2$ = Mid$(buffer$,1,22)
18260 buffer3$ = Mid$(buffer$,23,(len(buffer$) - 22))
18270 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13)
18280 else
18290 if len(buffer$) <= 21 then
18300 buffer2$ = Mid$(buffer$,1,21)
18310 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
18320 else
18330 if len(buffer$) > 45 and len(buffer$) <= 62 then
18340 buffer2$ = Mid$(buffer$,1,22)
18350 buffer3$ = Mid$(buffer$,23,22)
18360 buffer4$ = Mid$(buffer$,44,(len(buffer$)-44))
18370 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13)
18380 else
18390 if len(buffer$) > 64 and len(buffer$) <= 81 then
18400 buffer2$ = Mid$(buffer$,1,22)
18410 buffer3$ = Mid$(buffer$,23,20)
18420 buffer4$ = Mid$(buffer$,44,20)
18430 buffer5$ = Mid$(buffer$,65,(len(buffer$)-65))
18440 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13)
18450 if len(buffer$) > 81 and len(buffer$) <= 110 then
18460 buffer2$ = Mid$(buffer$,1,22)
18470 buffer3$ = Mid$(buffer$,23,20)
18480 buffer4$ = Mid$(buffer$,43,20)
18490 buffer5$ = Mid$(buffer$,63,20)
18500 buffer6$ = Mid$(buffer$,83,(len(buffer$) - 83))
18510 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13)
18520 endif
18530 endif
18540 endif
18550 endif
18560 endif
18570 Surei_Result4_2:
18580 select case device_No
18590 case 1:
18600 gload Gazo$ + "Screen1_Result2.png"
18610 gload Gazo$ + "downscreen.png",0,0,800
18620 case 2:
18630 gload Gazo$ +"Screen1_Result2.png"
18640 end select
18650 Result_Menu_List$(0)="1.トップ画面に行く"
18660 Result_Menu_List$(1)="2.数霊のデーターを保存"
18670 Result_Menu_List$(2)="3.もう一度、数霊を調べる"
18680 cls
18690 print chr$(13)
18700 if lang_flag = 1 then
18710 else
18720 color rgb(127,255,212)
18730 print chr$(13);chr$(13)
18740 print "入力文字:";buffer_moji$;chr$(13)
18750 print "数霊:";count;chr$(13)
18760 color rgb(255,255,255)
18770 print "数霊の説明:"+chr$(13)
18780 print buffer$
18790 color rgb(0,0,0)
18800 locate 0,15
18810 print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
18820 endif
18830 key$ = "":bg = 0:bg2 = 0
18840 while (bg<>1 and bg2<>1)
18850 key$ = inkey$
18860 bg = strig(1)
18870 bg2 = strig(0)
18880 pause 2
18890 wend
18900 if ((bg = 1) or (bg2 = 1)) then
18910 num = ui_select("Result_Menu_List$","番号を選んでください")
18920 endif
18930 if num = 0 then goto TopScreen:
18940 if num = 1 then goto File_save:
18950 if num = 2 then goto Surei_Input:
18960 if num = -1 then goto Surei_Result4
18970 File_save:
18980 'ファイルがない時
18990 if dir$(SAVE_DATA1$) = " " then
19000 open SAVE_DATA1$ for output as #1
19010 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19020 close #1
19030 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19040 'ファイルが有る時
19050 else
19060 open SAVE_DATA1$ for append as #1
19070 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19080 close #1
19090 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19100 endif
19110 func All_clear()
19120 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
19130 endfunc
19140 'ここから
19150 Config_moji1:
19160 cls 3:Font 48
19170 select case device_No
19180 case 1:
19190 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19200 gload Gazo$ + "downscreen.png",0,0,800
19210 case 2:
19220  gload  Gazo$ + "Screen1_Setting_Top.png",0,0,0
19230 end select
19240 play ""
19250 No=1
19260 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19270 color rgb(0,0,255)
19280 print chr$(13)
19290 if lang_flag = 1 then
19300 'lang_flag = 1:英語
19310 else
19320 'lang_flag = 0:日本語
19330 color rgb(255,255,255)
19340 print "番号を選んでください" + chr$(13)
19350 print " :1.文字の項目" + chr$(13)
19360 print " :2.結果表示設定" + chr$(13)
19370 print " :3.トップ画面に行く" + chr$(13)
19380 print " :4.終 了" + chr$(13)
19390 endif
19400 color rgb(0,0,0)
19410 locate 1,12
19420 if No = 1 then print "1.文字の項目"
19430 'y:バーチャルパッドの処理
19440 'key$:カーソルの処理
19450 'bg:バーチャルパッドの右ボタン
19460 Config_moji1_Screen:
19470 y = 0:key$ = "":bg=0
19480 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
19490 y = stick(1)
19500 key$ = inkey$
19510 bg=strig(1)
19520 pause 2
19530 wend
19540 'バーチャルパッド　ここから'
19550 'バーチャルパッド　ここから'
19560 if y = 1 then
19570 select case No
19580 'No の初期値：No=1
19590 case 1:
19600 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
19610 'デバッグライン　ここから
19620 '0のとき
19630 'デバッグライン　ここまで
19640 'デバッグライン　ここから
19650 case 2:
19660 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
19670 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
19680 'if lang_flag = 1 then
19690 'else
19700 locate 1,12:print "3.トップ画面に行くを選択"
19710 'endif
19720 'デバッグライン　ここまで
19730 case 3:
19740 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
19750 'デバッグライン　ここから
19760 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
19770 'デバッグライン　ここまで
19780 case 0:
19790 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
19800 'デバッグライン　ここから
19810 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
19820 'デバッグライン　ここまで
19830 end select
19840 endif
19850 'バーチャルパッド　上 ここから
19860 if y = -1 then
19870 select case No
19880 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
19890 case 1:
19900 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
19910 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
19920 case 0:
19930 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
19940 'No:3 3.Help→2.設定 No:2
19950 case 3:
19960 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
19970 case 2:
19980 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
19990 end select
20000 endif
20010 if bg=1 then
20020 select case No
20030 '1.数霊チェックを選択  パッドの右キー
20040 case 1:
20050 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
20060 '2.設定を選択    パッドの右キー
20070 case 2:
20080 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
20090 '3.ヘルプを選択 パッドの右
20100 case 3:
20110 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
20120 'プログラムの終了を選択
20130 case 0:
20140 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
20150 'if lang_flag = 1 then
20160 'Else
20170 ui_msg "プログラムを終了します":end
20180 'endif
20190 end select
20200 endif
20210 '4.終了するを選択  パッドの右
20220 'バーチャルパッド　ここまで'
20230 'SettingScreen:
20240 'key$ = input$(1)
20250 'カーソル下'
20260 if key$ = chr$(31) then
20270 select case (No Mod 4)
20280 '登録文字から数霊文字の確認
20290 case 1:
20300 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
20310 '数霊文字の確認からトップ画面に行く
20320 case 2:
20330 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
20340 'トップ画面に行くから終了
20350 case 3:
20360 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
20370 '終了から登録文字
20380 case 0:
20390 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20400 end select
20410 endif
20420 'カーソル　上
20430 if key$ = chr$(30) then
20440 select case (No Mod 4)
20450 case 1:
20460 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
20470 case 2:
20480 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
20490 case 3:
20500 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
20510 case 0:
20520 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
20530 end select
20540 endif
20550 'エンターキーを押したとき
20560 if key$ = chr$(13) then
20570 if No=3 then goto TopScreen:
20580 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
20590 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
20600 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
20610 'lse
20620 'o'o SettingScreen:
20630 endif
20640 'ここまで
20650 Config_moji2:
20660 cls 3:Font 48
20670 select case device_No
20680 case 1:
20690 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
20700 gload Gazo$ + "downscreen.png",0,0,800
20710  case 2:
20720 gload Gazo$ + "Screen1_Setting_Top.png "
20730  end select
20740 play ""
20750 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
20760 No=1
20770 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
20780 color rgb(0,0,255)
20790 'print "●設定項目" + chr$(13)
20800 print chr$(13)
20810 if lang_flag = 1 then
20820 'lang_flag = 1:英語
20830 else
20840 'lang_flag = 0:日本語
20850 color rgb(255,255,255)
20860 print "番号を選んでください" + chr$(13)
20870 'print " :1.文字の項目" + chr$(13)
20880 'print " :2.結果表示設定" + chr$(13)
20890 print " :1.文字の項目" + chr$(13)
20900 print " :2.結果表示設定" + chr$(13)
20910 print " :3.トップ画面に行く" + chr$(13)
20920 print " :4.終 了" + chr$(13)
20930 endif
20940 color rgb(0,0,0)
20950 locate 1,12
20960 if No = 1 then print "1.文字の項目"
20970 'y:バーチャルパッドの処理
20980 'key$:カーソルの処理
20990 'bg:バーチャルパッドの右ボタン
21000 config_moji2:
21010 y = 0:key$ = "":bg=0
21020 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
21030 y = stick(1)
21040 key$ = inkey$
21050 bg = strig(1)
21060 pause 2
21070 wend
21080 'バーチャルパッド　ここから'
21090 'バーチャルパッド　ここから'
21100 if y = 1 then
21110 select case No
21120 'No の初期値：No=1
21130 case 1:
21140 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
21150 'デバッグライン　ここから
21160 '0のとき
21170 'デバッグライン　ここまで
21180 'デバッグライン　ここから
21190 case 2:
21200 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
21210 color rgb(0,0,0)::No=2:goto SettingScreen:
21220 if lang_flag = 1 then
21230 else
21240 locate 0,12:print " 3.トップ画面に行くを選択"
21250 endif
21260 'cls:color rgb(255,255,255):print"ok"
21270 'デバッグライン　ここまで
21280 case 3:
21290 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
21300 'デバッグライン　ここから
21310 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
21320 'デバッグライン　ここまで
21330 case 0:
21340 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21350 'デバッグライン　ここから
21360 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
21370 'デバッグライン　ここまで
21380 end select
21390 endif
21400 'バーチャルパッド　上 ここから
21410 if y = -1 then
21420 select case No
21430 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
21440 case 1:
21450 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
21460 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
21470 case 0:
21480 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
21490 'No:3 3.Help→2.設定 No:2
21500 case 3:
21510 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
21520 case 2:
21530 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
21540 end select
21550 endif
21560 '決定ボタン
21570 if bg=1 then
21580 select case No
21590 '1.数霊チェックを選択  パッドの右キー
21600 case 1:
21610 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
21620 '2.設定を選択    パッドの右キー
21630 case 2:
21640 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
21650 '3.ヘルプを選択 パッドの右
21660 case 3:
21670 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
21680 'プログラムの終了を選択
21690 case 0:
21700 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
21710 'if lang_flag = 1 then
21720 'Else
21730 ui_msg "プログラムを終了します":end
21740 'endif
21750 end select
21760 endif
21770 '4.終了するを選択  パッドの右
21780 'バーチャルパッド　ここまで'
21790 'カーソル下'
21800 if key$ = chr$(31) then
21810 select case (No Mod 4)
21820 '登録文字から数霊文字の確認
21830 case 1:
21840 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
21850 '数霊文字の確認からトップ画面に行く
21860 case 2:
21870 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
21880 'トップ画面に行くから終了
21890 case 3:
21900 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
21910 '終了から登録文字
21920 case 0:
21930 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21940 end select
21950 endif
21960 'カーソル　上
21970 if key$ = chr$(30) then
21980 select case (No Mod 4)
21990 case 1:
22000 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
22010 case 2:
22020 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
22030 case 3:
22040 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
22050 case 0:
22060 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
22070 end select
22080 endif
22090 'エンターキーを押したとき
22100 if key$ = chr$(13) then
22110 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
22120 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
22130 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
22140 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
22150 'lse
22160 'o'o SettingScreen:
22170 endif
22180 '結果表示設定
22190 Result_Setting:
22200 color rgb(255,255,255)
22210 'dim list$(4)
22220 'ファイル読み込み
22230 '1.ファイルが有るか無いかのチェック
22240 if Dir$(System$) = "" then
22250 '1-1.ファイルがないとき
22260 '上のSystemフォルダを作成
22270 mkdir "./data/system/"
22280 list$(0) = "●:出た数字から181を引く"
22290 list$(1) = " :出た数字から180を引き単数変換"
22300 open System$ for output as #1
22310 print #1,"config_r=0"
22320 close #1
22330 ui_msg "ファイルを作成しました"
22340 'ファイル作成
22350 else
22360 '1-2.ファイルが有るとき
22370 'config_r:0 出た数字から181を引く
22380 'config_r:1 出た数字から180を引いて単数変換
22390 'open "./System/config.sys" for input as #1
22400 'ファイルが有るときファイルを読み込み
22410 open System$ for input as #1
22420 line input #1,buf_line$
22430 'buf$にデーターをコピーする
22440 buf$ = buf_line$
22450 close #1
22460 if len(buf$) = 10 then
22470 if left$(buf$,9) = "config_r=" then
22480 buf$ = right$(buf_line$,1)
22490 if buf$ = "1" then
22500 '1.System$ ファイルを削除(config.sys)
22510 '2.1行目をconfig_r=1と書き、保存する
22520 buf_config_r = 1
22530 'list$(0) = "●:1.出た数字から180を引いて単数変換"
22540 'list$(1) = " :2.出た数字から181を引く"
22550 else
22560 if buf$ = "0" then
22570 buf_config_r = 0
22580 ' list$(0) = "●:1.出た数字から181を引く"
22590 'list$(1) = " :2.出た数字から180を引いて単数変換"
22600 endif
22610 endif
22620 endif
22630 endif
22640 endif
22650 '"●:1.出た数字から180を引く"をlist$(0)に代入
22660 if buf_config_r =  0 then
22670 list$(0) = "●:1.出た数字から181を引く"
22680 list$(1) = " :2.出た数字から180を引いて単数変換"
22690 else
22700 list$(0) = "●:1.出た数字から180を引いて単数変換"
22710 list$(1) = " :2.出た数字から181を引く"
22720 endif
22730 list$(2) = " :トップ画面に戻る"
22740 list_num = ui_select("list$","番号を選んでください")
22750 play ""
22760 Select case (list_num)
22770 case 0:
22780 if buf$ = "1" then
22790 buf_config_r = 0:
22800 'データーを変更したのでファイルを削除
22810 kill System$
22820 'ファイルを新しく作成
22830 open System$ for output as #1
22840 print #1,"config_r=0"
22850 close #1
22860 ui_msg "設定を変更しました。"
22870 else
22880 'if buf$ = "0" then
22890 'buf_config_r = 1
22900 'kill System$
22910 'open Syetem$ for output as #1
22920 'print #1,"config_r=1"
22930 'close #1
22940 'ui_msg "設定を変更しました"
22950 'endif
22960 endif
22970 goto config_moji2:
22980 case 1:
22990 if buf$ = "0" then
23000 buf_config_r = 1:
23010 'データーを変更したので、ファイルを削除
23020 kill System$
23030 'ファイルを新しく作成
23040 open System$ for output as #1
23050 print #1,"config_r=1"
23060 close #1
23070 ui_msg "設定を変更しました"
23080 else
23090 kill System$
23100 if buf$ = "1" then
23110 open System$ for output as #1
23120 print #1,"config_r=0"
23130 close #1
23140 ui_msg "設定を変更しました"
23150 endif
23160 endif
23170 goto config_moji2:
23180 case 2:
23190 'トップ画面に飛ぶ
23200 goto TopScreen:
23210 case 3:
23220 'プログラムを終了する
23230 cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
23240 end select
23250 '単数変換
23260 Func Single_Complate(num)
23270 '1.出てきた数字から180を引く
23280 a = num - 180
23290 'a:10〜99
23300 Re1:
23310 if (a > 9 and a < 100) then
23320 b1 = fix(a / 10)
23330 b2 = 10 * a - b1
23340 d1 = b1 + b2
23350 if c > 9 then
23360 goto Re1:
23370 else
23380 c = d1:goto Re2:
23390 endif
23400 endif
23410 Re2:
23420 buffer = c
23430 endfunc buffer
23440 Func Surei_Result_Save_File()
23450 'ファイルがないとき
23460 if dir$(SAVE_DATA1$) = "" then
23470 open SAVE_DATA1$ for output as #1
23480 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
23490 close #1
23500 ui_msg "保存しました":talk "保存しました":goto Surei_Result:
23510 else
23520 open SAVE_DATA1$ for append as #1
23530 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
23540 close #1
23550 ui_msg "保存しました":talk "保存しました":goto Surei_Result
23560 endif
23570 endfunc
23580 '言語設定
23590 Setting_Language:
23600 cls 3:screen 1,1,1,1:No=2
23610 select case device_No
23620 case 1:
23630 gload Gazo$ + "Screen1.png",0,0,0
23640 gload Gazo$ + "downscreen.png",0,0,800
23650 case 2:
23660 gload Gazo$ + "Screen1.png",0,0,0
23670 end select
23680 init "Kb:4"
23690 sp_on 1,1:sp_on 0,0
23700 sp_put 0,(0,300),0,0
23710 sp_put 1,(0,400),1,0
23720 color rgb(0,0,255)
23730 'print "番号を選んでください"+chr$(13)
23740 'if lang_flag=0 then
23750 'print "言語設定:日本語"+chr$(13)
23760 'else
23770 'print "言語設定:英 語"+chr$(13)
23780 Change_Language:
23790 if lang_flag = 1 then
23800 cls
23810 print "It has changed Language"+chr$(13)
23820 color rgb(255,255,255)
23830 print "Select the Number"+chr$(13)
23840 print " :1.English → Japanse"+chr$(13)
23850 print " :2.It goes to TopScreen"+chr$(13)
23860 print "Language:In English" +chr$(13)
23870 else
23880 cls:color rgb(255,255,255)
23890 print "設定変更(言語の変更)" + chr$(13)
23900 color rgb(255,255,255)
23910 print chr$(13)
23920 print "番号を選んでください"+chr$(13)
23930 print " :1.日本語 → 英語に変更" + chr$(13)
23940 print " :2.トップ画面に戻る" + chr$(13)
23950 print chr$(13)
23960 print "設定言語:日本語" + chr$(13)
23970 endif
23980 color rgb(0,0,0)
23990 locate 0,15:print "                                       ":locate 0,15:print "2.トップ画面に戻る　を選択" + chr$(13)
24000 Setting_Language_key:
24010 y=0:key$="":bg=0
24020 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y<> -1 and bg<> 1)
24030 y=stick(1)
24040 key$=inkey$
24050 bg=strig(1)
24060 pause 2
24070 wend
24080 '選択肢変更
24090 if ((y=1) or (y=-1)) then
24100 select case No
24110 case 2:
24120 '実装部分　ここから
24130 pause 200:No=1:sp_on 0,1:sp_on 1,0:locate 0,15:print "                                                         ":locate 0,15:print "1.日本語 → 英語に変更を選択": goto Setting_Language_key:
24140 '実装部分　ここまで
24150 case 1:
24160 pause 200: No=2:sp_on 0,0:sp_on 1,1:locate 0,15:print "                                                       ":locate 0,15:print "2.トップ画面に戻る を選択":goto Setting_Language_key:
24170 end select
24180 endif
24190 'Enter Key  決定ボタン
24200 if ((key$=chr$(13)) or (bg=1)) then
24210 select case No
24220 case 2:
24230 sp_on 0,0:sp_on 1,0:goto TopScreen:
24240 case 1:                                                     'lang_flag=1:sp_on 0,0:sp_on 1,0:goto Change_Language:
24250 '
24260 '未実装　ここから
24270 sp_on 0,1:sp_on 1,0:ui_msg "この機能は未実装です":goto Setting_Language_key:
24280 '
24290 '未実装　ここまで
24300 end select
24310 endif
24320 '配列削除
24330 buffer_clear:
24340 erase bufline$
24350 erase bufcount$
24360 erase bufcount1$
24370 erase bufcount2$
24380 erase bufline2$
24390 erase bufline3$
24400 erase bufKaztama$
24410 erase List$
24420 erase Result_Menu_List$
24430 erase list$
24440 erase moji_List$
24450 'ui_msg "メモリーをクリアしました"
24460 return
24470 '配列削除　ここまで
