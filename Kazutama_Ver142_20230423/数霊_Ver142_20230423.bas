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
620 '現在のバージョン
630 Version$ = "1.4.2_2023.04.23(正式版)"
640 'csvファイル 1.数霊 ベースファイル
650 FILE_csv$ = "./data/Kazutama.csv"
660 'csvファイル 2.数霊 ベースファイル 2
670 FILE_csv2$ = "./data/Surei_chart_20211207.csv"
680 'Save ファイル
690 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
700 'gazo ファイル
710 Gazo$ = "./data/Gazo/"
720 'System フォルダ:設定ファイルを保存するところ
730 System$ = "./data/System/config.sys"
740 'Device type:デバイスタイプのファイルチェック
750 Device_type$ = "./data/device_type.sys"
760 '設定ファイル名:config.sys
770 'Sound File(Voice)
780 '1.ボイス TopScreen
790 Voice_File_TopScreen$ = "./data/Sound_data/"
800 'Message
810 buf_finish_Message$ = "メモリーを解放してプログラムを終了します"
820 '変数領域
830 'vcount:バーチャルパッド下の変数
840 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+6,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
850 count2 = 0:N=0:N2=0:m2 = 0:device_No=0:device_type=0
860 dim list$(4),moji_List$(2)
870 'ファイルの有無チェック
880 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
890 '1.ファイルが無いとき
900 cls :print "依存ファイルが見つかりません":
910 print "エンターキーを押してください" + chr$(13)
920 key$ = input$(1)
930 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
940 else
950 '2.ファイルが有るとき
960 cls:print "csv:file ok." + chr$(13)
970 n=0
980 'FILE_csv$:数霊データー入力
990 open FILE_csv$ for input as #1
1000 while eof(1) = 0
1010 input #1,line$
1020 bufline$(n) = line$
1030 'Print n;chr$(13)
1040 '登録件数カウント:n
1050 n = n + 1
1060 wend
1070 close #1
1080 N=n
1090 '2つ目のファイル読み込み
1100 'n = 0
1110 open FILE_csv2$ for input as #2
1120 for n=3 to 181+2+2
1130 for i=0 to 1
1140 input #2,line$
1150 bufline2$(n,i) = line$
1160 next i
1170 next n
1180 close #2
1190 N2 = n
1200 endif
1210 '2022.11.23----------------------
1220 '端末言語のチェック
1230 '日本語端末かチェックをして日本語以外なら英語で表示する
1240 'lang flag:0:日本語 1:英語(日本語以外)
1250 '--------------------------------
1260 lang_flag = 0
1270 if ex_info$(1) <> "JP" then
1280 lang_flag = 1
1290 endif
1300 cls 3:font 48:screen 1,1,1,1:int "kb:4":init "crt:0"
1310 play ""
1320 'gload Gazo$ + "TopScreen_20230310.png",0,0,0
1330 '選択ポインター 1 - 4
1340 'スプライトの定義
1350 gload Gazo$ + "Selection.png",1,5,300
1360 gload Gazo$ + "Selection.png",1,5,400
1370 gload Gazo$ + "Selection.png",1,5,500
1380 gload Gazo$ + "Selection.png",1,5,595
1390 sp_def 0,(5,300),32,32
1400 sp_def 1,(5,400),32,32
1410 sp_def 2,(5,500),32,32
1420 sp_def 3,(5,595),32,32
1430 'File check
1440 '初回起動はここから
1450 if (dir$(Device_type$) = "") then
1460 goto Device_Select:
1470 else
1480 '
1490 '2回目以降はファイルチェックをしてトップ画面
1500 '
1510  open Device_type$ for input as #1
1520  line input #1,device_type$
1530  device_No = val(device_type$)
1540  close #1
1550  if (device_No=1 or device_No=2) then
1560  goto TopScreen:
1570  endif
1580 endif
1590 'First_Select_Screen:
1600 'タブレット　or　スマホの選択を起動時にする
1610 Device_Select:
1620 font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
1630 gload Gazo$ + "device_select_20230313.png",0,0,0
1640 init "kb:4"
1650 play ""
1660 play Voice_File_TopScreen$+"Select_device_select.mp3"
1670 'y=0:key$="":bg=0
1680 print chr$(13)+chr$(13)+chr$(13)
1690 color  rgb(255,255,255)
1700 print "番号を選んでください"+chr$(13)
1710 'print chr$(13)
1720 print " :1.スマートフォン"+chr$(13)
1730 print " :2.タブレット端末"+chr$(13)
1740 locate 0,11:No=1
1750 color rgb(0,0,0)
1760 Print " 1.スマートフォンを選択"+chr$(13)
1770 sp_on 0,1:sp_put 0,(5,300),0,0
1780 sp_on 1,0:sp_on 2,0:sp_on 3,0
1790 device_selection:
1800 y=0:key$="":bg=0:
1810 While (key$ <> chr$(30) and key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
1820 y = stick(1)
1830 key$ = inkey$
1840 bg = strig(1)
1850 pause 2
1860 wend
1870 if ((y=1) or (y=-1) or (key$=chr$(30)) or (key$=chr$(31)) ) then
1880 select case No
1890 case 1:
1900       No=2:sp_on 1,1:sp_on 0,0:locate 0,11:pause 300:sp_put 1,(5,400),0,0:print "                                ":locate 0,11:print " 2.タブレット端末を選択":goto device_selection:
1910 case 2:
1920       No=1:sp_on 1,0:sp_on 0,1:pause 300:sp_put 0,(5,300),0,0:locate 0,11:print "                                   ":locate 0,11:print " 1.スマートフォンを選択":goto device_selection:
1930 end select
1940 endif
1950 '決定ボタン
1960 if ((bg=2) or (key$=chr$(13)))  then
1970 select case No
1980 case 1:
1990       sp_on 0,0:sp_on 1,0:device_No=1:gosub File_Device_Set:goto TopScreen:
2000 case 2:
2010       sp_on 0,0:sp_on 1,0:device_No=2:gosub File_Device_Set:goto TopScreen:
2020 end select
2030 endif
2040 'Top画面
2050 TopScreen:
2060 'バーチャルパッドを表示
2070 cls 3:font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
2080 'play ""
2090 play ""
2100 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
2110 'gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
2120 select case device_No
2130 case 1:
2140 'Top画面の背景画像
2150 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2160 gload Gazo$ + "downscreen.png",0,0,800
2170 case 2:
2180 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2190 end select
2200 'key$=input$(1)
2210 'バーチャルパッドの背景を白にする for smartphone screen
2220 'gload Gazo$ + "downscreen.png",0,0,800
2230 '選択肢 1
2240 gload Gazo$ + "Selection.png",1,5,300
2250 '選択肢 2
2260 gload Gazo$ + "Selection.png",1,5,400
2270 '選択肢 3
2280 gload Gazo$ + "Selection.png",1,5,500
2290 '選択肢 4
2300 'TopScreen:
2310 'select case device_No
2320 'case 1:
2330 gload Gazo$ + "Selection.png",1,5,590
2340 'case 2:
2350 'gload Gazo$ +
2360 'end select
2370 color rgb(0,0,255)
2380 print chr$(13)
2390 if lang_flag = 1 then
2400 color rgb(255,255,255)
2410 print "Select Number" + chr$(13)
2420 print " :1.Kazutama check" + chr$(13)
2430 print " :2.Setting" + chr$(13)
2440 print " :3.Help" + chr$(13)
2450 print " :4.End Program" + chr$(13)
2460 color rgb(255,255,255)
2470 else
2480 color rgb(255,255,255)
2490 print chr$(13)
2500 sp_on 0,1:sp_put 0,(5,300),0,0
2510 print "番号を選んでください" + chr$(13)
2520 print " :1.数霊(かずたま)チェック" + chr$(13)
2530 print " :2.設定" + chr$(13)
2540 print " :3.ヘルプ" + chr$(13)
2550 print " :4.(プログラムを)終　了する" + chr$(13)
2560 color rgb(0,0,0)
2570 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
2580 'バーチャルパッドを表示
2590 No=1:
2600 'lang_flag:1 外国語,0:日本語
2610 if lang_flag = 1 then
2620 'lang_flag=1 英語
2630 locate 0,15:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
2640 else
2650 'lang_flag=0 日本語
2660 locate 0,15:color rgb(0,0,0):print " 1.数霊(かずたま)チェックを選択";chr$(13)
2670 endif
2680 endif
2690 'TopScreen sprite
2700 'スプライト
2710 '選択肢 1 On
2720 'sp_def 0,(5,300),32,32
2730 'sp_on 0,1
2740 'sp_put 0,(5,300),0,0
2750 '選択肢 2 Off
2760 sp_def 1,(5,400),32,32
2770 sp_on 1,0
2780 sp_put 1,(5,400),0,0
2790 '選択肢 3 Off
2800 sp_def 2,(5,500),32,32
2810 sp_on 2,0
2820 sp_put 2,(5,500),0,0
2830 '選択肢 4 Off
2840 sp_def 3,(5,600),32,32
2850 sp_on 3,0
2860 sp_put 3,(5,600),0,0
2870 color rgb(0,0,0)
2880 Main_Select:
2890 'y:バーチャルパッドの処理
2900 'key$:カーソルの処理
2910 y = 0:key$ = "":bg = 0
2920 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
2930 y = stick(1)
2940 key$ = inkey$
2950 bg = strig(1)
2960 pause 2
2970 wend
2980 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
2990 '1.バーチャルパッドの処理
3000 'バーチャルパッド下を押した時
3010 if y = 1 then
3020 select case No
3030 'No の初期値：No=1
3040 case 1:
3050 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
3060 if lang_flag = 1 then
3070 'lang_flag=1 英語
3080 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3090 else
3100 'lang_flag=0 日本語
3110 locate 0,15:print " 2.設定を選択":goto Main_Select:
3120 endif
3130 'デバッグライン　ここから
3140 '0のとき
3150 'デバッグライン　ここまで
3160 'デバッグライン　ここから
3170 'バーチャルパッド　下
3180 case 2:
3190 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:
3200 print "                                         ":
3210 if lang_flag = 1 then
3220 color rgb(0,0,0):locate 0,15:
3230 print "3.It has selected Help":No=3:goto Main_Select:
3240 else
3250 color rgb(0,0,0):locate 0,15:print "                                                         ":locate 0,15:
3260 print " 3.ヘルプを選択":No=3:goto Main_Select:
3270 endif
3280 'デバッグライン　ここまで
3290 case 3:
3300 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                               "
3310 if lang_flag = 1 then
3320 locate 0,15:print "4.It has selected finish program":No=0:goto Main_Select:
3330 else
3340 locate 0,15:print "                                                         " :locate 0,15:print " 4.(プログラムを)終了するを選択":No=0:goto Main_Select:
3350 endif
3360 'デバッグライン　ここから
3370 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
3380 'デバッグライン　ここまで
3390 case 0:
3400 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1
3410 if lang_flag = 1 then
3420 'lang_flag=1:英語
3430 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3440 else
3450 'lang_flag=0:日本語
3460 locate 0,15:print "                                      ":locate 0,15:print " 1.数霊(かずたま)チェックを選択":goto Main_Select:
3470 endif
3480 'デバッグライン　ここから
3490 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
3500 'デバッグライン　ここまで
3510 end select
3520 endif
3530 'バーチャルパッド　上 ここから
3540 if y = -1 then
3550 select case No
3560 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
3570 case 1:
3580 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                                          "
3590 'if lang_flag = 1 then
3600 'lang_flag=1 英語
3610 'locate 0,15:print "4.It has finished program":goto Main_Select:
3620 'else
3630 'lang_flag=0 日本語
3640 locate 0,15:print "                                                          ":
3650 locate 0,15:print " 4.(プログラムを)終了するを選択":goto Main_Select:
3660 'endif
3670 'endif
3680 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
3690 case 0:
3700 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":
3710 if lang_flag = 1 then
3720 '1:英語
3730 locate 0,15:print "3.It has selected Help":goto Main_Select:
3740 else
3750 '0:日本語
3760 locate 0,15:print "                                                                                        "
3770 locate 0,15:print " 3.ヘルプを選択":goto Main_Select:
3780 endif
3790 'No:3 3.Help→2.設定 No:2
3800 case 3:
3810 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      "
3820 if lang_flag = 1 then
3830 '1:英語
3840 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3850 else
3860 '0:日本語
3870 locate 0,15:print" 2.設定を選択":goto Main_Select:
3880 endif
3890 case 2:
3900 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":
3910 if lang_flag = 1 then
3920 'lang_flag 1 英語
3930 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3940 else
3950 'lang_flag 0 日本語
3960 locate 0,15:print" 1.数霊(かずたま)チェックを選択":goto Main_Select:
3970 endif
3980 end select
3990 endif
4000 if bg = 2 then
4010 select case No
4020 '1.数霊チェックを選択  パッドの右キー(決定)
4030 case 1:
4040 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4050 '2.設定を選択  パッドの右キー(決定)
4060 case 2:
4070 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
4080 '3.ヘルプを選択 パッドの右(決定)
4090 case 3:
4100 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
4110 'プログラムの終了を選択(決定)
4120 case 0:
4130 cls 3:cls 4:gosub buffer_clear:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":ui_msg buf_finish_Message$:pause 4.080*1000:color rgb(255,255,255):end
4140 'if lang_flag = 1 then
4150 'lang_flag = 1 英語
4160 'else
4170 'lang_flag = 0 日本語
4180 'endif
4190 end select
4200 '4.終了するを選択  パッドの右
4210 endif
4220 'バーチャルパッド　上　ここまで
4230 '2.カーソルの処理
4240 'カーソル　下 chr$(31)
4250 if (key$ = chr$(31)) then
4260 select case (No)
4270 '4
4280 '0 選択肢4 => 選択肢1
4290 case 0:
4300 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "              ":color rgb(0,0,0):
4310 if lang_flag = 1 then
4320 'lang flag:1 英語
4330 else
4340 'lang flag:0 日本語
4350 color rgb(0,0,0):locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4360 endif
4370 '1 選択肢1 => 選択肢2
4380 case 1:
4390 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":
4400 if lang_flag = 1 then
4410 'lang_flag:1 英語
4420 else
4430 'lang_flag:0 日本語
4440 color rgb(0,0,0):locate 0,15:print "2.設定を選択":beep:goto Main_Select:
4450 endif
4460 '2 選択肢2 => 選択肢3
4470 case 2:
4480 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,15:print "               ":
4490 if lang_flag = 1 then
4500 'lang flag:1 英語
4510 else
4520 'lang flang:0 日本語
4530 color rgb(0,0,0):locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4540 endif
4550 '3 選択肢３ => 選択肢4
4560 case 3:
4570 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,595),0,0:locate 0,15:print "               ":color rgb(0,0,0)
4580 if lang_flag = 1 then
4590 'lang_flag = 1 英語
4600 else
4610 'lang_flag = 0 日本語
4620 color rgb(0,0,0):locate 0,15:print "4.終 了を選択":goto Main_Select:
4630 endif
4640 case else:
4650 goto Main_Select:
4660 end select
4670 endif
4680 'カーソル　上
4690 if key$=chr$(30) then
4700 select case (No)
4710 '選択肢1 => 選択肢4
4720 case 1:
4730 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:PRINT "                      ":
4740 if lang_flag = 1 then
4750 'lang_flag=1:英語
4760 'print "1.It has selected Kazutama check":goto Main_Select:
4770 else
4780 'lang_flag = 0:日本語
4790 else
4800 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4810 endif
4820 '選択肢2 => 選択肢1
4830 case 2:
4840 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                 ":locate 1,15:print "2.設 定を選択":goto Main_Select:
4850 '選択肢3　=> 選択肢2
4860 case 3:
4870 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,500),0,0
4880 if lang_flag = 1 then
4890 'lang_flag = 1:英語
4900 locate 0,15:print "It has selected Help":goto Main_Select:
4910 else
4920 'lang_flag = 0:日本語
4930 locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4940 endif
4950 '選択肢4 => 選択肢3
4960 case 0:
4970 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                ":locate 1,15:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
4980 if lang_flag = 1 then
4990 'lang flag=1 英語
5000 else
5010 'lang flag=0 日本語
5020 locate 1,15:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
5030 endif
5040 end select
5050 endif
5060 'Input "番号:",No
5070 'エンターキー入力:決定
5080 if key$ = chr$(13) then
5090 select case No
5100 case 1:
5110 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
5120 case 3:
5130 Color rgb(255,255,255):goto Help:
5140 case 0:
5150 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg buf_finish_Message$:color rgb(255,255,255):pause 4.080 * 1000:end
5160 case 2:
5170 color rgb(255,255,255):sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
5180 end select
5190 endif
5200 '1-1.数霊チェック
5210 Surei_Check:
5220 cls 3:Font 48:
5230 select case device_No
5240  case 1:
5250 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5260 gload Gazo$ + "downscreen.png",0,0,800
5270 case 2:
5280 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5290 end select
5300 play ""
5310 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
5320 color rgb(255,0,0)
5330 'print "●数霊(かずたま)チェックトップ" + chr$(13)
5340 sp_on 0,1:sp_put 0,(5,300),0,0:screen 1,1,1
5350 if lang_flag = 1 then
5360 'lang_flag=1 英語
5370 else
5380 'lang_flag=0 日本語
5390 print chr$(13)+chr$(13)+chr$(13)
5400 color rgb(255,255,255)
5410 print "番号を選んでください" + chr$(13)
5420 print " :1.数霊(かずたま)1人用" + chr$(13)
5430 print " :2.数霊(かずたま)リスト 1人用　" + chr$(13)
5440 print " :3.数霊(かずたま)2人用" + chr$(13)
5450 print " :4.トップ画面に行く" + chr$(13)
5460 color rgb(0,0,0):No = 1
5470 locate 0,15:print "                                       "
5480 locate 0,15
5490 print " 1.数霊(かずたま)1人用を選択"
5500 endif
5510 Kazutama_main:
5520 'y:バーチャルパッドの処理
5530 'key$:カーソルの処理
5540 'bg:バーチャルパッドの右のボタン
5550 y = 0:key$ = "":bg=0
5560 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
5570 y = stick(1)
5580 key$ = inkey$
5590 bg=strig(1)
5600 y=stick(-1)
5610 pause 2
5620 wend
5630 'key$ = input$(1)
5640 if y = 1 then
5650 select case No
5660 'No の初期値：No=1
5670 case 2:
5680 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                       ":
5690 locate 0,15:print "                                     "
5700 locate 0,15
5710 print" 3.数霊(かずたま)2人用を選択":goto Kazutama_main:
5720 'デバッグライン　ここから
5730 '0のとき
5740 'デバッグライン　ここまで
5750 'デバッグライン　ここから
5760 case 3:
5770 sp_on 2,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_on 0,1:sp_put 0,(5,585),0,0:pause 200:locate 0,15:print "                                               "
5780 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":No=0:goto Kazutama_main:
5790 'デバッグライン　ここまで
5800 'デバッグライン　ここから
5810 'デバッグライン　ここまで
5820 case 0:
5830 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5840 case 1:
5850 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                          ":locate 0,15:print " 2.数霊（かずたま）リスト 1人用":goto Kazutama_main:
5860 'デバッグライン　ここから
5870 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
5880 'デバッグライン　ここまで
5890 end select
5900 endif
5910 'バーチャルパッド　上 ここから
5920 if y = -1 then
5930 select case No
5940 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
5950 case 1:
5960 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 0,15:print" 4.トップ画面に行くを選択":goto Kazutama_main:
5970 'No:3 3.Help→2.設定 No:2
5980 case 0:
5990 sp_on 1,0:sp_on 0,0:sp_on 3,1:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                     ":locate 0,15:print" 3.数霊（かずたま）2人用を選択":goto Kazutama_main:
6000 case 2:
6010 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                    ":locate 0,15:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
6020 case 3:
6030 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                               ":locate 0,15:print "2.数霊(かずたま)リスト1人用を選択":goto Kazutama_main:
6040 end select
6050 endif
6060 if bg=2 then
6070 select case No
6080 '1.数霊チェックを選択  パッドの右キー
6090 case 1:
6100 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
6110 '2.数霊チェック2人用   パッドの右キー
6120 case 3:
6130 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
6140 '3.トップ画面に行く パッドの右
6150 case 0:
6160 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
6170 '2.数霊リスト1人用 パッドの右キー
6180 case 2:
6190 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_List1:
6200 'プログラムの終了を選択
6210 end select
6220 '4.終了するを選択  パッドの右
6230 endif
6240 'バーチャルパッド　上　ここまで
6250 if key$ = chr$(31) then
6260 select case No
6270 case 0:
6280 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,15:print "                                                          ":
6290 if lang_flag = 1 then
6300 Else
6310 locate 0,15:print "                                      "
6320 No=2:locate 0,15:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
6330 endif
6340 case 1:
6350 No=0:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,585),0,0:locate 0,12:print "                                                          ":
6360 if lang_flag = 1 then
6370 Else
6380 locate 0,15:print"                                      "
6390 locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
6400 endif
6410 case 2:
6420 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                      ":
6430 if lang_flag = 1 then
6440 Else
6450 No=1:locate 0,15:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
6460 endif
6470 end select
6480 endif
6490 if key$=chr$(13) then
6500 select case No
6510 case 1:
6520 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
6530 case 2:
6540 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
6550 case 3:
6560 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
6570 '終了はトップメニューのみにする
6580 end select
6590 endif
6600 '前の画面に戻る
6610 'プログラムの終了
6620 '1人用
6630 '2人用
6640 '数霊(かずたま) 文字入力  1人用
6650 Surei_Input:
6660 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
6670 if mode = 0 then
6680 cls 3:font 32:init"kb:2"
6690 select case device_No
6700 case 1:
6710 gload Gazo$ + "InputKotodama_20230131.png",0,0,0
6720 gload Gazo$ + "CenterScreen_20230401.png",0,0,380
6730 case 2:
6740 gload Gazo$ + "InputKotodama_20230131.png",0,0,0
6750 end select
6760 play""
6770 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
6780 color rgb(255,0,0)
6790 if lang_flag=1 then
6800 '英語
6810 else
6820 print chr$(13)+chr$(13)+chr$(13)
6830 color rgb(255,255,255)
6840 print "文字を入れてください" + chr$(13)
6850 color rgb(255,255,255)
6860 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
6870 print chr$(13)
6880 color rgb(0,0,0)
6890 Input "入力文字:",buffer_moji$
6900 if buffer_moji$ = "" then
6910 ui_msg "未入力です":goto Surei_Input:
6920 else
6930 goto Surei_Result:
6940 endif
6950 endif
6960 endif
6970 if mode = 1 then
6980 cls 3:Font 32:
6990 gload Gazo$ + "InputKotodama.png"
7000 color rgb(255,0,0)
7010 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
7020 color rgb(255,255,255)
7030 print "文字を入れてください" + chr$(13)
7040 color rgb(255,0,0)
7050 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
7060 print "大文字のみ)" + chr$(13)
7070 color rgb(0,0,0)
7080 Input "文字入力:",buffer_moji2$
7090 goto Surei_Result3:
7100 'endif
7110 endif
7120 '数霊(かずたま)文字入力　2人用
7130 Surei_twoParson:
7140 cls 3:Font 32:init"kb:2"
7150 gload Gazo$ + "InputKotodama_20230131.png"
7160 '1人目入力
7170 if lang_flag = 1 then
7180 else
7190 print ""+chr$(13)+chr$(13)+chr$(13)
7200 color rgb(255,255,255)
7210 print "1人目の文字を入れてください" + chr$(13)
7220 color rgb(255,255,255)
7230 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
7240 color rgb(0,0,0)
7250 print chr$(13)
7260 Input "1人目文字入力:",buf_Parson1$
7270 endif
7280 Surei_twoParson2:
7290 cls 3:Font 32:init"kb:2"
7300 '2人目入力
7310 gload Gazo$ + "InputKotodama_20230131.png"
7320 if lang_falg = 1 then
7330 else
7340 print ""+chr$(13)+chr$(13)+chr$(13)
7350 color rgb(255,255,255)
7360 print "2人目の文字を入れてください" + chr$(13)
7370 color rgb(255,255,255)
7380 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
7390 color rgb(0,0,0)
7400 Input "2人目の文字入力:",buf_Parson2$
7410 goto Surei_Result2:
7420 endif
7430 '数霊　計算 パート
7440 '文字の計算関数
7450 'moji$:1文字を入れる
7460 func Complate(moji$)
7470 for n = 1 to 116
7480 if moji$ = bufline$(2*n) then
7490 buffcount = val(bufline$(2 * n + 1))
7500 endif
7510 next n
7520 endfunc buffcount
7530 '数霊　結果表示
7540 Surei_Result:
7550 cls 3:Font 32
7560 'ゼロカウント:zcount
7570 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
7580 '例 アカい:"い"の文字は無効な文字なので、はじく
7590 zcount=0
7600 'mojicount:入力文字数
7610 mojicount = len(buffer_moji$)
7620 for n=1 to mojicount
7630 for j=1 to 118
7640 if (bufcount$(n - 1) = bufline$(2 * j)) then
7650 bufcount$(n-1) = Mid$(buffer_moji$,n,1)
7660 endif
7670 next j
7680 next n
7690 ncount=0:count=0
7700 for i = 1 to mojicount
7710 bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7720 'ンのカウント
7730 if (bufcount$(i-1) = "ン") then ncount = ncount + 1
7740 next i
7750 if (ncount > 0) then
7760 'Listを表示する
7770 moji_List$(0) = "この単語は目に見える物です"
7780 moji_List$(1) = "この単語は目に見えない物です"
7790 num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
7800 if (num2 = 0) then
7810 else
7820 if (num2 = 1) then
7830 n1 = 9 * ncount
7840 endif
7850 endif
7860 endif
7870 for j=1 to mojicount
7880 bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7890 count = count + Complate(bufcount$(j - 1))
7900 next j
7910 count = count + n1
7920 if (ncount > 0) then count = count
7930 '182以上のとき,181を引く
7940 if buf_cofig_r = 0 then
7950 if (count > 181) then
7960 count = count - 181
7970 else
7980 if (buf_config_r = 1) then
7990 buf_count = Single_Complate(count)
8000 endif
8010 endif
8020 endif
8030 cls 3:Font 48+16
8040 gload Gazo$ + "Result_Screen3_20230319.png"
8050 if buf_config_r = 1 then
8060 print "入力文字:" + buffer_moji$ + chr$(13)
8070 print "数霊(かずたま):";buf_count;chr$(13)
8080 endif
8090 if lang_flag = 1 then
8100 else
8110 color rgb(255,0,0)
8120 print "入力文字:" + buffer_moji$ + chr$(13)
8130 endif
8140 if lang_flag = 1 then
8150 else
8160 color rgb(0,0,255)
8170 print "数霊(かずたま):";count;chr$(13)
8180 endif
8190 if lang_flag = 1 then
8200 else
8210 color rgb(0,0,0)
8220 print "エンター or スペース" + chr$(13)
8230 print  chr$(13)
8240 'endif
8250 endif
8260 key$ = input$(1)
8270 if ((key$ = chr$(13)) or (key$=" ")) then
8280 List$(0)="1.もう一度数霊を見る"
8290 List$(1)="2.トップ画面に行く"
8300 List$(2)="3.この数霊の説明を見る"
8310 List$(3)="4.数霊データーを保存"
8320 num=ui_select("List$","番号を選んでください")
8330 select case num
8340 case 0:
8350 goto Surei_Input:
8360 case 1:
8370 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
8380 for i=0 to 9
8390 bufcount$(i)=""
8400 next i
8410 goto TopScreen:
8420 case 2:
8430 goto Surei_Result4:
8440 case 3:
8450 s=Surei_Result_Save_File()
8460 ui_msg "保存しました"
8470 case -1:
8480 'goto Surei_Result:
8490 case else:
8500 goto Surei_Result:
8510 end select
8520 'ファイルを保存する
8530 else
8540 goto Surei_Result:
8550 endif
8560 '3-1 バージョン情報
8570 Version:
8580 cls 3:Font 32
8590 select case device_No
8600 case 1:
8610 gload Gazo$ + "Screen1_Version.png"
8620 gload Gazo$ + "downscreen.png",0,0,800
8630 case 2:
8640 gload Gazo$ + "Screen1_version.png"
8650 end select
8660 play ""
8670 play Voice_File_TopScreen$ + "Voice_Version.mp3"
8680 color rgb(255,0,0)
8690 print chr$(13)
8700 color rgb(255,255,255)
8710 if lang_flag = 1 then
8720 else
8730 print chr$(13)+chr$(13)+chr$(13)
8740 print "Ver:";Version$ + chr$(13)
8750 print "アプリ名:数霊計算機" + chr$(13)
8760 print "Basic for Android Runtime" + chr$(13)
8770 print "Author:licksjp" + chr$(13)
8780 print "制作開始:2021.7.28" + chr$(13)
8790 print chr$(13)
8800 print "(C)Copy right licksjp " + chr$(13)
8810 print "All rights reserved" + chr$(13)
8820 print chr$(13)
8830 color rgb(0,0,0)
8840 print "パッドの右を押してください" + chr$(13)
8850 endif
8860 bg=0:key$=""
8870 while (bg <> 2 and key$ <> chr$(13))
8880 bg = strig(1)
8890 key$ = inkey$
8900 pause 2
8910 wend
8920 if key$ = chr$(13) then
8930 goto TopScreen:
8940 else
8950 if bg=2 then
8960 goto TopScreen:
8970 else
8980 if lang_flag = 1 then
8990 else
9000 talk "無効なキーです":goto Version:
9010 endif
9020 endif
9030 endif
9040 '3-2 参考文献
9050 Reference_Book:
9060 cls 3:Font 48:play""
9070 select case device_No
9080 case 1:
9090 gload Gazo$ + "Screen1_Reference.png"
9100 gload Gazo$ + "downscreen.png",0,0,800
9110 case 2:
9120 gload Gazo$ + "Screen1_Reference.png"
9130 end select
9140 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
9150 color rgb(255,0,0)
9160 print chr$(13)+chr$(13)
9170 if lang_flag = 1 then
9180 else
9190 color rgb(255,255,255)
9200 print "書名:数霊" + chr$(13)
9210 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
9220 print "出版社:徳間書店" + chr$(13)
9230 print "ISBN:978-4-19-" + chr$(13)
9240 print "         865309-5" + chr$(13)
9250 print "定価:2300円 + 税" + chr$(13)
9260 color rgb(0,0,0)
9270 print "パッドの右を押してください"
9280 endif
9290 bg = 0:key$ = ""
9300 while (bg <> 2 and key$ <> chr$(13))
9310 bg = strig(1)
9320 key$ = inkey$
9330 pause 2
9340 wend
9350 if key$ = chr$(13) then
9360 goto TopScreen:
9370 else
9380 if bg = 2 then
9390 goto TopScreen:
9400 else
9410 talk "無効なキーです":goto Reference_Book:
9420 endif
9430 endif
9440 'ヘルプ画面　トップ画面
9450 Help:
9460 No=1:c=0
9470 play ""
9480 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
9490 cls 3:Font 48:
9500 select case device_No
9510 case 1:
9520 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9530 gload Gazo$ + "downscreen.png",0,0,800
9540 case 2:
9550 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9560 end select
9570 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0
9580 color rgb(255,0,0)
9590 print chr$(13)+chr$(13)+chr$(13)
9600 color rgb(255,255,255)
9610 print "番号を選んでください" + chr$(13)
9620 print " :1.バージョン" + chr$(13)
9630 print " :2.参考文献" + chr$(13)
9640 print " :3.データーの初期化"+chr$(13)
9650 print " :4.トップ画面に行く" + chr$(13)
9660 color rgb(0,0,0)
9670 locate 0,15:print "                                     "
9680 if No = 1 then locate 0,15:print " 1.バージョンを選択"
9690 'y:バーチャルパッドの処理
9700 'key$:カーソルの処理
9710 'bg:バーチャルパッドの右ボタン
9720 Help_key:
9730 y = 0:key$ = "":bg = 0
9740 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
9750 y = stick(1)
9760 key$ = inkey$
9770 bg = strig(1)
9780 pause 2
9790 wend
9800 'バーチャルパッド　ここから'
9810 if y = 1 then
9820 select case No
9830 'No の初期値：No=1
9840 case 1:
9850 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
9860 if lang_flag = 1 then
9870 else
9880 locate 0,15:print" 2.参考文献を選択":goto Help_key:
9890 endif
9900 'デバッグライン　ここから
9910 '0のとき
9920 'デバッグライン　ここまで
9930 'デバッグライン　ここから
9940 case 3:
9950 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:No=0:pause 200:locate 0,15:print "                                                          "
9960 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":goto Help_key:
9970 'デバッグライン　ここまで
9980 'デバッグライン　ここから
9990 'デバッグライン　ここまで
10000 case 2:
10010 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 0,15:print "                                                          ":color rgb(0,0,0):locate 0,15:print "3.データーの初期化を選択":No=3:goto Help_key:
10020 case 0:
10030 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10040 'デバッグライン　ここから
10050 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
10060 'デバッグライン　ここまで
10070 end select
10080 endif
10090 'バーチャルパッド　上 ここから
10100 if y = -1 then
10110 select case No
10120 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
10130 case 1:
10140 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                                           ":locate 0,15:print" 4.トップ画面に行くを選択":goto Help_key
10150 'No:3 3.Help→2.設定 No:2
10160 case 3:
10170 sp_on 1,0:sp_on 0,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                                          ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
10180 case 2:
10190 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                                          ":locate 0,15:print" 1.バージョンを選択":goto Help_key:
10200 case 0:
10210 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                                          ":locate 0,15:print" 3.データーの初期化を選択":goto Help_key:
10220 end select
10230 endif
10240 if bg = 2 then
10250 select case No
10260 '1.数霊チェックを選択  パッドの右キー
10270 case 1:
10280 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
10290 '2.設定を選択    パッドの右キー
10300 case 2:
10310 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
10320 '3.データーの初期化
10330 case 3:
10340 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto data_initialize:
10350 '4.ヘルプを選択 パッドの右
10360 case 0:
10370 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
10380 'プログラムの終了を選択
10390 'if lang_flag = 1 then
10400 'lang_flag = 1:英語
10410 'Else
10420 'lang_flag = 0:日本語
10430 'endif
10440 end select
10450 '4.終了するを選択  パッドの右
10460 endif
10470 'バーチャルパッド　上　ここまで
10480 'バーチャルパッド　ここまで'
10490 'key$ = input$(1)
10500 'カーソルの下
10510 if key$ = chr$(31) then
10520 select case (No Mod 4)
10530 'バージョンから参考文献
10540 case 0:
10550 c=1:No=c:locate 0,15:Print "             ":locate 0,15:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
10560 '参考文献からトップ画面
10570 case 1:
10580 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "            ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10590 'トップ画面から終了
10600 '終了からバージョン
10610 case 2:
10620 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                     ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10630 case else:
10640 goto Help_key:
10650 end select
10660 endif
10670 'カーソル　上
10680 if key$ = chr$(30) then
10690 select case (c Mod 4)
10700 'バージョンから終了
10710 case 0:
10720 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:locate 0,15:print "                   ":locate 0,15:print " 4.終 了を選択":goto Help_key:
10730 '参考文献からバージョン
10740 case 1:
10750 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                   ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10760 'トップ画面から参考文献
10770 case 2:
10780 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":locate 0,15:print " 2.参考文献を選択":goto Help_key:
10790 '終了からトップ画面を選択
10800 case 3:
10810 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print"                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10820 case else:
10830 goto Help_key:
10840 end select
10850 endif
10860 'エンターキー：決定
10870 if key$=chr$(13) then
10880 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10890 if No=0 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10900 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10910 else
10920 goto Help_key:
10930 endif
10940 '登録文字の確認
10950 '文字を1文字入れて登録されているか調べるメニュー
10960 '設定項目
10970 Setting:
10980 cls 3:Font 48
10990 select case device_No
11000 case 1:
11010 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
11020 gload Gazo$ + "downscreen.png",0,0,800
11030  case 2:
11040 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
11050 end select
11060 play ""
11070 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
11080 No=1
11090 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:
11100 color rgb(0,0,255)
11110 print chr$(13)
11120 if lang_flag = 1 then
11130 'lang_flag = 1:英語
11140 else
11150 'lang_flag = 0:日本語
11160 color rgb(255,255,255)
11170 print chr$(13)
11180 print "番号を選んでください" + chr$(13)
11190 '-------コメント----------------
11200 'print " :1.登録文字の確認" + chr$(13)
11210 'print " :2.数霊文字確認" + chr$(13)
11220 '-------コメント----------------
11230 'print chr$(13)
11240 print " :1.文字の項目" + chr$(13)
11250 print " :2.結果表示設定" + chr$(13)
11260 print " :3.言語設定" + chr$(13)
11270 print " :4.トップ画面に行く" + chr$(13)
11280 endif
11290 color rgb(0,0,0)
11300 locate 0,15
11310 if No=1 then locate 0,15:print  "                                     ":locate 0,15:print " 1.文字の項目を選択"
11320 'y:バーチャルパッドの処理
11330 'key$:カーソルの処理
11340 'bg:バーチャルパッドの右ボタン
11350 SettingScreen:
11360 y = 0:key$ = "":bg=0
11370 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
11380 y = stick(1)
11390 key$ = inkey$
11400 bg=strig(1)
11410 pause 2
11420 wend
11430 'バーチャルパッド　ここから'
11440 'バーチャルパッド　ここから'
11450 if y = 1 then
11460 select case No
11470 'No の初期値：No=1
11480 case 1:
11490 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":color rgb(0,0,0):locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11500 'デバッグライン　ここから
11510 '0のとき
11520 'デバッグライン　ここまで
11530 'デバッグライン　ここから
11540 case 2:
11550 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                         "
11560 color rgb(0,0,0)::No=3
11570 if lang_flag = 1 then
11580 else
11590 locate 1,15:print "3.言語設定を選択":goto SettingScreen:
11600 endif
11610 'デバッグライン　ここまで
11620 case 3:
11630 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                              ":locate 1,15:print "4.トップ画面に行くを選択":No=0:goto SettingScreen:
11640 'デバッグライン　ここから
11650 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11660 'デバッグライン　ここまで
11670 case 0:
11680 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
11690 'デバッグライン　ここから
11700 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11710 'デバッグライン　ここまで
11720 end select
11730 endif
11740 'バーチャルパッド　上 ここから
11750 if y = -1 then
11760 select case No
11770 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11780 case 1:
11790 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 1,15:print"4.トップ画面に行くを選択":goto SettingScreen:
11800 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11810 case 0:
11820 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
11830 'No:3 3.Help→2.設定 No:2
11840 case 3:
11850 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.結果表示設定を選択":goto SettingScreen:
11860 case 2:
11870 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 1,15:print"1.文字の項目を選択":goto SettingScreen:
11880 end select
11890 endif
11900 if bg=2 then
11910 select case No
11920 '1.数霊チェックを選択  パッドの右キー
11930 case 1:
11940 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
11950 '2.設定を選択    パッドの右キー
11960 case 2:
11970 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
11980 '3.ヘルプを選択 パッドの右
11990 case 0:
12000 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
12010 'プログラムの終了を選択
12020 case 3:
12030 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Setting_Language:
12040 end select
12050 endif
12060 '4.終了するを選択  パッドの右
12070 'バーチャルパッド　ここまで'
12080 'カーソル下'
12090 if key$ = chr$(31) then
12100 select case (No Mod 4)
12110 '登録文字から数霊文字の確認
12120 case 1:
12130 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                     ":locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
12140 '数霊文字の確認からトップ画面に行く
12150 case 2:
12160 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "                                     ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
12170 'トップ画面に行くから終了
12180 case 3:
12190 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,590),0,0:locate 0,15:print "                                       ":locate 1,15:print "4.トップ画面に行くを選択":goto SettingScreen:
12200 '終了から登録文字
12210 case 0:
12220 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
12230 end select
12240 endif
12250 'カーソル　上
12260 if key$ = chr$(30) then
12270 select case (No Mod 4)
12280 case 1:
12290 c=2:No=c:sp_on 0,1:sp_put 0,(5,300),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
12300 case 2:
12310 c=3:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
12320 case 3:
12330 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:goto SettingScreen:
12340 case 0:
12350 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,590),0,0:sp_on 0,0:goto SettingScreen:
12360 end select
12370 endif
12380 'エンターキーを押したとき
12390 if key$ = chr$(13) then
12400 if No=3 then goto Setting_Language:
12410 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
12420 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
12430 if No=0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
12440 endif
12450 '文字検索項目  ここから
12460 Moji_Search:
12470 cls 4:cls 3:Font 32+16:init"kb:2"
12480 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12490 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12500 play ""
12510 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
12520 print "" + chr$(13)
12530 color rgb(255,255,255)
12540 if lang_flag = 1 then
12550 Else
12560 print "文字を一文字入れてください" + chr$(13)
12570 endif
12580 color rgb(0,0,0)
12590 if lang_flag=1 then
12600 Else
12610 Input "登録文字:",moji$
12620 endif
12630 moji_count = len(moji$)
12640 if moji_count > 1 then
12650 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Moji_Search:
12660 else
12670 count=0
12680 for n = 0 to 116
12690 if bufline$(2*n) = moji$ then
12700 cls 3:font 48:init"kb:4"
12710 select case device_No
12720 case 1:
12730 gload Gazo$ + "downscreen.png",0,0,800
12740 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12750 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12760 case 2:
12770 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12780 end select
12790 play ""
12800 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12810 if lang_flag = 1 then
12820 Else
12830 print chr$(13)
12840 color rgb(255,255,255)
12850 print moji$;"は、登録されています。" + chr$(13)
12860 color rgb(0,0,0)
12870 print "ジョイパッドの右を押してください"
12880 endif
12890 bg = 0:key$ = ""
12900 while (bg <> 1 and key$ <> chr$(13))
12910 key$ = inkey$
12920 bg = strig(1)
12930 pause 2
12940 wend
12950 if key$ = chr$(13) then goto TopScreen:
12960 if bg=1 then goto TopScreen:
12970 count = count + 1
12980 endif
12990 next n
13000 if count = 0 then
13010 cls 3:font 48:init "kb:4"
13020 gload Gazo$ + "Moji_check.png"
13030 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
13040 play ""
13050 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
13060 print chr$(13)
13070 if lang_flag = 1 then
13080 Else
13090 color rgb(255,255,255)
13100 print moji$;"は、登録されていません。" + chr$(13)
13110 color rgb(0,0,0)
13120 print "パッドの右を押してください" + chr$(13)
13130 endif
13140 bg = 0:key$ = ""
13150 while (kg <> 1 and key$ <> chr$(13))
13160 key$ = inkey$
13170 bg = strig(1)
13180 pause 2
13190 wend
13200 if ((key$ = chr$(13)) or (bg=2)) then goto TopScreen:
13210 endif
13220 endif
13230 Surei_Result2:
13240 cls 3:Font 48
13250 zcount1=0:zcount2=0:count1=0:count2=0
13260 '1人目
13270 mojicount1=len(buf_Parson1$)
13280 '2人目
13290 mojicount2 = len(buf_Parson2$)
13300 '1人目
13310 for n = 1 to mojicount1
13320 for j = 1 to 116
13330 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
13340 if bufcount1$(n-1) = bufline$(2*j) then
13350 zcount1 = zcount1 + 1
13360 endif
13370 next j
13380 next n
13390 '2人目
13400 for n = 1 to mojicount2
13410 for j = 1 to 116
13420 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
13430 if bufcount2$(n-1) = bufline$(2*j) then
13440 zount2 = zcount2 + 1
13450 endif
13460 next j
13470 next n
13480 '1人目
13490 for i=1 to mojicount1
13500 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
13510 p1 = Complate(bufcount1$(i-1))
13520 count1 = count1 + p1
13530 next i
13540 '2人目
13550 for i = 1 to mojicount2
13560 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
13570 p2 = Complate(bufcount2$(i-1))
13580 count2 = count2 + p2
13590 next i
13600 cls 3:
13610 select case device_No
13620 case 1:
13630 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
13640 gload Gazo$ + "downscreen.png",0,0,800
13650 case 2:
13660 gload Gazo$ + "downscreen.png",0,0,0
13670 end select
13680 color rgb(255,0,0)
13690 print ""+chr$(13)
13700 if lang_flag = 1 then
13710 else
13720 color rgb(255,255,255)
13730 print chr$(13)+chr$(13)
13740 print "1人目:";buf_Parson1$;chr$(13)
13750 print "数霊1:";count1;chr$(13)
13760 print "2人目:";buf_Parson2$;chr$(13)
13770 print "数霊2:";count2;chr$(13)
13780 print "数霊(合計):";count1 + count2;chr$(13)
13790 color rgb(0,0,0)
13800 print "バーチャルパッドの右" + chr$(13)
13810 endif
13820 key$ = "":bg = 0
13830 while (bg <> 2 and key$ <> chr$(13))
13840 bg = strig(1)
13850 key$ = inkey$
13860 pause 2
13870 wend
13880 if (bg = 2 or key$ = chr$(13))  then goto TopScreen:
13890 Surei_Result3:
13900 cls 3:Font 48
13910 zcount2 = 0:count2 = 0
13920 mojicount2 = len(buffer_moji2$)
13930 for n = 1 to mojicount2
13940 for j = 1 to 116
13950 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
13960 if bufcount2$(n - 1) = bufline$(2 * j) then
13970 zcount2 = zcount2 + 1
13980 endif
13990 next j
14000 next n
14010 for i = 1 to mojicount2
14020 n2 = Complate(bufcount2$(i-1))
14030 count2 = count2 + n2
14040 next i
14050 gload Gazo$ + "Screen5.png"
14060 if lang_flag = 1 then
14070 else
14080 color rgb(255,0,0)
14090 print "数霊の結果表示" + chr$(13)
14100 color rgb(255,255,255)
14110 print "１回目回の文字入力:";buffer_moji$;chr$(13)
14120 print "１回目の数霊(かずたま)";count;chr$(13)
14130 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
14140 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
14150 color rgb(0,0,0)
14160 print "エンターキー:トップ画面";chr$(13)
14170 print "c or C キー:数霊の比較";chr$(13)
14180 endif
14190 key$ = "":bg = 0
14200 while (key$ <> chr$(13) and bg <> 2)
14210 bg = strig(1)
14220 key$ = inkey$
14230 pause 2
14240 wend
14250 if bg = 2 then goto TopScreen:
14260 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
14270 if key$ = "c" or key$ = "C" then
14280 if count = count2 then
14290 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
14300 else
14310 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
14320 endif
14330 endif
14340 Moji_Count_Check:
14350 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
14360 cls 3:Font 48
14370 select case device_No
14380 case 1:
14390 gload Gazo$ + "Moji_check.png"
14400 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
14410 gload Gazo$ + "downscreen.png",0,0,800
14420 case 2:
14430 gload Gazo$ + "Moji_check.png",0,0,0
14440 end select
14450 n = 0
14460 open FILE_csv$ for input as #1
14470 while eof(1) = 0
14480 line input #1, line$
14490 n = n + 1
14500 wend
14510 close #1
14520 play ""
14530 if n = 118 then
14540 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
14550 if lang_flag = 1 then
14560 else
14570 print "" + chr$(13)
14580 color rgb(255,255,255)
14590 print "文字の登録文字数は";n;"文字" + chr$(13)
14600 color rgb(0,0,0)
14610 print "パッドの右を押してください" + chr$(13)
14620 endif
14630 endif
14640 key$ = "":bg = 0
14650 while (key$ <> chr$(13) and bg <> 2)
14660 key$=inkey$
14670 bg=strig(1)
14680 pause 2
14690 wend
14700 if bg = 2 then goto TopScreen:
14710 if key$ = chr$(13) then
14720 goto TopScreen:
14730 else
14740 goto Moji_Count_Check:
14750 endif
14760 'Save 関数
14770 file_kazutama = 0
14780 file_kazutama = Save_File()
14790 func Save_File()
14800 open SAVE_DATA1$  for output as #1
14810 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
14820 close #1
14830 endfunc
14840 Select_moji:
14850 cls 3:font 48:No = 1
14860 select case device_No
14870 case 1:
14880 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
14890 'gload Gazo$ + "MiddleScreen_20230401.png",0,0,560
14900 gload Gazo$ + "downscreen.png",0,0,800
14910 case 2:
14920 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
14930 end select
14940 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
14950 color rgb(255,0,0)
14960 if lang_flag = 1 then
14970 else
14980 play ""
14990 play Voice_File_TopScreen$ + "Voice_Select_Moji20230217.mp3"
15000 print chr$(13)+chr$(13)+chr$(13)
15010 color rgb(255,255,255)
15020 print "番号を選んでください" + chr$(13)
15030 print " :1.登録文字検索"+ chr$(13)
15040 print " :2.登録文字数の確認" + chr$(13)
15050 print " :3.数字から数霊の説明"+chr$(13)
15060 print " :4.トップ画面に戻る" + chr$(13)
15070 color rgb(0,0,0)
15080 locate 0,15
15090 if No = 1 then print " 1.登録文字検索を選択"
15100 endif
15110 Entry_check_key:
15120 y = 0:key$ = "":bg=0
15130 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
15140 y = stick(1)
15150 key$ = inkey$
15160 bg=strig(1)
15170 pause 2
15180 wend
15190 'バーチャルパッド　ここから'
15200 'バーチャルパッド　ここから'
15210 if y = 1 then
15220 select case No
15230 'No の初期値：No=1
15240 case 1:
15250 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print "2.登録文字数の確認を選択":goto Entry_check_key:
15260 'デバッグライン　ここから
15270 '0のとき
15280 'デバッグライン　ここまで
15290 'デバッグライン　ここから
15300 case 2:
15310       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 0,15:print "                                                         ":No=3:locate 0,15:print"3.数字から数霊の説明":goto Entry_check_key:
15320 case 3:
15330 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:locate 0,15:print "                                       "
15340 :No=0
15350 'if lang_flag = 1 then
15360 'Else
15370 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に戻るを選択":goto Entry_check_key:
15380 'endif
15390 'cls:color rgb(255,255,255):print"ok"
15400 'デバッグライン　ここまで
15410 'デバッグライン　ここから
15420 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
15430 'デバッグライン　ここまで
15440 case 0:
15450 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.登録文字数の確認を選択":goto Entry_check_key:
15460 'デバッグライン　ここから
15470 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
15480 'デバッグライン　ここまで
15490 end select
15500 endif
15510 'バーチャルパッド　上 ここから
15520 if y = -1 then
15530 select case No
15540 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15550 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15560 case 0:
15570       sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print "                                      ":locate 0,15:print "3.数字から数霊の説明":goto Entry_check_key:
15580 case 1:
15590 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print"3.トップ画面に戻るを選択":goto Entry_check_key:
15600 'No:3 3.Help→2.設定 No:2
15610 case 3:
15620 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
15630 case 2:
15640 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print "1.登録文字検索":goto Entry_check_key:
15650 end select
15660 endif
15670 if bg=2 then
15680 select case No
15690 '1.数霊チェックを選択  パッドの右キー
15700 case 1:
15710 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15720 '2.設定を選択    パッドの右キー
15730 case 2:
15740 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15750 '3.ヘルプを選択 パッドの右
15760 case 0:
15770 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15780 case 3:
15790 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Input_numbertokazutama:
15800 end select
15810 endif
15820 '4.終了するを選択  パッドの右
15830 'バーチャルパッド　ここまで'
15840 'key$ = input$(1)
15850 'カーソルの下
15860 if key$ = chr$(31) then
15870 select case (No Mod 4)
15880 case 0:
15890 c=1:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
15900 case 1:
15910 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,500),0,0:sp_on 3,0:goto Entry_check_key:
15920 case 2:
15930 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:goto Entry_check_key:
15940 case 3:
15950 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
15960 end select
15970 endif
15980 'カーソル　上
15990 if key$ = chr$(30) then
16000 select case (No Mod 4)
16010 case 0:
16020 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
16030 case 1:
16040 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
16050 case 2:
16060 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
16070 case 3:
16080 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
16090 end select
16100 endif
16110 'エンターキーを押す
16120 if key$ = chr$(13) then
16130 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
16140 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
16150 if No = 0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16160 endif
16170 '
16180 Kakunin_Surei_count:
16190 cls 3:font 48:No=0
16200 select case device_No
16210 case 1:
16220 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
16230 'gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
16240 gload Gazo$ + "downscreen.png",0,0,800
16250 case 2:
16260 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
16270  end select
16280 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
16290 color rgb(255,0,0)
16300 print chr$(13)+chr$(13)+chr$(13)
16310 color rgb(255,255,255)
16320 print "番号を選んでください" + chr$(13)
16330 print " :1.数霊リスト 1人用" + chr$(13)
16340 print " :2.結果表示設定" + chr$(13)
16350 print " :3.トップ画面に行く" + chr$(13)
16360 print "" + chr$(13)
16370 color rgb(0,0,0)
16380 locate 0,15:print"                                                         "
16390 if No = 0 then locate 1,15:print "1.数霊リスト　1人用を選択"
16400 Entry_List:
16410 y = 0:key$ = "":bg=0
16420 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
16430 y = stick(1)
16440 key$ = inkey$
16450 bg = strig(1)
16460 pause 2
16470 wend
16480 'バーチャルパッド　ここから'
16490 'バーチャルパッド　ここから'
16500 'バーチャルパッド　下
16510 if y = 1 then
16520 select case No
16530 'No の初期値：No=1
16540 case 0:
16550 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=1:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.結果表示設定を選択":goto Entry_List:
16560 'デバッグライン　ここから
16570 '0のとき
16580 'デバッグライン　ここまで
16590 'デバッグライン　ここから
16600 'color rgb(0,0,0):locate 0,15:print " 4.終了を選択":goto Entry_List:
16610 'cls:color rgb(255,255,255):print"ok"
16620 'デバッグライン　ここまで
16630 case 2:
16640 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,300),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 1.数霊リスト 1人用を選択":No=0:goto Entry_List:
16650 case 1:
16660 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                      ":No=2:locate 1,15:print "3．トップ画面に行くを選択":goto Entry_List:
16670 'デバッグライン　ここから
16680 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
16690 'デバッグライン　ここまで
16700 'デバッグライン　ここから
16710 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
16720 'デバッグライン　ここまで
16730 end select
16740 endif
16750 'バーチャルパッド　上 ここから
16760 if y = -1 then
16770 select case No
16780 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
16790 case 2:
16800 sp_on 2,0:sp_on 0,0:sp_on 1,1:sp_on 3,0:sp_put 1,(5,400),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 2.結果表示設定を選択":goto Entry_List:
16810 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
16820 case 0:
16830 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 1,15:print"3.トップ画面に行くを選択":goto Entry_List:
16840 'No:3 3.Help→2.設定 No:2
16850 case 1:
16860 sp_on 1,0:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 0,(5,300),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print "1.数霊リスト 1人用を選択":goto Entry_List:
16870 end select
16880 endif
16890 if bg = 2 then
16900 select case No
16910 '1.数霊リスト 一人用を選択を選択  パッドの右キー
16920 case 0:
16930 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16940 '2.設定を選択  パッドの右キー
16950 case 1:
16960 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16970 case 2:
16980 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16990 end select
17000 endif
17010 if key$=chr$(13) then
17020 select case No
17030 case 0:
17040 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
17050 case 1:
17060 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
17070 case 2:
17080 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
17090 end select
17100 endif
17110 '4.終了するを選択  パッドの右
17120 'バーチャルパッド　ここまで'
17130 Surei_List1:
17140 cls 3:font 48
17150 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
17160 file$ = dir$(SAVE_DATA1$,0)
17170 'ファイルが無いときの画面
17180 if file$ = ""  then
17190 '背景画面表示
17200 select case device_No
17210 case 1:
17220 gload Gazo$ + "KazutamaList1.png",0
17230 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
17240 gload Gazo$+"downscreen.png",0,0,800
17250 case 2:
17260 gload Gazo$ + "KazutamaList1.png"
17270 end select
17280 print chr$(13)
17290 color rgb(255,255,255):print "登録ファイルはございません" + chr$(13)
17300 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
17310 'else
17320 'endif
17330 bg = 0:key$ = ""
17340 while (key$ <> chr$(13) and bg<>2)
17350 key$ = inkey$
17360 bg = strig(1)
17370 pause 2
17380 wend
17390 'エンターキーもしくはバーチャルパッドの右でトップに行く
17400 if (bg = 2  or key$ = chr$(13)) then goto TopScreen:
17410 else
17420 cls 3:buffer_list_count = Loadcount()
17430 color rgb(255,255,255)
17440 if lang_flag = 1 then
17450 Else
17460 talk "登録件数は" + str$(buffer_list_count) + "件です"
17470 select case device_No
17480 Case 1:
17490 gload Gazo$ + "KazutamaList1_Entry.png",0,0,0
17500 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
17510 gload Gazo$ + "downscreen.png",0,0,800
17520 case 2:
17530 gload Gazo$+"KazutamaList1_Entry.png",0,0,0
17540 end select
17550 color rgb(0,0,255)
17560 print chr$(13)
17570 color rgb(255,255,255)
17580 print "登録件数:";buffer_list_count;"件";chr$(13)
17590 color rgb(0,0,0)
17600 print "パッドの右を押してください" + chr$(13)
17610 endif
17620 bg = 0:key$ = "":bg2 = 0
17630 while (key$ <> chr$(13) and bg <> 2)
17640 key$ = inkey$
17650 bg = strig(1)
17660 bg2=strig(0)
17670 pause 2
17680 wend
17690 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
17700 if (key$ = chr$(13) or bg = 2) then pause 2:goto KotodamaList_page:
17710 endif
17720 if (bg = 2) then pause 2:goto TopScreen:
17730 func Loadcount()
17740 n = 0
17750 'while eof(1)=-1
17760 open SAVE_DATA1$  for input as #1
17770 while eof(1) <> -1
17780 line input #1,line$
17790 n = n + 1
17800 wend
17810 close #1
17820 count = n
17830 endfunc count
17840 count_line = Loadcount()
17850 func Kotodama$(buf$)
17860 color rgb(255,255,255)
17870 b = len("数霊:")
17880 a$ = Mid$(buf$,b+1,len(buf$))
17890 for i=0 to 118
17900 color rgb(255,255,255)
17910 if bufline3$(2 * i) ="数霊:" + a$  then
17920 moji_$ = bufline3$(2*i + 1)
17930 endif
17940 next i
17950 kotodama$ = moji_$
17960 endfunc kotodama$
17970 KotodamaList_page:
17980 cls 3:font 48:m = 0:
17990 select case device_No
18000 case 1:
18010 gload Gazo$ + "Screen5_Surei_List.png"
18020 gload Gazo$ + "downscreen.png",0,0,800
18030 case 2:
18040 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
18050 end select
18060 if SAVE_DATA1$ = "" then
18070 cls 3:color rgb(255,255,255):print"ファイルがありません"
18080 else
18090 a = Loadcount()
18100 open SAVE_DATA1$  for input as #1
18110 for i=0 to a-1
18120 for n=0 to 1
18130 input #1,line$
18140 bufKaztama$(i,n) = line$
18150 next n
18160 next i
18170 close #1
18180 l = 0:n=0
18190 select case device_No
18200 case 1:
18210 gload Gazo$ + "Screen5_Surei_List.png"
18220 gload Gazo$ + "downscreen.png",0,0,800
18230 case 2:
18240 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
18250 end select
18260 while (buffer_list_count >= l)
18270 cls
18280 color rgb(255,0,0)
18290 print chr$(13)
18300 color rgb(255,255,255)
18310 n=n+1
18320 print chr$(13)
18330 print "番号:";l+1;chr$(13)
18340 print bufKaztama$(l,0) + chr$(13)
18350 print bufKaztama$(l,1) + chr$(13)
18360 Kmoji$ = moji$
18370 print chr$(13) + chr$(13) + chr$(13)
18380 color rgb(0,0,0)
18390 if buffer_list_count=1 then
18400 print " :パッドの左:トップ画面"+chr$(13)
18410 ui_msg "登録件数は1件です。"
18420 else
18430 if buffer_list_count > 1 then
18440 print " :パッドの左:トップ画面" + chr$(13)
18450 print " :パッドの右:次へ行く" + chr$(13)
18460 endif
18470 endif
18480 key$ = "":bg = 0:bg2 = 0
18490 while (key$ <> chr$(13) and bg <> 2 and bg2 <> 1)
18500 key$ = inkey$
18510 bg = strig(1)
18520 bg2 = strig(0)
18530 pause 2
18540 wend
18550 'if n > 1 then
18560 if (key$ = " " OR bg = 2) then
18570 if n > 1 then
18580 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
18590 endif
18600 else
18610 if ((bg2 = 1) or (key$=chr$(13))) then
18620 goto TopScreen:
18630 endif
18640 else
18650 goto KotodamaList_page:
18660 endif
18670 wend
18680 endif
18690 'ndif
18700 '結果表示２ Menu1
18710 Surei_Result4:
18720 cls 3:font 32+16:init"kb:4"
18730 for i=0 to 181 + 4 - 1
18740 if i = count  then
18750 buffer$ = bufline2$(count + 4,1)
18760 endif
18770 next i
18780 if len(buffer$) > 21 and len(buffer$) <= 45 then
18790 buffer2$ = Mid$(buffer$,1,22)
18800 buffer3$ = Mid$(buffer$,23,(len(buffer$) - 22))
18810 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13)
18820 else
18830 if len(buffer$) <= 21 then
18840 buffer2$ = Mid$(buffer$,1,21)
18850 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
18860 else
18870 if len(buffer$) > 45 and len(buffer$) <= 62 then
18880 buffer2$ = Mid$(buffer$,1,22)
18890 buffer3$ = Mid$(buffer$,23,22)
18900 buffer4$ = Mid$(buffer$,44,(len(buffer$)-44))
18910 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13)
18920 else
18930 if len(buffer$) > 64 and len(buffer$) <= 81 then
18940 buffer2$ = Mid$(buffer$,1,22)
18950 buffer3$ = Mid$(buffer$,23,20)
18960 buffer4$ = Mid$(buffer$,44,20)
18970 buffer5$ = Mid$(buffer$,65,(len(buffer$)-65))
18980 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13)
18990 if len(buffer$) > 81 and len(buffer$) <= 110 then
19000 buffer2$ = Mid$(buffer$,1,22)
19010 buffer3$ = Mid$(buffer$,23,20)
19020 buffer4$ = Mid$(buffer$,43,20)
19030 buffer5$ = Mid$(buffer$,63,20)
19040 buffer6$ = Mid$(buffer$,83,(len(buffer$) - 83))
19050 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13)
19060 endif
19070 endif
19080 endif
19090 endif
19100 endif
19110 Surei_Result4_2:
19120 select case device_No
19130 case 1:
19140 gload Gazo$ + "Screen1_Result2.png"
19150 gload Gazo$ + "downscreen.png",0,0,800
19160 case 2:
19170 gload Gazo$ +"Screen1_Result2.png"
19180 end select
19190 Result_Menu_List$(0)="1.トップ画面に行く"
19200 Result_Menu_List$(1)="2.数霊のデーターを保存"
19210 Result_Menu_List$(2)="3.もう一度、数霊を調べる"
19220 cls
19230 print chr$(13)
19240 if lang_flag = 1 then
19250 else
19260 color rgb(127,255,212)
19270 print chr$(13);chr$(13)
19280 print "入力文字:";buffer_moji$;chr$(13)
19290 print "数霊:";count;chr$(13)
19300 color rgb(255,255,255)
19310 print "数霊の説明:"+chr$(13)
19320 print buffer$
19330 color rgb(0,0,0)
19340 locate 0,15
19350 print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
19360 endif
19370 key$ = "":bg = 0:bg2 = 0
19380 while (bg<>2 and bg2<>1)
19390 key$ = inkey$
19400 bg = strig(1)
19410 bg2 = strig(0)
19420 pause 2
19430 wend
19440 if ((bg = 2) or (bg2 = 1)) then
19450 num = ui_select("Result_Menu_List$","番号を選んでください")
19460 endif
19470 if num = 0 then goto TopScreen:
19480 if num = 1 then goto File_save:
19490 if num = 2 then goto Surei_Input:
19500 if num = -1 then goto Surei_Result4
19510 File_save:
19520 'ファイルがない時
19530 if dir$(SAVE_DATA1$) = " " then
19540 open SAVE_DATA1$ for output as #1
19550 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19560 close #1
19570 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19580 'ファイルが有る時
19590 else
19600 open SAVE_DATA1$ for append as #1
19610 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19620 close #1
19630 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19640 endif
19650 func All_clear()
19660 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
19670 endfunc
19680 'ここから
19690 Config_moji1:
19700 cls 3:Font 48
19710 select case device_No
19720 case 1:
19730 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19740 gload Gazo$ + "downscreen.png",0,0,800
19750 case 2:
19760  gload  Gazo$ + "Screen1_Setting_Top.png",0,0,0
19770 end select
19780 play ""
19790 No=1
19800 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19810 color rgb(0,0,255)
19820 print chr$(13)
19830 if lang_flag = 1 then
19840 'lang_flag = 1:英語
19850 else
19860 'lang_flag = 0:日本語
19870 color rgb(255,255,255)
19880 print "番号を選んでください" + chr$(13)
19890 print " :1.文字の項目" + chr$(13)
19900 print " :2.結果表示設定" + chr$(13)
19910 print " :3.トップ画面に行く" + chr$(13)
19920 print " :4.終 了" + chr$(13)
19930 endif
19940 color rgb(0,0,0)
19950 locate 1,12
19960 if No = 1 then print "1.文字の項目"
19970 'y:バーチャルパッドの処理
19980 'key$:カーソルの処理
19990 'bg:バーチャルパッドの右ボタン
20000 Config_moji1_Screen:
20010 y = 0:key$ = "":bg=0
20020 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
20030 y = stick(1)
20040 key$ = inkey$
20050 bg=strig(1)
20060 pause 2
20070 wend
20080 'バーチャルパッド　ここから'
20090 'バーチャルパッド　ここから'
20100 if y = 1 then
20110 select case No
20120 'No の初期値：No=1
20130 case 1:
20140 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20150 'デバッグライン　ここから
20160 '0のとき
20170 'デバッグライン　ここまで
20180 'デバッグライン　ここから
20190 case 2:
20200 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
20210 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
20220 'if lang_flag = 1 then
20230 'else
20240 locate 1,12:print "3.トップ画面に行くを選択"
20250 'endif
20260 'デバッグライン　ここまで
20270 case 3:
20280 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
20290 'デバッグライン　ここから
20300 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
20310 'デバッグライン　ここまで
20320 case 0:
20330 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20340 'デバッグライン　ここから
20350 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
20360 'デバッグライン　ここまで
20370 end select
20380 endif
20390 'バーチャルパッド　上 ここから
20400 if y = -1 then
20410 select case No
20420 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
20430 case 1:
20440 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
20450 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
20460 case 0:
20470 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
20480 'No:3 3.Help→2.設定 No:2
20490 case 3:
20500 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20510 case 2:
20520 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
20530 end select
20540 endif
20550 if bg=2 then
20560 select case No
20570 '1.数霊チェックを選択  パッドの右キー
20580 case 1:
20590 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
20600 '2.設定を選択    パッドの右キー
20610 case 2:
20620 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
20630 '3.ヘルプを選択 パッドの右
20640 case 3:
20650 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
20660 'プログラムの終了を選択
20670 case 0:
20680 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
20690 'if lang_flag = 1 then
20700 'Else
20710 ui_msg "プログラムを終了します":end
20720 'endif
20730 end select
20740 endif
20750 '4.終了するを選択  パッドの右
20760 'バーチャルパッド　ここまで'
20770 'SettingScreen:
20780 'key$ = input$(1)
20790 'カーソル下'
20800 if key$ = chr$(31) then
20810 select case (No Mod 4)
20820 '登録文字から数霊文字の確認
20830 case 1:
20840 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
20850 '数霊文字の確認からトップ画面に行く
20860 case 2:
20870 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
20880 'トップ画面に行くから終了
20890 case 3:
20900 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
20910 '終了から登録文字
20920 case 0:
20930 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20940 end select
20950 endif
20960 'カーソル　上
20970 if key$ = chr$(30) then
20980 select case (No Mod 4)
20990 case 1:
21000 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
21010 case 2:
21020 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
21030 case 3:
21040 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
21050 case 0:
21060 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
21070 end select
21080 endif
21090 'エンターキーを押したとき
21100 if key$ = chr$(13) then
21110 if No=3 then goto TopScreen:
21120 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
21130 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
21140 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
21150 'lse
21160 'o'o SettingScreen:
21170 endif
21180 'ここまで
21190 Config_moji2:
21200 cls 3:Font 48
21210 select case device_No
21220 case 1:
21230 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
21240 gload Gazo$ + "downscreen.png",0,0,800
21250  case 2:
21260 gload Gazo$ + "Screen1_Setting_Top.png "
21270  end select
21280 play ""
21290 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
21300 No=1
21310 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
21320 color rgb(0,0,255)
21330 'print "●設定項目" + chr$(13)
21340 print chr$(13)
21350 if lang_flag = 1 then
21360 'lang_flag = 1:英語
21370 else
21380 'lang_flag = 0:日本語
21390 color rgb(255,255,255)
21400 print "番号を選んでください" + chr$(13)
21410 'print " :1.文字の項目" + chr$(13)
21420 'print " :2.結果表示設定" + chr$(13)
21430 print " :1.文字の項目" + chr$(13)
21440 print " :2.結果表示設定" + chr$(13)
21450 print " :3.トップ画面に行く" + chr$(13)
21460 print " :4.終 了" + chr$(13)
21470 endif
21480 color rgb(0,0,0)
21490 locate 1,12
21500 if No = 1 then print "1.文字の項目"
21510 'y:バーチャルパッドの処理
21520 'key$:カーソルの処理
21530 'bg:バーチャルパッドの右ボタン
21540 config_moji2:
21550 y = 0:key$ = "":bg=0
21560 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
21570 y = stick(1)
21580 key$ = inkey$
21590 bg = strig(1)
21600 pause 2
21610 wend
21620 'バーチャルパッド　ここから'
21630 'バーチャルパッド　ここから'
21640 if y = 1 then
21650 select case No
21660 'No の初期値：No=1
21670 case 1:
21680 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
21690 'デバッグライン　ここから
21700 '0のとき
21710 'デバッグライン　ここまで
21720 'デバッグライン　ここから
21730 case 2:
21740 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
21750 color rgb(0,0,0)::No=2:goto SettingScreen:
21760 if lang_flag = 1 then
21770 else
21780 locate 0,12:print " 3.トップ画面に行くを選択"
21790 endif
21800 'cls:color rgb(255,255,255):print"ok"
21810 'デバッグライン　ここまで
21820 case 3:
21830 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
21840 'デバッグライン　ここから
21850 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
21860 'デバッグライン　ここまで
21870 case 0:
21880 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21890 'デバッグライン　ここから
21900 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
21910 'デバッグライン　ここまで
21920 end select
21930 endif
21940 'バーチャルパッド　上 ここから
21950 if y = -1 then
21960 select case No
21970 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
21980 case 1:
21990 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
22000 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
22010 case 0:
22020 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
22030 'No:3 3.Help→2.設定 No:2
22040 case 3:
22050 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22060 case 2:
22070 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
22080 end select
22090 endif
22100 '決定ボタン
22110 if bg=2 then
22120 select case No
22130 '1.数霊チェックを選択  パッドの右キー
22140 case 1:
22150 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
22160 '2.設定を選択    パッドの右キー
22170 case 2:
22180 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
22190 '3.ヘルプを選択 パッドの右
22200 case 3:
22210 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
22220 'プログラムの終了を選択
22230 case 0:
22240 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
22250 'if lang_flag = 1 then
22260 'Else
22270 ui_msg "プログラムを終了します":end
22280 'endif
22290 end select
22300 endif
22310 '4.終了するを選択  パッドの右
22320 'バーチャルパッド　ここまで'
22330 'カーソル下'
22340 if key$ = chr$(31) then
22350 select case (No Mod 4)
22360 '登録文字から数霊文字の確認
22370 case 1:
22380 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22390 '数霊文字の確認からトップ画面に行く
22400 case 2:
22410 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
22420 'トップ画面に行くから終了
22430 case 3:
22440 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
22450 '終了から登録文字
22460 case 0:
22470 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
22480 end select
22490 endif
22500 'カーソル　上
22510 if key$ = chr$(30) then
22520 select case (No Mod 4)
22530 case 1:
22540 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
22550 case 2:
22560 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
22570 case 3:
22580 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
22590 case 0:
22600 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
22610 end select
22620 endif
22630 'エンターキーを押したとき
22640 if key$ = chr$(13) then
22650 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
22660 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
22670 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
22680 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
22690 'lse
22700 'o'o SettingScreen:
22710 endif
22720 '結果表示設定
22730 Result_Setting:
22740 color rgb(255,255,255)
22750 'dim list$(4)
22760 'ファイル読み込み
22770 '1.ファイルが有るか無いかのチェック
22780 if Dir$(System$) = "" then
22790 '1-1.ファイルがないとき
22800 '上のSystemフォルダを作成
22810 mkdir "./data/system/"
22820 list$(0) = "●:出た数字から181を引く"
22830 list$(1) = " :出た数字から180を引き単数変換"
22840 open System$ for output as #1
22850 print #1,"config_r=0"
22860 close #1
22870 ui_msg "ファイルを作成しました"
22880 'ファイル作成
22890 else
22900 '1-2.ファイルが有るとき
22910 'config_r:0 出た数字から181を引く
22920 'config_r:1 出た数字から180を引いて単数変換
22930 'open "./System/config.sys" for input as #1
22940 'ファイルが有るときファイルを読み込み
22950 open System$ for input as #1
22960 line input #1,buf_line$
22970 'buf$にデーターをコピーする
22980 buf$ = buf_line$
22990 close #1
23000 if len(buf$) = 10 then
23010 if left$(buf$,9) = "config_r=" then
23020 buf$ = right$(buf_line$,1)
23030 if buf$ = "1" then
23040 '1.System$ ファイルを削除(config.sys)
23050 '2.1行目をconfig_r=1と書き、保存する
23060 buf_config_r = 1
23070 'list$(0) = "●:1.出た数字から180を引いて単数変換"
23080 'list$(1) = " :2.出た数字から181を引く"
23090 else
23100 if buf$ = "0" then
23110 buf_config_r = 0
23120 ' list$(0) = "●:1.出た数字から181を引く"
23130 'list$(1) = " :2.出た数字から180を引いて単数変換"
23140 endif
23150 endif
23160 endif
23170 endif
23180 endif
23190 '"●:1.出た数字から180を引く"をlist$(0)に代入
23200 if buf_config_r =  0 then
23210 list$(0) = "●:1.出た数字から181を引く"
23220 list$(1) = " :2.出た数字から180を引いて単数変換"
23230 else
23240 list$(0) = "●:1.出た数字から180を引いて単数変換"
23250 list$(1) = " :2.出た数字から181を引く"
23260 endif
23270 list$(2) = " :トップ画面に戻る"
23280 list_num = ui_select("list$","番号を選んでください")
23290 play ""
23300 Select case (list_num)
23310 case 0:
23320 if buf$ = "1" then
23330 buf_config_r = 0:
23340 'データーを変更したのでファイルを削除
23350 kill System$
23360 'ファイルを新しく作成
23370 open System$ for output as #1
23380 print #1,"config_r=0"
23390 close #1
23400 ui_msg "設定を変更しました。"
23410 else
23420 'if buf$ = "0" then
23430 'buf_config_r = 1
23440 'kill System$
23450 'open Syetem$ for output as #1
23460 'print #1,"config_r=1"
23470 'close #1
23480 'ui_msg "設定を変更しました"
23490 'endif
23500 endif
23510 goto config_moji2:
23520 case 1:
23530 if buf$ = "0" then
23540 buf_config_r = 1:
23550 'データーを変更したので、ファイルを削除
23560 kill System$
23570 'ファイルを新しく作成
23580 open System$ for output as #1
23590 print #1,"config_r=1"
23600 close #1
23610 ui_msg "設定を変更しました"
23620 else
23630 kill System$
23640 if buf$ = "1" then
23650 open System$ for output as #1
23660 print #1,"config_r=0"
23670 close #1
23680 ui_msg "設定を変更しました"
23690 endif
23700 endif
23710 goto config_moji2:
23720 case 2:
23730 'トップ画面に飛ぶ
23740 goto TopScreen:
23750 case 3:
23760 'プログラムを終了する
23770 cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
23780 end select
23790 '単数変換
23800 Func Single_Complate(num)
23810 '1.出てきた数字から180を引く
23820 a = num - 180
23830 'a:10〜99
23840 Re1:
23850 if (a > 9 and a < 100) then
23860 b1 = fix(a / 10)
23870 b2 = 10 * a - b1
23880 d1 = b1 + b2
23890 if c > 9 then
23900 goto Re1:
23910 else
23920 c = d1:goto Re2:
23930 endif
23940 endif
23950 Re2:
23960 buffer = c
23970 endfunc buffer
23980 Func Surei_Result_Save_File()
23990 'ファイルがないとき
24000 if dir$(SAVE_DATA1$) = "" then
24010 open SAVE_DATA1$ for output as #1
24020 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
24030 close #1
24040 ui_msg "保存しました":talk "保存しました":goto Surei_Result:
24050 else
24060 open SAVE_DATA1$ for append as #1
24070 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
24080 close #1
24090 ui_msg "保存しました":talk "保存しました":goto Surei_Result
24100 endif
24110 endfunc
24120 '言語設定
24130 Setting_Language:
24140 cls 3:screen 1,1,1,1:No=2
24150 select case device_No
24160 case 1:
24170 gload Gazo$ + "Screen1.png",0,0,0
24180 gload Gazo$ + "downscreen.png",0,0,800
24190 case 2:
24200 gload Gazo$ + "Screen1.png",0,0,0
24210 end select
24220 init "Kb:4"
24230 sp_on 1,1:sp_on 0,0
24240 sp_put 0,(0,300),0,0
24250 sp_put 1,(0,400),1,0
24260 color rgb(0,0,255)
24270 'print "番号を選んでください"+chr$(13)
24280 'if lang_flag=0 then
24290 'print "言語設定:日本語"+chr$(13)
24300 'else
24310 'print "言語設定:英 語"+chr$(13)
24320 Change_Language:
24330 if lang_flag = 1 then
24340 cls
24350 print "It has changed Language"+chr$(13)
24360 color rgb(255,255,255)
24370 print "Select the Number"+chr$(13)
24380 print " :1.English → Japanse"+chr$(13)
24390 print " :2.It goes to TopScreen"+chr$(13)
24400 print "Language:In English" +chr$(13)
24410 else
24420 cls:color rgb(255,255,255)
24430 print "設定変更(言語の変更)" + chr$(13)
24440 color rgb(255,255,255)
24450 print chr$(13)
24460 print "番号を選んでください"+chr$(13)
24470 print " :1.日本語 → 英語に変更" + chr$(13)
24480 print " :2.トップ画面に戻る" + chr$(13)
24490 print chr$(13)
24500 print "設定言語:日本語" + chr$(13)
24510 endif
24520 color rgb(0,0,0)
24530 locate 0,15:print "                                       ":locate 0,15:print "2.トップ画面に戻る　を選択" + chr$(13)
24540 Setting_Language_key:
24550 y=0:key$="":bg=0
24560 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y<> -1 and bg<> 1)
24570 y=stick(1)
24580 key$=inkey$
24590 bg=strig(1)
24600 pause 2
24610 wend
24620 '選択肢変更
24630 if ((y=1) or (y=-1)) then
24640 select case No
24650 case 2:
24660 '実装部分　ここから
24670 pause 200:No=1:sp_on 0,1:sp_on 1,0:locate 0,15:print "                                                         ":locate 0,15:print "1.日本語 → 英語に変更を選択": goto Setting_Language_key:
24680 '実装部分　ここまで
24690 case 1:
24700 pause 200: No=2:sp_on 0,0:sp_on 1,1:locate 0,15:print "                                                       ":locate 0,15:print "2.トップ画面に戻る を選択":goto Setting_Language_key:
24710 end select
24720 endif
24730 'Enter Key  決定ボタン
24740 if ((key$=chr$(13)) or (bg=1)) then
24750 select case No
24760 case 2:
24770 sp_on 0,0:sp_on 1,0:goto TopScreen:
24780 case 1:                                                     'lang_flag=1:sp_on 0,0:sp_on 1,0:goto Change_Language:
24790 '
24800 '未実装　ここから
24810 sp_on 0,1:sp_on 1,0:ui_msg "この機能は未実装です":goto Setting_Language_key:
24820 '
24830 '未実装　ここまで
24840 end select
24850 endif
24860 '配列削除
24870 buffer_clear:
24880 erase bufline$
24890 erase bufcount$
24900 erase bufcount1$
24910 erase bufcount2$
24920 erase bufline2$
24930 erase bufline3$
24940 erase bufKaztama$
24950 erase List$
24960 erase Result_Menu_List$
24970 erase list$
24980 erase moji_List$
24990 'ui_msg "メモリーをクリアしました"
25000 return
25010 '配列削除　ここまで
25020 File_Device_Set:
25030 'Device 選択　書き込み
25040 open Device_type$  for output as #1
25050 print #1,device_No
25060 close #1
25070 ui_msg "ファイルを書き込みました"
25080 return
25090 Input_numbertokazutama:
25100 cls 3:gload Gazo$ + "Input_numbertokazutama.png",0,0,0:init "kb:2"
25110 color rgb(255,255,255):locate 1,4:print "調べたい数霊の番号を入れてください"+chr$(13);"(Max:181)"
25120 color rgb(0,0,0):locate 1,7:Input "番号:",num
25130 if (num > 181) then ui_msg"181までの数字で入れ直してください":goto Input_numbertokazutama:
25140 for i=0 to 181+3-1
25150 if i = num then
25160 buffer$ = bufline2$(i+4,1)
25170 endif
25180 next i
25190 goto Numbertokazutama:
25200 '
25210 '
25220 Numbertokazutama:
25230 cls 3:init "kb:4":gload Gazo$+"Result_numbertokazutama.png",0,0,0:bg=0:key$=""
25240 font 32+16:color rgb(255,255,255)
25250 locate 1,3:print "◎数霊番号:";num;chr$(13)
25260 locate 1,4:print "◎数霊の説明"+chr$(13)
25270 if ((len(buffer$) > 21) and (len(buffer$) <= 45)) then
25280 buffer2$ = Mid$(buffer$,1,20)
25290 buffer3$ = Mid$(buffer$,21,len(buffer$)-20)
25300 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13)
25310 else
25320 if (len(buffer$) < 22) then
25330 buffer2$ = Mid$(buffer$,1,21)
25340 buffer$ = buffer2$ + chr$(13)
25350 else
25360 if ((Len(buffer$) > 45) and (len(buffer$) < 66)) then
25370 buffer2$ = Mid$(buffer$,1,20)
25380 buffer3$ = Mid$(buffer$,20,21)
25390 buffer4$ = Mid$(buffer$,41,len(buffer$)-41)
25400 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13)
25410 endif
25420 endif
25430 endif
25440 locate 1,5:print buffer$
25450 color rgb(0,0,0)
25460 locate 1,14:print "ジョイパッドの右を押してください"+chr$(13)
25470 while (bg <> 2 and key$ <> chr$(13))
25480 bg=strig(1)
25490 key$=inkey$
25500 pause 2
25510 wend
25520 if ((bg = 2) or (key$ = chr$(13))) then
25530 goto TopScreen:
25540 endif
25550 data_initialize:
25560 cls 3
25570 select case device_No
25580 case 1:
25590 gload Gazo$ + "Data_initializeScreen.png",0,0,0
25600 gload Gazo$ + "downscreen.png",0,0,800
25610 case 2:
25620 gload Gazo$ + "Data_initializeScreen.png",0,0,0
25630 end select
25640 color rgb(255,255,255):font 48:init "kb:4":No=1:sp_on 1,1:sp_put 1,(5,300),0,0
25650 locate 0,4:print "番号を選んでください"+chr$(13)
25660 print " :1.メンバーリストの初期化" + chr$(13)
25670 print " :2.デバイスの初期化" + chr$(13)
25680 print " :3.トップ画面に行く"+chr$(13)
25690 locate 0,15:color rgb(0,0,0):print "1.データーの初期化を選択"
25700 data_initialize2:
25710 y = 0:key$ = "":bg = 0
25720 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
25730 y = stick(1)
25740 key$ = inkey$
25750 bg = strig(1)
25760 pause 2
25770 wend
25780 'y=-1:ジョイパッドの上
25790 'y=1:ジョイパッド下
25800 'key$=chr$(13):Enter key
25810 'key$=chr$(30):カーソル上
25820 'key$=chr$(31):カーソル下
25830 if ((y = -1) or (key$=chr$(30))) then
25840 select case No
25850 case 1:
25860  sp_on 1,0:sp_on 2,0:sp_on 0,1:sp_on 3,0:No=0:sp_put 0,(5,500),0,0:locate 0,15:print "                                       ":locate 0,15:print "3.トップ画面に行くを選択":pause 200:goto data_initialize2:
25870 case 2:
25880 sp_on 1,1:sp_on 2,0:sp_on 0,0:sp_on 3,0:No=1:sp_put 1,(5,300),0,0:locate 0,15:print "                                      ":pause 200:locate 0,15:print "1.メンバーリストの初期化を選択":goto data_initialize2:
25890 case 0:
25900 sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_on 0,0:sp_put 2,(5,400),0,0:locate 0,15:print "                                      ":pause 200:locate 0,15:print "2.デバイスの初期化を選択"+chr$(13):No=2:goto data_initialize2:
25910 end select
25920 endif
25930 'bg=2:Enter key
25940 if ((bg=2) or (key$=chr$(13))) then
25950 select case No
25960 case 0:
25970 sp_on 0,0:sp_on 1,0:sp_on 2,0:pause 200:goto TopScreen:
25980 case 1:
25990 'メンバーリストの初期化トップへ行く
26000 sp_on 0,0:sp_on 1,0:sp_on 2,0:pause 200:goto member_initializeTop:
26010 case 2:
26020 ui_msg "未実装です":goto data_initialize2:
26030 end select
26040 endif
26050 'カーソルの下　または、ジョイパッド下
26060 if ((y = 1) or (key$ = chr$(31))) then
26070 select case No
26080 case 1:
26090 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                          ":locate 0,15:print "2.デバイスの初期化を選択":goto data_initialize2:
26100 case 2:
26110 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:No=0:locate 0,15:print "                                                          ":locate 0,15:print "3.トップ画面に行くを選択":goto data_initialize2:
26120 case 0:
26130 sp_on 0,0:sp_on 1,1:sp_on 2,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                                          ":locate 0,15:print "1.メンバーリストの初期化を選択":goto data_initialize2:
26140 end select
26150 endif
26160 'メンバーリストの初期化トップ
26170 member_initializeTop:
26180 cls 3
26190 gload Gazo$ + "member_initializeTop.png"
26200 No=0:init "kb:4":color rgb(255,255,255):font 48
26210 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,500),0,0
26220 locate 0,4:print  "番号を選んでください"+chr$(13)
26230 print " :1.メンバーリストを初期化する" + chr$(13)
26240 print " :2.バックアップを取る" + chr$(13)
26250 print " :3.トップ画面に戻る"+chr$(13)
26260 color rgb(0,0,0):locate 0,15:print "                                       ":locate 0,15:print "3.トップ画面に戻るを選択"+chr$(13)
26270 member_list2:
26280 y=0:key$="":bg=0
26290 while (key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
26300 y=stick(1)
26310 key$ = inkey$
26320 bg = strig(1)
26330 pause 2
26340 wend
26350 'bg=2,chr$(13):決定ボタン
26360 if ((bg=2) or (key$=chr$(13)))  then
26370 select case No
26380 case 1:
26390 ui_msg"未実装です。":goto member_list2:
26400 case 2:
26410 ui_msg"未実装です":goto member_list2:
26420 case 0:
26430 '3:トップ画面に戻る
26440 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
26450 end select
26460 endif
26470 'y=1:chr$(31):ジョイパッド　下　又は　カーソルの下
26480 if ((y=1) or (key$=chr$(31))) then
26490 select case No
26500 case 0:
26510 sp_on 1,1:sp_on 2,0:sp_on 0,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print "1.メンバーリストの初期化を選択":goto member_list2:
26520 case 1:
26530 sp_on 0,0:sp_on 2,1:sp_on 1,0:No=2:sp_put 2,(5,400),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print "2.バックアップを取るを選択":goto member_list2:
26540 case 2:
26550 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:locate 0,15:print "                                       ":locate 0,15:print "3.トップ画面に行くを選択":goto member_list2:
26560 end select
26570 endif
26580 'Joypad  or カーソル　上
26590 if ((y=-1) or (key$=chr$(30))) then
26600 select case No
26610 case 0:
26620 sp_on 2,1:sp_on 1,0:sp_on 0,0:No=2:sp_put 2,(5,400),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print "2.バックアップを取るを選択":goto member_list2:
26630 case 1:
26640 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print "3.トップ画面に行くを選択":goto member_list2:
26650 case 2:
26660 sp_on 0,0:sp_on 1,1:sp_on 2,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print "1.メンバーリストの初期化を選択":goto member_list2:
26670 end select
26680 endif
