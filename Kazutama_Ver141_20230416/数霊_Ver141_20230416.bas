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
580 'Version 1.4.0_2023.04.02-2023.04.09(Release):正式版
590 'Version 1.4.1_2023.04.09-2023.04.16(Release):正式版
600 '現在のバージョン
610 Version$ = "1.4.1_2023.04.16(正式版)"
620 'csvファイル 1.数霊 ベースファイル
630 FILE_csv$ = "./data/Kazutama.csv"
640 'csvファイル 2.数霊 ベースファイル 2
650 FILE_csv2$ = "./data/Surei_chart_20211207.csv"
660 'Save ファイル
670 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
680 'gazo ファイル
690 Gazo$ = "./data/Gazo/"
700 'System フォルダ:設定ファイルを保存するところ
710 System$ = "./data/System/config.sys"
720 'Device type:デバイスタイプのファイルチェック
730 Device_type$ = "./data/device_type.sys"
740 '設定ファイル名:config.sys
750 'Sound File(Voice)
760 '1.ボイス TopScreen
770 Voice_File_TopScreen$ = "./data/Sound_data/"
780 'Message
790 buf_finish_Message$ = "メモリーを解放してプログラムを終了します"
800 '変数領域
810 'vcount:バーチャルパッド下の変数
820 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
830 count2 = 0:N=0:N2=0:m2 = 0:device_No=0:device_type=0
840 dim list$(4),moji_List$(2)
850 'ファイルの有無チェック
860 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
870 '1.ファイルが無いとき
880 cls :print "依存ファイルが見つかりません":
890 print "エンターキーを押してください" + chr$(13)
900 key$ = input$(1)
910 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
920 else
930 '2.ファイルが有るとき
940 cls:print "csv:file ok." + chr$(13)
950 n=0
960 'FILE_csv$:数霊データー入力
970 open FILE_csv$ for input as #1
980 while eof(1) = 0
990 input #1,line$
1000 bufline$(n) = line$
1010 'Print n;chr$(13)
1020 '登録件数カウント:n
1030 n = n + 1
1040 wend
1050 close #1
1060 N=n
1070 '2つ目のファイル読み込み
1080 'n = 0
1090 open FILE_csv2$ for input as #2
1100 for n=3 to 181
1110 for i=0 to 1
1120 input #2,line$
1130 bufline2$(n,i) = line$
1140 next i
1150 next n
1160 close #2
1170 N2 = n
1180 endif
1190 '2022.11.23----------------------
1200 '端末言語のチェック
1210 '日本語端末かチェックをして日本語以外なら英語で表示する
1220 'lang flag:0:日本語 1:英語(日本語以外)
1230 '--------------------------------
1240 lang_flag = 0
1250 if ex_info$(1) <> "JP" then
1260 lang_flag = 1
1270 endif
1280 cls 3:font 48:screen 1,1,1,1:int "kb:4":init "crt:0"
1290 play ""
1300 'gload Gazo$ + "TopScreen_20230310.png",0,0,0
1310 '選択ポインター 1 - 4
1320 'スプライトの定義
1330 gload Gazo$ + "Selection.png",1,5,300
1340 gload Gazo$ + "Selection.png",1,5,400
1350 gload Gazo$ + "Selection.png",1,5,500
1360 gload Gazo$ + "Selection.png",1,5,595
1370 sp_def 0,(5,300),32,32
1380 sp_def 1,(5,400),32,32
1390 sp_def 2,(5,500),32,32
1400 sp_def 3,(5,595),32,32
1410 'File check
1420 '初回起動はここから
1430 if (dir$(Device_type$) = "") then
1440 goto Device_Select:
1450 else
1460 '
1470 '2回目以降はファイルチェックをしてトップ画面
1480 '
1490  open Device_type$ for input as #1
1500  line input #1,device_type$
1510  device_No = val(device_type$)
1520  close #1
1530  if (device_No=1 or device_No=2) then
1540  goto TopScreen:
1550  endif
1560 endif
1570 'First_Select_Screen:
1580 'タブレット　or　スマホの選択を起動時にする
1590 Device_Select:
1600 font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
1610 gload Gazo$ + "device_select_20230313.png",0,0,0
1620 init "kb:4"
1630 play ""
1640 play Voice_File_TopScreen$+"Select_device_select.mp3"
1650 'y=0:key$="":bg=0
1660 print chr$(13)+chr$(13)+chr$(13)
1670 color  rgb(255,255,255)
1680 print "番号を選んでください"+chr$(13)
1690 'print chr$(13)
1700 print " :1.スマートフォン"+chr$(13)
1710 print " :2.タブレット端末"+chr$(13)
1720 locate 0,11:No=1
1730 color rgb(0,0,0)
1740 Print " 1.スマートフォンを選択"+chr$(13)
1750 sp_on 0,1:sp_put 0,(5,300),0,0
1760 sp_on 1,0:sp_on 2,0:sp_on 3,0
1770 device_selection:
1780 y=0:key$="":bg=0:
1790 While (key$ <> chr$(30) and key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
1800 y = stick(1)
1810 key$ = inkey$
1820 bg = strig(1)
1830 pause 2
1840 wend
1850 if ((y=1) or (y=-1) or (key$=chr$(30)) or (key$=chr$(31)) ) then
1860 select case No
1870 case 1:
1880       No=2:sp_on 1,1:sp_on 0,0:locate 0,11:pause 300:sp_put 1,(5,400),0,0:print "                                ":locate 0,11:print " 2.タブレット端末を選択":goto device_selection:
1890 case 2:
1900       No=1:sp_on 1,0:sp_on 0,1:pause 300:sp_put 0,(5,300),0,0:locate 0,11:print "                                   ":locate 0,11:print " 1.スマートフォンを選択":goto device_selection:
1910 end select
1920 endif
1930 '決定ボタン
1940 if ((bg=2) or (key$=chr$(13)))  then
1950 select case No
1960 case 1:
1970       sp_on 0,0:sp_on 1,0:device_No=1:gosub File_Device_Set:goto TopScreen:
1980 case 2:
1990       sp_on 0,0:sp_on 1,0:device_No=2:gosub File_Device_Set:goto TopScreen:
2000 end select
2010 endif
2020 'Top画面
2030 TopScreen:
2040 'バーチャルパッドを表示
2050 cls 3:font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
2060 'play ""
2070 play ""
2080 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
2090 'gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
2100 select case device_No
2110 case 1:
2120 'Top画面の背景画像
2130 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2140 gload Gazo$ + "downscreen.png",0,0,800
2150 case 2:
2160 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2170 end select
2180 'key$=input$(1)
2190 'バーチャルパッドの背景を白にする for smartphone screen
2200 'gload Gazo$ + "downscreen.png",0,0,800
2210 '選択肢 1
2220 gload Gazo$ + "Selection.png",1,5,300
2230 '選択肢 2
2240 gload Gazo$ + "Selection.png",1,5,400
2250 '選択肢 3
2260 gload Gazo$ + "Selection.png",1,5,500
2270 '選択肢 4
2280 'TopScreen:
2290 'select case device_No
2300 'case 1:
2310 gload Gazo$ + "Selection.png",1,5,590
2320 'case 2:
2330 'gload Gazo$ +
2340 'end select
2350 color rgb(0,0,255)
2360 print chr$(13)
2370 if lang_flag = 1 then
2380 color rgb(255,255,255)
2390 print "Select Number" + chr$(13)
2400 print " :1.Kazutama check" + chr$(13)
2410 print " :2.Setting" + chr$(13)
2420 print " :3.Help" + chr$(13)
2430 print " :4.End Program" + chr$(13)
2440 color rgb(255,255,255)
2450 else
2460 color rgb(255,255,255)
2470 print chr$(13)
2480 sp_on 0,1:sp_put 0,(5,300),0,0
2490 print "番号を選んでください" + chr$(13)
2500 print " :1.数霊(かずたま)チェック" + chr$(13)
2510 print " :2.設定" + chr$(13)
2520 print " :3.ヘルプ" + chr$(13)
2530 print " :4.(プログラムを)終　了する" + chr$(13)
2540 color rgb(0,0,0)
2550 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
2560 'バーチャルパッドを表示
2570 No=1:
2580 'lang_flag:1 外国語,0:日本語
2590 if lang_flag = 1 then
2600 'lang_flag=1 英語
2610 locate 0,15:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
2620 else
2630 'lang_flag=0 日本語
2640 locate 0,15:color rgb(0,0,0):print " 1.数霊(かずたま)チェックを選択";chr$(13)
2650 endif
2660 endif
2670 'TopScreen sprite
2680 'スプライト
2690 '選択肢 1 On
2700 'sp_def 0,(5,300),32,32
2710 'sp_on 0,1
2720 'sp_put 0,(5,300),0,0
2730 '選択肢 2 Off
2740 sp_def 1,(5,400),32,32
2750 sp_on 1,0
2760 sp_put 1,(5,400),0,0
2770 '選択肢 3 Off
2780 sp_def 2,(5,500),32,32
2790 sp_on 2,0
2800 sp_put 2,(5,500),0,0
2810 '選択肢 4 Off
2820 sp_def 3,(5,600),32,32
2830 sp_on 3,0
2840 sp_put 3,(5,600),0,0
2850 color rgb(0,0,0)
2860 Main_Select:
2870 'y:バーチャルパッドの処理
2880 'key$:カーソルの処理
2890 y = 0:key$ = "":bg = 0
2900 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
2910 y = stick(1)
2920 key$ = inkey$
2930 bg = strig(1)
2940 pause 2
2950 wend
2960 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
2970 '1.バーチャルパッドの処理
2980 'バーチャルパッド下を押した時
2990 if y = 1 then
3000 select case No
3010 'No の初期値：No=1
3020 case 1:
3030 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
3040 if lang_flag = 1 then
3050 'lang_flag=1 英語
3060 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3070 else
3080 'lang_flag=0 日本語
3090 locate 0,15:print " 2.設定を選択":goto Main_Select:
3100 endif
3110 'デバッグライン　ここから
3120 '0のとき
3130 'デバッグライン　ここまで
3140 'デバッグライン　ここから
3150 'バーチャルパッド　下
3160 case 2:
3170 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:
3180 print "                                         ":
3190 if lang_flag = 1 then
3200 color rgb(0,0,0):locate 0,15:
3210 print "3.It has selected Help":No=3:goto Main_Select:
3220 else
3230 color rgb(0,0,0):locate 0,15:print "                                                         ":locate 0,15:
3240 print " 3.ヘルプを選択":No=3:goto Main_Select:
3250 endif
3260 'デバッグライン　ここまで
3270 case 3:
3280 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                               "
3290 if lang_flag = 1 then
3300 locate 0,15:print "4.It has selected finish program":No=0:goto Main_Select:
3310 else
3320 locate 0,15:print "                                                         " :locate 0,15:print " 4.(プログラムを)終了するを選択":No=0:goto Main_Select:
3330 endif
3340 'デバッグライン　ここから
3350 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
3360 'デバッグライン　ここまで
3370 case 0:
3380 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1
3390 if lang_flag = 1 then
3400 'lang_flag=1:英語
3410 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3420 else
3430 'lang_flag=0:日本語
3440 locate 0,15:print "                                      ":locate 0,15:print " 1.数霊(かずたま)チェックを選択":goto Main_Select:
3450 endif
3460 'デバッグライン　ここから
3470 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
3480 'デバッグライン　ここまで
3490 end select
3500 endif
3510 'バーチャルパッド　上 ここから
3520 if y = -1 then
3530 select case No
3540 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
3550 case 1:
3560 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                                          "
3570 'if lang_flag = 1 then
3580 'lang_flag=1 英語
3590 'locate 0,15:print "4.It has finished program":goto Main_Select:
3600 'else
3610 'lang_flag=0 日本語
3620 locate 0,15:print "                                                          ":
3630 locate 0,15:print " 4.(プログラムを)終了するを選択":goto Main_Select:
3640 'endif
3650 'endif
3660 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
3670 case 0:
3680 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":
3690 if lang_flag = 1 then
3700 '1:英語
3710 locate 0,15:print "3.It has selected Help":goto Main_Select:
3720 else
3730 '0:日本語
3740 locate 0,15:print "                                                                                        "
3750 locate 0,15:print " 3.ヘルプを選択":goto Main_Select:
3760 endif
3770 'No:3 3.Help→2.設定 No:2
3780 case 3:
3790 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      "
3800 if lang_flag = 1 then
3810 '1:英語
3820 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3830 else
3840 '0:日本語
3850 locate 0,15:print" 2.設定を選択":goto Main_Select:
3860 endif
3870 case 2:
3880 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":
3890 if lang_flag = 1 then
3900 'lang_flag 1 英語
3910 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3920 else
3930 'lang_flag 0 日本語
3940 locate 0,15:print" 1.数霊(かずたま)チェックを選択":goto Main_Select:
3950 endif
3960 end select
3970 endif
3980 if bg = 2 then
3990 select case No
4000 '1.数霊チェックを選択  パッドの右キー(決定)
4010 case 1:
4020 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4030 '2.設定を選択  パッドの右キー(決定)
4040 case 2:
4050 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
4060 '3.ヘルプを選択 パッドの右(決定)
4070 case 3:
4080 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
4090 'プログラムの終了を選択(決定)
4100 case 0:
4110 cls 3:cls 4:gosub buffer_clear:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":ui_msg buf_finish_Message$:pause 4.080*1000:color rgb(255,255,255):end
4120 'if lang_flag = 1 then
4130 'lang_flag = 1 英語
4140 'else
4150 'lang_flag = 0 日本語
4160 'endif
4170 end select
4180 '4.終了するを選択  パッドの右
4190 endif
4200 'バーチャルパッド　上　ここまで
4210 '2.カーソルの処理
4220 'カーソル　下 chr$(31)
4230 if (key$ = chr$(31)) then
4240 select case (No)
4250 '4
4260 '0 選択肢4 => 選択肢1
4270 case 0:
4280 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "              ":color rgb(0,0,0):
4290 if lang_flag = 1 then
4300 'lang flag:1 英語
4310 else
4320 'lang flag:0 日本語
4330 color rgb(0,0,0):locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4340 endif
4350 '1 選択肢1 => 選択肢2
4360 case 1:
4370 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":
4380 if lang_flag = 1 then
4390 'lang_flag:1 英語
4400 else
4410 'lang_flag:0 日本語
4420 color rgb(0,0,0):locate 0,15:print "2.設定を選択":beep:goto Main_Select:
4430 endif
4440 '2 選択肢2 => 選択肢3
4450 case 2:
4460 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,15:print "               ":
4470 if lang_flag = 1 then
4480 'lang flag:1 英語
4490 else
4500 'lang flang:0 日本語
4510 color rgb(0,0,0):locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4520 endif
4530 '3 選択肢３ => 選択肢4
4540 case 3:
4550 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,595),0,0:locate 0,15:print "               ":color rgb(0,0,0)
4560 if lang_flag = 1 then
4570 'lang_flag = 1 英語
4580 else
4590 'lang_flag = 0 日本語
4600 color rgb(0,0,0):locate 0,15:print "4.終 了を選択":goto Main_Select:
4610 endif
4620 case else:
4630 goto Main_Select:
4640 end select
4650 endif
4660 'カーソル　上
4670 if key$=chr$(30) then
4680 select case (No)
4690 '選択肢1 => 選択肢4
4700 case 1:
4710 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:PRINT "                      ":
4720 if lang_flag = 1 then
4730 'lang_flag=1:英語
4740 'print "1.It has selected Kazutama check":goto Main_Select:
4750 else
4760 'lang_flag = 0:日本語
4770 else
4780 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4790 endif
4800 '選択肢2 => 選択肢1
4810 case 2:
4820 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                 ":locate 1,15:print "2.設 定を選択":goto Main_Select:
4830 '選択肢3　=> 選択肢2
4840 case 3:
4850 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,500),0,0
4860 if lang_flag = 1 then
4870 'lang_flag = 1:英語
4880 locate 0,15:print "It has selected Help":goto Main_Select:
4890 else
4900 'lang_flag = 0:日本語
4910 locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4920 endif
4930 '選択肢4 => 選択肢3
4940 case 0:
4950 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                ":locate 1,15:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
4960 if lang_flag = 1 then
4970 'lang flag=1 英語
4980 else
4990 'lang flag=0 日本語
5000 locate 1,15:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
5010 endif
5020 end select
5030 endif
5040 'Input "番号:",No
5050 'エンターキー入力:決定
5060 if key$ = chr$(13) then
5070 select case No
5080 case 1:
5090 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
5100 case 3:
5110 Color rgb(255,255,255):goto Help:
5120 case 0:
5130 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg buf_finish_Message$:color rgb(255,255,255):pause 4.080 * 1000:end
5140 case 2:
5150 color rgb(255,255,255):sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
5160 end select
5170 endif
5180 '1-1.数霊チェック
5190 Surei_Check:
5200 cls 3:Font 48:
5210 select case device_No
5220  case 1:
5230 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5240 gload Gazo$ + "downscreen.png",0,0,800
5250 case 2:
5260 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5270 end select
5280 play ""
5290 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
5300 color rgb(255,0,0)
5310 'print "●数霊(かずたま)チェックトップ" + chr$(13)
5320 sp_on 0,1:sp_put 0,(5,300),0,0:screen 1,1,1
5330 if lang_flag = 1 then
5340 'lang_flag=1 英語
5350 else
5360 'lang_flag=0 日本語
5370 print chr$(13)+chr$(13)+chr$(13)
5380 color rgb(255,255,255)
5390 print "番号を選んでください" + chr$(13)
5400 print " :1.数霊(かずたま)1人用" + chr$(13)
5410 print " :2.数霊(かずたま)リスト 1人用　" + chr$(13)
5420 print " :3.数霊(かずたま)2人用" + chr$(13)
5430 print " :4.トップ画面に行く" + chr$(13)
5440 color rgb(0,0,0):No = 1
5450 locate 0,15:print "                                       "
5460 locate 0,15
5470 print " 1.数霊(かずたま)1人用を選択"
5480 endif
5490 Kazutama_main:
5500 'y:バーチャルパッドの処理
5510 'key$:カーソルの処理
5520 'bg:バーチャルパッドの右のボタン
5530 y = 0:key$ = "":bg=0
5540 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
5550 y = stick(1)
5560 key$ = inkey$
5570 bg=strig(1)
5580 y=stick(-1)
5590 pause 2
5600 wend
5610 'key$ = input$(1)
5620 if y = 1 then
5630 select case No
5640 'No の初期値：No=1
5650 case 2:
5660 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                       ":
5670 locate 0,15:print "                                     "
5680 locate 0,15
5690 print" 3.数霊(かずたま)2人用を選択":goto Kazutama_main:
5700 'デバッグライン　ここから
5710 '0のとき
5720 'デバッグライン　ここまで
5730 'デバッグライン　ここから
5740 case 3:
5750 sp_on 2,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_on 0,1:sp_put 0,(5,585),0,0:pause 200:locate 0,15:print "                                               "
5760 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":No=0:goto Kazutama_main:
5770 'デバッグライン　ここまで
5780 'デバッグライン　ここから
5790 'デバッグライン　ここまで
5800 case 0:
5810 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5820 case 1:
5830 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                          ":locate 0,15:print " 2.数霊（かずたま）リスト 1人用":goto Kazutama_main:
5840 'デバッグライン　ここから
5850 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
5860 'デバッグライン　ここまで
5870 end select
5880 endif
5890 'バーチャルパッド　上 ここから
5900 if y = -1 then
5910 select case No
5920 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
5930 case 1:
5940 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 0,15:print" 4.トップ画面に行くを選択":goto Kazutama_main:
5950 'No:3 3.Help→2.設定 No:2
5960 case 0:
5970 sp_on 1,0:sp_on 0,0:sp_on 3,1:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                     ":locate 0,15:print" 3.数霊（かずたま）2人用を選択":goto Kazutama_main:
5980 case 2:
5990 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                    ":locate 0,15:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
6000 case 3:
6010 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                               ":locate 0,15:print "2.数霊(かずたま)リスト1人用を選択":goto Kazutama_main:
6020 end select
6030 endif
6040 if bg=2 then
6050 select case No
6060 '1.数霊チェックを選択  パッドの右キー
6070 case 1:
6080 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
6090 '2.数霊チェック2人用   パッドの右キー
6100 case 3:
6110 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
6120 '3.トップ画面に行く パッドの右
6130 case 0:
6140 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
6150 '2.数霊リスト1人用 パッドの右キー
6160 case 2:
6170 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_List1:
6180 'プログラムの終了を選択
6190 end select
6200 '4.終了するを選択  パッドの右
6210 endif
6220 'バーチャルパッド　上　ここまで
6230 if key$ = chr$(31) then
6240 select case No
6250 case 0:
6260 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,15:print "                                                          ":
6270 if lang_flag = 1 then
6280 Else
6290 locate 0,15:print "                                      "
6300 No=2:locate 0,15:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
6310 endif
6320 case 1:
6330 No=0:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,585),0,0:locate 0,12:print "                                                          ":
6340 if lang_flag = 1 then
6350 Else
6360 locate 0,15:print"                                      "
6370 locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
6380 endif
6390 case 2:
6400 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                      ":
6410 if lang_flag = 1 then
6420 Else
6430 No=1:locate 0,15:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
6440 endif
6450 end select
6460 endif
6470 if key$=chr$(13) then
6480 select case No
6490 case 1:
6500 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
6510 case 2:
6520 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
6530 case 3:
6540 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
6550 '終了はトップメニューのみにする
6560 end select
6570 endif
6580 '前の画面に戻る
6590 'プログラムの終了
6600 '1人用
6610 '2人用
6620 '数霊(かずたま) 文字入力  1人用
6630 Surei_Input:
6640 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
6650 if mode = 0 then
6660 cls 3:font 32:init"kb:2"
6670 select case device_No
6680 case 1:
6690 gload Gazo$ + "InputKotodama_20230131.png",0,0,0
6700 gload Gazo$ + "CenterScreen_20230401.png",0,0,380
6710 case 2:
6720 gload Gazo$ + "InputKotodama_20230131.png",0,0,0
6730 end select
6740 play""
6750 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
6760 color rgb(255,0,0)
6770 if lang_flag=1 then
6780 '英語
6790 else
6800 print chr$(13)+chr$(13)+chr$(13)
6810 color rgb(255,255,255)
6820 print "文字を入れてください" + chr$(13)
6830 color rgb(255,255,255)
6840 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
6850 print chr$(13)
6860 color rgb(0,0,0)
6870 Input "入力文字:",buffer_moji$
6880 if buffer_moji$ = "" then
6890 ui_msg "未入力です":goto Surei_Input:
6900 else
6910 goto Surei_Result:
6920 endif
6930 endif
6940 endif
6950 if mode = 1 then
6960 cls 3:Font 32:
6970 gload Gazo$ + "InputKotodama.png"
6980 color rgb(255,0,0)
6990 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
7000 color rgb(255,255,255)
7010 print "文字を入れてください" + chr$(13)
7020 color rgb(255,0,0)
7030 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
7040 print "大文字のみ)" + chr$(13)
7050 color rgb(0,0,0)
7060 Input "文字入力:",buffer_moji2$
7070 goto Surei_Result3:
7080 'endif
7090 endif
7100 '数霊(かずたま)文字入力　2人用
7110 Surei_twoParson:
7120 cls 3:Font 32:init"kb:2"
7130 gload Gazo$ + "InputKotodama_20230131.png"
7140 '1人目入力
7150 if lang_flag = 1 then
7160 else
7170 print ""+chr$(13)+chr$(13)+chr$(13)
7180 color rgb(255,255,255)
7190 print "1人目の文字を入れてください" + chr$(13)
7200 color rgb(255,255,255)
7210 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
7220 color rgb(0,0,0)
7230 print chr$(13)
7240 Input "1人目文字入力:",buf_Parson1$
7250 endif
7260 Surei_twoParson2:
7270 cls 3:Font 32:init"kb:2"
7280 '2人目入力
7290 gload Gazo$ + "InputKotodama_20230131.png"
7300 if lang_falg = 1 then
7310 else
7320 print ""+chr$(13)+chr$(13)+chr$(13)
7330 color rgb(255,255,255)
7340 print "2人目の文字を入れてください" + chr$(13)
7350 color rgb(255,255,255)
7360 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
7370 color rgb(0,0,0)
7380 Input "2人目の文字入力:",buf_Parson2$
7390 goto Surei_Result2:
7400 endif
7410 '数霊　計算 パート
7420 '文字の計算関数
7430 'moji$:1文字を入れる
7440 func Complate(moji$)
7450 for n = 1 to 116
7460 if moji$ = bufline$(2*n) then
7470 buffcount = val(bufline$(2 * n + 1))
7480 endif
7490 next n
7500 endfunc buffcount
7510 '数霊　結果表示
7520 Surei_Result:
7530 cls 3:Font 32
7540 'ゼロカウント:zcount
7550 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
7560 '例 アカい:"い"の文字は無効な文字なので、はじく
7570 zcount=0
7580 'mojicount:入力文字数
7590 mojicount = len(buffer_moji$)
7600 for n=1 to mojicount
7610 for j=1 to 118
7620 if (bufcount$(n - 1) = bufline$(2 * j)) then
7630 bufcount$(n-1) = Mid$(buffer_moji$,n,1)
7640 endif
7650 next j
7660 next n
7670 ncount=0:count=0
7680 for i = 1 to mojicount
7690 bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7700 'ンのカウント
7710 if (bufcount$(i-1) = "ン") then ncount = ncount + 1
7720 next i
7730 if (ncount > 0) then
7740 'Listを表示する
7750 moji_List$(0) = "この単語は目に見える物です"
7760 moji_List$(1) = "この単語は目に見えない物です"
7770 num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
7780 if (num2 = 0) then
7790 else
7800 if (num2 = 1) then
7810 n1 = 9 * ncount
7820 endif
7830 endif
7840 endif
7850 for j=1 to mojicount
7860 bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7870 count = count + Complate(bufcount$(j - 1))
7880 next j
7890 count = count + n1
7900 if (ncount > 0) then count = count
7910 '182以上のとき,181を引く
7920 if buf_cofig_r = 0 then
7930 if (count > 181) then
7940 count = count - 181
7950 else
7960 if (buf_config_r = 1) then
7970 buf_count = Single_Complate(count)
7980 endif
7990 endif
8000 endif
8010 cls 3:Font 48+16
8020 gload Gazo$ + "Result_Screen3_20230319.png"
8030 if buf_config_r = 1 then
8040 print "入力文字:" + buffer_moji$ + chr$(13)
8050 print "数霊(かずたま):";buf_count;chr$(13)
8060 endif
8070 if lang_flag = 1 then
8080 else
8090 color rgb(255,0,0)
8100 print "入力文字:" + buffer_moji$ + chr$(13)
8110 endif
8120 if lang_flag = 1 then
8130 else
8140 color rgb(0,0,255)
8150 print "数霊(かずたま):";count;chr$(13)
8160 endif
8170 if lang_flag = 1 then
8180 else
8190 color rgb(0,0,0)
8200 print "エンター or スペース" + chr$(13)
8210 print  chr$(13)
8220 'endif
8230 endif
8240 key$ = input$(1)
8250 if ((key$ = chr$(13)) or (key$=" ")) then
8260 List$(0)="1.もう一度数霊を見る"
8270 List$(1)="2.トップ画面に行く"
8280 List$(2)="3.この数霊の説明を見る"
8290 List$(3)="4.数霊データーを保存"
8300 num=ui_select("List$","番号を選んでください")
8310 select case num
8320 case 0:
8330 goto Surei_Input:
8340 case 1:
8350 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
8360 for i=0 to 9
8370 bufcount$(i)=""
8380 next i
8390 goto TopScreen:
8400 case 2:
8410 goto Surei_Result4:
8420 case 3:
8430 s=Surei_Result_Save_File()
8440 ui_msg "保存しました"
8450 case -1:
8460 'goto Surei_Result:
8470 case else:
8480 goto Surei_Result:
8490 end select
8500 'ファイルを保存する
8510 else
8520 goto Surei_Result:
8530 endif
8540 '3-1 バージョン情報
8550 Version:
8560 cls 3:Font 32
8570 select case device_No
8580 case 1:
8590 gload Gazo$ + "Screen1_Version.png"
8600 gload Gazo$ + "downscreen.png",0,0,800
8610 case 2:
8620 gload Gazo$ + "Screen1_version.png"
8630 end select
8640 play ""
8650 play Voice_File_TopScreen$ + "Voice_Version.mp3"
8660 color rgb(255,0,0)
8670 print chr$(13)
8680 color rgb(255,255,255)
8690 if lang_flag = 1 then
8700 else
8710 print chr$(13)+chr$(13)+chr$(13)
8720 print "Ver:";Version$ + chr$(13)
8730 print "アプリ名:数霊計算機" + chr$(13)
8740 print "Basic for Android Runtime" + chr$(13)
8750 print "Author:licksjp" + chr$(13)
8760 print "制作開始:2021.7.28" + chr$(13)
8770 print chr$(13)
8780 print "(C)Copy right licksjp " + chr$(13)
8790 print "All rights reserved" + chr$(13)
8800 print chr$(13)
8810 color rgb(0,0,0)
8820 print "パッドの右を押してください" + chr$(13)
8830 endif
8840 bg=0:key$=""
8850 while (bg <> 2 and key$ <> chr$(13))
8860 bg = strig(1)
8870 key$ = inkey$
8880 pause 2
8890 wend
8900 if key$ = chr$(13) then
8910 goto TopScreen:
8920 else
8930 if bg=2 then
8940 goto TopScreen:
8950 else
8960 if lang_flag = 1 then
8970 else
8980 talk "無効なキーです":goto Version:
8990 endif
9000 endif
9010 endif
9020 '3-2 参考文献
9030 Reference_Book:
9040 cls 3:Font 48:play""
9050 select case device_No
9060 case 1:
9070 gload Gazo$ + "Screen1_Reference.png"
9080 gload Gazo$ + "downscreen.png",0,0,800
9090 case 2:
9100 gload Gazo$ + "Screen1_Reference.png"
9110 end select
9120 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
9130 color rgb(255,0,0)
9140 print chr$(13)+chr$(13)
9150 if lang_flag = 1 then
9160 else
9170 color rgb(255,255,255)
9180 print "書名:数霊" + chr$(13)
9190 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
9200 print "出版社:徳間書店" + chr$(13)
9210 print "ISBN:978-4-19-" + chr$(13)
9220 print "         865309-5" + chr$(13)
9230 print "定価:2300円 + 税" + chr$(13)
9240 color rgb(0,0,0)
9250 print "パッドの右を押してください"
9260 endif
9270 bg = 0:key$ = ""
9280 while (bg <> 2 and key$ <> chr$(13))
9290 bg = strig(1)
9300 key$ = inkey$
9310 pause 2
9320 wend
9330 if key$ = chr$(13) then
9340 goto TopScreen:
9350 else
9360 if bg = 2 then
9370 goto TopScreen:
9380 else
9390 talk "無効なキーです":goto Reference_Book:
9400 endif
9410 endif
9420 'ヘルプ画面　トップ画面
9430 Help:
9440 No=1:c=0
9450 play ""
9460 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
9470 cls 3:Font 48:
9480 select case device_No
9490 case 1:
9500 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9510 gload Gazo$ + "downscreen.png",0,0,800
9520 case 2:
9530 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9540 end select
9550 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0
9560 color rgb(255,0,0)
9570 print chr$(13)+chr$(13)+chr$(13)
9580 color rgb(255,255,255)
9590 print "番号を選んでください" + chr$(13)
9600 print " :1.バージョン" + chr$(13)
9610 print " :2.参考文献" + chr$(13)
9620 print " :3.トップ画面に行く" + chr$(13)
9630 color rgb(0,0,0)
9640 locate 0,15:print "                                     "
9650 if No = 1 then locate 0,15:print " 1.バージョンを選択"
9660 'y:バーチャルパッドの処理
9670 'key$:カーソルの処理
9680 'bg:バーチャルパッドの右ボタン
9690 Help_key:
9700 y = 0:key$ = "":bg=0
9710 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
9720 y = stick(1)
9730 key$ = inkey$
9740 bg=strig(1)
9750 pause 2
9760 wend
9770 'バーチャルパッド　ここから'
9780 if y = 1 then
9790 select case No
9800 'No の初期値：No=1
9810 case 1:
9820 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
9830 if lang_flag = 1 then
9840 else
9850 locate 0,15:print" 2.参考文献を選択":goto Help_key:
9860 endif
9870 'デバッグライン　ここから
9880 '0のとき
9890 'デバッグライン　ここまで
9900 'デバッグライン　ここから
9910 case 2:
9920 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                  "
9930 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に行くを選択":No=0:goto Help_key:
9940 'デバッグライン　ここまで
9950 'デバッグライン　ここから
9960 'デバッグライン　ここまで
9970 case 0:
9980 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
9990 'デバッグライン　ここから
10000 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
10010 'デバッグライン　ここまで
10020 end select
10030 endif
10040 'バーチャルパッド　上 ここから
10050 if y = -1 then
10060 select case No
10070 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
10080 case 1:
10090 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=0:locate 0,15:print"                                       ":locate 0,15:print" 3.トップ画面に行くを選択":goto Help_key
10100 'No:3 3.Help→2.設定 No:2
10110 case 0:
10120 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
10130 case 2:
10140 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                     ":locate 0,15:print" 1.バージョンを選択":goto Help_key:
10150 end select
10160 endif
10170 if bg = 2 then
10180 select case No
10190 '1.数霊チェックを選択  パッドの右キー
10200 case 1:
10210 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
10220 '2.設定を選択    パッドの右キー
10230 case 2:
10240 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
10250 '3.ヘルプを選択 パッドの右
10260 case 0:
10270 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
10280 'プログラムの終了を選択
10290 'if lang_flag = 1 then
10300 'lang_flag = 1:英語
10310 'Else
10320 'lang_flag = 0:日本語
10330 'endif
10340 end select
10350 '4.終了するを選択  パッドの右
10360 endif
10370 'バーチャルパッド　上　ここまで
10380 'バーチャルパッド　ここまで'
10390 'key$ = input$(1)
10400 'カーソルの下
10410 if key$ = chr$(31) then
10420 select case (No Mod 4)
10430 'バージョンから参考文献
10440 case 0:
10450 c=1:No=c:locate 0,15:Print "             ":locate 0,15:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
10460 '参考文献からトップ画面
10470 case 1:
10480 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "            ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10490 'トップ画面から終了
10500 '終了からバージョン
10510 case 2:
10520 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                     ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10530 case else:
10540 goto Help_key:
10550 end select
10560 endif
10570 'カーソル　上
10580 if key$ = chr$(30) then
10590 select case (c Mod 4)
10600 'バージョンから終了
10610 case 0:
10620 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:locate 0,15:print "                   ":locate 0,15:print " 4.終 了を選択":goto Help_key:
10630 '参考文献からバージョン
10640 case 1:
10650 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                   ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10660 'トップ画面から参考文献
10670 case 2:
10680 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":locate 0,15:print " 2.参考文献を選択":goto Help_key:
10690 '終了からトップ画面を選択
10700 case 3:
10710 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print"                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10720 case else:
10730 goto Help_key:
10740 end select
10750 endif
10760 'エンターキー：決定
10770 if key$=chr$(13) then
10780 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10790 if No=0 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10800 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10810 else
10820 goto Help_key:
10830 endif
10840 '登録文字の確認
10850 '文字を1文字入れて登録されているか調べるメニュー
10860 '設定項目
10870 Setting:
10880 cls 3:Font 48
10890 select case device_No
10900 case 1:
10910 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
10920 gload Gazo$ + "downscreen.png",0,0,800
10930  case 2:
10940 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
10950 end select
10960 play ""
10970 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
10980 No=1
10990 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:
11000 color rgb(0,0,255)
11010 print chr$(13)
11020 if lang_flag = 1 then
11030 'lang_flag = 1:英語
11040 else
11050 'lang_flag = 0:日本語
11060 color rgb(255,255,255)
11070 print chr$(13)
11080 print "番号を選んでください" + chr$(13)
11090 '-------コメント----------------
11100 'print " :1.登録文字の確認" + chr$(13)
11110 'print " :2.数霊文字確認" + chr$(13)
11120 '-------コメント----------------
11130 'print chr$(13)
11140 print " :1.文字の項目" + chr$(13)
11150 print " :2.結果表示設定" + chr$(13)
11160 print " :3.言語設定" + chr$(13)
11170 print " :4.トップ画面に行く" + chr$(13)
11180 endif
11190 color rgb(0,0,0)
11200 locate 0,15
11210 if No=1 then locate 0,15:print  "                                     ":locate 0,15:print " 1.文字の項目を選択"
11220 'y:バーチャルパッドの処理
11230 'key$:カーソルの処理
11240 'bg:バーチャルパッドの右ボタン
11250 SettingScreen:
11260 y = 0:key$ = "":bg=0
11270 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
11280 y = stick(1)
11290 key$ = inkey$
11300 bg=strig(1)
11310 pause 2
11320 wend
11330 'バーチャルパッド　ここから'
11340 'バーチャルパッド　ここから'
11350 if y = 1 then
11360 select case No
11370 'No の初期値：No=1
11380 case 1:
11390 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":color rgb(0,0,0):locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11400 'デバッグライン　ここから
11410 '0のとき
11420 'デバッグライン　ここまで
11430 'デバッグライン　ここから
11440 case 2:
11450 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                         "
11460 color rgb(0,0,0)::No=3
11470 if lang_flag = 1 then
11480 else
11490 locate 1,15:print "3.言語設定を選択":goto SettingScreen:
11500 endif
11510 'デバッグライン　ここまで
11520 case 3:
11530 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                              ":locate 1,15:print "4.トップ画面に行くを選択":No=0:goto SettingScreen:
11540 'デバッグライン　ここから
11550 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11560 'デバッグライン　ここまで
11570 case 0:
11580 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
11590 'デバッグライン　ここから
11600 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11610 'デバッグライン　ここまで
11620 end select
11630 endif
11640 'バーチャルパッド　上 ここから
11650 if y = -1 then
11660 select case No
11670 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11680 case 1:
11690 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 1,15:print"4.トップ画面に行くを選択":goto SettingScreen:
11700 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11710 case 0:
11720 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
11730 'No:3 3.Help→2.設定 No:2
11740 case 3:
11750 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.結果表示設定を選択":goto SettingScreen:
11760 case 2:
11770 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 1,15:print"1.文字の項目を選択":goto SettingScreen:
11780 end select
11790 endif
11800 if bg=2 then
11810 select case No
11820 '1.数霊チェックを選択  パッドの右キー
11830 case 1:
11840 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
11850 '2.設定を選択    パッドの右キー
11860 case 2:
11870 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
11880 '3.ヘルプを選択 パッドの右
11890 case 0:
11900 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
11910 'プログラムの終了を選択
11920 case 3:
11930 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Setting_Language:
11940 end select
11950 endif
11960 '4.終了するを選択  パッドの右
11970 'バーチャルパッド　ここまで'
11980 'カーソル下'
11990 if key$ = chr$(31) then
12000 select case (No Mod 4)
12010 '登録文字から数霊文字の確認
12020 case 1:
12030 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                     ":locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
12040 '数霊文字の確認からトップ画面に行く
12050 case 2:
12060 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "                                     ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
12070 'トップ画面に行くから終了
12080 case 3:
12090 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,590),0,0:locate 0,15:print "                                       ":locate 1,15:print "4.トップ画面に行くを選択":goto SettingScreen:
12100 '終了から登録文字
12110 case 0:
12120 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
12130 end select
12140 endif
12150 'カーソル　上
12160 if key$ = chr$(30) then
12170 select case (No Mod 4)
12180 case 1:
12190 c=2:No=c:sp_on 0,1:sp_put 0,(5,300),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
12200 case 2:
12210 c=3:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
12220 case 3:
12230 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:goto SettingScreen:
12240 case 0:
12250 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,590),0,0:sp_on 0,0:goto SettingScreen:
12260 end select
12270 endif
12280 'エンターキーを押したとき
12290 if key$ = chr$(13) then
12300 if No=3 then goto Setting_Language:
12310 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
12320 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
12330 if No=0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
12340 endif
12350 '文字検索項目  ここから
12360 Moji_Search:
12370 cls 4:cls 3:Font 32+16:init"kb:2"
12380 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12390 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12400 play ""
12410 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
12420 print "" + chr$(13)
12430 color rgb(255,255,255)
12440 if lang_flag = 1 then
12450 Else
12460 print "文字を一文字入れてください" + chr$(13)
12470 endif
12480 color rgb(0,0,0)
12490 if lang_flag=1 then
12500 Else
12510 Input "登録文字:",moji$
12520 endif
12530 moji_count = len(moji$)
12540 if moji_count > 1 then
12550 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Moji_Search:
12560 else
12570 count=0
12580 for n = 0 to 116
12590 if bufline$(2*n) = moji$ then
12600 cls 3:font 48:init"kb:4"
12610 select case device_No
12620 case 1:
12630 gload Gazo$ + "downscreen.png",0,0,800
12640 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12650 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12660 case 2:
12670 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12680 end select
12690 play ""
12700 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12710 if lang_flag = 1 then
12720 Else
12730 print chr$(13)
12740 color rgb(255,255,255)
12750 print moji$;"は、登録されています。" + chr$(13)
12760 color rgb(0,0,0)
12770 print "ジョイパッドの右を押してください"
12780 endif
12790 bg = 0:key$ = ""
12800 while (bg <> 1 and key$ <> chr$(13))
12810 key$ = inkey$
12820 bg = strig(1)
12830 pause 2
12840 wend
12850 if key$ = chr$(13) then goto TopScreen:
12860 if bg=1 then goto TopScreen:
12870 count = count + 1
12880 endif
12890 next n
12900 if count = 0 then
12910 cls 3:font 48:init "kb:4"
12920 gload Gazo$ + "Moji_check.png"
12930 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12940 play ""
12950 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
12960 print chr$(13)
12970 if lang_flag = 1 then
12980 Else
12990 color rgb(255,255,255)
13000 print moji$;"は、登録されていません。" + chr$(13)
13010 color rgb(0,0,0)
13020 print "パッドの右を押してください" + chr$(13)
13030 endif
13040 bg = 0:key$ = ""
13050 while (kg <> 1 and key$ <> chr$(13))
13060 key$ = inkey$
13070 bg = strig(1)
13080 pause 2
13090 wend
13100 if ((key$ = chr$(13)) or (bg=2)) then goto TopScreen:
13110 endif
13120 endif
13130 Surei_Result2:
13140 cls 3:Font 48
13150 zcount1=0:zcount2=0:count1=0:count2=0
13160 '1人目
13170 mojicount1=len(buf_Parson1$)
13180 '2人目
13190 mojicount2 = len(buf_Parson2$)
13200 '1人目
13210 for n = 1 to mojicount1
13220 for j = 1 to 116
13230 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
13240 if bufcount1$(n-1) = bufline$(2*j) then
13250 zcount1 = zcount1 + 1
13260 endif
13270 next j
13280 next n
13290 '2人目
13300 for n = 1 to mojicount2
13310 for j = 1 to 116
13320 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
13330 if bufcount2$(n-1) = bufline$(2*j) then
13340 zount2 = zcount2 + 1
13350 endif
13360 next j
13370 next n
13380 '1人目
13390 for i=1 to mojicount1
13400 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
13410 p1 = Complate(bufcount1$(i-1))
13420 count1 = count1 + p1
13430 next i
13440 '2人目
13450 for i = 1 to mojicount2
13460 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
13470 p2 = Complate(bufcount2$(i-1))
13480 count2 = count2 + p2
13490 next i
13500 cls 3:
13510 select case device_No
13520 case 1:
13530 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
13540 gload Gazo$ + "downscreen.png",0,0,800
13550 case 2:
13560 gload Gazo$ + "downscreen.png",0,0,0
13570 end select
13580 color rgb(255,0,0)
13590 print ""+chr$(13)
13600 if lang_flag = 1 then
13610 else
13620 color rgb(255,255,255)
13630 print chr$(13)+chr$(13)
13640 print "1人目:";buf_Parson1$;chr$(13)
13650 print "数霊1:";count1;chr$(13)
13660 print "2人目:";buf_Parson2$;chr$(13)
13670 print "数霊2:";count2;chr$(13)
13680 print "数霊(合計):";count1 + count2;chr$(13)
13690 color rgb(0,0,0)
13700 print "バーチャルパッドの右" + chr$(13)
13710 endif
13720 key$ = "":bg = 0
13730 while (bg <> 2 and key$ <> chr$(13))
13740 bg = strig(1)
13750 key$ = inkey$
13760 pause 2
13770 wend
13780 if (bg = 2 or key$ = chr$(13))  then goto TopScreen:
13790 Surei_Result3:
13800 cls 3:Font 48
13810 zcount2 = 0:count2 = 0
13820 mojicount2 = len(buffer_moji2$)
13830 for n = 1 to mojicount2
13840 for j = 1 to 116
13850 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
13860 if bufcount2$(n - 1) = bufline$(2 * j) then
13870 zcount2 = zcount2 + 1
13880 endif
13890 next j
13900 next n
13910 for i = 1 to mojicount2
13920 n2 = Complate(bufcount2$(i-1))
13930 count2 = count2 + n2
13940 next i
13950 gload Gazo$ + "Screen5.png"
13960 if lang_flag = 1 then
13970 else
13980 color rgb(255,0,0)
13990 print "数霊の結果表示" + chr$(13)
14000 color rgb(255,255,255)
14010 print "１回目回の文字入力:";buffer_moji$;chr$(13)
14020 print "１回目の数霊(かずたま)";count;chr$(13)
14030 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
14040 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
14050 color rgb(0,0,0)
14060 print "エンターキー:トップ画面";chr$(13)
14070 print "c or C キー:数霊の比較";chr$(13)
14080 endif
14090 key$ = "":bg = 0
14100 while (key$ <> chr$(13) and bg <> 2)
14110 bg = strig(1)
14120 key$ = inkey$
14130 pause 2
14140 wend
14150 if bg = 2 then goto TopScreen:
14160 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
14170 if key$ = "c" or key$ = "C" then
14180 if count = count2 then
14190 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
14200 else
14210 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
14220 endif
14230 endif
14240 Moji_Count_Check:
14250 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
14260 cls 3:Font 48
14270 select case device_No
14280 case 1:
14290 gload Gazo$ + "Moji_check.png"
14300 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
14310 gload Gazo$ + "downscreen.png",0,0,800
14320 case 2:
14330 gload Gazo$ + "Moji_check.png",0,0,0
14340 end select
14350 n = 0
14360 open FILE_csv$ for input as #1
14370 while eof(1) = 0
14380 line input #1, line$
14390 n = n + 1
14400 wend
14410 close #1
14420 play ""
14430 if n = 118 then
14440 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
14450 if lang_flag = 1 then
14460 else
14470 print "" + chr$(13)
14480 color rgb(255,255,255)
14490 print "文字の登録文字数は";n;"文字" + chr$(13)
14500 color rgb(0,0,0)
14510 print "パッドの右を押してください" + chr$(13)
14520 endif
14530 endif
14540 key$ = "":bg = 0
14550 while (key$ <> chr$(13) and bg <> 2)
14560 key$=inkey$
14570 bg=strig(1)
14580 pause 2
14590 wend
14600 if bg = 2 then goto TopScreen:
14610 if key$ = chr$(13) then
14620 goto TopScreen:
14630 else
14640 goto Moji_Count_Check:
14650 endif
14660 'Save 関数
14670 file_kazutama = 0
14680 file_kazutama = Save_File()
14690 func Save_File()
14700 open SAVE_DATA1$  for output as #1
14710 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
14720 close #1
14730 endfunc
14740 Select_moji:
14750 cls 3:font 48:No = 1
14760 select case device_No
14770 case 1:
14780 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
14790 'gload Gazo$ + "MiddleScreen_20230401.png",0,0,560
14800 gload Gazo$ + "downscreen.png",0,0,800
14810 case 2:
14820 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
14830 end select
14840 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
14850 color rgb(255,0,0)
14860 if lang_flag = 1 then
14870 else
14880 play ""
14890 play Voice_File_TopScreen$ + "Voice_Select_Moji20230217.mp3"
14900 print chr$(13)+chr$(13)+chr$(13)
14910 color rgb(255,255,255)
14920 print "番号を選んでください" + chr$(13)
14930 print " :1.登録文字検索"+ chr$(13)
14940 print " :2.登録文字数の確認" + chr$(13)
14950 print " :3.数字から数霊の説明"+chr$(13)
14960 print " :4.トップ画面に戻る" + chr$(13)
14970 color rgb(0,0,0)
14980 locate 0,15
14990 if No = 1 then print " 1.登録文字検索を選択"
15000 endif
15010 Entry_check_key:
15020 y = 0:key$ = "":bg=0
15030 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
15040 y = stick(1)
15050 key$ = inkey$
15060 bg=strig(1)
15070 pause 2
15080 wend
15090 'バーチャルパッド　ここから'
15100 'バーチャルパッド　ここから'
15110 if y = 1 then
15120 select case No
15130 'No の初期値：No=1
15140 case 1:
15150 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print "2.登録文字数の確認を選択":goto Entry_check_key:
15160 'デバッグライン　ここから
15170 '0のとき
15180 'デバッグライン　ここまで
15190 'デバッグライン　ここから
15200 case 2:
15210       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 0,15:print "                                                         ":No=3:locate 0,15:print"3.数字から数霊の説明":goto Entry_check_key:
15220 case 3:
15230 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:locate 0,15:print "                                       "
15240 :No=0
15250 'if lang_flag = 1 then
15260 'Else
15270 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に戻るを選択":goto Entry_check_key:
15280 'endif
15290 'cls:color rgb(255,255,255):print"ok"
15300 'デバッグライン　ここまで
15310 'デバッグライン　ここから
15320 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
15330 'デバッグライン　ここまで
15340 case 0:
15350 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.登録文字数の確認を選択":goto Entry_check_key:
15360 'デバッグライン　ここから
15370 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
15380 'デバッグライン　ここまで
15390 end select
15400 endif
15410 'バーチャルパッド　上 ここから
15420 if y = -1 then
15430 select case No
15440 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15450 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15460 case 0:
15470       sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print "                                      ":locate 0,15:print "3.数字から数霊の説明":goto Entry_check_key:
15480 case 1:
15490 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print"3.トップ画面に戻るを選択":goto Entry_check_key:
15500 'No:3 3.Help→2.設定 No:2
15510 case 3:
15520 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
15530 case 2:
15540 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print "1.登録文字検索":goto Entry_check_key:
15550 end select
15560 endif
15570 if bg=2 then
15580 select case No
15590 '1.数霊チェックを選択  パッドの右キー
15600 case 1:
15610 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15620 '2.設定を選択    パッドの右キー
15630 case 2:
15640 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15650 '3.ヘルプを選択 パッドの右
15660 case 0:
15670 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15680 case 3:
15690 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Input_numbertokazutama:
15700 end select
15710 endif
15720 '4.終了するを選択  パッドの右
15730 'バーチャルパッド　ここまで'
15740 'key$ = input$(1)
15750 'カーソルの下
15760 if key$ = chr$(31) then
15770 select case (No Mod 4)
15780 case 0:
15790 c=1:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
15800 case 1:
15810 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,500),0,0:sp_on 3,0:goto Entry_check_key:
15820 case 2:
15830 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:goto Entry_check_key:
15840 case 3:
15850 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
15860 end select
15870 endif
15880 'カーソル　上
15890 if key$ = chr$(30) then
15900 select case (No Mod 4)
15910 case 0:
15920 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
15930 case 1:
15940 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
15950 case 2:
15960 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
15970 case 3:
15980 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
15990 end select
16000 endif
16010 'エンターキーを押す
16020 if key$ = chr$(13) then
16030 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
16040 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
16050 if No = 0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16060 endif
16070 '
16080 Kakunin_Surei_count:
16090 cls 3:font 48:No=0
16100 select case device_No
16110 case 1:
16120 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
16130 'gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
16140 gload Gazo$ + "downscreen.png",0,0,800
16150 case 2:
16160 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
16170  end select
16180 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
16190 color rgb(255,0,0)
16200 print chr$(13)+chr$(13)+chr$(13)
16210 color rgb(255,255,255)
16220 print "番号を選んでください" + chr$(13)
16230 print " :1.数霊リスト 1人用" + chr$(13)
16240 print " :2.結果表示設定" + chr$(13)
16250 print " :3.トップ画面に行く" + chr$(13)
16260 print "" + chr$(13)
16270 color rgb(0,0,0)
16280 locate 0,15:print"                                                         "
16290 if No = 0 then locate 1,15:print "1.数霊リスト　1人用を選択"
16300 Entry_List:
16310 y = 0:key$ = "":bg=0
16320 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
16330 y = stick(1)
16340 key$ = inkey$
16350 bg = strig(1)
16360 pause 2
16370 wend
16380 'バーチャルパッド　ここから'
16390 'バーチャルパッド　ここから'
16400 'バーチャルパッド　下
16410 if y = 1 then
16420 select case No
16430 'No の初期値：No=1
16440 case 0:
16450 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=1:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.結果表示設定を選択":goto Entry_List:
16460 'デバッグライン　ここから
16470 '0のとき
16480 'デバッグライン　ここまで
16490 'デバッグライン　ここから
16500 'color rgb(0,0,0):locate 0,15:print " 4.終了を選択":goto Entry_List:
16510 'cls:color rgb(255,255,255):print"ok"
16520 'デバッグライン　ここまで
16530 case 2:
16540 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,300),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 1.数霊リスト 1人用を選択":No=0:goto Entry_List:
16550 case 1:
16560 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                      ":No=2:locate 1,15:print "3．トップ画面に行くを選択":goto Entry_List:
16570 'デバッグライン　ここから
16580 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
16590 'デバッグライン　ここまで
16600 'デバッグライン　ここから
16610 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
16620 'デバッグライン　ここまで
16630 end select
16640 endif
16650 'バーチャルパッド　上 ここから
16660 if y = -1 then
16670 select case No
16680 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
16690 case 2:
16700 sp_on 2,0:sp_on 0,0:sp_on 1,1:sp_on 3,0:sp_put 1,(5,400),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 2.結果表示設定を選択":goto Entry_List:
16710 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
16720 case 0:
16730 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 1,15:print"3.トップ画面に行くを選択":goto Entry_List:
16740 'No:3 3.Help→2.設定 No:2
16750 case 1:
16760 sp_on 1,0:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 0,(5,300),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print "1.数霊リスト 1人用を選択":goto Entry_List:
16770 end select
16780 endif
16790 if bg = 2 then
16800 select case No
16810 '1.数霊リスト 一人用を選択を選択  パッドの右キー
16820 case 0:
16830 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16840 '2.設定を選択  パッドの右キー
16850 case 1:
16860 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16870 case 2:
16880 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16890 end select
16900 endif
16910 if key$=chr$(13) then
16920 select case No
16930 case 0:
16940 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16950 case 1:
16960 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16970 case 2:
16980 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16990 end select
17000 endif
17010 '4.終了するを選択  パッドの右
17020 'バーチャルパッド　ここまで'
17030 Surei_List1:
17040 cls 3:font 48
17050 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
17060 file$ = dir$(SAVE_DATA1$,0)
17070 'ファイルが無いときの画面
17080 if file$ = ""  then
17090 '背景画面表示
17100 select case device_No
17110 case 1:
17120 gload Gazo$ + "KazutamaList1.png",0
17130 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
17140 gload Gazo$+"downscreen.png",0,0,800
17150 case 2:
17160 gload Gazo$ + "KazutamaList1.png"
17170 end select
17180 print chr$(13)
17190 color rgb(255,255,255):print "登録ファイルはございません" + chr$(13)
17200 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
17210 'else
17220 'endif
17230 bg = 0:key$ = ""
17240 while (key$ <> chr$(13) and bg<>2)
17250 key$ = inkey$
17260 bg = strig(1)
17270 pause 2
17280 wend
17290 'エンターキーもしくはバーチャルパッドの右でトップに行く
17300 if (bg = 2  or key$ = chr$(13)) then goto TopScreen:
17310 else
17320 cls 3:buffer_list_count = Loadcount()
17330 color rgb(255,255,255)
17340 if lang_flag = 1 then
17350 Else
17360 talk "登録件数は" + str$(buffer_list_count) + "件です"
17370 select case device_No
17380 Case 1:
17390 gload Gazo$ + "KazutamaList1_Entry.png",0,0,0
17400 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
17410 gload Gazo$ + "downscreen.png",0,0,800
17420 case 2:
17430 gload Gazo$+"KazutamaList1_Entry.png",0,0,0
17440 end select
17450 color rgb(0,0,255)
17460 print chr$(13)
17470 color rgb(255,255,255)
17480 print "登録件数:";buffer_list_count;"件";chr$(13)
17490 color rgb(0,0,0)
17500 print "パッドの右を押してください" + chr$(13)
17510 endif
17520 bg = 0:key$ = "":bg2 = 0
17530 while (key$ <> chr$(13) and bg <> 2)
17540 key$ = inkey$
17550 bg = strig(1)
17560 bg2=strig(0)
17570 pause 2
17580 wend
17590 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
17600 if (key$ = chr$(13) or bg = 2) then pause 2:goto KotodamaList_page:
17610 endif
17620 if (bg = 2) then pause 2:goto TopScreen:
17630 func Loadcount()
17640 n = 0
17650 'while eof(1)=-1
17660 open SAVE_DATA1$  for input as #1
17670 while eof(1) <> -1
17680 line input #1,line$
17690 n = n + 1
17700 wend
17710 close #1
17720 count = n
17730 endfunc count
17740 count_line = Loadcount()
17750 func Kotodama$(buf$)
17760 color rgb(255,255,255)
17770 b = len("数霊:")
17780 a$ = Mid$(buf$,b+1,len(buf$))
17790 for i=0 to 118
17800 color rgb(255,255,255)
17810 if bufline3$(2 * i) ="数霊:" + a$  then
17820 moji_$ = bufline3$(2*i + 1)
17830 endif
17840 next i
17850 kotodama$ = moji_$
17860 endfunc kotodama$
17870 KotodamaList_page:
17880 cls 3:font 48:m = 0:
17890 select case device_No
17900 case 1:
17910 gload Gazo$ + "Screen5_Surei_List.png"
17920 gload Gazo$ + "downscreen.png",0,0,800
17930 case 2:
17940 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
17950 end select
17960 if SAVE_DATA1$ = "" then
17970 cls 3:color rgb(255,255,255):print"ファイルがありません"
17980 else
17990 a = Loadcount()
18000 open SAVE_DATA1$  for input as #1
18010 for i=0 to a-1
18020 for n=0 to 1
18030 input #1,line$
18040 bufKaztama$(i,n) = line$
18050 next n
18060 next i
18070 close #1
18080 l = 0:n=0
18090 select case device_No
18100 case 1:
18110 gload Gazo$ + "Screen5_Surei_List.png"
18120 gload Gazo$ + "downscreen.png",0,0,800
18130 case 2:
18140 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
18150 end select
18160 while (buffer_list_count >= l)
18170 cls
18180 color rgb(255,0,0)
18190 print chr$(13)
18200 color rgb(255,255,255)
18210 n=n+1
18220 print chr$(13)
18230 print "番号:";l+1;chr$(13)
18240 print bufKaztama$(l,0) + chr$(13)
18250 print bufKaztama$(l,1) + chr$(13)
18260 Kmoji$ = moji$
18270 print chr$(13) + chr$(13) + chr$(13)
18280 color rgb(0,0,0)
18290 if buffer_list_count=1 then
18300 print " :パッドの左:トップ画面"+chr$(13)
18310 ui_msg "登録件数は1件です。"
18320 else
18330 if buffer_list_count > 1 then
18340 print " :パッドの左:トップ画面" + chr$(13)
18350 print " :パッドの右:次へ行く" + chr$(13)
18360 endif
18370 endif
18380 key$ = "":bg = 0:bg2 = 0
18390 while (key$ <> chr$(13) and bg <> 2 and bg2 <> 1)
18400 key$ = inkey$
18410 bg = strig(1)
18420 bg2 = strig(0)
18430 pause 2
18440 wend
18450 'if n > 1 then
18460 if (key$ = " " OR bg = 2) then
18470 if n > 1 then
18480 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
18490 endif
18500 else
18510 if ((bg2 = 1) or (key$=chr$(13))) then
18520 goto TopScreen:
18530 endif
18540 else
18550 goto KotodamaList_page:
18560 endif
18570 wend
18580 endif
18590 'ndif
18600 '結果表示２ Menu1
18610 Surei_Result4:
18620 cls 3:font 32+16:init"kb:4"
18630 for i=0 to 181 + 3 - 1
18640 if i = count  then
18650 buffer$ = bufline2$(count + 4,0)
18660 endif
18670 next i
18680 if len(buffer$) > 21 and len(buffer$) <= 45 then
18690 buffer2$ = Mid$(buffer$,1,22)
18700 buffer3$ = Mid$(buffer$,23,(len(buffer$) - 22))
18710 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13)
18720 else
18730 if len(buffer$) <= 21 then
18740 buffer2$ = Mid$(buffer$,1,21)
18750 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
18760 else
18770 if len(buffer$) > 45 and len(buffer$) <= 62 then
18780 buffer2$ = Mid$(buffer$,1,22)
18790 buffer3$ = Mid$(buffer$,23,22)
18800 buffer4$ = Mid$(buffer$,44,(len(buffer$)-44))
18810 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13)
18820 else
18830 if len(buffer$) > 64 and len(buffer$) <= 81 then
18840 buffer2$ = Mid$(buffer$,1,22)
18850 buffer3$ = Mid$(buffer$,23,20)
18860 buffer4$ = Mid$(buffer$,44,20)
18870 buffer5$ = Mid$(buffer$,65,(len(buffer$)-65))
18880 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13)
18890 if len(buffer$) > 81 and len(buffer$) <= 110 then
18900 buffer2$ = Mid$(buffer$,1,22)
18910 buffer3$ = Mid$(buffer$,23,20)
18920 buffer4$ = Mid$(buffer$,43,20)
18930 buffer5$ = Mid$(buffer$,63,20)
18940 buffer6$ = Mid$(buffer$,83,(len(buffer$) - 83))
18950 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13)
18960 endif
18970 endif
18980 endif
18990 endif
19000 endif
19010 Surei_Result4_2:
19020 select case device_No
19030 case 1:
19040 gload Gazo$ + "Screen1_Result2.png"
19050 gload Gazo$ + "downscreen.png",0,0,800
19060 case 2:
19070 gload Gazo$ +"Screen1_Result2.png"
19080 end select
19090 Result_Menu_List$(0)="1.トップ画面に行く"
19100 Result_Menu_List$(1)="2.数霊のデーターを保存"
19110 Result_Menu_List$(2)="3.もう一度、数霊を調べる"
19120 cls
19130 print chr$(13)
19140 if lang_flag = 1 then
19150 else
19160 color rgb(127,255,212)
19170 print chr$(13);chr$(13)
19180 print "入力文字:";buffer_moji$;chr$(13)
19190 print "数霊:";count;chr$(13)
19200 color rgb(255,255,255)
19210 print "数霊の説明:"+chr$(13)
19220 print buffer$
19230 color rgb(0,0,0)
19240 locate 0,15
19250 print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
19260 endif
19270 key$ = "":bg = 0:bg2 = 0
19280 while (bg<>2 and bg2<>1)
19290 key$ = inkey$
19300 bg = strig(1)
19310 bg2 = strig(0)
19320 pause 2
19330 wend
19340 if ((bg = 2) or (bg2 = 1)) then
19350 num = ui_select("Result_Menu_List$","番号を選んでください")
19360 endif
19370 if num = 0 then goto TopScreen:
19380 if num = 1 then goto File_save:
19390 if num = 2 then goto Surei_Input:
19400 if num = -1 then goto Surei_Result4
19410 File_save:
19420 'ファイルがない時
19430 if dir$(SAVE_DATA1$) = " " then
19440 open SAVE_DATA1$ for output as #1
19450 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19460 close #1
19470 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19480 'ファイルが有る時
19490 else
19500 open SAVE_DATA1$ for append as #1
19510 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19520 close #1
19530 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19540 endif
19550 func All_clear()
19560 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
19570 endfunc
19580 'ここから
19590 Config_moji1:
19600 cls 3:Font 48
19610 select case device_No
19620 case 1:
19630 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19640 gload Gazo$ + "downscreen.png",0,0,800
19650 case 2:
19660  gload  Gazo$ + "Screen1_Setting_Top.png",0,0,0
19670 end select
19680 play ""
19690 No=1
19700 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19710 color rgb(0,0,255)
19720 print chr$(13)
19730 if lang_flag = 1 then
19740 'lang_flag = 1:英語
19750 else
19760 'lang_flag = 0:日本語
19770 color rgb(255,255,255)
19780 print "番号を選んでください" + chr$(13)
19790 print " :1.文字の項目" + chr$(13)
19800 print " :2.結果表示設定" + chr$(13)
19810 print " :3.トップ画面に行く" + chr$(13)
19820 print " :4.終 了" + chr$(13)
19830 endif
19840 color rgb(0,0,0)
19850 locate 1,12
19860 if No = 1 then print "1.文字の項目"
19870 'y:バーチャルパッドの処理
19880 'key$:カーソルの処理
19890 'bg:バーチャルパッドの右ボタン
19900 Config_moji1_Screen:
19910 y = 0:key$ = "":bg=0
19920 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
19930 y = stick(1)
19940 key$ = inkey$
19950 bg=strig(1)
19960 pause 2
19970 wend
19980 'バーチャルパッド　ここから'
19990 'バーチャルパッド　ここから'
20000 if y = 1 then
20010 select case No
20020 'No の初期値：No=1
20030 case 1:
20040 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20050 'デバッグライン　ここから
20060 '0のとき
20070 'デバッグライン　ここまで
20080 'デバッグライン　ここから
20090 case 2:
20100 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
20110 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
20120 'if lang_flag = 1 then
20130 'else
20140 locate 1,12:print "3.トップ画面に行くを選択"
20150 'endif
20160 'デバッグライン　ここまで
20170 case 3:
20180 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
20190 'デバッグライン　ここから
20200 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
20210 'デバッグライン　ここまで
20220 case 0:
20230 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20240 'デバッグライン　ここから
20250 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
20260 'デバッグライン　ここまで
20270 end select
20280 endif
20290 'バーチャルパッド　上 ここから
20300 if y = -1 then
20310 select case No
20320 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
20330 case 1:
20340 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
20350 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
20360 case 0:
20370 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
20380 'No:3 3.Help→2.設定 No:2
20390 case 3:
20400 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20410 case 2:
20420 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
20430 end select
20440 endif
20450 if bg=2 then
20460 select case No
20470 '1.数霊チェックを選択  パッドの右キー
20480 case 1:
20490 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
20500 '2.設定を選択    パッドの右キー
20510 case 2:
20520 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
20530 '3.ヘルプを選択 パッドの右
20540 case 3:
20550 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
20560 'プログラムの終了を選択
20570 case 0:
20580 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
20590 'if lang_flag = 1 then
20600 'Else
20610 ui_msg "プログラムを終了します":end
20620 'endif
20630 end select
20640 endif
20650 '4.終了するを選択  パッドの右
20660 'バーチャルパッド　ここまで'
20670 'SettingScreen:
20680 'key$ = input$(1)
20690 'カーソル下'
20700 if key$ = chr$(31) then
20710 select case (No Mod 4)
20720 '登録文字から数霊文字の確認
20730 case 1:
20740 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
20750 '数霊文字の確認からトップ画面に行く
20760 case 2:
20770 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
20780 'トップ画面に行くから終了
20790 case 3:
20800 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
20810 '終了から登録文字
20820 case 0:
20830 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20840 end select
20850 endif
20860 'カーソル　上
20870 if key$ = chr$(30) then
20880 select case (No Mod 4)
20890 case 1:
20900 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
20910 case 2:
20920 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
20930 case 3:
20940 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
20950 case 0:
20960 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
20970 end select
20980 endif
20990 'エンターキーを押したとき
21000 if key$ = chr$(13) then
21010 if No=3 then goto TopScreen:
21020 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
21030 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
21040 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
21050 'lse
21060 'o'o SettingScreen:
21070 endif
21080 'ここまで
21090 Config_moji2:
21100 cls 3:Font 48
21110 select case device_No
21120 case 1:
21130 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
21140 gload Gazo$ + "downscreen.png",0,0,800
21150  case 2:
21160 gload Gazo$ + "Screen1_Setting_Top.png "
21170  end select
21180 play ""
21190 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
21200 No=1
21210 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
21220 color rgb(0,0,255)
21230 'print "●設定項目" + chr$(13)
21240 print chr$(13)
21250 if lang_flag = 1 then
21260 'lang_flag = 1:英語
21270 else
21280 'lang_flag = 0:日本語
21290 color rgb(255,255,255)
21300 print "番号を選んでください" + chr$(13)
21310 'print " :1.文字の項目" + chr$(13)
21320 'print " :2.結果表示設定" + chr$(13)
21330 print " :1.文字の項目" + chr$(13)
21340 print " :2.結果表示設定" + chr$(13)
21350 print " :3.トップ画面に行く" + chr$(13)
21360 print " :4.終 了" + chr$(13)
21370 endif
21380 color rgb(0,0,0)
21390 locate 1,12
21400 if No = 1 then print "1.文字の項目"
21410 'y:バーチャルパッドの処理
21420 'key$:カーソルの処理
21430 'bg:バーチャルパッドの右ボタン
21440 config_moji2:
21450 y = 0:key$ = "":bg=0
21460 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
21470 y = stick(1)
21480 key$ = inkey$
21490 bg = strig(1)
21500 pause 2
21510 wend
21520 'バーチャルパッド　ここから'
21530 'バーチャルパッド　ここから'
21540 if y = 1 then
21550 select case No
21560 'No の初期値：No=1
21570 case 1:
21580 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
21590 'デバッグライン　ここから
21600 '0のとき
21610 'デバッグライン　ここまで
21620 'デバッグライン　ここから
21630 case 2:
21640 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
21650 color rgb(0,0,0)::No=2:goto SettingScreen:
21660 if lang_flag = 1 then
21670 else
21680 locate 0,12:print " 3.トップ画面に行くを選択"
21690 endif
21700 'cls:color rgb(255,255,255):print"ok"
21710 'デバッグライン　ここまで
21720 case 3:
21730 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
21740 'デバッグライン　ここから
21750 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
21760 'デバッグライン　ここまで
21770 case 0:
21780 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21790 'デバッグライン　ここから
21800 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
21810 'デバッグライン　ここまで
21820 end select
21830 endif
21840 'バーチャルパッド　上 ここから
21850 if y = -1 then
21860 select case No
21870 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
21880 case 1:
21890 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
21900 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
21910 case 0:
21920 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
21930 'No:3 3.Help→2.設定 No:2
21940 case 3:
21950 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
21960 case 2:
21970 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
21980 end select
21990 endif
22000 '決定ボタン
22010 if bg=2 then
22020 select case No
22030 '1.数霊チェックを選択  パッドの右キー
22040 case 1:
22050 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
22060 '2.設定を選択    パッドの右キー
22070 case 2:
22080 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
22090 '3.ヘルプを選択 パッドの右
22100 case 3:
22110 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
22120 'プログラムの終了を選択
22130 case 0:
22140 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
22150 'if lang_flag = 1 then
22160 'Else
22170 ui_msg "プログラムを終了します":end
22180 'endif
22190 end select
22200 endif
22210 '4.終了するを選択  パッドの右
22220 'バーチャルパッド　ここまで'
22230 'カーソル下'
22240 if key$ = chr$(31) then
22250 select case (No Mod 4)
22260 '登録文字から数霊文字の確認
22270 case 1:
22280 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22290 '数霊文字の確認からトップ画面に行く
22300 case 2:
22310 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
22320 'トップ画面に行くから終了
22330 case 3:
22340 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
22350 '終了から登録文字
22360 case 0:
22370 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
22380 end select
22390 endif
22400 'カーソル　上
22410 if key$ = chr$(30) then
22420 select case (No Mod 4)
22430 case 1:
22440 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
22450 case 2:
22460 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
22470 case 3:
22480 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
22490 case 0:
22500 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
22510 end select
22520 endif
22530 'エンターキーを押したとき
22540 if key$ = chr$(13) then
22550 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
22560 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
22570 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
22580 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
22590 'lse
22600 'o'o SettingScreen:
22610 endif
22620 '結果表示設定
22630 Result_Setting:
22640 color rgb(255,255,255)
22650 'dim list$(4)
22660 'ファイル読み込み
22670 '1.ファイルが有るか無いかのチェック
22680 if Dir$(System$) = "" then
22690 '1-1.ファイルがないとき
22700 '上のSystemフォルダを作成
22710 mkdir "./data/system/"
22720 list$(0) = "●:出た数字から181を引く"
22730 list$(1) = " :出た数字から180を引き単数変換"
22740 open System$ for output as #1
22750 print #1,"config_r=0"
22760 close #1
22770 ui_msg "ファイルを作成しました"
22780 'ファイル作成
22790 else
22800 '1-2.ファイルが有るとき
22810 'config_r:0 出た数字から181を引く
22820 'config_r:1 出た数字から180を引いて単数変換
22830 'open "./System/config.sys" for input as #1
22840 'ファイルが有るときファイルを読み込み
22850 open System$ for input as #1
22860 line input #1,buf_line$
22870 'buf$にデーターをコピーする
22880 buf$ = buf_line$
22890 close #1
22900 if len(buf$) = 10 then
22910 if left$(buf$,9) = "config_r=" then
22920 buf$ = right$(buf_line$,1)
22930 if buf$ = "1" then
22940 '1.System$ ファイルを削除(config.sys)
22950 '2.1行目をconfig_r=1と書き、保存する
22960 buf_config_r = 1
22970 'list$(0) = "●:1.出た数字から180を引いて単数変換"
22980 'list$(1) = " :2.出た数字から181を引く"
22990 else
23000 if buf$ = "0" then
23010 buf_config_r = 0
23020 ' list$(0) = "●:1.出た数字から181を引く"
23030 'list$(1) = " :2.出た数字から180を引いて単数変換"
23040 endif
23050 endif
23060 endif
23070 endif
23080 endif
23090 '"●:1.出た数字から180を引く"をlist$(0)に代入
23100 if buf_config_r =  0 then
23110 list$(0) = "●:1.出た数字から181を引く"
23120 list$(1) = " :2.出た数字から180を引いて単数変換"
23130 else
23140 list$(0) = "●:1.出た数字から180を引いて単数変換"
23150 list$(1) = " :2.出た数字から181を引く"
23160 endif
23170 list$(2) = " :トップ画面に戻る"
23180 list_num = ui_select("list$","番号を選んでください")
23190 play ""
23200 Select case (list_num)
23210 case 0:
23220 if buf$ = "1" then
23230 buf_config_r = 0:
23240 'データーを変更したのでファイルを削除
23250 kill System$
23260 'ファイルを新しく作成
23270 open System$ for output as #1
23280 print #1,"config_r=0"
23290 close #1
23300 ui_msg "設定を変更しました。"
23310 else
23320 'if buf$ = "0" then
23330 'buf_config_r = 1
23340 'kill System$
23350 'open Syetem$ for output as #1
23360 'print #1,"config_r=1"
23370 'close #1
23380 'ui_msg "設定を変更しました"
23390 'endif
23400 endif
23410 goto config_moji2:
23420 case 1:
23430 if buf$ = "0" then
23440 buf_config_r = 1:
23450 'データーを変更したので、ファイルを削除
23460 kill System$
23470 'ファイルを新しく作成
23480 open System$ for output as #1
23490 print #1,"config_r=1"
23500 close #1
23510 ui_msg "設定を変更しました"
23520 else
23530 kill System$
23540 if buf$ = "1" then
23550 open System$ for output as #1
23560 print #1,"config_r=0"
23570 close #1
23580 ui_msg "設定を変更しました"
23590 endif
23600 endif
23610 goto config_moji2:
23620 case 2:
23630 'トップ画面に飛ぶ
23640 goto TopScreen:
23650 case 3:
23660 'プログラムを終了する
23670 cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
23680 end select
23690 '単数変換
23700 Func Single_Complate(num)
23710 '1.出てきた数字から180を引く
23720 a = num - 180
23730 'a:10〜99
23740 Re1:
23750 if (a > 9 and a < 100) then
23760 b1 = fix(a / 10)
23770 b2 = 10 * a - b1
23780 d1 = b1 + b2
23790 if c > 9 then
23800 goto Re1:
23810 else
23820 c = d1:goto Re2:
23830 endif
23840 endif
23850 Re2:
23860 buffer = c
23870 endfunc buffer
23880 Func Surei_Result_Save_File()
23890 'ファイルがないとき
23900 if dir$(SAVE_DATA1$) = "" then
23910 open SAVE_DATA1$ for output as #1
23920 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
23930 close #1
23940 ui_msg "保存しました":talk "保存しました":goto Surei_Result:
23950 else
23960 open SAVE_DATA1$ for append as #1
23970 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
23980 close #1
23990 ui_msg "保存しました":talk "保存しました":goto Surei_Result
24000 endif
24010 endfunc
24020 '言語設定
24030 Setting_Language:
24040 cls 3:screen 1,1,1,1:No=2
24050 select case device_No
24060 case 1:
24070 gload Gazo$ + "Screen1.png",0,0,0
24080 gload Gazo$ + "downscreen.png",0,0,800
24090 case 2:
24100 gload Gazo$ + "Screen1.png",0,0,0
24110 end select
24120 init "Kb:4"
24130 sp_on 1,1:sp_on 0,0
24140 sp_put 0,(0,300),0,0
24150 sp_put 1,(0,400),1,0
24160 color rgb(0,0,255)
24170 'print "番号を選んでください"+chr$(13)
24180 'if lang_flag=0 then
24190 'print "言語設定:日本語"+chr$(13)
24200 'else
24210 'print "言語設定:英 語"+chr$(13)
24220 Change_Language:
24230 if lang_flag = 1 then
24240 cls
24250 print "It has changed Language"+chr$(13)
24260 color rgb(255,255,255)
24270 print "Select the Number"+chr$(13)
24280 print " :1.English → Japanse"+chr$(13)
24290 print " :2.It goes to TopScreen"+chr$(13)
24300 print "Language:In English" +chr$(13)
24310 else
24320 cls:color rgb(255,255,255)
24330 print "設定変更(言語の変更)" + chr$(13)
24340 color rgb(255,255,255)
24350 print chr$(13)
24360 print "番号を選んでください"+chr$(13)
24370 print " :1.日本語 → 英語に変更" + chr$(13)
24380 print " :2.トップ画面に戻る" + chr$(13)
24390 print chr$(13)
24400 print "設定言語:日本語" + chr$(13)
24410 endif
24420 color rgb(0,0,0)
24430 locate 0,15:print "                                       ":locate 0,15:print "2.トップ画面に戻る　を選択" + chr$(13)
24440 Setting_Language_key:
24450 y=0:key$="":bg=0
24460 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y<> -1 and bg<> 1)
24470 y=stick(1)
24480 key$=inkey$
24490 bg=strig(1)
24500 pause 2
24510 wend
24520 '選択肢変更
24530 if ((y=1) or (y=-1)) then
24540 select case No
24550 case 2:
24560 '実装部分　ここから
24570 pause 200:No=1:sp_on 0,1:sp_on 1,0:locate 0,15:print "                                                         ":locate 0,15:print "1.日本語 → 英語に変更を選択": goto Setting_Language_key:
24580 '実装部分　ここまで
24590 case 1:
24600 pause 200: No=2:sp_on 0,0:sp_on 1,1:locate 0,15:print "                                                       ":locate 0,15:print "2.トップ画面に戻る を選択":goto Setting_Language_key:
24610 end select
24620 endif
24630 'Enter Key  決定ボタン
24640 if ((key$=chr$(13)) or (bg=1)) then
24650 select case No
24660 case 2:
24670 sp_on 0,0:sp_on 1,0:goto TopScreen:
24680 case 1:                                                     'lang_flag=1:sp_on 0,0:sp_on 1,0:goto Change_Language:
24690 '
24700 '未実装　ここから
24710 sp_on 0,1:sp_on 1,0:ui_msg "この機能は未実装です":goto Setting_Language_key:
24720 '
24730 '未実装　ここまで
24740 end select
24750 endif
24760 '配列削除
24770 buffer_clear:
24780 erase bufline$
24790 erase bufcount$
24800 erase bufcount1$
24810 erase bufcount2$
24820 erase bufline2$
24830 erase bufline3$
24840 erase bufKaztama$
24850 erase List$
24860 erase Result_Menu_List$
24870 erase list$
24880 erase moji_List$
24890 'ui_msg "メモリーをクリアしました"
24900 return
24910 '配列削除　ここまで
24920 File_Device_Set:
24930 'Device 選択　書き込み
24940 open Device_type$  for output as #1
24950 print #1,device_No
24960 close #1
24970 ui_msg "ファイルを書き込みました"
24980 return
24990 Input_numbertokazutama:
25000 cls 3:gload Gazo$ + "Input_numbertokazutama.png",0,0,0:init "kb:2"
25010 color rgb(255,255,255):locate 1,4:print "調べたい数霊の番号を入れてください"+chr$(13);"(Max:181)"
25020 color rgb(0,0,0):locate 1,7:Input "番号:",num
25030 buffer$=bufline2$(num+4,0)
25040 goto Numbertokazutama:
25050 '
25060 '
25070 Numbertokazutama:
25080 cls 3:init "kb:4":gload Gazo$+"Result_numbertokazutama.png",0,0,0:bg=0:key$=""
25090 font 32+16:color rgb(255,255,255)
25100 locate 1,3:print "数霊番号:";num;chr$(13)
25110 locate 1,4:print "数霊の説明"+chr$(13)
25120 if ((len(buffer$)>21) and (len(buffer$)<=45)) then
25130 buffer2$=Mid$(buffer$,1,22)
25140 buffer3$=Mid$(buffer$,23,len(buffer$)-23)
25150 buffer$=buffer2$+chr$(13)+buffer3$+chr$(13)
25160 else
25170 if (len(buffer$) < 21) then
25180 buffer2$ = Mid$(buffer$,1,21)
25190 buffer$ = buffer2$ + chr$(13)
25200 else
25210 if ((Len(buffer$) > 46) and (len(buffer$) <69)) then
25220 buffer2$=Mid$(buffer$,1,22)
25230 buffer3$=Mid$(buffer$,23,23)
25240 buffer4$=Mid$(buffer$,44,len(buffer$)-44)
25250 buffer$=buffer2$+chr$(13)+buffer3$+chr$(13)+buffer4$+chr$(13)
25260 endif
25270 endif
25280 endif
25290 locate 1,5:print buffer$
25300 color rgb(0,0,0)
25310 locate 1,14:print "ジョイパッドの右を押してください"+chr$(13)
25320 while (bg <> 2 and key$ <> chr$(13))
25330 bg=strig(1)
25340 key$=inkey$
25350 pause 2
25360 wend
25370 if ((bg = 2) or (key$ = chr$(13))) then
25380 goto TopScreen:
25390 endif
