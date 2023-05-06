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
640 '現在のバージョン
650 Version$ = "1.4.4_2023.05.07(正式版)"
660 'csvファイル 1.数霊 ベースファイル
670 FILE_csv$ = "./data/Kazutama.csv"
680 'csvファイル 2.数霊 ベースファイル 2
690 FILE_csv2$ = "./data/Surei_chart_20211207.csv"
700 'Save ファイル
710 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
720 'gazo ファイル
730 Gazo$ = "./data/Gazo/"
740 'System フォルダ:設定ファイルを保存するところ
750 System$ = "./data/System/config.sys"
760 'Device type:デバイスタイプのファイルチェック
770 Device_type$ = "./data/device_type.sys"
780 '設定ファイル名:config.sys
790 'Sound File(Voice)
800 '1.ボイス TopScreen
810 Voice_File_TopScreen$ = "./data/Sound_data/"
820 'Message
830 buf_finish_Message$ = "メモリーを解放してプログラムを終了します"
840 '変数領域
850 'vcount:バーチャルパッド下の変数
860 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+6,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
870 count2 = 0:N=0:N2=0:m2 = 0:device_No=0:device_type=0
880 dim list$(4),moji_List$(2)
890 'ファイルの有無チェック
900 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
910 '1.ファイルが無いとき
920 cls :print "依存ファイルが見つかりません":
930 print "エンターキーを押してください" + chr$(13)
940 key$ = input$(1)
950 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
960 else
970 '2.ファイルが有るとき
980 cls:print "csv:file ok." + chr$(13)
990 n=0
1000 'FILE_csv$:数霊データー入力
1010 open FILE_csv$ for input as #1
1020 while eof(1) = 0
1030 input #1,line$
1040 bufline$(n) = line$
1050 'Print n;chr$(13)
1060 '登録件数カウント:n
1070 n = n + 1
1080 wend
1090 close #1
1100 N=n
1110 '2つ目のファイル読み込み
1120 'n = 0
1130 open FILE_csv2$ for input as #2
1140 for n=3 to 181+2+2
1150 for i=0 to 1
1160 input #2,line$
1170 bufline2$(n,i) = line$
1180 next i
1190 next n
1200 close #2
1210 N2 = n
1220 endif
1230 '2022.11.23----------------------
1240 '端末言語のチェック
1250 '日本語端末かチェックをして日本語以外なら英語で表示する
1260 'lang flag:0:日本語 1:英語(日本語以外)
1270 '--------------------------------
1280 lang_flag = 0
1290 if ex_info$(1) <> "JP" then
1300 lang_flag = 1
1310 endif
1320 cls 3:font 48:screen 1,1,1,1:int "kb:4":init "crt:0"
1330 play ""
1340 'gload Gazo$ + "TopScreen_20230310.png",0,0,0
1350 '選択ポインター 1 - 4
1360 'スプライトの定義
1370 gload Gazo$ + "Selection.png",1,5,300
1380 gload Gazo$ + "Selection.png",1,5,400
1390 gload Gazo$ + "Selection.png",1,5,500
1400 gload Gazo$ + "Selection.png",1,5,595
1410 sp_def 0,(5,300),32,32
1420 sp_def 1,(5,400),32,32
1430 sp_def 2,(5,500),32,32
1440 sp_def 3,(5,595),32,32
1450 'File check
1460 '初回起動はここから
1470 if (dir$(Device_type$) = "") then
1480 goto Device_Select:
1490 else
1500 '
1510 '2回目以降はファイルチェックをしてトップ画面
1520 '
1530  open Device_type$ for input as #1
1540  line input #1,device_type$
1550  device_No = val(device_type$)
1560  close #1
1570  if (device_No=1 or device_No=2) then
1580  goto TopScreen:
1590  endif
1600 endif
1610 'First_Select_Screen:
1620 'タブレット　or　スマホの選択を起動時にする
1630 Device_Select:
1640 font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
1650 gload Gazo$ + "device_select_20230313.png",0,0,0
1660 init "kb:4"
1670 play ""
1680 play Voice_File_TopScreen$+"Select_device_select.mp3"
1690 'y=0:key$="":bg=0
1700 print chr$(13)+chr$(13)+chr$(13)
1710 color  rgb(255,255,255)
1720 print "番号を選んでください"+chr$(13)
1730 'print chr$(13)
1740 print " :1.スマートフォン"+chr$(13)
1750 print " :2.タブレット端末"+chr$(13)
1760 locate 0,11:No=1
1770 color rgb(0,0,0)
1780 Print " 1.スマートフォンを選択"+chr$(13)
1790 sp_on 0,1:sp_put 0,(5,300),0,0
1800 sp_on 1,0:sp_on 2,0:sp_on 3,0
1810 device_selection:
1820 y=0:key$="":bg=0:
1830 While (key$ <> chr$(30) and key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
1840 y = stick(1)
1850 key$ = inkey$
1860 bg = strig(1)
1870 pause 2
1880 wend
1890 if ((y=1) or (y=-1) or (key$=chr$(30)) or (key$=chr$(31)) ) then
1900 select case No
1910 case 1:
1920       No=2:sp_on 1,1:sp_on 0,0:locate 0,11:pause 300:sp_put 1,(5,400),0,0:print "                                ":locate 0,11:print " 2.タブレット端末を選択":goto device_selection:
1930 case 2:
1940       No=1:sp_on 1,0:sp_on 0,1:pause 300:sp_put 0,(5,300),0,0:locate 0,11:print "                                   ":locate 0,11:print " 1.スマートフォンを選択":goto device_selection:
1950 end select
1960 endif
1970 '決定ボタン
1980 if ((bg=2) or (key$=chr$(13)))  then
1990 select case No
2000 case 1:
2010       sp_on 0,0:sp_on 1,0:device_No=1:gosub File_Device_Set:goto TopScreen:
2020 case 2:
2030       sp_on 0,0:sp_on 1,0:device_No=2:gosub File_Device_Set:goto TopScreen:
2040 end select
2050 endif
2060 'Top画面
2070 TopScreen:
2080 'バーチャルパッドを表示
2090 cls 3:font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
2100 'play ""
2110 play ""
2120 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
2130 'gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
2140 select case device_No
2150 case 1:
2160 'Top画面の背景画像
2170 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2180 gload Gazo$ + "downscreen.png",0,0,800
2190 case 2:
2200 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2210 end select
2220 'key$=input$(1)
2230 'バーチャルパッドの背景を白にする for smartphone screen
2240 'gload Gazo$ + "downscreen.png",0,0,800
2250 '選択肢 1
2260 gload Gazo$ + "Selection.png",1,5,300
2270 '選択肢 2
2280 gload Gazo$ + "Selection.png",1,5,400
2290 '選択肢 3
2300 gload Gazo$ + "Selection.png",1,5,500
2310 '選択肢 4
2320 'TopScreen:
2330 'select case device_No
2340 'case 1:
2350 gload Gazo$ + "Selection.png",1,5,590
2360 'case 2:
2370 'gload Gazo$ +
2380 'end select
2390 color rgb(0,0,255)
2400 print chr$(13)
2410 if lang_flag = 1 then
2420 color rgb(255,255,255)
2430 print "Select Number" + chr$(13)
2440 print " :1.Kazutama check" + chr$(13)
2450 print " :2.Setting" + chr$(13)
2460 print " :3.Help" + chr$(13)
2470 print " :4.End Program" + chr$(13)
2480 color rgb(255,255,255)
2490 else
2500 color rgb(255,255,255)
2510 print chr$(13)
2520 sp_on 0,1:sp_put 0,(5,300),0,0
2530 print "番号を選んでください" + chr$(13)
2540 print " :1.数霊(かずたま)チェック" + chr$(13)
2550 print " :2.設定" + chr$(13)
2560 print " :3.ヘルプ" + chr$(13)
2570 print " :4.(プログラムを)終　了する" + chr$(13)
2580 color rgb(0,0,0)
2590 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
2600 'バーチャルパッドを表示
2610 No=1:
2620 'lang_flag:1 外国語,0:日本語
2630 if lang_flag = 1 then
2640 'lang_flag=1 英語
2650 locate 0,15:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
2660 else
2670 'lang_flag=0 日本語
2680 locate 0,15:color rgb(0,0,0):print " 1.数霊(かずたま)チェックを選択";chr$(13)
2690 endif
2700 endif
2710 'TopScreen sprite
2720 'スプライト
2730 '選択肢 1 On
2740 'sp_def 0,(5,300),32,32
2750 'sp_on 0,1
2760 'sp_put 0,(5,300),0,0
2770 '選択肢 2 Off
2780 sp_def 1,(5,400),32,32
2790 sp_on 1,0
2800 sp_put 1,(5,400),0,0
2810 '選択肢 3 Off
2820 sp_def 2,(5,500),32,32
2830 sp_on 2,0
2840 sp_put 2,(5,500),0,0
2850 '選択肢 4 Off
2860 sp_def 3,(5,600),32,32
2870 sp_on 3,0
2880 sp_put 3,(5,600),0,0
2890 color rgb(0,0,0)
2900 Main_Select:
2910 'y:バーチャルパッドの処理
2920 'key$:カーソルの処理
2930 y = 0:key$ = "":bg = 0
2940 while ((key$ <> chr$(31)) and (key$ <> chr$(13)) and (y <> 1) and (y <> -1) and (bg <> 2))
2950 y = stick(1)
2960 key$ = inkey$
2970 bg = strig(1)
2980 pause 2
2990 wend
3000 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
3010 '1.バーチャルパッドの処理
3020 'バーチャルパッド下を押した時
3030 if y = 1 then
3040 select case No
3050 'No の初期値：No=1
3060 case 1:
3070 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
3080 if lang_flag = 1 then
3090 'lang_flag=1 英語
3100 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3110 else
3120 'lang_flag=0 日本語
3130 locate 0,15:print " 2.設定を選択":goto Main_Select:
3140 endif
3150 'デバッグライン　ここから
3160 '0のとき
3170 'デバッグライン　ここまで
3180 'デバッグライン　ここから
3190 'バーチャルパッド　下
3200 case 2:
3210 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:
3220 print "                                         ":
3230 if lang_flag = 1 then
3240 color rgb(0,0,0):locate 0,15:
3250 print "3.It has selected Help":No=3:goto Main_Select:
3260 else
3270 color rgb(0,0,0):locate 0,15:print "                                                         ":locate 0,15:
3280 print " 3.ヘルプを選択":No=3:goto Main_Select:
3290 endif
3300 'デバッグライン　ここまで
3310 case 3:
3320 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                               "
3330 if lang_flag = 1 then
3340 locate 0,15:print "4.It has selected finish program":No=0:goto Main_Select:
3350 else
3360 locate 0,15:print "                                                         " :locate 0,15:print " 4.(プログラムを)終了するを選択":No=0:goto Main_Select:
3370 endif
3380 'デバッグライン　ここから
3390 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
3400 'デバッグライン　ここまで
3410 case 0:
3420 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1
3430 if lang_flag = 1 then
3440 'lang_flag=1:英語
3450 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3460 else
3470 'lang_flag=0:日本語
3480 locate 0,15:print "                                      ":locate 0,15:print " 1.数霊(かずたま)チェックを選択":goto Main_Select:
3490 endif
3500 'デバッグライン　ここから
3510 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
3520 'デバッグライン　ここまで
3530 end select
3540 endif
3550 'バーチャルパッド　上 ここから
3560 if (y = -1) then
3570 select case No
3580 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
3590 case 1:
3600 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                                          "
3610 'if lang_flag = 1 then
3620 'lang_flag=1 英語
3630 'locate 0,15:print "4.It has finished program":goto Main_Select:
3640 'else
3650 'lang_flag=0 日本語
3660 locate 0,15:print "                                                          ":
3670 locate 0,15:print " 4.(プログラムを)終了するを選択":goto Main_Select:
3680 'endif
3690 'endif
3700 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
3710 case 0:
3720 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":
3730 if lang_flag = 1 then
3740 '1:英語
3750 locate 0,15:print "3.It has selected Help":goto Main_Select:
3760 else
3770 '0:日本語
3780 locate 0,15:print "                                                                                        "
3790 locate 0,15:print " 3.ヘルプを選択":goto Main_Select:
3800 endif
3810 'No:3 3.Help→2.設定 No:2
3820 case 3:
3830 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      "
3840 if lang_flag = 1 then
3850 '1:英語
3860 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3870 else
3880 '0:日本語
3890 locate 0,15:print" 2.設定を選択":goto Main_Select:
3900 endif
3910 case 2:
3920 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":
3930 if lang_flag = 1 then
3940 'lang_flag 1 英語
3950 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3960 else
3970 'lang_flag 0 日本語
3980 locate 0,15:print" 1.数霊(かずたま)チェックを選択":goto Main_Select:
3990 endif
4000 end select
4010 endif
4020 if (bg = 2) then
4030 select case No
4040 '1.数霊チェックを選択  パッドの右キー(決定)
4050 case 1:
4060 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4070 '2.設定を選択  パッドの右キー(決定)
4080 case 2:
4090 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
4100 '3.ヘルプを選択 パッドの右(決定)
4110 case 3:
4120 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
4130 'プログラムの終了を選択(決定)
4140 case 0:
4150 cls 3:cls 4:gosub buffer_clear:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":ui_msg buf_finish_Message$:pause 4.080*1000:color rgb(255,255,255):end
4160 'if lang_flag = 1 then
4170 'lang_flag = 1 英語
4180 'else
4190 'lang_flag = 0 日本語
4200 'endif
4210 end select
4220 '4.終了するを選択  パッドの右
4230 endif
4240 'バーチャルパッド　上　ここまで
4250 '2.カーソルの処理
4260 'カーソル　下 chr$(31)
4270 if (key$ = chr$(31)) then
4280 select case (No)
4290 '4
4300 '0 選択肢4 => 選択肢1
4310 case 0:
4320 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "              ":color rgb(0,0,0):
4330 if lang_flag = 1 then
4340 'lang flag:1 英語
4350 else
4360 'lang flag:0 日本語
4370 color rgb(0,0,0):locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4380 endif
4390 '1 選択肢1 => 選択肢2
4400 case 1:
4410 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":
4420 if lang_flag = 1 then
4430 'lang_flag:1 英語
4440 else
4450 'lang_flag:0 日本語
4460 color rgb(0,0,0):locate 0,15:print "2.設定を選択":beep:goto Main_Select:
4470 endif
4480 '2 選択肢2 => 選択肢3
4490 case 2:
4500 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,15:print "               ":
4510 if lang_flag = 1 then
4520 'lang flag:1 英語
4530 else
4540 'lang flang:0 日本語
4550 color rgb(0,0,0):locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4560 endif
4570 '3 選択肢３ => 選択肢4
4580 case 3:
4590 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,595),0,0:locate 0,15:print "               ":color rgb(0,0,0)
4600 if lang_flag = 1 then
4610 'lang_flag = 1 英語
4620 else
4630 'lang_flag = 0 日本語
4640 color rgb(0,0,0):locate 0,15:print "4.終 了を選択":goto Main_Select:
4650 endif
4660 case else:
4670 goto Main_Select:
4680 end select
4690 endif
4700 'カーソル　上
4710 if (key$=chr$(30)) then
4720 select case (No)
4730 '選択肢1 => 選択肢4
4740 case 1:
4750 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:PRINT "                      ":
4760 if lang_flag = 1 then
4770 'lang_flag=1:英語
4780 'print "1.It has selected Kazutama check":goto Main_Select:
4790 else
4800 'lang_flag = 0:日本語
4810 else
4820 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4830 endif
4840 '選択肢2 => 選択肢1
4850 case 2:
4860 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                 ":locate 1,15:print "2.設 定を選択":goto Main_Select:
4870 '選択肢3　=> 選択肢2
4880 case 3:
4890 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,500),0,0
4900 if lang_flag = 1 then
4910 'lang_flag = 1:英語
4920 locate 0,15:print "It has selected Help":goto Main_Select:
4930 else
4940 'lang_flag = 0:日本語
4950 locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4960 endif
4970 '選択肢4 => 選択肢3
4980 case 0:
4990 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                ":locate 1,15:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
5000 if lang_flag = 1 then
5010 'lang flag=1 英語
5020 else
5030 'lang flag=0 日本語
5040 locate 1,15:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
5050 endif
5060 end select
5070 endif
5080 'Input "番号:",No
5090 'エンターキー入力:決定
5100 if (key$ = chr$(13)) then
5110 select case No
5120 case 1:
5130 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
5140 case 3:
5150 Color rgb(255,255,255):goto Help:
5160 case 0:
5170 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg buf_finish_Message$:color rgb(255,255,255):pause 4.080 * 1000:end
5180 case 2:
5190 color rgb(255,255,255):sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
5200 end select
5210 endif
5220 '1-1.数霊チェック
5230 Surei_Check:
5240 cls 3:Font 48:
5250 select case device_No
5260  case 1:
5270 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5280 gload Gazo$ + "downscreen.png",0,0,800
5290 case 2:
5300 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5310 end select
5320 play ""
5330 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
5340 color rgb(255,0,0)
5350 'print "●数霊(かずたま)チェックトップ" + chr$(13)
5360 sp_on 0,1:sp_put 0,(5,300),0,0:screen 1,1,1
5370 if lang_flag = 1 then
5380 'lang_flag=1 英語
5390 else
5400 'lang_flag=0 日本語
5410 print chr$(13)+chr$(13)+chr$(13)
5420 color rgb(255,255,255)
5430 print "番号を選んでください" + chr$(13)
5440 print " :1.数霊(かずたま)1人用" + chr$(13)
5450 print " :2.数霊(かずたま)リスト 1人用　" + chr$(13)
5460 print " :3.数霊(かずたま)2人用" + chr$(13)
5470 print " :4.トップ画面に行く" + chr$(13)
5480 color rgb(0,0,0):No = 1
5490 locate 0,15:print "                                       "
5500 locate 0,15
5510 print " 1.数霊(かずたま)1人用を選択"
5520 endif
5530 Kazutama_main:
5540 'y:バーチャルパッドの処理
5550 'key$:カーソルの処理
5560 'bg:バーチャルパッドの右のボタン
5570 y = 0:key$ = "":bg=0
5580 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
5590 y = stick(1)
5600 key$ = inkey$
5610 bg=strig(1)
5620 y=stick(-1)
5630 pause 2
5640 wend
5650 'key$ = input$(1)
5660 if (y = 1) then
5670 select case No
5680 'No の初期値：No=1
5690 case 2:
5700 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                       ":
5710 locate 0,15:print "                                     "
5720 locate 0,15
5730 print" 3.数霊(かずたま)2人用を選択":goto Kazutama_main:
5740 'デバッグライン　ここから
5750 '0のとき
5760 'デバッグライン　ここまで
5770 'デバッグライン　ここから
5780 case 3:
5790 sp_on 2,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_on 0,1:sp_put 0,(5,585),0,0:pause 200:locate 0,15:print "                                               "
5800 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":No=0:goto Kazutama_main:
5810 'デバッグライン　ここまで
5820 'デバッグライン　ここから
5830 'デバッグライン　ここまで
5840 case 0:
5850 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5860 case 1:
5870 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                          ":locate 0,15:print " 2.数霊（かずたま）リスト 1人用":goto Kazutama_main:
5880 'デバッグライン　ここから
5890 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
5900 'デバッグライン　ここまで
5910 end select
5920 endif
5930 'バーチャルパッド　上 ここから
5940 if (y = -1) then
5950 select case No
5960 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
5970 case 1:
5980 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 0,15:print" 4.トップ画面に行くを選択":goto Kazutama_main:
5990 'No:3 3.Help→2.設定 No:2
6000 case 0:
6010 sp_on 1,0:sp_on 0,0:sp_on 3,1:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                     ":locate 0,15:print" 3.数霊（かずたま）2人用を選択":goto Kazutama_main:
6020 case 2:
6030 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                    ":locate 0,15:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
6040 case 3:
6050 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                               ":locate 0,15:print " 2.数霊(かずたま)リスト1人用を選択":goto Kazutama_main:
6060 end select
6070 endif
6080 if (bg=2) then
6090 select case No
6100 '1.数霊チェックを選択  パッドの右キー
6110 case 1:
6120 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
6130 '2.数霊チェック2人用   パッドの右キー
6140 case 3:
6150 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
6160 '3.トップ画面に行く パッドの右
6170 case 0:
6180 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
6190 '2.数霊リスト1人用 パッドの右キー
6200 case 2:
6210 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_List1:
6220 'プログラムの終了を選択
6230 end select
6240 '4.終了するを選択  パッドの右
6250 endif
6260 'バーチャルパッド　上　ここまで
6270 if (key$ = chr$(31)) then
6280 select case No
6290 case 0:
6300 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,15:print "                                                          ":
6310 if lang_flag = 1 then
6320 Else
6330 locate 0,15:print "                                      "
6340 No=2:locate 0,15:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
6350 endif
6360 case 1:
6370 No=0:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,585),0,0:locate 0,12:print "                                                          ":
6380 if lang_flag = 1 then
6390 Else
6400 locate 0,15:print"                                      "
6410 locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
6420 endif
6430 case 2:
6440 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                      ":
6450 if lang_flag = 1 then
6460 Else
6470 No=1:locate 0,15:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
6480 endif
6490 end select
6500 endif
6510 if (key$=chr$(13)) then
6520 select case No
6530 case 1:
6540 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
6550 case 2:
6560 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
6570 case 3:
6580 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
6590 '終了はトップメニューのみにする
6600 end select
6610 endif
6620 '前の画面に戻る
6630 'プログラムの終了
6640 '1人用
6650 '2人用
6660 '数霊(かずたま) 文字入力  1人用
6670 Surei_Input:
6680 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
6690 if mode = 0 then
6700 cls 3:font 32:init"kb:2"
6710 select case device_No
6720 case 1:
6730 gload Gazo$ + "InputKotodama_20230131.png",0,0,0
6740 gload Gazo$ + "CenterScreen_20230401.png",0,0,380
6750 case 2:
6760 gload Gazo$ + "InputKotodama_20230131.png",0,0,0
6770 end select
6780 play""
6790 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
6800 color rgb(255,0,0)
6810 if lang_flag=1 then
6820 '英語
6830 else
6840 print chr$(13)+chr$(13)+chr$(13)
6850 color rgb(255,255,255)
6860 print "文字を入れてください" + chr$(13)
6870 color rgb(255,255,255)
6880 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
6890 print chr$(13)
6900 color rgb(0,0,0)
6910 Input "入力文字:",buffer_moji$
6920 if buffer_moji$ = "" then
6930 ui_msg "未入力です":goto Surei_Input:
6940 else
6950 goto Surei_Result:
6960 endif
6970 endif
6980 endif
6990 if mode = 1 then
7000 cls 3:Font 32:
7010 gload Gazo$ + "InputKotodama.png"
7020 color rgb(255,0,0)
7030 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
7040 color rgb(255,255,255)
7050 print "文字を入れてください" + chr$(13)
7060 color rgb(255,0,0)
7070 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
7080 print "大文字のみ)" + chr$(13)
7090 color rgb(0,0,0)
7100 Input "文字入力:",buffer_moji2$
7110 goto Surei_Result3:
7120 'endif
7130 endif
7140 '数霊(かずたま)文字入力　2人用
7150 Surei_twoParson:
7160 cls 3:Font 32:init"kb:2"
7170 gload Gazo$ + "InputKotodama_20230131.png"
7180 '1人目入力
7190 if lang_flag = 1 then
7200 else
7210 print ""+chr$(13)+chr$(13)+chr$(13)
7220 color rgb(255,255,255)
7230 print "1人目の文字を入れてください" + chr$(13)
7240 color rgb(255,255,255)
7250 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
7260 color rgb(0,0,0)
7270 print chr$(13)
7280 Input "1人目文字入力:",buf_Parson1$
7290 endif
7300 Surei_twoParson2:
7310 cls 3:Font 32:init"kb:2"
7320 '2人目入力
7330 gload Gazo$ + "InputKotodama_20230131.png"
7340 if lang_falg = 1 then
7350 else
7360 print ""+chr$(13)+chr$(13)+chr$(13)
7370 color rgb(255,255,255)
7380 print "2人目の文字を入れてください" + chr$(13)
7390 color rgb(255,255,255)
7400 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
7410 color rgb(0,0,0)
7420 Input "2人目の文字入力:",buf_Parson2$
7430 goto Surei_Result2:
7440 endif
7450 '数霊　計算 パート
7460 '文字の計算関数
7470 'moji$:1文字を入れる
7480 func Complate(moji$)
7490 for n = 1 to 116
7500 if moji$ = bufline$(2*n) then
7510 buffcount = val(bufline$(2 * n + 1))
7520 endif
7530 next n
7540 endfunc buffcount
7550 '数霊　結果表示
7560 Surei_Result:
7570 cls 3:Font 32
7580 'ゼロカウント:zcount
7590 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
7600 '例 アカい:"い"の文字は無効な文字なので、はじく
7610 zcount=0
7620 'mojicount:入力文字数
7630 mojicount = len(buffer_moji$)
7640 for n=1 to mojicount
7650 for j=1 to 118
7660 if (bufcount$(n - 1) = bufline$(2 * j)) then
7670 bufcount$(n-1) = Mid$(buffer_moji$,n,1)
7680 endif
7690 next j
7700 next n
7710 ncount=0:count=0
7720 for i = 1 to mojicount
7730 bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7740 'ンのカウント
7750 if (bufcount$(i-1) = "ン") then ncount = ncount + 1
7760 next i
7770 if (ncount > 0) then
7780 'Listを表示する
7790 moji_List$(0) = "この単語は目に見える物です"
7800 moji_List$(1) = "この単語は目に見えない物です"
7810 num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
7820 if (num2 = 0) then
7830 else
7840 if (num2 = 1) then
7850 n1 = 9 * ncount
7860 endif
7870 endif
7880 endif
7890 for j=1 to mojicount
7900 bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7910 count = count + Complate(bufcount$(j - 1))
7920 next j
7930 count = count + n1
7940 if (ncount > 0) then count = count
7950 '182以上のとき,181を引く
7960 if buf_cofig_r = 0 then
7970 if (count > 181) then
7980 count = count - 181
7990 else
8000 if (buf_config_r = 1) then
8010 buf_count = Single_Complate(count)
8020 endif
8030 endif
8040 endif
8050 cls 3:Font 48+16
8060 gload Gazo$ + "Result_Screen3_20230319.png"
8070 if buf_config_r = 1 then
8080 print "入力文字:" + buffer_moji$ + chr$(13)
8090 print "数霊(かずたま):";buf_count;chr$(13)
8100 endif
8110 if lang_flag = 1 then
8120 else
8130 color rgb(255,0,0)
8140 print "入力文字:" + buffer_moji$ + chr$(13)
8150 endif
8160 if lang_flag = 1 then
8170 else
8180 color rgb(0,0,255)
8190 print "数霊(かずたま):";count;chr$(13)
8200 endif
8210 if lang_flag = 1 then
8220 else
8230 color rgb(0,0,0)
8240 print "エンター or スペース" + chr$(13)
8250 print  chr$(13)
8260 'endif
8270 endif
8280 key$ = input$(1)
8290 if ((key$ = chr$(13)) or (key$=" ")) then
8300 List$(0)="1.もう一度数霊を見る"
8310 List$(1)="2.トップ画面に行く"
8320 List$(2)="3.この数霊の説明を見る"
8330 List$(3)="4.数霊データーを保存"
8340 num=ui_select("List$","番号を選んでください")
8350 select case num
8360 case 0:
8370 goto Surei_Input:
8380 case 1:
8390 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
8400 for i=0 to 9
8410 bufcount$(i)=""
8420 next i
8430 goto TopScreen:
8440 case 2:
8450 goto Surei_Result4:
8460 case 3:
8470 s=Surei_Result_Save_File()
8480 ui_msg "保存しました"
8490 case -1:
8500 'goto Surei_Result:
8510 case else:
8520 goto Surei_Result:
8530 end select
8540 'ファイルを保存する
8550 else
8560 goto Surei_Result:
8570 endif
8580 '3-1 バージョン情報
8590 Version:
8600 cls 3:Font 32
8610 select case device_No
8620 case 1:
8630 gload Gazo$ + "Screen1_Version.png"
8640 gload Gazo$ + "downscreen.png",0,0,800
8650 case 2:
8660 gload Gazo$ + "Screen1_version.png"
8670 end select
8680 play ""
8690 play Voice_File_TopScreen$ + "Voice_Version.mp3"
8700 color rgb(255,0,0)
8710 print chr$(13)
8720 color rgb(255,255,255)
8730 if lang_flag = 1 then
8740 else
8750 print chr$(13)+chr$(13)+chr$(13)
8760 print "Ver:";Version$ + chr$(13)
8770 print "アプリ名:数霊計算機" + chr$(13)
8780 print "Basic for Android Runtime" + chr$(13)
8790 print "Author:licksjp" + chr$(13)
8800 print "制作開始:2021.7.28" + chr$(13)
8810 print chr$(13)
8820 print "(C)Copy right licksjp " + chr$(13)
8830 print "All rights reserved" + chr$(13)
8840 print chr$(13)
8850 color rgb(0,0,0)
8860 print "パッドの右を押してください" + chr$(13)
8870 endif
8880 bg=0:key$=""
8890 while (bg <> 2 and key$ <> chr$(13))
8900 bg = strig(1)
8910 key$ = inkey$
8920 pause 2
8930 wend
8940 if key$ = chr$(13) then
8950 goto TopScreen:
8960 else
8970 if bg=2 then
8980 goto TopScreen:
8990 else
9000 if lang_flag = 1 then
9010 else
9020 talk "無効なキーです":goto Version:
9030 endif
9040 endif
9050 endif
9060 '3-2 参考文献
9070 Reference_Book:
9080 cls 3:Font 48:play""
9090 select case device_No
9100 case 1:
9110 gload Gazo$ + "Screen1_Reference.png"
9120 gload Gazo$ + "downscreen.png",0,0,800
9130 case 2:
9140 gload Gazo$ + "Screen1_Reference.png"
9150 end select
9160 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
9170 color rgb(255,0,0)
9180 print chr$(13)+chr$(13)
9190 if lang_flag = 1 then
9200 else
9210 color rgb(255,255,255)
9220 print "書名:数霊" + chr$(13)
9230 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
9240 print "出版社:徳間書店" + chr$(13)
9250 print "ISBN:978-4-19-" + chr$(13)
9260 print "         865309-5" + chr$(13)
9270 print "定価:2300円 + 税" + chr$(13)
9280 color rgb(0,0,0)
9290 print "パッドの右を押してください"
9300 endif
9310 bg = 0:key$ = ""
9320 while (bg <> 2 and key$ <> chr$(13))
9330 bg = strig(1)
9340 key$ = inkey$
9350 pause 2
9360 wend
9370 if key$ = chr$(13) then
9380 goto TopScreen:
9390 else
9400 if bg = 2 then
9410 goto TopScreen:
9420 else
9430 talk "無効なキーです":goto Reference_Book:
9440 endif
9450 endif
9460 'ヘルプ画面　トップ画面
9470 Help:
9480 No=1:c=0
9490 play ""
9500 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
9510 cls 3:Font 48:
9520 select case device_No
9530 case 1:
9540 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9550 gload Gazo$ + "downscreen.png",0,0,800
9560 case 2:
9570 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9580 end select
9590 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0
9600 color rgb(255,0,0)
9610 print chr$(13)+chr$(13)+chr$(13)
9620 color rgb(255,255,255)
9630 print "番号を選んでください" + chr$(13)
9640 print " :1.バージョン" + chr$(13)
9650 print " :2.参考文献" + chr$(13)
9660 print " :3.データーの初期化"+chr$(13)
9670 print " :4.トップ画面に行く" + chr$(13)
9680 color rgb(0,0,0)
9690 locate 0,15:print "                                     "
9700 if No = 1 then locate 0,15:print " 1.バージョンを選択"
9710 'y:バーチャルパッドの処理
9720 'key$:カーソルの処理
9730 'bg:バーチャルパッドの右ボタン
9740 Help_key:
9750 y = 0:key$ = "":bg = 0
9760 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
9770 y = stick(1)
9780 key$ = inkey$
9790 bg = strig(1)
9800 pause 2
9810 wend
9820 'バーチャルパッド　ここから'
9830 if (y = 1) then
9840 select case No
9850 'No の初期値：No=1
9860 case 1:
9870 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
9880 if lang_flag = 1 then
9890 else
9900 locate 0,15:print" 2.参考文献を選択":goto Help_key:
9910 endif
9920 'デバッグライン　ここから
9930 '0のとき
9940 'デバッグライン　ここまで
9950 'デバッグライン　ここから
9960 case 3:
9970 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:No=0:pause 200:locate 0,15:print "                                                          "
9980 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":goto Help_key:
9990 'デバッグライン　ここまで
10000 'デバッグライン　ここから
10010 'デバッグライン　ここまで
10020 case 2:
10030 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 0,15:print "                                                          ":color rgb(0,0,0):locate 0,15:print " 3.データーの初期化を選択":No=3:goto Help_key:
10040 case 0:
10050 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10060 'デバッグライン　ここから
10070 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
10080 'デバッグライン　ここまで
10090 end select
10100 endif
10110 'バーチャルパッド　上 ここから
10120 if (y = -1) then
10130 select case No
10140 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
10150 case 1:
10160 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                                           ":locate 0,15:print" 4.トップ画面に行くを選択":goto Help_key
10170 'No:3 3.Help→2.設定 No:2
10180 case 3:
10190 sp_on 1,0:sp_on 0,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                                          ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
10200 case 2:
10210 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                                          ":locate 0,15:print" 1.バージョンを選択":goto Help_key:
10220 case 0:
10230 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                                          ":locate 0,15:print" 3.データーの初期化を選択":goto Help_key:
10240 end select
10250 endif
10260 if (bg = 2) then
10270 select case No
10280 '1.数霊チェックを選択  パッドの右キー
10290 case 1:
10300 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
10310 '2.設定を選択    パッドの右キー
10320 case 2:
10330 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
10340 '3.データーの初期化
10350 case 3:
10360 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto data_initialize:
10370 '4.ヘルプを選択 パッドの右
10380 case 0:
10390 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
10400 'プログラムの終了を選択
10410 'if lang_flag = 1 then
10420 'lang_flag = 1:英語
10430 'Else
10440 'lang_flag = 0:日本語
10450 'endif
10460 end select
10470 '4.終了するを選択  パッドの右
10480 endif
10490 'バーチャルパッド　上　ここまで
10500 'バーチャルパッド　ここまで'
10510 'key$ = input$(1)
10520 'カーソルの下
10530 if key$ = chr$(31) then
10540 select case (No Mod 4)
10550 'バージョンから参考文献
10560 case 0:
10570 c=1:No=c:locate 0,15:Print "             ":locate 0,15:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
10580 '参考文献からトップ画面
10590 case 1:
10600 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "            ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10610 'トップ画面から終了
10620 '終了からバージョン
10630 case 2:
10640 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                     ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10650 case else:
10660 goto Help_key:
10670 end select
10680 endif
10690 'カーソル　上
10700 if (key$ = chr$(30)) then
10710 select case (c Mod 4)
10720 'バージョンから終了
10730 case 0:
10740 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:locate 0,15:print "                   ":locate 0,15:print " 4.終 了を選択":goto Help_key:
10750 '参考文献からバージョン
10760 case 1:
10770 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                   ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10780 'トップ画面から参考文献
10790 case 2:
10800 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":locate 0,15:print " 2.参考文献を選択":goto Help_key:
10810 '終了からトップ画面を選択
10820 case 3:
10830 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print"                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10840 case else:
10850 goto Help_key:
10860 end select
10870 endif
10880 'エンターキー：決定
10890 if (key$ = chr$(13)) then
10900 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10910 if No=0 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10920 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10930 else
10940 goto Help_key:
10950 endif
10960 '登録文字の確認
10970 '文字を1文字入れて登録されているか調べるメニュー
10980 '設定項目
10990 Setting:
11000 cls 3:Font 48
11010 select case device_No
11020 case 1:
11030 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
11040 gload Gazo$ + "downscreen.png",0,0,800
11050  case 2:
11060 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
11070 end select
11080 play ""
11090 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
11100 No=1
11110 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:
11120 color rgb(0,0,255)
11130 print chr$(13)
11140 if lang_flag = 1 then
11150 'lang_flag = 1:英語
11160 else
11170 'lang_flag = 0:日本語
11180 color rgb(255,255,255)
11190 print chr$(13)
11200 print "番号を選んでください" + chr$(13)
11210 '-------コメント----------------
11220 'print " :1.登録文字の確認" + chr$(13)
11230 'print " :2.数霊文字確認" + chr$(13)
11240 '-------コメント----------------
11250 'print chr$(13)
11260 print " :1.文字の項目" + chr$(13)
11270 print " :2.結果表示設定" + chr$(13)
11280 print " :3.言語設定" + chr$(13)
11290 print " :4.トップ画面に行く" + chr$(13)
11300 endif
11310 color rgb(0,0,0)
11320 locate 0,15
11330 if No=1 then locate 0,15:print  "                                     ":locate 0,15:print " 1.文字の項目を選択"
11340 'y:バーチャルパッドの処理
11350 'key$:カーソルの処理
11360 'bg:バーチャルパッドの右ボタン
11370 SettingScreen:
11380 y = 0:key$ = "":bg=0
11390 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
11400 y = stick(1)
11410 key$ = inkey$
11420 bg=strig(1)
11430 pause 2
11440 wend
11450 'バーチャルパッド　ここから'
11460 'バーチャルパッド　ここから'
11470 if (y = 1) then
11480 select case No
11490 'No の初期値：No=1
11500 case 1:
11510 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":color rgb(0,0,0):locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11520 'デバッグライン　ここから
11530 '0のとき
11540 'デバッグライン　ここまで
11550 'デバッグライン　ここから
11560 case 2:
11570 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                         "
11580 color rgb(0,0,0)::No=3
11590 if lang_flag = 1 then
11600 else
11610 locate 1,15:print "3.言語設定を選択":goto SettingScreen:
11620 endif
11630 'デバッグライン　ここまで
11640 case 3:
11650 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                              ":locate 1,15:print "4.トップ画面に行くを選択":No=0:goto SettingScreen:
11660 'デバッグライン　ここから
11670 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11680 'デバッグライン　ここまで
11690 case 0:
11700 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
11710 'デバッグライン　ここから
11720 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11730 'デバッグライン　ここまで
11740 end select
11750 endif
11760 'バーチャルパッド　上 ここから
11770 if (y = -1) then
11780 select case No
11790 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11800 case 1:
11810 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 1,15:print"4.トップ画面に行くを選択":goto SettingScreen:
11820 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11830 case 0:
11840 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 1,15:print"3.言語設定を選択":goto SettingScreen:
11850 'No:3 3.Help→2.設定 No:2
11860 case 3:
11870 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.結果表示設定を選択":goto SettingScreen:
11880 case 2:
11890 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 1,15:print"1.文字の項目を選択":goto SettingScreen:
11900 end select
11910 endif
11920 if (bg=2) then
11930 select case No
11940 '1.数霊チェックを選択  パッドの右キー
11950 case 1:
11960 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
11970 '2.設定を選択    パッドの右キー
11980 case 2:
11990 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
12000 '3.ヘルプを選択 パッドの右
12010 case 0:
12020 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
12030 'プログラムの終了を選択
12040 case 3:
12050 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Setting_Language:
12060 end select
12070 endif
12080 '4.終了するを選択  パッドの右
12090 'バーチャルパッド　ここまで'
12100 'カーソル下'
12110 if (key$ = chr$(31)) then
12120 select case (No Mod 4)
12130 '登録文字から数霊文字の確認
12140 case 1:
12150 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                     ":locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
12160 '数霊文字の確認からトップ画面に行く
12170 case 2:
12180 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "                                     ":locate 1,15:print"3.言語設定を選択":goto SettingScreen:
12190 'トップ画面に行くから終了
12200 case 3:
12210 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,590),0,0:locate 0,15:print "                                       ":locate 1,15:print "4.トップ画面に行くを選択":goto SettingScreen:
12220 '終了から登録文字
12230 case 0:
12240 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
12250 end select
12260 endif
12270 'カーソル　上
12280 if (key$ = chr$(30)) then
12290 select case (No Mod 4)
12300 case 1:
12310 c=2:No=c:sp_on 0,1:sp_put 0,(5,300),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
12320 case 2:
12330 c=3:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
12340 case 3:
12350 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:goto SettingScreen:
12360 case 0:
12370 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,590),0,0:sp_on 0,0:goto SettingScreen:
12380 end select
12390 endif
12400 'エンターキーを押したとき
12410 if (key$ = chr$(13)) then
12420 if (No=3) then goto Setting_Language:
12430 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
12440 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
12450 if (No=0) then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
12460 endif
12470 '文字検索項目  ここから
12480 Moji_Search:
12490 cls 4:cls 3:Font 32+16:init"kb:2"
12500 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12510 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12520 play ""
12530 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
12540 print "" + chr$(13)
12550 color rgb(255,255,255)
12560 if lang_flag = 1 then
12570 Else
12580 print "文字を一文字入れてください" + chr$(13)
12590 endif
12600 color rgb(0,0,0)
12610 if lang_flag=1 then
12620 Else
12630 Input "登録文字:",moji$
12640 endif
12650 moji_count = len(moji$)
12660 if moji_count > 1 then
12670 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Moji_Search:
12680 else
12690 count=0
12700 for n = 0 to 116
12710 if bufline$(2*n) = moji$ then
12720 cls 3:font 48:init"kb:4"
12730 select case device_No
12740 case 1:
12750 gload Gazo$ + "downscreen.png",0,0,800
12760 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12770 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12780 case 2:
12790 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12800 end select
12810 play ""
12820 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12830 if lang_flag = 1 then
12840 Else
12850 print chr$(13)
12860 color rgb(255,255,255)
12870 print moji$;"は、登録されています。" + chr$(13)
12880 color rgb(0,0,0)
12890 print "ジョイパッドの右を押してください"
12900 endif
12910 bg = 0:key$ = ""
12920 while (bg <> 1 and key$ <> chr$(13))
12930 key$ = inkey$
12940 bg = strig(1)
12950 pause 2
12960 wend
12970 if key$ = chr$(13) then goto TopScreen:
12980 if bg=1 then goto TopScreen:
12990 count = count + 1
13000 endif
13010 next n
13020 if count = 0 then
13030 cls 3:font 48:init "kb:4"
13040 gload Gazo$ + "Moji_check.png"
13050 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
13060 play ""
13070 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
13080 print chr$(13)
13090 if lang_flag = 1 then
13100 Else
13110 color rgb(255,255,255)
13120 print moji$;"は、登録されていません。" + chr$(13)
13130 color rgb(0,0,0)
13140 print "パッドの右を押してください" + chr$(13)
13150 endif
13160 bg = 0:key$ = ""
13170 while (kg <> 1 and key$ <> chr$(13))
13180 key$ = inkey$
13190 bg = strig(1)
13200 pause 2
13210 wend
13220 if ((key$ = chr$(13)) or (bg=2)) then goto TopScreen:
13230 endif
13240 endif
13250 Surei_Result2:
13260 cls 3:Font 48
13270 zcount1=0:zcount2=0:count1=0:count2=0
13280 '1人目
13290 mojicount1=len(buf_Parson1$)
13300 '2人目
13310 mojicount2 = len(buf_Parson2$)
13320 '1人目
13330 for n = 1 to mojicount1
13340 for j = 1 to 116
13350 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
13360 if bufcount1$(n-1) = bufline$(2*j) then
13370 zcount1 = zcount1 + 1
13380 endif
13390 next j
13400 next n
13410 '2人目
13420 for n = 1 to mojicount2
13430 for j = 1 to 116
13440 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
13450 if bufcount2$(n-1) = bufline$(2*j) then
13460 zount2 = zcount2 + 1
13470 endif
13480 next j
13490 next n
13500 '1人目
13510 for i=1 to mojicount1
13520 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
13530 p1 = Complate(bufcount1$(i-1))
13540 count1 = count1 + p1
13550 next i
13560 '2人目
13570 for i = 1 to mojicount2
13580 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
13590 p2 = Complate(bufcount2$(i-1))
13600 count2 = count2 + p2
13610 next i
13620 cls 3:
13630 select case device_No
13640 case 1:
13650 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
13660 gload Gazo$ + "downscreen.png",0,0,800
13670 case 2:
13680 gload Gazo$ + "downscreen.png",0,0,0
13690 end select
13700 color rgb(255,0,0)
13710 print ""+chr$(13)
13720 if lang_flag = 1 then
13730 else
13740 color rgb(255,255,255)
13750 print chr$(13)+chr$(13)
13760 print "1人目:";buf_Parson1$;chr$(13)
13770 print "数霊1:";count1;chr$(13)
13780 print "2人目:";buf_Parson2$;chr$(13)
13790 print "数霊2:";count2;chr$(13)
13800 print "数霊(合計):";count1 + count2;chr$(13)
13810 color rgb(0,0,0)
13820 print "バーチャルパッドの右" + chr$(13)
13830 endif
13840 key$ = "":bg = 0
13850 while (bg <> 2 and key$ <> chr$(13))
13860 bg = strig(1)
13870 key$ = inkey$
13880 pause 2
13890 wend
13900 if (bg = 2 or key$ = chr$(13))  then goto TopScreen:
13910 Surei_Result3:
13920 cls 3:Font 48
13930 zcount2 = 0:count2 = 0
13940 mojicount2 = len(buffer_moji2$)
13950 for n = 1 to mojicount2
13960 for j = 1 to 116
13970 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
13980 if bufcount2$(n - 1) = bufline$(2 * j) then
13990 zcount2 = zcount2 + 1
14000 endif
14010 next j
14020 next n
14030 for i = 1 to mojicount2
14040 n2 = Complate(bufcount2$(i-1))
14050 count2 = count2 + n2
14060 next i
14070 gload Gazo$ + "Screen5.png"
14080 if lang_flag = 1 then
14090 else
14100 color rgb(255,0,0)
14110 print "数霊の結果表示" + chr$(13)
14120 color rgb(255,255,255)
14130 print "１回目回の文字入力:";buffer_moji$;chr$(13)
14140 print "１回目の数霊(かずたま)";count;chr$(13)
14150 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
14160 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
14170 color rgb(0,0,0)
14180 print "エンターキー:トップ画面";chr$(13)
14190 print "c or C キー:数霊の比較";chr$(13)
14200 endif
14210 key$ = "":bg = 0
14220 while (key$ <> chr$(13) and bg <> 2)
14230 bg = strig(1)
14240 key$ = inkey$
14250 pause 2
14260 wend
14270 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
14280 if key$ = "c" or key$ = "C" then
14290 if count = count2 then
14300 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
14310 else
14320 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
14330 endif
14340 endif
14350 Moji_Count_Check:
14360 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
14370 cls 3:Font 48
14380 select case device_No
14390 case 1:
14400 gload Gazo$ + "Moji_check.png"
14410 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
14420 gload Gazo$ + "downscreen.png",0,0,800
14430 case 2:
14440 gload Gazo$ + "Moji_check.png",0,0,0
14450 end select
14460 n = 0
14470 open FILE_csv$ for input as #1
14480 while eof(1) = 0
14490 line input #1, line$
14500 n = n + 1
14510 wend
14520 close #1
14530 play ""
14540 if (n = 118) then
14550 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
14560 if lang_flag = 1 then
14570 else
14580 print "" + chr$(13)
14590 color rgb(255,255,255)
14600 print "文字の登録文字数は";n;"文字" + chr$(13)
14610 color rgb(0,0,0)
14620 print "パッドの右を押してください" + chr$(13)
14630 endif
14640 endif
14650 key$ = "":bg = 0
14660 while ((key$ <> chr$(13)) and (bg <> 2))
14670 key$=inkey$
14680 bg=strig(1)
14690 pause 2
14700 wend
14710 if ((bg = 2) or (key$=chr$(13))) then
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
14890 gload Gazo$ + "downscreen.png",0,0,800
14900 case 2:
14910 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
14920 end select
14930 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
14940 color rgb(255,0,0)
14950 if lang_flag = 1 then
14960 else
14970 play ""
14980 play Voice_File_TopScreen$ + "Voice_Select_Moji20230217.mp3"
14990 print chr$(13)+chr$(13)+chr$(13)
15000 color rgb(255,255,255)
15010 print "番号を選んでください" + chr$(13)
15020 print " :1.登録文字検索"+ chr$(13)
15030 print " :2.登録文字数の確認" + chr$(13)
15040 print " :3.数字から数霊の説明"+chr$(13)
15050 print " :4.トップ画面に戻る" + chr$(13)
15060 color rgb(0,0,0)
15070 locate 0,15
15080 if No = 1 then print " 1.登録文字検索を選択"
15090 endif
15100 Entry_check_key:
15110 y = 0:key$ = "":bg=0
15120 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
15130 y = stick(1)
15140 key$ = inkey$
15150 bg=strig(1)
15160 pause 2
15170 wend
15180 'バーチャルパッド　ここから'
15190 'バーチャルパッド　ここから'
15200 if y = 1 then
15210 select case No
15220 'No の初期値：No=1
15230 case 1:
15240 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print "2.登録文字数の確認を選択":goto Entry_check_key:
15250 'デバッグライン　ここから
15260 '0のとき
15270 'デバッグライン　ここまで
15280 'デバッグライン　ここから
15290 case 2:
15300       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 0,15:print "                                                         ":No=3:locate 0,15:print" 3.数字から数霊の説明を選択":goto Entry_check_key:
15310 case 3:
15320 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:locate 0,15:print "                                       "
15330 :No=0
15340 'if lang_flag = 1 then
15350 'Else
15360 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に戻るを選択":goto Entry_check_key:
15370 'endif
15380 'cls:color rgb(255,255,255):print"ok"
15390 'デバッグライン　ここまで
15400 'デバッグライン　ここから
15410 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
15420 'デバッグライン　ここまで
15430 case 0:
15440 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.登録文字検索を選択":goto Entry_check_key:
15450 'デバッグライン　ここから
15460 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
15470 'デバッグライン　ここまで
15480 end select
15490 endif
15500 'バーチャルパッド　上 ここから
15510 if y = -1 then
15520 select case No
15530 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15540 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15550 case 0:
15560       sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print "                                      ":locate 0,15:print " 3.数字から数霊の説明を選択":goto Entry_check_key:
15570 case 1:
15580 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print"4.トップ画面に戻るを選択":goto Entry_check_key:
15590 'No:3 3.Help→2.設定 No:2
15600 case 3:
15610 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
15620 case 2:
15630 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 1.登録文字検索を選択":goto Entry_check_key:
15640 end select
15650 endif
15660 if bg=2 then
15670 select case No
15680 '1.数霊チェックを選択  パッドの右キー
15690 case 1:
15700 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15710 '2.設定を選択    パッドの右キー
15720 case 2:
15730 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15740 '3.ヘルプを選択 パッドの右
15750 case 0:
15760 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15770 case 3:
15780 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Input_numbertokazutama:
15790 end select
15800 endif
15810 '4.終了するを選択  パッドの右
15820 'バーチャルパッド　ここまで'
15830 'key$ = input$(1)
15840 'カーソルの下
15850 if key$ = chr$(31) then
15860 select case (No Mod 4)
15870 case 0:
15880 c=1:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
15890 case 1:
15900 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,500),0,0:sp_on 3,0:goto Entry_check_key:
15910 case 2:
15920 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:goto Entry_check_key:
15930 case 3:
15940 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
15950 end select
15960 endif
15970 'カーソル　上
15980 if key$ = chr$(30) then
15990 select case (No Mod 4)
16000 case 0:
16010 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
16020 case 1:
16030 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
16040 case 2:
16050 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
16060 case 3:
16070 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
16080 end select
16090 endif
16100 'エンターキーを押す
16110 if key$ = chr$(13) then
16120 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
16130 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
16140 if No = 0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16150 endif
16160 '
16170 Kakunin_Surei_count:
16180 cls 3:font 48:No=0
16190 select case device_No
16200 case 1:
16210 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
16220 'gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
16230 gload Gazo$ + "downscreen.png",0,0,800
16240 case 2:
16250 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
16260  end select
16270 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
16280 color rgb(255,0,0)
16290 print chr$(13)+chr$(13)+chr$(13)
16300 color rgb(255,255,255)
16310 print "番号を選んでください" + chr$(13)
16320 print " :1.数霊リスト 1人用" + chr$(13)
16330 print " :2.結果表示設定" + chr$(13)
16340 print " :3.トップ画面に行く" + chr$(13)
16350 print "" + chr$(13)
16360 color rgb(0,0,0)
16370 locate 0,15:print"                                                         "
16380 if No = 0 then locate 1,15:print "1.数霊リスト　1人用を選択"
16390 Entry_List:
16400 y = 0:key$ = "":bg=0
16410 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
16420 y = stick(1)
16430 key$ = inkey$
16440 bg = strig(1)
16450 pause 2
16460 wend
16470 'バーチャルパッド　ここから'
16480 'バーチャルパッド　ここから'
16490 'バーチャルパッド　下
16500 if y = 1 then
16510 select case No
16520 'No の初期値：No=1
16530 case 0:
16540 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=1:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.結果表示設定を選択":goto Entry_List:
16550 'デバッグライン　ここから
16560 '0のとき
16570 'デバッグライン　ここまで
16580 'デバッグライン　ここから
16590 'color rgb(0,0,0):locate 0,15:print " 4.終了を選択":goto Entry_List:
16600 'cls:color rgb(255,255,255):print"ok"
16610 'デバッグライン　ここまで
16620 case 2:
16630 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,300),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 1.数霊リスト 1人用を選択":No=0:goto Entry_List:
16640 case 1:
16650 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                      ":No=2:locate 1,15:print "3．トップ画面に行くを選択":goto Entry_List:
16660 'デバッグライン　ここから
16670 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
16680 'デバッグライン　ここまで
16690 'デバッグライン　ここから
16700 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
16710 'デバッグライン　ここまで
16720 end select
16730 endif
16740 'バーチャルパッド　上 ここから
16750 if y = -1 then
16760 select case No
16770 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
16780 case 2:
16790 sp_on 2,0:sp_on 0,0:sp_on 1,1:sp_on 3,0:sp_put 1,(5,400),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 2.結果表示設定を選択":goto Entry_List:
16800 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
16810 case 0:
16820 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 1,15:print"3.トップ画面に行くを選択":goto Entry_List:
16830 'No:3 3.Help→2.設定 No:2
16840 case 1:
16850 sp_on 1,0:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 0,(5,300),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print "1.数霊リスト 1人用を選択":goto Entry_List:
16860 end select
16870 endif
16880 if bg = 2 then
16890 select case No
16900 '1.数霊リスト 一人用を選択を選択  パッドの右キー
16910 case 0:
16920 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16930 '2.設定を選択  パッドの右キー
16940 case 1:
16950 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16960 case 2:
16970 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16980 end select
16990 endif
17000 if key$=chr$(13) then
17010 select case No
17020 case 0:
17030 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
17040 case 1:
17050 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
17060 case 2:
17070 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
17080 end select
17090 endif
17100 '4.終了するを選択  パッドの右
17110 'バーチャルパッド　ここまで'
17120 Surei_List1:
17130 cls 3:font 48
17140 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
17150 file$ = dir$(SAVE_DATA1$,0)
17160 'ファイルが無いときの画面
17170 if file$ = ""  then
17180 '背景画面表示
17190 select case device_No
17200 case 1:
17210 gload Gazo$ + "KazutamaList1.png",0
17220 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
17230 gload Gazo$+"downscreen.png",0,0,800
17240 case 2:
17250 gload Gazo$ + "KazutamaList1.png"
17260 end select
17270 print chr$(13)
17280 color rgb(255,255,255):print "登録ファイルはございません" + chr$(13)
17290 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
17300 'else
17310 'endif
17320 bg = 0:key$ = ""
17330 while (key$ <> chr$(13) and bg<>2)
17340 key$ = inkey$
17350 bg = strig(1)
17360 pause 2
17370 wend
17380 'エンターキーもしくはバーチャルパッドの右でトップに行く
17390 if (bg = 2  or key$ = chr$(13)) then goto TopScreen:
17400 else
17410 cls 3:buffer_list_count = Loadcount()
17420 color rgb(255,255,255)
17430 if lang_flag = 1 then
17440 Else
17450 talk "登録件数は" + str$(buffer_list_count) + "件です"
17460 select case device_No
17470 Case 1:
17480 gload Gazo$ + "KazutamaList1_Entry.png",0,0,0
17490 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
17500 gload Gazo$ + "downscreen.png",0,0,800
17510 case 2:
17520 gload Gazo$+"KazutamaList1_Entry.png",0,0,0
17530 end select
17540 color rgb(0,0,255)
17550 print chr$(13)
17560 color rgb(255,255,255)
17570 print "登録件数:";buffer_list_count;"件";chr$(13)
17580 color rgb(0,0,0)
17590 print "パッドの右を押してください" + chr$(13)
17600 endif
17610 bg = 0:key$ = "":bg2 = 0
17620 while (key$ <> chr$(13) and bg <> 2)
17630 key$ = inkey$
17640 bg = strig(1)
17650 bg2=strig(0)
17660 pause 2
17670 wend
17680 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
17690 if (key$ = chr$(13) or bg = 2) then pause 2:goto KotodamaList_page:
17700 endif
17710 if (bg = 2) then pause 2:goto TopScreen:
17720 func Loadcount()
17730 n = 0
17740 'while eof(1)=-1
17750 open SAVE_DATA1$  for input as #1
17760 while eof(1) <> -1
17770 line input #1,line$
17780 n = n + 1
17790 wend
17800 close #1
17810 count = n
17820 endfunc count
17830 count_line = Loadcount()
17840 func Kotodama$(buf$)
17850 color rgb(255,255,255)
17860 b = len("数霊:")
17870 a$ = Mid$(buf$,b+1,len(buf$))
17880 for i=0 to 118
17890 color rgb(255,255,255)
17900 if bufline3$(2 * i) ="数霊:" + a$  then
17910 moji_$ = bufline3$(2*i + 1)
17920 endif
17930 next i
17940 kotodama$ = moji_$
17950 endfunc kotodama$
17960 KotodamaList_page:
17970 cls 3:font 48:m = 0:
17980 select case device_No
17990 case 1:
18000 gload Gazo$ + "Screen5_Surei_List.png"
18010 gload Gazo$ + "downscreen.png",0,0,800
18020 case 2:
18030 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
18040 end select
18050 if SAVE_DATA1$ = "" then
18060 cls 3:color rgb(255,255,255):print"ファイルがありません"
18070 else
18080 a = Loadcount()
18090 open SAVE_DATA1$  for input as #1
18100 for i=0 to a-1
18110 for n=0 to 1
18120 input #1,line$
18130 bufKaztama$(i,n) = line$
18140 next n
18150 next i
18160 close #1
18170 l = 0:n=0
18180 select case device_No
18190 case 1:
18200 gload Gazo$ + "Screen5_Surei_List.png"
18210 gload Gazo$ + "downscreen.png",0,0,800
18220 case 2:
18230 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
18240 end select
18250 while (buffer_list_count >= l)
18260 cls
18270 color rgb(255,0,0)
18280 print chr$(13)
18290 color rgb(255,255,255)
18300 n=n+1
18310 print chr$(13)
18320 print "番号:";l+1;chr$(13)
18330 print bufKaztama$(l,0) + chr$(13)
18340 print bufKaztama$(l,1) + chr$(13)
18350 Kmoji$ = moji$
18360 print chr$(13) + chr$(13) + chr$(13)
18370 color rgb(0,0,0)
18380 if buffer_list_count=1 then
18390 print " :パッドの左:トップ画面"+chr$(13)
18400 ui_msg "登録件数は1件です。"
18410 else
18420 if buffer_list_count > 1 then
18430 print " :パッドの左:トップ画面" + chr$(13)
18440 print " :パッドの右:次へ行く" + chr$(13)
18450 endif
18460 endif
18470 key$ = "":bg = 0:bg2 = 0
18480 while (key$ <> chr$(13) and bg <> 2 and bg2 <> 1)
18490 key$ = inkey$
18500 bg = strig(1)
18510 bg2 = strig(0)
18520 pause 2
18530 wend
18540 'if n > 1 then
18550 if (key$ = " " OR bg = 2) then
18560 if n > 1 then
18570 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
18580 endif
18590 else
18600 if ((bg2 = 1) or (key$=chr$(13))) then
18610 goto TopScreen:
18620 endif
18630 else
18640 goto KotodamaList_page:
18650 endif
18660 wend
18670 endif
18680 'ndif
18690 '結果表示２ Menu1
18700 Surei_Result4:
18710 cls 3:font 32+16:init"kb:4"
18720 for i=0 to 181 + 4 - 1
18730 if i = count  then
18740 buffer$ = bufline2$(count + 4,1)
18750 endif
18760 next i
18770 if len(buffer$) > 21 and len(buffer$) <= 45 then
18780 buffer2$ = Mid$(buffer$,1,22)
18790 buffer3$ = Mid$(buffer$,23,(len(buffer$) - 22))
18800 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13)
18810 else
18820 if len(buffer$) <= 21 then
18830 buffer2$ = Mid$(buffer$,1,21)
18840 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
18850 else
18860 if len(buffer$) > 45 and len(buffer$) <= 62 then
18870 buffer2$ = Mid$(buffer$,1,22)
18880 buffer3$ = Mid$(buffer$,23,22)
18890 buffer4$ = Mid$(buffer$,44,(len(buffer$)-44))
18900 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13)
18910 else
18920 if len(buffer$) > 64 and len(buffer$) <= 81 then
18930 buffer2$ = Mid$(buffer$,1,22)
18940 buffer3$ = Mid$(buffer$,23,20)
18950 buffer4$ = Mid$(buffer$,44,20)
18960 buffer5$ = Mid$(buffer$,65,(len(buffer$)-65))
18970 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13)
18980 if len(buffer$) > 81 and len(buffer$) <= 110 then
18990 buffer2$ = Mid$(buffer$,1,22)
19000 buffer3$ = Mid$(buffer$,23,20)
19010 buffer4$ = Mid$(buffer$,43,20)
19020 buffer5$ = Mid$(buffer$,63,20)
19030 buffer6$ = Mid$(buffer$,83,(len(buffer$) - 83))
19040 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13)
19050 endif
19060 endif
19070 endif
19080 endif
19090 endif
19100 Surei_Result4_2:
19110 select case device_No
19120 case 1:
19130 gload Gazo$ + "Screen1_Result2.png"
19140 gload Gazo$ + "downscreen.png",0,0,800
19150 case 2:
19160 gload Gazo$ +"Screen1_Result2.png"
19170 end select
19180 Result_Menu_List$(0)="1.トップ画面に行く"
19190 Result_Menu_List$(1)="2.数霊のデーターを保存"
19200 Result_Menu_List$(2)="3.もう一度、数霊を調べる"
19210 cls
19220 print chr$(13)
19230 if lang_flag = 1 then
19240 else
19250 color rgb(127,255,212)
19260 print chr$(13);chr$(13)
19270 print "入力文字:";buffer_moji$;chr$(13)
19280 print "数霊:";count;chr$(13)
19290 color rgb(255,255,255)
19300 print "数霊の説明:"+chr$(13)
19310 print buffer$
19320 color rgb(0,0,0)
19330 locate 0,15
19340 print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
19350 endif
19360 key$ = "":bg = 0:bg2 = 0
19370 while (bg<>2 and bg2<>1)
19380 key$ = inkey$
19390 bg = strig(1)
19400 bg2 = strig(0)
19410 pause 2
19420 wend
19430 if ((bg = 2) or (bg2 = 1)) then
19440 num = ui_select("Result_Menu_List$","番号を選んでください")
19450 endif
19460 if num = 0 then goto TopScreen:
19470 if num = 1 then goto File_save:
19480 if num = 2 then goto Surei_Input:
19490 if num = -1 then goto Surei_Result4
19500 File_save:
19510 'ファイルがない時
19520 if dir$(SAVE_DATA1$) = " " then
19530 open SAVE_DATA1$ for output as #1
19540 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19550 close #1
19560 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19570 'ファイルが有る時
19580 else
19590 open SAVE_DATA1$ for append as #1
19600 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19610 close #1
19620 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19630 endif
19640 func All_clear()
19650 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
19660 endfunc
19670 'ここから
19680 Config_moji1:
19690 cls 3:Font 48
19700 select case device_No
19710 case 1:
19720 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19730 gload Gazo$ + "downscreen.png",0,0,800
19740 case 2:
19750  gload  Gazo$ + "Screen1_Setting_Top.png",0,0,0
19760 end select
19770 play ""
19780 No=1
19790 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19800 color rgb(0,0,255)
19810 print chr$(13)
19820 if lang_flag = 1 then
19830 'lang_flag = 1:英語
19840 else
19850 'lang_flag = 0:日本語
19860 color rgb(255,255,255)
19870 print "番号を選んでください" + chr$(13)
19880 print " :1.文字の項目" + chr$(13)
19890 print " :2.結果表示設定" + chr$(13)
19900 print " :3.トップ画面に行く" + chr$(13)
19910 print " :4.終 了" + chr$(13)
19920 endif
19930 color rgb(0,0,0)
19940 locate 1,12
19950 if No = 1 then print "1.文字の項目"
19960 'y:バーチャルパッドの処理
19970 'key$:カーソルの処理
19980 'bg:バーチャルパッドの右ボタン
19990 Config_moji1_Screen:
20000 y = 0:key$ = "":bg=0
20010 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
20020 y = stick(1)
20030 key$ = inkey$
20040 bg=strig(1)
20050 pause 2
20060 wend
20070 'バーチャルパッド　ここから'
20080 'バーチャルパッド　ここから'
20090 if y = 1 then
20100 select case No
20110 'No の初期値：No=1
20120 case 1:
20130 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20140 'デバッグライン　ここから
20150 '0のとき
20160 'デバッグライン　ここまで
20170 'デバッグライン　ここから
20180 case 2:
20190 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
20200 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
20210 'if lang_flag = 1 then
20220 'else
20230 locate 1,12:print "3.トップ画面に行くを選択"
20240 'endif
20250 'デバッグライン　ここまで
20260 case 3:
20270 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
20280 'デバッグライン　ここから
20290 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
20300 'デバッグライン　ここまで
20310 case 0:
20320 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20330 'デバッグライン　ここから
20340 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
20350 'デバッグライン　ここまで
20360 end select
20370 endif
20380 'バーチャルパッド　上 ここから
20390 if y = -1 then
20400 select case No
20410 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
20420 case 1:
20430 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
20440 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
20450 case 0:
20460 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
20470 'No:3 3.Help→2.設定 No:2
20480 case 3:
20490 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20500 case 2:
20510 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
20520 end select
20530 endif
20540 if bg=2 then
20550 select case No
20560 '1.数霊チェックを選択  パッドの右キー
20570 case 1:
20580 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
20590 '2.設定を選択    パッドの右キー
20600 case 2:
20610 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
20620 '3.ヘルプを選択 パッドの右
20630 case 3:
20640 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
20650 'プログラムの終了を選択
20660 case 0:
20670 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
20680 'if lang_flag = 1 then
20690 'Else
20700 ui_msg "プログラムを終了します":end
20710 'endif
20720 end select
20730 endif
20740 '4.終了するを選択  パッドの右
20750 'バーチャルパッド　ここまで'
20760 'SettingScreen:
20770 'key$ = input$(1)
20780 'カーソル下'
20790 if key$ = chr$(31) then
20800 select case (No Mod 4)
20810 '登録文字から数霊文字の確認
20820 case 1:
20830 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
20840 '数霊文字の確認からトップ画面に行く
20850 case 2:
20860 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
20870 'トップ画面に行くから終了
20880 case 3:
20890 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
20900 '終了から登録文字
20910 case 0:
20920 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20930 end select
20940 endif
20950 'カーソル　上
20960 if key$ = chr$(30) then
20970 select case (No Mod 4)
20980 case 1:
20990 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
21000 case 2:
21010 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
21020 case 3:
21030 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
21040 case 0:
21050 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
21060 end select
21070 endif
21080 'エンターキーを押したとき
21090 if key$ = chr$(13) then
21100 if No=3 then goto TopScreen:
21110 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
21120 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
21130 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
21140 'lse
21150 'o'o SettingScreen:
21160 endif
21170 'ここまで
21180 Config_moji2:
21190 cls 3:Font 48
21200 select case device_No
21210 case 1:
21220 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
21230 gload Gazo$ + "downscreen.png",0,0,800
21240  case 2:
21250 gload Gazo$ + "Screen1_Setting_Top.png "
21260  end select
21270 play ""
21280 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
21290 No=1
21300 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
21310 color rgb(0,0,255)
21320 'print "●設定項目" + chr$(13)
21330 print chr$(13)
21340 if lang_flag = 1 then
21350 'lang_flag = 1:英語
21360 else
21370 'lang_flag = 0:日本語
21380 color rgb(255,255,255)
21390 print "番号を選んでください" + chr$(13)
21400 'print " :1.文字の項目" + chr$(13)
21410 'print " :2.結果表示設定" + chr$(13)
21420 print " :1.文字の項目" + chr$(13)
21430 print " :2.結果表示設定" + chr$(13)
21440 print " :3.トップ画面に行く" + chr$(13)
21450 print " :4.終 了" + chr$(13)
21460 endif
21470 color rgb(0,0,0)
21480 locate 1,12
21490 if No = 1 then print "1.文字の項目"
21500 'y:バーチャルパッドの処理
21510 'key$:カーソルの処理
21520 'bg:バーチャルパッドの右ボタン
21530 config_moji2:
21540 y = 0:key$ = "":bg=0
21550 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
21560 y = stick(1)
21570 key$ = inkey$
21580 bg = strig(1)
21590 pause 2
21600 wend
21610 'バーチャルパッド　ここから'
21620 'バーチャルパッド　ここから'
21630 if y = 1 then
21640 select case No
21650 'No の初期値：No=1
21660 case 1:
21670 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
21680 'デバッグライン　ここから
21690 '0のとき
21700 'デバッグライン　ここまで
21710 'デバッグライン　ここから
21720 case 2:
21730 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
21740 color rgb(0,0,0)::No=2:goto SettingScreen:
21750 if lang_flag = 1 then
21760 else
21770 locate 0,12:print " 3.トップ画面に行くを選択"
21780 endif
21790 'cls:color rgb(255,255,255):print"ok"
21800 'デバッグライン　ここまで
21810 case 3:
21820 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
21830 'デバッグライン　ここから
21840 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
21850 'デバッグライン　ここまで
21860 case 0:
21870 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21880 'デバッグライン　ここから
21890 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
21900 'デバッグライン　ここまで
21910 end select
21920 endif
21930 'バーチャルパッド　上 ここから
21940 if y = -1 then
21950 select case No
21960 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
21970 case 1:
21980 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
21990 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
22000 case 0:
22010 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
22020 'No:3 3.Help→2.設定 No:2
22030 case 3:
22040 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22050 case 2:
22060 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
22070 end select
22080 endif
22090 '決定ボタン
22100 if bg=2 then
22110 select case No
22120 '1.数霊チェックを選択  パッドの右キー
22130 case 1:
22140 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
22150 '2.設定を選択    パッドの右キー
22160 case 2:
22170 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
22180 '3.ヘルプを選択 パッドの右
22190 case 3:
22200 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
22210 'プログラムの終了を選択
22220 case 0:
22230 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
22240 'if lang_flag = 1 then
22250 'Else
22260 ui_msg "プログラムを終了します":end
22270 'endif
22280 end select
22290 endif
22300 '4.終了するを選択  パッドの右
22310 'バーチャルパッド　ここまで'
22320 'カーソル下'
22330 if key$ = chr$(31) then
22340 select case (No Mod 4)
22350 '登録文字から数霊文字の確認
22360 case 1:
22370 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22380 '数霊文字の確認からトップ画面に行く
22390 case 2:
22400 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
22410 'トップ画面に行くから終了
22420 case 3:
22430 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
22440 '終了から登録文字
22450 case 0:
22460 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
22470 end select
22480 endif
22490 'カーソル　上
22500 if key$ = chr$(30) then
22510 select case (No Mod 4)
22520 case 1:
22530 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
22540 case 2:
22550 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
22560 case 3:
22570 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
22580 case 0:
22590 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
22600 end select
22610 endif
22620 'エンターキーを押したとき
22630 if key$ = chr$(13) then
22640 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
22650 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
22660 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
22670 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
22680 'lse
22690 'o'o SettingScreen:
22700 endif
22710 '結果表示設定
22720 Result_Setting:
22730 color rgb(255,255,255)
22740 'dim list$(4)
22750 'ファイル読み込み
22760 '1.ファイルが有るか無いかのチェック
22770 if Dir$(System$) = "" then
22780 '1-1.ファイルがないとき
22790 '上のSystemフォルダを作成
22800 mkdir "./data/system/"
22810 list$(0) = "●:出た数字から181を引く"
22820 list$(1) = " :出た数字から180を引き単数変換"
22830 open System$ for output as #1
22840 print #1,"config_r=0"
22850 close #1
22860 ui_msg "ファイルを作成しました"
22870 'ファイル作成
22880 else
22890 '1-2.ファイルが有るとき
22900 'config_r:0 出た数字から181を引く
22910 'config_r:1 出た数字から180を引いて単数変換
22920 'open "./System/config.sys" for input as #1
22930 'ファイルが有るときファイルを読み込み
22940 open System$ for input as #1
22950 line input #1,buf_line$
22960 'buf$にデーターをコピーする
22970 buf$ = buf_line$
22980 close #1
22990 if len(buf$) = 10 then
23000 if left$(buf$,9) = "config_r=" then
23010 buf$ = right$(buf_line$,1)
23020 if buf$ = "1" then
23030 '1.System$ ファイルを削除(config.sys)
23040 '2.1行目をconfig_r=1と書き、保存する
23050 buf_config_r = 1
23060 'list$(0) = "●:1.出た数字から180を引いて単数変換"
23070 'list$(1) = " :2.出た数字から181を引く"
23080 else
23090 if buf$ = "0" then
23100 buf_config_r = 0
23110 ' list$(0) = "●:1.出た数字から181を引く"
23120 'list$(1) = " :2.出た数字から180を引いて単数変換"
23130 endif
23140 endif
23150 endif
23160 endif
23170 endif
23180 '"●:1.出た数字から180を引く"をlist$(0)に代入
23190 if buf_config_r =  0 then
23200 list$(0) = "●:1.出た数字から181を引く"
23210 list$(1) = " :2.出た数字から180を引いて単数変換"
23220 else
23230 list$(0) = "●:1.出た数字から180を引いて単数変換"
23240 list$(1) = " :2.出た数字から181を引く"
23250 endif
23260 list$(2) = " :トップ画面に戻る"
23270 list_num = ui_select("list$","番号を選んでください")
23280 play ""
23290 Select case (list_num)
23300 case 0:
23310 if buf$ = "1" then
23320 buf_config_r = 0:
23330 'データーを変更したのでファイルを削除
23340 kill System$
23350 'ファイルを新しく作成
23360 open System$ for output as #1
23370 print #1,"config_r=0"
23380 close #1
23390 ui_msg "設定を変更しました。"
23400 else
23410 'if buf$ = "0" then
23420 'buf_config_r = 1
23430 'kill System$
23440 'open Syetem$ for output as #1
23450 'print #1,"config_r=1"
23460 'close #1
23470 'ui_msg "設定を変更しました"
23480 'endif
23490 endif
23500 goto config_moji2:
23510 case 1:
23520 if buf$ = "0" then
23530 buf_config_r = 1:
23540 'データーを変更したので、ファイルを削除
23550 kill System$
23560 'ファイルを新しく作成
23570 open System$ for output as #1
23580 print #1,"config_r=1"
23590 close #1
23600 ui_msg "設定を変更しました"
23610 else
23620 kill System$
23630 if buf$ = "1" then
23640 open System$ for output as #1
23650 print #1,"config_r=0"
23660 close #1
23670 ui_msg "設定を変更しました"
23680 endif
23690 endif
23700 goto config_moji2:
23710 case 2:
23720 'トップ画面に飛ぶ
23730 goto TopScreen:
23740 case 3:
23750 'プログラムを終了する
23760 cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
23770 end select
23780 '単数変換
23790 Func Single_Complate(num)
23800 '1.出てきた数字から180を引く
23810 a = num - 180
23820 'a:10〜99
23830 Re1:
23840 if (a > 9 and a < 100) then
23850 b1 = fix(a / 10)
23860 b2 = 10 * a - b1
23870 d1 = b1 + b2
23880 if c > 9 then
23890 goto Re1:
23900 else
23910 c = d1:goto Re2:
23920 endif
23930 endif
23940 Re2:
23950 buffer = c
23960 endfunc buffer
23970 Func Surei_Result_Save_File()
23980 'ファイルがないとき
23990 if dir$(SAVE_DATA1$) = "" then
24000 open SAVE_DATA1$ for output as #1
24010 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
24020 close #1
24030 ui_msg "保存しました":talk "保存しました":goto Surei_Result:
24040 else
24050 open SAVE_DATA1$ for append as #1
24060 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
24070 close #1
24080 ui_msg "保存しました":talk "保存しました":goto Surei_Result
24090 endif
24100 endfunc
24110 '言語設定
24120 Setting_Language:
24130 cls 3:screen 1,1,1,1:No=2
24140 select case device_No
24150 case 1:
24160 gload Gazo$ + "Screen1.png",0,0,0
24170 gload Gazo$ + "downscreen.png",0,0,800
24180 case 2:
24190 gload Gazo$ + "Screen1.png",0,0,0
24200 end select
24210 init "Kb:4"
24220 sp_on 1,1:sp_on 0,0
24230 sp_put 0,(0,300),0,0
24240 sp_put 1,(0,400),1,0
24250 color rgb(0,0,255)
24260 'print "番号を選んでください"+chr$(13)
24270 'if lang_flag=0 then
24280 'print "言語設定:日本語"+chr$(13)
24290 'else
24300 'print "言語設定:英 語"+chr$(13)
24310 Change_Language:
24320 if lang_flag = 1 then
24330 cls
24340 print "It has changed Language"+chr$(13)
24350 color rgb(255,255,255)
24360 print "Select the Number"+chr$(13)
24370 print " :1.English → Japanse"+chr$(13)
24380 print " :2.It goes to TopScreen"+chr$(13)
24390 print "Language:In English" +chr$(13)
24400 else
24410 cls:color rgb(255,255,255)
24420 print "設定変更(言語の変更)" + chr$(13)
24430 color rgb(255,255,255)
24440 print chr$(13)
24450 print "番号を選んでください"+chr$(13)
24460 print " :1.日本語 → 英語に変更" + chr$(13)
24470 print " :2.トップ画面に戻る" + chr$(13)
24480 print chr$(13)
24490 print "設定言語:日本語" + chr$(13)
24500 endif
24510 color rgb(0,0,0)
24520 locate 0,15:print "                                       ":locate 0,15:print " 2.トップ画面に戻る　を選択" + chr$(13)
24530 Setting_Language_key:
24540 y=0:key$="":bg=0
24550 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y<> -1 and bg<> 2)
24560 y=stick(1)
24570 key$=inkey$
24580 bg=strig(1)
24590 pause 2
24600 wend
24610 '選択肢変更
24620 if ((y=1) or (y=-1)) then
24630 select case No
24640 case 2:
24650 '実装部分　ここから
24660 pause 200:No=1:sp_on 0,1:sp_on 1,0:locate 0,15:print "                                                         ":locate 0,15:print " 1.日本語 → 英語に変更を選択": goto Setting_Language_key:
24670 '実装部分　ここまで
24680 case 1:
24690 pause 200: No=2:sp_on 0,0:sp_on 1,1:locate 0,15:print "                                                       ":locate 0,15:print " 2.トップ画面に戻る を選択":goto Setting_Language_key:
24700 end select
24710 endif
24720 'Enter Key  決定ボタン
24730 if ((key$=chr$(13)) or (bg=2)) then
24740 select case No
24750 case 2:
24760 sp_on 0,0:sp_on 1,0:goto TopScreen:
24770 case 1:                                                     'lang_flag=1:sp_on 0,0:sp_on 1,0:goto Change_Language:
24780 '
24790 '未実装　ここから
24800 sp_on 0,1:sp_on 1,0:ui_msg "この機能は未実装です":goto Setting_Language_key:
24810 '
24820 '未実装　ここまで
24830 end select
24840 endif
24850 '配列削除
24860 buffer_clear:
24870 erase bufline$
24880 erase bufcount$
24890 erase bufcount1$
24900 erase bufcount2$
24910 erase bufline2$
24920 erase bufline3$
24930 erase bufKaztama$
24940 erase List$
24950 erase Result_Menu_List$
24960 erase list$
24970 erase moji_List$
24980 'ui_msg "メモリーをクリアしました"
24990 return
25000 '配列削除　ここまで
25010 File_Device_Set:
25020 'Device 選択　書き込み
25030 open Device_type$  for output as #1
25040 print #1,device_No
25050 close #1
25060 ui_msg "ファイルを書き込みました"
25070 return
25080 Input_numbertokazutama:
25090 cls 3:gload Gazo$ + "Input_numbertokazutama.png",0,0,0:init "kb:2"
25100 color rgb(255,255,255):locate 1,4:print "調べたい数霊の番号を入れてください"+chr$(13);"(Max:181)"
25110 color rgb(0,0,0):locate 1,7:Input "番号:",num
25120 if (num > 181) then ui_msg"181までの数字で入れ直してください":goto Input_numbertokazutama:
25130 for i=0 to 181+3-1
25140 if i = num then
25150 buffer$ = bufline2$(i+4,1)
25160 goto Numbertokazutama:
25170 endif
25180 next i
25190 'goto Numbertokazutama:
25200 '
25210 '
25220 Numbertokazutama:
25230 cls 3:init "kb:4":bg=0:key$=""
25240 select case (device_No)
25250 case 1:
25260 gload Gazo$ + "Result_numbertokazutama.png",0,0,0
25270 gload Gazo$ + "downscreen.png",0,0,800
25280 case 2:
25290 gload Gazo$ + "Result_numbertokazutama.png",0,0,0
25300 end select
25310 font 32+16:color rgb(255,255,255)
25320 locate 1,3:print "◎数霊番号:";num;chr$(13)
25330 locate 1,4:print "◎数霊の説明"+chr$(13)
25340 if ((len(buffer$) > 21) and (len(buffer$) <= 45)) then
25350 buffer2$ = Mid$(buffer$,1,20)
25360 buffer3$ = Mid$(buffer$,21,len(buffer$)-20)
25370 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13)
25380 else
25390 if (len(buffer$) < 22) then
25400 buffer2$ = Mid$(buffer$,1,21)
25410 buffer$ = buffer2$ + chr$(13)
25420 else
25430 if ((Len(buffer$) > 45) and (len(buffer$) < 66)) then
25440 buffer2$ = Mid$(buffer$,1,20)
25450 buffer3$ = Mid$(buffer$,20,21)
25460 buffer4$ = Mid$(buffer$,41,len(buffer$)-41)
25470 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13)
25480 endif
25490 endif
25500 endif
25510 locate 1,5:print buffer$
25520 color rgb(0,0,0)
25530 locate 1,14:print "ジョイパッドの右を押してください"+chr$(13)
25540 while ((bg <> 2) and (key$ <> chr$(13)))
25550 bg=strig(1)
25560 key$=inkey$
25570 pause 2
25580 wend
25590 if ((bg = 2) or (key$ = chr$(13))) then
25600 goto TopScreen:
25610 endif
25620 data_initialize:
25630 cls 3
25640 select case device_No
25650 case 1:
25660 gload Gazo$ + "Data_initializeScreen.png",0,0,0
25670 gload Gazo$ + "downscreen.png",0,0,800
25680 case 2:
25690 gload Gazo$ + "Data_initializeScreen.png",0,0,0
25700 end select
25710 color rgb(255,255,255):font 48:init "kb:4":No=1:sp_on 1,1:sp_put 1,(5,300),0,0
25720 locate 0,4:print "番号を選んでください"+chr$(13)
25730 print " :1.メンバーリストの初期化" + chr$(13)
25740 print " :2.デバイスの初期化" + chr$(13)
25750 print " :3.トップ画面に行く"+chr$(13)
25760 locate 0,15:color rgb(0,0,0):print "1.メンバーリストの初期化を選択"
25770 data_initialize2:
25780 y = 0:key$ = "":bg = 0
25790 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
25800 y = stick(1)
25810 key$ = inkey$
25820 bg = strig(1)
25830 pause 2
25840 wend
25850 'y = -1:ジョイパッドの上
25860 'y = 1:ジョイパッド下
25870 'key$ = chr$(13):Enter key
25880 'key$ = chr$(30):カーソル上
25890 'key$ = chr$(31):カーソル下
25900 if ((y = -1) or (key$ = chr$(30))) then
25910 select case No
25920 case 1:
25930  sp_on 1,0:sp_on 2,0:sp_on 0,1:sp_on 3,0:No=0:sp_put 0,(5,500),0,0:locate 0,15:print "                                       ":locate 0,15:print "3.トップ画面に行くを選択":pause 200:goto data_initialize2:
25940 case 2:
25950 sp_on 1,1:sp_on 2,0:sp_on 0,0:sp_on 3,0:No=1:sp_put 1,(5,300),0,0:locate 0,15:print "                                      ":pause 200:locate 0,15:print "1.メンバーリストの初期化を選択":goto data_initialize2:
25960 case 0:
25970 sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_on 0,0:sp_put 2,(5,400),0,0:locate 0,15:print "                                      ":pause 200:locate 0,15:print "2.デバイスの初期化を選択"+chr$(13):No=2:goto data_initialize2:
25980 end select
25990 endif
26000 'bg=2:Enter key
26010 if ((bg = 2) or (key$ = chr$(13))) then
26020 select case No
26030 case 0:
26040 sp_on 0,0:sp_on 1,0:sp_on 2,0:pause 200:goto TopScreen:
26050 case 1:
26060 'メンバーリストの初期化トップへ行く
26070 sp_on 0,0:sp_on 1,0:sp_on 2,0:pause 200:goto member_initializeTop:
26080 case 2:
26090 ui_msg "未実装です":goto data_initialize2:
26100 end select
26110 endif
26120 'カーソルの下　または、ジョイパッド下
26130 if ((y = 1) or (key$ = chr$(31))) then
26140 select case No
26150 case 1:
26160 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                          ":locate 0,15:print "2.デバイスの初期化を選択":goto data_initialize2:
26170 case 2:
26180 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:No=0:locate 0,15:print "                                                          ":locate 0,15:print "3.トップ画面に行くを選択":goto data_initialize2:
26190 case 0:
26200 sp_on 0,0:sp_on 1,1:sp_on 2,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                                          ":locate 0,15:print "1.メンバーリストの初期化を選択":goto data_initialize2:
26210 end select
26220 endif
26230 'メンバーリストの初期化トップ
26240 member_initializeTop:
26250 cls 3
26260 select case (device_No)
26270 case 1:
26280 gload Gazo$ + "member_initializeTop.png",0,0,0
26290 gload Gazo$ + "downscreen.png",0,0,800
26300 case 2:
26310 gload Gazo$ + "member_initializeTop.png",0,0,0
26320 end select
26330 No=0:init "kb:4":color rgb(255,255,255):font 48
26340 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,500),0,0
26350 locate 0,4:print  "番号を選んでください"+chr$(13)
26360 print " :1.メンバーリストを初期化する" + chr$(13)
26370 print " :2.バックアップを取る" + chr$(13)
26380 print " :3.トップ画面に戻る"+chr$(13)
26390 color rgb(0,0,0):locate 0,15:print "                                       ":locate 0,15:print "3.トップ画面に戻るを選択"+chr$(13)
26400 member_list2:
26410 y=0:key$="":bg=0
26420 while ((key$ <> chr$(13)) and (y <> 1) and (y <> -1) and (bg <> 2))
26430 y = stick(1)
26440 key$ = inkey$
26450 bg = strig(1)
26460 pause 2
26470 wend
26480 'bg=2,chr$(13):決定ボタン
26490 if ((bg = 2) or (key$ = chr$(13)))  then
26500 select case No
26510 case 1:
26520 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Member_List_DeleteScreen:
26530 case 2:
26540 ui_msg"未実装です":goto member_list2:
26550 case 0:
26560 '3:トップ画面に戻る
26570 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
26580 end select
26590 endif
26600 'y=1:chr$(31):ジョイパッド　下　又は　カーソルの下
26610 if ((y = 1) or (key$ = chr$(31))) then
26620 select case No
26630 case 0:
26640 sp_on 1,1:sp_on 2,0:sp_on 0,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print "1.メンバーリストを初期化するを選択":goto member_list2:
26650 case 1:
26660 sp_on 0,0:sp_on 2,1:sp_on 1,0:No=2:sp_put 2,(5,400),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print "2.バックアップを取るを選択":goto member_list2:
26670 case 2:
26680 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:locate 0,15:print "                                       ":locate 0,15:print "3.トップ画面に行くを選択":goto member_list2:
26690 end select
26700 endif
26710 'Joypad  or カーソル　上
26720 if ((y=-1) or (key$=chr$(30))) then
26730 select case No
26740 case 0:
26750 sp_on 2,1:sp_on 1,0:sp_on 0,0:No=2:sp_put 2,(5,400),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print "2.バックアップを取るを選択":goto member_list2:
26760 case 1:
26770 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print "3.トップ画面に行くを選択":goto member_list2:
26780 case 2:
26790 sp_on 0,0:sp_on 1,1:sp_on 2,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print "1.メンバーリストを初期化をする選択":goto member_list2:
26800 end select
26810 endif
26820 Member_List_DeleteScreen:
26830 cls:key$ = "":bg = 0:y=0:init "kb:4":font 48:count=0
26840 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
26850 if dir$(SAVE_DATA1$) = "" then
26860 'ファイルがないとき
26870 color rgb(255,255,255)
26880 locate 0,4
26890 print "データーファイルは、存在しません。"
26900 locate 0,15:color rgb(0,0,0):print "ジョイパッドの右を押してください":
26910 'endif
26920 while ((key$ <> chr$(13)) and (bg <> 2) and (y <> 1) and (y <> -1))
26930 key$ = inkey$
26940 bg = strig(1)
26950 y = stick(1)
26960 pause 2
26970 wend
26980 if ((key$ = chr$(13)) or (bg = 2)) then goto TopScreen:
26990 'goto TopScreen:
27000 'endif
27010 else
27020 'ファイルが有るとき
27030 'default
27040 'No=1:ファイルを削除する
27050 'No=2:トップ画面に戻る
27060 No=2
27070 sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0
27080 color rgb(255,255,255)
27090 locate 0,4:print"番号を選んでください"+chr$(13)
27100 print " :1.ファイルを削除する"+chr$(13)
27110 print " :2.トップ画面に戻る"+chr$(13)
27120 color rgb(0,0,0):
27130 locate 0,15:print"                                      ":locate 0,15:print "2.トップ画面に戻るを選択"
27140 endif
27150 Select_key1:
27160 '初期化
27170 y=0:key$="":bg=0
27180 while ((key$ <> chr$(13)) and (bg <> 2) and (y <> 1) and (y <> -1))
27190 key$ = inkey$
27200 bg = strig(1)
27210 y = stick(1)
27220 pause 2
27230 wend
27240 '1.選択キー
27250 '十字キー 上 y=-1
27260 '十字キー　下 y=1
27270 if ((y = 1) or (y = -1)) then
27280 select case No
27290 case 2:
27300 No=1:sp_on 2,0:sp_on 1,1:sp_put 1,(5,300),0,0:locate 0,15:print "                                                                                ":locate 0,15:print "1．ファイルを削除":pause 200:goto Select_key1:
27310 case 1:
27320 No=2:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:locate 0,15:print "                                                          ":locate 0,15:print "2.トップ画面に戻るを選択":pause 200:goto Select_key1:
27330 end select
27340 endif
27350 '2.決定ボタン
27360 'Joypad　右 or Enter key
27370 if ((bg=2) or (key$=chr$(13))) then
27380 Select case No
27390 case 2:
27400 sp_on 1,0:sp_on 2,0:pause 200:goto TopScreen:
27410 case 1:
27420 if (count=0) then
27430 kill SAVE_DATA1$:ui_msg"メンバーリストを削除しました":pause 200:locate 0,15:print "                                       ":locate 0,15:print "ジョイパッドの右を押してください":count=count+1:goto Select_key1:
27440 else
27450 sp_on 1,0:sp_on 2,0:goto TopScreen
27460 endif
27470 end select
27480 endif
