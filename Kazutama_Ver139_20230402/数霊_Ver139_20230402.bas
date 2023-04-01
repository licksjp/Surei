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
570 'Version 1.3.9_2023.03.26-2023.04.02(Release):正式版
580 '現在のバージョン
590 Version$ = "1.3.9_2023.04.02(正式版)"
600 'csvファイル 1.数霊 ベースファイル
610 FILE_csv$ = "./data/Kazutama.csv"
620 'csvファイル 2.数霊 ベースファイル 2
630 FILE_csv2$ = "./data/Surei_chart_20211207.csv"
640 'Save ファイル
650 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
660 'gazo ファイル
670 Gazo$ = "./data/Gazo/"
680 'System フォルダ:設定ファイルを保存するところ
690 System$ = "./data/System/config.sys"
700 'Device type:デバイスタイプのファイルチェック
710 Device_type$ = "./data/device_type.sys"
720 '設定ファイル名:config.sys
730 'Sound File(Voice)
740 '1.ボイス TopScreen
750 Voice_File_TopScreen$ = "./data/Sound_data/"
760 'Message
770 buf_finish_Message$ = "メモリーを解放してプログラムを終了します"
780 '変数領域
790 'vcount:バーチャルパッド下の変数
800 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
810 count2 = 0:N=0:N2=0:m2 = 0:device_No=0:device_type=0
820 dim list$(4),moji_List$(2)
830 'ファイルの有無チェック
840 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
850 '1.ファイルが無いとき
860 cls :print "依存ファイルが見つかりません":
870 print "エンターキーを押してください" + chr$(13)
880 key$ = input$(1)
890 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
900 else
910 '2.ファイルが有るとき
920 cls:print "csv:file ok." + chr$(13)
930 n=0
940 'FILE_csv$:数霊データー入力
950 open FILE_csv$ for input as #1
960 while eof(1) = 0
970 input #1,line$
980 bufline$(n) = line$
990 'Print n;chr$(13)
1000 '登録件数カウント:n
1010 n = n + 1
1020 wend
1030 close #1
1040 N=n
1050 '2つ目のファイル読み込み
1060 'n = 0
1070 open FILE_csv2$ for input as #2
1080 for n=3 to 181
1090 for i=0 to 1
1100 input #2,line$
1110 bufline2$(n,i) = line$
1120 next i
1130 next n
1140 close #2
1150 N2 = n
1160 endif
1170 '2022.11.23----------------------
1180 '端末言語のチェック
1190 '日本語端末かチェックをして日本語以外なら英語で表示する
1200 'lang flag:0:日本語 1:英語(日本語以外)
1210 '--------------------------------
1220 lang_flag = 0
1230 if ex_info$(1) <> "JP" then
1240 lang_flag = 1
1250 endif
1260 cls 3:font 48:screen 1,1,1,1:int "kb:4":init "crt:0"
1270 play ""
1280 'gload Gazo$ + "TopScreen_20230310.png",0,0,0
1290 '選択ポインター 1 - 4
1300 'スプライトの定義
1310 gload Gazo$ + "Selection.png",1,5,300
1320 gload Gazo$ + "Selection.png",1,5,400
1330 gload Gazo$ + "Selection.png",1,5,500
1340 gload Gazo$ + "Selection.png",1,5,595
1350 sp_def 0,(5,300),32,32
1360 sp_def 1,(5,400),32,32
1370 sp_def 2,(5,500),32,32
1380 sp_def 3,(5,595),32,32
1390 'File check
1400 '初回起動はここから
1410 if (dir$(Device_type$) = "") then
1420 goto Device_Select:
1430 else
1440 '
1450 '2回目以降はファイルチェックをしてトップ画面
1460 '
1470  open Device_type$ for input as #1
1480  line input #1,device_type$
1490  device_No = val(device_type$)
1500  close #1
1510  if (device_No=1 or device_No=2) then
1520  goto TopScreen:
1530  endif
1540 endif
1550 'First_Select_Screen:
1560 'タブレット　or　スマホの選択を起動時にする
1570 Device_Select:
1580 font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
1590 gload Gazo$ + "device_select_20230313.png",0,0,0
1600 init "kb:4"
1610 play ""
1620 play Voice_File_TopScreen$+"Select_device_select.mp3"
1630 'y=0:key$="":bg=0
1640 print chr$(13)+chr$(13)+chr$(13)
1650 color  rgb(255,255,255)
1660 print "番号を選んでください"+chr$(13)
1670 'print chr$(13)
1680 print " :1.スマートフォン"+chr$(13)
1690 print " :2.タブレット端末"+chr$(13)
1700 locate 0,11:No=1
1710 color rgb(0,0,0)
1720 Print " 1.スマートフォンを選択"+chr$(13)
1730 sp_on 0,1:sp_put 0,(5,300),0,0
1740 sp_on 1,0:sp_on 2,0:sp_on 3,0
1750 device_selection:
1760 y=0:key$="":bg=0:
1770 While (key$ <> chr$(30) and key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 1)
1780 y = stick(1)
1790 key$ = inkey$
1800 bg = strig(1)
1810 pause 2
1820 wend
1830 if ((y=1) or (y=-1) or (key$=chr$(30)) or (key$=chr$(31)) ) then
1840 select case No
1850 case 1:
1860       No=2:sp_on 1,1:sp_on 0,0:locate 0,11:pause 300:sp_put 1,(5,400),0,0:print "                                ":locate 0,11:print " 2.タブレット端末を選択":goto device_selection:
1870 case 2:
1880       No=1:sp_on 1,0:sp_on 0,1:pause 300:sp_put 0,(5,300),0,0:locate 0,11:print "                                   ":locate 0,11:print " 1.スマートフォンを選択":goto device_selection:
1890 end select
1900 endif
1910 '決定ボタン
1920 if ((bg=1) or (key$=chr$(13)))  then
1930 select case No
1940 case 1:
1950       sp_on 0,0:sp_on 1,0:device_No=1:gosub File_Device_Set:goto TopScreen:
1960 case 2:
1970       sp_on 0,0:sp_on 1,0:device_No=2:gosub File_Device_Set:goto TopScreen:
1980 end select
1990 endif
2000 'Top画面
2010 TopScreen:
2020 'バーチャルパッドを表示
2030 cls 3:font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
2040 'play ""
2050 play ""
2060 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
2070 'gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
2080 select case device_No
2090 case 1:
2100 'Top画面の背景画像
2110 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2120 gload Gazo$ + "downscreen.png",0,0,800
2130 case 2:
2140 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2150 end select
2160 'key$=input$(1)
2170 'バーチャルパッドの背景を白にする for smartphone screen
2180 'gload Gazo$ + "downscreen.png",0,0,800
2190 '選択肢 1
2200 gload Gazo$ + "Selection.png",1,5,300
2210 '選択肢 2
2220 gload Gazo$ + "Selection.png",1,5,400
2230 '選択肢 3
2240 gload Gazo$ + "Selection.png",1,5,500
2250 '選択肢 4
2260 'TopScreen:
2270 'select case device_No
2280 'case 1:
2290 gload Gazo$ + "Selection.png",1,5,590
2300 'case 2:
2310 'gload Gazo$ +
2320 'end select
2330 color rgb(0,0,255)
2340 print chr$(13)
2350 if lang_flag = 1 then
2360 color rgb(255,255,255)
2370 print "Select Number" + chr$(13)
2380 print " :1.Kazutama check" + chr$(13)
2390 print " :2.Setting" + chr$(13)
2400 print " :3.Help" + chr$(13)
2410 print " :4.End Program" + chr$(13)
2420 color rgb(255,255,255)
2430 else
2440 color rgb(255,255,255)
2450 print chr$(13)
2460 sp_on 0,1:sp_put 0,(5,300),0,0
2470 print "番号を選んでください" + chr$(13)
2480 print " :1.数霊(かずたま)チェック" + chr$(13)
2490 print " :2.設定" + chr$(13)
2500 print " :3.ヘルプ" + chr$(13)
2510 print " :4.(プログラムを)終　了する" + chr$(13)
2520 color rgb(0,0,0)
2530 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
2540 'バーチャルパッドを表示
2550 No=1:
2560 'lang_flag:1 外国語,0:日本語
2570 if lang_flag = 1 then
2580 'lang_flag=1 英語
2590 locate 0,15:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
2600 else
2610 'lang_flag=0 日本語
2620 locate 0,15:color rgb(0,0,0):print " 1.数霊(かずたま)チェックを選択";chr$(13)
2630 endif
2640 endif
2650 'TopScreen sprite
2660 'スプライト
2670 '選択肢 1 On
2680 'sp_def 0,(5,300),32,32
2690 'sp_on 0,1
2700 'sp_put 0,(5,300),0,0
2710 '選択肢 2 Off
2720 sp_def 1,(5,400),32,32
2730 sp_on 1,0
2740 sp_put 1,(5,400),0,0
2750 '選択肢 3 Off
2760 sp_def 2,(5,500),32,32
2770 sp_on 2,0
2780 sp_put 2,(5,500),0,0
2790 '選択肢 4 Off
2800 sp_def 3,(5,600),32,32
2810 sp_on 3,0
2820 sp_put 3,(5,600),0,0
2830 color rgb(0,0,0)
2840 Main_Select:
2850 'y:バーチャルパッドの処理
2860 'key$:カーソルの処理
2870 y = 0:key$ = "":bg = 0
2880 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
2890 y = stick(1)
2900 key$ = inkey$
2910 bg = strig(1)
2920 pause 2
2930 wend
2940 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
2950 '1.バーチャルパッドの処理
2960 'バーチャルパッド下を押した時
2970 if y = 1 then
2980 select case No
2990 'No の初期値：No=1
3000 case 1:
3010 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
3020 if lang_flag = 1 then
3030 'lang_flag=1 英語
3040 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3050 else
3060 'lang_flag=0 日本語
3070 locate 0,15:print " 2.設定を選択":goto Main_Select:
3080 endif
3090 'デバッグライン　ここから
3100 '0のとき
3110 'デバッグライン　ここまで
3120 'デバッグライン　ここから
3130 'バーチャルパッド　下
3140 case 2:
3150 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:
3160 print "                                         ":
3170 if lang_flag = 1 then
3180 color rgb(0,0,0):locate 0,15:
3190 print "3.It has selected Help":No=3:goto Main_Select:
3200 else
3210 color rgb(0,0,0):locate 0,15:print "                                                         ":locate 0,15:
3220 print " 3.ヘルプを選択":No=3:goto Main_Select:
3230 endif
3240 'デバッグライン　ここまで
3250 case 3:
3260 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                               "
3270 if lang_flag = 1 then
3280 locate 0,15:print "4.It has selected finish program":No=0:goto Main_Select:
3290 else
3300 locate 0,15:print "                                                         " :locate 0,15:print " 4.(プログラムを)終了するを選択":No=0:goto Main_Select:
3310 endif
3320 'デバッグライン　ここから
3330 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
3340 'デバッグライン　ここまで
3350 case 0:
3360 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1
3370 if lang_flag = 1 then
3380 'lang_flag=1:英語
3390 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3400 else
3410 'lang_flag=0:日本語
3420 locate 0,15:print "                                      ":locate 0,15:print " 1.数霊(かずたま)チェックを選択":goto Main_Select:
3430 endif
3440 'デバッグライン　ここから
3450 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
3460 'デバッグライン　ここまで
3470 end select
3480 endif
3490 'バーチャルパッド　上 ここから
3500 if y = -1 then
3510 select case No
3520 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
3530 case 1:
3540 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                                          "
3550 'if lang_flag = 1 then
3560 'lang_flag=1 英語
3570 'locate 0,15:print "4.It has finished program":goto Main_Select:
3580 'else
3590 'lang_flag=0 日本語
3600 locate 0,15:print "                                                          ":
3610 locate 0,15:print " 4.(プログラムを)終了するを選択":goto Main_Select:
3620 'endif
3630 'endif
3640 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
3650 case 0:
3660 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":
3670 if lang_flag = 1 then
3680 '1:英語
3690 locate 0,15:print "3.It has selected Help":goto Main_Select:
3700 else
3710 '0:日本語
3720 locate 0,15:print "                                                                                        "
3730 locate 0,15:print " 3.ヘルプを選択":goto Main_Select:
3740 endif
3750 'No:3 3.Help→2.設定 No:2
3760 case 3:
3770 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      "
3780 if lang_flag = 1 then
3790 '1:英語
3800 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3810 else
3820 '0:日本語
3830 locate 0,15:print" 2.設定を選択":goto Main_Select:
3840 endif
3850 case 2:
3860 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":
3870 if lang_flag = 1 then
3880 'lang_flag 1 英語
3890 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3900 else
3910 'lang_flag 0 日本語
3920 locate 0,15:print" 1.数霊(かずたま)チェックを選択":goto Main_Select:
3930 endif
3940 end select
3950 endif
3960 if bg=1 then
3970 select case No
3980 '1.数霊チェックを選択  パッドの右キー(決定)
3990 case 1:
4000 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4010 '2.設定を選択  パッドの右キー(決定)
4020 case 2:
4030 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
4040 '3.ヘルプを選択 パッドの右(決定)
4050 case 3:
4060 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
4070 'プログラムの終了を選択(決定)
4080 case 0:
4090 cls 3:cls 4:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg buf_finish_Message$:pause 4.080*1000:color rgb(255,255,255):end
4100 'if lang_flag = 1 then
4110 'lang_flag = 1 英語
4120 'else
4130 'lang_flag = 0 日本語
4140 'endif
4150 end select
4160 '4.終了するを選択  パッドの右
4170 endif
4180 'バーチャルパッド　上　ここまで
4190 '2.カーソルの処理
4200 'カーソル　下 chr$(31)
4210 if (key$ = chr$(31)) then
4220 select case (No)
4230 '4
4240 '0 選択肢4 => 選択肢1
4250 case 0:
4260 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "              ":color rgb(0,0,0):
4270 if lang_flag = 1 then
4280 'lang flag:1 英語
4290 else
4300 'lang flag:0 日本語
4310 color rgb(0,0,0):locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4320 endif
4330 '1 選択肢1 => 選択肢2
4340 case 1:
4350 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":
4360 if lang_flag = 1 then
4370 'lang_flag:1 英語
4380 else
4390 'lang_flag:0 日本語
4400 color rgb(0,0,0):locate 0,15:print "2.設定を選択":beep:goto Main_Select:
4410 endif
4420 '2 選択肢2 => 選択肢3
4430 case 2:
4440 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,15:print "               ":
4450 if lang_flag = 1 then
4460 'lang flag:1 英語
4470 else
4480 'lang flang:0 日本語
4490 color rgb(0,0,0):locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4500 endif
4510 '3 選択肢３ => 選択肢4
4520 case 3:
4530 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,595),0,0:locate 0,15:print "               ":color rgb(0,0,0)
4540 if lang_flag = 1 then
4550 'lang_flag = 1 英語
4560 else
4570 'lang_flag = 0 日本語
4580 color rgb(0,0,0):locate 0,15:print "4.終 了を選択":goto Main_Select:
4590 endif
4600 case else:
4610 goto Main_Select:
4620 end select
4630 endif
4640 'カーソル　上
4650 if key$=chr$(30) then
4660 select case (No)
4670 '選択肢1 => 選択肢4
4680 case 1:
4690 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:PRINT "                      ":
4700 if lang_flag = 1 then
4710 'lang_flag=1:英語
4720 'print "1.It has selected Kazutama check":goto Main_Select:
4730 else
4740 'lang_flag = 0:日本語
4750 else
4760 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4770 endif
4780 '選択肢2 => 選択肢1
4790 case 2:
4800 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                 ":locate 1,15:print "2.設 定を選択":goto Main_Select:
4810 '選択肢3　=> 選択肢2
4820 case 3:
4830 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,500),0,0
4840 if lang_flag = 1 then
4850 'lang_flag = 1:英語
4860 locate 0,15:print "It has selected Help":goto Main_Select:
4870 else
4880 'lang_flag = 0:日本語
4890 locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4900 endif
4910 '選択肢4 => 選択肢3
4920 case 0:
4930 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                ":locate 1,15:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
4940 if lang_flag = 1 then
4950 'lang flag=1 英語
4960 else
4970 'lang flag=0 日本語
4980 locate 1,15:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
4990 endif
5000 end select
5010 endif
5020 'Input "番号:",No
5030 'エンターキー入力:決定
5040 if key$ = chr$(13) then
5050 select case No
5060 case 1:
5070 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
5080 case 3:
5090 Color rgb(255,255,255):goto Help:
5100 case 0:
5110 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg buf_finish_Message$:color rgb(255,255,255):pause 4.080 * 1000:end
5120 case 2:
5130 color rgb(255,255,255):sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
5140 end select
5150 endif
5160 '1-1.数霊チェック
5170 Surei_Check:
5180 cls 3:Font 48:
5190 select case device_No
5200  case 1:
5210 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5220 gload Gazo$ + "downscreen.png",0,0,800
5230 case 2:
5240 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5250 end select
5260 play ""
5270 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
5280 color rgb(255,0,0)
5290 'print "●数霊(かずたま)チェックトップ" + chr$(13)
5300 sp_on 0,1:sp_put 0,(5,300),0,0:screen 1,1,1
5310 if lang_flag = 1 then
5320 'lang_flag=1 英語
5330 else
5340 'lang_flag=0 日本語
5350 print chr$(13)+chr$(13)+chr$(13)
5360 color rgb(255,255,255)
5370 print "番号を選んでください" + chr$(13)
5380 print " :1.数霊(かずたま)1人用" + chr$(13)
5390 print " :2.数霊(かずたま)リスト 1人用　" + chr$(13)
5400 print " :3.数霊(かずたま)2人用" + chr$(13)
5410 print " :4.トップ画面に行く" + chr$(13)
5420 color rgb(0,0,0):No = 1
5430 locate 0,15:print "                                       "
5440 locate 0,15
5450 print " 1.数霊(かずたま)1人用を選択"
5460 endif
5470 Kazutama_main:
5480 'y:バーチャルパッドの処理
5490 'key$:カーソルの処理
5500 'bg:バーチャルパッドの右のボタン
5510 y = 0:key$ = "":bg=0
5520 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
5530 y = stick(1)
5540 key$ = inkey$
5550 bg=strig(1)
5560 y=stick(-1)
5570 pause 2
5580 wend
5590 'key$ = input$(1)
5600 if y = 1 then
5610 select case No
5620 'No の初期値：No=1
5630 case 2:
5640 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                       ":
5650 locate 0,15:print "                                     "
5660 locate 0,15
5670 print" 3.数霊(かずたま)2人用を選択":goto Kazutama_main:
5680 'デバッグライン　ここから
5690 '0のとき
5700 'デバッグライン　ここまで
5710 'デバッグライン　ここから
5720 case 3:
5730 sp_on 2,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_on 0,1:sp_put 0,(5,585),0,0:pause 200:locate 0,15:print "                                               "
5740 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":No=0:goto Kazutama_main:
5750 'デバッグライン　ここまで
5760 'デバッグライン　ここから
5770 'デバッグライン　ここまで
5780 case 0:
5790 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5800 case 1:
5810 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                          ":locate 0,15:print " 2.数霊（かずたま）リスト 1人用":goto Kazutama_main:
5820 'デバッグライン　ここから
5830 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
5840 'デバッグライン　ここまで
5850 end select
5860 endif
5870 'バーチャルパッド　上 ここから
5880 if y = -1 then
5890 select case No
5900 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
5910 case 1:
5920 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 0,15:print" 4.トップ画面に行くを選択":goto Kazutama_main:
5930 'No:3 3.Help→2.設定 No:2
5940 case 0:
5950 sp_on 1,0:sp_on 0,0:sp_on 3,1:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                     ":locate 0,15:print" 3.数霊（かずたま）2人用を選択":goto Kazutama_main:
5960 case 2:
5970 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                    ":locate 0,15:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5980 case 3:
5990 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                               ":locate 0,15:print "2.数霊(かずたま)リスト1人用を選択":goto Kazutama_main:
6000 end select
6010 endif
6020 if bg=1 then
6030 select case No
6040 '1.数霊チェックを選択  パッドの右キー
6050 case 1:
6060 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
6070 '2.数霊チェック2人用   パッドの右キー
6080 case 3:
6090 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
6100 '3.トップ画面に行く パッドの右
6110 case 0:
6120 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
6130 '2.数霊リスト1人用 パッドの右キー
6140 case 2:
6150 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_List1:
6160 'プログラムの終了を選択
6170 end select
6180 '4.終了するを選択  パッドの右
6190 endif
6200 'バーチャルパッド　上　ここまで
6210 if key$ = chr$(31) then
6220 select case No
6230 case 0:
6240 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,15:print "                                                          ":
6250 if lang_flag = 1 then
6260 Else
6270 locate 0,15:print "                                      "
6280 No=2:locate 0,15:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
6290 endif
6300 case 1:
6310 No=0:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,585),0,0:locate 0,12:print "                                                          ":
6320 if lang_flag = 1 then
6330 Else
6340 locate 0,15:print"                                      "
6350 locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
6360 endif
6370 case 2:
6380 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                      ":
6390 if lang_flag = 1 then
6400 Else
6410 No=1:locate 0,15:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
6420 endif
6430 end select
6440 endif
6450 if key$=chr$(13) then
6460 select case No
6470 case 1:
6480 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
6490 case 2:
6500 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
6510 case 3:
6520 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
6530 '終了はトップメニューのみにする
6540 end select
6550 endif
6560 '前の画面に戻る
6570 'プログラムの終了
6580 '1人用
6590 '2人用
6600 '数霊(かずたま) 文字入力  1人用
6610 Surei_Input:
6620 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
6630 if mode = 0 then
6640 cls 3:font 32:init"kb:2"
6650 gload Gazo$ + "InputKotodama_20230131.png"
6660 play""
6670 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
6680 color rgb(255,0,0)
6690 if lang_flag=1 then
6700 '英語
6710 else
6720 print chr$(13)+chr$(13)+chr$(13)
6730 color rgb(255,255,255)
6740 print "文字を入れてください" + chr$(13)
6750 color rgb(255,255,255)
6760 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
6770 print chr$(13)
6780 color rgb(0,0,0)
6790 Input "入力文字:",buffer_moji$
6800 if buffer_moji$ = "" then
6810 ui_msg "未入力です":goto Surei_Input:
6820 else
6830 goto Surei_Result:
6840 endif
6850 endif
6860 endif
6870 if mode = 1 then
6880 cls 3:Font 32:
6890 gload Gazo$ + "InputKotodama.png"
6900 color rgb(255,0,0)
6910 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
6920 color rgb(255,255,255)
6930 print "文字を入れてください" + chr$(13)
6940 color rgb(255,0,0)
6950 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
6960 print "大文字のみ)" + chr$(13)
6970 color rgb(0,0,0)
6980 Input "文字入力:",buffer_moji2$
6990 goto Surei_Result3:
7000 'endif
7010 endif
7020 '数霊(かずたま)文字入力　2人用
7030 Surei_twoParson:
7040 cls 3:Font 32:init"kb:2"
7050 gload Gazo$ + "InputKotodama_20230131.png"
7060 '1人目入力
7070 if lang_flag = 1 then
7080 else
7090 print ""+chr$(13)+chr$(13)+chr$(13)
7100 color rgb(255,255,255)
7110 print "1人目の文字を入れてください" + chr$(13)
7120 color rgb(255,255,255)
7130 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
7140 color rgb(0,0,0)
7150 print chr$(13)
7160 Input "1人目文字入力:",buf_Parson1$
7170 endif
7180 Surei_twoParson2:
7190 cls 3:Font 32:init"kb:2"
7200 '2人目入力
7210 gload Gazo$ + "InputKotodama_20230131.png"
7220 if lang_falg = 1 then
7230 else
7240 print ""+chr$(13)+chr$(13)+chr$(13)
7250 color rgb(255,255,255)
7260 print "2人目の文字を入れてください" + chr$(13)
7270 color rgb(255,255,255)
7280 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
7290 color rgb(0,0,0)
7300 Input "2人目の文字入力:",buf_Parson2$
7310 goto Surei_Result2:
7320 endif
7330 '数霊　計算 パート
7340 '文字の計算関数
7350 'moji$:1文字を入れる
7360 func Complate(moji$)
7370 for n = 1 to 116
7380 if moji$ = bufline$(2*n) then
7390 buffcount = val(bufline$(2 * n + 1))
7400 endif
7410 next n
7420 endfunc buffcount
7430 '数霊　結果表示
7440 Surei_Result:
7450 cls 3:Font 32
7460 'ゼロカウント:zcount
7470 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
7480 '例 アカい:"い"の文字は無効な文字なので、はじく
7490 zcount=0
7500 'mojicount:入力文字数
7510 mojicount = len(buffer_moji$)
7520 for n=1 to mojicount
7530 for j=1 to 118
7540 if (bufcount$(n - 1) = bufline$(2 * j)) then
7550 bufcount$(n-1) = Mid$(buffer_moji$,n,1)
7560 endif
7570 next j
7580 next n
7590 ncount=0:count=0
7600 for i = 1 to mojicount
7610 bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7620 'ンのカウント
7630 if (bufcount$(i-1) = "ン") then ncount = ncount + 1
7640 next i
7650 if (ncount > 0) then
7660 'Listを表示する
7670 moji_List$(0) = "この単語は目に見える物です"
7680 moji_List$(1) = "この単語は目に見えない物です"
7690 num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
7700 if (num2 = 0) then
7710 else
7720 if (num2 = 1) then
7730 n1 = 9 * ncount
7740 endif
7750 endif
7760 endif
7770 for j=1 to mojicount
7780 bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7790 count = count + Complate(bufcount$(j - 1))
7800 next j
7810 count = count + n1
7820 if (ncount > 0) then count = count
7830 '182以上のとき,181を引く
7840 if buf_cofig_r = 0 then
7850 if (count > 181) then
7860 count = count - 181
7870 else
7880 if (buf_config_r = 1) then
7890 buf_count = Single_Complate(count)
7900 endif
7910 endif
7920 endif
7930 cls 3:Font 48+16
7940 gload Gazo$ + "Result_Screen3_20230319.png"
7950 if buf_config_r = 1 then
7960 print "入力文字:" + buffer_moji$ + chr$(13)
7970 print "数霊(かずたま):";buf_count;chr$(13)
7980 endif
7990 if lang_flag = 1 then
8000 else
8010 color rgb(255,0,0)
8020 print "入力文字:" + buffer_moji$ + chr$(13)
8030 endif
8040 if lang_flag = 1 then
8050 else
8060 color rgb(0,0,255)
8070 print "数霊(かずたま):";count;chr$(13)
8080 endif
8090 if lang_flag = 1 then
8100 else
8110 color rgb(0,0,0)
8120 print "エンター or スペース" + chr$(13)
8130 print  chr$(13)
8140 'endif
8150 endif
8160 key$ = input$(1)
8170 if ((key$ = chr$(13)) or (key$=" ")) then
8180 List$(0)="1.もう一度数霊を見る"
8190 List$(1)="2.トップ画面に行く"
8200 List$(2)="3.この数霊の説明を見る"
8210 List$(3)="4.数霊データーを保存"
8220 num=ui_select("List$","番号を選んでください")
8230 select case num
8240 case 0:
8250 goto Surei_Input:
8260 case 1:
8270 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
8280 for i=0 to 9
8290 bufcount$(i)=""
8300 next i
8310 goto TopScreen:
8320 case 2:
8330 goto Surei_Result4:
8340 case 3:
8350 s=Surei_Result_Save_File()
8360 ui_msg "保存しました"
8370 case -1:
8380 'goto Surei_Result:
8390 case else:
8400 goto Surei_Result:
8410 end select
8420 'ファイルを保存する
8430 else
8440 goto Surei_Result:
8450 endif
8460 '3-1 バージョン情報
8470 Version:
8480 cls 3:Font 32
8490 select case device_No
8500 case 1:
8510 gload Gazo$ + "Screen1_Version.png"
8520 gload Gazo$ + "downscreen.png",0,0,800
8530 case 2:
8540 gload Gazo$ + "Screen1_version.png"
8550 end select
8560 play ""
8570 play Voice_File_TopScreen$ + "Voice_Version.mp3"
8580 color rgb(255,0,0)
8590 print chr$(13)
8600 color rgb(255,255,255)
8610 if lang_flag = 1 then
8620 else
8630 print chr$(13)+chr$(13)+chr$(13)
8640 print "Ver:";Version$ + chr$(13)
8650 print "アプリ名:数霊計算機" + chr$(13)
8660 print "Basic for Android Runtime" + chr$(13)
8670 print "Author:licksjp" + chr$(13)
8680 print "制作開始:2021.7.28" + chr$(13)
8690 print chr$(13)
8700 print "(C)Copy right licksjp " + chr$(13)
8710 print "All rights reserved" + chr$(13)
8720 print chr$(13)
8730 color rgb(0,0,0)
8740 print "パッドの右を押してください" + chr$(13)
8750 endif
8760 bg=0:key$=""
8770 while (bg <> 1 and key$ <> chr$(13))
8780 bg = strig(1)
8790 key$ = inkey$
8800 pause 2
8810 wend
8820 if key$ = chr$(13) then
8830 goto TopScreen:
8840 else
8850 if bg=1 then
8860 goto TopScreen:
8870 else
8880 if lang_flag = 1 then
8890 else
8900 talk "無効なキーです":goto Version:
8910 endif
8920 endif
8930 endif
8940 '3-2 参考文献
8950 Reference_Book:
8960 cls 3:Font 48:play""
8970 select case device_No
8980 case 1:
8990 gload Gazo$ + "Screen1_Reference.png"
9000 gload Gazo$ + "downscreen.png",0,0,800
9010 case 2:
9020 gload Gazo$ + "Screen1_Reference.png"
9030 end select
9040 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
9050 color rgb(255,0,0)
9060 print chr$(13)+chr$(13)
9070 if lang_flag = 1 then
9080 else
9090 color rgb(255,255,255)
9100 print "書名:数霊" + chr$(13)
9110 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
9120 print "出版社:徳間書店" + chr$(13)
9130 print "ISBN:978-4-19-" + chr$(13)
9140 print "         865309-5" + chr$(13)
9150 print "定価:2300円 + 税" + chr$(13)
9160 color rgb(0,0,0)
9170 print "パッドの右を押してください"
9180 endif
9190 bg = 0:key$ = ""
9200 while (bg <> 1 and key$ <> chr$(13))
9210 bg = strig(1)
9220 key$ = inkey$
9230 pause 2
9240 wend
9250 if key$ = chr$(13) then
9260 goto TopScreen:
9270 else
9280 if bg = 1 then
9290 goto TopScreen:
9300 else
9310 talk "無効なキーです":goto Reference_Book:
9320 endif
9330 endif
9340 'ヘルプ画面　トップ画面
9350 Help:
9360 No=1:c=0
9370 play ""
9380 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
9390 cls 3:Font 48:
9400 select case device_No
9410 case 1:
9420 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9430 gload Gazo$ + "downscreen.png",0,0,800
9440 case 2:
9450 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9460 end select
9470 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0
9480 color rgb(255,0,0)
9490 print chr$(13)+chr$(13)+chr$(13)
9500 color rgb(255,255,255)
9510 print "番号を選んでください" + chr$(13)
9520 print " :1.バージョン" + chr$(13)
9530 print " :2.参考文献" + chr$(13)
9540 print " :3.トップ画面に行く" + chr$(13)
9550 color rgb(0,0,0)
9560 locate 0,15:print "                                     "
9570 if No = 1 then locate 0,15:print " 1.バージョンを選択"
9580 'y:バーチャルパッドの処理
9590 'key$:カーソルの処理
9600 'bg:バーチャルパッドの右ボタン
9610 Help_key:
9620 y = 0:key$ = "":bg=0
9630 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
9640 y = stick(1)
9650 key$ = inkey$
9660 bg=strig(1)
9670 pause 2
9680 wend
9690 'バーチャルパッド　ここから'
9700 if y = 1 then
9710 select case No
9720 'No の初期値：No=1
9730 case 1:
9740 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
9750 if lang_flag = 1 then
9760 else
9770 locate 0,15:print" 2.参考文献を選択":goto Help_key:
9780 endif
9790 'デバッグライン　ここから
9800 '0のとき
9810 'デバッグライン　ここまで
9820 'デバッグライン　ここから
9830 case 2:
9840 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                  "
9850 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に行くを選択":No=0:goto Help_key:
9860 'デバッグライン　ここまで
9870 'デバッグライン　ここから
9880 'デバッグライン　ここまで
9890 case 0:
9900 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
9910 'デバッグライン　ここから
9920 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
9930 'デバッグライン　ここまで
9940 end select
9950 endif
9960 'バーチャルパッド　上 ここから
9970 if y = -1 then
9980 select case No
9990 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
10000 case 1:
10010 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=0:locate 0,15:print"                                       ":locate 0,15:print" 3.トップ画面に行くを選択":goto Help_key
10020 'No:3 3.Help→2.設定 No:2
10030 case 0:
10040 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
10050 case 2:
10060 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                     ":locate 0,15:print" 1.バージョンを選択":goto Help_key:
10070 end select
10080 endif
10090 if bg = 1 then
10100 select case No
10110 '1.数霊チェックを選択  パッドの右キー
10120 case 1:
10130 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
10140 '2.設定を選択    パッドの右キー
10150 case 2:
10160 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
10170 '3.ヘルプを選択 パッドの右
10180 case 0:
10190 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
10200 'プログラムの終了を選択
10210 'if lang_flag = 1 then
10220 'lang_flag = 1:英語
10230 'Else
10240 'lang_flag = 0:日本語
10250 'endif
10260 end select
10270 '4.終了するを選択  パッドの右
10280 endif
10290 'バーチャルパッド　上　ここまで
10300 'バーチャルパッド　ここまで'
10310 'key$ = input$(1)
10320 'カーソルの下
10330 if key$ = chr$(31) then
10340 select case (No Mod 4)
10350 'バージョンから参考文献
10360 case 0:
10370 c=1:No=c:locate 0,15:Print "             ":locate 0,15:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
10380 '参考文献からトップ画面
10390 case 1:
10400 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "            ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10410 'トップ画面から終了
10420 '終了からバージョン
10430 case 2:
10440 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                     ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10450 case else:
10460 goto Help_key:
10470 end select
10480 endif
10490 'カーソル　上
10500 if key$ = chr$(30) then
10510 select case (c Mod 4)
10520 'バージョンから終了
10530 case 0:
10540 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:locate 0,15:print "                   ":locate 0,15:print " 4.終 了を選択":goto Help_key:
10550 '参考文献からバージョン
10560 case 1:
10570 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                   ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10580 'トップ画面から参考文献
10590 case 2:
10600 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":locate 0,15:print " 2.参考文献を選択":goto Help_key:
10610 '終了からトップ画面を選択
10620 case 3:
10630 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print"                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10640 case else:
10650 goto Help_key:
10660 end select
10670 endif
10680 'エンターキー：決定
10690 if key$=chr$(13) then
10700 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10710 if No=0 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10720 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10730 else
10740 goto Help_key:
10750 endif
10760 '登録文字の確認
10770 '文字を1文字入れて登録されているか調べるメニュー
10780 '設定項目
10790 Setting:
10800 cls 3:Font 48
10810 select case device_No
10820 case 1:
10830 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
10840 gload Gazo$ + "downscreen.png",0,0,800
10850  case 2:
10860 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
10870 end select
10880 play ""
10890 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
10900 No=1
10910 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:
10920 color rgb(0,0,255)
10930 print chr$(13)
10940 if lang_flag = 1 then
10950 'lang_flag = 1:英語
10960 else
10970 'lang_flag = 0:日本語
10980 color rgb(255,255,255)
10990 print chr$(13)
11000 print "番号を選んでください" + chr$(13)
11010 '-------コメント----------------
11020 'print " :1.登録文字の確認" + chr$(13)
11030 'print " :2.数霊文字確認" + chr$(13)
11040 '-------コメント----------------
11050 'print chr$(13)
11060 print " :1.文字の項目" + chr$(13)
11070 print " :2.結果表示設定" + chr$(13)
11080 print " :3.言語設定" + chr$(13)
11090 print " :4.トップ画面に行く" + chr$(13)
11100 endif
11110 color rgb(0,0,0)
11120 locate 0,15
11130 if No=1 then locate 0,15:print  "                                     ":locate 0,15:print " 1.文字の項目を選択"
11140 'y:バーチャルパッドの処理
11150 'key$:カーソルの処理
11160 'bg:バーチャルパッドの右ボタン
11170 SettingScreen:
11180 y = 0:key$ = "":bg=0
11190 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
11200 y = stick(1)
11210 key$ = inkey$
11220 bg=strig(1)
11230 pause 2
11240 wend
11250 'バーチャルパッド　ここから'
11260 'バーチャルパッド　ここから'
11270 if y = 1 then
11280 select case No
11290 'No の初期値：No=1
11300 case 1:
11310 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":color rgb(0,0,0):locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11320 'デバッグライン　ここから
11330 '0のとき
11340 'デバッグライン　ここまで
11350 'デバッグライン　ここから
11360 case 2:
11370 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                         "
11380 color rgb(0,0,0)::No=3
11390 if lang_flag = 1 then
11400 else
11410 locate 1,15:print "3.言語設定を選択":goto SettingScreen:
11420 endif
11430 'デバッグライン　ここまで
11440 case 3:
11450 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                              ":locate 1,15:print "4.トップ画面に行くを選択":No=0:goto SettingScreen:
11460 'デバッグライン　ここから
11470 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11480 'デバッグライン　ここまで
11490 case 0:
11500 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
11510 'デバッグライン　ここから
11520 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11530 'デバッグライン　ここまで
11540 end select
11550 endif
11560 'バーチャルパッド　上 ここから
11570 if y = -1 then
11580 select case No
11590 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11600 case 1:
11610 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 1,15:print"4.トップ画面に行くを選択":goto SettingScreen:
11620 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11630 case 0:
11640 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
11650 'No:3 3.Help→2.設定 No:2
11660 case 3:
11670 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.結果表示設定を選択":goto SettingScreen:
11680 case 2:
11690 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 1,15:print"1.文字の項目を選択":goto SettingScreen:
11700 end select
11710 endif
11720 if bg=1 then
11730 select case No
11740 '1.数霊チェックを選択  パッドの右キー
11750 case 1:
11760 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
11770 '2.設定を選択    パッドの右キー
11780 case 2:
11790 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
11800 '3.ヘルプを選択 パッドの右
11810 case 0:
11820 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
11830 'プログラムの終了を選択
11840 case 3:
11850 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Setting_Language:
11860 end select
11870 endif
11880 '4.終了するを選択  パッドの右
11890 'バーチャルパッド　ここまで'
11900 'カーソル下'
11910 if key$ = chr$(31) then
11920 select case (No Mod 4)
11930 '登録文字から数霊文字の確認
11940 case 1:
11950 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                     ":locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11960 '数霊文字の確認からトップ画面に行く
11970 case 2:
11980 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "                                     ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
11990 'トップ画面に行くから終了
12000 case 3:
12010 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,590),0,0:locate 0,15:print "                                       ":locate 1,15:print "4.トップ画面に行くを選択":goto SettingScreen:
12020 '終了から登録文字
12030 case 0:
12040 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
12050 end select
12060 endif
12070 'カーソル　上
12080 if key$ = chr$(30) then
12090 select case (No Mod 4)
12100 case 1:
12110 c=2:No=c:sp_on 0,1:sp_put 0,(5,300),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
12120 case 2:
12130 c=3:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
12140 case 3:
12150 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:goto SettingScreen:
12160 case 0:
12170 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,590),0,0:sp_on 0,0:goto SettingScreen:
12180 end select
12190 endif
12200 'エンターキーを押したとき
12210 if key$ = chr$(13) then
12220 if No=3 then goto Setting_Language:
12230 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
12240 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
12250 if No=0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
12260 endif
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
12460 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Moji_Search:
12470 else
12480 count=0
12490 for n = 0 to 116
12500 if bufline$(2*n) = moji$ then
12510 cls 3:font 48:init"kb:4"
12520 select case device_No
12530 case 1:
12540 gload Gazo$ + "downscreen.png",0,0,800
12550 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12560 case 2:
12570 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12580 end select
12590 play ""
12600 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12610 if lang_flag = 1 then
12620 Else
12630 print chr$(13)
12640 color rgb(255,255,255)
12650 print moji$;"は、登録されています。" + chr$(13)
12660 color rgb(0,0,0)
12670 print "ジョイパッドの右を押してください"
12680 endif
12690 bg = 0:key$ = ""
12700 while (bg <> 1 and key$ <> chr$(13))
12710 key$ = inkey$
12720 bg = strig(1)
12730 pause 2
12740 wend
12750 if key$ = chr$(13) then goto TopScreen:
12760 if bg=1 then goto TopScreen:
12770 count = count + 1
12780 endif
12790 next n
12800 if count = 0 then
12810 cls 3:font 48:init "kb:4"
12820 gload Gazo$ + "Moji_check.png"
12830 play ""
12840 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
12850 print chr$(13)
12860 if lang_flag = 1 then
12870 Else
12880 color rgb(255,255,255)
12890 print moji$;"は、登録されていません。" + chr$(13)
12900 color rgb(0,0,0)
12910 print "パッドの右を押してください" + chr$(13)
12920 endif
12930 kg = 0:key$ = ""
12940 while (kg <> 1 and key$ <> chr$(13))
12950 key$ = inkey$
12960 kg = strig(1)
12970 pause 2
12980 wend
12990 if ((key$ = chr$(13)) or (kg=1)) then goto TopScreen:
13000 endif
13010 endif
13020 Surei_Result2:
13030 cls 3:Font 48
13040 zcount1=0:zcount2=0:count1=0:count2=0
13050 '1人目
13060 mojicount1=len(buf_Parson1$)
13070 '2人目
13080 mojicount2 = len(buf_Parson2$)
13090 '1人目
13100 for n = 1 to mojicount1
13110 for j = 1 to 116
13120 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
13130 if bufcount1$(n-1) = bufline$(2*j) then
13140 zcount1 = zcount1 + 1
13150 endif
13160 next j
13170 next n
13180 '2人目
13190 for n = 1 to mojicount2
13200 for j = 1 to 116
13210 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
13220 if bufcount2$(n-1) = bufline$(2*j) then
13230 zount2 = zcount2 + 1
13240 endif
13250 next j
13260 next n
13270 '1人目
13280 for i=1 to mojicount1
13290 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
13300 p1 = Complate(bufcount1$(i-1))
13310 count1 = count1 + p1
13320 next i
13330 '2人目
13340 for i = 1 to mojicount2
13350 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
13360 p2 = Complate(bufcount2$(i-1))
13370 count2 = count2 + p2
13380 next i
13390 cls 3:
13400 select case device_No
13410 case 1:
13420 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
13430 gload Gazo$ + "downscreen.png",0,0,800
13440 case 2:
13450 gload Gazo$ + "downscreen.png",0,0,0
13460 end select
13470 color rgb(255,0,0)
13480 print ""+chr$(13)
13490 if lang_flag = 1 then
13500 else
13510 color rgb(255,255,255)
13520 print chr$(13)+chr$(13)
13530 print "1人目:";buf_Parson1$;chr$(13)
13540 print "数霊1:";count1;chr$(13)
13550 print "2人目:";buf_Parson2$;chr$(13)
13560 print "数霊2:";count2;chr$(13)
13570 print "数霊(合計):";count1 + count2;chr$(13)
13580 color rgb(0,0,0)
13590 print "バーチャルパッドの右" + chr$(13)
13600 endif
13610 key$ = "":bg = 0
13620 while (bg <> 1 and key$ <> chr$(13))
13630 bg = strig(1)
13640 key$ = inkey$
13650 pause 2
13660 wend
13670 if (bg = 1 or key$ = chr$(13))  then goto TopScreen:
13680 Surei_Result3:
13690 cls 3:Font 48
13700 zcount2 = 0:count2 = 0
13710 mojicount2 = len(buffer_moji2$)
13720 for n = 1 to mojicount2
13730 for j = 1 to 116
13740 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
13750 if bufcount2$(n - 1) = bufline$(2 * j) then
13760 zcount2 = zcount2 + 1
13770 endif
13780 next j
13790 next n
13800 for i = 1 to mojicount2
13810 n2 = Complate(bufcount2$(i-1))
13820 count2 = count2 + n2
13830 next i
13840 gload Gazo$ + "Screen5.png"
13850 if lang_flag = 1 then
13860 else
13870 color rgb(255,0,0)
13880 print "数霊の結果表示" + chr$(13)
13890 color rgb(255,255,255)
13900 print "１回目回の文字入力:";buffer_moji$;chr$(13)
13910 print "１回目の数霊(かずたま)";count;chr$(13)
13920 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
13930 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
13940 color rgb(0,0,0)
13950 print "エンターキー:トップ画面";chr$(13)
13960 print "c or C キー:数霊の比較";chr$(13)
13970 endif
13980 key$ = "":bg = 0
13990 while (key$ <> chr$(13) and bg <> 1)
14000 bg = strig(1)
14010 key$ = inkey$
14020 pause 2
14030 wend
14040 if bg = 1 then goto TopScreen:
14050 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
14060 if key$ = "c" or key$ = "C" then
14070 if count = count2 then
14080 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
14090 else
14100 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
14110 endif
14120 endif
14130 Moji_Count_Check:
14140 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
14150 cls 3:Font 48
14160 select case device_No
14170 case 1:
14180 gload Gazo$ + "Moji_check.png"
14190 gload Gazo$ + "downscreen.png",0,0,800
14200 case 2:
14210 gload Gazo$ + "Moji_check.png",0,0,0
14220 end select
14230 n = 0
14240 open FILE_csv$ for input as #1
14250 while eof(1) = 0
14260 line input #1, line$
14270 n = n + 1
14280 wend
14290 close #1
14300 play ""
14310 if n = 118 then
14320 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
14330 if lang_flag = 1 then
14340 else
14350 print "" + chr$(13)
14360 color rgb(255,255,255)
14370 print "文字の登録文字数は";n;"文字" + chr$(13)
14380 color rgb(0,0,0)
14390 print "パッドの右を押してください" + chr$(13)
14400 endif
14410 endif
14420 key$ = "":bg = 0
14430 while (key$ <> chr$(13) and bg <> 1)
14440 key$=inkey$
14450 bg=strig(1)
14460 pause 2
14470 wend
14480 if bg = 1 then goto TopScreen:
14490 if key$ = chr$(13) then
14500 goto TopScreen:
14510 else
14520 goto Moji_Count_Check:
14530 endif
14540 'Save 関数
14550 file_kazutama = 0
14560 file_kazutama = Save_File()
14570 func Save_File()
14580 open SAVE_DATA1$  for output as #1
14590 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
14600 close #1
14610 endfunc
14620 Select_moji:
14630 cls 3:font 48:No = 1
14640 select case device_No
14650 case 1:
14660 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
14670 gload Gazo$ + "downscreen.png",0,0,800
14680 case 2:
14690 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
14700 end select
14710 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
14720 color rgb(255,0,0)
14730 if lang_flag = 1 then
14740 else
14750 play ""
14760 play Voice_File_TopScreen$ + "Voice_Select_Moji20230217.mp3"
14770 print chr$(13)+chr$(13)+chr$(13)
14780 color rgb(255,255,255)
14790 print "番号を選んでください" + chr$(13)
14800 print " :1.登録文字検索"+ chr$(13)
14810 print " :2.登録文字数の確認" + chr$(13)
14820 print " :3.トップ画面に戻る" + chr$(13)
14830 color rgb(0,0,0)
14840 locate 0,15
14850 if No = 1 then print " 1.登録文字検索を選択"
14860 endif
14870 Entry_check_key:
14880 y = 0:key$ = "":bg=0
14890 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
14900 y = stick(1)
14910 key$ = inkey$
14920 bg=strig(1)
14930 pause 2
14940 wend
14950 'バーチャルパッド　ここから'
14960 'バーチャルパッド　ここから'
14970 if y = 1 then
14980 select case No
14990 'No の初期値：No=1
15000 case 1:
15010 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
15020 'デバッグライン　ここから
15030 '0のとき
15040 'デバッグライン　ここまで
15050 'デバッグライン　ここから
15060 case 2:
15070 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                       "
15080 :No=0
15090 'if lang_flag = 1 then
15100 'Else
15110 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に戻るを選択":goto Entry_check_key:
15120 'endif
15130 'cls:color rgb(255,255,255):print"ok"
15140 'デバッグライン　ここまで
15150 'デバッグライン　ここから
15160 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
15170 'デバッグライン　ここまで
15180 case 0:
15190 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.登録文字数の確認を選択":goto Entry_check_key:
15200 'デバッグライン　ここから
15210 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
15220 'デバッグライン　ここまで
15230 end select
15240 endif
15250 'バーチャルパッド　上 ここから
15260 if y = -1 then
15270 select case No
15280 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15290 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15300 case 1:
15310 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print"3.トップ画面に戻るを選択":goto Entry_check_key:
15320 'No:3 3.Help→2.設定 No:2
15330 case 0:
15340 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
15350 case 2:
15360 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print "1.登録文字検索":goto Entry_check_key:
15370 end select
15380 endif
15390 if bg=1 then
15400 select case No
15410 '1.数霊チェックを選択  パッドの右キー
15420 case 1:
15430 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15440 '2.設定を選択    パッドの右キー
15450 case 2:
15460 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15470 '3.ヘルプを選択 パッドの右
15480 case 0:
15490 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
15500 end select
15510 endif
15520 '4.終了するを選択  パッドの右
15530 'バーチャルパッド　ここまで'
15540 'key$ = input$(1)
15550 'カーソルの下
15560 if key$ = chr$(31) then
15570 select case (No Mod 4)
15580 case 0:
15590 c=1:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
15600 case 1:
15610 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,500),0,0:sp_on 3,0:goto Entry_check_key:
15620 case 2:
15630 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:goto Entry_check_key:
15640 case 3:
15650 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
15660 end select
15670 endif
15680 'カーソル　上
15690 if key$ = chr$(30) then
15700 select case (No Mod 4)
15710 case 0:
15720 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
15730 case 1:
15740 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
15750 case 2:
15760 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
15770 case 3:
15780 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
15790 end select
15800 endif
15810 'エンターキーを押す
15820 if key$ = chr$(13) then
15830 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15840 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15850 if No = 0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15860 endif
15870 '
15880 Kakunin_Surei_count:
15890 cls 3:font 48:No=1
15900 select case device_No
15910 case 1:
15920 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
15930 gload Gazo$ + "downscreen.png",0,0,800
15940 case 2:
15950 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
15960  end select
15970 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
15980 color rgb(255,0,0)
15990 print chr$(13)+chr$(13)+chr$(13)
16000 color rgb(255,255,255)
16010 print "番号を選んでください" + chr$(13)
16020 print " :1.数霊リスト 1人用" + chr$(13)
16030 print " :2.結果表示設定" + chr$(13)
16040 print " :3.トップ画面に行く" + chr$(13)
16050 print "" + chr$(13)
16060 color rgb(0,0,0)
16070 locate 0,15:print"                                                         "
16080 if No = 1 then locate 1,15:print "1.数霊リスト　1人用を選択"
16090 Entry_List:
16100 y = 0:key$ = "":bg=0
16110 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
16120 y = stick(1)
16130 key$ = inkey$
16140 bg = strig(1)
16150 pause 2
16160 wend
16170 'バーチャルパッド　ここから'
16180 'バーチャルパッド　ここから'
16190 'バーチャルパッド　下
16200 if y = 1 then
16210 select case No
16220 'No の初期値：No=1
16230 case 1:
16240 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.結果表示設定を選択":goto Entry_List:
16250 'デバッグライン　ここから
16260 '0のとき
16270 'デバッグライン　ここまで
16280 'デバッグライン　ここから
16290 'color rgb(0,0,0):locate 0,15:print " 4.終了を選択":goto Entry_List:
16300 'cls:color rgb(255,255,255):print"ok"
16310 'デバッグライン　ここまで
16320 case 0:
16330 sp_on 3,0:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 1.数霊リスト 1人用を選択":No=1:goto Entry_List:
16340 case 2:
16350 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                      ":No=0:locate 1,15:print "3．トップ画面に行くを選択":goto Entry_List:
16360 'デバッグライン　ここから
16370 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
16380 'デバッグライン　ここまで
16390 'デバッグライン　ここから
16400 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
16410 'デバッグライン　ここまで
16420 end select
16430 endif
16440 'バーチャルパッド　上 ここから
16450 if y = -1 then
16460 select case No
16470 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
16480 case 2:
16490 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 2.結果表示設定を選択":goto Entry_List:
16500 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
16510 case 0:
16520 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 1,15:print"3.トップ画面に行くを選択":goto Entry_List:
16530 'No:3 3.Help→2.設定 No:2
16540 case 1:
16550 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print "1.数霊リスト 1人用を選択":goto Entry_List:
16560 end select
16570 endif
16580 if bg = 1 then
16590 select case No
16600 '1.数霊リスト 一人用を選択を選択  パッドの右キー
16610 case 1:
16620 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16630 '2.設定を選択  パッドの右キー
16640 case 2:
16650 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16660 case 0:
16670 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16680 end select
16690 endif
16700 if key$=chr$(13) then
16710 select case No
16720 case 0:
16730 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16740 case 1:
16750 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16760 case 2:
16770 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16780 end select
16790 endif
16800 '4.終了するを選択  パッドの右
16810 'バーチャルパッド　ここまで'
16820 Surei_List1:
16830 cls 3:font 48
16840 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
16850 file$ = dir$(SAVE_DATA1$,0)
16860 'ファイルが無いときの画面
16870 if file$ = ""  then
16880 select case device_No
16890 case 1:
16900 gload Gazo$ + "KazutamaList1.png",0
16910 gload Gazo$+"downscreen.png",0,0,800
16920 case 2:
16930 gload Gazo$ + "KazutamaList1.png"
16940 end select
16950 print chr$(13)
16960 color rgb(255,255,255):print "登録ファイルはございません" + chr$(13)
16970 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
16980 'else
16990 'endif
17000 bg = 0:key$ = ""
17010 while (key$ <> chr$(13) and bg<>1)
17020 key$ = inkey$
17030 bg = strig(1)
17040 pause 2
17050 wend
17060 'エンターキーもしくはバーチャルパッドの右でトップに行く
17070 if (bg = 1  or key$ = chr$(13)) then goto TopScreen:
17080 else
17090 cls 3:buffer_list_count = Loadcount()
17100 color rgb(255,255,255)
17110 if lang_flag = 1 then
17120 Else
17130 talk "登録件数は" + str$(buffer_list_count) + "件です"
17140 select case device_No
17150 Case 1:
17160 gload Gazo$ + "KazutamaList1_Entry.png",0
17170 gload Gazo$ + "downscreen.png",0,0,800
17180 case 2:
17190 gload Gazo$+"KazutamaList1_Entry.png",0,0,0
17200 end select
17210 color rgb(0,0,255)
17220 print chr$(13)
17230 color rgb(255,255,255)
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
17590 endif
17600 next i
17610 kotodama$ = moji_$
17620 endfunc kotodama$
17630 KotodamaList_page:
17640 cls 3:font 48:m = 0:
17650 select case device_No
17660 case 1:
17670 gload Gazo$ + "Screen5_Surei_List.png"
17680 gload Gazo$ + "downscreen.png",0,0,800
17690 case 2:
17700 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
17710 end select
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
17840 l = 0:n=0
17850 select case device_No
17860 case 1:
17870 gload Gazo$ + "Screen5_Surei_List.png"
17880 gload Gazo$ + "downscreen.png",0,0,800
17890 case 2:
17900 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
17910 end select
17920 while (buffer_list_count >= l)
17930 cls
17940 color rgb(255,0,0)
17950 print chr$(13)
17960 color rgb(255,255,255)
17970 n=n+1
17980 print chr$(13)
17990 print "番号:";l+1;chr$(13)
18000 print bufKaztama$(l,0) + chr$(13)
18010 print bufKaztama$(l,1) + chr$(13)
18020 Kmoji$ = moji$
18030 print chr$(13) + chr$(13) + chr$(13)
18040 color rgb(0,0,0)
18050 if buffer_list_count=1 then
18060 print " :パッドの左:トップ画面"+chr$(13)
18070 ui_msg "登録件数は1件です。"
18080 else
18090 if buffer_list_count > 1 then
18100 print " :パッドの左:トップ画面" + chr$(13)
18110 print " :パッドの右:次へ行く" + chr$(13)
18120 endif
18130 endif
18140 key$ = "":bg = 0:bg2 = 0
18150 while (key$ <> chr$(13) and bg <> 1 and bg2 <> 1)
18160 key$ = inkey$
18170 bg = strig(1)
18180 bg2 = strig(0)
18190 pause 2
18200 wend
18210 'if n > 1 then
18220 if (key$ = " " OR bg = 1) then
18230 if n > 1 then
18240 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
18250 endif
18260 else
18270 if ((bg2 = 1) or (key$=chr$(13))) then
18280 goto TopScreen:
18290 endif
18300 else
18310 goto KotodamaList_page:
18320 endif
18330 wend
18340 endif
18350 'ndif
18360 '結果表示２ Menu1
18370 Surei_Result4:
18380 cls 3:font 32+16:init"kb:4"
18390 for i=0 to 181 + 3 - 1
18400 if i = count  then
18410 buffer$ = bufline2$(count + 4,0)
18420 endif
18430 next i
18440 if len(buffer$) > 21 and len(buffer$) <= 45 then
18450 buffer2$ = Mid$(buffer$,1,22)
18460 buffer3$ = Mid$(buffer$,23,(len(buffer$) - 22))
18470 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13)
18480 else
18490 if len(buffer$) <= 21 then
18500 buffer2$ = Mid$(buffer$,1,21)
18510 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
18520 else
18530 if len(buffer$) > 45 and len(buffer$) <= 62 then
18540 buffer2$ = Mid$(buffer$,1,22)
18550 buffer3$ = Mid$(buffer$,23,22)
18560 buffer4$ = Mid$(buffer$,44,(len(buffer$)-44))
18570 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13)
18580 else
18590 if len(buffer$) > 64 and len(buffer$) <= 81 then
18600 buffer2$ = Mid$(buffer$,1,22)
18610 buffer3$ = Mid$(buffer$,23,20)
18620 buffer4$ = Mid$(buffer$,44,20)
18630 buffer5$ = Mid$(buffer$,65,(len(buffer$)-65))
18640 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13)
18650 if len(buffer$) > 81 and len(buffer$) <= 110 then
18660 buffer2$ = Mid$(buffer$,1,22)
18670 buffer3$ = Mid$(buffer$,23,20)
18680 buffer4$ = Mid$(buffer$,43,20)
18690 buffer5$ = Mid$(buffer$,63,20)
18700 buffer6$ = Mid$(buffer$,83,(len(buffer$) - 83))
18710 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13)
18720 endif
18730 endif
18740 endif
18750 endif
18760 endif
18770 Surei_Result4_2:
18780 select case device_No
18790 case 1:
18800 gload Gazo$ + "Screen1_Result2.png"
18810 gload Gazo$ + "downscreen.png",0,0,800
18820 case 2:
18830 gload Gazo$ +"Screen1_Result2.png"
18840 end select
18850 Result_Menu_List$(0)="1.トップ画面に行く"
18860 Result_Menu_List$(1)="2.数霊のデーターを保存"
18870 Result_Menu_List$(2)="3.もう一度、数霊を調べる"
18880 cls
18890 print chr$(13)
18900 if lang_flag = 1 then
18910 else
18920 color rgb(127,255,212)
18930 print chr$(13);chr$(13)
18940 print "入力文字:";buffer_moji$;chr$(13)
18950 print "数霊:";count;chr$(13)
18960 color rgb(255,255,255)
18970 print "数霊の説明:"+chr$(13)
18980 print buffer$
18990 color rgb(0,0,0)
19000 locate 0,15
19010 print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
19020 endif
19030 key$ = "":bg = 0:bg2 = 0
19040 while (bg<>1 and bg2<>1)
19050 key$ = inkey$
19060 bg = strig(1)
19070 bg2 = strig(0)
19080 pause 2
19090 wend
19100 if ((bg = 1) or (bg2 = 1)) then
19110 num = ui_select("Result_Menu_List$","番号を選んでください")
19120 endif
19130 if num = 0 then goto TopScreen:
19140 if num = 1 then goto File_save:
19150 if num = 2 then goto Surei_Input:
19160 if num = -1 then goto Surei_Result4
19170 File_save:
19180 'ファイルがない時
19190 if dir$(SAVE_DATA1$) = " " then
19200 open SAVE_DATA1$ for output as #1
19210 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19220 close #1
19230 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19240 'ファイルが有る時
19250 else
19260 open SAVE_DATA1$ for append as #1
19270 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19280 close #1
19290 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19300 endif
19310 func All_clear()
19320 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
19330 endfunc
19340 'ここから
19350 Config_moji1:
19360 cls 3:Font 48
19370 select case device_No
19380 case 1:
19390 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19400 gload Gazo$ + "downscreen.png",0,0,800
19410 case 2:
19420  gload  Gazo$ + "Screen1_Setting_Top.png",0,0,0
19430 end select
19440 play ""
19450 No=1
19460 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19470 color rgb(0,0,255)
19480 print chr$(13)
19490 if lang_flag = 1 then
19500 'lang_flag = 1:英語
19510 else
19520 'lang_flag = 0:日本語
19530 color rgb(255,255,255)
19540 print "番号を選んでください" + chr$(13)
19550 print " :1.文字の項目" + chr$(13)
19560 print " :2.結果表示設定" + chr$(13)
19570 print " :3.トップ画面に行く" + chr$(13)
19580 print " :4.終 了" + chr$(13)
19590 endif
19600 color rgb(0,0,0)
19610 locate 1,12
19620 if No = 1 then print "1.文字の項目"
19630 'y:バーチャルパッドの処理
19640 'key$:カーソルの処理
19650 'bg:バーチャルパッドの右ボタン
19660 Config_moji1_Screen:
19670 y = 0:key$ = "":bg=0
19680 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
19690 y = stick(1)
19700 key$ = inkey$
19710 bg=strig(1)
19720 pause 2
19730 wend
19740 'バーチャルパッド　ここから'
19750 'バーチャルパッド　ここから'
19760 if y = 1 then
19770 select case No
19780 'No の初期値：No=1
19790 case 1:
19800 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
19810 'デバッグライン　ここから
19820 '0のとき
19830 'デバッグライン　ここまで
19840 'デバッグライン　ここから
19850 case 2:
19860 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
19870 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
19880 'if lang_flag = 1 then
19890 'else
19900 locate 1,12:print "3.トップ画面に行くを選択"
19910 'endif
19920 'デバッグライン　ここまで
19930 case 3:
19940 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
19950 'デバッグライン　ここから
19960 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
19970 'デバッグライン　ここまで
19980 case 0:
19990 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20000 'デバッグライン　ここから
20010 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
20020 'デバッグライン　ここまで
20030 end select
20040 endif
20050 'バーチャルパッド　上 ここから
20060 if y = -1 then
20070 select case No
20080 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
20090 case 1:
20100 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
20110 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
20120 case 0:
20130 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
20140 'No:3 3.Help→2.設定 No:2
20150 case 3:
20160 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20170 case 2:
20180 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
20190 end select
20200 endif
20210 if bg=1 then
20220 select case No
20230 '1.数霊チェックを選択  パッドの右キー
20240 case 1:
20250 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
20260 '2.設定を選択    パッドの右キー
20270 case 2:
20280 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
20290 '3.ヘルプを選択 パッドの右
20300 case 3:
20310 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
20320 'プログラムの終了を選択
20330 case 0:
20340 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
20350 'if lang_flag = 1 then
20360 'Else
20370 ui_msg "プログラムを終了します":end
20380 'endif
20390 end select
20400 endif
20410 '4.終了するを選択  パッドの右
20420 'バーチャルパッド　ここまで'
20430 'SettingScreen:
20440 'key$ = input$(1)
20450 'カーソル下'
20460 if key$ = chr$(31) then
20470 select case (No Mod 4)
20480 '登録文字から数霊文字の確認
20490 case 1:
20500 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
20510 '数霊文字の確認からトップ画面に行く
20520 case 2:
20530 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
20540 'トップ画面に行くから終了
20550 case 3:
20560 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
20570 '終了から登録文字
20580 case 0:
20590 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20600 end select
20610 endif
20620 'カーソル　上
20630 if key$ = chr$(30) then
20640 select case (No Mod 4)
20650 case 1:
20660 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
20670 case 2:
20680 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
20690 case 3:
20700 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
20710 case 0:
20720 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
20730 end select
20740 endif
20750 'エンターキーを押したとき
20760 if key$ = chr$(13) then
20770 if No=3 then goto TopScreen:
20780 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
20790 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
20800 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
20810 'lse
20820 'o'o SettingScreen:
20830 endif
20840 'ここまで
20850 Config_moji2:
20860 cls 3:Font 48
20870 select case device_No
20880 case 1:
20890 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
20900 gload Gazo$ + "downscreen.png",0,0,800
20910  case 2:
20920 gload Gazo$ + "Screen1_Setting_Top.png "
20930  end select
20940 play ""
20950 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
20960 No=1
20970 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
20980 color rgb(0,0,255)
20990 'print "●設定項目" + chr$(13)
21000 print chr$(13)
21010 if lang_flag = 1 then
21020 'lang_flag = 1:英語
21030 else
21040 'lang_flag = 0:日本語
21050 color rgb(255,255,255)
21060 print "番号を選んでください" + chr$(13)
21070 'print " :1.文字の項目" + chr$(13)
21080 'print " :2.結果表示設定" + chr$(13)
21090 print " :1.文字の項目" + chr$(13)
21100 print " :2.結果表示設定" + chr$(13)
21110 print " :3.トップ画面に行く" + chr$(13)
21120 print " :4.終 了" + chr$(13)
21130 endif
21140 color rgb(0,0,0)
21150 locate 1,12
21160 if No = 1 then print "1.文字の項目"
21170 'y:バーチャルパッドの処理
21180 'key$:カーソルの処理
21190 'bg:バーチャルパッドの右ボタン
21200 config_moji2:
21210 y = 0:key$ = "":bg=0
21220 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
21230 y = stick(1)
21240 key$ = inkey$
21250 bg = strig(1)
21260 pause 2
21270 wend
21280 'バーチャルパッド　ここから'
21290 'バーチャルパッド　ここから'
21300 if y = 1 then
21310 select case No
21320 'No の初期値：No=1
21330 case 1:
21340 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
21350 'デバッグライン　ここから
21360 '0のとき
21370 'デバッグライン　ここまで
21380 'デバッグライン　ここから
21390 case 2:
21400 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
21410 color rgb(0,0,0)::No=2:goto SettingScreen:
21420 if lang_flag = 1 then
21430 else
21440 locate 0,12:print " 3.トップ画面に行くを選択"
21450 endif
21460 'cls:color rgb(255,255,255):print"ok"
21470 'デバッグライン　ここまで
21480 case 3:
21490 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
21500 'デバッグライン　ここから
21510 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
21520 'デバッグライン　ここまで
21530 case 0:
21540 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21550 'デバッグライン　ここから
21560 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
21570 'デバッグライン　ここまで
21580 end select
21590 endif
21600 'バーチャルパッド　上 ここから
21610 if y = -1 then
21620 select case No
21630 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
21640 case 1:
21650 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
21660 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
21670 case 0:
21680 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
21690 'No:3 3.Help→2.設定 No:2
21700 case 3:
21710 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
21720 case 2:
21730 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
21740 end select
21750 endif
21760 '決定ボタン
21770 if bg=1 then
21780 select case No
21790 '1.数霊チェックを選択  パッドの右キー
21800 case 1:
21810 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
21820 '2.設定を選択    パッドの右キー
21830 case 2:
21840 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
21850 '3.ヘルプを選択 パッドの右
21860 case 3:
21870 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
21880 'プログラムの終了を選択
21890 case 0:
21900 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
21910 'if lang_flag = 1 then
21920 'Else
21930 ui_msg "プログラムを終了します":end
21940 'endif
21950 end select
21960 endif
21970 '4.終了するを選択  パッドの右
21980 'バーチャルパッド　ここまで'
21990 'カーソル下'
22000 if key$ = chr$(31) then
22010 select case (No Mod 4)
22020 '登録文字から数霊文字の確認
22030 case 1:
22040 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22050 '数霊文字の確認からトップ画面に行く
22060 case 2:
22070 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
22080 'トップ画面に行くから終了
22090 case 3:
22100 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
22110 '終了から登録文字
22120 case 0:
22130 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
22140 end select
22150 endif
22160 'カーソル　上
22170 if key$ = chr$(30) then
22180 select case (No Mod 4)
22190 case 1:
22200 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
22210 case 2:
22220 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
22230 case 3:
22240 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
22250 case 0:
22260 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
22270 end select
22280 endif
22290 'エンターキーを押したとき
22300 if key$ = chr$(13) then
22310 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
22320 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
22330 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
22340 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
22350 'lse
22360 'o'o SettingScreen:
22370 endif
22380 '結果表示設定
22390 Result_Setting:
22400 color rgb(255,255,255)
22410 'dim list$(4)
22420 'ファイル読み込み
22430 '1.ファイルが有るか無いかのチェック
22440 if Dir$(System$) = "" then
22450 '1-1.ファイルがないとき
22460 '上のSystemフォルダを作成
22470 mkdir "./data/system/"
22480 list$(0) = "●:出た数字から181を引く"
22490 list$(1) = " :出た数字から180を引き単数変換"
22500 open System$ for output as #1
22510 print #1,"config_r=0"
22520 close #1
22530 ui_msg "ファイルを作成しました"
22540 'ファイル作成
22550 else
22560 '1-2.ファイルが有るとき
22570 'config_r:0 出た数字から181を引く
22580 'config_r:1 出た数字から180を引いて単数変換
22590 'open "./System/config.sys" for input as #1
22600 'ファイルが有るときファイルを読み込み
22610 open System$ for input as #1
22620 line input #1,buf_line$
22630 'buf$にデーターをコピーする
22640 buf$ = buf_line$
22650 close #1
22660 if len(buf$) = 10 then
22670 if left$(buf$,9) = "config_r=" then
22680 buf$ = right$(buf_line$,1)
22690 if buf$ = "1" then
22700 '1.System$ ファイルを削除(config.sys)
22710 '2.1行目をconfig_r=1と書き、保存する
22720 buf_config_r = 1
22730 'list$(0) = "●:1.出た数字から180を引いて単数変換"
22740 'list$(1) = " :2.出た数字から181を引く"
22750 else
22760 if buf$ = "0" then
22770 buf_config_r = 0
22780 ' list$(0) = "●:1.出た数字から181を引く"
22790 'list$(1) = " :2.出た数字から180を引いて単数変換"
22800 endif
22810 endif
22820 endif
22830 endif
22840 endif
22850 '"●:1.出た数字から180を引く"をlist$(0)に代入
22860 if buf_config_r =  0 then
22870 list$(0) = "●:1.出た数字から181を引く"
22880 list$(1) = " :2.出た数字から180を引いて単数変換"
22890 else
22900 list$(0) = "●:1.出た数字から180を引いて単数変換"
22910 list$(1) = " :2.出た数字から181を引く"
22920 endif
22930 list$(2) = " :トップ画面に戻る"
22940 list_num = ui_select("list$","番号を選んでください")
22950 play ""
22960 Select case (list_num)
22970 case 0:
22980 if buf$ = "1" then
22990 buf_config_r = 0:
23000 'データーを変更したのでファイルを削除
23010 kill System$
23020 'ファイルを新しく作成
23030 open System$ for output as #1
23040 print #1,"config_r=0"
23050 close #1
23060 ui_msg "設定を変更しました。"
23070 else
23080 'if buf$ = "0" then
23090 'buf_config_r = 1
23100 'kill System$
23110 'open Syetem$ for output as #1
23120 'print #1,"config_r=1"
23130 'close #1
23140 'ui_msg "設定を変更しました"
23150 'endif
23160 endif
23170 goto config_moji2:
23180 case 1:
23190 if buf$ = "0" then
23200 buf_config_r = 1:
23210 'データーを変更したので、ファイルを削除
23220 kill System$
23230 'ファイルを新しく作成
23240 open System$ for output as #1
23250 print #1,"config_r=1"
23260 close #1
23270 ui_msg "設定を変更しました"
23280 else
23290 kill System$
23300 if buf$ = "1" then
23310 open System$ for output as #1
23320 print #1,"config_r=0"
23330 close #1
23340 ui_msg "設定を変更しました"
23350 endif
23360 endif
23370 goto config_moji2:
23380 case 2:
23390 'トップ画面に飛ぶ
23400 goto TopScreen:
23410 case 3:
23420 'プログラムを終了する
23430 cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
23440 end select
23450 '単数変換
23460 Func Single_Complate(num)
23470 '1.出てきた数字から180を引く
23480 a = num - 180
23490 'a:10〜99
23500 Re1:
23510 if (a > 9 and a < 100) then
23520 b1 = fix(a / 10)
23530 b2 = 10 * a - b1
23540 d1 = b1 + b2
23550 if c > 9 then
23560 goto Re1:
23570 else
23580 c = d1:goto Re2:
23590 endif
23600 endif
23610 Re2:
23620 buffer = c
23630 endfunc buffer
23640 Func Surei_Result_Save_File()
23650 'ファイルがないとき
23660 if dir$(SAVE_DATA1$) = "" then
23670 open SAVE_DATA1$ for output as #1
23680 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
23690 close #1
23700 ui_msg "保存しました":talk "保存しました":goto Surei_Result:
23710 else
23720 open SAVE_DATA1$ for append as #1
23730 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
23740 close #1
23750 ui_msg "保存しました":talk "保存しました":goto Surei_Result
23760 endif
23770 endfunc
23780 '言語設定
23790 Setting_Language:
23800 cls 3:screen 1,1,1,1:No=2
23810 select case device_No
23820 case 1:
23830 gload Gazo$ + "Screen1.png",0,0,0
23840 gload Gazo$ + "downscreen.png",0,0,800
23850 case 2:
23860 gload Gazo$ + "Screen1.png",0,0,0
23870 end select
23880 init "Kb:4"
23890 sp_on 1,1:sp_on 0,0
23900 sp_put 0,(0,300),0,0
23910 sp_put 1,(0,400),1,0
23920 color rgb(0,0,255)
23930 'print "番号を選んでください"+chr$(13)
23940 'if lang_flag=0 then
23950 'print "言語設定:日本語"+chr$(13)
23960 'else
23970 'print "言語設定:英 語"+chr$(13)
23980 Change_Language:
23990 if lang_flag = 1 then
24000 cls
24010 print "It has changed Language"+chr$(13)
24020 color rgb(255,255,255)
24030 print "Select the Number"+chr$(13)
24040 print " :1.English → Japanse"+chr$(13)
24050 print " :2.It goes to TopScreen"+chr$(13)
24060 print "Language:In English" +chr$(13)
24070 else
24080 cls:color rgb(255,255,255)
24090 print "設定変更(言語の変更)" + chr$(13)
24100 color rgb(255,255,255)
24110 print chr$(13)
24120 print "番号を選んでください"+chr$(13)
24130 print " :1.日本語 → 英語に変更" + chr$(13)
24140 print " :2.トップ画面に戻る" + chr$(13)
24150 print chr$(13)
24160 print "設定言語:日本語" + chr$(13)
24170 endif
24180 color rgb(0,0,0)
24190 locate 0,15:print "                                       ":locate 0,15:print "2.トップ画面に戻る　を選択" + chr$(13)
24200 Setting_Language_key:
24210 y=0:key$="":bg=0
24220 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y<> -1 and bg<> 1)
24230 y=stick(1)
24240 key$=inkey$
24250 bg=strig(1)
24260 pause 2
24270 wend
24280 '選択肢変更
24290 if ((y=1) or (y=-1)) then
24300 select case No
24310 case 2:
24320 '実装部分　ここから
24330 pause 200:No=1:sp_on 0,1:sp_on 1,0:locate 0,15:print "                                                         ":locate 0,15:print "1.日本語 → 英語に変更を選択": goto Setting_Language_key:
24340 '実装部分　ここまで
24350 case 1:
24360 pause 200: No=2:sp_on 0,0:sp_on 1,1:locate 0,15:print "                                                       ":locate 0,15:print "2.トップ画面に戻る を選択":goto Setting_Language_key:
24370 end select
24380 endif
24390 'Enter Key  決定ボタン
24400 if ((key$=chr$(13)) or (bg=1)) then
24410 select case No
24420 case 2:
24430 sp_on 0,0:sp_on 1,0:goto TopScreen:
24440 case 1:                                                     'lang_flag=1:sp_on 0,0:sp_on 1,0:goto Change_Language:
24450 '
24460 '未実装　ここから
24470 sp_on 0,1:sp_on 1,0:ui_msg "この機能は未実装です":goto Setting_Language_key:
24480 '
24490 '未実装　ここまで
24500 end select
24510 endif
24520 '配列削除
24530 buffer_clear:
24540 erase bufline$
24550 erase bufcount$
24560 erase bufcount1$
24570 erase bufcount2$
24580 erase bufline2$
24590 erase bufline3$
24600 erase bufKaztama$
24610 erase List$
24620 erase Result_Menu_List$
24630 erase list$
24640 erase moji_List$
24650 'ui_msg "メモリーをクリアしました"
24660 return
24670 '配列削除　ここまで
24680 File_Device_Set:
24690 'Device 選択　書き込み
24700 open Device_type$  for output as #1
24710 print #1,device_No
24720 close #1
24730 ui_msg "ファイルを書き込みました"
24740 return
