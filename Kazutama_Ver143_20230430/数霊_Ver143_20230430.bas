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
630 '現在のバージョン
640 Version$ = "1.4.3_2023.04.30(正式版)"
650 'csvファイル 1.数霊 ベースファイル
660 FILE_csv$ = "./data/Kazutama.csv"
670 'csvファイル 2.数霊 ベースファイル 2
680 FILE_csv2$ = "./data/Surei_chart_20211207.csv"
690 'Save ファイル
700 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
710 'gazo ファイル
720 Gazo$ = "./data/Gazo/"
730 'System フォルダ:設定ファイルを保存するところ
740 System$ = "./data/System/config.sys"
750 'Device type:デバイスタイプのファイルチェック
760 Device_type$ = "./data/device_type.sys"
770 '設定ファイル名:config.sys
780 'Sound File(Voice)
790 '1.ボイス TopScreen
800 Voice_File_TopScreen$ = "./data/Sound_data/"
810 'Message
820 buf_finish_Message$ = "メモリーを解放してプログラムを終了します"
830 '変数領域
840 'vcount:バーチャルパッド下の変数
850 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+6,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
860 count2 = 0:N=0:N2=0:m2 = 0:device_No=0:device_type=0
870 dim list$(4),moji_List$(2)
880 'ファイルの有無チェック
890 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
900 '1.ファイルが無いとき
910 cls :print "依存ファイルが見つかりません":
920 print "エンターキーを押してください" + chr$(13)
930 key$ = input$(1)
940 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
950 else
960 '2.ファイルが有るとき
970 cls:print "csv:file ok." + chr$(13)
980 n=0
990 'FILE_csv$:数霊データー入力
1000 open FILE_csv$ for input as #1
1010 while eof(1) = 0
1020 input #1,line$
1030 bufline$(n) = line$
1040 'Print n;chr$(13)
1050 '登録件数カウント:n
1060 n = n + 1
1070 wend
1080 close #1
1090 N=n
1100 '2つ目のファイル読み込み
1110 'n = 0
1120 open FILE_csv2$ for input as #2
1130 for n=3 to 181+2+2
1140 for i=0 to 1
1150 input #2,line$
1160 bufline2$(n,i) = line$
1170 next i
1180 next n
1190 close #2
1200 N2 = n
1210 endif
1220 '2022.11.23----------------------
1230 '端末言語のチェック
1240 '日本語端末かチェックをして日本語以外なら英語で表示する
1250 'lang flag:0:日本語 1:英語(日本語以外)
1260 '--------------------------------
1270 lang_flag = 0
1280 if ex_info$(1) <> "JP" then
1290 lang_flag = 1
1300 endif
1310 cls 3:font 48:screen 1,1,1,1:int "kb:4":init "crt:0"
1320 play ""
1330 'gload Gazo$ + "TopScreen_20230310.png",0,0,0
1340 '選択ポインター 1 - 4
1350 'スプライトの定義
1360 gload Gazo$ + "Selection.png",1,5,300
1370 gload Gazo$ + "Selection.png",1,5,400
1380 gload Gazo$ + "Selection.png",1,5,500
1390 gload Gazo$ + "Selection.png",1,5,595
1400 sp_def 0,(5,300),32,32
1410 sp_def 1,(5,400),32,32
1420 sp_def 2,(5,500),32,32
1430 sp_def 3,(5,595),32,32
1440 'File check
1450 '初回起動はここから
1460 if (dir$(Device_type$) = "") then
1470 goto Device_Select:
1480 else
1490 '
1500 '2回目以降はファイルチェックをしてトップ画面
1510 '
1520  open Device_type$ for input as #1
1530  line input #1,device_type$
1540  device_No = val(device_type$)
1550  close #1
1560  if (device_No=1 or device_No=2) then
1570  goto TopScreen:
1580  endif
1590 endif
1600 'First_Select_Screen:
1610 'タブレット　or　スマホの選択を起動時にする
1620 Device_Select:
1630 font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
1640 gload Gazo$ + "device_select_20230313.png",0,0,0
1650 init "kb:4"
1660 play ""
1670 play Voice_File_TopScreen$+"Select_device_select.mp3"
1680 'y=0:key$="":bg=0
1690 print chr$(13)+chr$(13)+chr$(13)
1700 color  rgb(255,255,255)
1710 print "番号を選んでください"+chr$(13)
1720 'print chr$(13)
1730 print " :1.スマートフォン"+chr$(13)
1740 print " :2.タブレット端末"+chr$(13)
1750 locate 0,11:No=1
1760 color rgb(0,0,0)
1770 Print " 1.スマートフォンを選択"+chr$(13)
1780 sp_on 0,1:sp_put 0,(5,300),0,0
1790 sp_on 1,0:sp_on 2,0:sp_on 3,0
1800 device_selection:
1810 y=0:key$="":bg=0:
1820 While (key$ <> chr$(30) and key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
1830 y = stick(1)
1840 key$ = inkey$
1850 bg = strig(1)
1860 pause 2
1870 wend
1880 if ((y=1) or (y=-1) or (key$=chr$(30)) or (key$=chr$(31)) ) then
1890 select case No
1900 case 1:
1910       No=2:sp_on 1,1:sp_on 0,0:locate 0,11:pause 300:sp_put 1,(5,400),0,0:print "                                ":locate 0,11:print " 2.タブレット端末を選択":goto device_selection:
1920 case 2:
1930       No=1:sp_on 1,0:sp_on 0,1:pause 300:sp_put 0,(5,300),0,0:locate 0,11:print "                                   ":locate 0,11:print " 1.スマートフォンを選択":goto device_selection:
1940 end select
1950 endif
1960 '決定ボタン
1970 if ((bg=2) or (key$=chr$(13)))  then
1980 select case No
1990 case 1:
2000       sp_on 0,0:sp_on 1,0:device_No=1:gosub File_Device_Set:goto TopScreen:
2010 case 2:
2020       sp_on 0,0:sp_on 1,0:device_No=2:gosub File_Device_Set:goto TopScreen:
2030 end select
2040 endif
2050 'Top画面
2060 TopScreen:
2070 'バーチャルパッドを表示
2080 cls 3:font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
2090 'play ""
2100 play ""
2110 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
2120 'gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
2130 select case device_No
2140 case 1:
2150 'Top画面の背景画像
2160 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2170 gload Gazo$ + "downscreen.png",0,0,800
2180 case 2:
2190 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2200 end select
2210 'key$=input$(1)
2220 'バーチャルパッドの背景を白にする for smartphone screen
2230 'gload Gazo$ + "downscreen.png",0,0,800
2240 '選択肢 1
2250 gload Gazo$ + "Selection.png",1,5,300
2260 '選択肢 2
2270 gload Gazo$ + "Selection.png",1,5,400
2280 '選択肢 3
2290 gload Gazo$ + "Selection.png",1,5,500
2300 '選択肢 4
2310 'TopScreen:
2320 'select case device_No
2330 'case 1:
2340 gload Gazo$ + "Selection.png",1,5,590
2350 'case 2:
2360 'gload Gazo$ +
2370 'end select
2380 color rgb(0,0,255)
2390 print chr$(13)
2400 if lang_flag = 1 then
2410 color rgb(255,255,255)
2420 print "Select Number" + chr$(13)
2430 print " :1.Kazutama check" + chr$(13)
2440 print " :2.Setting" + chr$(13)
2450 print " :3.Help" + chr$(13)
2460 print " :4.End Program" + chr$(13)
2470 color rgb(255,255,255)
2480 else
2490 color rgb(255,255,255)
2500 print chr$(13)
2510 sp_on 0,1:sp_put 0,(5,300),0,0
2520 print "番号を選んでください" + chr$(13)
2530 print " :1.数霊(かずたま)チェック" + chr$(13)
2540 print " :2.設定" + chr$(13)
2550 print " :3.ヘルプ" + chr$(13)
2560 print " :4.(プログラムを)終　了する" + chr$(13)
2570 color rgb(0,0,0)
2580 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
2590 'バーチャルパッドを表示
2600 No=1:
2610 'lang_flag:1 外国語,0:日本語
2620 if lang_flag = 1 then
2630 'lang_flag=1 英語
2640 locate 0,15:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
2650 else
2660 'lang_flag=0 日本語
2670 locate 0,15:color rgb(0,0,0):print " 1.数霊(かずたま)チェックを選択";chr$(13)
2680 endif
2690 endif
2700 'TopScreen sprite
2710 'スプライト
2720 '選択肢 1 On
2730 'sp_def 0,(5,300),32,32
2740 'sp_on 0,1
2750 'sp_put 0,(5,300),0,0
2760 '選択肢 2 Off
2770 sp_def 1,(5,400),32,32
2780 sp_on 1,0
2790 sp_put 1,(5,400),0,0
2800 '選択肢 3 Off
2810 sp_def 2,(5,500),32,32
2820 sp_on 2,0
2830 sp_put 2,(5,500),0,0
2840 '選択肢 4 Off
2850 sp_def 3,(5,600),32,32
2860 sp_on 3,0
2870 sp_put 3,(5,600),0,0
2880 color rgb(0,0,0)
2890 Main_Select:
2900 'y:バーチャルパッドの処理
2910 'key$:カーソルの処理
2920 y = 0:key$ = "":bg = 0
2930 while ((key$ <> chr$(31)) and (key$ <> chr$(13)) and (y <> 1) and (y <> -1) and (bg <> 2))
2940 y = stick(1)
2950 key$ = inkey$
2960 bg = strig(1)
2970 pause 2
2980 wend
2990 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
3000 '1.バーチャルパッドの処理
3010 'バーチャルパッド下を押した時
3020 if y = 1 then
3030 select case No
3040 'No の初期値：No=1
3050 case 1:
3060 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
3070 if lang_flag = 1 then
3080 'lang_flag=1 英語
3090 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3100 else
3110 'lang_flag=0 日本語
3120 locate 0,15:print " 2.設定を選択":goto Main_Select:
3130 endif
3140 'デバッグライン　ここから
3150 '0のとき
3160 'デバッグライン　ここまで
3170 'デバッグライン　ここから
3180 'バーチャルパッド　下
3190 case 2:
3200 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:
3210 print "                                         ":
3220 if lang_flag = 1 then
3230 color rgb(0,0,0):locate 0,15:
3240 print "3.It has selected Help":No=3:goto Main_Select:
3250 else
3260 color rgb(0,0,0):locate 0,15:print "                                                         ":locate 0,15:
3270 print " 3.ヘルプを選択":No=3:goto Main_Select:
3280 endif
3290 'デバッグライン　ここまで
3300 case 3:
3310 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                               "
3320 if lang_flag = 1 then
3330 locate 0,15:print "4.It has selected finish program":No=0:goto Main_Select:
3340 else
3350 locate 0,15:print "                                                         " :locate 0,15:print " 4.(プログラムを)終了するを選択":No=0:goto Main_Select:
3360 endif
3370 'デバッグライン　ここから
3380 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
3390 'デバッグライン　ここまで
3400 case 0:
3410 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1
3420 if lang_flag = 1 then
3430 'lang_flag=1:英語
3440 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3450 else
3460 'lang_flag=0:日本語
3470 locate 0,15:print "                                      ":locate 0,15:print " 1.数霊(かずたま)チェックを選択":goto Main_Select:
3480 endif
3490 'デバッグライン　ここから
3500 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
3510 'デバッグライン　ここまで
3520 end select
3530 endif
3540 'バーチャルパッド　上 ここから
3550 if (y = -1) then
3560 select case No
3570 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
3580 case 1:
3590 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                                          "
3600 'if lang_flag = 1 then
3610 'lang_flag=1 英語
3620 'locate 0,15:print "4.It has finished program":goto Main_Select:
3630 'else
3640 'lang_flag=0 日本語
3650 locate 0,15:print "                                                          ":
3660 locate 0,15:print " 4.(プログラムを)終了するを選択":goto Main_Select:
3670 'endif
3680 'endif
3690 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
3700 case 0:
3710 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":
3720 if lang_flag = 1 then
3730 '1:英語
3740 locate 0,15:print "3.It has selected Help":goto Main_Select:
3750 else
3760 '0:日本語
3770 locate 0,15:print "                                                                                        "
3780 locate 0,15:print " 3.ヘルプを選択":goto Main_Select:
3790 endif
3800 'No:3 3.Help→2.設定 No:2
3810 case 3:
3820 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      "
3830 if lang_flag = 1 then
3840 '1:英語
3850 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3860 else
3870 '0:日本語
3880 locate 0,15:print" 2.設定を選択":goto Main_Select:
3890 endif
3900 case 2:
3910 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":
3920 if lang_flag = 1 then
3930 'lang_flag 1 英語
3940 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3950 else
3960 'lang_flag 0 日本語
3970 locate 0,15:print" 1.数霊(かずたま)チェックを選択":goto Main_Select:
3980 endif
3990 end select
4000 endif
4010 if (bg = 2) then
4020 select case No
4030 '1.数霊チェックを選択  パッドの右キー(決定)
4040 case 1:
4050 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4060 '2.設定を選択  パッドの右キー(決定)
4070 case 2:
4080 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
4090 '3.ヘルプを選択 パッドの右(決定)
4100 case 3:
4110 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
4120 'プログラムの終了を選択(決定)
4130 case 0:
4140 cls 3:cls 4:gosub buffer_clear:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":ui_msg buf_finish_Message$:pause 4.080*1000:color rgb(255,255,255):end
4150 'if lang_flag = 1 then
4160 'lang_flag = 1 英語
4170 'else
4180 'lang_flag = 0 日本語
4190 'endif
4200 end select
4210 '4.終了するを選択  パッドの右
4220 endif
4230 'バーチャルパッド　上　ここまで
4240 '2.カーソルの処理
4250 'カーソル　下 chr$(31)
4260 if (key$ = chr$(31)) then
4270 select case (No)
4280 '4
4290 '0 選択肢4 => 選択肢1
4300 case 0:
4310 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "              ":color rgb(0,0,0):
4320 if lang_flag = 1 then
4330 'lang flag:1 英語
4340 else
4350 'lang flag:0 日本語
4360 color rgb(0,0,0):locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4370 endif
4380 '1 選択肢1 => 選択肢2
4390 case 1:
4400 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":
4410 if lang_flag = 1 then
4420 'lang_flag:1 英語
4430 else
4440 'lang_flag:0 日本語
4450 color rgb(0,0,0):locate 0,15:print "2.設定を選択":beep:goto Main_Select:
4460 endif
4470 '2 選択肢2 => 選択肢3
4480 case 2:
4490 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,15:print "               ":
4500 if lang_flag = 1 then
4510 'lang flag:1 英語
4520 else
4530 'lang flang:0 日本語
4540 color rgb(0,0,0):locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4550 endif
4560 '3 選択肢３ => 選択肢4
4570 case 3:
4580 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,595),0,0:locate 0,15:print "               ":color rgb(0,0,0)
4590 if lang_flag = 1 then
4600 'lang_flag = 1 英語
4610 else
4620 'lang_flag = 0 日本語
4630 color rgb(0,0,0):locate 0,15:print "4.終 了を選択":goto Main_Select:
4640 endif
4650 case else:
4660 goto Main_Select:
4670 end select
4680 endif
4690 'カーソル　上
4700 if (key$=chr$(30)) then
4710 select case (No)
4720 '選択肢1 => 選択肢4
4730 case 1:
4740 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:PRINT "                      ":
4750 if lang_flag = 1 then
4760 'lang_flag=1:英語
4770 'print "1.It has selected Kazutama check":goto Main_Select:
4780 else
4790 'lang_flag = 0:日本語
4800 else
4810 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4820 endif
4830 '選択肢2 => 選択肢1
4840 case 2:
4850 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                 ":locate 1,15:print "2.設 定を選択":goto Main_Select:
4860 '選択肢3　=> 選択肢2
4870 case 3:
4880 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,500),0,0
4890 if lang_flag = 1 then
4900 'lang_flag = 1:英語
4910 locate 0,15:print "It has selected Help":goto Main_Select:
4920 else
4930 'lang_flag = 0:日本語
4940 locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4950 endif
4960 '選択肢4 => 選択肢3
4970 case 0:
4980 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                ":locate 1,15:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
4990 if lang_flag = 1 then
5000 'lang flag=1 英語
5010 else
5020 'lang flag=0 日本語
5030 locate 1,15:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
5040 endif
5050 end select
5060 endif
5070 'Input "番号:",No
5080 'エンターキー入力:決定
5090 if (key$ = chr$(13)) then
5100 select case No
5110 case 1:
5120 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
5130 case 3:
5140 Color rgb(255,255,255):goto Help:
5150 case 0:
5160 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg buf_finish_Message$:color rgb(255,255,255):pause 4.080 * 1000:end
5170 case 2:
5180 color rgb(255,255,255):sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
5190 end select
5200 endif
5210 '1-1.数霊チェック
5220 Surei_Check:
5230 cls 3:Font 48:
5240 select case device_No
5250  case 1:
5260 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5270 gload Gazo$ + "downscreen.png",0,0,800
5280 case 2:
5290 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5300 end select
5310 play ""
5320 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
5330 color rgb(255,0,0)
5340 'print "●数霊(かずたま)チェックトップ" + chr$(13)
5350 sp_on 0,1:sp_put 0,(5,300),0,0:screen 1,1,1
5360 if lang_flag = 1 then
5370 'lang_flag=1 英語
5380 else
5390 'lang_flag=0 日本語
5400 print chr$(13)+chr$(13)+chr$(13)
5410 color rgb(255,255,255)
5420 print "番号を選んでください" + chr$(13)
5430 print " :1.数霊(かずたま)1人用" + chr$(13)
5440 print " :2.数霊(かずたま)リスト 1人用　" + chr$(13)
5450 print " :3.数霊(かずたま)2人用" + chr$(13)
5460 print " :4.トップ画面に行く" + chr$(13)
5470 color rgb(0,0,0):No = 1
5480 locate 0,15:print "                                       "
5490 locate 0,15
5500 print " 1.数霊(かずたま)1人用を選択"
5510 endif
5520 Kazutama_main:
5530 'y:バーチャルパッドの処理
5540 'key$:カーソルの処理
5550 'bg:バーチャルパッドの右のボタン
5560 y = 0:key$ = "":bg=0
5570 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
5580 y = stick(1)
5590 key$ = inkey$
5600 bg=strig(1)
5610 y=stick(-1)
5620 pause 2
5630 wend
5640 'key$ = input$(1)
5650 if (y = 1) then
5660 select case No
5670 'No の初期値：No=1
5680 case 2:
5690 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                       ":
5700 locate 0,15:print "                                     "
5710 locate 0,15
5720 print" 3.数霊(かずたま)2人用を選択":goto Kazutama_main:
5730 'デバッグライン　ここから
5740 '0のとき
5750 'デバッグライン　ここまで
5760 'デバッグライン　ここから
5770 case 3:
5780 sp_on 2,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_on 0,1:sp_put 0,(5,585),0,0:pause 200:locate 0,15:print "                                               "
5790 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":No=0:goto Kazutama_main:
5800 'デバッグライン　ここまで
5810 'デバッグライン　ここから
5820 'デバッグライン　ここまで
5830 case 0:
5840 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5850 case 1:
5860 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                          ":locate 0,15:print " 2.数霊（かずたま）リスト 1人用":goto Kazutama_main:
5870 'デバッグライン　ここから
5880 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
5890 'デバッグライン　ここまで
5900 end select
5910 endif
5920 'バーチャルパッド　上 ここから
5930 if (y = -1) then
5940 select case No
5950 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
5960 case 1:
5970 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 0,15:print" 4.トップ画面に行くを選択":goto Kazutama_main:
5980 'No:3 3.Help→2.設定 No:2
5990 case 0:
6000 sp_on 1,0:sp_on 0,0:sp_on 3,1:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                     ":locate 0,15:print" 3.数霊（かずたま）2人用を選択":goto Kazutama_main:
6010 case 2:
6020 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                    ":locate 0,15:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
6030 case 3:
6040 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                               ":locate 0,15:print "2.数霊(かずたま)リスト1人用を選択":goto Kazutama_main:
6050 end select
6060 endif
6070 if (bg=2) then
6080 select case No
6090 '1.数霊チェックを選択  パッドの右キー
6100 case 1:
6110 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
6120 '2.数霊チェック2人用   パッドの右キー
6130 case 3:
6140 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
6150 '3.トップ画面に行く パッドの右
6160 case 0:
6170 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
6180 '2.数霊リスト1人用 パッドの右キー
6190 case 2:
6200 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_List1:
6210 'プログラムの終了を選択
6220 end select
6230 '4.終了するを選択  パッドの右
6240 endif
6250 'バーチャルパッド　上　ここまで
6260 if (key$ = chr$(31)) then
6270 select case No
6280 case 0:
6290 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,15:print "                                                          ":
6300 if lang_flag = 1 then
6310 Else
6320 locate 0,15:print "                                      "
6330 No=2:locate 0,15:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
6340 endif
6350 case 1:
6360 No=0:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,585),0,0:locate 0,12:print "                                                          ":
6370 if lang_flag = 1 then
6380 Else
6390 locate 0,15:print"                                      "
6400 locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
6410 endif
6420 case 2:
6430 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                      ":
6440 if lang_flag = 1 then
6450 Else
6460 No=1:locate 0,15:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
6470 endif
6480 end select
6490 endif
6500 if (key$=chr$(13)) then
6510 select case No
6520 case 1:
6530 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
6540 case 2:
6550 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
6560 case 3:
6570 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
6580 '終了はトップメニューのみにする
6590 end select
6600 endif
6610 '前の画面に戻る
6620 'プログラムの終了
6630 '1人用
6640 '2人用
6650 '数霊(かずたま) 文字入力  1人用
6660 Surei_Input:
6670 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
6680 if mode = 0 then
6690 cls 3:font 32:init"kb:2"
6700 select case device_No
6710 case 1:
6720 gload Gazo$ + "InputKotodama_20230131.png",0,0,0
6730 gload Gazo$ + "CenterScreen_20230401.png",0,0,380
6740 case 2:
6750 gload Gazo$ + "InputKotodama_20230131.png",0,0,0
6760 end select
6770 play""
6780 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
6790 color rgb(255,0,0)
6800 if lang_flag=1 then
6810 '英語
6820 else
6830 print chr$(13)+chr$(13)+chr$(13)
6840 color rgb(255,255,255)
6850 print "文字を入れてください" + chr$(13)
6860 color rgb(255,255,255)
6870 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
6880 print chr$(13)
6890 color rgb(0,0,0)
6900 Input "入力文字:",buffer_moji$
6910 if buffer_moji$ = "" then
6920 ui_msg "未入力です":goto Surei_Input:
6930 else
6940 goto Surei_Result:
6950 endif
6960 endif
6970 endif
6980 if mode = 1 then
6990 cls 3:Font 32:
7000 gload Gazo$ + "InputKotodama.png"
7010 color rgb(255,0,0)
7020 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
7030 color rgb(255,255,255)
7040 print "文字を入れてください" + chr$(13)
7050 color rgb(255,0,0)
7060 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
7070 print "大文字のみ)" + chr$(13)
7080 color rgb(0,0,0)
7090 Input "文字入力:",buffer_moji2$
7100 goto Surei_Result3:
7110 'endif
7120 endif
7130 '数霊(かずたま)文字入力　2人用
7140 Surei_twoParson:
7150 cls 3:Font 32:init"kb:2"
7160 gload Gazo$ + "InputKotodama_20230131.png"
7170 '1人目入力
7180 if lang_flag = 1 then
7190 else
7200 print ""+chr$(13)+chr$(13)+chr$(13)
7210 color rgb(255,255,255)
7220 print "1人目の文字を入れてください" + chr$(13)
7230 color rgb(255,255,255)
7240 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
7250 color rgb(0,0,0)
7260 print chr$(13)
7270 Input "1人目文字入力:",buf_Parson1$
7280 endif
7290 Surei_twoParson2:
7300 cls 3:Font 32:init"kb:2"
7310 '2人目入力
7320 gload Gazo$ + "InputKotodama_20230131.png"
7330 if lang_falg = 1 then
7340 else
7350 print ""+chr$(13)+chr$(13)+chr$(13)
7360 color rgb(255,255,255)
7370 print "2人目の文字を入れてください" + chr$(13)
7380 color rgb(255,255,255)
7390 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
7400 color rgb(0,0,0)
7410 Input "2人目の文字入力:",buf_Parson2$
7420 goto Surei_Result2:
7430 endif
7440 '数霊　計算 パート
7450 '文字の計算関数
7460 'moji$:1文字を入れる
7470 func Complate(moji$)
7480 for n = 1 to 116
7490 if moji$ = bufline$(2*n) then
7500 buffcount = val(bufline$(2 * n + 1))
7510 endif
7520 next n
7530 endfunc buffcount
7540 '数霊　結果表示
7550 Surei_Result:
7560 cls 3:Font 32
7570 'ゼロカウント:zcount
7580 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
7590 '例 アカい:"い"の文字は無効な文字なので、はじく
7600 zcount=0
7610 'mojicount:入力文字数
7620 mojicount = len(buffer_moji$)
7630 for n=1 to mojicount
7640 for j=1 to 118
7650 if (bufcount$(n - 1) = bufline$(2 * j)) then
7660 bufcount$(n-1) = Mid$(buffer_moji$,n,1)
7670 endif
7680 next j
7690 next n
7700 ncount=0:count=0
7710 for i = 1 to mojicount
7720 bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7730 'ンのカウント
7740 if (bufcount$(i-1) = "ン") then ncount = ncount + 1
7750 next i
7760 if (ncount > 0) then
7770 'Listを表示する
7780 moji_List$(0) = "この単語は目に見える物です"
7790 moji_List$(1) = "この単語は目に見えない物です"
7800 num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
7810 if (num2 = 0) then
7820 else
7830 if (num2 = 1) then
7840 n1 = 9 * ncount
7850 endif
7860 endif
7870 endif
7880 for j=1 to mojicount
7890 bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7900 count = count + Complate(bufcount$(j - 1))
7910 next j
7920 count = count + n1
7930 if (ncount > 0) then count = count
7940 '182以上のとき,181を引く
7950 if buf_cofig_r = 0 then
7960 if (count > 181) then
7970 count = count - 181
7980 else
7990 if (buf_config_r = 1) then
8000 buf_count = Single_Complate(count)
8010 endif
8020 endif
8030 endif
8040 cls 3:Font 48+16
8050 gload Gazo$ + "Result_Screen3_20230319.png"
8060 if buf_config_r = 1 then
8070 print "入力文字:" + buffer_moji$ + chr$(13)
8080 print "数霊(かずたま):";buf_count;chr$(13)
8090 endif
8100 if lang_flag = 1 then
8110 else
8120 color rgb(255,0,0)
8130 print "入力文字:" + buffer_moji$ + chr$(13)
8140 endif
8150 if lang_flag = 1 then
8160 else
8170 color rgb(0,0,255)
8180 print "数霊(かずたま):";count;chr$(13)
8190 endif
8200 if lang_flag = 1 then
8210 else
8220 color rgb(0,0,0)
8230 print "エンター or スペース" + chr$(13)
8240 print  chr$(13)
8250 'endif
8260 endif
8270 key$ = input$(1)
8280 if ((key$ = chr$(13)) or (key$=" ")) then
8290 List$(0)="1.もう一度数霊を見る"
8300 List$(1)="2.トップ画面に行く"
8310 List$(2)="3.この数霊の説明を見る"
8320 List$(3)="4.数霊データーを保存"
8330 num=ui_select("List$","番号を選んでください")
8340 select case num
8350 case 0:
8360 goto Surei_Input:
8370 case 1:
8380 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
8390 for i=0 to 9
8400 bufcount$(i)=""
8410 next i
8420 goto TopScreen:
8430 case 2:
8440 goto Surei_Result4:
8450 case 3:
8460 s=Surei_Result_Save_File()
8470 ui_msg "保存しました"
8480 case -1:
8490 'goto Surei_Result:
8500 case else:
8510 goto Surei_Result:
8520 end select
8530 'ファイルを保存する
8540 else
8550 goto Surei_Result:
8560 endif
8570 '3-1 バージョン情報
8580 Version:
8590 cls 3:Font 32
8600 select case device_No
8610 case 1:
8620 gload Gazo$ + "Screen1_Version.png"
8630 gload Gazo$ + "downscreen.png",0,0,800
8640 case 2:
8650 gload Gazo$ + "Screen1_version.png"
8660 end select
8670 play ""
8680 play Voice_File_TopScreen$ + "Voice_Version.mp3"
8690 color rgb(255,0,0)
8700 print chr$(13)
8710 color rgb(255,255,255)
8720 if lang_flag = 1 then
8730 else
8740 print chr$(13)+chr$(13)+chr$(13)
8750 print "Ver:";Version$ + chr$(13)
8760 print "アプリ名:数霊計算機" + chr$(13)
8770 print "Basic for Android Runtime" + chr$(13)
8780 print "Author:licksjp" + chr$(13)
8790 print "制作開始:2021.7.28" + chr$(13)
8800 print chr$(13)
8810 print "(C)Copy right licksjp " + chr$(13)
8820 print "All rights reserved" + chr$(13)
8830 print chr$(13)
8840 color rgb(0,0,0)
8850 print "パッドの右を押してください" + chr$(13)
8860 endif
8870 bg=0:key$=""
8880 while (bg <> 2 and key$ <> chr$(13))
8890 bg = strig(1)
8900 key$ = inkey$
8910 pause 2
8920 wend
8930 if key$ = chr$(13) then
8940 goto TopScreen:
8950 else
8960 if bg=2 then
8970 goto TopScreen:
8980 else
8990 if lang_flag = 1 then
9000 else
9010 talk "無効なキーです":goto Version:
9020 endif
9030 endif
9040 endif
9050 '3-2 参考文献
9060 Reference_Book:
9070 cls 3:Font 48:play""
9080 select case device_No
9090 case 1:
9100 gload Gazo$ + "Screen1_Reference.png"
9110 gload Gazo$ + "downscreen.png",0,0,800
9120 case 2:
9130 gload Gazo$ + "Screen1_Reference.png"
9140 end select
9150 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
9160 color rgb(255,0,0)
9170 print chr$(13)+chr$(13)
9180 if lang_flag = 1 then
9190 else
9200 color rgb(255,255,255)
9210 print "書名:数霊" + chr$(13)
9220 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
9230 print "出版社:徳間書店" + chr$(13)
9240 print "ISBN:978-4-19-" + chr$(13)
9250 print "         865309-5" + chr$(13)
9260 print "定価:2300円 + 税" + chr$(13)
9270 color rgb(0,0,0)
9280 print "パッドの右を押してください"
9290 endif
9300 bg = 0:key$ = ""
9310 while (bg <> 2 and key$ <> chr$(13))
9320 bg = strig(1)
9330 key$ = inkey$
9340 pause 2
9350 wend
9360 if key$ = chr$(13) then
9370 goto TopScreen:
9380 else
9390 if bg = 2 then
9400 goto TopScreen:
9410 else
9420 talk "無効なキーです":goto Reference_Book:
9430 endif
9440 endif
9450 'ヘルプ画面　トップ画面
9460 Help:
9470 No=1:c=0
9480 play ""
9490 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
9500 cls 3:Font 48:
9510 select case device_No
9520 case 1:
9530 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9540 gload Gazo$ + "downscreen.png",0,0,800
9550 case 2:
9560 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9570 end select
9580 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0
9590 color rgb(255,0,0)
9600 print chr$(13)+chr$(13)+chr$(13)
9610 color rgb(255,255,255)
9620 print "番号を選んでください" + chr$(13)
9630 print " :1.バージョン" + chr$(13)
9640 print " :2.参考文献" + chr$(13)
9650 print " :3.データーの初期化"+chr$(13)
9660 print " :4.トップ画面に行く" + chr$(13)
9670 color rgb(0,0,0)
9680 locate 0,15:print "                                     "
9690 if No = 1 then locate 0,15:print " 1.バージョンを選択"
9700 'y:バーチャルパッドの処理
9710 'key$:カーソルの処理
9720 'bg:バーチャルパッドの右ボタン
9730 Help_key:
9740 y = 0:key$ = "":bg = 0
9750 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
9760 y = stick(1)
9770 key$ = inkey$
9780 bg = strig(1)
9790 pause 2
9800 wend
9810 'バーチャルパッド　ここから'
9820 if (y = 1) then
9830 select case No
9840 'No の初期値：No=1
9850 case 1:
9860 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
9870 if lang_flag = 1 then
9880 else
9890 locate 0,15:print" 2.参考文献を選択":goto Help_key:
9900 endif
9910 'デバッグライン　ここから
9920 '0のとき
9930 'デバッグライン　ここまで
9940 'デバッグライン　ここから
9950 case 3:
9960 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:No=0:pause 200:locate 0,15:print "                                                          "
9970 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":goto Help_key:
9980 'デバッグライン　ここまで
9990 'デバッグライン　ここから
10000 'デバッグライン　ここまで
10010 case 2:
10020 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 0,15:print "                                                          ":color rgb(0,0,0):locate 0,15:print "3.データーの初期化を選択":No=3:goto Help_key:
10030 case 0:
10040 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10050 'デバッグライン　ここから
10060 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
10070 'デバッグライン　ここまで
10080 end select
10090 endif
10100 'バーチャルパッド　上 ここから
10110 if (y = -1) then
10120 select case No
10130 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
10140 case 1:
10150 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                                           ":locate 0,15:print" 4.トップ画面に行くを選択":goto Help_key
10160 'No:3 3.Help→2.設定 No:2
10170 case 3:
10180 sp_on 1,0:sp_on 0,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                                          ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
10190 case 2:
10200 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                                          ":locate 0,15:print" 1.バージョンを選択":goto Help_key:
10210 case 0:
10220 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                                          ":locate 0,15:print" 3.データーの初期化を選択":goto Help_key:
10230 end select
10240 endif
10250 if (bg = 2) then
10260 select case No
10270 '1.数霊チェックを選択  パッドの右キー
10280 case 1:
10290 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
10300 '2.設定を選択    パッドの右キー
10310 case 2:
10320 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
10330 '3.データーの初期化
10340 case 3:
10350 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto data_initialize:
10360 '4.ヘルプを選択 パッドの右
10370 case 0:
10380 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
10390 'プログラムの終了を選択
10400 'if lang_flag = 1 then
10410 'lang_flag = 1:英語
10420 'Else
10430 'lang_flag = 0:日本語
10440 'endif
10450 end select
10460 '4.終了するを選択  パッドの右
10470 endif
10480 'バーチャルパッド　上　ここまで
10490 'バーチャルパッド　ここまで'
10500 'key$ = input$(1)
10510 'カーソルの下
10520 if key$ = chr$(31) then
10530 select case (No Mod 4)
10540 'バージョンから参考文献
10550 case 0:
10560 c=1:No=c:locate 0,15:Print "             ":locate 0,15:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
10570 '参考文献からトップ画面
10580 case 1:
10590 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "            ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10600 'トップ画面から終了
10610 '終了からバージョン
10620 case 2:
10630 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                     ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10640 case else:
10650 goto Help_key:
10660 end select
10670 endif
10680 'カーソル　上
10690 if (key$ = chr$(30)) then
10700 select case (c Mod 4)
10710 'バージョンから終了
10720 case 0:
10730 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:locate 0,15:print "                   ":locate 0,15:print " 4.終 了を選択":goto Help_key:
10740 '参考文献からバージョン
10750 case 1:
10760 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                   ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10770 'トップ画面から参考文献
10780 case 2:
10790 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":locate 0,15:print " 2.参考文献を選択":goto Help_key:
10800 '終了からトップ画面を選択
10810 case 3:
10820 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print"                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10830 case else:
10840 goto Help_key:
10850 end select
10860 endif
10870 'エンターキー：決定
10880 if (key$ = chr$(13)) then
10890 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10900 if No=0 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10910 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10920 else
10930 goto Help_key:
10940 endif
10950 '登録文字の確認
10960 '文字を1文字入れて登録されているか調べるメニュー
10970 '設定項目
10980 Setting:
10990 cls 3:Font 48
11000 select case device_No
11010 case 1:
11020 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
11030 gload Gazo$ + "downscreen.png",0,0,800
11040  case 2:
11050 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
11060 end select
11070 play ""
11080 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
11090 No=1
11100 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:
11110 color rgb(0,0,255)
11120 print chr$(13)
11130 if lang_flag = 1 then
11140 'lang_flag = 1:英語
11150 else
11160 'lang_flag = 0:日本語
11170 color rgb(255,255,255)
11180 print chr$(13)
11190 print "番号を選んでください" + chr$(13)
11200 '-------コメント----------------
11210 'print " :1.登録文字の確認" + chr$(13)
11220 'print " :2.数霊文字確認" + chr$(13)
11230 '-------コメント----------------
11240 'print chr$(13)
11250 print " :1.文字の項目" + chr$(13)
11260 print " :2.結果表示設定" + chr$(13)
11270 print " :3.言語設定" + chr$(13)
11280 print " :4.トップ画面に行く" + chr$(13)
11290 endif
11300 color rgb(0,0,0)
11310 locate 0,15
11320 if No=1 then locate 0,15:print  "                                     ":locate 0,15:print " 1.文字の項目を選択"
11330 'y:バーチャルパッドの処理
11340 'key$:カーソルの処理
11350 'bg:バーチャルパッドの右ボタン
11360 SettingScreen:
11370 y = 0:key$ = "":bg=0
11380 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
11390 y = stick(1)
11400 key$ = inkey$
11410 bg=strig(1)
11420 pause 2
11430 wend
11440 'バーチャルパッド　ここから'
11450 'バーチャルパッド　ここから'
11460 if (y = 1) then
11470 select case No
11480 'No の初期値：No=1
11490 case 1:
11500 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":color rgb(0,0,0):locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11510 'デバッグライン　ここから
11520 '0のとき
11530 'デバッグライン　ここまで
11540 'デバッグライン　ここから
11550 case 2:
11560 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                         "
11570 color rgb(0,0,0)::No=3
11580 if lang_flag = 1 then
11590 else
11600 locate 1,15:print "3.言語設定を選択":goto SettingScreen:
11610 endif
11620 'デバッグライン　ここまで
11630 case 3:
11640 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                              ":locate 1,15:print "4.トップ画面に行くを選択":No=0:goto SettingScreen:
11650 'デバッグライン　ここから
11660 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11670 'デバッグライン　ここまで
11680 case 0:
11690 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
11700 'デバッグライン　ここから
11710 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11720 'デバッグライン　ここまで
11730 end select
11740 endif
11750 'バーチャルパッド　上 ここから
11760 if (y = -1) then
11770 select case No
11780 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11790 case 1:
11800 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 1,15:print"4.トップ画面に行くを選択":goto SettingScreen:
11810 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11820 case 0:
11830 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 1,15:print"3.言語設定を選択":goto SettingScreen:
11840 'No:3 3.Help→2.設定 No:2
11850 case 3:
11860 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.結果表示設定を選択":goto SettingScreen:
11870 case 2:
11880 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 1,15:print"1.文字の項目を選択":goto SettingScreen:
11890 end select
11900 endif
11910 if (bg=2) then
11920 select case No
11930 '1.数霊チェックを選択  パッドの右キー
11940 case 1:
11950 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
11960 '2.設定を選択    パッドの右キー
11970 case 2:
11980 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
11990 '3.ヘルプを選択 パッドの右
12000 case 0:
12010 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
12020 'プログラムの終了を選択
12030 case 3:
12040 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Setting_Language:
12050 end select
12060 endif
12070 '4.終了するを選択  パッドの右
12080 'バーチャルパッド　ここまで'
12090 'カーソル下'
12100 if (key$ = chr$(31)) then
12110 select case (No Mod 4)
12120 '登録文字から数霊文字の確認
12130 case 1:
12140 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                     ":locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
12150 '数霊文字の確認からトップ画面に行く
12160 case 2:
12170 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "                                     ":locate 1,15:print"3.言語設定を選択":goto SettingScreen:
12180 'トップ画面に行くから終了
12190 case 3:
12200 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,590),0,0:locate 0,15:print "                                       ":locate 1,15:print "4.トップ画面に行くを選択":goto SettingScreen:
12210 '終了から登録文字
12220 case 0:
12230 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
12240 end select
12250 endif
12260 'カーソル　上
12270 if (key$ = chr$(30)) then
12280 select case (No Mod 4)
12290 case 1:
12300 c=2:No=c:sp_on 0,1:sp_put 0,(5,300),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
12310 case 2:
12320 c=3:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
12330 case 3:
12340 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:goto SettingScreen:
12350 case 0:
12360 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,590),0,0:sp_on 0,0:goto SettingScreen:
12370 end select
12380 endif
12390 'エンターキーを押したとき
12400 if (key$ = chr$(13)) then
12410 if (No=3) then goto Setting_Language:
12420 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
12430 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
12440 if (No=0) then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
12450 endif
12460 '文字検索項目  ここから
12470 Moji_Search:
12480 cls 4:cls 3:Font 32+16:init"kb:2"
12490 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12500 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12510 play ""
12520 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
12530 print "" + chr$(13)
12540 color rgb(255,255,255)
12550 if lang_flag = 1 then
12560 Else
12570 print "文字を一文字入れてください" + chr$(13)
12580 endif
12590 color rgb(0,0,0)
12600 if lang_flag=1 then
12610 Else
12620 Input "登録文字:",moji$
12630 endif
12640 moji_count = len(moji$)
12650 if moji_count > 1 then
12660 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Moji_Search:
12670 else
12680 count=0
12690 for n = 0 to 116
12700 if bufline$(2*n) = moji$ then
12710 cls 3:font 48:init"kb:4"
12720 select case device_No
12730 case 1:
12740 gload Gazo$ + "downscreen.png",0,0,800
12750 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12760 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12770 case 2:
12780 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12790 end select
12800 play ""
12810 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12820 if lang_flag = 1 then
12830 Else
12840 print chr$(13)
12850 color rgb(255,255,255)
12860 print moji$;"は、登録されています。" + chr$(13)
12870 color rgb(0,0,0)
12880 print "ジョイパッドの右を押してください"
12890 endif
12900 bg = 0:key$ = ""
12910 while (bg <> 1 and key$ <> chr$(13))
12920 key$ = inkey$
12930 bg = strig(1)
12940 pause 2
12950 wend
12960 if key$ = chr$(13) then goto TopScreen:
12970 if bg=1 then goto TopScreen:
12980 count = count + 1
12990 endif
13000 next n
13010 if count = 0 then
13020 cls 3:font 48:init "kb:4"
13030 gload Gazo$ + "Moji_check.png"
13040 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
13050 play ""
13060 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
13070 print chr$(13)
13080 if lang_flag = 1 then
13090 Else
13100 color rgb(255,255,255)
13110 print moji$;"は、登録されていません。" + chr$(13)
13120 color rgb(0,0,0)
13130 print "パッドの右を押してください" + chr$(13)
13140 endif
13150 bg = 0:key$ = ""
13160 while (kg <> 1 and key$ <> chr$(13))
13170 key$ = inkey$
13180 bg = strig(1)
13190 pause 2
13200 wend
13210 if ((key$ = chr$(13)) or (bg=2)) then goto TopScreen:
13220 endif
13230 endif
13240 Surei_Result2:
13250 cls 3:Font 48
13260 zcount1=0:zcount2=0:count1=0:count2=0
13270 '1人目
13280 mojicount1=len(buf_Parson1$)
13290 '2人目
13300 mojicount2 = len(buf_Parson2$)
13310 '1人目
13320 for n = 1 to mojicount1
13330 for j = 1 to 116
13340 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
13350 if bufcount1$(n-1) = bufline$(2*j) then
13360 zcount1 = zcount1 + 1
13370 endif
13380 next j
13390 next n
13400 '2人目
13410 for n = 1 to mojicount2
13420 for j = 1 to 116
13430 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
13440 if bufcount2$(n-1) = bufline$(2*j) then
13450 zount2 = zcount2 + 1
13460 endif
13470 next j
13480 next n
13490 '1人目
13500 for i=1 to mojicount1
13510 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
13520 p1 = Complate(bufcount1$(i-1))
13530 count1 = count1 + p1
13540 next i
13550 '2人目
13560 for i = 1 to mojicount2
13570 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
13580 p2 = Complate(bufcount2$(i-1))
13590 count2 = count2 + p2
13600 next i
13610 cls 3:
13620 select case device_No
13630 case 1:
13640 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
13650 gload Gazo$ + "downscreen.png",0,0,800
13660 case 2:
13670 gload Gazo$ + "downscreen.png",0,0,0
13680 end select
13690 color rgb(255,0,0)
13700 print ""+chr$(13)
13710 if lang_flag = 1 then
13720 else
13730 color rgb(255,255,255)
13740 print chr$(13)+chr$(13)
13750 print "1人目:";buf_Parson1$;chr$(13)
13760 print "数霊1:";count1;chr$(13)
13770 print "2人目:";buf_Parson2$;chr$(13)
13780 print "数霊2:";count2;chr$(13)
13790 print "数霊(合計):";count1 + count2;chr$(13)
13800 color rgb(0,0,0)
13810 print "バーチャルパッドの右" + chr$(13)
13820 endif
13830 key$ = "":bg = 0
13840 while (bg <> 2 and key$ <> chr$(13))
13850 bg = strig(1)
13860 key$ = inkey$
13870 pause 2
13880 wend
13890 if (bg = 2 or key$ = chr$(13))  then goto TopScreen:
13900 Surei_Result3:
13910 cls 3:Font 48
13920 zcount2 = 0:count2 = 0
13930 mojicount2 = len(buffer_moji2$)
13940 for n = 1 to mojicount2
13950 for j = 1 to 116
13960 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
13970 if bufcount2$(n - 1) = bufline$(2 * j) then
13980 zcount2 = zcount2 + 1
13990 endif
14000 next j
14010 next n
14020 for i = 1 to mojicount2
14030 n2 = Complate(bufcount2$(i-1))
14040 count2 = count2 + n2
14050 next i
14060 gload Gazo$ + "Screen5.png"
14070 if lang_flag = 1 then
14080 else
14090 color rgb(255,0,0)
14100 print "数霊の結果表示" + chr$(13)
14110 color rgb(255,255,255)
14120 print "１回目回の文字入力:";buffer_moji$;chr$(13)
14130 print "１回目の数霊(かずたま)";count;chr$(13)
14140 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
14150 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
14160 color rgb(0,0,0)
14170 print "エンターキー:トップ画面";chr$(13)
14180 print "c or C キー:数霊の比較";chr$(13)
14190 endif
14200 key$ = "":bg = 0
14210 while (key$ <> chr$(13) and bg <> 2)
14220 bg = strig(1)
14230 key$ = inkey$
14240 pause 2
14250 wend
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
14530 if (n = 118) then
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
14650 while ((key$ <> chr$(13)) and (bg <> 2))
14660 key$=inkey$
14670 bg=strig(1)
14680 pause 2
14690 wend
14700 if ((bg = 2) or (key$=chr$(13))) then
14710 goto TopScreen:
14720 else
14730 goto Moji_Count_Check:
14740 endif
14750 'Save 関数
14760 file_kazutama = 0
14770 file_kazutama = Save_File()
14780 func Save_File()
14790 open SAVE_DATA1$  for output as #1
14800 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
14810 close #1
14820 endfunc
14830 Select_moji:
14840 cls 3:font 48:No = 1
14850 select case device_No
14860 case 1:
14870 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
14880 gload Gazo$ + "downscreen.png",0,0,800
14890 case 2:
14900 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
14910 end select
14920 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
14930 color rgb(255,0,0)
14940 if lang_flag = 1 then
14950 else
14960 play ""
14970 play Voice_File_TopScreen$ + "Voice_Select_Moji20230217.mp3"
14980 print chr$(13)+chr$(13)+chr$(13)
14990 color rgb(255,255,255)
15000 print "番号を選んでください" + chr$(13)
15010 print " :1.登録文字検索"+ chr$(13)
15020 print " :2.登録文字数の確認" + chr$(13)
15030 print " :3.数字から数霊の説明"+chr$(13)
15040 print " :4.トップ画面に戻る" + chr$(13)
15050 color rgb(0,0,0)
15060 locate 0,15
15070 if No = 1 then print " 1.登録文字検索を選択"
15080 endif
15090 Entry_check_key:
15100 y = 0:key$ = "":bg=0
15110 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
15120 y = stick(1)
15130 key$ = inkey$
15140 bg=strig(1)
15150 pause 2
15160 wend
15170 'バーチャルパッド　ここから'
15180 'バーチャルパッド　ここから'
15190 if y = 1 then
15200 select case No
15210 'No の初期値：No=1
15220 case 1:
15230 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print "2.登録文字数の確認を選択":goto Entry_check_key:
15240 'デバッグライン　ここから
15250 '0のとき
15260 'デバッグライン　ここまで
15270 'デバッグライン　ここから
15280 case 2:
15290       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 0,15:print "                                                         ":No=3:locate 0,15:print"3.数字から数霊の説明を選択":goto Entry_check_key:
15300 case 3:
15310 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:locate 0,15:print "                                       "
15320 :No=0
15330 'if lang_flag = 1 then
15340 'Else
15350 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に戻るを選択":goto Entry_check_key:
15360 'endif
15370 'cls:color rgb(255,255,255):print"ok"
15380 'デバッグライン　ここまで
15390 'デバッグライン　ここから
15400 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
15410 'デバッグライン　ここまで
15420 case 0:
15430 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.登録文字検索を選択":goto Entry_check_key:
15440 'デバッグライン　ここから
15450 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
15460 'デバッグライン　ここまで
15470 end select
15480 endif
15490 'バーチャルパッド　上 ここから
15500 if y = -1 then
15510 select case No
15520 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15530 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15540 case 0:
15550       sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print "                                      ":locate 0,15:print "3.数字から数霊の説明を選択":goto Entry_check_key:
15560 case 1:
15570 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print"3.トップ画面に戻るを選択":goto Entry_check_key:
15580 'No:3 3.Help→2.設定 No:2
15590 case 3:
15600 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
15610 case 2:
15620 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print "1.登録文字検索を選択":goto Entry_check_key:
15630 end select
15640 endif
15650 if bg=2 then
15660 select case No
15670 '1.数霊チェックを選択  パッドの右キー
15680 case 1:
15690 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15700 '2.設定を選択    パッドの右キー
15710 case 2:
15720 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15730 '3.ヘルプを選択 パッドの右
15740 case 0:
15750 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15760 case 3:
15770 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Input_numbertokazutama:
15780 end select
15790 endif
15800 '4.終了するを選択  パッドの右
15810 'バーチャルパッド　ここまで'
15820 'key$ = input$(1)
15830 'カーソルの下
15840 if key$ = chr$(31) then
15850 select case (No Mod 4)
15860 case 0:
15870 c=1:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
15880 case 1:
15890 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,500),0,0:sp_on 3,0:goto Entry_check_key:
15900 case 2:
15910 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:goto Entry_check_key:
15920 case 3:
15930 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
15940 end select
15950 endif
15960 'カーソル　上
15970 if key$ = chr$(30) then
15980 select case (No Mod 4)
15990 case 0:
16000 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
16010 case 1:
16020 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
16030 case 2:
16040 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
16050 case 3:
16060 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
16070 end select
16080 endif
16090 'エンターキーを押す
16100 if key$ = chr$(13) then
16110 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
16120 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
16130 if No = 0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16140 endif
16150 '
16160 Kakunin_Surei_count:
16170 cls 3:font 48:No=0
16180 select case device_No
16190 case 1:
16200 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
16210 'gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
16220 gload Gazo$ + "downscreen.png",0,0,800
16230 case 2:
16240 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
16250  end select
16260 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
16270 color rgb(255,0,0)
16280 print chr$(13)+chr$(13)+chr$(13)
16290 color rgb(255,255,255)
16300 print "番号を選んでください" + chr$(13)
16310 print " :1.数霊リスト 1人用" + chr$(13)
16320 print " :2.結果表示設定" + chr$(13)
16330 print " :3.トップ画面に行く" + chr$(13)
16340 print "" + chr$(13)
16350 color rgb(0,0,0)
16360 locate 0,15:print"                                                         "
16370 if No = 0 then locate 1,15:print "1.数霊リスト　1人用を選択"
16380 Entry_List:
16390 y = 0:key$ = "":bg=0
16400 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
16410 y = stick(1)
16420 key$ = inkey$
16430 bg = strig(1)
16440 pause 2
16450 wend
16460 'バーチャルパッド　ここから'
16470 'バーチャルパッド　ここから'
16480 'バーチャルパッド　下
16490 if y = 1 then
16500 select case No
16510 'No の初期値：No=1
16520 case 0:
16530 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=1:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.結果表示設定を選択":goto Entry_List:
16540 'デバッグライン　ここから
16550 '0のとき
16560 'デバッグライン　ここまで
16570 'デバッグライン　ここから
16580 'color rgb(0,0,0):locate 0,15:print " 4.終了を選択":goto Entry_List:
16590 'cls:color rgb(255,255,255):print"ok"
16600 'デバッグライン　ここまで
16610 case 2:
16620 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,300),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 1.数霊リスト 1人用を選択":No=0:goto Entry_List:
16630 case 1:
16640 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                      ":No=2:locate 1,15:print "3．トップ画面に行くを選択":goto Entry_List:
16650 'デバッグライン　ここから
16660 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
16670 'デバッグライン　ここまで
16680 'デバッグライン　ここから
16690 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
16700 'デバッグライン　ここまで
16710 end select
16720 endif
16730 'バーチャルパッド　上 ここから
16740 if y = -1 then
16750 select case No
16760 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
16770 case 2:
16780 sp_on 2,0:sp_on 0,0:sp_on 1,1:sp_on 3,0:sp_put 1,(5,400),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 2.結果表示設定を選択":goto Entry_List:
16790 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
16800 case 0:
16810 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 1,15:print"3.トップ画面に行くを選択":goto Entry_List:
16820 'No:3 3.Help→2.設定 No:2
16830 case 1:
16840 sp_on 1,0:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 0,(5,300),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print "1.数霊リスト 1人用を選択":goto Entry_List:
16850 end select
16860 endif
16870 if bg = 2 then
16880 select case No
16890 '1.数霊リスト 一人用を選択を選択  パッドの右キー
16900 case 0:
16910 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16920 '2.設定を選択  パッドの右キー
16930 case 1:
16940 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16950 case 2:
16960 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16970 end select
16980 endif
16990 if key$=chr$(13) then
17000 select case No
17010 case 0:
17020 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
17030 case 1:
17040 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
17050 case 2:
17060 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
17070 end select
17080 endif
17090 '4.終了するを選択  パッドの右
17100 'バーチャルパッド　ここまで'
17110 Surei_List1:
17120 cls 3:font 48
17130 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
17140 file$ = dir$(SAVE_DATA1$,0)
17150 'ファイルが無いときの画面
17160 if file$ = ""  then
17170 '背景画面表示
17180 select case device_No
17190 case 1:
17200 gload Gazo$ + "KazutamaList1.png",0
17210 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
17220 gload Gazo$+"downscreen.png",0,0,800
17230 case 2:
17240 gload Gazo$ + "KazutamaList1.png"
17250 end select
17260 print chr$(13)
17270 color rgb(255,255,255):print "登録ファイルはございません" + chr$(13)
17280 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
17290 'else
17300 'endif
17310 bg = 0:key$ = ""
17320 while (key$ <> chr$(13) and bg<>2)
17330 key$ = inkey$
17340 bg = strig(1)
17350 pause 2
17360 wend
17370 'エンターキーもしくはバーチャルパッドの右でトップに行く
17380 if (bg = 2  or key$ = chr$(13)) then goto TopScreen:
17390 else
17400 cls 3:buffer_list_count = Loadcount()
17410 color rgb(255,255,255)
17420 if lang_flag = 1 then
17430 Else
17440 talk "登録件数は" + str$(buffer_list_count) + "件です"
17450 select case device_No
17460 Case 1:
17470 gload Gazo$ + "KazutamaList1_Entry.png",0,0,0
17480 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
17490 gload Gazo$ + "downscreen.png",0,0,800
17500 case 2:
17510 gload Gazo$+"KazutamaList1_Entry.png",0,0,0
17520 end select
17530 color rgb(0,0,255)
17540 print chr$(13)
17550 color rgb(255,255,255)
17560 print "登録件数:";buffer_list_count;"件";chr$(13)
17570 color rgb(0,0,0)
17580 print "パッドの右を押してください" + chr$(13)
17590 endif
17600 bg = 0:key$ = "":bg2 = 0
17610 while (key$ <> chr$(13) and bg <> 2)
17620 key$ = inkey$
17630 bg = strig(1)
17640 bg2=strig(0)
17650 pause 2
17660 wend
17670 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
17680 if (key$ = chr$(13) or bg = 2) then pause 2:goto KotodamaList_page:
17690 endif
17700 if (bg = 2) then pause 2:goto TopScreen:
17710 func Loadcount()
17720 n = 0
17730 'while eof(1)=-1
17740 open SAVE_DATA1$  for input as #1
17750 while eof(1) <> -1
17760 line input #1,line$
17770 n = n + 1
17780 wend
17790 close #1
17800 count = n
17810 endfunc count
17820 count_line = Loadcount()
17830 func Kotodama$(buf$)
17840 color rgb(255,255,255)
17850 b = len("数霊:")
17860 a$ = Mid$(buf$,b+1,len(buf$))
17870 for i=0 to 118
17880 color rgb(255,255,255)
17890 if bufline3$(2 * i) ="数霊:" + a$  then
17900 moji_$ = bufline3$(2*i + 1)
17910 endif
17920 next i
17930 kotodama$ = moji_$
17940 endfunc kotodama$
17950 KotodamaList_page:
17960 cls 3:font 48:m = 0:
17970 select case device_No
17980 case 1:
17990 gload Gazo$ + "Screen5_Surei_List.png"
18000 gload Gazo$ + "downscreen.png",0,0,800
18010 case 2:
18020 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
18030 end select
18040 if SAVE_DATA1$ = "" then
18050 cls 3:color rgb(255,255,255):print"ファイルがありません"
18060 else
18070 a = Loadcount()
18080 open SAVE_DATA1$  for input as #1
18090 for i=0 to a-1
18100 for n=0 to 1
18110 input #1,line$
18120 bufKaztama$(i,n) = line$
18130 next n
18140 next i
18150 close #1
18160 l = 0:n=0
18170 select case device_No
18180 case 1:
18190 gload Gazo$ + "Screen5_Surei_List.png"
18200 gload Gazo$ + "downscreen.png",0,0,800
18210 case 2:
18220 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
18230 end select
18240 while (buffer_list_count >= l)
18250 cls
18260 color rgb(255,0,0)
18270 print chr$(13)
18280 color rgb(255,255,255)
18290 n=n+1
18300 print chr$(13)
18310 print "番号:";l+1;chr$(13)
18320 print bufKaztama$(l,0) + chr$(13)
18330 print bufKaztama$(l,1) + chr$(13)
18340 Kmoji$ = moji$
18350 print chr$(13) + chr$(13) + chr$(13)
18360 color rgb(0,0,0)
18370 if buffer_list_count=1 then
18380 print " :パッドの左:トップ画面"+chr$(13)
18390 ui_msg "登録件数は1件です。"
18400 else
18410 if buffer_list_count > 1 then
18420 print " :パッドの左:トップ画面" + chr$(13)
18430 print " :パッドの右:次へ行く" + chr$(13)
18440 endif
18450 endif
18460 key$ = "":bg = 0:bg2 = 0
18470 while (key$ <> chr$(13) and bg <> 2 and bg2 <> 1)
18480 key$ = inkey$
18490 bg = strig(1)
18500 bg2 = strig(0)
18510 pause 2
18520 wend
18530 'if n > 1 then
18540 if (key$ = " " OR bg = 2) then
18550 if n > 1 then
18560 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
18570 endif
18580 else
18590 if ((bg2 = 1) or (key$=chr$(13))) then
18600 goto TopScreen:
18610 endif
18620 else
18630 goto KotodamaList_page:
18640 endif
18650 wend
18660 endif
18670 'ndif
18680 '結果表示２ Menu1
18690 Surei_Result4:
18700 cls 3:font 32+16:init"kb:4"
18710 for i=0 to 181 + 4 - 1
18720 if i = count  then
18730 buffer$ = bufline2$(count + 4,1)
18740 endif
18750 next i
18760 if len(buffer$) > 21 and len(buffer$) <= 45 then
18770 buffer2$ = Mid$(buffer$,1,22)
18780 buffer3$ = Mid$(buffer$,23,(len(buffer$) - 22))
18790 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13)
18800 else
18810 if len(buffer$) <= 21 then
18820 buffer2$ = Mid$(buffer$,1,21)
18830 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
18840 else
18850 if len(buffer$) > 45 and len(buffer$) <= 62 then
18860 buffer2$ = Mid$(buffer$,1,22)
18870 buffer3$ = Mid$(buffer$,23,22)
18880 buffer4$ = Mid$(buffer$,44,(len(buffer$)-44))
18890 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13)
18900 else
18910 if len(buffer$) > 64 and len(buffer$) <= 81 then
18920 buffer2$ = Mid$(buffer$,1,22)
18930 buffer3$ = Mid$(buffer$,23,20)
18940 buffer4$ = Mid$(buffer$,44,20)
18950 buffer5$ = Mid$(buffer$,65,(len(buffer$)-65))
18960 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13)
18970 if len(buffer$) > 81 and len(buffer$) <= 110 then
18980 buffer2$ = Mid$(buffer$,1,22)
18990 buffer3$ = Mid$(buffer$,23,20)
19000 buffer4$ = Mid$(buffer$,43,20)
19010 buffer5$ = Mid$(buffer$,63,20)
19020 buffer6$ = Mid$(buffer$,83,(len(buffer$) - 83))
19030 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13)
19040 endif
19050 endif
19060 endif
19070 endif
19080 endif
19090 Surei_Result4_2:
19100 select case device_No
19110 case 1:
19120 gload Gazo$ + "Screen1_Result2.png"
19130 gload Gazo$ + "downscreen.png",0,0,800
19140 case 2:
19150 gload Gazo$ +"Screen1_Result2.png"
19160 end select
19170 Result_Menu_List$(0)="1.トップ画面に行く"
19180 Result_Menu_List$(1)="2.数霊のデーターを保存"
19190 Result_Menu_List$(2)="3.もう一度、数霊を調べる"
19200 cls
19210 print chr$(13)
19220 if lang_flag = 1 then
19230 else
19240 color rgb(127,255,212)
19250 print chr$(13);chr$(13)
19260 print "入力文字:";buffer_moji$;chr$(13)
19270 print "数霊:";count;chr$(13)
19280 color rgb(255,255,255)
19290 print "数霊の説明:"+chr$(13)
19300 print buffer$
19310 color rgb(0,0,0)
19320 locate 0,15
19330 print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
19340 endif
19350 key$ = "":bg = 0:bg2 = 0
19360 while (bg<>2 and bg2<>1)
19370 key$ = inkey$
19380 bg = strig(1)
19390 bg2 = strig(0)
19400 pause 2
19410 wend
19420 if ((bg = 2) or (bg2 = 1)) then
19430 num = ui_select("Result_Menu_List$","番号を選んでください")
19440 endif
19450 if num = 0 then goto TopScreen:
19460 if num = 1 then goto File_save:
19470 if num = 2 then goto Surei_Input:
19480 if num = -1 then goto Surei_Result4
19490 File_save:
19500 'ファイルがない時
19510 if dir$(SAVE_DATA1$) = " " then
19520 open SAVE_DATA1$ for output as #1
19530 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19540 close #1
19550 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19560 'ファイルが有る時
19570 else
19580 open SAVE_DATA1$ for append as #1
19590 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19600 close #1
19610 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19620 endif
19630 func All_clear()
19640 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
19650 endfunc
19660 'ここから
19670 Config_moji1:
19680 cls 3:Font 48
19690 select case device_No
19700 case 1:
19710 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19720 gload Gazo$ + "downscreen.png",0,0,800
19730 case 2:
19740  gload  Gazo$ + "Screen1_Setting_Top.png",0,0,0
19750 end select
19760 play ""
19770 No=1
19780 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19790 color rgb(0,0,255)
19800 print chr$(13)
19810 if lang_flag = 1 then
19820 'lang_flag = 1:英語
19830 else
19840 'lang_flag = 0:日本語
19850 color rgb(255,255,255)
19860 print "番号を選んでください" + chr$(13)
19870 print " :1.文字の項目" + chr$(13)
19880 print " :2.結果表示設定" + chr$(13)
19890 print " :3.トップ画面に行く" + chr$(13)
19900 print " :4.終 了" + chr$(13)
19910 endif
19920 color rgb(0,0,0)
19930 locate 1,12
19940 if No = 1 then print "1.文字の項目"
19950 'y:バーチャルパッドの処理
19960 'key$:カーソルの処理
19970 'bg:バーチャルパッドの右ボタン
19980 Config_moji1_Screen:
19990 y = 0:key$ = "":bg=0
20000 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
20010 y = stick(1)
20020 key$ = inkey$
20030 bg=strig(1)
20040 pause 2
20050 wend
20060 'バーチャルパッド　ここから'
20070 'バーチャルパッド　ここから'
20080 if y = 1 then
20090 select case No
20100 'No の初期値：No=1
20110 case 1:
20120 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20130 'デバッグライン　ここから
20140 '0のとき
20150 'デバッグライン　ここまで
20160 'デバッグライン　ここから
20170 case 2:
20180 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
20190 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
20200 'if lang_flag = 1 then
20210 'else
20220 locate 1,12:print "3.トップ画面に行くを選択"
20230 'endif
20240 'デバッグライン　ここまで
20250 case 3:
20260 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
20270 'デバッグライン　ここから
20280 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
20290 'デバッグライン　ここまで
20300 case 0:
20310 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20320 'デバッグライン　ここから
20330 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
20340 'デバッグライン　ここまで
20350 end select
20360 endif
20370 'バーチャルパッド　上 ここから
20380 if y = -1 then
20390 select case No
20400 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
20410 case 1:
20420 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
20430 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
20440 case 0:
20450 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
20460 'No:3 3.Help→2.設定 No:2
20470 case 3:
20480 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20490 case 2:
20500 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
20510 end select
20520 endif
20530 if bg=2 then
20540 select case No
20550 '1.数霊チェックを選択  パッドの右キー
20560 case 1:
20570 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
20580 '2.設定を選択    パッドの右キー
20590 case 2:
20600 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
20610 '3.ヘルプを選択 パッドの右
20620 case 3:
20630 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
20640 'プログラムの終了を選択
20650 case 0:
20660 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
20670 'if lang_flag = 1 then
20680 'Else
20690 ui_msg "プログラムを終了します":end
20700 'endif
20710 end select
20720 endif
20730 '4.終了するを選択  パッドの右
20740 'バーチャルパッド　ここまで'
20750 'SettingScreen:
20760 'key$ = input$(1)
20770 'カーソル下'
20780 if key$ = chr$(31) then
20790 select case (No Mod 4)
20800 '登録文字から数霊文字の確認
20810 case 1:
20820 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
20830 '数霊文字の確認からトップ画面に行く
20840 case 2:
20850 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
20860 'トップ画面に行くから終了
20870 case 3:
20880 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
20890 '終了から登録文字
20900 case 0:
20910 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20920 end select
20930 endif
20940 'カーソル　上
20950 if key$ = chr$(30) then
20960 select case (No Mod 4)
20970 case 1:
20980 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
20990 case 2:
21000 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
21010 case 3:
21020 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
21030 case 0:
21040 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
21050 end select
21060 endif
21070 'エンターキーを押したとき
21080 if key$ = chr$(13) then
21090 if No=3 then goto TopScreen:
21100 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
21110 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
21120 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
21130 'lse
21140 'o'o SettingScreen:
21150 endif
21160 'ここまで
21170 Config_moji2:
21180 cls 3:Font 48
21190 select case device_No
21200 case 1:
21210 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
21220 gload Gazo$ + "downscreen.png",0,0,800
21230  case 2:
21240 gload Gazo$ + "Screen1_Setting_Top.png "
21250  end select
21260 play ""
21270 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
21280 No=1
21290 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
21300 color rgb(0,0,255)
21310 'print "●設定項目" + chr$(13)
21320 print chr$(13)
21330 if lang_flag = 1 then
21340 'lang_flag = 1:英語
21350 else
21360 'lang_flag = 0:日本語
21370 color rgb(255,255,255)
21380 print "番号を選んでください" + chr$(13)
21390 'print " :1.文字の項目" + chr$(13)
21400 'print " :2.結果表示設定" + chr$(13)
21410 print " :1.文字の項目" + chr$(13)
21420 print " :2.結果表示設定" + chr$(13)
21430 print " :3.トップ画面に行く" + chr$(13)
21440 print " :4.終 了" + chr$(13)
21450 endif
21460 color rgb(0,0,0)
21470 locate 1,12
21480 if No = 1 then print "1.文字の項目"
21490 'y:バーチャルパッドの処理
21500 'key$:カーソルの処理
21510 'bg:バーチャルパッドの右ボタン
21520 config_moji2:
21530 y = 0:key$ = "":bg=0
21540 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
21550 y = stick(1)
21560 key$ = inkey$
21570 bg = strig(1)
21580 pause 2
21590 wend
21600 'バーチャルパッド　ここから'
21610 'バーチャルパッド　ここから'
21620 if y = 1 then
21630 select case No
21640 'No の初期値：No=1
21650 case 1:
21660 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
21670 'デバッグライン　ここから
21680 '0のとき
21690 'デバッグライン　ここまで
21700 'デバッグライン　ここから
21710 case 2:
21720 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
21730 color rgb(0,0,0)::No=2:goto SettingScreen:
21740 if lang_flag = 1 then
21750 else
21760 locate 0,12:print " 3.トップ画面に行くを選択"
21770 endif
21780 'cls:color rgb(255,255,255):print"ok"
21790 'デバッグライン　ここまで
21800 case 3:
21810 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
21820 'デバッグライン　ここから
21830 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
21840 'デバッグライン　ここまで
21850 case 0:
21860 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21870 'デバッグライン　ここから
21880 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
21890 'デバッグライン　ここまで
21900 end select
21910 endif
21920 'バーチャルパッド　上 ここから
21930 if y = -1 then
21940 select case No
21950 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
21960 case 1:
21970 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
21980 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
21990 case 0:
22000 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
22010 'No:3 3.Help→2.設定 No:2
22020 case 3:
22030 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22040 case 2:
22050 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
22060 end select
22070 endif
22080 '決定ボタン
22090 if bg=2 then
22100 select case No
22110 '1.数霊チェックを選択  パッドの右キー
22120 case 1:
22130 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
22140 '2.設定を選択    パッドの右キー
22150 case 2:
22160 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
22170 '3.ヘルプを選択 パッドの右
22180 case 3:
22190 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
22200 'プログラムの終了を選択
22210 case 0:
22220 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
22230 'if lang_flag = 1 then
22240 'Else
22250 ui_msg "プログラムを終了します":end
22260 'endif
22270 end select
22280 endif
22290 '4.終了するを選択  パッドの右
22300 'バーチャルパッド　ここまで'
22310 'カーソル下'
22320 if key$ = chr$(31) then
22330 select case (No Mod 4)
22340 '登録文字から数霊文字の確認
22350 case 1:
22360 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22370 '数霊文字の確認からトップ画面に行く
22380 case 2:
22390 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
22400 'トップ画面に行くから終了
22410 case 3:
22420 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
22430 '終了から登録文字
22440 case 0:
22450 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
22460 end select
22470 endif
22480 'カーソル　上
22490 if key$ = chr$(30) then
22500 select case (No Mod 4)
22510 case 1:
22520 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
22530 case 2:
22540 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
22550 case 3:
22560 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
22570 case 0:
22580 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
22590 end select
22600 endif
22610 'エンターキーを押したとき
22620 if key$ = chr$(13) then
22630 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
22640 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
22650 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
22660 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
22670 'lse
22680 'o'o SettingScreen:
22690 endif
22700 '結果表示設定
22710 Result_Setting:
22720 color rgb(255,255,255)
22730 'dim list$(4)
22740 'ファイル読み込み
22750 '1.ファイルが有るか無いかのチェック
22760 if Dir$(System$) = "" then
22770 '1-1.ファイルがないとき
22780 '上のSystemフォルダを作成
22790 mkdir "./data/system/"
22800 list$(0) = "●:出た数字から181を引く"
22810 list$(1) = " :出た数字から180を引き単数変換"
22820 open System$ for output as #1
22830 print #1,"config_r=0"
22840 close #1
22850 ui_msg "ファイルを作成しました"
22860 'ファイル作成
22870 else
22880 '1-2.ファイルが有るとき
22890 'config_r:0 出た数字から181を引く
22900 'config_r:1 出た数字から180を引いて単数変換
22910 'open "./System/config.sys" for input as #1
22920 'ファイルが有るときファイルを読み込み
22930 open System$ for input as #1
22940 line input #1,buf_line$
22950 'buf$にデーターをコピーする
22960 buf$ = buf_line$
22970 close #1
22980 if len(buf$) = 10 then
22990 if left$(buf$,9) = "config_r=" then
23000 buf$ = right$(buf_line$,1)
23010 if buf$ = "1" then
23020 '1.System$ ファイルを削除(config.sys)
23030 '2.1行目をconfig_r=1と書き、保存する
23040 buf_config_r = 1
23050 'list$(0) = "●:1.出た数字から180を引いて単数変換"
23060 'list$(1) = " :2.出た数字から181を引く"
23070 else
23080 if buf$ = "0" then
23090 buf_config_r = 0
23100 ' list$(0) = "●:1.出た数字から181を引く"
23110 'list$(1) = " :2.出た数字から180を引いて単数変換"
23120 endif
23130 endif
23140 endif
23150 endif
23160 endif
23170 '"●:1.出た数字から180を引く"をlist$(0)に代入
23180 if buf_config_r =  0 then
23190 list$(0) = "●:1.出た数字から181を引く"
23200 list$(1) = " :2.出た数字から180を引いて単数変換"
23210 else
23220 list$(0) = "●:1.出た数字から180を引いて単数変換"
23230 list$(1) = " :2.出た数字から181を引く"
23240 endif
23250 list$(2) = " :トップ画面に戻る"
23260 list_num = ui_select("list$","番号を選んでください")
23270 play ""
23280 Select case (list_num)
23290 case 0:
23300 if buf$ = "1" then
23310 buf_config_r = 0:
23320 'データーを変更したのでファイルを削除
23330 kill System$
23340 'ファイルを新しく作成
23350 open System$ for output as #1
23360 print #1,"config_r=0"
23370 close #1
23380 ui_msg "設定を変更しました。"
23390 else
23400 'if buf$ = "0" then
23410 'buf_config_r = 1
23420 'kill System$
23430 'open Syetem$ for output as #1
23440 'print #1,"config_r=1"
23450 'close #1
23460 'ui_msg "設定を変更しました"
23470 'endif
23480 endif
23490 goto config_moji2:
23500 case 1:
23510 if buf$ = "0" then
23520 buf_config_r = 1:
23530 'データーを変更したので、ファイルを削除
23540 kill System$
23550 'ファイルを新しく作成
23560 open System$ for output as #1
23570 print #1,"config_r=1"
23580 close #1
23590 ui_msg "設定を変更しました"
23600 else
23610 kill System$
23620 if buf$ = "1" then
23630 open System$ for output as #1
23640 print #1,"config_r=0"
23650 close #1
23660 ui_msg "設定を変更しました"
23670 endif
23680 endif
23690 goto config_moji2:
23700 case 2:
23710 'トップ画面に飛ぶ
23720 goto TopScreen:
23730 case 3:
23740 'プログラムを終了する
23750 cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
23760 end select
23770 '単数変換
23780 Func Single_Complate(num)
23790 '1.出てきた数字から180を引く
23800 a = num - 180
23810 'a:10〜99
23820 Re1:
23830 if (a > 9 and a < 100) then
23840 b1 = fix(a / 10)
23850 b2 = 10 * a - b1
23860 d1 = b1 + b2
23870 if c > 9 then
23880 goto Re1:
23890 else
23900 c = d1:goto Re2:
23910 endif
23920 endif
23930 Re2:
23940 buffer = c
23950 endfunc buffer
23960 Func Surei_Result_Save_File()
23970 'ファイルがないとき
23980 if dir$(SAVE_DATA1$) = "" then
23990 open SAVE_DATA1$ for output as #1
24000 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
24010 close #1
24020 ui_msg "保存しました":talk "保存しました":goto Surei_Result:
24030 else
24040 open SAVE_DATA1$ for append as #1
24050 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
24060 close #1
24070 ui_msg "保存しました":talk "保存しました":goto Surei_Result
24080 endif
24090 endfunc
24100 '言語設定
24110 Setting_Language:
24120 cls 3:screen 1,1,1,1:No=2
24130 select case device_No
24140 case 1:
24150 gload Gazo$ + "Screen1.png",0,0,0
24160 gload Gazo$ + "downscreen.png",0,0,800
24170 case 2:
24180 gload Gazo$ + "Screen1.png",0,0,0
24190 end select
24200 init "Kb:4"
24210 sp_on 1,1:sp_on 0,0
24220 sp_put 0,(0,300),0,0
24230 sp_put 1,(0,400),1,0
24240 color rgb(0,0,255)
24250 'print "番号を選んでください"+chr$(13)
24260 'if lang_flag=0 then
24270 'print "言語設定:日本語"+chr$(13)
24280 'else
24290 'print "言語設定:英 語"+chr$(13)
24300 Change_Language:
24310 if lang_flag = 1 then
24320 cls
24330 print "It has changed Language"+chr$(13)
24340 color rgb(255,255,255)
24350 print "Select the Number"+chr$(13)
24360 print " :1.English → Japanse"+chr$(13)
24370 print " :2.It goes to TopScreen"+chr$(13)
24380 print "Language:In English" +chr$(13)
24390 else
24400 cls:color rgb(255,255,255)
24410 print "設定変更(言語の変更)" + chr$(13)
24420 color rgb(255,255,255)
24430 print chr$(13)
24440 print "番号を選んでください"+chr$(13)
24450 print " :1.日本語 → 英語に変更" + chr$(13)
24460 print " :2.トップ画面に戻る" + chr$(13)
24470 print chr$(13)
24480 print "設定言語:日本語" + chr$(13)
24490 endif
24500 color rgb(0,0,0)
24510 locate 0,15:print "                                       ":locate 0,15:print "2.トップ画面に戻る　を選択" + chr$(13)
24520 Setting_Language_key:
24530 y=0:key$="":bg=0
24540 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y<> -1 and bg<> 1)
24550 y=stick(1)
24560 key$=inkey$
24570 bg=strig(1)
24580 pause 2
24590 wend
24600 '選択肢変更
24610 if ((y=1) or (y=-1)) then
24620 select case No
24630 case 2:
24640 '実装部分　ここから
24650 pause 200:No=1:sp_on 0,1:sp_on 1,0:locate 0,15:print "                                                         ":locate 0,15:print "1.日本語 → 英語に変更を選択": goto Setting_Language_key:
24660 '実装部分　ここまで
24670 case 1:
24680 pause 200: No=2:sp_on 0,0:sp_on 1,1:locate 0,15:print "                                                       ":locate 0,15:print "2.トップ画面に戻る を選択":goto Setting_Language_key:
24690 end select
24700 endif
24710 'Enter Key  決定ボタン
24720 if ((key$=chr$(13)) or (bg=1)) then
24730 select case No
24740 case 2:
24750 sp_on 0,0:sp_on 1,0:goto TopScreen:
24760 case 1:                                                     'lang_flag=1:sp_on 0,0:sp_on 1,0:goto Change_Language:
24770 '
24780 '未実装　ここから
24790 sp_on 0,1:sp_on 1,0:ui_msg "この機能は未実装です":goto Setting_Language_key:
24800 '
24810 '未実装　ここまで
24820 end select
24830 endif
24840 '配列削除
24850 buffer_clear:
24860 erase bufline$
24870 erase bufcount$
24880 erase bufcount1$
24890 erase bufcount2$
24900 erase bufline2$
24910 erase bufline3$
24920 erase bufKaztama$
24930 erase List$
24940 erase Result_Menu_List$
24950 erase list$
24960 erase moji_List$
24970 'ui_msg "メモリーをクリアしました"
24980 return
24990 '配列削除　ここまで
25000 File_Device_Set:
25010 'Device 選択　書き込み
25020 open Device_type$  for output as #1
25030 print #1,device_No
25040 close #1
25050 ui_msg "ファイルを書き込みました"
25060 return
25070 Input_numbertokazutama:
25080 cls 3:gload Gazo$ + "Input_numbertokazutama.png",0,0,0:init "kb:2"
25090 color rgb(255,255,255):locate 1,4:print "調べたい数霊の番号を入れてください"+chr$(13);"(Max:181)"
25100 color rgb(0,0,0):locate 1,7:Input "番号:",num
25110 if (num > 181) then ui_msg"181までの数字で入れ直してください":goto Input_numbertokazutama:
25120 for i=0 to 181+3-1
25130 if i = num then
25140 buffer$ = bufline2$(i+4,1)
25150 endif
25160 next i
25170 goto Numbertokazutama:
25180 '
25190 '
25200 Numbertokazutama:
25210 cls 3:init "kb:4":gload Gazo$+"Result_numbertokazutama.png",0,0,0:bg=0:key$=""
25220 font 32+16:color rgb(255,255,255)
25230 locate 1,3:print "◎数霊番号:";num;chr$(13)
25240 locate 1,4:print "◎数霊の説明"+chr$(13)
25250 if ((len(buffer$) > 21) and (len(buffer$) <= 45)) then
25260 buffer2$ = Mid$(buffer$,1,20)
25270 buffer3$ = Mid$(buffer$,21,len(buffer$)-20)
25280 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13)
25290 else
25300 if (len(buffer$) < 22) then
25310 buffer2$ = Mid$(buffer$,1,21)
25320 buffer$ = buffer2$ + chr$(13)
25330 else
25340 if ((Len(buffer$) > 45) and (len(buffer$) < 66)) then
25350 buffer2$ = Mid$(buffer$,1,20)
25360 buffer3$ = Mid$(buffer$,20,21)
25370 buffer4$ = Mid$(buffer$,41,len(buffer$)-41)
25380 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13)
25390 endif
25400 endif
25410 endif
25420 locate 1,5:print buffer$
25430 color rgb(0,0,0)
25440 locate 1,14:print "ジョイパッドの右を押してください"+chr$(13)
25450 while ((bg <> 1) and (key$ <> chr$(13)))
25460 bg=strig(1)
25470 key$=inkey$
25480 pause 2
25490 wend
25500 if ((bg = 2) or (key$ = chr$(13))) then
25510 goto TopScreen:
25520 endif
25530 data_initialize:
25540 cls 3
25550 select case device_No
25560 case 1:
25570 gload Gazo$ + "Data_initializeScreen.png",0,0,0
25580 gload Gazo$ + "downscreen.png",0,0,800
25590 case 2:
25600 gload Gazo$ + "Data_initializeScreen.png",0,0,0
25610 end select
25620 color rgb(255,255,255):font 48:init "kb:4":No=1:sp_on 1,1:sp_put 1,(5,300),0,0
25630 locate 0,4:print "番号を選んでください"+chr$(13)
25640 print " :1.メンバーリストの初期化" + chr$(13)
25650 print " :2.デバイスの初期化" + chr$(13)
25660 print " :3.トップ画面に行く"+chr$(13)
25670 locate 0,15:color rgb(0,0,0):print "1.メンバーリストの初期化を選択"
25680 data_initialize2:
25690 y = 0:key$ = "":bg = 0
25700 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
25710 y = stick(1)
25720 key$ = inkey$
25730 bg = strig(1)
25740 pause 2
25750 wend
25760 'y = -1:ジョイパッドの上
25770 'y = 1:ジョイパッド下
25780 'key$ = chr$(13):Enter key
25790 'key$ = chr$(30):カーソル上
25800 'key$ = chr$(31):カーソル下
25810 if ((y = -1) or (key$ = chr$(30))) then
25820 select case No
25830 case 1:
25840  sp_on 1,0:sp_on 2,0:sp_on 0,1:sp_on 3,0:No=0:sp_put 0,(5,500),0,0:locate 0,15:print "                                       ":locate 0,15:print "3.トップ画面に行くを選択":pause 200:goto data_initialize2:
25850 case 2:
25860 sp_on 1,1:sp_on 2,0:sp_on 0,0:sp_on 3,0:No=1:sp_put 1,(5,300),0,0:locate 0,15:print "                                      ":pause 200:locate 0,15:print "1.メンバーリストの初期化を選択":goto data_initialize2:
25870 case 0:
25880 sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_on 0,0:sp_put 2,(5,400),0,0:locate 0,15:print "                                      ":pause 200:locate 0,15:print "2.デバイスの初期化を選択"+chr$(13):No=2:goto data_initialize2:
25890 end select
25900 endif
25910 'bg=2:Enter key
25920 if ((bg = 2) or (key$ = chr$(13))) then
25930 select case No
25940 case 0:
25950 sp_on 0,0:sp_on 1,0:sp_on 2,0:pause 200:goto TopScreen:
25960 case 1:
25970 'メンバーリストの初期化トップへ行く
25980 sp_on 0,0:sp_on 1,0:sp_on 2,0:pause 200:goto member_initializeTop:
25990 case 2:
26000 ui_msg "未実装です":goto data_initialize2:
26010 end select
26020 endif
26030 'カーソルの下　または、ジョイパッド下
26040 if ((y = 1) or (key$ = chr$(31))) then
26050 select case No
26060 case 1:
26070 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                          ":locate 0,15:print "2.デバイスの初期化を選択":goto data_initialize2:
26080 case 2:
26090 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:No=0:locate 0,15:print "                                                          ":locate 0,15:print "3.トップ画面に行くを選択":goto data_initialize2:
26100 case 0:
26110 sp_on 0,0:sp_on 1,1:sp_on 2,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                                          ":locate 0,15:print "1.メンバーリストの初期化を選択":goto data_initialize2:
26120 end select
26130 endif
26140 'メンバーリストの初期化トップ
26150 member_initializeTop:
26160 cls 3
26170 select case (device_No)
26180 case 1:
26190 gload Gazo$ + "member_initializeTop.png",0,0,0
26200 gload Gazo$ + "downscreen.png",0,0,800
26210 case 2:
26220 gload Gazo$ + "member_initializeTop.png",0,0,0
26230 end select
26240 No=0:init "kb:4":color rgb(255,255,255):font 48
26250 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,500),0,0
26260 locate 0,4:print  "番号を選んでください"+chr$(13)
26270 print " :1.メンバーリストを初期化する" + chr$(13)
26280 print " :2.バックアップを取る" + chr$(13)
26290 print " :3.トップ画面に戻る"+chr$(13)
26300 color rgb(0,0,0):locate 0,15:print "                                       ":locate 0,15:print "3.トップ画面に戻るを選択"+chr$(13)
26310 member_list2:
26320 y=0:key$="":bg=0
26330 while ((key$ <> chr$(13)) and (y <> 1) and (y <> -1) and (bg <> 2))
26340 y = stick(1)
26350 key$ = inkey$
26360 bg = strig(1)
26370 pause 2
26380 wend
26390 'bg=2,chr$(13):決定ボタン
26400 if ((bg = 2) or (key$ = chr$(13)))  then
26410 select case No
26420 case 1:
26430 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Member_List_DeleteScreen:
26440 case 2:
26450 ui_msg"未実装です":goto member_list2:
26460 case 0:
26470 '3:トップ画面に戻る
26480 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
26490 end select
26500 endif
26510 'y=1:chr$(31):ジョイパッド　下　又は　カーソルの下
26520 if ((y = 1) or (key$ = chr$(31))) then
26530 select case No
26540 case 0:
26550 sp_on 1,1:sp_on 2,0:sp_on 0,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print "1.メンバーリストを初期化するを選択":goto member_list2:
26560 case 1:
26570 sp_on 0,0:sp_on 2,1:sp_on 1,0:No=2:sp_put 2,(5,400),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print "2.バックアップを取るを選択":goto member_list2:
26580 case 2:
26590 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:locate 0,15:print "                                       ":locate 0,15:print "3.トップ画面に行くを選択":goto member_list2:
26600 end select
26610 endif
26620 'Joypad  or カーソル　上
26630 if ((y=-1) or (key$=chr$(30))) then
26640 select case No
26650 case 0:
26660 sp_on 2,1:sp_on 1,0:sp_on 0,0:No=2:sp_put 2,(5,400),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print "2.バックアップを取るを選択":goto member_list2:
26670 case 1:
26680 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print "3.トップ画面に行くを選択":goto member_list2:
26690 case 2:
26700 sp_on 0,0:sp_on 1,1:sp_on 2,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print "1.メンバーリストを初期化をする選択":goto member_list2:
26710 end select
26720 endif
26730 Member_List_DeleteScreen:
26740 cls:key$ = "":bg = 0:y=0:init "kb:4":font 48:count=0
26750 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
26760 if dir$(SAVE_DATA1$) = "" then
26770 'ファイルがないとき
26780 color rgb(255,255,255)
26790 locate 0,4
26800 print "データーファイルは、存在しません。"
26810 locate 0,15:color rgb(0,0,0):print "ジョイパッドの右を押してください":
26820 'endif
26830 while ((key$ <> chr$(13)) and (bg <> 2) and (y <> 1) and (y <> -1))
26840 key$ = inkey$
26850 bg = strig(1)
26860 y = stick(1)
26870 pause 2
26880 wend
26890 if ((key$ = chr$(13)) or (bg = 2)) then goto TopScreen:
26900 'goto TopScreen:
26910 'endif
26920 else
26930 'ファイルが有るとき
26940 'default
26950 'No=1:ファイルを削除する
26960 'No=2:トップ画面に戻る
26970 No=2
26980 sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0
26990 color rgb(255,255,255)
27000 locate 0,4:print"番号を選んでください"+chr$(13)
27010 print " :1.ファイルを削除する"+chr$(13)
27020 print " :2.トップ画面に戻る"+chr$(13)
27030 color rgb(0,0,0):
27040 locate 0,15:print"                                      ":locate 0,15:print "2.トップ画面に戻るを選択"
27050 endif
27060 Select_key1:
27070 '初期化
27080 y=0:key$="":bg=0
27090 while ((key$ <> chr$(13)) and (bg <> 2) and (y <> 1) and (y <> -1))
27100 key$ = inkey$
27110 bg = strig(1)
27120 y = stick(1)
27130 pause 2
27140 wend
27150 '1.選択キー
27160 '十字キー 上 y=-1
27170 '十字キー　下 y=1
27180 if ((y = 1) or (y = -1)) then
27190 select case No
27200 case 2:
27210 No=1:sp_on 2,0:sp_on 1,1:sp_put 1,(5,300),0,0:locate 0,15:print "                                                                                ":locate 0,15:print "1．ファイルを削除":pause 200:goto Select_key1:
27220 case 1:
27230 No=2:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:locate 0,15:print "                                                          ":locate 0,15:print "2.トップ画面に戻るを選択":pause 200:goto Select_key1:
27240 end select
27250 endif
27260 '2.決定ボタン
27270 'Joypad　右 or Enter key
27280 if ((bg=2) or (key$=chr$(13))) then
27290 Select case No
27300 case 2:
27310 sp_on 1,0:sp_on 2,0:pause 200:goto TopScreen:
27320 case 1:
27330 if (count=0) then
27340 kill SAVE_DATA1$:ui_msg"メンバーリストを削除しました":pause 200:locate 0,15:print "                                       ":locate 0,15:print "ジョイパッドの右を押してください":count=count+1:goto Select_key1:
27350 else
27360 sp_on 1,0:sp_on 2,0:goto TopScreen
27370 endif
27380 end select
27390 endif
