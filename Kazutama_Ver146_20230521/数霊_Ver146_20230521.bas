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
670 '現在のバージョン
680 Version$ = "1.4.6_2023.05.21(正式版)"
690 'csvファイル 1.数霊 ベースファイル
700 FILE_csv$ = "./data/Kazutama.csv"
710 'csvファイル 2.数霊 ベースファイル 2
720 FILE_csv2$ = "./data/Surei_chart_20211207.csv"
730 'Save ファイル
740 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
750 'gazo ファイル
760 Gazo$ = "./data/Gazo/"
770 'System フォルダ:設定ファイルを保存するところ
780 System$ = "./data/System/config.sys"
790 'Device type:デバイスタイプのファイルチェック
800 Device_type$ = "./data/device_type.sys"
810 '設定ファイル名:config.sys
820 'Sound File(Voice)
830 '1.ボイス TopScreen
840 Voice_File_TopScreen$ = "./data/Sound_data/"
850 'Message
860 buf_finish_Message$ = "メモリーを解放してプログラムを終了します"
870 '変数領域
880 'vcount:バーチャルパッド下の変数
890 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+6,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
900 count2 = 0:N=0:N2=0:m2 = 0:device_No=0:device_type=0
910 dim list$(4),moji_List$(2)
920 'ファイルの有無チェック
930 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
940 '1.ファイルが無いとき
950 cls :print "依存ファイルが見つかりません":
960 print "エンターキーを押してください" + chr$(13)
970 key$ = input$(1)
980 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
990 else
1000 '2.ファイルが有るとき
1010 cls:print "csv:file ok." + chr$(13)
1020 n=0
1030 'FILE_csv$:数霊データー入力
1040 open FILE_csv$ for input as #1
1050 while eof(1) = 0
1060 input #1,line$
1070 bufline$(n) = line$
1080 'Print n;chr$(13)
1090 '登録件数カウント:n
1100 n = n + 1
1110 wend
1120 close #1
1130 N=n
1140 '2つ目のファイル読み込み
1150 'n = 0
1160 open FILE_csv2$ for input as #2
1170 for n=3 to 181+2+2
1180 for i=0 to 1
1190 input #2,line$
1200 bufline2$(n,i) = line$
1210 next i
1220 next n
1230 close #2
1240 N2 = n
1250 endif
1260 '2022.11.23----------------------
1270 '端末言語のチェック
1280 '日本語端末かチェックをして日本語以外なら英語で表示する
1290 'lang flag:0:日本語 1:英語(日本語以外)
1300 '--------------------------------
1310 lang_flag = 0
1320 if ex_info$(1) <> "JP" then
1330 lang_flag = 1
1340 endif
1350 cls 3:font 48:screen 1,1,1,1:int "kb:4":init "crt:0"
1360 play ""
1370 'gload Gazo$ + "TopScreen_20230310.png",0,0,0
1380 '選択ポインター 1 - 4
1390 'スプライトの定義
1400 gload Gazo$ + "Selection.png",1,5,300
1410 gload Gazo$ + "Selection.png",1,5,400
1420 gload Gazo$ + "Selection.png",1,5,500
1430 gload Gazo$ + "Selection.png",1,5,595
1440 sp_def 0,(5,300),32,32
1450 sp_def 1,(5,400),32,32
1460 sp_def 2,(5,500),32,32
1470 sp_def 3,(5,595),32,32
1480 'File check
1490 '初回起動はここから
1500 if (dir$(Device_type$) = "") then
1510 goto Device_Select:
1520 else
1530 '
1540 '2回目以降はファイルチェックをしてトップ画面
1550 '
1560  open Device_type$ for input as #1
1570  line input #1,device_type$
1580  device_No = val(device_type$)
1590  close #1
1600  if (device_No=1 or device_No=2) then
1610  goto TopScreen:
1620  endif
1630 endif
1640 'First_Select_Screen:
1650 'タブレット　or　スマホの選択を起動時にする
1660 Device_Select:
1670 font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
1680 gload Gazo$ + "device_select_20230313.png",0,0,0
1690 init "kb:4"
1700 play ""
1710 play Voice_File_TopScreen$+"Select_device_select.mp3"
1720 'y=0:key$="":bg=0
1730 print chr$(13)+chr$(13)+chr$(13)
1740 color  rgb(255,255,255)
1750 print "番号を選んでください"+chr$(13)
1760 'print chr$(13)
1770 print " :1.スマートフォン"+chr$(13)
1780 print " :2.タブレット端末"+chr$(13)
1790 locate 0,11:No=1
1800 color rgb(0,0,0)
1810 Print " 1.スマートフォンを選択"+chr$(13)
1820 sp_on 0,1:sp_put 0,(5,300),0,0
1830 sp_on 1,0:sp_on 2,0:sp_on 3,0
1840 device_selection:
1850 y=0:key$="":bg=0:
1860 While (key$ <> chr$(30) and key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
1870 y = stick(1)
1880 key$ = inkey$
1890 bg = strig(1)
1900 pause 2
1910 wend
1920 if ((y=1) or (y=-1) or (key$=chr$(30)) or (key$=chr$(31)) ) then
1930 select case No
1940 case 1:
1950       No=2:sp_on 1,1:sp_on 0,0:locate 0,11:pause 300:sp_put 1,(5,400),0,0:print "                                ":locate 0,11:print " 2.タブレット端末を選択":goto device_selection:
1960 case 2:
1970       No=1:sp_on 1,0:sp_on 0,1:pause 300:sp_put 0,(5,300),0,0:locate 0,11:print "                                   ":locate 0,11:print " 1.スマートフォンを選択":goto device_selection:
1980 end select
1990 endif
2000 '決定ボタン
2010 if ((bg=2) or (key$=chr$(13)))  then
2020 select case No
2030 case 1:
2040       sp_on 0,0:sp_on 1,0:device_No=1:gosub File_Device_Set:goto TopScreen:
2050 case 2:
2060       sp_on 0,0:sp_on 1,0:device_No=2:gosub File_Device_Set:goto TopScreen:
2070 end select
2080 endif
2090 'Top画面
2100 TopScreen:
2110 'バーチャルパッドを表示
2120 cls 3:font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
2130 'play ""
2140 play ""
2150 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
2160 'gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
2170 select case device_No
2180 case 1:
2190 'Top画面の背景画像
2200 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2210 gload Gazo$ + "downscreen.png",0,0,800
2220 case 2:
2230 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2240 end select
2250 'key$=input$(1)
2260 'バーチャルパッドの背景を白にする for smartphone screen
2270 'gload Gazo$ + "downscreen.png",0,0,800
2280 '選択肢 1
2290 gload Gazo$ + "Selection.png",1,5,300
2300 '選択肢 2
2310 gload Gazo$ + "Selection.png",1,5,400
2320 '選択肢 3
2330 gload Gazo$ + "Selection.png",1,5,500
2340 '選択肢 4
2350 'TopScreen:
2360 'select case device_No
2370 'case 1:
2380 gload Gazo$ + "Selection.png",1,5,590
2390 'case 2:
2400 'gload Gazo$ +
2410 'end select
2420 color rgb(0,0,255)
2430 print chr$(13)
2440 if lang_flag = 1 then
2450 color rgb(255,255,255)
2460 print "Select Number" + chr$(13)
2470 print " :1.Kazutama check" + chr$(13)
2480 print " :2.Setting" + chr$(13)
2490 print " :3.Help" + chr$(13)
2500 print " :4.End Program" + chr$(13)
2510 color rgb(255,255,255)
2520 else
2530 color rgb(255,255,255)
2540 print chr$(13)
2550 sp_on 0,1:sp_put 0,(5,300),0,0
2560 print "番号を選んでください" + chr$(13)
2570 print " :1.数霊(かずたま)チェック" + chr$(13)
2580 print " :2.設定" + chr$(13)
2590 print " :3.ヘルプ" + chr$(13)
2600 print " :4.(プログラムを)終　了する" + chr$(13)
2610 color rgb(0,0,0)
2620 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
2630 'バーチャルパッドを表示
2640 No=1:
2650 'lang_flag:1 外国語,0:日本語
2660 if lang_flag = 1 then
2670 'lang_flag=1 英語
2680 locate 0,15:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
2690 else
2700 'lang_flag=0 日本語
2710 locate 0,15:color rgb(0,0,0):print " 1.数霊(かずたま)チェックを選択";chr$(13)
2720 endif
2730 endif
2740 'TopScreen sprite
2750 'スプライト
2760 '選択肢 1 On
2770 'sp_def 0,(5,300),32,32
2780 'sp_on 0,1
2790 'sp_put 0,(5,300),0,0
2800 '選択肢 2 Off
2810 sp_def 1,(5,400),32,32
2820 sp_on 1,0
2830 sp_put 1,(5,400),0,0
2840 '選択肢 3 Off
2850 sp_def 2,(5,500),32,32
2860 sp_on 2,0
2870 sp_put 2,(5,500),0,0
2880 '選択肢 4 Off
2890 sp_def 3,(5,600),32,32
2900 sp_on 3,0
2910 sp_put 3,(5,600),0,0
2920 color rgb(0,0,0)
2930 Main_Select:
2940 'y:バーチャルパッドの処理
2950 'key$:カーソルの処理
2960 y = 0:key$ = "":bg = 0
2970 while ((key$ <> chr$(31)) and (key$ <> chr$(13)) and (y <> 1) and (y <> -1) and (bg <> 2))
2980 y = stick(1)
2990 key$ = inkey$
3000 bg = strig(1)
3010 pause 2
3020 wend
3030 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
3040 '1.バーチャルパッドの処理
3050 'バーチャルパッド下を押した時
3060 if y = 1 then
3070 select case No
3080 'No の初期値：No=1
3090 case 1:
3100 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
3110 if lang_flag = 1 then
3120 'lang_flag=1 英語
3130 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3140 else
3150 'lang_flag=0 日本語
3160 locate 0,15:print " 2.設定を選択":goto Main_Select:
3170 endif
3180 'デバッグライン　ここから
3190 '0のとき
3200 'デバッグライン　ここまで
3210 'デバッグライン　ここから
3220 'バーチャルパッド　下
3230 case 2:
3240 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:
3250 print "                                         ":
3260 if lang_flag = 1 then
3270 color rgb(0,0,0):locate 0,15:
3280 print "3.It has selected Help":No=3:goto Main_Select:
3290 else
3300 color rgb(0,0,0):locate 0,15:print "                                                         ":locate 0,15:
3310 print " 3.ヘルプを選択":No=3:goto Main_Select:
3320 endif
3330 'デバッグライン　ここまで
3340 case 3:
3350 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                               "
3360 if lang_flag = 1 then
3370 locate 0,15:print "4.It has selected finish program":No=0:goto Main_Select:
3380 else
3390 locate 0,15:print "                                                         " :locate 0,15:print " 4.(プログラムを)終了するを選択":No=0:goto Main_Select:
3400 endif
3410 'デバッグライン　ここから
3420 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
3430 'デバッグライン　ここまで
3440 case 0:
3450 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1
3460 if lang_flag = 1 then
3470 'lang_flag=1:英語
3480 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3490 else
3500 'lang_flag=0:日本語
3510 locate 0,15:print "                                      ":locate 0,15:print " 1.数霊(かずたま)チェックを選択":goto Main_Select:
3520 endif
3530 'デバッグライン　ここから
3540 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
3550 'デバッグライン　ここまで
3560 end select
3570 endif
3580 'バーチャルパッド　上 ここから
3590 if (y = -1) then
3600 select case No
3610 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
3620 case 1:
3630 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                                          "
3640 'if lang_flag = 1 then
3650 'lang_flag=1 英語
3660 'locate 0,15:print "4.It has finished program":goto Main_Select:
3670 'else
3680 'lang_flag=0 日本語
3690 locate 0,15:print "                                                          ":
3700 locate 0,15:print " 4.(プログラムを)終了するを選択":goto Main_Select:
3710 'endif
3720 'endif
3730 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
3740 case 0:
3750 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":
3760 if lang_flag = 1 then
3770 '1:英語
3780 locate 0,15:print "3.It has selected Help":goto Main_Select:
3790 else
3800 '0:日本語
3810 locate 0,15:print "                                                                                        "
3820 locate 0,15:print " 3.ヘルプを選択":goto Main_Select:
3830 endif
3840 'No:3 3.Help→2.設定 No:2
3850 case 3:
3860 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      "
3870 if lang_flag = 1 then
3880 '1:英語
3890 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3900 else
3910 '0:日本語
3920 locate 0,15:print" 2.設定を選択":goto Main_Select:
3930 endif
3940 case 2:
3950 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":
3960 if lang_flag = 1 then
3970 'lang_flag 1 英語
3980 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3990 else
4000 'lang_flag 0 日本語
4010 locate 0,15:print" 1.数霊(かずたま)チェックを選択":goto Main_Select:
4020 endif
4030 end select
4040 endif
4050 if (bg = 2) then
4060 select case No
4070 '1.数霊チェックを選択  パッドの右キー(決定)
4080 case 1:
4090 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4100 '2.設定を選択  パッドの右キー(決定)
4110 case 2:
4120 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
4130 '3.ヘルプを選択 パッドの右(決定)
4140 case 3:
4150 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
4160 'プログラムの終了を選択(決定)
4170 case 0:
4180 cls 3:cls 4:gosub buffer_clear:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":ui_msg buf_finish_Message$:pause 4.080*1000:color rgb(255,255,255):end
4190 'if lang_flag = 1 then
4200 'lang_flag = 1 英語
4210 'else
4220 'lang_flag = 0 日本語
4230 'endif
4240 end select
4250 '4.終了するを選択  パッドの右
4260 endif
4270 'バーチャルパッド　上　ここまで
4280 '2.カーソルの処理
4290 'カーソル　下 chr$(31)
4300 if (key$ = chr$(31)) then
4310 select case (No)
4320 '4
4330 '0 選択肢4 => 選択肢1
4340 case 0:
4350 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "              ":color rgb(0,0,0):
4360 if lang_flag = 1 then
4370 'lang flag:1 英語
4380 else
4390 'lang flag:0 日本語
4400 color rgb(0,0,0):locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4410 endif
4420 '1 選択肢1 => 選択肢2
4430 case 1:
4440 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":
4450 if lang_flag = 1 then
4460 'lang_flag:1 英語
4470 else
4480 'lang_flag:0 日本語
4490 color rgb(0,0,0):locate 0,15:print "2.設定を選択":beep:goto Main_Select:
4500 endif
4510 '2 選択肢2 => 選択肢3
4520 case 2:
4530 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,15:print "               ":
4540 if lang_flag = 1 then
4550 'lang flag:1 英語
4560 else
4570 'lang flang:0 日本語
4580 color rgb(0,0,0):locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4590 endif
4600 '3 選択肢３ => 選択肢4
4610 case 3:
4620 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,595),0,0:locate 0,15:print "               ":color rgb(0,0,0)
4630 if lang_flag = 1 then
4640 'lang_flag = 1 英語
4650 else
4660 'lang_flag = 0 日本語
4670 color rgb(0,0,0):locate 0,15:print "4.終 了を選択":goto Main_Select:
4680 endif
4690 case else:
4700 goto Main_Select:
4710 end select
4720 endif
4730 'カーソル　上
4740 if (key$=chr$(30)) then
4750 select case (No)
4760 '選択肢1 => 選択肢4
4770 case 1:
4780 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:PRINT "                      ":
4790 if lang_flag = 1 then
4800 'lang_flag=1:英語
4810 'print "1.It has selected Kazutama check":goto Main_Select:
4820 else
4830 'lang_flag = 0:日本語
4840 else
4850 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4860 endif
4870 '選択肢2 => 選択肢1
4880 case 2:
4890 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                 ":locate 1,15:print "2.設 定を選択":goto Main_Select:
4900 '選択肢3　=> 選択肢2
4910 case 3:
4920 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,500),0,0
4930 if lang_flag = 1 then
4940 'lang_flag = 1:英語
4950 locate 0,15:print "It has selected Help":goto Main_Select:
4960 else
4970 'lang_flag = 0:日本語
4980 locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4990 endif
5000 '選択肢4 => 選択肢3
5010 case 0:
5020 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                ":locate 1,15:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
5030 if lang_flag = 1 then
5040 'lang flag=1 英語
5050 else
5060 'lang flag=0 日本語
5070 locate 1,15:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
5080 endif
5090 end select
5100 endif
5110 'Input "番号:",No
5120 'エンターキー入力:決定
5130 if (key$ = chr$(13)) then
5140 select case No
5150 case 1:
5160 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
5170 case 3:
5180 Color rgb(255,255,255):goto Help:
5190 case 0:
5200 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg buf_finish_Message$:color rgb(255,255,255):pause 4.080 * 1000:end
5210 case 2:
5220 color rgb(255,255,255):sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
5230 end select
5240 endif
5250 '1-1.数霊チェック
5260 Surei_Check:
5270 cls 3:Font 48:
5280 select case device_No
5290  case 1:
5300 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5310 gload Gazo$ + "downscreen.png",0,0,800
5320 case 2:
5330 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5340 end select
5350 play ""
5360 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
5370 color rgb(255,0,0)
5380 'print "●数霊(かずたま)チェックトップ" + chr$(13)
5390 sp_on 0,1:sp_put 0,(5,300),0,0:screen 1,1,1
5400 if lang_flag = 1 then
5410 'lang_flag=1 英語
5420 else
5430 'lang_flag=0 日本語
5440 print chr$(13)+chr$(13)+chr$(13)
5450 color rgb(255,255,255)
5460 print "番号を選んでください" + chr$(13)
5470 print " :1.数霊(かずたま)1人用" + chr$(13)
5480 print " :2.数霊(かずたま)リスト 1人用　" + chr$(13)
5490 print " :3.数霊(かずたま)2人用" + chr$(13)
5500 print " :4.トップ画面に行く" + chr$(13)
5510 color rgb(0,0,0):No = 1
5520 locate 0,15:print "                                       "
5530 locate 0,15
5540 print " 1.数霊(かずたま)1人用を選択"
5550 endif
5560 Kazutama_main:
5570 'y:バーチャルパッドの処理
5580 'key$:カーソルの処理
5590 'bg:バーチャルパッドの右のボタン
5600 y = 0:key$ = "":bg=0
5610 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
5620 y = stick(1)
5630 key$ = inkey$
5640 bg=strig(1)
5650 y=stick(-1)
5660 pause 2
5670 wend
5680 'key$ = input$(1)
5690 if (y = 1) then
5700 select case No
5710 'No の初期値：No=1
5720 case 2:
5730 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                       ":
5740 locate 0,15:print "                                     "
5750 locate 0,15
5760 print" 3.数霊(かずたま)2人用を選択":goto Kazutama_main:
5770 'デバッグライン　ここから
5780 '0のとき
5790 'デバッグライン　ここまで
5800 'デバッグライン　ここから
5810 case 3:
5820 sp_on 2,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_on 0,1:sp_put 0,(5,585),0,0:pause 200:locate 0,15:print "                                               "
5830 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":No=0:goto Kazutama_main:
5840 'デバッグライン　ここまで
5850 'デバッグライン　ここから
5860 'デバッグライン　ここまで
5870 case 0:
5880 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5890 case 1:
5900 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                                             ":locate 0,15:print " 2.数霊（かずたま）リスト 1人用を選択":goto Kazutama_main:
5910 'デバッグライン　ここから
5920 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
5930 'デバッグライン　ここまで
5940 end select
5950 endif
5960 'バーチャルパッド　上 ここから
5970 if (y = -1) then
5980 select case No
5990 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
6000 case 1:
6010 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 0,15:print" 4.トップ画面に行くを選択":goto Kazutama_main:
6020 'No:3 3.Help→2.設定 No:2
6030 case 0:
6040 sp_on 1,0:sp_on 0,0:sp_on 3,1:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                     ":locate 0,15:print" 3.数霊（かずたま）2人用を選択":goto Kazutama_main:
6050 case 2:
6060 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
6070 case 3:
6080 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 0,15:print " 2.数霊(かずたま)リスト 1人用を選択":goto Kazutama_main:
6090 end select
6100 endif
6110 if (bg=2) then
6120 select case No
6130 '1.数霊チェックを選択  パッドの右キー
6140 case 1:
6150 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
6160 '2.数霊チェック2人用   パッドの右キー
6170 case 3:
6180 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
6190 '3.トップ画面に行く パッドの右
6200 case 0:
6210 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
6220 '2.数霊リスト1人用 パッドの右キー
6230 case 2:
6240 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_List1:
6250 'プログラムの終了を選択
6260 end select
6270 '4.終了するを選択  パッドの右
6280 endif
6290 'バーチャルパッド　上　ここまで
6300 if (key$ = chr$(31)) then
6310 select case No
6320 case 0:
6330 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,15:print "                                                          ":
6340 if lang_flag = 1 then
6350 Else
6360 locate 0,15:print "                                      "
6370 No=2:locate 0,15:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
6380 endif
6390 case 1:
6400 No=0:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,585),0,0:locate 0,12:print "                                                          ":
6410 if lang_flag = 1 then
6420 Else
6430 locate 0,15:print"                                      "
6440 locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
6450 endif
6460 case 2:
6470 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                      ":
6480 if lang_flag = 1 then
6490 Else
6500 No=1:locate 0,15:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
6510 endif
6520 end select
6530 endif
6540 if (key$=chr$(13)) then
6550 select case No
6560 case 1:
6570 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
6580 case 2:
6590 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
6600 case 3:
6610 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
6620 '終了はトップメニューのみにする
6630 end select
6640 endif
6650 '前の画面に戻る
6660 'プログラムの終了
6670 '1人用
6680 '2人用
6690 '数霊(かずたま) 文字入力  1人用
6700 Surei_Input:
6710 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
6720 if mode = 0 then
6730 cls 3:font 32:init"kb:2"
6740 select case device_No
6750 case 1:
6760 gload Gazo$ + "InputKotodama_20230131.png",0,0,0
6770 gload Gazo$ + "CenterScreen_20230401.png",0,0,380
6780 case 2:
6790 gload Gazo$ + "InputKotodama_20230131.png",0,0,0
6800 end select
6810 play""
6820 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
6830 color rgb(255,0,0)
6840 if lang_flag=1 then
6850 '英語
6860 else
6870 print chr$(13)+chr$(13)+chr$(13)
6880 color rgb(255,255,255)
6890 print "文字を入れてください" + chr$(13)
6900 color rgb(255,255,255)
6910 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
6920 print chr$(13)
6930 color rgb(0,0,0)
6940 Input "入力文字:",buffer_moji$
6950 if buffer_moji$ = "" then
6960 ui_msg "未入力です":goto Surei_Input:
6970 else
6980 goto Surei_Result:
6990 endif
7000 endif
7010 endif
7020 if mode = 1 then
7030 cls 3:Font 32:
7040 gload Gazo$ + "InputKotodama.png"
7050 color rgb(255,0,0)
7060 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
7070 color rgb(255,255,255)
7080 print "文字を入れてください" + chr$(13)
7090 color rgb(255,0,0)
7100 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
7110 print "大文字のみ)" + chr$(13)
7120 color rgb(0,0,0)
7130 Input "文字入力:",buffer_moji2$
7140 goto Surei_Result3:
7150 'endif
7160 endif
7170 '数霊(かずたま)文字入力　2人用
7180 Surei_twoParson:
7190 cls 3:Font 32:init"kb:2"
7200 gload Gazo$ + "InputKotodama_20230131.png"
7210 '1人目入力
7220 if lang_flag = 1 then
7230 else
7240 print ""+chr$(13)+chr$(13)+chr$(13)
7250 color rgb(255,255,255)
7260 print "1人目の文字を入れてください" + chr$(13)
7270 color rgb(255,255,255)
7280 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
7290 color rgb(0,0,0)
7300 print chr$(13)
7310 Input "1人目文字入力:",buf_Parson1$
7320 endif
7330 Surei_twoParson2:
7340 cls 3:Font 32:init"kb:2"
7350 '2人目入力
7360 gload Gazo$ + "InputKotodama_20230131.png"
7370 if lang_falg = 1 then
7380 else
7390 print ""+chr$(13)+chr$(13)+chr$(13)
7400 color rgb(255,255,255)
7410 print "2人目の文字を入れてください" + chr$(13)
7420 color rgb(255,255,255)
7430 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
7440 color rgb(0,0,0)
7450 Input "2人目の文字入力:",buf_Parson2$
7460 goto Surei_Result2:
7470 endif
7480 '数霊　計算 パート
7490 '文字の計算関数
7500 'moji$:1文字を入れる
7510 func Complate(moji$)
7520 for n = 1 to 116
7530 if moji$ = bufline$(2*n) then
7540 buffcount = val(bufline$(2 * n + 1))
7550 endif
7560 next n
7570 endfunc buffcount
7580 '数霊　結果表示
7590 Surei_Result:
7600 cls 3:Font 32
7610 'ゼロカウント:zcount
7620 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
7630 '例 アカい:"い"の文字は無効な文字なので、はじく
7640 zcount=0
7650 'mojicount:入力文字数
7660 mojicount = len(buffer_moji$)
7670 for n=1 to mojicount
7680 for j=1 to 118
7690 if (bufcount$(n - 1) = bufline$(2 * j)) then
7700 bufcount$(n-1) = Mid$(buffer_moji$,n,1)
7710 endif
7720 next j
7730 next n
7740 ncount=0:count=0
7750 for i = 1 to mojicount
7760 bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7770 'ンのカウント
7780 if (bufcount$(i-1) = "ン") then ncount = ncount + 1
7790 next i
7800 if (ncount > 0) then
7810 'Listを表示する
7820 moji_List$(0) = "この単語は目に見える物です"
7830 moji_List$(1) = "この単語は目に見えない物です"
7840 num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
7850 if (num2 = 0) then
7860 else
7870 if (num2 = 1) then
7880 n1 = 9 * ncount
7890 endif
7900 endif
7910 endif
7920 for j=1 to mojicount
7930 bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7940 count = count + Complate(bufcount$(j - 1))
7950 next j
7960 count = count + n1
7970 if (ncount > 0) then count = count
7980 '182以上のとき,181を引く
7990 if buf_cofig_r = 0 then
8000 if (count > 181) then
8010 count = count - 181
8020 else
8030 if (buf_config_r = 1) then
8040 buf_count = Single_Complate(count)
8050 endif
8060 endif
8070 endif
8080 cls 3:Font 48+16
8090 gload Gazo$ + "Result_Screen3_20230319.png"
8100 if buf_config_r = 1 then
8110 print "入力文字:" + buffer_moji$ + chr$(13)
8120 print "数霊(かずたま):";buf_count;chr$(13)
8130 endif
8140 if lang_flag = 1 then
8150 else
8160 color rgb(255,0,0)
8170 print "入力文字:" + buffer_moji$ + chr$(13)
8180 endif
8190 if lang_flag = 1 then
8200 else
8210 color rgb(0,0,255)
8220 print "数霊(かずたま):";count;chr$(13)
8230 endif
8240 if lang_flag = 1 then
8250 else
8260 color rgb(0,0,0)
8270 print "エンター or スペース" + chr$(13)
8280 print  chr$(13)
8290 'endif
8300 endif
8310 key$ = input$(1)
8320 if ((key$ = chr$(13)) or (key$=" ")) then
8330 List$(0)="1.もう一度数霊を見る"
8340 List$(1)="2.トップ画面に行く"
8350 List$(2)="3.この数霊の説明を見る"
8360 List$(3)="4.数霊データーを保存"
8370 num=ui_select("List$","番号を選んでください")
8380 select case num
8390 case 0:
8400 goto Surei_Input:
8410 case 1:
8420 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
8430 for i=0 to 9
8440 bufcount$(i)=""
8450 next i
8460 goto TopScreen:
8470 case 2:
8480 goto Surei_Result4:
8490 case 3:
8500 s=Surei_Result_Save_File()
8510 ui_msg "保存しました"
8520 case -1:
8530 'goto Surei_Result:
8540 case else:
8550 goto Surei_Result:
8560 end select
8570 'ファイルを保存する
8580 else
8590 goto Surei_Result:
8600 endif
8610 '3-1 バージョン情報
8620 Version:
8630 cls 3:Font 32
8640 select case device_No
8650 case 1:
8660 gload Gazo$ + "Screen1_Version.png"
8670 gload Gazo$ + "downscreen.png",0,0,800
8680 case 2:
8690 gload Gazo$ + "Screen1_version.png"
8700 end select
8710 play ""
8720 play Voice_File_TopScreen$ + "Voice_Version.mp3"
8730 color rgb(255,0,0)
8740 print chr$(13)
8750 color rgb(255,255,255)
8760 if lang_flag = 1 then
8770 else
8780 print chr$(13)+chr$(13)+chr$(13)
8790 print "Ver:";Version$ + chr$(13)
8800 print "アプリ名:数霊計算機" + chr$(13)
8810 print "Basic for Android Runtime" + chr$(13)
8820 print "Author:licksjp" + chr$(13)
8830 print "制作開始:2021.7.28" + chr$(13)
8840 print chr$(13)
8850 print "(C)Copy right licksjp " + chr$(13)
8860 print "All rights reserved" + chr$(13)
8870 print chr$(13)
8880 color rgb(0,0,0)
8890 print "パッドの右を押してください" + chr$(13)
8900 endif
8910 bg=0:key$=""
8920 while (bg <> 2 and key$ <> chr$(13))
8930 bg = strig(1)
8940 key$ = inkey$
8950 pause 2
8960 wend
8970 if key$ = chr$(13) then
8980 goto TopScreen:
8990 else
9000 if bg=2 then
9010 goto TopScreen:
9020 else
9030 if lang_flag = 1 then
9040 else
9050 talk "無効なキーです":goto Version:
9060 endif
9070 endif
9080 endif
9090 '3-2 参考文献
9100 Reference_Book:
9110 cls 3:Font 48:play""
9120 select case device_No
9130 case 1:
9140 gload Gazo$ + "Screen1_Reference.png"
9150 gload Gazo$ + "downscreen.png",0,0,800
9160 case 2:
9170 gload Gazo$ + "Screen1_Reference.png"
9180 end select
9190 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
9200 color rgb(255,0,0)
9210 print chr$(13)+chr$(13)
9220 if lang_flag = 1 then
9230 else
9240 color rgb(255,255,255)
9250 print "書名:数霊" + chr$(13)
9260 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
9270 print "出版社:徳間書店" + chr$(13)
9280 print "ISBN:978-4-19-" + chr$(13)
9290 print "         865309-5" + chr$(13)
9300 print "定価:2300円 + 税" + chr$(13)
9310 color rgb(0,0,0)
9320 print "パッドの右を押してください"
9330 endif
9340 bg = 0:key$ = ""
9350 while (bg <> 2 and key$ <> chr$(13))
9360 bg = strig(1)
9370 key$ = inkey$
9380 pause 2
9390 wend
9400 if key$ = chr$(13) then
9410 goto TopScreen:
9420 else
9430 if bg = 2 then
9440 goto TopScreen:
9450 else
9460 talk "無効なキーです":goto Reference_Book:
9470 endif
9480 endif
9490 'ヘルプ画面　トップ画面
9500 Help:
9510 No=1:c=0
9520 play ""
9530 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
9540 cls 3:Font 48:
9550 select case device_No
9560 case 1:
9570 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9580 gload Gazo$ + "downscreen.png",0,0,800
9590 case 2:
9600 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9610 end select
9620 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0
9630 color rgb(255,0,0)
9640 print chr$(13)+chr$(13)+chr$(13)
9650 color rgb(255,255,255)
9660 print "番号を選んでください" + chr$(13)
9670 print " :1.バージョン" + chr$(13)
9680 print " :2.参考文献" + chr$(13)
9690 print " :3.データーの初期化"+chr$(13)
9700 print " :4.トップ画面に行く" + chr$(13)
9710 color rgb(0,0,0)
9720 locate 0,15:print "                                     "
9730 if No = 1 then locate 0,15:print " 1.バージョンを選択"
9740 'y:バーチャルパッドの処理
9750 'key$:カーソルの処理
9760 'bg:バーチャルパッドの右ボタン
9770 Help_key:
9780 y = 0:key$ = "":bg = 0
9790 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
9800 y = stick(1)
9810 key$ = inkey$
9820 bg = strig(1)
9830 pause 2
9840 wend
9850 'バーチャルパッド　ここから'
9860 if (y = 1) then
9870 select case No
9880 'No の初期値：No=1
9890 case 1:
9900 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
9910 if lang_flag = 1 then
9920 else
9930 locate 0,15:print" 2.参考文献を選択":goto Help_key:
9940 endif
9950 'デバッグライン　ここから
9960 '0のとき
9970 'デバッグライン　ここまで
9980 'デバッグライン　ここから
9990 case 3:
10000 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:No=0:pause 200:locate 0,15:print "                                                          "
10010 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":goto Help_key:
10020 'デバッグライン　ここまで
10030 'デバッグライン　ここから
10040 'デバッグライン　ここまで
10050 case 2:
10060 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 0,15:print "                                                          ":color rgb(0,0,0):locate 0,15:print " 3.データーの初期化を選択":No=3:goto Help_key:
10070 case 0:
10080 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10090 'デバッグライン　ここから
10100 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
10110 'デバッグライン　ここまで
10120 end select
10130 endif
10140 'バーチャルパッド　上 ここから
10150 if (y = -1) then
10160 select case No
10170 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
10180 case 1:
10190 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                                           ":locate 0,15:print" 4.トップ画面に行くを選択":goto Help_key
10200 'No:3 3.Help→2.設定 No:2
10210 case 3:
10220 sp_on 1,0:sp_on 0,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                                          ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
10230 case 2:
10240 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                                          ":locate 0,15:print" 1.バージョンを選択":goto Help_key:
10250 case 0:
10260 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                                          ":locate 0,15:print" 3.データーの初期化を選択":goto Help_key:
10270 end select
10280 endif
10290 if (bg = 2) then
10300 select case No
10310 '1.数霊チェックを選択  パッドの右キー
10320 case 1:
10330 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
10340 '2.設定を選択    パッドの右キー
10350 case 2:
10360 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
10370 '3.データーの初期化
10380 case 3:
10390 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto data_initialize:
10400 '4.ヘルプを選択 パッドの右
10410 case 0:
10420 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
10430 'プログラムの終了を選択
10440 'if lang_flag = 1 then
10450 'lang_flag = 1:英語
10460 'Else
10470 'lang_flag = 0:日本語
10480 'endif
10490 end select
10500 '4.終了するを選択  パッドの右
10510 endif
10520 'バーチャルパッド　上　ここまで
10530 'バーチャルパッド　ここまで'
10540 'key$ = input$(1)
10550 'カーソルの下
10560 if key$ = chr$(31) then
10570 select case (No Mod 4)
10580 'バージョンから参考文献
10590 case 0:
10600 c=1:No=c:locate 0,15:Print "             ":locate 0,15:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
10610 '参考文献からトップ画面
10620 case 1:
10630 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "            ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10640 'トップ画面から終了
10650 '終了からバージョン
10660 case 2:
10670 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                     ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10680 case else:
10690 goto Help_key:
10700 end select
10710 endif
10720 'カーソル　上
10730 if (key$ = chr$(30)) then
10740 select case (c Mod 4)
10750 'バージョンから終了
10760 case 0:
10770 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:locate 0,15:print "                   ":locate 0,15:print " 4.終 了を選択":goto Help_key:
10780 '参考文献からバージョン
10790 case 1:
10800 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                   ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10810 'トップ画面から参考文献
10820 case 2:
10830 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":locate 0,15:print " 2.参考文献を選択":goto Help_key:
10840 '終了からトップ画面を選択
10850 case 3:
10860 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print"                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10870 case else:
10880 goto Help_key:
10890 end select
10900 endif
10910 'エンターキー：決定
10920 if (key$ = chr$(13)) then
10930 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10940 if No=0 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10950 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10960 else
10970 goto Help_key:
10980 endif
10990 '登録文字の確認
11000 '文字を1文字入れて登録されているか調べるメニュー
11010 '設定項目
11020 Setting:
11030 cls 3:Font 48
11040 select case device_No
11050 case 1:
11060 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
11070 gload Gazo$ + "downscreen.png",0,0,800
11080  case 2:
11090 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
11100 end select
11110 play ""
11120 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
11130 No=1
11140 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:
11150 color rgb(0,0,255)
11160 print chr$(13)
11170 if lang_flag = 1 then
11180 'lang_flag = 1:英語
11190 else
11200 'lang_flag = 0:日本語
11210 color rgb(255,255,255)
11220 print chr$(13)
11230 print "番号を選んでください" + chr$(13)
11240 '-------コメント----------------
11250 'print " :1.登録文字の確認" + chr$(13)
11260 'print " :2.数霊文字確認" + chr$(13)
11270 '-------コメント----------------
11280 'print chr$(13)
11290 print " :1.文字の項目" + chr$(13)
11300 print " :2.結果表示設定" + chr$(13)
11310 print " :3.言語設定" + chr$(13)
11320 print " :4.トップ画面に行く" + chr$(13)
11330 endif
11340 color rgb(0,0,0)
11350 locate 0,15
11360 if No=1 then locate 0,15:print  "                                     ":locate 0,15:print " 1.文字の項目を選択"
11370 'y:バーチャルパッドの処理
11380 'key$:カーソルの処理
11390 'bg:バーチャルパッドの右ボタン
11400 SettingScreen:
11410 y = 0:key$ = "":bg=0
11420 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
11430 y = stick(1)
11440 key$ = inkey$
11450 bg=strig(1)
11460 pause 2
11470 wend
11480 'バーチャルパッド　ここから'
11490 'バーチャルパッド　ここから'
11500 if (y = 1) then
11510 select case No
11520 'No の初期値：No=1
11530 case 1:
11540 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":color rgb(0,0,0):locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11550 'デバッグライン　ここから
11560 '0のとき
11570 'デバッグライン　ここまで
11580 'デバッグライン　ここから
11590 case 2:
11600 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                         "
11610 color rgb(0,0,0)::No=3
11620 if lang_flag = 1 then
11630 else
11640 locate 1,15:print "3.言語設定を選択":goto SettingScreen:
11650 endif
11660 'デバッグライン　ここまで
11670 case 3:
11680 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                              ":locate 1,15:print "4.トップ画面に行くを選択":No=0:goto SettingScreen:
11690 'デバッグライン　ここから
11700 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11710 'デバッグライン　ここまで
11720 case 0:
11730 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
11740 'デバッグライン　ここから
11750 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11760 'デバッグライン　ここまで
11770 end select
11780 endif
11790 'バーチャルパッド　上 ここから
11800 if (y = -1) then
11810 select case No
11820 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11830 case 1:
11840 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 1,15:print"4.トップ画面に行くを選択":goto SettingScreen:
11850 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11860 case 0:
11870 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 1,15:print"3.言語設定を選択":goto SettingScreen:
11880 'No:3 3.Help→2.設定 No:2
11890 case 3:
11900 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.結果表示設定を選択":goto SettingScreen:
11910 case 2:
11920 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 1,15:print"1.文字の項目を選択":goto SettingScreen:
11930 end select
11940 endif
11950 if (bg=2) then
11960 select case No
11970 '1.数霊チェックを選択  パッドの右キー
11980 case 1:
11990 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
12000 '2.設定を選択    パッドの右キー
12010 case 2:
12020 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
12030 '3.ヘルプを選択 パッドの右
12040 case 0:
12050 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
12060 'プログラムの終了を選択
12070 case 3:
12080 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Setting_Language:
12090 end select
12100 endif
12110 '4.終了するを選択  パッドの右
12120 'バーチャルパッド　ここまで'
12130 'カーソル下'
12140 if (key$ = chr$(31)) then
12150 select case (No Mod 4)
12160 '登録文字から数霊文字の確認
12170 case 1:
12180 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                     ":locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
12190 '数霊文字の確認からトップ画面に行く
12200 case 2:
12210 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "                                     ":locate 1,15:print"3.言語設定を選択":goto SettingScreen:
12220 'トップ画面に行くから終了
12230 case 3:
12240 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,590),0,0:locate 0,15:print "                                       ":locate 1,15:print "4.トップ画面に行くを選択":goto SettingScreen:
12250 '終了から登録文字
12260 case 0:
12270 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
12280 end select
12290 endif
12300 'カーソル　上
12310 if (key$ = chr$(30)) then
12320 select case (No Mod 4)
12330 case 1:
12340 c=2:No=c:sp_on 0,1:sp_put 0,(5,300),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
12350 case 2:
12360 c=3:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
12370 case 3:
12380 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:goto SettingScreen:
12390 case 0:
12400 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,590),0,0:sp_on 0,0:goto SettingScreen:
12410 end select
12420 endif
12430 'エンターキーを押したとき
12440 if (key$ = chr$(13)) then
12450 if (No=3) then goto Setting_Language:
12460 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
12470 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
12480 if (No=0) then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
12490 endif
12500 '文字検索項目  ここから
12510 Moji_Search:
12520 cls 4:cls 3:Font 32+16:init"kb:2"
12530 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12540 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12550 play ""
12560 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
12570 print "" + chr$(13)
12580 color rgb(255,255,255)
12590 if lang_flag = 1 then
12600 Else
12610 print "文字を一文字入れてください" + chr$(13)
12620 endif
12630 color rgb(0,0,0)
12640 if lang_flag=1 then
12650 Else
12660 Input "登録文字:",moji$
12670 endif
12680 moji_count = len(moji$)
12690 if moji_count > 1 then
12700 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Moji_Search:
12710 else
12720 count=0:
12730 for n = 0 to 116
12740 if bufline$(2*n) = moji$ then
12750 cls 3:font 48:init"kb:4":
12760 select case device_No
12770 case 1:
12780 gload Gazo$ + "downscreen.png",0,0,800
12790 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12800 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12810 case 2:
12820 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12830 end select
12840 play ""
12850 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12860 if lang_flag = 1 then
12870 Else
12880 bg=0:key$=""
12890 print chr$(13)
12900 color rgb(255,255,255)
12910 print moji$;"は、登録されています。" + chr$(13)
12920 color rgb(0,0,0)
12930 print "ジョイパッドの右を押してください"
12940 endif
12950 'bg = 0:key$ = ""
12960 while (bg <> 2 and key$ <> chr$(13))
12970 key$ = inkey$
12980 bg = strig(1)
12990 pause 2
13000 wend
13010 if ((key$ = chr$(13)) or (bg = 2)) then goto TopScreen:
13020 count = count + 1
13030 endif
13040 next n
13050 if count = 0 then
13060 cls 3:font 48:init "kb:4":bg=0:key$=""
13070 select case (device_No)
13080 case 1:
13090 gload Gazo$ + "Moji_check.png",0,0,0
13100 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
13110 gload Gazo$ + "downscreen.png",0,0,800
13120 case 2:
13130 gload Gazo$ + "Moji_check.png",0,0,0
13140 end select
13150 play ""
13160 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
13170 print chr$(13)
13180 if lang_flag = 1 then
13190 Else
13200 color rgb(255,255,255)
13210 print moji$;"は、登録されていません。" + chr$(13)
13220 color rgb(0,0,0)
13230 print "パッドの右を押してください" + chr$(13)
13240 endif
13250 while (bg <> 2 and key$ <> chr$(13))
13260 key$ = inkey$
13270 bg = strig(1)
13280 pause 2
13290 wend
13300 if ((key$ = chr$(13)) or (bg = 2)) then goto TopScreen:
13310 endif
13320 endif
13330 Surei_Result2:
13340 cls 3:Font 48
13350 zcount1=0:zcount2=0:count1=0:count2=0
13360 '1人目
13370 mojicount1=len(buf_Parson1$)
13380 '2人目
13390 mojicount2 = len(buf_Parson2$)
13400 '1人目
13410 for n = 1 to mojicount1
13420 for j = 1 to 116
13430 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
13440 if bufcount1$(n-1) = bufline$(2*j) then
13450 zcount1 = zcount1 + 1
13460 endif
13470 next j
13480 next n
13490 '2人目
13500 for n = 1 to mojicount2
13510 for j = 1 to 116
13520 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
13530 if bufcount2$(n-1) = bufline$(2*j) then
13540 zount2 = zcount2 + 1
13550 endif
13560 next j
13570 next n
13580 '1人目
13590 for i=1 to mojicount1
13600 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
13610 p1 = Complate(bufcount1$(i-1))
13620 count1 = count1 + p1
13630 next i
13640 '2人目
13650 for i = 1 to mojicount2
13660 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
13670 p2 = Complate(bufcount2$(i-1))
13680 count2 = count2 + p2
13690 next i
13700 cls 3:
13710 select case device_No
13720 case 1:
13730 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
13740 gload Gazo$ + "downscreen.png",0,0,800
13750 case 2:
13760 gload Gazo$ + "downscreen.png",0,0,0
13770 end select
13780 color rgb(255,0,0)
13790 print ""+chr$(13)
13800 if lang_flag = 1 then
13810 else
13820 color rgb(255,255,255)
13830 print chr$(13)+chr$(13)
13840 print "1人目:";buf_Parson1$;chr$(13)
13850 print "数霊1:";count1;chr$(13)
13860 print "2人目:";buf_Parson2$;chr$(13)
13870 print "数霊2:";count2;chr$(13)
13880 print "数霊(合計):";count1 + count2;chr$(13)
13890 color rgb(0,0,0)
13900 print "バーチャルパッドの右" + chr$(13)
13910 endif
13920 key$ = "":bg = 0
13930 while (bg <> 2 and key$ <> chr$(13))
13940 bg = strig(1)
13950 key$ = inkey$
13960 pause 2
13970 wend
13980 if (bg = 2 or key$ = chr$(13))  then goto TopScreen:
13990 Surei_Result3:
14000 cls 3:Font 48
14010 zcount2 = 0:count2 = 0
14020 mojicount2 = len(buffer_moji2$)
14030 for n = 1 to mojicount2
14040 for j = 1 to 116
14050 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
14060 if bufcount2$(n - 1) = bufline$(2 * j) then
14070 zcount2 = zcount2 + 1
14080 endif
14090 next j
14100 next n
14110 for i = 1 to mojicount2
14120 n2 = Complate(bufcount2$(i-1))
14130 count2 = count2 + n2
14140 next i
14150 gload Gazo$ + "Screen5.png"
14160 if lang_flag = 1 then
14170 else
14180 color rgb(255,0,0)
14190 print "数霊の結果表示" + chr$(13)
14200 color rgb(255,255,255)
14210 print "１回目回の文字入力:";buffer_moji$;chr$(13)
14220 print "１回目の数霊(かずたま)";count;chr$(13)
14230 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
14240 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
14250 color rgb(0,0,0)
14260 print "エンターキー:トップ画面";chr$(13)
14270 print "c or C キー:数霊の比較";chr$(13)
14280 endif
14290 key$ = "":bg = 0
14300 while (key$ <> chr$(13) and bg <> 2)
14310 bg = strig(1)
14320 key$ = inkey$
14330 pause 2
14340 wend
14350 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
14360 if key$ = "c" or key$ = "C" then
14370 if count = count2 then
14380 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
14390 else
14400 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
14410 endif
14420 endif
14430 Moji_Count_Check:
14440 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
14450 cls 3:Font 48
14460 select case device_No
14470 case 1:
14480 gload Gazo$ + "Moji_check.png"
14490 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
14500 gload Gazo$ + "downscreen.png",0,0,800
14510 case 2:
14520 gload Gazo$ + "Moji_check.png",0,0,0
14530 end select
14540 n = 0
14550 open FILE_csv$ for input as #1
14560 while eof(1) = 0
14570 line input #1, line$
14580 n = n + 1
14590 wend
14600 close #1
14610 play ""
14620 if (n = 118) then
14630 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
14640 if lang_flag = 1 then
14650 else
14660 print "" + chr$(13)
14670 color rgb(255,255,255)
14680 print "文字の登録文字数は";n;"文字" + chr$(13)
14690 color rgb(0,0,0)
14700 print "パッドの右を押してください" + chr$(13)
14710 endif
14720 endif
14730 key$ = "":bg = 0
14740 while ((key$ <> chr$(13)) and (bg <> 2))
14750 key$=inkey$
14760 bg=strig(1)
14770 pause 2
14780 wend
14790 if ((bg = 2) or (key$=chr$(13))) then
14800 goto TopScreen:
14810 else
14820 goto Moji_Count_Check:
14830 endif
14840 'Save 関数
14850 file_kazutama = 0
14860 file_kazutama = Save_File()
14870 func Save_File()
14880 open SAVE_DATA1$  for output as #1
14890 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
14900 close #1
14910 endfunc
14920 Select_moji:
14930 cls 3:font 48:No = 1
14940 select case device_No
14950 case 1:
14960 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
14970 gload Gazo$ + "downscreen.png",0,0,800
14980 case 2:
14990 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
15000 end select
15010 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
15020 color rgb(255,0,0)
15030 if lang_flag = 1 then
15040 else
15050 play ""
15060 play Voice_File_TopScreen$ + "Voice_Select_Moji20230217.mp3"
15070 print chr$(13)+chr$(13)+chr$(13)
15080 color rgb(255,255,255)
15090 print "番号を選んでください" + chr$(13)
15100 print " :1.登録文字検索"+ chr$(13)
15110 print " :2.登録文字数の確認" + chr$(13)
15120 print " :3.数字から数霊の説明"+chr$(13)
15130 print " :4.トップ画面に戻る" + chr$(13)
15140 color rgb(0,0,0)
15150 locate 0,15
15160 if No = 1 then print " 1.登録文字検索を選択"
15170 endif
15180 Entry_check_key:
15190 y = 0:key$ = "":bg=0
15200 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
15210 y = stick(1)
15220 key$ = inkey$
15230 bg=strig(1)
15240 pause 2
15250 wend
15260 'バーチャルパッド　ここから'
15270 'バーチャルパッド　ここから'
15280 if y = 1 then
15290 select case No
15300 'No の初期値：No=1
15310 case 1:
15320 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print "2.登録文字数の確認を選択":goto Entry_check_key:
15330 'デバッグライン　ここから
15340 '0のとき
15350 'デバッグライン　ここまで
15360 'デバッグライン　ここから
15370 case 2:
15380       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 0,15:print "                                                         ":No=3:locate 0,15:print" 3.数字から数霊の説明を選択":goto Entry_check_key:
15390 case 3:
15400 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:locate 0,15:print "                                       "
15410 :No=0
15420 'if lang_flag = 1 then
15430 'Else
15440 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に戻るを選択":goto Entry_check_key:
15450 'endif
15460 'cls:color rgb(255,255,255):print"ok"
15470 'デバッグライン　ここまで
15480 'デバッグライン　ここから
15490 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
15500 'デバッグライン　ここまで
15510 case 0:
15520 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.登録文字検索を選択":goto Entry_check_key:
15530 'デバッグライン　ここから
15540 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
15550 'デバッグライン　ここまで
15560 end select
15570 endif
15580 'バーチャルパッド　上 ここから
15590 if y = -1 then
15600 select case No
15610 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15620 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15630 case 0:
15640       sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print "                                      ":locate 0,15:print " 3.数字から数霊の説明を選択":goto Entry_check_key:
15650 case 1:
15660 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print"4.トップ画面に戻るを選択":goto Entry_check_key:
15670 'No:3 3.Help→2.設定 No:2
15680 case 3:
15690 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
15700 case 2:
15710 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 1.登録文字検索を選択":goto Entry_check_key:
15720 end select
15730 endif
15740 if bg=2 then
15750 select case No
15760 '1.数霊チェックを選択  パッドの右キー
15770 case 1:
15780 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15790 '2.設定を選択    パッドの右キー
15800 case 2:
15810 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15820 '3.ヘルプを選択 パッドの右
15830 case 0:
15840 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15850 case 3:
15860 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Input_numbertokazutama:
15870 end select
15880 endif
15890 '4.終了するを選択  パッドの右
15900 'バーチャルパッド　ここまで'
15910 'key$ = input$(1)
15920 'カーソルの下
15930 if key$ = chr$(31) then
15940 select case (No Mod 4)
15950 case 0:
15960 c=1:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
15970 case 1:
15980 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,500),0,0:sp_on 3,0:goto Entry_check_key:
15990 case 2:
16000 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:goto Entry_check_key:
16010 case 3:
16020 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
16030 end select
16040 endif
16050 'カーソル　上
16060 if key$ = chr$(30) then
16070 select case (No Mod 4)
16080 case 0:
16090 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
16100 case 1:
16110 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
16120 case 2:
16130 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
16140 case 3:
16150 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
16160 end select
16170 endif
16180 'エンターキーを押す
16190 if key$ = chr$(13) then
16200 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
16210 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
16220 if No = 0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16230 endif
16240 '
16250 Kakunin_Surei_count:
16260 cls 3:font 48:No=0
16270 select case device_No
16280 case 1:
16290 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
16300 'gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
16310 gload Gazo$ + "downscreen.png",0,0,800
16320 case 2:
16330 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
16340  end select
16350 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
16360 color rgb(255,0,0)
16370 print chr$(13)+chr$(13)+chr$(13)
16380 color rgb(255,255,255)
16390 print "番号を選んでください" + chr$(13)
16400 print " :1.数霊リスト 1人用" + chr$(13)
16410 print " :2.結果表示設定" + chr$(13)
16420 print " :3.トップ画面に行く" + chr$(13)
16430 print "" + chr$(13)
16440 color rgb(0,0,0)
16450 locate 0,15:print"                                                         "
16460 if No = 0 then locate 1,15:print "1.数霊リスト　1人用を選択"
16470 Entry_List:
16480 y = 0:key$ = "":bg=0
16490 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
16500 y = stick(1)
16510 key$ = inkey$
16520 bg = strig(1)
16530 pause 2
16540 wend
16550 'バーチャルパッド　ここから'
16560 'バーチャルパッド　ここから'
16570 'バーチャルパッド　下
16580 if y = 1 then
16590 select case No
16600 'No の初期値：No=1
16610 case 0:
16620 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=1:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.結果表示設定を選択":goto Entry_List:
16630 'デバッグライン　ここから
16640 '0のとき
16650 'デバッグライン　ここまで
16660 'デバッグライン　ここから
16670 'color rgb(0,0,0):locate 0,15:print " 4.終了を選択":goto Entry_List:
16680 'cls:color rgb(255,255,255):print"ok"
16690 'デバッグライン　ここまで
16700 case 2:
16710 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,300),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 1.数霊リスト 1人用を選択":No=0:goto Entry_List:
16720 case 1:
16730 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                      ":No=2:locate 1,15:print "3．トップ画面に行くを選択":goto Entry_List:
16740 'デバッグライン　ここから
16750 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
16760 'デバッグライン　ここまで
16770 'デバッグライン　ここから
16780 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
16790 'デバッグライン　ここまで
16800 end select
16810 endif
16820 'バーチャルパッド　上 ここから
16830 if y = -1 then
16840 select case No
16850 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
16860 case 2:
16870 sp_on 2,0:sp_on 0,0:sp_on 1,1:sp_on 3,0:sp_put 1,(5,400),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 2.結果表示設定を選択":goto Entry_List:
16880 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
16890 case 0:
16900 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 1,15:print"3.トップ画面に行くを選択":goto Entry_List:
16910 'No:3 3.Help→2.設定 No:2
16920 case 1:
16930 sp_on 1,0:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 0,(5,300),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print "1.数霊リスト 1人用を選択":goto Entry_List:
16940 end select
16950 endif
16960 if bg = 2 then
16970 select case No
16980 '1.数霊リスト 一人用を選択を選択  パッドの右キー
16990 case 0:
17000 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
17010 '2.設定を選択  パッドの右キー
17020 case 1:
17030 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
17040 case 2:
17050 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
17060 end select
17070 endif
17080 if key$=chr$(13) then
17090 select case No
17100 case 0:
17110 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
17120 case 1:
17130 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
17140 case 2:
17150 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
17160 end select
17170 endif
17180 '4.終了するを選択  パッドの右
17190 'バーチャルパッド　ここまで'
17200 Surei_List1:
17210 cls 3:font 48
17220 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
17230 file$ = dir$(SAVE_DATA1$,0)
17240 'ファイルが無いときの画面
17250 if file$ = ""  then
17260 '背景画面表示
17270 select case device_No
17280 case 1:
17290 gload Gazo$ + "KazutamaList1.png",0
17300 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
17310 gload Gazo$+"downscreen.png",0,0,800
17320 case 2:
17330 gload Gazo$ + "KazutamaList1.png"
17340 end select
17350 print chr$(13)
17360 color rgb(255,255,255):print "登録ファイルはございません" + chr$(13)
17370 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
17380 'else
17390 'endif
17400 bg = 0:key$ = ""
17410 while (key$ <> chr$(13) and bg<>2)
17420 key$ = inkey$
17430 bg = strig(1)
17440 pause 2
17450 wend
17460 'エンターキーもしくはバーチャルパッドの右でトップに行く
17470 if (bg = 2  or key$ = chr$(13)) then goto TopScreen:
17480 else
17490 cls 3:buffer_list_count = Loadcount()
17500 color rgb(255,255,255)
17510 if lang_flag = 1 then
17520 Else
17530 talk "登録件数は" + str$(buffer_list_count) + "件です"
17540 select case device_No
17550 Case 1:
17560 gload Gazo$ + "KazutamaList1_Entry.png",0,0,0
17570 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
17580 gload Gazo$ + "downscreen.png",0,0,800
17590 case 2:
17600 gload Gazo$+"KazutamaList1_Entry.png",0,0,0
17610 end select
17620 color rgb(0,0,255)
17630 print chr$(13)
17640 color rgb(255,255,255)
17650 print "登録件数:";buffer_list_count;"件";chr$(13)
17660 color rgb(0,0,0)
17670 print "パッドの右を押してください" + chr$(13)
17680 endif
17690 bg = 0:key$ = "":bg2 = 0
17700 while (key$ <> chr$(13) and bg <> 2)
17710 key$ = inkey$
17720 bg = strig(1)
17730 bg2=strig(0)
17740 pause 2
17750 wend
17760 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
17770 if (key$ = chr$(13) or bg = 2) then pause 2:goto KotodamaList_page:
17780 endif
17790 if (bg = 2) then pause 2:goto TopScreen:
17800 func Loadcount()
17810 n = 0
17820 'while eof(1)=-1
17830 open SAVE_DATA1$  for input as #1
17840 while eof(1) <> -1
17850 line input #1,line$
17860 n = n + 1
17870 wend
17880 close #1
17890 count = n
17900 endfunc count
17910 count_line = Loadcount()
17920 func Kotodama$(buf$)
17930 color rgb(255,255,255)
17940 b = len("数霊:")
17950 a$ = Mid$(buf$,b+1,len(buf$))
17960 for i=0 to 118
17970 color rgb(255,255,255)
17980 if bufline3$(2 * i) ="数霊:" + a$  then
17990 moji_$ = bufline3$(2*i + 1)
18000 endif
18010 next i
18020 kotodama$ = moji_$
18030 endfunc kotodama$
18040 KotodamaList_page:
18050 cls 3:font 48:m = 0:
18060 select case device_No
18070 case 1:
18080 gload Gazo$ + "Screen5_Surei_List.png"
18090 gload Gazo$ + "downscreen.png",0,0,800
18100 case 2:
18110 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
18120 end select
18130 if SAVE_DATA1$ = "" then
18140 cls 3:color rgb(255,255,255):print"ファイルがありません"
18150 else
18160 a = Loadcount()
18170 open SAVE_DATA1$  for input as #1
18180 for i=0 to a-1
18190 for n=0 to 1
18200 input #1,line$
18210 bufKaztama$(i,n) = line$
18220 next n
18230 next i
18240 close #1
18250 l = 0:n=0
18260 select case device_No
18270 case 1:
18280 gload Gazo$ + "Screen5_Surei_List.png"
18290 gload Gazo$ + "downscreen.png",0,0,800
18300 case 2:
18310 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
18320 end select
18330 while (buffer_list_count >= l)
18340 cls
18350 color rgb(255,0,0)
18360 print chr$(13)
18370 color rgb(255,255,255)
18380 n=n+1
18390 print chr$(13)
18400 print "番号:";l+1;chr$(13)
18410 print bufKaztama$(l,0) + chr$(13)
18420 print bufKaztama$(l,1) + chr$(13)
18430 Kmoji$ = moji$
18440 print chr$(13) + chr$(13) + chr$(13)
18450 color rgb(0,0,0)
18460 if buffer_list_count=1 then
18470 print " :パッドの左:トップ画面"+chr$(13)
18480 ui_msg "登録件数は1件です。"
18490 else
18500 if buffer_list_count > 1 then
18510 print " :パッドの左:トップ画面" + chr$(13)
18520 print " :パッドの右:次へ行く" + chr$(13)
18530 endif
18540 endif
18550 key$ = "":bg = 0:bg2 = 0
18560 while (key$ <> chr$(13) and bg <> 2 and bg2 <> 1)
18570 key$ = inkey$
18580 bg = strig(1)
18590 bg2 = strig(0)
18600 pause 2
18610 wend
18620 'if n > 1 then
18630 if (key$ = " " OR bg = 2) then
18640 if n > 1 then
18650 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
18660 endif
18670 else
18680 if ((bg2 = 1) or (key$=chr$(13))) then
18690 goto TopScreen:
18700 endif
18710 else
18720 goto KotodamaList_page:
18730 endif
18740 wend
18750 endif
18760 'ndif
18770 '結果表示２ Menu1
18780 Surei_Result4:
18790 cls 3:font 32+16:init"kb:4"
18800 for i=0 to 181 + 4 - 1
18810 if i = count  then
18820 buffer$ = bufline2$(count + 4,1)
18830 endif
18840 next i
18850 if len(buffer$) > 21 and len(buffer$) <= 45 then
18860 buffer2$ = Mid$(buffer$,1,22)
18870 buffer3$ = Mid$(buffer$,23,(len(buffer$) - 22))
18880 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13)
18890 else
18900 if len(buffer$) <= 21 then
18910 buffer2$ = Mid$(buffer$,1,21)
18920 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
18930 else
18940 if len(buffer$) > 45 and len(buffer$) <= 62 then
18950 buffer2$ = Mid$(buffer$,1,22)
18960 buffer3$ = Mid$(buffer$,23,22)
18970 buffer4$ = Mid$(buffer$,44,(len(buffer$)-44))
18980 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13)
18990 else
19000 if len(buffer$) > 64 and len(buffer$) <= 81 then
19010 buffer2$ = Mid$(buffer$,1,22)
19020 buffer3$ = Mid$(buffer$,23,20)
19030 buffer4$ = Mid$(buffer$,44,20)
19040 buffer5$ = Mid$(buffer$,65,(len(buffer$)-65))
19050 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13)
19060 if len(buffer$) > 81 and len(buffer$) <= 110 then
19070 buffer2$ = Mid$(buffer$,1,22)
19080 buffer3$ = Mid$(buffer$,23,20)
19090 buffer4$ = Mid$(buffer$,43,20)
19100 buffer5$ = Mid$(buffer$,63,20)
19110 buffer6$ = Mid$(buffer$,83,(len(buffer$) - 83))
19120 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13)
19130 endif
19140 endif
19150 endif
19160 endif
19170 endif
19180 Surei_Result4_2:
19190 select case device_No
19200 case 1:
19210 gload Gazo$ + "Screen1_Result2.png"
19220 gload Gazo$ + "downscreen.png",0,0,800
19230 case 2:
19240 gload Gazo$ +"Screen1_Result2.png"
19250 end select
19260 Result_Menu_List$(0)="1.トップ画面に行く"
19270 Result_Menu_List$(1)="2.数霊のデーターを保存"
19280 Result_Menu_List$(2)="3.もう一度、数霊を調べる"
19290 cls
19300 print chr$(13)
19310 if lang_flag = 1 then
19320 else
19330 color rgb(127,255,212)
19340 print chr$(13);chr$(13)
19350 print "入力文字:";buffer_moji$;chr$(13)
19360 print "数霊:";count;chr$(13)
19370 color rgb(255,255,255)
19380 print "数霊の説明:"+chr$(13)
19390 print buffer$
19400 color rgb(0,0,0)
19410 locate 0,15
19420 print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
19430 endif
19440 key$ = "":bg = 0:bg2 = 0
19450 while (bg<>2 and bg2<>1)
19460 key$ = inkey$
19470 bg = strig(1)
19480 bg2 = strig(0)
19490 pause 2
19500 wend
19510 if ((bg = 2) or (bg2 = 1)) then
19520 num = ui_select("Result_Menu_List$","番号を選んでください")
19530 endif
19540 if num = 0 then goto TopScreen:
19550 if num = 1 then goto File_save:
19560 if num = 2 then goto Surei_Input:
19570 if num = -1 then goto Surei_Result4
19580 File_save:
19590 'ファイルがない時
19600 if dir$(SAVE_DATA1$) = " " then
19610 open SAVE_DATA1$ for output as #1
19620 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19630 close #1
19640 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19650 'ファイルが有る時
19660 else
19670 open SAVE_DATA1$ for append as #1
19680 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19690 close #1
19700 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19710 endif
19720 func All_clear()
19730 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
19740 endfunc
19750 'ここから
19760 Config_moji1:
19770 cls 3:Font 48
19780 select case device_No
19790 case 1:
19800 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19810 gload Gazo$ + "downscreen.png",0,0,800
19820 case 2:
19830  gload  Gazo$ + "Screen1_Setting_Top.png",0,0,0
19840 end select
19850 play ""
19860 No=1
19870 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19880 color rgb(0,0,255)
19890 print chr$(13)
19900 if lang_flag = 1 then
19910 'lang_flag = 1:英語
19920 else
19930 'lang_flag = 0:日本語
19940 color rgb(255,255,255)
19950 print "番号を選んでください" + chr$(13)
19960 print " :1.文字の項目" + chr$(13)
19970 print " :2.結果表示設定" + chr$(13)
19980 print " :3.トップ画面に行く" + chr$(13)
19990 print " :4.終 了" + chr$(13)
20000 endif
20010 color rgb(0,0,0)
20020 locate 1,12
20030 if No = 1 then print "1.文字の項目"
20040 'y:バーチャルパッドの処理
20050 'key$:カーソルの処理
20060 'bg:バーチャルパッドの右ボタン
20070 Config_moji1_Screen:
20080 y = 0:key$ = "":bg=0
20090 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
20100 y = stick(1)
20110 key$ = inkey$
20120 bg=strig(1)
20130 pause 2
20140 wend
20150 'バーチャルパッド　ここから'
20160 'バーチャルパッド　ここから'
20170 if y = 1 then
20180 select case No
20190 'No の初期値：No=1
20200 case 1:
20210 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20220 'デバッグライン　ここから
20230 '0のとき
20240 'デバッグライン　ここまで
20250 'デバッグライン　ここから
20260 case 2:
20270 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
20280 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
20290 'if lang_flag = 1 then
20300 'else
20310 locate 1,12:print "3.トップ画面に行くを選択"
20320 'endif
20330 'デバッグライン　ここまで
20340 case 3:
20350 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
20360 'デバッグライン　ここから
20370 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
20380 'デバッグライン　ここまで
20390 case 0:
20400 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20410 'デバッグライン　ここから
20420 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
20430 'デバッグライン　ここまで
20440 end select
20450 endif
20460 'バーチャルパッド　上 ここから
20470 if y = -1 then
20480 select case No
20490 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
20500 case 1:
20510 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
20520 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
20530 case 0:
20540 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
20550 'No:3 3.Help→2.設定 No:2
20560 case 3:
20570 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20580 case 2:
20590 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
20600 end select
20610 endif
20620 if bg=2 then
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
20750 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
20760 'if lang_flag = 1 then
20770 'Else
20780 ui_msg "プログラムを終了します":end
20790 'endif
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
20910 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
20920 '数霊文字の確認からトップ画面に行く
20930 case 2:
20940 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
20950 'トップ画面に行くから終了
20960 case 3:
20970 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
20980 '終了から登録文字
20990 case 0:
21000 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
21010 end select
21020 endif
21030 'カーソル　上
21040 if key$ = chr$(30) then
21050 select case (No Mod 4)
21060 case 1:
21070 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
21080 case 2:
21090 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
21100 case 3:
21110 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
21120 case 0:
21130 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
21140 end select
21150 endif
21160 'エンターキーを押したとき
21170 if key$ = chr$(13) then
21180 if No=3 then goto TopScreen:
21190 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
21200 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
21210 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
21220 'lse
21230 'o'o SettingScreen:
21240 endif
21250 'ここまで
21260 Config_moji2:
21270 cls 3:Font 48
21280 select case device_No
21290 case 1:
21300 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
21310 gload Gazo$ + "downscreen.png",0,0,800
21320  case 2:
21330 gload Gazo$ + "Screen1_Setting_Top.png "
21340  end select
21350 play ""
21360 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
21370 No=1
21380 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
21390 color rgb(0,0,255)
21400 'print "●設定項目" + chr$(13)
21410 print chr$(13)
21420 if lang_flag = 1 then
21430 'lang_flag = 1:英語
21440 else
21450 'lang_flag = 0:日本語
21460 color rgb(255,255,255)
21470 print "番号を選んでください" + chr$(13)
21480 'print " :1.文字の項目" + chr$(13)
21490 'print " :2.結果表示設定" + chr$(13)
21500 print " :1.文字の項目" + chr$(13)
21510 print " :2.結果表示設定" + chr$(13)
21520 print " :3.トップ画面に行く" + chr$(13)
21530 print " :4.終 了" + chr$(13)
21540 endif
21550 color rgb(0,0,0)
21560 locate 1,12
21570 if No = 1 then print "1.文字の項目"
21580 'y:バーチャルパッドの処理
21590 'key$:カーソルの処理
21600 'bg:バーチャルパッドの右ボタン
21610 config_moji2:
21620 y = 0:key$ = "":bg=0
21630 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
21640 y = stick(1)
21650 key$ = inkey$
21660 bg = strig(1)
21670 pause 2
21680 wend
21690 'バーチャルパッド　ここから'
21700 'バーチャルパッド　ここから'
21710 if y = 1 then
21720 select case No
21730 'No の初期値：No=1
21740 case 1:
21750 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
21760 'デバッグライン　ここから
21770 '0のとき
21780 'デバッグライン　ここまで
21790 'デバッグライン　ここから
21800 case 2:
21810 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
21820 color rgb(0,0,0)::No=2:goto SettingScreen:
21830 if lang_flag = 1 then
21840 else
21850 locate 0,12:print " 3.トップ画面に行くを選択"
21860 endif
21870 'cls:color rgb(255,255,255):print"ok"
21880 'デバッグライン　ここまで
21890 case 3:
21900 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
21910 'デバッグライン　ここから
21920 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
21930 'デバッグライン　ここまで
21940 case 0:
21950 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21960 'デバッグライン　ここから
21970 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
21980 'デバッグライン　ここまで
21990 end select
22000 endif
22010 'バーチャルパッド　上 ここから
22020 if y = -1 then
22030 select case No
22040 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
22050 case 1:
22060 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
22070 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
22080 case 0:
22090 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
22100 'No:3 3.Help→2.設定 No:2
22110 case 3:
22120 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22130 case 2:
22140 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
22150 end select
22160 endif
22170 '決定ボタン
22180 if bg=2 then
22190 select case No
22200 '1.数霊チェックを選択  パッドの右キー
22210 case 1:
22220 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
22230 '2.設定を選択    パッドの右キー
22240 case 2:
22250 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
22260 '3.ヘルプを選択 パッドの右
22270 case 3:
22280 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
22290 'プログラムの終了を選択
22300 case 0:
22310 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
22320 'if lang_flag = 1 then
22330 'Else
22340 ui_msg "プログラムを終了します":end
22350 'endif
22360 end select
22370 endif
22380 '4.終了するを選択  パッドの右
22390 'バーチャルパッド　ここまで'
22400 'カーソル下'
22410 if key$ = chr$(31) then
22420 select case (No Mod 4)
22430 '登録文字から数霊文字の確認
22440 case 1:
22450 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22460 '数霊文字の確認からトップ画面に行く
22470 case 2:
22480 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
22490 'トップ画面に行くから終了
22500 case 3:
22510 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
22520 '終了から登録文字
22530 case 0:
22540 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
22550 end select
22560 endif
22570 'カーソル　上
22580 if key$ = chr$(30) then
22590 select case (No Mod 4)
22600 case 1:
22610 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
22620 case 2:
22630 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
22640 case 3:
22650 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
22660 case 0:
22670 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
22680 end select
22690 endif
22700 'エンターキーを押したとき
22710 if key$ = chr$(13) then
22720 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
22730 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
22740 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
22750 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
22760 'lse
22770 'o'o SettingScreen:
22780 endif
22790 '結果表示設定
22800 Result_Setting:
22810 color rgb(255,255,255)
22820 'dim list$(4)
22830 'ファイル読み込み
22840 '1.ファイルが有るか無いかのチェック
22850 if Dir$(System$) = "" then
22860 '1-1.ファイルがないとき
22870 '上のSystemフォルダを作成
22880 mkdir "./data/system/"
22890 list$(0) = "●:出た数字から181を引く"
22900 list$(1) = " :出た数字から180を引き単数変換"
22910 open System$ for output as #1
22920 print #1,"config_r=0"
22930 close #1
22940 ui_msg "ファイルを作成しました"
22950 'ファイル作成
22960 else
22970 '1-2.ファイルが有るとき
22980 'config_r:0 出た数字から181を引く
22990 'config_r:1 出た数字から180を引いて単数変換
23000 'open "./System/config.sys" for input as #1
23010 'ファイルが有るときファイルを読み込み
23020 open System$ for input as #1
23030 line input #1,buf_line$
23040 'buf$にデーターをコピーする
23050 buf$ = buf_line$
23060 close #1
23070 if len(buf$) = 10 then
23080 if left$(buf$,9) = "config_r=" then
23090 buf$ = right$(buf_line$,1)
23100 if buf$ = "1" then
23110 '1.System$ ファイルを削除(config.sys)
23120 '2.1行目をconfig_r=1と書き、保存する
23130 buf_config_r = 1
23140 'list$(0) = "●:1.出た数字から180を引いて単数変換"
23150 'list$(1) = " :2.出た数字から181を引く"
23160 else
23170 if buf$ = "0" then
23180 buf_config_r = 0
23190 ' list$(0) = "●:1.出た数字から181を引く"
23200 'list$(1) = " :2.出た数字から180を引いて単数変換"
23210 endif
23220 endif
23230 endif
23240 endif
23250 endif
23260 '"●:1.出た数字から180を引く"をlist$(0)に代入
23270 if buf_config_r =  0 then
23280 list$(0) = "●:1.出た数字から181を引く"
23290 list$(1) = " :2.出た数字から180を引いて単数変換"
23300 else
23310 list$(0) = "●:1.出た数字から180を引いて単数変換"
23320 list$(1) = " :2.出た数字から181を引く"
23330 endif
23340 list$(2) = " :トップ画面に戻る"
23350 list_num = ui_select("list$","番号を選んでください")
23360 play ""
23370 Select case (list_num)
23380 case 0:
23390 if buf$ = "1" then
23400 buf_config_r = 0:
23410 'データーを変更したのでファイルを削除
23420 kill System$
23430 'ファイルを新しく作成
23440 open System$ for output as #1
23450 print #1,"config_r=0"
23460 close #1
23470 ui_msg "設定を変更しました。"
23480 else
23490 'if buf$ = "0" then
23500 'buf_config_r = 1
23510 'kill System$
23520 'open Syetem$ for output as #1
23530 'print #1,"config_r=1"
23540 'close #1
23550 'ui_msg "設定を変更しました"
23560 'endif
23570 endif
23580 goto config_moji2:
23590 case 1:
23600 if buf$ = "0" then
23610 buf_config_r = 1:
23620 'データーを変更したので、ファイルを削除
23630 kill System$
23640 'ファイルを新しく作成
23650 open System$ for output as #1
23660 print #1,"config_r=1"
23670 close #1
23680 ui_msg "設定を変更しました"
23690 else
23700 kill System$
23710 if buf$ = "1" then
23720 open System$ for output as #1
23730 print #1,"config_r=0"
23740 close #1
23750 ui_msg "設定を変更しました"
23760 endif
23770 endif
23780 goto config_moji2:
23790 case 2:
23800 'トップ画面に飛ぶ
23810 goto TopScreen:
23820 case 3:
23830 'プログラムを終了する
23840 cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
23850 end select
23860 '単数変換
23870 Func Single_Complate(num)
23880 '1.出てきた数字から180を引く
23890 a = num - 180
23900 'a:10〜99
23910 Re1:
23920 if (a > 9 and a < 100) then
23930 b1 = fix(a / 10)
23940 b2 = 10 * a - b1
23950 d1 = b1 + b2
23960 if c > 9 then
23970 goto Re1:
23980 else
23990 c = d1:goto Re2:
24000 endif
24010 endif
24020 Re2:
24030 buffer = c
24040 endfunc buffer
24050 Func Surei_Result_Save_File()
24060 'ファイルがないとき
24070 if dir$(SAVE_DATA1$) = "" then
24080 open SAVE_DATA1$ for output as #1
24090 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
24100 close #1
24110 ui_msg "保存しました":talk "保存しました":goto Surei_Result:
24120 else
24130 open SAVE_DATA1$ for append as #1
24140 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
24150 close #1
24160 ui_msg "保存しました":talk "保存しました":goto Surei_Result
24170 endif
24180 endfunc
24190 '言語設定
24200 Setting_Language:
24210 cls 3:screen 1,1,1,1:No=2
24220 select case device_No
24230 case 1:
24240 gload Gazo$ + "Screen1.png",0,0,0
24250 gload Gazo$ + "downscreen.png",0,0,800
24260 case 2:
24270 gload Gazo$ + "Screen1.png",0,0,0
24280 end select
24290 init "Kb:4"
24300 sp_on 1,1:sp_on 0,0
24310 sp_put 0,(0,300),0,0
24320 sp_put 1,(0,400),1,0
24330 color rgb(0,0,255)
24340 'print "番号を選んでください"+chr$(13)
24350 'if lang_flag=0 then
24360 'print "言語設定:日本語"+chr$(13)
24370 'else
24380 'print "言語設定:英 語"+chr$(13)
24390 Change_Language:
24400 if lang_flag = 1 then
24410 cls
24420 print "It has changed Language"+chr$(13)
24430 color rgb(255,255,255)
24440 print "Select the Number"+chr$(13)
24450 print " :1.English → Japanse"+chr$(13)
24460 print " :2.It goes to TopScreen"+chr$(13)
24470 print "Language:In English" +chr$(13)
24480 else
24490 cls:color rgb(255,255,255)
24500 print "設定変更(言語の変更)" + chr$(13)
24510 color rgb(255,255,255)
24520 print chr$(13)
24530 print "番号を選んでください"+chr$(13)
24540 print " :1.日本語 → 英語に変更" + chr$(13)
24550 print " :2.トップ画面に戻る" + chr$(13)
24560 print chr$(13)
24570 print "設定言語:日本語" + chr$(13)
24580 endif
24590 color rgb(0,0,0)
24600 locate 0,15:print "                                       ":locate 0,15:print " 2.トップ画面に戻る　を選択" + chr$(13)
24610 Setting_Language_key:
24620 y=0:key$="":bg=0
24630 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y<> -1 and bg<> 2)
24640 y=stick(1)
24650 key$=inkey$
24660 bg=strig(1)
24670 pause 2
24680 wend
24690 '選択肢変更
24700 if ((y=1) or (y=-1)) then
24710 select case No
24720 case 2:
24730 '実装部分　ここから
24740 pause 200:No=1:sp_on 0,1:sp_on 1,0:locate 0,15:print "                                                         ":locate 0,15:print " 1.日本語 → 英語に変更を選択": goto Setting_Language_key:
24750 '実装部分　ここまで
24760 case 1:
24770 pause 200: No=2:sp_on 0,0:sp_on 1,1:locate 0,15:print "                                                       ":locate 0,15:print " 2.トップ画面に戻る を選択":goto Setting_Language_key:
24780 end select
24790 endif
24800 'Enter Key  決定ボタン
24810 if ((key$=chr$(13)) or (bg=2)) then
24820 select case No
24830 case 2:
24840 sp_on 0,0:sp_on 1,0:goto TopScreen:
24850 case 1:                                                     'lang_flag=1:sp_on 0,0:sp_on 1,0:goto Change_Language:
24860 '
24870 '未実装　ここから
24880 sp_on 0,1:sp_on 1,0:ui_msg "この機能は未実装です":goto Setting_Language_key:
24890 '
24900 '未実装　ここまで
24910 end select
24920 endif
24930 '配列削除
24940 buffer_clear:
24950 erase bufline$
24960 erase bufcount$
24970 erase bufcount1$
24980 erase bufcount2$
24990 erase bufline2$
25000 erase bufline3$
25010 erase bufKaztama$
25020 erase List$
25030 erase Result_Menu_List$
25040 erase list$
25050 erase moji_List$
25060 'ui_msg "メモリーをクリアしました"
25070 return
25080 '配列削除　ここまで
25090 File_Device_Set:
25100 'Device 選択　書き込み
25110 open Device_type$  for output as #1
25120 print #1,device_No
25130 close #1
25140 ui_msg "ファイルを書き込みました"
25150 return
25160 Input_numbertokazutama:
25170 cls 3:init "kb:2"
25180 select case (device_No)
25190 case  1:
25200     gload Gazo$ + "Input_numbertokazutama.png",0,0,0
25210     gload Gazo$ + "Input_numbertokazutama2.png",0,0,380
25220 case 2:
25230     gload Gazo$ + "Input_numbertokazutama.png",0,0,0
25240 end select
25250 color rgb(255,255,255):locate 1,4:print "調べたい数霊の番号を入れてください"+chr$(13);"(Max:181)"
25260 color rgb(0,0,0):locate 1,7:Input "番号:",num
25270 if (num > 181) then ui_msg"181までの数字で入れ直してください":goto Input_numbertokazutama:
25280 pause 200
25290 for i=0 to 181+3-1
25300 if i = num then
25310 buffer$ = bufline2$(i+4,1)
25320 talk buffer$
25330 goto Numbertokazutama:
25340 endif
25350 next i
25360 'goto Numbertokazutama:
25370 '
25380 '
25390 Numbertokazutama:
25400 cls 3:init "kb:4":bg=0:key$=""
25410 select case (device_No)
25420 case 1:
25430 gload Gazo$ + "Result_numbertokazutama.png",0,0,0
25440 gload Gazo$ + "downscreen.png",0,0,800
25450 case 2:
25460 gload Gazo$ + "Result_numbertokazutama.png",0,0,0
25470 end select
25480 font 32+16:color rgb(255,255,255)
25490 locate 1,3:print "◎数霊番号:";num;chr$(13)
25500 locate 1,4:print "◎数霊の説明"+chr$(13)
25510 if ((len(buffer$) > 21) and (len(buffer$) <= 45)) then
25520 buffer2$ = Mid$(buffer$,1,20)
25530 buffer3$ = Mid$(buffer$,21,len(buffer$)-20)
25540 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13)
25550 else
25560 if (len(buffer$) < 22) then
25570 buffer2$ = Mid$(buffer$,1,21)
25580 buffer$ = buffer2$ + chr$(13)
25590 else
25600 if ((Len(buffer$) > 45) and (len(buffer$) < 66)) then
25610 buffer2$ = Mid$(buffer$,1,20)
25620 buffer3$ = Mid$(buffer$,20,21)
25630 buffer4$ = Mid$(buffer$,41,len(buffer$)-41)
25640 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13)
25650 endif
25660 endif
25670 endif
25680 locate 1,5:print buffer$
25690 color rgb(0,0,0)
25700 locate 1,14:print "ジョイパッドの右を押してください"+chr$(13)
25710 while ((bg <> 2) and (key$ <> chr$(13)))
25720 bg=strig(1)
25730 key$=inkey$
25740 pause 2
25750 wend
25760 if ((bg = 2) or (key$ = chr$(13))) then
25770 goto TopScreen:
25780 endif
25790 data_initialize:
25800 cls 3
25810 select case device_No
25820 case 1:
25830 gload Gazo$ + "Data_initializeScreen.png",0,0,0
25840 gload Gazo$ + "downscreen.png",0,0,800
25850 case 2:
25860 gload Gazo$ + "Data_initializeScreen.png",0,0,0
25870 end select
25880 color rgb(255,255,255):font 48:init "kb:4":No=1:sp_on 1,1:sp_put 1,(5,300),0,0
25890 locate 0,4:print "番号を選んでください"+chr$(13)
25900 print " :1.メンバーリストの初期化" + chr$(13)
25910 print " :2.デバイスの初期化" + chr$(13)
25920 print " :3.トップ画面に行く"+chr$(13)
25930 locate 0,15:color rgb(0,0,0):print " 1.メンバーリストの初期化を選択"
25940 data_initialize2:
25950 y = 0:key$ = "":bg = 0
25960 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
25970 y = stick(1)
25980 key$ = inkey$
25990 bg = strig(1)
26000 pause 2
26010 wend
26020 'y = -1:ジョイパッドの上
26030 'y = 1:ジョイパッド下
26040 'key$ = chr$(13):Enter key
26050 'key$ = chr$(30):カーソル上
26060 'key$ = chr$(31):カーソル下
26070 if ((y = -1) or (key$ = chr$(30))) then
26080 select case No
26090 case 1:
26100  sp_on 1,0:sp_on 2,0:sp_on 0,1:sp_on 3,0:No=0:sp_put 0,(5,500),0,0:locate 0,15:print "                                       ":locate 0,15:print " 3.トップ画面に行くを選択":pause 200:goto data_initialize2:
26110 case 2:
26120 sp_on 1,1:sp_on 2,0:sp_on 0,0:sp_on 3,0:No=1:sp_put 1,(5,300),0,0:locate 0,15:print "                                      ":pause 200:locate 0,15:print " 1.メンバーリストの初期化を選択":goto data_initialize2:
26130 case 0:
26140 sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_on 0,0:sp_put 2,(5,400),0,0:locate 0,15:print "                                      ":pause 200:locate 0,15:print " 2.デバイスの初期化を選択":No=2:goto data_initialize2:
26150 end select
26160 endif
26170 'bg=2:Enter key
26180 if ((bg = 2) or (key$ = chr$(13))) then
26190 select case No
26200 case 0:
26210 sp_on 0,0:sp_on 1,0:sp_on 2,0:pause 200:goto TopScreen:
26220 case 1:
26230 'メンバーリストの初期化トップへ行く
26240 sp_on 0,0:sp_on 1,0:sp_on 2,0:pause 200:goto member_initializeTop:
26250 case 2:
26260 ui_msg "未実装です":goto data_initialize2:
26270 end select
26280 endif
26290 'カーソルの下　または、ジョイパッド下
26300 if ((y = 1) or (key$ = chr$(31))) then
26310 select case No
26320 case 1:
26330 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                          ":locate 0,15:print " 2.デバイスの初期化を選択":goto data_initialize2:
26340 case 2:
26350 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:No=0:locate 0,15:print "                                                          ":locate 0,15:print " 3.トップ画面に行くを選択":goto data_initialize2:
26360 case 0:
26370 sp_on 0,0:sp_on 1,1:sp_on 2,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                                          ":locate 0,15:print " 1.メンバーリストの初期化を選択":goto data_initialize2:
26380 end select
26390 endif
26400 'メンバーリストの初期化トップ
26410 member_initializeTop:
26420 cls 3
26430 select case (device_No)
26440 case 1:
26450 gload Gazo$ + "member_initializeTop.png",0,0,0
26460 gload Gazo$ + "downscreen.png",0,0,800
26470 case 2:
26480 gload Gazo$ + "member_initializeTop.png",0,0,0
26490 end select
26500 No=0:init "kb:4":color rgb(255,255,255):font 48
26510 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,500),0,0
26520 locate 0,4:print  "番号を選んでください"+chr$(13)
26530 print " :1.メンバーリストを初期化する" + chr$(13)
26540 print " :2.バックアップを取る" + chr$(13)
26550 print " :3.トップ画面に戻る"+chr$(13)
26560 color rgb(0,0,0):locate 0,15:print "                                       ":locate 0,15:print " 3.トップ画面に戻るを選択"
26570 member_list2:
26580 y=0:key$="":bg=0
26590 while ((key$ <> chr$(13)) and (y <> 1) and (y <> -1) and (bg <> 2))
26600 y = stick(1)
26610 key$ = inkey$
26620 bg = strig(1)
26630 pause 2
26640 wend
26650 'bg=2,chr$(13):決定ボタン
26660 if ((bg = 2) or (key$ = chr$(13)))  then
26670 select case No
26680 case 1:
26690 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Member_List_DeleteScreen:
26700 case 2:
26710 ui_msg"未実装です":goto member_list2:
26720 case 0:
26730 '3:トップ画面に戻る
26740 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
26750 end select
26760 endif
26770 'y=1:chr$(31):ジョイパッド　下　又は　カーソルの下
26780 if ((y = 1) or (key$ = chr$(31))) then
26790 select case No
26800 case 0:
26810 sp_on 1,1:sp_on 2,0:sp_on 0,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 1.メンバーリストを初期化するを選択":goto member_list2:
26820 case 1:
26830 sp_on 0,0:sp_on 2,1:sp_on 1,0:No=2:sp_put 2,(5,400),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 2.バックアップを取るを選択":goto member_list2:
26840 case 2:
26850 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:locate 0,15:print "                                       ":locate 0,15:print " 3.トップ画面に行くを選択":goto member_list2:
26860 end select
26870 endif
26880 'Joypad  or カーソル　上
26890 if ((y=-1) or (key$=chr$(30))) then
26900 select case No
26910 case 0:
26920 sp_on 2,1:sp_on 1,0:sp_on 0,0:No=2:sp_put 2,(5,400),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 2.バックアップを取るを選択":goto member_list2:
26930 case 1:
26940 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto member_list2:
26950 case 2:
26960 sp_on 0,0:sp_on 1,1:sp_on 2,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 1.メンバーリストを初期化をする選択":goto member_list2:
26970 end select
26980 endif
26990 Member_List_DeleteScreen:
27000 cls:key$ = "":bg = 0:y=0:init "kb:4":font 48:count=0
27010 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
27020 if dir$(SAVE_DATA1$) = "" then
27030 'ファイルがないとき
27040 color rgb(255,255,255)
27050 locate 0,4
27060 print "データーファイルは、存在しません。"
27070 locate 0,15:color rgb(0,0,0):print "ジョイパッドの右を押してください":
27080 'endif
27090 while ((key$ <> chr$(13)) and (bg <> 2) and (y <> 1) and (y <> -1))
27100 key$ = inkey$
27110 bg = strig(1)
27120 y = stick(1)
27130 pause 2
27140 wend
27150 if ((key$ = chr$(13)) or (bg = 2)) then goto TopScreen:
27160 'goto TopScreen:
27170 'endif
27180 else
27190 'ファイルが有るとき
27200 'default
27210 'No=1:ファイルを削除する
27220 'No=2:トップ画面に戻る
27230 No=2
27240 sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0
27250 color rgb(255,255,255)
27260 locate 0,4:print"番号を選んでください"+chr$(13)
27270 print " :1.ファイルを削除する"+chr$(13)
27280 print " :2.トップ画面に戻る"+chr$(13)
27290 color rgb(0,0,0):
27300 locate 0,15:print"                                      ":locate 0,15:print " 2.トップ画面に戻るを選択"
27310 endif
27320 Select_key1:
27330 '初期化
27340 y=0:key$="":bg=0
27350 while ((key$ <> chr$(13)) and (bg <> 2) and (y <> 1) and (y <> -1))
27360 key$ = inkey$
27370 bg = strig(1)
27380 y = stick(1)
27390 pause 2
27400 wend
27410 '1.選択キー
27420 '十字キー 上 y=-1
27430 '十字キー　下 y=1
27440 if ((y = 1) or (y = -1)) then
27450 select case No
27460 case 2:
27470 No=1:sp_on 2,0:sp_on 1,1:sp_put 1,(5,300),0,0:locate 0,15:print "                                                                                ":locate 0,15:print " 1．ファイルを削除":pause 200:goto Select_key1:
27480 case 1:
27490 No=2:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:locate 0,15:print "                                                          ":locate 0,15:print " 2.トップ画面に戻るを選択":pause 200:goto Select_key1:
27500 end select
27510 endif
27520 '2.決定ボタン
27530 'Joypad　右 or Enter key
27540 if ((bg=2) or (key$=chr$(13))) then
27550 Select case No
27560 case 2:
27570 sp_on 1,0:sp_on 2,0:pause 200:goto TopScreen:
27580 case 1:
27590 if (count=0) then
27600 kill SAVE_DATA1$:ui_msg"メンバーリストを削除しました":pause 200:locate 0,15:print "                                       ":locate 0,15:print " ジョイパッドの右を押してください":count=count+1:goto Select_key1:
27610 else
27620 sp_on 1,0:sp_on 2,0:goto TopScreen
27630 endif
27640 end select
27650 endif
