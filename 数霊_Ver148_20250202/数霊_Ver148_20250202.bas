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
560 'Version 1.3.8_2023.03.19-2023.03.26(Release):正式版
570 'April(2023)
580 'Version 1.3.9_2023.03.26-2023.04.02(Release):正式版
590 'Version 1.4.0_2023.04.02-2023.04.09(Release):正式版
600 'Version 1.4.1_2023.04.09-2023.04.16(Release):正式版
610 'Version 1.4.2_2023.04.16-2023.04.23(Release):正式版
620 'Version 1.4.3_2023.04.23-2023.04.30(Release):正式版
630 'Version 1.4.4_2023.04.30-2023.05.07(Release):正式版
640 'May (2023)
650 'Version 1.4.5_2023.05.07-2023.05.14(Release):正式版
660 'Version 1.4.6_2023.05.14-2023.05.21(Release):正式版
670 'Version 1.4.7_2023.05.22-2023.05.28(Release):正式版
680 'Feb(2025)
690 'Version 1.4.8_2025.02.02:正式版
700 '現在のバージョン
710 Version$ = "1.4.8_2025.02.02(正式版)"
720 'csvファイル 1.数霊 ベースファイル
730 FILE_csv$ = "./data/Kazutama.csv"
740 'csvファイル 2.数霊 ベースファイル 2
750 FILE_csv2$ = "./data/Surei_chart_20211207.csv"
760 'Save ファイル
770 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
780 'gazo ファイル
790 Gazo$ = "./data/Gazo/"
800 'System フォルダ:設定ファイルを保存するところ
810 System$ = "./data/System/config.sys"
820 'Device type:デバイスタイプのファイルチェック
830 Device_type$ = "./data/device_type.sys"
840 '設定ファイル名:config.sys
850 'Sound File(Voice)
860 '1.ボイス TopScreen
870 Voice_File_TopScreen$ = "./data/Sound_data/"
880 'Message
890 buf_finish_Message$ = "メモリーを解放してプログラムを終了します"
900 '変数領域
910 'vcount:バーチャルパッド下の変数
920 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+6,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
930 count2 = 0:N=0:N2=0:m2 = 0:device_No=0:device_type=0
940 dim list$(4),moji_List$(2)
950 'ファイルの有無チェック
960 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
970 '1.ファイルが無いとき
980 cls :print "依存ファイルが見つかりません":
990 print "エンターキーを押してください" + chr$(13)
1000 key$ = input$(1)
1010 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
1020 else
1030 '2.ファイルが有るとき
1040 cls:print "csv:file ok." + chr$(13)
1050 n=0
1060 'FILE_csv$:数霊データー入力
1070 open FILE_csv$ for input as #1
1080 while eof(1) = 0
1090 input #1,line$
1100 bufline$(n) = line$
1110 'Print n;chr$(13)
1120 '登録件数カウント:n
1130 n = n + 1
1140 wend
1150 close #1
1160 N=n
1170 '2つ目のファイル読み込み
1180 'n = 0
1190 open FILE_csv2$ for input as #2
1200 for n=3 to 181+2+2
1210 for i=0 to 1
1220 input #2,line$
1230 bufline2$(n,i) = line$
1240 next i
1250 next n
1260 close #2
1270 N2 = n
1280 endif
1290 '2022.11.23----------------------
1300 '端末言語のチェック
1310 '日本語端末かチェックをして日本語以外なら英語で表示する
1320 'lang flag:0:日本語 1:英語(日本語以外)
1330 '--------------------------------
1340 lang_flag = 0
1350 if ex_info$(1) <> "JP" then
1360 lang_flag = 1
1370 endif
1380 cls 3:font 48:screen 1,1,1,1:int "kb:4":init "crt:0"
1390 play ""
1400 'gload Gazo$ + "TopScreen_20230310.png",0,0,0
1410 '選択ポインター 1 - 4
1420 'スプライトの定義
1430 gload Gazo$ + "Selection.png",1,5,300
1440 gload Gazo$ + "Selection.png",1,5,400
1450 gload Gazo$ + "Selection.png",1,5,500
1460 gload Gazo$ + "Selection.png",1,5,595
1470 sp_def 0,(5,300),32,32
1480 sp_def 1,(5,400),32,32
1490 sp_def 2,(5,500),32,32
1500 sp_def 3,(5,595),32,32
1510 'File check
1520 '初回起動はここから
1530 if (dir$(Device_type$) = "") then
1540 goto Device_Select:
1550 else
1560 '
1570 '2回目以降はファイルチェックをしてトップ画面
1580 '
1590 open Device_type$ for input as #1
1600 line input #1,device_type$
1610 device_No = val(device_type$)
1620 close #1
1630 if (device_No=1 or device_No=2) then
1640 goto TopScreen:
1650 endif
1660 endif
1670 'First_Select_Screen:
1680 'タブレット　or　スマホの選択を起動時にする
1690 Device_Select:
1700 font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
1710 gload Gazo$ + "device_select_20230313.png",0,0,0
1720 init "kb:4"
1730 play ""
1740 play Voice_File_TopScreen$+"Select_device_select.mp3"
1750 'y=0:key$="":bg=0
1760 print chr$(13)+chr$(13)+chr$(13)
1770 color  rgb(255,255,255)
1780 print "番号を選んでください"+chr$(13)
1790 'print chr$(13)
1800 print " :1.スマートフォン"+chr$(13)
1810 print " :2.タブレット端末"+chr$(13)
1820 locate 0,11:No=1
1830 color rgb(0,0,0)
1840 Print " 1.スマートフォンを選択"+chr$(13)
1850 sp_on 0,1:sp_put 0,(5,300),0,0
1860 sp_on 1,0:sp_on 2,0:sp_on 3,0
1870 device_selection:
1880 y=0:key$="":bg=0:
1890 While (key$ <> chr$(30) and key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
1900 y = stick(1)
1910 key$ = inkey$
1920 bg = strig(1)
1930 pause 2
1940 wend
1950 if ((y=1) or (y=-1) or (key$=chr$(30)) or (key$=chr$(31)) ) then
1960 select case No
1970 case 1:
1980 No=2:sp_on 1,1:sp_on 0,0:locate 0,11:pause 300:sp_put 1,(5,400),0,0:print "                                ":locate 0,11:print " 2.タブレット端末を選択":goto device_selection:
1990 case 2:
2000 No=1:sp_on 1,0:sp_on 0,1:pause 300:sp_put 0,(5,300),0,0:locate 0,11:print "                                   ":locate 0,11:print " 1.スマートフォンを選択":goto device_selection:
2010 end select
2020 endif
2030 '決定ボタン
2040 if ((bg=2) or (key$=chr$(13)))  then
2050 select case No
2060 case 1:
2070 sp_on 0,0:sp_on 1,0:device_No=1:gosub File_Device_Set:goto TopScreen:
2080 case 2:
2090 sp_on 0,0:sp_on 1,0:device_No=2:gosub File_Device_Set:goto TopScreen:
2100 end select
2110 endif
2120 'Top画面
2130 TopScreen:
2140 'バーチャルパッドを表示
2150 cls 3:font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
2160 'play ""
2170 play ""
2180 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
2190 'gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
2200 select case device_No
2210 case 1:
2220 'Top画面の背景画像
2230 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2240 gload Gazo$ + "downscreen.png",0,0,800
2250 case 2:
2260 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2270 end select
2280 'key$=input$(1)
2290 'バーチャルパッドの背景を白にする for smartphone screen
2300 'gload Gazo$ + "downscreen.png",0,0,800
2310 '選択肢 1
2320 gload Gazo$ + "Selection.png",1,5,300
2330 '選択肢 2
2340 gload Gazo$ + "Selection.png",1,5,400
2350 '選択肢 3
2360 gload Gazo$ + "Selection.png",1,5,500
2370 '選択肢 4
2380 'TopScreen:
2390 'select case device_No
2400 'case 1:
2410 gload Gazo$ + "Selection.png",1,5,590
2420 'case 2:
2430 'gload Gazo$ +
2440 'end select
2450 color rgb(0,0,255)
2460 print chr$(13)
2470 if lang_flag = 1 then
2480 color rgb(255,255,255)
2490 print "Select Number" + chr$(13)
2500 print " :1.Kazutama check" + chr$(13)
2510 print " :2.Setting" + chr$(13)
2520 print " :3.Help" + chr$(13)
2530 print " :4.End Program" + chr$(13)
2540 color rgb(255,255,255)
2550 else
2560 color rgb(255,255,255)
2570 print chr$(13)
2580 sp_on 0,1:sp_put 0,(5,300),0,0
2590 print "番号を選んでください" + chr$(13)
2600 print " :1.数霊(かずたま)チェック" + chr$(13)
2610 print " :2.設定" + chr$(13)
2620 print " :3.ヘルプ" + chr$(13)
2630 print " :4.(プログラムを)終　了する" + chr$(13)
2640 color rgb(0,0,0)
2650 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
2660 'バーチャルパッドを表示
2670 No=1:
2680 'lang_flag:1 外国語,0:日本語
2690 if lang_flag = 1 then
2700 'lang_flag=1 英語
2710 locate 0,15:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
2720 else
2730 'lang_flag=0 日本語
2740 locate 0,15:color rgb(0,0,0):print " 1.数霊(かずたま)チェックを選択";chr$(13)
2750 endif
2760 endif
2770 'TopScreen sprite
2780 'スプライト
2790 '選択肢 1 On
2800 'sp_def 0,(5,300),32,32
2810 'sp_on 0,1
2820 'sp_put 0,(5,300),0,0
2830 '選択肢 2 Off
2840 sp_def 1,(5,400),32,32
2850 sp_on 1,0
2860 sp_put 1,(5,400),0,0
2870 '選択肢 3 Off
2880 sp_def 2,(5,500),32,32
2890 sp_on 2,0
2900 sp_put 2,(5,500),0,0
2910 '選択肢 4 Off
2920 sp_def 3,(5,600),32,32
2930 sp_on 3,0
2940 sp_put 3,(5,600),0,0
2950 color rgb(0,0,0)
2960 Main_Select:
2970 'y:バーチャルパッドの処理
2980 'key$:カーソルの処理
2990 y = 0:key$ = "":bg = 0
3000 while ((key$ <> chr$(31)) and (key$ <> chr$(13)) and (y <> 1) and (y <> -1) and (bg <> 2))
3010 y = stick(1)
3020 key$ = inkey$
3030 bg = strig(1)
3040 pause 2
3050 wend
3060 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
3070 '1.バーチャルパッドの処理
3080 'バーチャルパッド下を押した時
3090 if y = 1 then
3100 select case No
3110 'No の初期値：No=1
3120 case 1:
3130 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
3140 if lang_flag = 1 then
3150 'lang_flag=1 英語
3160 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3170 else
3180 'lang_flag=0 日本語
3190 locate 0,15:print " 2.設定を選択":goto Main_Select:
3200 endif
3210 'デバッグライン　ここから
3220 '0のとき
3230 'デバッグライン　ここまで
3240 'デバッグライン　ここから
3250 'バーチャルパッド　下
3260 case 2:
3270 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:
3280 print "                                         ":
3290 if lang_flag = 1 then
3300 color rgb(0,0,0):locate 0,15:
3310 print "3.It has selected Help":No=3:goto Main_Select:
3320 else
3330 color rgb(0,0,0):locate 0,15:print "                                                         ":locate 0,15:
3340 print " 3.ヘルプを選択":No=3:goto Main_Select:
3350 endif
3360 'デバッグライン　ここまで
3370 case 3:
3380 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                               "
3390 if lang_flag = 1 then
3400 locate 0,15:print "4.It has selected finish program":No=0:goto Main_Select:
3410 else
3420 locate 0,15:print "                                                         " :locate 0,15:print " 4.(プログラムを)終了するを選択":No=0:goto Main_Select:
3430 endif
3440 'デバッグライン　ここから
3450 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
3460 'デバッグライン　ここまで
3470 case 0:
3480 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1
3490 if lang_flag = 1 then
3500 'lang_flag=1:英語
3510 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3520 else
3530 'lang_flag=0:日本語
3540 locate 0,15:print "                                      ":locate 0,15:print " 1.数霊(かずたま)チェックを選択":goto Main_Select:
3550 endif
3560 'デバッグライン　ここから
3570 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
3580 'デバッグライン　ここまで
3590 end select
3600 endif
3610 'バーチャルパッド　上 ここから
3620 if (y = -1) then
3630 select case No
3640 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
3650 case 1:
3660 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                                          "
3670 'if lang_flag = 1 then
3680 'lang_flag=1 英語
3690 'locate 0,15:print "4.It has finished program":goto Main_Select:
3700 'else
3710 'lang_flag=0 日本語
3720 locate 0,15:print "                                                          ":
3730 locate 0,15:print " 4.(プログラムを)終了するを選択":goto Main_Select:
3740 'endif
3750 'endif
3760 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
3770 case 0:
3780 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":
3790 if lang_flag = 1 then
3800 '1:英語
3810 locate 0,15:print "3.It has selected Help":goto Main_Select:
3820 else
3830 '0:日本語
3840 locate 0,15:print "                                                                                        "
3850 locate 0,15:print " 3.ヘルプを選択":goto Main_Select:
3860 endif
3870 'No:3 3.Help→2.設定 No:2
3880 case 3:
3890 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      "
3900 if lang_flag = 1 then
3910 '1:英語
3920 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3930 else
3940 '0:日本語
3950 locate 0,15:print" 2.設定を選択":goto Main_Select:
3960 endif
3970 case 2:
3980 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":
3990 if lang_flag = 1 then
4000 'lang_flag 1 英語
4010 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
4020 else
4030 'lang_flag 0 日本語
4040 locate 0,15:print" 1.数霊(かずたま)チェックを選択":goto Main_Select:
4050 endif
4060 end select
4070 endif
4080 if (bg = 2) then
4090 select case No
4100 '1.数霊チェックを選択  パッドの右キー(決定)
4110 case 1:
4120 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4130 '2.設定を選択  パッドの右キー(決定)
4140 case 2:
4150 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
4160 '3.ヘルプを選択 パッドの右(決定)
4170 case 3:
4180 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
4190 'プログラムの終了を選択(決定)
4200 case 0:
4210 cls 3:cls 4:gosub buffer_clear:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":ui_msg buf_finish_Message$:pause 4.080*1000:color rgb(255,255,255):end
4220 'if lang_flag = 1 then
4230 'lang_flag = 1 英語
4240 'else
4250 'lang_flag = 0 日本語
4260 'endif
4270 end select
4280 '4.終了するを選択  パッドの右
4290 endif
4300 'バーチャルパッド　上　ここまで
4310 '2.カーソルの処理
4320 'カーソル　下 chr$(31)
4330 if (key$ = chr$(31)) then
4340 select case (No)
4350 '4
4360 '0 選択肢4 => 選択肢1
4370 case 0:
4380 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "              ":color rgb(0,0,0):
4390 if lang_flag = 1 then
4400 'lang flag:1 英語
4410 else
4420 'lang flag:0 日本語
4430 color rgb(0,0,0):locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4440 endif
4450 '1 選択肢1 => 選択肢2
4460 case 1:
4470 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":
4480 if lang_flag = 1 then
4490 'lang_flag:1 英語
4500 else
4510 'lang_flag:0 日本語
4520 color rgb(0,0,0):locate 0,15:print "2.設定を選択":beep:goto Main_Select:
4530 endif
4540 '2 選択肢2 => 選択肢3
4550 case 2:
4560 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,15:print "               ":
4570 if lang_flag = 1 then
4580 'lang flag:1 英語
4590 else
4600 'lang flang:0 日本語
4610 color rgb(0,0,0):locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4620 endif
4630 '3 選択肢３ => 選択肢4
4640 case 3:
4650 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,595),0,0:locate 0,15:print "               ":color rgb(0,0,0)
4660 if lang_flag = 1 then
4670 'lang_flag = 1 英語
4680 else
4690 'lang_flag = 0 日本語
4700 color rgb(0,0,0):locate 0,15:print "4.終 了を選択":goto Main_Select:
4710 endif
4720 case else:
4730 goto Main_Select:
4740 end select
4750 endif
4760 'カーソル　上
4770 if (key$=chr$(30)) then
4780 select case (No)
4790 '選択肢1 => 選択肢4
4800 case 1:
4810 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:PRINT "                      ":
4820 if lang_flag = 1 then
4830 'lang_flag=1:英語
4840 'print "1.It has selected Kazutama check":goto Main_Select:
4850 else
4860 'lang_flag = 0:日本語
4870 else
4880 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4890 endif
4900 '選択肢2 => 選択肢1
4910 case 2:
4920 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                 ":locate 1,15:print "2.設 定を選択":goto Main_Select:
4930 '選択肢3　=> 選択肢2
4940 case 3:
4950 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,500),0,0
4960 if lang_flag = 1 then
4970 'lang_flag = 1:英語
4980 locate 0,15:print "It has selected Help":goto Main_Select:
4990 else
5000 'lang_flag = 0:日本語
5010 locate 0,15:print "3.ヘルプを選択":goto Main_Select:
5020 endif
5030 '選択肢4 => 選択肢3
5040 case 0:
5050 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                ":locate 1,15:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
5060 if lang_flag = 1 then
5070 'lang flag=1 英語
5080 else
5090 'lang flag=0 日本語
5100 locate 1,15:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
5110 endif
5120 end select
5130 endif
5140 'Input "番号:",No
5150 'エンターキー入力:決定
5160 if (key$ = chr$(13)) then
5170 select case No
5180 case 1:
5190 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
5200 case 3:
5210 Color rgb(255,255,255):goto Help:
5220 case 0:
5230 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg buf_finish_Message$:color rgb(255,255,255):pause 4.080 * 1000:end
5240 case 2:
5250 color rgb(255,255,255):sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
5260 end select
5270 endif
5280 '1-1.数霊チェック
5290 Surei_Check:
5300 cls 3:Font 48:
5310 select case device_No
5320 case 1:
5330 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5340 gload Gazo$ + "downscreen.png",0,0,800
5350 case 2:
5360 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5370 end select
5380 play ""
5390 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
5400 color rgb(255,0,0)
5410 'print "●数霊(かずたま)チェックトップ" + chr$(13)
5420 sp_on 0,1:sp_put 0,(5,300),0,0:screen 1,1,1
5430 if lang_flag = 1 then
5440 'lang_flag=1 英語
5450 else
5460 'lang_flag=0 日本語
5470 print chr$(13)+chr$(13)+chr$(13)
5480 color rgb(255,255,255)
5490 print "番号を選んでください" + chr$(13)
5500 print " :1.数霊(かずたま)1人用" + chr$(13)
5510 print " :2.数霊(かずたま)リスト 1人用　" + chr$(13)
5520 print " :3.数霊(かずたま)2人用" + chr$(13)
5530 print " :4.トップ画面に行く" + chr$(13)
5540 color rgb(0,0,0):No = 1
5550 locate 0,15:print "                                       "
5560 locate 0,15
5570 print " 1.数霊(かずたま)1人用を選択"
5580 endif
5590 Kazutama_main:
5600 'y:バーチャルパッドの処理
5610 'key$:カーソルの処理
5620 'bg:バーチャルパッドの右のボタン
5630 y = 0:key$ = "":bg=0
5640 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
5650 y = stick(1)
5660 key$ = inkey$
5670 bg=strig(1)
5680 y=stick(-1)
5690 pause 2
5700 wend
5710 'key$ = input$(1)
5720 if (y = 1) then
5730 select case No
5740 'No の初期値：No=1
5750 case 2:
5760 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                       ":
5770 locate 0,15:print "                                     "
5780 locate 0,15
5790 print" 3.数霊(かずたま)2人用を選択":goto Kazutama_main:
5800 'デバッグライン　ここから
5810 '0のとき
5820 'デバッグライン　ここまで
5830 'デバッグライン　ここから
5840 case 3:
5850 sp_on 2,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_on 0,1:sp_put 0,(5,585),0,0:pause 200:locate 0,15:print "                                               "
5860 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":No=0:goto Kazutama_main:
5870 'デバッグライン　ここまで
5880 'デバッグライン　ここから
5890 'デバッグライン　ここまで
5900 case 0:
5910 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5920 case 1:
5930 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                                             ":locate 0,15:print " 2.数霊（かずたま）リスト 1人用を選択":goto Kazutama_main:
5940 'デバッグライン　ここから
5950 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
5960 'デバッグライン　ここまで
5970 end select
5980 endif
5990 'バーチャルパッド　上 ここから
6000 if (y = -1) then
6010 select case No
6020 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
6030 case 1:
6040 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 0,15:print" 4.トップ画面に行くを選択":goto Kazutama_main:
6050 'No:3 3.Help→2.設定 No:2
6060 case 0:
6070 sp_on 1,0:sp_on 0,0:sp_on 3,1:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                     ":locate 0,15:print" 3.数霊（かずたま）2人用を選択":goto Kazutama_main:
6080 case 2:
6090 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
6100 case 3:
6110 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 0,15:print " 2.数霊(かずたま)リスト 1人用を選択":goto Kazutama_main:
6120 end select
6130 endif
6140 if (bg=2) then
6150 select case No
6160 '1.数霊チェックを選択  パッドの右キー
6170 case 1:
6180 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
6190 '2.数霊チェック2人用   パッドの右キー
6200 case 3:
6210 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
6220 '3.トップ画面に行く パッドの右
6230 case 0:
6240 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
6250 '2.数霊リスト1人用 パッドの右キー
6260 case 2:
6270 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_List1:
6280 'プログラムの終了を選択
6290 end select
6300 '4.終了するを選択  パッドの右
6310 endif
6320 'バーチャルパッド　上　ここまで
6330 if (key$ = chr$(31)) then
6340 select case No
6350 case 0:
6360 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,15:print "                                                          ":
6370 if lang_flag = 1 then
6380 Else
6390 locate 0,15:print "                                      "
6400 No=2:locate 0,15:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
6410 endif
6420 case 1:
6430 No=0:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,585),0,0:locate 0,12:print "                                                          ":
6440 if lang_flag = 1 then
6450 Else
6460 locate 0,15:print"                                      "
6470 locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
6480 endif
6490 case 2:
6500 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                      ":
6510 if lang_flag = 1 then
6520 Else
6530 No=1:locate 0,15:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
6540 endif
6550 end select
6560 endif
6570 if (key$=chr$(13)) then
6580 select case No
6590 case 1:
6600 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
6610 case 2:
6620 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
6630 case 3:
6640 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
6650 '終了はトップメニューのみにする
6660 end select
6670 endif
6680 '前の画面に戻る
6690 'プログラムの終了
6700 '1人用
6710 '2人用
6720 '数霊(かずたま) 文字入力  1人用
6730 Surei_Input:
6740 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
6750 if mode = 0 then
6760 cls 3:font 32:init"kb:2"
6770 select case device_No
6780 case 1:
6790 gload Gazo$ + "InputKotodama_20230131.png",0,0,0
6800 gload Gazo$ + "CenterScreen_20230401.png",0,0,380
6810 case 2:
6820 gload Gazo$ + "InputKotodama_20230131.png",0,0,0
6830 end select
6840 play""
6850 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
6860 color rgb(255,0,0)
6870 if lang_flag=1 then
6880 '英語
6890 else
6900 print chr$(13)+chr$(13)+chr$(13)
6910 color rgb(255,255,255)
6920 print "文字を入れてください" + chr$(13)
6930 color rgb(255,255,255)
6940 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
6950 print chr$(13)
6960 color rgb(0,0,0)
6970 Input "入力文字:",buffer_moji$
6980 if buffer_moji$ = "" then
6990 ui_msg "未入力です":goto Surei_Input:
7000 else
7010 goto Surei_Result:
7020 endif
7030 endif
7040 endif
7050 if mode = 1 then
7060 cls 3:Font 32:
7070 gload Gazo$ + "InputKotodama.png"
7080 color rgb(255,0,0)
7090 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
7100 color rgb(255,255,255)
7110 print "文字を入れてください" + chr$(13)
7120 color rgb(255,0,0)
7130 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
7140 print "大文字のみ)" + chr$(13)
7150 color rgb(0,0,0)
7160 Input "文字入力:",buffer_moji2$
7170 goto Surei_Result3:
7180 'endif
7190 endif
7200 '数霊(かずたま)文字入力　2人用
7210 Surei_twoParson:
7220 cls 3:Font 32:init"kb:2"
7230 gload Gazo$ + "InputKotodama_20230131.png"
7240 '1人目入力
7250 if lang_flag = 1 then
7260 else
7270 print ""+chr$(13)+chr$(13)+chr$(13)
7280 color rgb(255,255,255)
7290 print "1人目の文字を入れてください" + chr$(13)
7300 color rgb(255,255,255)
7310 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
7320 color rgb(0,0,0)
7330 print chr$(13)
7340 Input "1人目文字入力:",buf_Parson1$
7350 endif
7360 Surei_twoParson2:
7370 cls 3:Font 32:init"kb:2"
7380 '2人目入力
7390 gload Gazo$ + "InputKotodama_20230131.png"
7400 if lang_falg = 1 then
7410 else
7420 print ""+chr$(13)+chr$(13)+chr$(13)
7430 color rgb(255,255,255)
7440 print "2人目の文字を入れてください" + chr$(13)
7450 color rgb(255,255,255)
7460 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
7470 color rgb(0,0,0)
7480 Input "2人目の文字入力:",buf_Parson2$
7490 goto Surei_Result2:
7500 endif
7510 '数霊　計算 パート
7520 '文字の計算関数
7530 'moji$:1文字を入れる
7540 func Complate(moji$)
7550 for n = 1 to 116
7560 if moji$ = bufline$(2*n) then
7570 buffcount = val(bufline$(2 * n + 1))
7580 endif
7590 next n
7600 endfunc buffcount
7610 '数霊　結果表示
7620 Surei_Result:
7630 cls 3:Font 32
7640 'ゼロカウント:zcount
7650 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
7660 '例 アカい:"い"の文字は無効な文字なので、はじく
7670 zcount=0
7680 'mojicount:入力文字数
7690 mojicount = len(buffer_moji$)
7700 for n=1 to mojicount
7710 for j=1 to 118
7720 if (bufcount$(n - 1) = bufline$(2 * j)) then
7730 bufcount$(n-1) = Mid$(buffer_moji$,n,1)
7740 endif
7750 next j
7760 next n
7770 ncount=0:count=0
7780 for i = 1 to mojicount
7790 bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7800 'ンのカウント
7810 if (bufcount$(i-1) = "ン") then ncount = ncount + 1
7820 next i
7830 if (ncount > 0) then
7840 'Listを表示する
7850 moji_List$(0) = "この単語は目に見える物です"
7860 moji_List$(1) = "この単語は目に見えない物です"
7870 num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
7880 if (num2 = 0) then
7890 else
7900 if (num2 = 1) then
7910 n1 = 9 * ncount
7920 endif
7930 endif
7940 endif
7950 for j=1 to mojicount
7960 bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7970 count = count + Complate(bufcount$(j - 1))
7980 next j
7990 count = count + n1
8000 if (ncount > 0) then count = count
8010 '182以上のとき,181を引く
8020 if buf_cofig_r = 0 then
8030 if (count > 181) then
8040 count = count - 181
8050 else
8060 if (buf_config_r = 1) then
8070 buf_count = Single_Complate(count)
8080 endif
8090 endif
8100 endif
8110 cls 3:Font 48+16
8120 gload Gazo$ + "Result_Screen3_20230319.png"
8130 if buf_config_r = 1 then
8140 print "入力文字:" + buffer_moji$ + chr$(13)
8150 print "数霊(かずたま):";buf_count;chr$(13)
8160 endif
8170 if lang_flag = 1 then
8180 else
8190 color rgb(255,0,0)
8200 print "入力文字:" + buffer_moji$ + chr$(13)
8210 endif
8220 if lang_flag = 1 then
8230 else
8240 color rgb(0,0,255)
8250 print "数霊(かずたま):";count;chr$(13)
8260 endif
8270 if lang_flag = 1 then
8280 else
8290 color rgb(0,0,0)
8300 print "どうしますか?" + chr$(13)
8310 print  " :1.終了してトップに戻る" + chr$(13)
8320 print  " :2.もう一度計算する" + chr$(13)
8330 'endif
8340 endif
8350 key$ = input$(1)
8360 if ((key$ = chr$(13)) or (key$=" ")) then
8370 List$(0)="1.もう一度数霊を見る"
8380 List$(1)="2.トップ画面に行く"
8390 List$(2)="3.この数霊の説明を見る"
8400 List$(3)="4.数霊データーを保存"
8410 num=ui_select("List$","番号を選んでください")
8420 select case num
8430 case 0:
8440 goto Surei_Input:
8450 case 1:
8460 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
8470 for i=0 to 9
8480 bufcount$(i)=""
8490 next i
8500 goto TopScreen:
8510 case 2:
8520 goto Surei_Result4:
8530 case 3:
8540 s=Surei_Result_Save_File()
8550 ui_msg "保存しました"
8560 case -1:
8570 'goto Surei_Result:
8580 case else:
8590 goto Surei_Result:
8600 end select
8610 'ファイルを保存する
8620 else
8630 goto Surei_Result:
8640 endif
8650 '3-1 バージョン情報
8660 Version:
8670 cls 3:Font 32
8680 select case device_No
8690 case 1:
8700 gload Gazo$ + "Screen1_Version.png"
8710 gload Gazo$ + "downscreen.png",0,0,800
8720 case 2:
8730 gload Gazo$ + "Screen1_version.png"
8740 end select
8750 play ""
8760 play Voice_File_TopScreen$ + "Voice_Version.mp3"
8770 color rgb(255,0,0)
8780 print chr$(13)
8790 color rgb(255,255,255)
8800 if lang_flag = 1 then
8810 else
8820 print chr$(13)+chr$(13)+chr$(13)
8830 print "Ver:";Version$ + chr$(13)
8840 print "アプリ名:数霊計算機" + chr$(13)
8850 print "Basic for Android Runtime" + chr$(13)
8860 print "Author:licksjp" + chr$(13)
8870 print "制作開始:2021.7.28" + chr$(13)
8880 print chr$(13)
8890 print "(C)Copy right licksjp " + chr$(13)
8900 print "All rights reserved" + chr$(13)
8910 print chr$(13)
8920 color rgb(0,0,0)
8930 print "パッドの右を押してください" + chr$(13)
8940 endif
8950 bg=0:key$=""
8960 while (bg <> 2 and key$ <> chr$(13))
8970 bg = strig(1)
8980 key$ = inkey$
8990 pause 2
9000 wend
9010 if key$ = chr$(13) then
9020 goto TopScreen:
9030 else
9040 if bg=2 then
9050 goto TopScreen:
9060 else
9070 if lang_flag = 1 then
9080 else
9090 talk "無効なキーです":goto Version:
9100 endif
9110 endif
9120 endif
9130 '3-2 参考文献
9140 Reference_Book:
9150 cls 3:Font 48:play""
9160 select case device_No
9170 case 1:
9180 gload Gazo$ + "Screen1_Reference.png"
9190 gload Gazo$ + "downscreen.png",0,0,800
9200 case 2:
9210 gload Gazo$ + "Screen1_Reference.png"
9220 end select
9230 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
9240 color rgb(255,0,0)
9250 print chr$(13)+chr$(13)
9260 if lang_flag = 1 then
9270 else
9280 color rgb(255,255,255)
9290 print "書名:数霊" + chr$(13)
9300 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
9310 print "出版社:徳間書店" + chr$(13)
9320 print "ISBN:978-4-19-" + chr$(13)
9330 print "         865309-5" + chr$(13)
9340 print "定価:2300円 + 税" + chr$(13)
9350 color rgb(0,0,0)
9360 print "パッドの右を押してください"
9370 endif
9380 bg = 0:key$ = ""
9390 while (bg <> 2 and key$ <> chr$(13))
9400 bg = strig(1)
9410 key$ = inkey$
9420 pause 2
9430 wend
9440 if key$ = chr$(13) then
9450 goto TopScreen:
9460 else
9470 if bg = 2 then
9480 goto TopScreen:
9490 else
9500 talk "無効なキーです":goto Reference_Book:
9510 endif
9520 endif
9530 'ヘルプ画面　トップ画面
9540 Help:
9550 No=1:c=0
9560 play ""
9570 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
9580 cls 3:Font 48:
9590 select case device_No
9600 case 1:
9610 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9620 gload Gazo$ + "downscreen.png",0,0,800
9630 case 2:
9640 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9650 end select
9660 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0
9670 color rgb(255,0,0)
9680 print chr$(13)+chr$(13)+chr$(13)
9690 color rgb(255,255,255)
9700 print "番号を選んでください" + chr$(13)
9710 print " :1.バージョン" + chr$(13)
9720 print " :2.参考文献" + chr$(13)
9730 print " :3.データーの初期化"+chr$(13)
9740 print " :4.トップ画面に行く" + chr$(13)
9750 color rgb(0,0,0)
9760 locate 0,15:print "                                     "
9770 if No = 1 then locate 0,15:print " 1.バージョンを選択"
9780 'y:バーチャルパッドの処理
9790 'key$:カーソルの処理
9800 'bg:バーチャルパッドの右ボタン
9810 Help_key:
9820 y = 0:key$ = "":bg = 0
9830 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
9840 y = stick(1)
9850 key$ = inkey$
9860 bg = strig(1)
9870 pause 2
9880 wend
9890 'バーチャルパッド　ここから'
9900 if (y = 1) then
9910 select case No
9920 'No の初期値：No=1
9930 case 1:
9940 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
9950 if lang_flag = 1 then
9960 else
9970 locate 0,15:print" 2.参考文献を選択":goto Help_key:
9980 endif
9990 'デバッグライン　ここから
10000 '0のとき
10010 'デバッグライン　ここまで
10020 'デバッグライン　ここから
10030 case 3:
10040 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:No=0:pause 200:locate 0,15:print "                                                          "
10050 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":goto Help_key:
10060 'デバッグライン　ここまで
10070 'デバッグライン　ここから
10080 'デバッグライン　ここまで
10090 case 2:
10100 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 0,15:print "                                                          ":color rgb(0,0,0):locate 0,15:print " 3.データーの初期化を選択":No=3:goto Help_key:
10110 case 0:
10120 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10130 'デバッグライン　ここから
10140 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
10150 'デバッグライン　ここまで
10160 end select
10170 endif
10180 'バーチャルパッド　上 ここから
10190 if (y = -1) then
10200 select case No
10210 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
10220 case 1:
10230 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                                           ":locate 0,15:print" 4.トップ画面に行くを選択":goto Help_key
10240 'No:3 3.Help→2.設定 No:2
10250 case 3:
10260 sp_on 1,0:sp_on 0,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                                          ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
10270 case 2:
10280 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                                          ":locate 0,15:print" 1.バージョンを選択":goto Help_key:
10290 case 0:
10300 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                                          ":locate 0,15:print" 3.データーの初期化を選択":goto Help_key:
10310 end select
10320 endif
10330 if (bg = 2) then
10340 select case No
10350 '1.数霊チェックを選択  パッドの右キー
10360 case 1:
10370 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
10380 '2.設定を選択    パッドの右キー
10390 case 2:
10400 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
10410 '3.データーの初期化
10420 case 3:
10430 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto data_initialize:
10440 '4.ヘルプを選択 パッドの右
10450 case 0:
10460 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
10470 'プログラムの終了を選択
10480 'if lang_flag = 1 then
10490 'lang_flag = 1:英語
10500 'Else
10510 'lang_flag = 0:日本語
10520 'endif
10530 end select
10540 '4.終了するを選択  パッドの右
10550 endif
10560 'バーチャルパッド　上　ここまで
10570 'バーチャルパッド　ここまで'
10580 'key$ = input$(1)
10590 'カーソルの下
10600 if key$ = chr$(31) then
10610 select case (No Mod 4)
10620 'バージョンから参考文献
10630 case 0:
10640 c=1:No=c:locate 0,15:Print "             ":locate 0,15:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
10650 '参考文献からトップ画面
10660 case 1:
10670 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "            ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10680 'トップ画面から終了
10690 '終了からバージョン
10700 case 2:
10710 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                     ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10720 case else:
10730 goto Help_key:
10740 end select
10750 endif
10760 'カーソル　上
10770 if (key$ = chr$(30)) then
10780 select case (c Mod 4)
10790 'バージョンから終了
10800 case 0:
10810 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:locate 0,15:print "                   ":locate 0,15:print " 4.終 了を選択":goto Help_key:
10820 '参考文献からバージョン
10830 case 1:
10840 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                   ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10850 'トップ画面から参考文献
10860 case 2:
10870 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":locate 0,15:print " 2.参考文献を選択":goto Help_key:
10880 '終了からトップ画面を選択
10890 case 3:
10900 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print"                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10910 case else:
10920 goto Help_key:
10930 end select
10940 endif
10950 'エンターキー：決定
10960 if (key$ = chr$(13)) then
10970 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10980 if No=0 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10990 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
11000 else
11010 goto Help_key:
11020 endif
11030 '登録文字の確認
11040 '文字を1文字入れて登録されているか調べるメニュー
11050 '設定項目
11060 Setting:
11070 cls 3:Font 48
11080 select case device_No
11090 case 1:
11100 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
11110 gload Gazo$ + "downscreen.png",0,0,800
11120 case 2:
11130 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
11140 end select
11150 play ""
11160 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
11170 No=1
11180 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:
11190 color rgb(0,0,255)
11200 print chr$(13)
11210 if lang_flag = 1 then
11220 'lang_flag = 1:英語
11230 else
11240 'lang_flag = 0:日本語
11250 color rgb(255,255,255)
11260 print chr$(13)
11270 print "番号を選んでください" + chr$(13)
11280 '-------コメント----------------
11290 'print " :1.登録文字の確認" + chr$(13)
11300 'print " :2.数霊文字確認" + chr$(13)
11310 '-------コメント----------------
11320 'print chr$(13)
11330 print " :1.文字の項目" + chr$(13)
11340 print " :2.結果表示設定" + chr$(13)
11350 print " :3.言語設定" + chr$(13)
11360 print " :4.トップ画面に行く" + chr$(13)
11370 endif
11380 color rgb(0,0,0)
11390 locate 0,15
11400 if No=1 then locate 0,15:print  "                                     ":locate 0,15:print " 1.文字の項目を選択"
11410 'y:バーチャルパッドの処理
11420 'key$:カーソルの処理
11430 'bg:バーチャルパッドの右ボタン
11440 SettingScreen:
11450 y = 0:key$ = "":bg=0
11460 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
11470 y = stick(1)
11480 key$ = inkey$
11490 bg=strig(1)
11500 pause 2
11510 wend
11520 'バーチャルパッド　ここから'
11530 'バーチャルパッド　ここから'
11540 if (y = 1) then
11550 select case No
11560 'No の初期値：No=1
11570 case 1:
11580 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":color rgb(0,0,0):locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11590 'デバッグライン　ここから
11600 '0のとき
11610 'デバッグライン　ここまで
11620 'デバッグライン　ここから
11630 case 2:
11640 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                         "
11650 color rgb(0,0,0)::No=3
11660 if lang_flag = 1 then
11670 else
11680 locate 1,15:print "3.言語設定を選択":goto SettingScreen:
11690 endif
11700 'デバッグライン　ここまで
11710 case 3:
11720 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                              ":locate 1,15:print "4.トップ画面に行くを選択":No=0:goto SettingScreen:
11730 'デバッグライン　ここから
11740 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11750 'デバッグライン　ここまで
11760 case 0:
11770 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
11780 'デバッグライン　ここから
11790 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11800 'デバッグライン　ここまで
11810 end select
11820 endif
11830 'バーチャルパッド　上 ここから
11840 if (y = -1) then
11850 select case No
11860 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11870 case 1:
11880 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 1,15:print"4.トップ画面に行くを選択":goto SettingScreen:
11890 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11900 case 0:
11910 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 1,15:print"3.言語設定を選択":goto SettingScreen:
11920 'No:3 3.Help→2.設定 No:2
11930 case 3:
11940 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.結果表示設定を選択":goto SettingScreen:
11950 case 2:
11960 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 1,15:print"1.文字の項目を選択":goto SettingScreen:
11970 end select
11980 endif
11990 if (bg=2) then
12000 select case No
12010 '1.数霊チェックを選択  パッドの右キー
12020 case 1:
12030 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
12040 '2.設定を選択    パッドの右キー
12050 case 2:
12060 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
12070 '3.ヘルプを選択 パッドの右
12080 case 0:
12090 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
12100 'プログラムの終了を選択
12110 case 3:
12120 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Setting_Language:
12130 end select
12140 endif
12150 '4.終了するを選択  パッドの右
12160 'バーチャルパッド　ここまで'
12170 'カーソル下'
12180 if (key$ = chr$(31)) then
12190 select case (No Mod 4)
12200 '登録文字から数霊文字の確認
12210 case 1:
12220 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                     ":locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
12230 '数霊文字の確認からトップ画面に行く
12240 case 2:
12250 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "                                     ":locate 1,15:print"3.言語設定を選択":goto SettingScreen:
12260 'トップ画面に行くから終了
12270 case 3:
12280 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,590),0,0:locate 0,15:print "                                       ":locate 1,15:print "4.トップ画面に行くを選択":goto SettingScreen:
12290 '終了から登録文字
12300 case 0:
12310 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
12320 end select
12330 endif
12340 'カーソル　上
12350 if (key$ = chr$(30)) then
12360 select case (No Mod 4)
12370 case 1:
12380 c=2:No=c:sp_on 0,1:sp_put 0,(5,300),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
12390 case 2:
12400 c=3:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
12410 case 3:
12420 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:goto SettingScreen:
12430 case 0:
12440 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,590),0,0:sp_on 0,0:goto SettingScreen:
12450 end select
12460 endif
12470 'エンターキーを押したとき
12480 if (key$ = chr$(13)) then
12490 if (No=3) then goto Setting_Language:
12500 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
12510 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
12520 if (No=0) then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
12530 endif
12540 '文字検索項目  ここから
12550 Moji_Search:
12560 cls 4:cls 3:Font 32+16:init"kb:2"
12570 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12580 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12590 play ""
12600 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
12610 print "" + chr$(13)
12620 color rgb(255,255,255)
12630 if lang_flag = 1 then
12640 Else
12650 print "文字を一文字入れてください" + chr$(13)
12660 endif
12670 color rgb(0,0,0)
12680 if lang_flag=1 then
12690 Else
12700 Input "登録文字:",moji$
12710 endif
12720 moji_count = len(moji$)
12730 if moji_count > 1 then
12740 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Moji_Search:
12750 else
12760 count=0:
12770 for n = 0 to 116
12780 if bufline$(2*n) = moji$ then
12790 cls 3:font 48:init"kb:4":
12800 select case device_No
12810 case 1:
12820 gload Gazo$ + "downscreen.png",0,0,800
12830 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12840 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12850 case 2:
12860 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12870 end select
12880 play ""
12890 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12900 if lang_flag = 1 then
12910 Else
12920 bg=0:key$=""
12930 print chr$(13)
12940 color rgb(255,255,255)
12950 print moji$;"は、登録されています。" + chr$(13)
12960 color rgb(0,0,0)
12970 print "ジョイパッドの右を押してください"
12980 endif
12990 'bg = 0:key$ = ""
13000 while (bg <> 2 and key$ <> chr$(13))
13010 key$ = inkey$
13020 bg = strig(1)
13030 pause 2
13040 wend
13050 if ((key$ = chr$(13)) or (bg = 2)) then goto TopScreen:
13060 count = count + 1
13070 endif
13080 next n
13090 if count = 0 then
13100 cls 3:font 48:init "kb:4":bg=0:key$=""
13110 select case (device_No)
13120 case 1:
13130 gload Gazo$ + "Moji_check.png",0,0,0
13140 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
13150 gload Gazo$ + "downscreen.png",0,0,800
13160 case 2:
13170 gload Gazo$ + "Moji_check.png",0,0,0
13180 end select
13190 play ""
13200 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
13210 print chr$(13)
13220 if lang_flag = 1 then
13230 Else
13240 color rgb(255,255,255)
13250 print moji$;"は、登録されていません。" + chr$(13)
13260 color rgb(0,0,0)
13270 print "パッドの右を押してください" + chr$(13)
13280 endif
13290 while (bg <> 2 and key$ <> chr$(13))
13300 key$ = inkey$
13310 bg = strig(1)
13320 pause 2
13330 wend
13340 if ((key$ = chr$(13)) or (bg = 2)) then goto TopScreen:
13350 endif
13360 endif
13370 Surei_Result2:
13380 cls 3:Font 48
13390 zcount1=0:zcount2=0:count1=0:count2=0
13400 '1人目
13410 mojicount1=len(buf_Parson1$)
13420 '2人目
13430 mojicount2 = len(buf_Parson2$)
13440 '1人目
13450 for n = 1 to mojicount1
13460 for j = 1 to 116
13470 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
13480 if bufcount1$(n-1) = bufline$(2*j) then
13490 zcount1 = zcount1 + 1
13500 endif
13510 next j
13520 next n
13530 '2人目
13540 for n = 1 to mojicount2
13550 for j = 1 to 116
13560 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
13570 if bufcount2$(n-1) = bufline$(2*j) then
13580 zount2 = zcount2 + 1
13590 endif
13600 next j
13610 next n
13620 '1人目
13630 for i=1 to mojicount1
13640 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
13650 p1 = Complate(bufcount1$(i-1))
13660 count1 = count1 + p1
13670 next i
13680 '2人目
13690 for i = 1 to mojicount2
13700 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
13710 p2 = Complate(bufcount2$(i-1))
13720 count2 = count2 + p2
13730 next i
13740 cls 3:
13750 select case device_No
13760 case 1:
13770 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
13780 gload Gazo$ + "downscreen.png",0,0,800
13790 case 2:
13800 gload Gazo$ + "downscreen.png",0,0,0
13810 end select
13820 color rgb(255,0,0)
13830 print ""+chr$(13)
13840 if lang_flag = 1 then
13850 else
13860 color rgb(255,255,255)
13870 print chr$(13)+chr$(13)
13880 print "1人目:";buf_Parson1$;chr$(13)
13890 print "数霊1:";count1;chr$(13)
13900 print "2人目:";buf_Parson2$;chr$(13)
13910 print "数霊2:";count2;chr$(13)
13920 print "数霊(合計):";count1 + count2;chr$(13)
13930 color rgb(0,0,0)
13940 print "バーチャルパッドの右" + chr$(13)
13950 endif
13960 key$ = "":bg = 0
13970 while (bg <> 2 and key$ <> chr$(13))
13980 bg = strig(1)
13990 key$ = inkey$
14000 pause 2
14010 wend
14020 if (bg = 2 or key$ = chr$(13))  then goto TopScreen:
14030 Surei_Result3:
14040 cls 3:Font 48
14050 zcount2 = 0:count2 = 0
14060 mojicount2 = len(buffer_moji2$)
14070 for n = 1 to mojicount2
14080 for j = 1 to 116
14090 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
14100 if bufcount2$(n - 1) = bufline$(2 * j) then
14110 zcount2 = zcount2 + 1
14120 endif
14130 next j
14140 next n
14150 for i = 1 to mojicount2
14160 n2 = Complate(bufcount2$(i-1))
14170 count2 = count2 + n2
14180 next i
14190 gload Gazo$ + "Screen5.png"
14200 if lang_flag = 1 then
14210 else
14220 color rgb(255,0,0)
14230 print "数霊の結果表示" + chr$(13)
14240 color rgb(255,255,255)
14250 print "１回目回の文字入力:";buffer_moji$;chr$(13)
14260 print "１回目の数霊(かずたま)";count;chr$(13)
14270 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
14280 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
14290 color rgb(0,0,0)
14300 print "エンターキー:トップ画面";chr$(13)
14310 print "c or C キー:数霊の比較";chr$(13)
14320 endif
14330 key$ = "":bg = 0
14340 while (key$ <> chr$(13) and bg <> 2)
14350 bg = strig(1)
14360 key$ = inkey$
14370 pause 2
14380 wend
14390 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
14400 if key$ = "c" or key$ = "C" then
14410 if count = count2 then
14420 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
14430 else
14440 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
14450 endif
14460 endif
14470 Moji_Count_Check:
14480 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
14490 cls 3:Font 48
14500 select case device_No
14510 case 1:
14520 gload Gazo$ + "Moji_check.png"
14530 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
14540 gload Gazo$ + "downscreen.png",0,0,800
14550 case 2:
14560 gload Gazo$ + "Moji_check.png",0,0,0
14570 end select
14580 n = 0
14590 open FILE_csv$ for input as #1
14600 while eof(1) = 0
14610 line input #1, line$
14620 n = n + 1
14630 wend
14640 close #1
14650 play ""
14660 if (n = 118) then
14670 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
14680 if lang_flag = 1 then
14690 else
14700 print "" + chr$(13)
14710 color rgb(255,255,255)
14720 print "文字の登録文字数は";n;"文字" + chr$(13)
14730 color rgb(0,0,0)
14740 print "パッドの右を押してください" + chr$(13)
14750 endif
14760 endif
14770 key$ = "":bg = 0
14780 while ((key$ <> chr$(13)) and (bg <> 2))
14790 key$=inkey$
14800 bg=strig(1)
14810 pause 2
14820 wend
14830 if ((bg = 2) or (key$=chr$(13))) then
14840 goto TopScreen:
14850 else
14860 goto Moji_Count_Check:
14870 endif
14880 'Save 関数
14890 file_kazutama = 0
14900 file_kazutama = Save_File()
14910 func Save_File()
14920 open SAVE_DATA1$  for output as #1
14930 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
14940 close #1
14950 endfunc
14960 Select_moji:
14970 cls 3:font 48:No = 1
14980 select case device_No
14990 case 1:
15000 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
15010 gload Gazo$ + "downscreen.png",0,0,800
15020 case 2:
15030 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
15040 end select
15050 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
15060 color rgb(255,0,0)
15070 if lang_flag = 1 then
15080 else
15090 play ""
15100 play Voice_File_TopScreen$ + "Voice_Select_Moji20230217.mp3"
15110 print chr$(13)+chr$(13)+chr$(13)
15120 color rgb(255,255,255)
15130 print "番号を選んでください" + chr$(13)
15140 print " :1.登録文字検索"+ chr$(13)
15150 print " :2.登録文字数の確認" + chr$(13)
15160 print " :3.数字から数霊の説明"+chr$(13)
15170 print " :4.トップ画面に戻る" + chr$(13)
15180 color rgb(0,0,0)
15190 locate 0,15
15200 if No = 1 then print " 1.登録文字検索を選択"
15210 endif
15220 Entry_check_key:
15230 y = 0:key$ = "":bg=0
15240 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
15250 y = stick(1)
15260 key$ = inkey$
15270 bg=strig(1)
15280 pause 2
15290 wend
15300 'バーチャルパッド　ここから'
15310 'バーチャルパッド　ここから'
15320 if y = 1 then
15330 select case No
15340 'No の初期値：No=1
15350 case 1:
15360 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print "2.登録文字数の確認を選択":goto Entry_check_key:
15370 'デバッグライン　ここから
15380 '0のとき
15390 'デバッグライン　ここまで
15400 'デバッグライン　ここから
15410 case 2:
15420 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 0,15:print "                                                         ":No=3:locate 0,15:print" 3.数字から数霊の説明を選択":goto Entry_check_key:
15430 case 3:
15440 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:locate 0,15:print "                                       "
15450 :No=0
15460 'if lang_flag = 1 then
15470 'Else
15480 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に戻るを選択":goto Entry_check_key:
15490 'endif
15500 'cls:color rgb(255,255,255):print"ok"
15510 'デバッグライン　ここまで
15520 'デバッグライン　ここから
15530 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
15540 'デバッグライン　ここまで
15550 case 0:
15560 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.登録文字検索を選択":goto Entry_check_key:
15570 'デバッグライン　ここから
15580 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
15590 'デバッグライン　ここまで
15600 end select
15610 endif
15620 'バーチャルパッド　上 ここから
15630 if y = -1 then
15640 select case No
15650 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15660 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15670 case 0:
15680 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print "                                      ":locate 0,15:print " 3.数字から数霊の説明を選択":goto Entry_check_key:
15690 case 1:
15700 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print"4.トップ画面に戻るを選択":goto Entry_check_key:
15710 'No:3 3.Help→2.設定 No:2
15720 case 3:
15730 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
15740 case 2:
15750 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 1.登録文字検索を選択":goto Entry_check_key:
15760 end select
15770 endif
15780 if bg=2 then
15790 select case No
15800 '1.数霊チェックを選択  パッドの右キー
15810 case 1:
15820 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15830 '2.設定を選択    パッドの右キー
15840 case 2:
15850 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15860 '3.ヘルプを選択 パッドの右
15870 case 0:
15880 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15890 case 3:
15900 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Input_numbertokazutama:
15910 end select
15920 endif
15930 '4.終了するを選択  パッドの右
15940 'バーチャルパッド　ここまで'
15950 'key$ = input$(1)
15960 'カーソルの下
15970 if key$ = chr$(31) then
15980 select case (No Mod 4)
15990 case 0:
16000 c=1:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
16010 case 1:
16020 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,500),0,0:sp_on 3,0:goto Entry_check_key:
16030 case 2:
16040 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:goto Entry_check_key:
16050 case 3:
16060 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
16070 end select
16080 endif
16090 'カーソル　上
16100 if key$ = chr$(30) then
16110 select case (No Mod 4)
16120 case 0:
16130 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
16140 case 1:
16150 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
16160 case 2:
16170 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
16180 case 3:
16190 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
16200 end select
16210 endif
16220 'エンターキーを押す
16230 if key$ = chr$(13) then
16240 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
16250 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
16260 if No = 0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16270 endif
16280 '
16290 Kakunin_Surei_count:
16300 cls 3:font 48:No=0
16310 select case device_No
16320 case 1:
16330 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
16340 'gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
16350 gload Gazo$ + "downscreen.png",0,0,800
16360 case 2:
16370 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
16380 end select
16390 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
16400 color rgb(255,0,0)
16410 print chr$(13)+chr$(13)+chr$(13)
16420 color rgb(255,255,255)
16430 print "番号を選んでください" + chr$(13)
16440 print " :1.数霊リスト 1人用" + chr$(13)
16450 print " :2.結果表示設定" + chr$(13)
16460 print " :3.トップ画面に行く" + chr$(13)
16470 print "" + chr$(13)
16480 color rgb(0,0,0)
16490 locate 0,15:print"                                                         "
16500 if No = 0 then locate 1,15:print "1.数霊リスト　1人用を選択"
16510 Entry_List:
16520 y = 0:key$ = "":bg=0
16530 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
16540 y = stick(1)
16550 key$ = inkey$
16560 bg = strig(1)
16570 pause 2
16580 wend
16590 'バーチャルパッド　ここから'
16600 'バーチャルパッド　ここから'
16610 'バーチャルパッド　下
16620 if y = 1 then
16630 select case No
16640 'No の初期値：No=1
16650 case 0:
16660 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=1:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.結果表示設定を選択":goto Entry_List:
16670 'デバッグライン　ここから
16680 '0のとき
16690 'デバッグライン　ここまで
16700 'デバッグライン　ここから
16710 'color rgb(0,0,0):locate 0,15:print " 4.終了を選択":goto Entry_List:
16720 'cls:color rgb(255,255,255):print"ok"
16730 'デバッグライン　ここまで
16740 case 2:
16750 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,300),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 1.数霊リスト 1人用を選択":No=0:goto Entry_List:
16760 case 1:
16770 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                      ":No=2:locate 1,15:print "3．トップ画面に行くを選択":goto Entry_List:
16780 'デバッグライン　ここから
16790 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
16800 'デバッグライン　ここまで
16810 'デバッグライン　ここから
16820 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
16830 'デバッグライン　ここまで
16840 end select
16850 endif
16860 'バーチャルパッド　上 ここから
16870 if y = -1 then
16880 select case No
16890 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
16900 case 2:
16910 sp_on 2,0:sp_on 0,0:sp_on 1,1:sp_on 3,0:sp_put 1,(5,400),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 2.結果表示設定を選択":goto Entry_List:
16920 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
16930 case 0:
16940 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 1,15:print"3.トップ画面に行くを選択":goto Entry_List:
16950 'No:3 3.Help→2.設定 No:2
16960 case 1:
16970 sp_on 1,0:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 0,(5,300),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print "1.数霊リスト 1人用を選択":goto Entry_List:
16980 end select
16990 endif
17000 if bg = 2 then
17010 select case No
17020 '1.数霊リスト 一人用を選択を選択  パッドの右キー
17030 case 0:
17040 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
17050 '2.設定を選択  パッドの右キー
17060 case 1:
17070 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
17080 case 2:
17090 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
17100 end select
17110 endif
17120 if key$=chr$(13) then
17130 select case No
17140 case 0:
17150 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
17160 case 1:
17170 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
17180 case 2:
17190 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
17200 end select
17210 endif
17220 '4.終了するを選択  パッドの右
17230 'バーチャルパッド　ここまで'
17240 Surei_List1:
17250 cls 3:font 48
17260 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
17270 file$ = dir$(SAVE_DATA1$,0)
17280 'ファイルが無いときの画面
17290 if file$ = ""  then
17300 '背景画面表示
17310 select case device_No
17320 case 1:
17330 gload Gazo$ + "KazutamaList1.png",0
17340 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
17350 gload Gazo$+"downscreen.png",0,0,800
17360 case 2:
17370 gload Gazo$ + "KazutamaList1.png"
17380 end select
17390 print chr$(13)
17400 color rgb(255,255,255):print "登録ファイルはございません" + chr$(13)
17410 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
17420 'else
17430 'endif
17440 bg = 0:key$ = ""
17450 while (key$ <> chr$(13) and bg<>2)
17460 key$ = inkey$
17470 bg = strig(1)
17480 pause 2
17490 wend
17500 'エンターキーもしくはバーチャルパッドの右でトップに行く
17510 if (bg = 2  or key$ = chr$(13)) then goto TopScreen:
17520 else
17530 cls 3:buffer_list_count = Loadcount()
17540 color rgb(255,255,255)
17550 if lang_flag = 1 then
17560 Else
17570 talk "登録件数は" + str$(buffer_list_count) + "件です"
17580 select case device_No
17590 Case 1:
17600 gload Gazo$ + "KazutamaList1_Entry.png",0,0,0
17610 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
17620 gload Gazo$ + "downscreen.png",0,0,800
17630 case 2:
17640 gload Gazo$+"KazutamaList1_Entry.png",0,0,0
17650 end select
17660 color rgb(0,0,255)
17670 print chr$(13)
17680 color rgb(255,255,255)
17690 print "登録件数:";buffer_list_count;"件";chr$(13)
17700 color rgb(0,0,0)
17710 print "パッドの右を押してください" + chr$(13)
17720 endif
17730 bg = 0:key$ = "":bg2 = 0
17740 while (key$ <> chr$(13) and bg <> 2)
17750 key$ = inkey$
17760 bg = strig(1)
17770 bg2=strig(0)
17780 pause 2
17790 wend
17800 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
17810 if (key$ = chr$(13) or bg = 2) then pause 2:goto KotodamaList_page:
17820 endif
17830 if (bg = 2) then pause 2:goto TopScreen:
17840 func Loadcount()
17850 n = 0
17860 'while eof(1)=-1
17870 open SAVE_DATA1$  for input as #1
17880 while eof(1) <> -1
17890 line input #1,line$
17900 n = n + 1
17910 wend
17920 close #1
17930 count = n
17940 endfunc count
17950 count_line = Loadcount()
17960 func Kotodama$(buf$)
17970 color rgb(255,255,255)
17980 b = len("数霊:")
17990 a$ = Mid$(buf$,b+1,len(buf$))
18000 for i=0 to 118
18010 color rgb(255,255,255)
18020 if bufline3$(2 * i) ="数霊:" + a$  then
18030 moji_$ = bufline3$(2*i + 1)
18040 endif
18050 next i
18060 kotodama$ = moji_$
18070 endfunc kotodama$
18080 KotodamaList_page:
18090 cls 3:font 48:m = 0:
18100 select case device_No
18110 case 1:
18120 gload Gazo$ + "Screen5_Surei_List.png"
18130 gload Gazo$ + "downscreen.png",0,0,800
18140 case 2:
18150 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
18160 end select
18170 if SAVE_DATA1$ = "" then
18180 cls 3:color rgb(255,255,255):print"ファイルがありません"
18190 else
18200 a = Loadcount()
18210 open SAVE_DATA1$  for input as #1
18220 for i=0 to a-1
18230 for n=0 to 1
18240 input #1,line$
18250 bufKaztama$(i,n) = line$
18260 next n
18270 next i
18280 close #1
18290 l = 0:n=0
18300 select case device_No
18310 case 1:
18320 gload Gazo$ + "Screen5_Surei_List.png"
18330 gload Gazo$ + "downscreen.png",0,0,800
18340 case 2:
18350 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
18360 end select
18370 while (buffer_list_count >= l)
18380 cls
18390 color rgb(255,0,0)
18400 print chr$(13)
18410 color rgb(255,255,255)
18420 n=n+1
18430 print chr$(13)
18440 print "番号:";l+1;chr$(13)
18450 print bufKaztama$(l,0) + chr$(13)
18460 print bufKaztama$(l,1) + chr$(13)
18470 Kmoji$ = moji$
18480 print chr$(13) + chr$(13) + chr$(13)
18490 color rgb(0,0,0)
18500 if buffer_list_count=1 then
18510 print " :パッドの左:トップ画面"+chr$(13)
18520 ui_msg "登録件数は1件です。"
18530 else
18540 if buffer_list_count > 1 then
18550 print " :パッドの左:トップ画面" + chr$(13)
18560 print " :パッドの右:次へ行く" + chr$(13)
18570 endif
18580 endif
18590 key$ = "":bg = 0:bg2 = 0
18600 while (key$ <> chr$(13) and bg <> 2 and bg2 <> 1)
18610 key$ = inkey$
18620 bg = strig(1)
18630 bg2 = strig(0)
18640 pause 2
18650 wend
18660 'if n > 1 then
18670 if (key$ = " " OR bg = 2) then
18680 if n > 1 then
18690 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
18700 endif
18710 else
18720 if ((bg2 = 1) or (key$=chr$(13))) then
18730 goto TopScreen:
18740 endif
18750 else
18760 goto KotodamaList_page:
18770 endif
18780 wend
18790 endif
18800 'ndif
18810 '結果表示２ Menu1
18820 Surei_Result4:
18830 cls 3:font 32+16:init"kb:4"
18840 for i=0 to 181 + 4 - 1
18850 if i = count  then
18860 buffer$ = bufline2$(count + 4,1)
18870 endif
18880 next i
18890 if len(buffer$) > 21 and len(buffer$) <= 45 then
18900 buffer2$ = Mid$(buffer$,1,22)
18910 buffer3$ = Mid$(buffer$,23,(len(buffer$) - 22))
18920 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13)
18930 else
18940 if len(buffer$) <= 21 then
18950 buffer2$ = Mid$(buffer$,1,21)
18960 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
18970 else
18980 if len(buffer$) > 45 and len(buffer$) <= 62 then
18990 buffer2$ = Mid$(buffer$,1,22)
19000 buffer3$ = Mid$(buffer$,23,22)
19010 buffer4$ = Mid$(buffer$,44,(len(buffer$)-44))
19020 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13)
19030 else
19040 if len(buffer$) > 64 and len(buffer$) <= 81 then
19050 buffer2$ = Mid$(buffer$,1,22)
19060 buffer3$ = Mid$(buffer$,23,20)
19070 buffer4$ = Mid$(buffer$,44,20)
19080 buffer5$ = Mid$(buffer$,65,(len(buffer$)-65))
19090 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13)
19100 if len(buffer$) > 81 and len(buffer$) <= 110 then
19110 buffer2$ = Mid$(buffer$,1,22)
19120 buffer3$ = Mid$(buffer$,23,20)
19130 buffer4$ = Mid$(buffer$,43,20)
19140 buffer5$ = Mid$(buffer$,63,20)
19150 buffer6$ = Mid$(buffer$,83,(len(buffer$) - 83))
19160 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13)
19170 endif
19180 endif
19190 endif
19200 endif
19210 endif
19220 Surei_Result4_2:
19230 select case device_No
19240 case 1:
19250 gload Gazo$ + "Screen1_Result2.png"
19260 gload Gazo$ + "downscreen.png",0,0,800
19270 case 2:
19280 gload Gazo$ +"Screen1_Result2.png"
19290 end select
19300 Result_Menu_List$(0)="1.トップ画面に行く"
19310 Result_Menu_List$(1)="2.数霊のデーターを保存"
19320 Result_Menu_List$(2)="3.もう一度、数霊を調べる"
19330 cls
19340 print chr$(13)
19350 if lang_flag = 1 then
19360 else
19370 color rgb(127,255,212)
19380 print chr$(13);chr$(13)
19390 print "入力文字:";buffer_moji$;chr$(13)
19400 print "数霊:";count;chr$(13)
19410 color rgb(255,255,255)
19420 print "数霊の説明:"+chr$(13)
19430 print buffer$
19440 color rgb(0,0,0)
19450 locate 0,15
19460 print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
19470 endif
19480 key$ = "":bg = 0:bg2 = 0
19490 while (bg<>2 and bg2<>1)
19500 key$ = inkey$
19510 bg = strig(1)
19520 bg2 = strig(0)
19530 pause 2
19540 wend
19550 if ((bg = 2) or (bg2 = 1)) then
19560 num = ui_select("Result_Menu_List$","番号を選んでください")
19570 endif
19580 if num = 0 then goto TopScreen:
19590 if num = 1 then goto File_save:
19600 if num = 2 then goto Surei_Input:
19610 if num = -1 then goto Surei_Result4
19620 File_save:
19630 'ファイルがない時
19640 if dir$(SAVE_DATA1$) = " " then
19650 open SAVE_DATA1$ for output as #1
19660 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19670 close #1
19680 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19690 'ファイルが有る時
19700 else
19710 open SAVE_DATA1$ for append as #1
19720 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19730 close #1
19740 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19750 endif
19760 func All_clear()
19770 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
19780 endfunc
19790 'ここから
19800 Config_moji1:
19810 cls 3:Font 48
19820 select case device_No
19830 case 1:
19840 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19850 gload Gazo$ + "downscreen.png",0,0,800
19860 case 2:
19870 gload  Gazo$ + "Screen1_Setting_Top.png",0,0,0
19880 end select
19890 play ""
19900 No=1
19910 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19920 color rgb(0,0,255)
19930 print chr$(13)
19940 if lang_flag = 1 then
19950 'lang_flag = 1:英語
19960 else
19970 'lang_flag = 0:日本語
19980 color rgb(255,255,255)
19990 print "番号を選んでください" + chr$(13)
20000 print " :1.文字の項目" + chr$(13)
20010 print " :2.結果表示設定" + chr$(13)
20020 print " :3.トップ画面に行く" + chr$(13)
20030 print " :4.終 了" + chr$(13)
20040 endif
20050 color rgb(0,0,0)
20060 locate 1,12
20070 if No = 1 then print "1.文字の項目"
20080 'y:バーチャルパッドの処理
20090 'key$:カーソルの処理
20100 'bg:バーチャルパッドの右ボタン
20110 Config_moji1_Screen:
20120 y = 0:key$ = "":bg=0
20130 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
20140 y = stick(1)
20150 key$ = inkey$
20160 bg=strig(1)
20170 pause 2
20180 wend
20190 'バーチャルパッド　ここから'
20200 'バーチャルパッド　ここから'
20210 if y = 1 then
20220 select case No
20230 'No の初期値：No=1
20240 case 1:
20250 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20260 'デバッグライン　ここから
20270 '0のとき
20280 'デバッグライン　ここまで
20290 'デバッグライン　ここから
20300 case 2:
20310 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
20320 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
20330 'if lang_flag = 1 then
20340 'else
20350 locate 1,12:print "3.トップ画面に行くを選択"
20360 'endif
20370 'デバッグライン　ここまで
20380 case 3:
20390 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
20400 'デバッグライン　ここから
20410 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
20420 'デバッグライン　ここまで
20430 case 0:
20440 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20450 'デバッグライン　ここから
20460 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
20470 'デバッグライン　ここまで
20480 end select
20490 endif
20500 'バーチャルパッド　上 ここから
20510 if y = -1 then
20520 select case No
20530 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
20540 case 1:
20550 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
20560 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
20570 case 0:
20580 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
20590 'No:3 3.Help→2.設定 No:2
20600 case 3:
20610 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20620 case 2:
20630 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
20640 end select
20650 endif
20660 if bg=2 then
20670 select case No
20680 '1.数霊チェックを選択  パッドの右キー
20690 case 1:
20700 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
20710 '2.設定を選択    パッドの右キー
20720 case 2:
20730 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
20740 '3.ヘルプを選択 パッドの右
20750 case 3:
20760 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
20770 'プログラムの終了を選択
20780 case 0:
20790 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
20800 'if lang_flag = 1 then
20810 'Else
20820 ui_msg "プログラムを終了します":end
20830 'endif
20840 end select
20850 endif
20860 '4.終了するを選択  パッドの右
20870 'バーチャルパッド　ここまで'
20880 'SettingScreen:
20890 'key$ = input$(1)
20900 'カーソル下'
20910 if key$ = chr$(31) then
20920 select case (No Mod 4)
20930 '登録文字から数霊文字の確認
20940 case 1:
20950 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
20960 '数霊文字の確認からトップ画面に行く
20970 case 2:
20980 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
20990 'トップ画面に行くから終了
21000 case 3:
21010 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
21020 '終了から登録文字
21030 case 0:
21040 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
21050 end select
21060 endif
21070 'カーソル　上
21080 if key$ = chr$(30) then
21090 select case (No Mod 4)
21100 case 1:
21110 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
21120 case 2:
21130 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
21140 case 3:
21150 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
21160 case 0:
21170 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
21180 end select
21190 endif
21200 'エンターキーを押したとき
21210 if key$ = chr$(13) then
21220 if No=3 then goto TopScreen:
21230 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
21240 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
21250 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
21260 'lse
21270 'o'o SettingScreen:
21280 endif
21290 'ここまで
21300 Config_moji2:
21310 cls 3:Font 48
21320 select case device_No
21330 case 1:
21340 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
21350 gload Gazo$ + "downscreen.png",0,0,800
21360 case 2:
21370 gload Gazo$ + "Screen1_Setting_Top.png "
21380 end select
21390 play ""
21400 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
21410 No=1
21420 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
21430 color rgb(0,0,255)
21440 'print "●設定項目" + chr$(13)
21450 print chr$(13)
21460 if lang_flag = 1 then
21470 'lang_flag = 1:英語
21480 else
21490 'lang_flag = 0:日本語
21500 color rgb(255,255,255)
21510 print "番号を選んでください" + chr$(13)
21520 'print " :1.文字の項目" + chr$(13)
21530 'print " :2.結果表示設定" + chr$(13)
21540 print " :1.文字の項目" + chr$(13)
21550 print " :2.結果表示設定" + chr$(13)
21560 print " :3.トップ画面に行く" + chr$(13)
21570 print " :4.終 了" + chr$(13)
21580 endif
21590 color rgb(0,0,0)
21600 locate 1,12
21610 if No = 1 then print "1.文字の項目"
21620 'y:バーチャルパッドの処理
21630 'key$:カーソルの処理
21640 'bg:バーチャルパッドの右ボタン
21650 config_moji2:
21660 y = 0:key$ = "":bg=0
21670 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
21680 y = stick(1)
21690 key$ = inkey$
21700 bg = strig(1)
21710 pause 2
21720 wend
21730 'バーチャルパッド　ここから'
21740 'バーチャルパッド　ここから'
21750 if y = 1 then
21760 select case No
21770 'No の初期値：No=1
21780 case 1:
21790 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
21800 'デバッグライン　ここから
21810 '0のとき
21820 'デバッグライン　ここまで
21830 'デバッグライン　ここから
21840 case 2:
21850 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
21860 color rgb(0,0,0)::No=2:goto SettingScreen:
21870 if lang_flag = 1 then
21880 else
21890 locate 0,12:print " 3.トップ画面に行くを選択"
21900 endif
21910 'cls:color rgb(255,255,255):print"ok"
21920 'デバッグライン　ここまで
21930 case 3:
21940 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
21950 'デバッグライン　ここから
21960 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
21970 'デバッグライン　ここまで
21980 case 0:
21990 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
22000 'デバッグライン　ここから
22010 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
22020 'デバッグライン　ここまで
22030 end select
22040 endif
22050 'バーチャルパッド　上 ここから
22060 if y = -1 then
22070 select case No
22080 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
22090 case 1:
22100 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
22110 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
22120 case 0:
22130 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
22140 'No:3 3.Help→2.設定 No:2
22150 case 3:
22160 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22170 case 2:
22180 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
22190 end select
22200 endif
22210 '決定ボタン
22220 if bg=2 then
22230 select case No
22240 '1.数霊チェックを選択  パッドの右キー
22250 case 1:
22260 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
22270 '2.設定を選択    パッドの右キー
22280 case 2:
22290 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
22300 '3.ヘルプを選択 パッドの右
22310 case 3:
22320 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
22330 'プログラムの終了を選択
22340 case 0:
22350 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
22360 'if lang_flag = 1 then
22370 'Else
22380 ui_msg "プログラムを終了します":end
22390 'endif
22400 end select
22410 endif
22420 '4.終了するを選択  パッドの右
22430 'バーチャルパッド　ここまで'
22440 'カーソル下'
22450 if key$ = chr$(31) then
22460 select case (No Mod 4)
22470 '登録文字から数霊文字の確認
22480 case 1:
22490 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22500 '数霊文字の確認からトップ画面に行く
22510 case 2:
22520 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
22530 'トップ画面に行くから終了
22540 case 3:
22550 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
22560 '終了から登録文字
22570 case 0:
22580 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
22590 end select
22600 endif
22610 'カーソル　上
22620 if key$ = chr$(30) then
22630 select case (No Mod 4)
22640 case 1:
22650 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
22660 case 2:
22670 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
22680 case 3:
22690 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
22700 case 0:
22710 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
22720 end select
22730 endif
22740 'エンターキーを押したとき
22750 if key$ = chr$(13) then
22760 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
22770 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
22780 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
22790 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
22800 'lse
22810 'o'o SettingScreen:
22820 endif
22830 '結果表示設定
22840 Result_Setting:
22850 color rgb(255,255,255)
22860 'dim list$(4)
22870 'ファイル読み込み
22880 '1.ファイルが有るか無いかのチェック
22890 if Dir$(System$) = "" then
22900 '1-1.ファイルがないとき
22910 '上のSystemフォルダを作成
22920 mkdir "./data/system/"
22930 list$(0) = "●:出た数字から181を引く"
22940 list$(1) = " :出た数字から180を引き単数変換"
22950 open System$ for output as #1
22960 print #1,"config_r=0"
22970 close #1
22980 ui_msg "ファイルを作成しました"
22990 'ファイル作成
23000 else
23010 '1-2.ファイルが有るとき
23020 'config_r:0 出た数字から181を引く
23030 'config_r:1 出た数字から180を引いて単数変換
23040 'open "./System/config.sys" for input as #1
23050 'ファイルが有るときファイルを読み込み
23060 open System$ for input as #1
23070 line input #1,buf_line$
23080 'buf$にデーターをコピーする
23090 buf$ = buf_line$
23100 close #1
23110 if len(buf$) = 10 then
23120 if left$(buf$,9) = "config_r=" then
23130 buf$ = right$(buf_line$,1)
23140 if buf$ = "1" then
23150 '1.System$ ファイルを削除(config.sys)
23160 '2.1行目をconfig_r=1と書き、保存する
23170 buf_config_r = 1
23180 'list$(0) = "●:1.出た数字から180を引いて単数変換"
23190 'list$(1) = " :2.出た数字から181を引く"
23200 else
23210 if buf$ = "0" then
23220 buf_config_r = 0
23230 ' list$(0) = "●:1.出た数字から181を引く"
23240 'list$(1) = " :2.出た数字から180を引いて単数変換"
23250 endif
23260 endif
23270 endif
23280 endif
23290 endif
23300 '"●:1.出た数字から180を引く"をlist$(0)に代入
23310 if buf_config_r =  0 then
23320 list$(0) = "●:1.出た数字から181を引く"
23330 list$(1) = " :2.出た数字から180を引いて単数変換"
23340 else
23350 list$(0) = "●:1.出た数字から180を引いて単数変換"
23360 list$(1) = " :2.出た数字から181を引く"
23370 endif
23380 list$(2) = " :トップ画面に戻る"
23390 list_num = ui_select("list$","番号を選んでください")
23400 play ""
23410 Select case (list_num)
23420 case 0:
23430 if buf$ = "1" then
23440 buf_config_r = 0:
23450 'データーを変更したのでファイルを削除
23460 kill System$
23470 'ファイルを新しく作成
23480 open System$ for output as #1
23490 print #1,"config_r=0"
23500 close #1
23510 ui_msg "設定を変更しました。"
23520 else
23530 'if buf$ = "0" then
23540 'buf_config_r = 1
23550 'kill System$
23560 'open Syetem$ for output as #1
23570 'print #1,"config_r=1"
23580 'close #1
23590 'ui_msg "設定を変更しました"
23600 'endif
23610 endif
23620 goto config_moji2:
23630 case 1:
23640 if buf$ = "0" then
23650 buf_config_r = 1:
23660 'データーを変更したので、ファイルを削除
23670 kill System$
23680 'ファイルを新しく作成
23690 open System$ for output as #1
23700 print #1,"config_r=1"
23710 close #1
23720 ui_msg "設定を変更しました"
23730 else
23740 kill System$
23750 if buf$ = "1" then
23760 open System$ for output as #1
23770 print #1,"config_r=0"
23780 close #1
23790 ui_msg "設定を変更しました"
23800 endif
23810 endif
23820 goto config_moji2:
23830 case 2:
23840 'トップ画面に飛ぶ
23850 goto TopScreen:
23860 case 3:
23870 'プログラムを終了する
23880 cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
23890 end select
23900 '単数変換
23910 Func Single_Complate(num)
23920 '1.出てきた数字から180を引く
23930 a = num - 180
23940 'a:10〜99
23950 Re1:
23960 if (a > 9 and a < 100) then
23970 b1 = fix(a / 10)
23980 b2 = 10 * a - b1
23990 d1 = b1 + b2
24000 if c > 9 then
24010 goto Re1:
24020 else
24030 c = d1:goto Re2:
24040 endif
24050 endif
24060 Re2:
24070 buffer = c
24080 endfunc buffer
24090 Func Surei_Result_Save_File()
24100 'ファイルがないとき
24110 if dir$(SAVE_DATA1$) = "" then
24120 open SAVE_DATA1$ for output as #1
24130 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
24140 close #1
24150 ui_msg "保存しました":talk "保存しました":goto Surei_Result:
24160 else
24170 open SAVE_DATA1$ for append as #1
24180 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
24190 close #1
24200 ui_msg "保存しました":talk "保存しました":goto Surei_Result
24210 endif
24220 endfunc
24230 '言語設定
24240 Setting_Language:
24250 cls 3:screen 1,1,1,1:No=2
24260 select case device_No
24270 case 1:
24280 gload Gazo$ + "Screen1.png",0,0,0
24290 gload Gazo$ + "downscreen.png",0,0,800
24300 case 2:
24310 gload Gazo$ + "Screen1.png",0,0,0
24320 end select
24330 init "Kb:4"
24340 sp_on 1,1:sp_on 0,0
24350 sp_put 0,(0,300),0,0
24360 sp_put 1,(0,400),1,0
24370 color rgb(0,0,255)
24380 'print "番号を選んでください"+chr$(13)
24390 'if lang_flag=0 then
24400 'print "言語設定:日本語"+chr$(13)
24410 'else
24420 'print "言語設定:英 語"+chr$(13)
24430 Change_Language:
24440 if lang_flag = 1 then
24450 cls
24460 print "It has changed Language"+chr$(13)
24470 color rgb(255,255,255)
24480 print "Select the Number"+chr$(13)
24490 print " :1.English → Japanse"+chr$(13)
24500 print " :2.It goes to TopScreen"+chr$(13)
24510 print "Language:In English" +chr$(13)
24520 else
24530 cls:color rgb(255,255,255)
24540 print "設定変更(言語の変更)" + chr$(13)
24550 color rgb(255,255,255)
24560 print chr$(13)
24570 print "番号を選んでください"+chr$(13)
24580 print " :1.日本語 → 英語に変更" + chr$(13)
24590 print " :2.トップ画面に戻る" + chr$(13)
24600 print chr$(13)
24610 print "設定言語:日本語" + chr$(13)
24620 endif
24630 color rgb(0,0,0)
24640 locate 0,15:print "                                       ":locate 0,15:print " 2.トップ画面に戻る　を選択" + chr$(13)
24650 Setting_Language_key:
24660 y=0:key$="":bg=0
24670 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y<> -1 and bg<> 2)
24680 y=stick(1)
24690 key$=inkey$
24700 bg=strig(1)
24710 pause 2
24720 wend
24730 '選択肢変更
24740 if ((y=1) or (y=-1)) then
24750 select case No
24760 case 2:
24770 '実装部分　ここから
24780 pause 200:No=1:sp_on 0,1:sp_on 1,0:locate 0,15:print "                                                         ":locate 0,15:print " 1.日本語 → 英語に変更を選択": goto Setting_Language_key:
24790 '実装部分　ここまで
24800 case 1:
24810 pause 200: No=2:sp_on 0,0:sp_on 1,1:locate 0,15:print "                                                       ":locate 0,15:print " 2.トップ画面に戻る を選択":goto Setting_Language_key:
24820 end select
24830 endif
24840 'Enter Key  決定ボタン
24850 if ((key$=chr$(13)) or (bg=2)) then
24860 select case No
24870 case 2:
24880 sp_on 0,0:sp_on 1,0:goto TopScreen:
24890 case 1:                                                     'lang_flag=1:sp_on 0,0:sp_on 1,0:goto Change_Language:
24900 '
24910 '未実装　ここから
24920 sp_on 0,1:sp_on 1,0:ui_msg "この機能は未実装です":goto Setting_Language_key:
24930 '
24940 '未実装　ここまで
24950 end select
24960 endif
24970 '配列削除
24980 buffer_clear:
24990 erase bufline$
25000 erase bufcount$
25010 erase bufcount1$
25020 erase bufcount2$
25030 erase bufline2$
25040 erase bufline3$
25050 erase bufKaztama$
25060 erase List$
25070 erase Result_Menu_List$
25080 erase list$
25090 erase moji_List$
25100 'ui_msg "メモリーをクリアしました"
25110 return
25120 '配列削除　ここまで
25130 File_Device_Set:
25140 'Device 選択　書き込み
25150 open Device_type$  for output as #1
25160 print #1,device_No
25170 close #1
25180 ui_msg "ファイルを書き込みました"
25190 return
25200 Input_numbertokazutama:
25210 cls 3:init "kb:2"
25220 select case (device_No)
25230 case  1:
25240 gload Gazo$ + "Input_numbertokazutama.png",0,0,0
25250 gload Gazo$ + "Input_numbertokazutama2.png",0,0,380
25260 case 2:
25270 gload Gazo$ + "Input_numbertokazutama.png",0,0,0
25280 end select
25290 color rgb(255,255,255):locate 1,4:print "調べたい数霊の番号を入れてください"+chr$(13);"(Max:181)"
25300 color rgb(0,0,0):locate 1,7:Input "番号:",num
25310 if (num > 181) then ui_msg"181までの数字で入れ直してください":goto Input_numbertokazutama:
25320 pause 200
25330 for i=0 to 181+3-1
25340 if i = num then
25350 buffer$ = bufline2$(i+4,1)
25360 talk buffer$
25370 goto Numbertokazutama:
25380 endif
25390 next i
25400 'goto Numbertokazutama:
25410 '
25420 '
25430 Numbertokazutama:
25440 cls 3:init "kb:4":bg=0:key$=""
25450 select case (device_No)
25460 case 1:
25470 gload Gazo$ + "Result_numbertokazutama.png",0,0,0
25480 gload Gazo$ + "downscreen.png",0,0,800
25490 case 2:
25500 gload Gazo$ + "Result_numbertokazutama.png",0,0,0
25510 end select
25520 font 32+16:color rgb(255,255,255)
25530 locate 1,3:print "◎数霊番号:";num;chr$(13)
25540 locate 1,4:print "◎数霊の説明"+chr$(13)
25550 if ((len(buffer$) > 21) and (len(buffer$) <= 45)) then
25560 buffer2$ = Mid$(buffer$,1,20)
25570 buffer3$ = Mid$(buffer$,21,len(buffer$)-20)
25580 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13)
25590 else
25600 if (len(buffer$) < 22) then
25610 buffer2$ = Mid$(buffer$,1,21)
25620 buffer$ = buffer2$ + chr$(13)
25630 else
25640 if ((Len(buffer$) > 45) and (len(buffer$) < 66)) then
25650 buffer2$ = Mid$(buffer$,1,20)
25660 buffer3$ = Mid$(buffer$,20,21)
25670 buffer4$ = Mid$(buffer$,41,len(buffer$)-41)
25680 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13)
25690 endif
25700 endif
25710 endif
25720 locate 1,5:print buffer$
25730 color rgb(0,0,0)
25740 locate 1,14:print "ジョイパッドの右を押してください"+chr$(13)
25750 while ((bg <> 2) and (key$ <> chr$(13)))
25760 bg=strig(1)
25770 key$=inkey$
25780 pause 2
25790 wend
25800 if ((bg = 2) or (key$ = chr$(13))) then
25810 goto TopScreen:
25820 endif
25830 data_initialize:
25840 cls 3
25850 select case device_No
25860 case 1:
25870 gload Gazo$ + "Data_initializeScreen.png",0,0,0
25880 gload Gazo$ + "downscreen.png",0,0,800
25890 case 2:
25900 gload Gazo$ + "Data_initializeScreen.png",0,0,0
25910 end select
25920 color rgb(255,255,255):font 48:init "kb:4":No=1:sp_on 1,1:sp_put 1,(5,300),0,0
25930 locate 0,4:print "番号を選んでください"+chr$(13)
25940 print " :1.メンバーリストの初期化" + chr$(13)
25950 print " :2.デバイスの初期化" + chr$(13)
25960 print " :3.トップ画面に行く"+chr$(13)
25970 locate 0,15:color rgb(0,0,0):print " 1.メンバーリストの初期化を選択"
25980 data_initialize2:
25990 y = 0:key$ = "":bg = 0
26000 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
26010 y = stick(1)
26020 key$ = inkey$
26030 bg = strig(1)
26040 pause 2
26050 wend
26060 'y = -1:ジョイパッドの上
26070 'y = 1:ジョイパッド下
26080 'key$ = chr$(13):Enter key
26090 'key$ = chr$(30):カーソル上
26100 'key$ = chr$(31):カーソル下
26110 if ((y = -1) or (key$ = chr$(30))) then
26120 select case No
26130 case 1:
26140 sp_on 1,0:sp_on 2,0:sp_on 0,1:sp_on 3,0:No=0:sp_put 0,(5,500),0,0:locate 0,15:print "                                       ":locate 0,15:print " 3.トップ画面に行くを選択":pause 200:goto data_initialize2:
26150 case 2:
26160 sp_on 1,1:sp_on 2,0:sp_on 0,0:sp_on 3,0:No=1:sp_put 1,(5,300),0,0:locate 0,15:print "                                      ":pause 200:locate 0,15:print " 1.メンバーリストの初期化を選択":goto data_initialize2:
26170 case 0:
26180 sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_on 0,0:sp_put 2,(5,400),0,0:locate 0,15:print "                                      ":pause 200:locate 0,15:print " 2.デバイスの初期化を選択":No=2:goto data_initialize2:
26190 end select
26200 endif
26210 'bg=2:Enter key
26220 if ((bg = 2) or (key$ = chr$(13))) then
26230 select case No
26240 case 0:
26250 sp_on 0,0:sp_on 1,0:sp_on 2,0:pause 200:goto TopScreen:
26260 case 1:
26270 'メンバーリストの初期化トップへ行く
26280 sp_on 0,0:sp_on 1,0:sp_on 2,0:pause 200:goto member_initializeTop:
26290 case 2:
26300 ui_msg "未実装です":goto data_initialize2:
26310 end select
26320 endif
26330 'カーソルの下　または、ジョイパッド下
26340 if ((y = 1) or (key$ = chr$(31))) then
26350 select case No
26360 case 1:
26370 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                          ":locate 0,15:print " 2.デバイスの初期化を選択":goto data_initialize2:
26380 case 2:
26390 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:No=0:locate 0,15:print "                                                          ":locate 0,15:print " 3.トップ画面に行くを選択":goto data_initialize2:
26400 case 0:
26410 sp_on 0,0:sp_on 1,1:sp_on 2,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                                          ":locate 0,15:print " 1.メンバーリストの初期化を選択":goto data_initialize2:
26420 end select
26430 endif
26440 'メンバーリストの初期化トップ
26450 member_initializeTop:
26460 cls 3
26470 select case (device_No)
26480 case 1:
26490 gload Gazo$ + "member_initializeTop.png",0,0,0
26500 gload Gazo$ + "downscreen.png",0,0,800
26510 case 2:
26520 gload Gazo$ + "member_initializeTop.png",0,0,0
26530 end select
26540 No=0:init "kb:4":color rgb(255,255,255):font 48
26550 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,500),0,0
26560 locate 0,4:print  "番号を選んでください"+chr$(13)
26570 print " :1.メンバーリストを初期化する" + chr$(13)
26580 print " :2.バックアップを取る" + chr$(13)
26590 print " :3.トップ画面に戻る"+chr$(13)
26600 color rgb(0,0,0):locate 0,15:print "                                       ":locate 0,15:print " 3.トップ画面に戻るを選択"
26610 member_list2:
26620 y=0:key$="":bg=0
26630 while ((key$ <> chr$(13)) and (y <> 1) and (y <> -1) and (bg <> 2))
26640 y = stick(1)
26650 key$ = inkey$
26660 bg = strig(1)
26670 pause 2
26680 wend
26690 'bg=2,chr$(13):決定ボタン
26700 if ((bg = 2) or (key$ = chr$(13)))  then
26710 select case No
26720 case 1:
26730 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Member_List_DeleteScreen:
26740 case 2:
26750 ui_msg"未実装です":goto member_list2:
26760 case 0:
26770 '3:トップ画面に戻る
26780 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
26790 end select
26800 endif
26810 'y=1:chr$(31):ジョイパッド　下　又は　カーソルの下
26820 if ((y = 1) or (key$ = chr$(31))) then
26830 select case No
26840 case 0:
26850 sp_on 1,1:sp_on 2,0:sp_on 0,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 1.メンバーリストを初期化するを選択":goto member_list2:
26860 case 1:
26870 sp_on 0,0:sp_on 2,1:sp_on 1,0:No=2:sp_put 2,(5,400),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 2.バックアップを取るを選択":goto member_list2:
26880 case 2:
26890 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:locate 0,15:print "                                       ":locate 0,15:print " 3.トップ画面に行くを選択":goto member_list2:
26900 end select
26910 endif
26920 'Joypad  or カーソル　上
26930 if ((y=-1) or (key$=chr$(30))) then
26940 select case No
26950 case 0:
26960 sp_on 2,1:sp_on 1,0:sp_on 0,0:No=2:sp_put 2,(5,400),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 2.バックアップを取るを選択":goto member_list2:
26970 case 1:
26980 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto member_list2:
26990 case 2:
27000 sp_on 0,0:sp_on 1,1:sp_on 2,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 1.メンバーリストを初期化をする選択":goto member_list2:
27010 end select
27020 endif
27030 Member_List_DeleteScreen:
27040 cls:key$ = "":bg = 0:y=0:init "kb:4":font 48:count=0
27050 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
27060 if dir$(SAVE_DATA1$) = "" then
27070 'ファイルがないとき
27080 color rgb(255,255,255)
27090 locate 0,4
27100 print "データーファイルは、存在しません。"
27110 locate 0,15:color rgb(0,0,0):print "ジョイパッドの右を押してください":
27120 'endif
27130 while ((key$ <> chr$(13)) and (bg <> 2) and (y <> 1) and (y <> -1))
27140 key$ = inkey$
27150 bg = strig(1)
27160 y = stick(1)
27170 pause 2
27180 wend
27190 if ((key$ = chr$(13)) or (bg = 2)) then goto TopScreen:
27200 'goto TopScreen:
27210 'endif
27220 else
27230 'ファイルが有るとき
27240 'default
27250 'No=1:ファイルを削除する
27260 'No=2:トップ画面に戻る
27270 No=2
27280 sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0
27290 color rgb(255,255,255)
27300 locate 0,4:print"番号を選んでください"+chr$(13)
27310 print " :1.ファイルを削除する"+chr$(13)
27320 print " :2.トップ画面に戻る"+chr$(13)
27330 color rgb(0,0,0):
27340 locate 0,15:print"                                      ":locate 0,15:print " 2.トップ画面に戻るを選択"
27350 endif
27360 Select_key1:
27370 '初期化
27380 y=0:key$="":bg=0
27390 while ((key$ <> chr$(13)) and (bg <> 2) and (y <> 1) and (y <> -1))
27400 key$ = inkey$
27410 bg = strig(1)
27420 y = stick(1)
27430 pause 2
27440 wend
27450 '1.選択キー
27460 '十字キー 上 y=-1
27470 '十字キー　下 y=1
27480 if ((y = 1) or (y = -1)) then
27490 select case No
27500 case 2:
27510 No=1:sp_on 2,0:sp_on 1,1:sp_put 1,(5,300),0,0:locate 0,15:print "                                                                                ":locate 0,15:print " 1．ファイルを削除":pause 200:goto Select_key1:
27520 case 1:
27530 No=2:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:locate 0,15:print "                                                          ":locate 0,15:print " 2.トップ画面に戻るを選択":pause 200:goto Select_key1:
27540 end select
27550 endif
27560 '2.決定ボタン
27570 'Joypad　右 or Enter key
27580 if ((bg=2) or (key$=chr$(13))) then
27590 Select case No
27600 case 2:
27610 sp_on 1,0:sp_on 2,0:pause 200:goto TopScreen:
27620 case 1:
27630 if (count=0) then
27640 kill SAVE_DATA1$:ui_msg"メンバーリストを削除しました":pause 200:locate 0,15:print "                                       ":locate 0,15:print " ジョイパッドの右を押してください":count=count+1:goto Select_key1:
27650 else
27660 sp_on 1,0:sp_on 2,0:goto TopScreen
27670 endif
27680 end select
27690 endif
27700 '***********************************************************************
27710 '数霊 データー保存部分　追加　ここから　Date:2025.01.27
27720 '****************************************************
27730 'ラベル：数霊の保存データーラベル
27740 '****************************************************
27750 Save_Kazutama_data:
27760 '****************************************************
27770 '作成日 Date:2025.01.26
27780 '数霊データー保存処理
27790 '保存ファイル:my_Kazutama.date
27800 '全体的な処理
27810 '0.ファイル変数
27820 '1.フォルダの作成確認処理
27830 '2.フォルダの作成処理
27840 '3.ファイルの有無の確認
27850 '4.ファイルの書き込み
27860 '*********************************************************************************
27870 '変数パート　ここから
27880 '*********************************************************************************
27890 '0.ファイル変数
27900 '*********************************************************************************
27910 '0-1.フォルダ:my_KazutamaFolder$
27920 my_KazutamaFolder$ = "data/my_Kazutama/"
27930 '*********************************************************************************
27940 '0-2.ファイル：my_Kazutama_data_File$
27950 my_Kazutama_data_File$ = my_KazutamaFolder$ + "my_Kazutama.dat"
27960 '*********************************************************************************
27970 'フォルダを作る変数
27980 Folder$ = dir$("data/my_Kazutama/",1)
27990 '*********************************************************************************
28000 '書き込むデーター
28010 'buffer_moji$:数霊の入力文字
28020 'buf_count:入力文字の数霊
28030 '変数パート　ここまで
28040 '*********************************************************************************
28050 '*********************************************************************************
28060 '1.フォルダの有無の確認
28070 ' "data/my_Kazutama/"　の有無の確認。
28080 '*********************************************************************************
28090 '◎.コードパート
28100 '*********************************************************************************
28110 '処理1 フォルダがない時フォルダ作成
28120 if (Folder$ = "")  then
28130 mkdir myKazutamaFolder$
28140 endif
28150 '*********************************************************************************
28160 'ファイルがない時ファイルを作成する処理
28170 '処理2 ファイル作成
28180 '*********************************************************************************
28190 if (my_Kazutama_data_File$ = "") then
28200 'ファイルがない時ファイルを作成して初回(1回目)の書き込み
28210 mkdir (myKazutamadata_File$)
28220 '初回目の書き込み処理
28230 open my_Kazutama_data_File$ for output as #1
28240 '************************************************************************
28250 '数霊の文字入力 ,入力文字の数霊　 ここから
28260 'buffer_moji$ ,val(buf_count)
28270 '***********************************************************************
28280 print #1,"数霊の入力文字" + "," + "入力文字の数霊"
28290 print #1, buffer_moji$ + "," + str$(buf_count)
28300 '***********************************************************************
28310 '数霊の文字入力 ,入力文字の数霊 　ここまで
28320 'buffer_moji$ ,val(buf_count)
28330 '***********************************************************************
28340 close #1
28350 '***********************************************************************
28360 '保存完了と表示する
28370 ui_msg "保存しました"
28380 '***********************************************************************
28390 else
28400 '***********************************************************************
28410 '2回目以降の書き込み
28420 '***********************************************************************
28430 'それ以外は、ファイルをオープンして、数霊と文字を書き込む
28440 '取得するデーター
28450 'buffer_moji$: 数霊の入力文字
28460 'buf_count: 入力文字の数霊
28470 '***********************************************************************
28480 'ファイルを開く
28490 open my_Kazutama_data_File$ for append as #1
28500 '***********************************************************************
28510 'データーの末尾にデーターを追加:
28520 '数霊の文字入力 ,入力文字の数霊　 ここから
28530 'buffer_moji$ ,val(buf_count)
28540 '***********************************************************************
28550 print #1, buffer_moji$ + "," + str$(buf_count)
28560 '***********************************************************************
28570 '数霊の文字入力 ,入力文字の数霊　 ここまで
28580 'buffer_moji$ ,val(buf_count)
28590 '***********************************************************************
28600 'ファイルを閉じる
28610 close #1
28620 '***********************************************************************
28630 '保存完了と表示する
28640 ui_msg "保存しました"
28650 '***********************************************************************
28660 endif
28670 '数霊 データー保存部分　追加　ここまで　Date:2025.01.27
28680 '***********************************************************************
