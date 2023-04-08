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
590 '現在のバージョン
600 Version$ = "1.4.0_2023.04.09(正式版)"
610 'csvファイル 1.数霊 ベースファイル
620 FILE_csv$ = "./data/Kazutama.csv"
630 'csvファイル 2.数霊 ベースファイル 2
640 FILE_csv2$ = "./data/Surei_chart_20211207.csv"
650 'Save ファイル
660 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
670 'gazo ファイル
680 Gazo$ = "./data/Gazo/"
690 'System フォルダ:設定ファイルを保存するところ
700 System$ = "./data/System/config.sys"
710 'Device type:デバイスタイプのファイルチェック
720 Device_type$ = "./data/device_type.sys"
730 '設定ファイル名:config.sys
740 'Sound File(Voice)
750 '1.ボイス TopScreen
760 Voice_File_TopScreen$ = "./data/Sound_data/"
770 'Message
780 buf_finish_Message$ = "メモリーを解放してプログラムを終了します"
790 '変数領域
800 'vcount:バーチャルパッド下の変数
810 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+3,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
820 count2 = 0:N=0:N2=0:m2 = 0:device_No=0:device_type=0
830 dim list$(4),moji_List$(2)
840 'ファイルの有無チェック
850 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
860 '1.ファイルが無いとき
870 cls :print "依存ファイルが見つかりません":
880 print "エンターキーを押してください" + chr$(13)
890 key$ = input$(1)
900 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
910 else
920 '2.ファイルが有るとき
930 cls:print "csv:file ok." + chr$(13)
940 n=0
950 'FILE_csv$:数霊データー入力
960 open FILE_csv$ for input as #1
970 while eof(1) = 0
980 input #1,line$
990 bufline$(n) = line$
1000 'Print n;chr$(13)
1010 '登録件数カウント:n
1020 n = n + 1
1030 wend
1040 close #1
1050 N=n
1060 '2つ目のファイル読み込み
1070 'n = 0
1080 open FILE_csv2$ for input as #2
1090 for n=3 to 181
1100 for i=0 to 1
1110 input #2,line$
1120 bufline2$(n,i) = line$
1130 next i
1140 next n
1150 close #2
1160 N2 = n
1170 endif
1180 '2022.11.23----------------------
1190 '端末言語のチェック
1200 '日本語端末かチェックをして日本語以外なら英語で表示する
1210 'lang flag:0:日本語 1:英語(日本語以外)
1220 '--------------------------------
1230 lang_flag = 0
1240 if ex_info$(1) <> "JP" then
1250 lang_flag = 1
1260 endif
1270 cls 3:font 48:screen 1,1,1,1:int "kb:4":init "crt:0"
1280 play ""
1290 'gload Gazo$ + "TopScreen_20230310.png",0,0,0
1300 '選択ポインター 1 - 4
1310 'スプライトの定義
1320 gload Gazo$ + "Selection.png",1,5,300
1330 gload Gazo$ + "Selection.png",1,5,400
1340 gload Gazo$ + "Selection.png",1,5,500
1350 gload Gazo$ + "Selection.png",1,5,595
1360 sp_def 0,(5,300),32,32
1370 sp_def 1,(5,400),32,32
1380 sp_def 2,(5,500),32,32
1390 sp_def 3,(5,595),32,32
1400 'File check
1410 '初回起動はここから
1420 if (dir$(Device_type$) = "") then
1430 goto Device_Select:
1440 else
1450 '
1460 '2回目以降はファイルチェックをしてトップ画面
1470 '
1480  open Device_type$ for input as #1
1490  line input #1,device_type$
1500  device_No = val(device_type$)
1510  close #1
1520  if (device_No=1 or device_No=2) then
1530  goto TopScreen:
1540  endif
1550 endif
1560 'First_Select_Screen:
1570 'タブレット　or　スマホの選択を起動時にする
1580 Device_Select:
1590 font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
1600 gload Gazo$ + "device_select_20230313.png",0,0,0
1610 init "kb:4"
1620 play ""
1630 play Voice_File_TopScreen$+"Select_device_select.mp3"
1640 'y=0:key$="":bg=0
1650 print chr$(13)+chr$(13)+chr$(13)
1660 color  rgb(255,255,255)
1670 print "番号を選んでください"+chr$(13)
1680 'print chr$(13)
1690 print " :1.スマートフォン"+chr$(13)
1700 print " :2.タブレット端末"+chr$(13)
1710 locate 0,11:No=1
1720 color rgb(0,0,0)
1730 Print " 1.スマートフォンを選択"+chr$(13)
1740 sp_on 0,1:sp_put 0,(5,300),0,0
1750 sp_on 1,0:sp_on 2,0:sp_on 3,0
1760 device_selection:
1770 y=0:key$="":bg=0:
1780 While (key$ <> chr$(30) and key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 1)
1790 y = stick(1)
1800 key$ = inkey$
1810 bg = strig(1)
1820 pause 2
1830 wend
1840 if ((y=1) or (y=-1) or (key$=chr$(30)) or (key$=chr$(31)) ) then
1850 select case No
1860 case 1:
1870       No=2:sp_on 1,1:sp_on 0,0:locate 0,11:pause 300:sp_put 1,(5,400),0,0:print "                                ":locate 0,11:print " 2.タブレット端末を選択":goto device_selection:
1880 case 2:
1890       No=1:sp_on 1,0:sp_on 0,1:pause 300:sp_put 0,(5,300),0,0:locate 0,11:print "                                   ":locate 0,11:print " 1.スマートフォンを選択":goto device_selection:
1900 end select
1910 endif
1920 '決定ボタン
1930 if ((bg=1) or (key$=chr$(13)))  then
1940 select case No
1950 case 1:
1960       sp_on 0,0:sp_on 1,0:device_No=1:gosub File_Device_Set:goto TopScreen:
1970 case 2:
1980       sp_on 0,0:sp_on 1,0:device_No=2:gosub File_Device_Set:goto TopScreen:
1990 end select
2000 endif
2010 'Top画面
2020 TopScreen:
2030 'バーチャルパッドを表示
2040 cls 3:font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
2050 'play ""
2060 play ""
2070 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
2080 'gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
2090 select case device_No
2100 case 1:
2110 'Top画面の背景画像
2120 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2130 gload Gazo$ + "downscreen.png",0,0,800
2140 case 2:
2150 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2160 end select
2170 'key$=input$(1)
2180 'バーチャルパッドの背景を白にする for smartphone screen
2190 'gload Gazo$ + "downscreen.png",0,0,800
2200 '選択肢 1
2210 gload Gazo$ + "Selection.png",1,5,300
2220 '選択肢 2
2230 gload Gazo$ + "Selection.png",1,5,400
2240 '選択肢 3
2250 gload Gazo$ + "Selection.png",1,5,500
2260 '選択肢 4
2270 'TopScreen:
2280 'select case device_No
2290 'case 1:
2300 gload Gazo$ + "Selection.png",1,5,590
2310 'case 2:
2320 'gload Gazo$ +
2330 'end select
2340 color rgb(0,0,255)
2350 print chr$(13)
2360 if lang_flag = 1 then
2370 color rgb(255,255,255)
2380 print "Select Number" + chr$(13)
2390 print " :1.Kazutama check" + chr$(13)
2400 print " :2.Setting" + chr$(13)
2410 print " :3.Help" + chr$(13)
2420 print " :4.End Program" + chr$(13)
2430 color rgb(255,255,255)
2440 else
2450 color rgb(255,255,255)
2460 print chr$(13)
2470 sp_on 0,1:sp_put 0,(5,300),0,0
2480 print "番号を選んでください" + chr$(13)
2490 print " :1.数霊(かずたま)チェック" + chr$(13)
2500 print " :2.設定" + chr$(13)
2510 print " :3.ヘルプ" + chr$(13)
2520 print " :4.(プログラムを)終　了する" + chr$(13)
2530 color rgb(0,0,0)
2540 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
2550 'バーチャルパッドを表示
2560 No=1:
2570 'lang_flag:1 外国語,0:日本語
2580 if lang_flag = 1 then
2590 'lang_flag=1 英語
2600 locate 0,15:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
2610 else
2620 'lang_flag=0 日本語
2630 locate 0,15:color rgb(0,0,0):print " 1.数霊(かずたま)チェックを選択";chr$(13)
2640 endif
2650 endif
2660 'TopScreen sprite
2670 'スプライト
2680 '選択肢 1 On
2690 'sp_def 0,(5,300),32,32
2700 'sp_on 0,1
2710 'sp_put 0,(5,300),0,0
2720 '選択肢 2 Off
2730 sp_def 1,(5,400),32,32
2740 sp_on 1,0
2750 sp_put 1,(5,400),0,0
2760 '選択肢 3 Off
2770 sp_def 2,(5,500),32,32
2780 sp_on 2,0
2790 sp_put 2,(5,500),0,0
2800 '選択肢 4 Off
2810 sp_def 3,(5,600),32,32
2820 sp_on 3,0
2830 sp_put 3,(5,600),0,0
2840 color rgb(0,0,0)
2850 Main_Select:
2860 'y:バーチャルパッドの処理
2870 'key$:カーソルの処理
2880 y = 0:key$ = "":bg = 0
2890 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
2900 y = stick(1)
2910 key$ = inkey$
2920 bg = strig(1)
2930 pause 2
2940 wend
2950 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
2960 '1.バーチャルパッドの処理
2970 'バーチャルパッド下を押した時
2980 if y = 1 then
2990 select case No
3000 'No の初期値：No=1
3010 case 1:
3020 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
3030 if lang_flag = 1 then
3040 'lang_flag=1 英語
3050 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3060 else
3070 'lang_flag=0 日本語
3080 locate 0,15:print " 2.設定を選択":goto Main_Select:
3090 endif
3100 'デバッグライン　ここから
3110 '0のとき
3120 'デバッグライン　ここまで
3130 'デバッグライン　ここから
3140 'バーチャルパッド　下
3150 case 2:
3160 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:
3170 print "                                         ":
3180 if lang_flag = 1 then
3190 color rgb(0,0,0):locate 0,15:
3200 print "3.It has selected Help":No=3:goto Main_Select:
3210 else
3220 color rgb(0,0,0):locate 0,15:print "                                                         ":locate 0,15:
3230 print " 3.ヘルプを選択":No=3:goto Main_Select:
3240 endif
3250 'デバッグライン　ここまで
3260 case 3:
3270 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                               "
3280 if lang_flag = 1 then
3290 locate 0,15:print "4.It has selected finish program":No=0:goto Main_Select:
3300 else
3310 locate 0,15:print "                                                         " :locate 0,15:print " 4.(プログラムを)終了するを選択":No=0:goto Main_Select:
3320 endif
3330 'デバッグライン　ここから
3340 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
3350 'デバッグライン　ここまで
3360 case 0:
3370 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1
3380 if lang_flag = 1 then
3390 'lang_flag=1:英語
3400 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3410 else
3420 'lang_flag=0:日本語
3430 locate 0,15:print "                                      ":locate 0,15:print " 1.数霊(かずたま)チェックを選択":goto Main_Select:
3440 endif
3450 'デバッグライン　ここから
3460 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
3470 'デバッグライン　ここまで
3480 end select
3490 endif
3500 'バーチャルパッド　上 ここから
3510 if y = -1 then
3520 select case No
3530 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
3540 case 1:
3550 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                                          "
3560 'if lang_flag = 1 then
3570 'lang_flag=1 英語
3580 'locate 0,15:print "4.It has finished program":goto Main_Select:
3590 'else
3600 'lang_flag=0 日本語
3610 locate 0,15:print "                                                          ":
3620 locate 0,15:print " 4.(プログラムを)終了するを選択":goto Main_Select:
3630 'endif
3640 'endif
3650 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
3660 case 0:
3670 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":
3680 if lang_flag = 1 then
3690 '1:英語
3700 locate 0,15:print "3.It has selected Help":goto Main_Select:
3710 else
3720 '0:日本語
3730 locate 0,15:print "                                                                                        "
3740 locate 0,15:print " 3.ヘルプを選択":goto Main_Select:
3750 endif
3760 'No:3 3.Help→2.設定 No:2
3770 case 3:
3780 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      "
3790 if lang_flag = 1 then
3800 '1:英語
3810 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3820 else
3830 '0:日本語
3840 locate 0,15:print" 2.設定を選択":goto Main_Select:
3850 endif
3860 case 2:
3870 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":
3880 if lang_flag = 1 then
3890 'lang_flag 1 英語
3900 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3910 else
3920 'lang_flag 0 日本語
3930 locate 0,15:print" 1.数霊(かずたま)チェックを選択":goto Main_Select:
3940 endif
3950 end select
3960 endif
3970 if bg=1 then
3980 select case No
3990 '1.数霊チェックを選択  パッドの右キー(決定)
4000 case 1:
4010 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4020 '2.設定を選択  パッドの右キー(決定)
4030 case 2:
4040 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
4050 '3.ヘルプを選択 パッドの右(決定)
4060 case 3:
4070 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
4080 'プログラムの終了を選択(決定)
4090 case 0:
4100 cls 3:cls 4:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg buf_finish_Message$:pause 4.080*1000:color rgb(255,255,255):end
4110 'if lang_flag = 1 then
4120 'lang_flag = 1 英語
4130 'else
4140 'lang_flag = 0 日本語
4150 'endif
4160 end select
4170 '4.終了するを選択  パッドの右
4180 endif
4190 'バーチャルパッド　上　ここまで
4200 '2.カーソルの処理
4210 'カーソル　下 chr$(31)
4220 if (key$ = chr$(31)) then
4230 select case (No)
4240 '4
4250 '0 選択肢4 => 選択肢1
4260 case 0:
4270 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "              ":color rgb(0,0,0):
4280 if lang_flag = 1 then
4290 'lang flag:1 英語
4300 else
4310 'lang flag:0 日本語
4320 color rgb(0,0,0):locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4330 endif
4340 '1 選択肢1 => 選択肢2
4350 case 1:
4360 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":
4370 if lang_flag = 1 then
4380 'lang_flag:1 英語
4390 else
4400 'lang_flag:0 日本語
4410 color rgb(0,0,0):locate 0,15:print "2.設定を選択":beep:goto Main_Select:
4420 endif
4430 '2 選択肢2 => 選択肢3
4440 case 2:
4450 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,15:print "               ":
4460 if lang_flag = 1 then
4470 'lang flag:1 英語
4480 else
4490 'lang flang:0 日本語
4500 color rgb(0,0,0):locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4510 endif
4520 '3 選択肢３ => 選択肢4
4530 case 3:
4540 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,595),0,0:locate 0,15:print "               ":color rgb(0,0,0)
4550 if lang_flag = 1 then
4560 'lang_flag = 1 英語
4570 else
4580 'lang_flag = 0 日本語
4590 color rgb(0,0,0):locate 0,15:print "4.終 了を選択":goto Main_Select:
4600 endif
4610 case else:
4620 goto Main_Select:
4630 end select
4640 endif
4650 'カーソル　上
4660 if key$=chr$(30) then
4670 select case (No)
4680 '選択肢1 => 選択肢4
4690 case 1:
4700 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:PRINT "                      ":
4710 if lang_flag = 1 then
4720 'lang_flag=1:英語
4730 'print "1.It has selected Kazutama check":goto Main_Select:
4740 else
4750 'lang_flag = 0:日本語
4760 else
4770 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4780 endif
4790 '選択肢2 => 選択肢1
4800 case 2:
4810 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                 ":locate 1,15:print "2.設 定を選択":goto Main_Select:
4820 '選択肢3　=> 選択肢2
4830 case 3:
4840 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,500),0,0
4850 if lang_flag = 1 then
4860 'lang_flag = 1:英語
4870 locate 0,15:print "It has selected Help":goto Main_Select:
4880 else
4890 'lang_flag = 0:日本語
4900 locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4910 endif
4920 '選択肢4 => 選択肢3
4930 case 0:
4940 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                ":locate 1,15:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
4950 if lang_flag = 1 then
4960 'lang flag=1 英語
4970 else
4980 'lang flag=0 日本語
4990 locate 1,15:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
5000 endif
5010 end select
5020 endif
5030 'Input "番号:",No
5040 'エンターキー入力:決定
5050 if key$ = chr$(13) then
5060 select case No
5070 case 1:
5080 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
5090 case 3:
5100 Color rgb(255,255,255):goto Help:
5110 case 0:
5120 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg buf_finish_Message$:color rgb(255,255,255):pause 4.080 * 1000:end
5130 case 2:
5140 color rgb(255,255,255):sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
5150 end select
5160 endif
5170 '1-1.数霊チェック
5180 Surei_Check:
5190 cls 3:Font 48:
5200 select case device_No
5210  case 1:
5220 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5230 gload Gazo$ + "downscreen.png",0,0,800
5240 case 2:
5250 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5260 end select
5270 play ""
5280 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
5290 color rgb(255,0,0)
5300 'print "●数霊(かずたま)チェックトップ" + chr$(13)
5310 sp_on 0,1:sp_put 0,(5,300),0,0:screen 1,1,1
5320 if lang_flag = 1 then
5330 'lang_flag=1 英語
5340 else
5350 'lang_flag=0 日本語
5360 print chr$(13)+chr$(13)+chr$(13)
5370 color rgb(255,255,255)
5380 print "番号を選んでください" + chr$(13)
5390 print " :1.数霊(かずたま)1人用" + chr$(13)
5400 print " :2.数霊(かずたま)リスト 1人用　" + chr$(13)
5410 print " :3.数霊(かずたま)2人用" + chr$(13)
5420 print " :4.トップ画面に行く" + chr$(13)
5430 color rgb(0,0,0):No = 1
5440 locate 0,15:print "                                       "
5450 locate 0,15
5460 print " 1.数霊(かずたま)1人用を選択"
5470 endif
5480 Kazutama_main:
5490 'y:バーチャルパッドの処理
5500 'key$:カーソルの処理
5510 'bg:バーチャルパッドの右のボタン
5520 y = 0:key$ = "":bg=0
5530 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
5540 y = stick(1)
5550 key$ = inkey$
5560 bg=strig(1)
5570 y=stick(-1)
5580 pause 2
5590 wend
5600 'key$ = input$(1)
5610 if y = 1 then
5620 select case No
5630 'No の初期値：No=1
5640 case 2:
5650 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                       ":
5660 locate 0,15:print "                                     "
5670 locate 0,15
5680 print" 3.数霊(かずたま)2人用を選択":goto Kazutama_main:
5690 'デバッグライン　ここから
5700 '0のとき
5710 'デバッグライン　ここまで
5720 'デバッグライン　ここから
5730 case 3:
5740 sp_on 2,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_on 0,1:sp_put 0,(5,585),0,0:pause 200:locate 0,15:print "                                               "
5750 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":No=0:goto Kazutama_main:
5760 'デバッグライン　ここまで
5770 'デバッグライン　ここから
5780 'デバッグライン　ここまで
5790 case 0:
5800 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5810 case 1:
5820 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                          ":locate 0,15:print " 2.数霊（かずたま）リスト 1人用":goto Kazutama_main:
5830 'デバッグライン　ここから
5840 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
5850 'デバッグライン　ここまで
5860 end select
5870 endif
5880 'バーチャルパッド　上 ここから
5890 if y = -1 then
5900 select case No
5910 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
5920 case 1:
5930 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 0,15:print" 4.トップ画面に行くを選択":goto Kazutama_main:
5940 'No:3 3.Help→2.設定 No:2
5950 case 0:
5960 sp_on 1,0:sp_on 0,0:sp_on 3,1:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                     ":locate 0,15:print" 3.数霊（かずたま）2人用を選択":goto Kazutama_main:
5970 case 2:
5980 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                    ":locate 0,15:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5990 case 3:
6000 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                               ":locate 0,15:print "2.数霊(かずたま)リスト1人用を選択":goto Kazutama_main:
6010 end select
6020 endif
6030 if bg=1 then
6040 select case No
6050 '1.数霊チェックを選択  パッドの右キー
6060 case 1:
6070 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
6080 '2.数霊チェック2人用   パッドの右キー
6090 case 3:
6100 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
6110 '3.トップ画面に行く パッドの右
6120 case 0:
6130 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
6140 '2.数霊リスト1人用 パッドの右キー
6150 case 2:
6160 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_List1:
6170 'プログラムの終了を選択
6180 end select
6190 '4.終了するを選択  パッドの右
6200 endif
6210 'バーチャルパッド　上　ここまで
6220 if key$ = chr$(31) then
6230 select case No
6240 case 0:
6250 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,15:print "                                                          ":
6260 if lang_flag = 1 then
6270 Else
6280 locate 0,15:print "                                      "
6290 No=2:locate 0,15:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
6300 endif
6310 case 1:
6320 No=0:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,585),0,0:locate 0,12:print "                                                          ":
6330 if lang_flag = 1 then
6340 Else
6350 locate 0,15:print"                                      "
6360 locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
6370 endif
6380 case 2:
6390 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                      ":
6400 if lang_flag = 1 then
6410 Else
6420 No=1:locate 0,15:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
6430 endif
6440 end select
6450 endif
6460 if key$=chr$(13) then
6470 select case No
6480 case 1:
6490 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
6500 case 2:
6510 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
6520 case 3:
6530 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
6540 '終了はトップメニューのみにする
6550 end select
6560 endif
6570 '前の画面に戻る
6580 'プログラムの終了
6590 '1人用
6600 '2人用
6610 '数霊(かずたま) 文字入力  1人用
6620 Surei_Input:
6630 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
6640 if mode = 0 then
6650 cls 3:font 32:init"kb:2"
6660 select case device_No
6670 case 1:
6680 gload Gazo$ + "InputKotodama_20230131.png",0,0,0
6690 gload Gazo$ + "CenterScreen_20230401.png",0,0,380
6700 case 2:
6710 gload Gazo$ + "InputKotodama_20230131.png",0,0,0
6720 end select
6730 play""
6740 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
6750 color rgb(255,0,0)
6760 if lang_flag=1 then
6770 '英語
6780 else
6790 print chr$(13)+chr$(13)+chr$(13)
6800 color rgb(255,255,255)
6810 print "文字を入れてください" + chr$(13)
6820 color rgb(255,255,255)
6830 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
6840 print chr$(13)
6850 color rgb(0,0,0)
6860 Input "入力文字:",buffer_moji$
6870 if buffer_moji$ = "" then
6880 ui_msg "未入力です":goto Surei_Input:
6890 else
6900 goto Surei_Result:
6910 endif
6920 endif
6930 endif
6940 if mode = 1 then
6950 cls 3:Font 32:
6960 gload Gazo$ + "InputKotodama.png"
6970 color rgb(255,0,0)
6980 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
6990 color rgb(255,255,255)
7000 print "文字を入れてください" + chr$(13)
7010 color rgb(255,0,0)
7020 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
7030 print "大文字のみ)" + chr$(13)
7040 color rgb(0,0,0)
7050 Input "文字入力:",buffer_moji2$
7060 goto Surei_Result3:
7070 'endif
7080 endif
7090 '数霊(かずたま)文字入力　2人用
7100 Surei_twoParson:
7110 cls 3:Font 32:init"kb:2"
7120 gload Gazo$ + "InputKotodama_20230131.png"
7130 '1人目入力
7140 if lang_flag = 1 then
7150 else
7160 print ""+chr$(13)+chr$(13)+chr$(13)
7170 color rgb(255,255,255)
7180 print "1人目の文字を入れてください" + chr$(13)
7190 color rgb(255,255,255)
7200 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
7210 color rgb(0,0,0)
7220 print chr$(13)
7230 Input "1人目文字入力:",buf_Parson1$
7240 endif
7250 Surei_twoParson2:
7260 cls 3:Font 32:init"kb:2"
7270 '2人目入力
7280 gload Gazo$ + "InputKotodama_20230131.png"
7290 if lang_falg = 1 then
7300 else
7310 print ""+chr$(13)+chr$(13)+chr$(13)
7320 color rgb(255,255,255)
7330 print "2人目の文字を入れてください" + chr$(13)
7340 color rgb(255,255,255)
7350 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
7360 color rgb(0,0,0)
7370 Input "2人目の文字入力:",buf_Parson2$
7380 goto Surei_Result2:
7390 endif
7400 '数霊　計算 パート
7410 '文字の計算関数
7420 'moji$:1文字を入れる
7430 func Complate(moji$)
7440 for n = 1 to 116
7450 if moji$ = bufline$(2*n) then
7460 buffcount = val(bufline$(2 * n + 1))
7470 endif
7480 next n
7490 endfunc buffcount
7500 '数霊　結果表示
7510 Surei_Result:
7520 cls 3:Font 32
7530 'ゼロカウント:zcount
7540 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
7550 '例 アカい:"い"の文字は無効な文字なので、はじく
7560 zcount=0
7570 'mojicount:入力文字数
7580 mojicount = len(buffer_moji$)
7590 for n=1 to mojicount
7600 for j=1 to 118
7610 if (bufcount$(n - 1) = bufline$(2 * j)) then
7620 bufcount$(n-1) = Mid$(buffer_moji$,n,1)
7630 endif
7640 next j
7650 next n
7660 ncount=0:count=0
7670 for i = 1 to mojicount
7680 bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7690 'ンのカウント
7700 if (bufcount$(i-1) = "ン") then ncount = ncount + 1
7710 next i
7720 if (ncount > 0) then
7730 'Listを表示する
7740 moji_List$(0) = "この単語は目に見える物です"
7750 moji_List$(1) = "この単語は目に見えない物です"
7760 num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
7770 if (num2 = 0) then
7780 else
7790 if (num2 = 1) then
7800 n1 = 9 * ncount
7810 endif
7820 endif
7830 endif
7840 for j=1 to mojicount
7850 bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7860 count = count + Complate(bufcount$(j - 1))
7870 next j
7880 count = count + n1
7890 if (ncount > 0) then count = count
7900 '182以上のとき,181を引く
7910 if buf_cofig_r = 0 then
7920 if (count > 181) then
7930 count = count - 181
7940 else
7950 if (buf_config_r = 1) then
7960 buf_count = Single_Complate(count)
7970 endif
7980 endif
7990 endif
8000 cls 3:Font 48+16
8010 gload Gazo$ + "Result_Screen3_20230319.png"
8020 if buf_config_r = 1 then
8030 print "入力文字:" + buffer_moji$ + chr$(13)
8040 print "数霊(かずたま):";buf_count;chr$(13)
8050 endif
8060 if lang_flag = 1 then
8070 else
8080 color rgb(255,0,0)
8090 print "入力文字:" + buffer_moji$ + chr$(13)
8100 endif
8110 if lang_flag = 1 then
8120 else
8130 color rgb(0,0,255)
8140 print "数霊(かずたま):";count;chr$(13)
8150 endif
8160 if lang_flag = 1 then
8170 else
8180 color rgb(0,0,0)
8190 print "エンター or スペース" + chr$(13)
8200 print  chr$(13)
8210 'endif
8220 endif
8230 key$ = input$(1)
8240 if ((key$ = chr$(13)) or (key$=" ")) then
8250 List$(0)="1.もう一度数霊を見る"
8260 List$(1)="2.トップ画面に行く"
8270 List$(2)="3.この数霊の説明を見る"
8280 List$(3)="4.数霊データーを保存"
8290 num=ui_select("List$","番号を選んでください")
8300 select case num
8310 case 0:
8320 goto Surei_Input:
8330 case 1:
8340 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
8350 for i=0 to 9
8360 bufcount$(i)=""
8370 next i
8380 goto TopScreen:
8390 case 2:
8400 goto Surei_Result4:
8410 case 3:
8420 s=Surei_Result_Save_File()
8430 ui_msg "保存しました"
8440 case -1:
8450 'goto Surei_Result:
8460 case else:
8470 goto Surei_Result:
8480 end select
8490 'ファイルを保存する
8500 else
8510 goto Surei_Result:
8520 endif
8530 '3-1 バージョン情報
8540 Version:
8550 cls 3:Font 32
8560 select case device_No
8570 case 1:
8580 gload Gazo$ + "Screen1_Version.png"
8590 gload Gazo$ + "downscreen.png",0,0,800
8600 case 2:
8610 gload Gazo$ + "Screen1_version.png"
8620 end select
8630 play ""
8640 play Voice_File_TopScreen$ + "Voice_Version.mp3"
8650 color rgb(255,0,0)
8660 print chr$(13)
8670 color rgb(255,255,255)
8680 if lang_flag = 1 then
8690 else
8700 print chr$(13)+chr$(13)+chr$(13)
8710 print "Ver:";Version$ + chr$(13)
8720 print "アプリ名:数霊計算機" + chr$(13)
8730 print "Basic for Android Runtime" + chr$(13)
8740 print "Author:licksjp" + chr$(13)
8750 print "制作開始:2021.7.28" + chr$(13)
8760 print chr$(13)
8770 print "(C)Copy right licksjp " + chr$(13)
8780 print "All rights reserved" + chr$(13)
8790 print chr$(13)
8800 color rgb(0,0,0)
8810 print "パッドの右を押してください" + chr$(13)
8820 endif
8830 bg=0:key$=""
8840 while (bg <> 1 and key$ <> chr$(13))
8850 bg = strig(1)
8860 key$ = inkey$
8870 pause 2
8880 wend
8890 if key$ = chr$(13) then
8900 goto TopScreen:
8910 else
8920 if bg=1 then
8930 goto TopScreen:
8940 else
8950 if lang_flag = 1 then
8960 else
8970 talk "無効なキーです":goto Version:
8980 endif
8990 endif
9000 endif
9010 '3-2 参考文献
9020 Reference_Book:
9030 cls 3:Font 48:play""
9040 select case device_No
9050 case 1:
9060 gload Gazo$ + "Screen1_Reference.png"
9070 gload Gazo$ + "downscreen.png",0,0,800
9080 case 2:
9090 gload Gazo$ + "Screen1_Reference.png"
9100 end select
9110 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
9120 color rgb(255,0,0)
9130 print chr$(13)+chr$(13)
9140 if lang_flag = 1 then
9150 else
9160 color rgb(255,255,255)
9170 print "書名:数霊" + chr$(13)
9180 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
9190 print "出版社:徳間書店" + chr$(13)
9200 print "ISBN:978-4-19-" + chr$(13)
9210 print "         865309-5" + chr$(13)
9220 print "定価:2300円 + 税" + chr$(13)
9230 color rgb(0,0,0)
9240 print "パッドの右を押してください"
9250 endif
9260 bg = 0:key$ = ""
9270 while (bg <> 1 and key$ <> chr$(13))
9280 bg = strig(1)
9290 key$ = inkey$
9300 pause 2
9310 wend
9320 if key$ = chr$(13) then
9330 goto TopScreen:
9340 else
9350 if bg = 1 then
9360 goto TopScreen:
9370 else
9380 talk "無効なキーです":goto Reference_Book:
9390 endif
9400 endif
9410 'ヘルプ画面　トップ画面
9420 Help:
9430 No=1:c=0
9440 play ""
9450 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
9460 cls 3:Font 48:
9470 select case device_No
9480 case 1:
9490 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9500 gload Gazo$ + "downscreen.png",0,0,800
9510 case 2:
9520 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9530 end select
9540 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0
9550 color rgb(255,0,0)
9560 print chr$(13)+chr$(13)+chr$(13)
9570 color rgb(255,255,255)
9580 print "番号を選んでください" + chr$(13)
9590 print " :1.バージョン" + chr$(13)
9600 print " :2.参考文献" + chr$(13)
9610 print " :3.トップ画面に行く" + chr$(13)
9620 color rgb(0,0,0)
9630 locate 0,15:print "                                     "
9640 if No = 1 then locate 0,15:print " 1.バージョンを選択"
9650 'y:バーチャルパッドの処理
9660 'key$:カーソルの処理
9670 'bg:バーチャルパッドの右ボタン
9680 Help_key:
9690 y = 0:key$ = "":bg=0
9700 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
9710 y = stick(1)
9720 key$ = inkey$
9730 bg=strig(1)
9740 pause 2
9750 wend
9760 'バーチャルパッド　ここから'
9770 if y = 1 then
9780 select case No
9790 'No の初期値：No=1
9800 case 1:
9810 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
9820 if lang_flag = 1 then
9830 else
9840 locate 0,15:print" 2.参考文献を選択":goto Help_key:
9850 endif
9860 'デバッグライン　ここから
9870 '0のとき
9880 'デバッグライン　ここまで
9890 'デバッグライン　ここから
9900 case 2:
9910 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                  "
9920 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に行くを選択":No=0:goto Help_key:
9930 'デバッグライン　ここまで
9940 'デバッグライン　ここから
9950 'デバッグライン　ここまで
9960 case 0:
9970 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
9980 'デバッグライン　ここから
9990 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
10000 'デバッグライン　ここまで
10010 end select
10020 endif
10030 'バーチャルパッド　上 ここから
10040 if y = -1 then
10050 select case No
10060 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
10070 case 1:
10080 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=0:locate 0,15:print"                                       ":locate 0,15:print" 3.トップ画面に行くを選択":goto Help_key
10090 'No:3 3.Help→2.設定 No:2
10100 case 0:
10110 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
10120 case 2:
10130 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                     ":locate 0,15:print" 1.バージョンを選択":goto Help_key:
10140 end select
10150 endif
10160 if bg = 1 then
10170 select case No
10180 '1.数霊チェックを選択  パッドの右キー
10190 case 1:
10200 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
10210 '2.設定を選択    パッドの右キー
10220 case 2:
10230 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
10240 '3.ヘルプを選択 パッドの右
10250 case 0:
10260 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
10270 'プログラムの終了を選択
10280 'if lang_flag = 1 then
10290 'lang_flag = 1:英語
10300 'Else
10310 'lang_flag = 0:日本語
10320 'endif
10330 end select
10340 '4.終了するを選択  パッドの右
10350 endif
10360 'バーチャルパッド　上　ここまで
10370 'バーチャルパッド　ここまで'
10380 'key$ = input$(1)
10390 'カーソルの下
10400 if key$ = chr$(31) then
10410 select case (No Mod 4)
10420 'バージョンから参考文献
10430 case 0:
10440 c=1:No=c:locate 0,15:Print "             ":locate 0,15:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
10450 '参考文献からトップ画面
10460 case 1:
10470 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "            ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10480 'トップ画面から終了
10490 '終了からバージョン
10500 case 2:
10510 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                     ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10520 case else:
10530 goto Help_key:
10540 end select
10550 endif
10560 'カーソル　上
10570 if key$ = chr$(30) then
10580 select case (c Mod 4)
10590 'バージョンから終了
10600 case 0:
10610 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:locate 0,15:print "                   ":locate 0,15:print " 4.終 了を選択":goto Help_key:
10620 '参考文献からバージョン
10630 case 1:
10640 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                   ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10650 'トップ画面から参考文献
10660 case 2:
10670 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":locate 0,15:print " 2.参考文献を選択":goto Help_key:
10680 '終了からトップ画面を選択
10690 case 3:
10700 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print"                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10710 case else:
10720 goto Help_key:
10730 end select
10740 endif
10750 'エンターキー：決定
10760 if key$=chr$(13) then
10770 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10780 if No=0 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10790 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10800 else
10810 goto Help_key:
10820 endif
10830 '登録文字の確認
10840 '文字を1文字入れて登録されているか調べるメニュー
10850 '設定項目
10860 Setting:
10870 cls 3:Font 48
10880 select case device_No
10890 case 1:
10900 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
10910 gload Gazo$ + "downscreen.png",0,0,800
10920  case 2:
10930 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
10940 end select
10950 play ""
10960 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
10970 No=1
10980 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:
10990 color rgb(0,0,255)
11000 print chr$(13)
11010 if lang_flag = 1 then
11020 'lang_flag = 1:英語
11030 else
11040 'lang_flag = 0:日本語
11050 color rgb(255,255,255)
11060 print chr$(13)
11070 print "番号を選んでください" + chr$(13)
11080 '-------コメント----------------
11090 'print " :1.登録文字の確認" + chr$(13)
11100 'print " :2.数霊文字確認" + chr$(13)
11110 '-------コメント----------------
11120 'print chr$(13)
11130 print " :1.文字の項目" + chr$(13)
11140 print " :2.結果表示設定" + chr$(13)
11150 print " :3.言語設定" + chr$(13)
11160 print " :4.トップ画面に行く" + chr$(13)
11170 endif
11180 color rgb(0,0,0)
11190 locate 0,15
11200 if No=1 then locate 0,15:print  "                                     ":locate 0,15:print " 1.文字の項目を選択"
11210 'y:バーチャルパッドの処理
11220 'key$:カーソルの処理
11230 'bg:バーチャルパッドの右ボタン
11240 SettingScreen:
11250 y = 0:key$ = "":bg=0
11260 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
11270 y = stick(1)
11280 key$ = inkey$
11290 bg=strig(1)
11300 pause 2
11310 wend
11320 'バーチャルパッド　ここから'
11330 'バーチャルパッド　ここから'
11340 if y = 1 then
11350 select case No
11360 'No の初期値：No=1
11370 case 1:
11380 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":color rgb(0,0,0):locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11390 'デバッグライン　ここから
11400 '0のとき
11410 'デバッグライン　ここまで
11420 'デバッグライン　ここから
11430 case 2:
11440 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                         "
11450 color rgb(0,0,0)::No=3
11460 if lang_flag = 1 then
11470 else
11480 locate 1,15:print "3.言語設定を選択":goto SettingScreen:
11490 endif
11500 'デバッグライン　ここまで
11510 case 3:
11520 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                              ":locate 1,15:print "4.トップ画面に行くを選択":No=0:goto SettingScreen:
11530 'デバッグライン　ここから
11540 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11550 'デバッグライン　ここまで
11560 case 0:
11570 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
11580 'デバッグライン　ここから
11590 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11600 'デバッグライン　ここまで
11610 end select
11620 endif
11630 'バーチャルパッド　上 ここから
11640 if y = -1 then
11650 select case No
11660 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11670 case 1:
11680 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 1,15:print"4.トップ画面に行くを選択":goto SettingScreen:
11690 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11700 case 0:
11710 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
11720 'No:3 3.Help→2.設定 No:2
11730 case 3:
11740 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.結果表示設定を選択":goto SettingScreen:
11750 case 2:
11760 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 1,15:print"1.文字の項目を選択":goto SettingScreen:
11770 end select
11780 endif
11790 if bg=1 then
11800 select case No
11810 '1.数霊チェックを選択  パッドの右キー
11820 case 1:
11830 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
11840 '2.設定を選択    パッドの右キー
11850 case 2:
11860 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
11870 '3.ヘルプを選択 パッドの右
11880 case 0:
11890 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
11900 'プログラムの終了を選択
11910 case 3:
11920 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Setting_Language:
11930 end select
11940 endif
11950 '4.終了するを選択  パッドの右
11960 'バーチャルパッド　ここまで'
11970 'カーソル下'
11980 if key$ = chr$(31) then
11990 select case (No Mod 4)
12000 '登録文字から数霊文字の確認
12010 case 1:
12020 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                     ":locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
12030 '数霊文字の確認からトップ画面に行く
12040 case 2:
12050 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "                                     ":locate 1,15:print"3.言語設定に行くを選択":goto SettingScreen:
12060 'トップ画面に行くから終了
12070 case 3:
12080 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,590),0,0:locate 0,15:print "                                       ":locate 1,15:print "4.トップ画面に行くを選択":goto SettingScreen:
12090 '終了から登録文字
12100 case 0:
12110 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
12120 end select
12130 endif
12140 'カーソル　上
12150 if key$ = chr$(30) then
12160 select case (No Mod 4)
12170 case 1:
12180 c=2:No=c:sp_on 0,1:sp_put 0,(5,300),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
12190 case 2:
12200 c=3:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
12210 case 3:
12220 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:goto SettingScreen:
12230 case 0:
12240 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,590),0,0:sp_on 0,0:goto SettingScreen:
12250 end select
12260 endif
12270 'エンターキーを押したとき
12280 if key$ = chr$(13) then
12290 if No=3 then goto Setting_Language:
12300 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
12310 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
12320 if No=0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
12330 endif
12340 '文字検索項目  ここから
12350 Moji_Search:
12360 cls 4:cls 3:Font 32+16:init"kb:2"
12370 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12380 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12390 play ""
12400 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
12410 print "" + chr$(13)
12420 color rgb(255,255,255)
12430 if lang_flag = 1 then
12440 Else
12450 print "文字を一文字入れてください" + chr$(13)
12460 endif
12470 color rgb(0,0,0)
12480 if lang_flag=1 then
12490 Else
12500 Input "登録文字:",moji$
12510 endif
12520 moji_count = len(moji$)
12530 if moji_count > 1 then
12540 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Moji_Search:
12550 else
12560 count=0
12570 for n = 0 to 116
12580 if bufline$(2*n) = moji$ then
12590 cls 3:font 48:init"kb:4"
12600 select case device_No
12610 case 1:
12620 gload Gazo$ + "downscreen.png",0,0,800
12630 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12640 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12650 case 2:
12660 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12670 end select
12680 play ""
12690 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12700 if lang_flag = 1 then
12710 Else
12720 print chr$(13)
12730 color rgb(255,255,255)
12740 print moji$;"は、登録されています。" + chr$(13)
12750 color rgb(0,0,0)
12760 print "ジョイパッドの右を押してください"
12770 endif
12780 bg = 0:key$ = ""
12790 while (bg <> 1 and key$ <> chr$(13))
12800 key$ = inkey$
12810 bg = strig(1)
12820 pause 2
12830 wend
12840 if key$ = chr$(13) then goto TopScreen:
12850 if bg=1 then goto TopScreen:
12860 count = count + 1
12870 endif
12880 next n
12890 if count = 0 then
12900 cls 3:font 48:init "kb:4"
12910 gload Gazo$ + "Moji_check.png"
12920 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12930 play ""
12940 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
12950 print chr$(13)
12960 if lang_flag = 1 then
12970 Else
12980 color rgb(255,255,255)
12990 print moji$;"は、登録されていません。" + chr$(13)
13000 color rgb(0,0,0)
13010 print "パッドの右を押してください" + chr$(13)
13020 endif
13030 kg = 0:key$ = ""
13040 while (kg <> 1 and key$ <> chr$(13))
13050 key$ = inkey$
13060 kg = strig(1)
13070 pause 2
13080 wend
13090 if ((key$ = chr$(13)) or (kg=1)) then goto TopScreen:
13100 endif
13110 endif
13120 Surei_Result2:
13130 cls 3:Font 48
13140 zcount1=0:zcount2=0:count1=0:count2=0
13150 '1人目
13160 mojicount1=len(buf_Parson1$)
13170 '2人目
13180 mojicount2 = len(buf_Parson2$)
13190 '1人目
13200 for n = 1 to mojicount1
13210 for j = 1 to 116
13220 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
13230 if bufcount1$(n-1) = bufline$(2*j) then
13240 zcount1 = zcount1 + 1
13250 endif
13260 next j
13270 next n
13280 '2人目
13290 for n = 1 to mojicount2
13300 for j = 1 to 116
13310 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
13320 if bufcount2$(n-1) = bufline$(2*j) then
13330 zount2 = zcount2 + 1
13340 endif
13350 next j
13360 next n
13370 '1人目
13380 for i=1 to mojicount1
13390 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
13400 p1 = Complate(bufcount1$(i-1))
13410 count1 = count1 + p1
13420 next i
13430 '2人目
13440 for i = 1 to mojicount2
13450 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
13460 p2 = Complate(bufcount2$(i-1))
13470 count2 = count2 + p2
13480 next i
13490 cls 3:
13500 select case device_No
13510 case 1:
13520 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
13530 gload Gazo$ + "downscreen.png",0,0,800
13540 case 2:
13550 gload Gazo$ + "downscreen.png",0,0,0
13560 end select
13570 color rgb(255,0,0)
13580 print ""+chr$(13)
13590 if lang_flag = 1 then
13600 else
13610 color rgb(255,255,255)
13620 print chr$(13)+chr$(13)
13630 print "1人目:";buf_Parson1$;chr$(13)
13640 print "数霊1:";count1;chr$(13)
13650 print "2人目:";buf_Parson2$;chr$(13)
13660 print "数霊2:";count2;chr$(13)
13670 print "数霊(合計):";count1 + count2;chr$(13)
13680 color rgb(0,0,0)
13690 print "バーチャルパッドの右" + chr$(13)
13700 endif
13710 key$ = "":bg = 0
13720 while (bg <> 1 and key$ <> chr$(13))
13730 bg = strig(1)
13740 key$ = inkey$
13750 pause 2
13760 wend
13770 if (bg = 1 or key$ = chr$(13))  then goto TopScreen:
13780 Surei_Result3:
13790 cls 3:Font 48
13800 zcount2 = 0:count2 = 0
13810 mojicount2 = len(buffer_moji2$)
13820 for n = 1 to mojicount2
13830 for j = 1 to 116
13840 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
13850 if bufcount2$(n - 1) = bufline$(2 * j) then
13860 zcount2 = zcount2 + 1
13870 endif
13880 next j
13890 next n
13900 for i = 1 to mojicount2
13910 n2 = Complate(bufcount2$(i-1))
13920 count2 = count2 + n2
13930 next i
13940 gload Gazo$ + "Screen5.png"
13950 if lang_flag = 1 then
13960 else
13970 color rgb(255,0,0)
13980 print "数霊の結果表示" + chr$(13)
13990 color rgb(255,255,255)
14000 print "１回目回の文字入力:";buffer_moji$;chr$(13)
14010 print "１回目の数霊(かずたま)";count;chr$(13)
14020 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
14030 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
14040 color rgb(0,0,0)
14050 print "エンターキー:トップ画面";chr$(13)
14060 print "c or C キー:数霊の比較";chr$(13)
14070 endif
14080 key$ = "":bg = 0
14090 while (key$ <> chr$(13) and bg <> 1)
14100 bg = strig(1)
14110 key$ = inkey$
14120 pause 2
14130 wend
14140 if bg = 1 then goto TopScreen:
14150 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
14160 if key$ = "c" or key$ = "C" then
14170 if count = count2 then
14180 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
14190 else
14200 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
14210 endif
14220 endif
14230 Moji_Count_Check:
14240 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
14250 cls 3:Font 48
14260 select case device_No
14270 case 1:
14280 gload Gazo$ + "Moji_check.png"
14290 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
14300 gload Gazo$ + "downscreen.png",0,0,800
14310 case 2:
14320 gload Gazo$ + "Moji_check.png",0,0,0
14330 end select
14340 n = 0
14350 open FILE_csv$ for input as #1
14360 while eof(1) = 0
14370 line input #1, line$
14380 n = n + 1
14390 wend
14400 close #1
14410 play ""
14420 if n = 118 then
14430 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
14440 if lang_flag = 1 then
14450 else
14460 print "" + chr$(13)
14470 color rgb(255,255,255)
14480 print "文字の登録文字数は";n;"文字" + chr$(13)
14490 color rgb(0,0,0)
14500 print "パッドの右を押してください" + chr$(13)
14510 endif
14520 endif
14530 key$ = "":bg = 0
14540 while (key$ <> chr$(13) and bg <> 1)
14550 key$=inkey$
14560 bg=strig(1)
14570 pause 2
14580 wend
14590 if bg = 1 then goto TopScreen:
14600 if key$ = chr$(13) then
14610 goto TopScreen:
14620 else
14630 goto Moji_Count_Check:
14640 endif
14650 'Save 関数
14660 file_kazutama = 0
14670 file_kazutama = Save_File()
14680 func Save_File()
14690 open SAVE_DATA1$  for output as #1
14700 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
14710 close #1
14720 endfunc
14730 Select_moji:
14740 cls 3:font 48:No = 1
14750 select case device_No
14760 case 1:
14770 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
14780 'gload Gazo$ + "MiddleScreen_20230401.png",0,0,560
14790 gload Gazo$ + "downscreen.png",0,0,800
14800 case 2:
14810 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
14820 end select
14830 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
14840 color rgb(255,0,0)
14850 if lang_flag = 1 then
14860 else
14870 play ""
14880 play Voice_File_TopScreen$ + "Voice_Select_Moji20230217.mp3"
14890 print chr$(13)+chr$(13)+chr$(13)
14900 color rgb(255,255,255)
14910 print "番号を選んでください" + chr$(13)
14920 print " :1.登録文字検索"+ chr$(13)
14930 print " :2.登録文字数の確認" + chr$(13)
14940 print " :3.トップ画面に戻る" + chr$(13)
14950 color rgb(0,0,0)
14960 locate 0,15
14970 if No = 1 then print " 1.登録文字検索を選択"
14980 endif
14990 Entry_check_key:
15000 y = 0:key$ = "":bg=0
15010 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
15020 y = stick(1)
15030 key$ = inkey$
15040 bg=strig(1)
15050 pause 2
15060 wend
15070 'バーチャルパッド　ここから'
15080 'バーチャルパッド　ここから'
15090 if y = 1 then
15100 select case No
15110 'No の初期値：No=1
15120 case 1:
15130 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
15140 'デバッグライン　ここから
15150 '0のとき
15160 'デバッグライン　ここまで
15170 'デバッグライン　ここから
15180 case 2:
15190 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                       "
15200 :No=0
15210 'if lang_flag = 1 then
15220 'Else
15230 color rgb(0,0,0):locate 0,15:print " 3.トップ画面に戻るを選択":goto Entry_check_key:
15240 'endif
15250 'cls:color rgb(255,255,255):print"ok"
15260 'デバッグライン　ここまで
15270 'デバッグライン　ここから
15280 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
15290 'デバッグライン　ここまで
15300 case 0:
15310 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.登録文字数の確認を選択":goto Entry_check_key:
15320 'デバッグライン　ここから
15330 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
15340 'デバッグライン　ここまで
15350 end select
15360 endif
15370 'バーチャルパッド　上 ここから
15380 if y = -1 then
15390 select case No
15400 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15410 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15420 case 1:
15430 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print"3.トップ画面に戻るを選択":goto Entry_check_key:
15440 'No:3 3.Help→2.設定 No:2
15450 case 0:
15460 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
15470 case 2:
15480 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print "1.登録文字検索":goto Entry_check_key:
15490 end select
15500 endif
15510 if bg=1 then
15520 select case No
15530 '1.数霊チェックを選択  パッドの右キー
15540 case 1:
15550 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15560 '2.設定を選択    パッドの右キー
15570 case 2:
15580 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15590 '3.ヘルプを選択 パッドの右
15600 case 0:
15610 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0: goto TopScreen:
15620 end select
15630 endif
15640 '4.終了するを選択  パッドの右
15650 'バーチャルパッド　ここまで'
15660 'key$ = input$(1)
15670 'カーソルの下
15680 if key$ = chr$(31) then
15690 select case (No Mod 4)
15700 case 0:
15710 c=1:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
15720 case 1:
15730 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,500),0,0:sp_on 3,0:goto Entry_check_key:
15740 case 2:
15750 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:goto Entry_check_key:
15760 case 3:
15770 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
15780 end select
15790 endif
15800 'カーソル　上
15810 if key$ = chr$(30) then
15820 select case (No Mod 4)
15830 case 0:
15840 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
15850 case 1:
15860 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
15870 case 2:
15880 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
15890 case 3:
15900 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
15910 end select
15920 endif
15930 'エンターキーを押す
15940 if key$ = chr$(13) then
15950 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15960 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15970 if No = 0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15980 endif
15990 '
16000 Kakunin_Surei_count:
16010 cls 3:font 48:No=1
16020 select case device_No
16030 case 1:
16040 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
16050 'gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
16060 gload Gazo$ + "downscreen.png",0,0,800
16070 case 2:
16080 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
16090  end select
16100 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
16110 color rgb(255,0,0)
16120 print chr$(13)+chr$(13)+chr$(13)
16130 color rgb(255,255,255)
16140 print "番号を選んでください" + chr$(13)
16150 print " :1.数霊リスト 1人用" + chr$(13)
16160 print " :2.結果表示設定" + chr$(13)
16170 print " :3.トップ画面に行く" + chr$(13)
16180 print "" + chr$(13)
16190 color rgb(0,0,0)
16200 locate 0,15:print"                                                         "
16210 if No = 1 then locate 1,15:print "1.数霊リスト　1人用を選択"
16220 Entry_List:
16230 y = 0:key$ = "":bg=0
16240 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
16250 y = stick(1)
16260 key$ = inkey$
16270 bg = strig(1)
16280 pause 2
16290 wend
16300 'バーチャルパッド　ここから'
16310 'バーチャルパッド　ここから'
16320 'バーチャルパッド　下
16330 if y = 1 then
16340 select case No
16350 'No の初期値：No=1
16360 case 1:
16370 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.結果表示設定を選択":goto Entry_List:
16380 'デバッグライン　ここから
16390 '0のとき
16400 'デバッグライン　ここまで
16410 'デバッグライン　ここから
16420 'color rgb(0,0,0):locate 0,15:print " 4.終了を選択":goto Entry_List:
16430 'cls:color rgb(255,255,255):print"ok"
16440 'デバッグライン　ここまで
16450 case 0:
16460 sp_on 3,0:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 1.数霊リスト 1人用を選択":No=1:goto Entry_List:
16470 case 2:
16480 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                      ":No=0:locate 1,15:print "3．トップ画面に行くを選択":goto Entry_List:
16490 'デバッグライン　ここから
16500 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
16510 'デバッグライン　ここまで
16520 'デバッグライン　ここから
16530 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
16540 'デバッグライン　ここまで
16550 end select
16560 endif
16570 'バーチャルパッド　上 ここから
16580 if y = -1 then
16590 select case No
16600 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
16610 case 2:
16620 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 2.結果表示設定を選択":goto Entry_List:
16630 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
16640 case 0:
16650 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 1,15:print"3.トップ画面に行くを選択":goto Entry_List:
16660 'No:3 3.Help→2.設定 No:2
16670 case 1:
16680 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print "1.数霊リスト 1人用を選択":goto Entry_List:
16690 end select
16700 endif
16710 if bg = 1 then
16720 select case No
16730 '1.数霊リスト 一人用を選択を選択  パッドの右キー
16740 case 1:
16750 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16760 '2.設定を選択  パッドの右キー
16770 case 2:
16780 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16790 case 0:
16800 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16810 end select
16820 endif
16830 if key$=chr$(13) then
16840 select case No
16850 case 0:
16860 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16870 case 1:
16880 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16890 case 2:
16900 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16910 end select
16920 endif
16930 '4.終了するを選択  パッドの右
16940 'バーチャルパッド　ここまで'
16950 Surei_List1:
16960 cls 3:font 48
16970 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
16980 file$ = dir$(SAVE_DATA1$,0)
16990 'ファイルが無いときの画面
17000 if file$ = ""  then
17010 '背景画面表示
17020 select case device_No
17030 case 1:
17040 gload Gazo$ + "KazutamaList1.png",0
17050 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
17060 gload Gazo$+"downscreen.png",0,0,800
17070 case 2:
17080 gload Gazo$ + "KazutamaList1.png"
17090 end select
17100 print chr$(13)
17110 color rgb(255,255,255):print "登録ファイルはございません" + chr$(13)
17120 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
17130 'else
17140 'endif
17150 bg = 0:key$ = ""
17160 while (key$ <> chr$(13) and bg<>1)
17170 key$ = inkey$
17180 bg = strig(1)
17190 pause 2
17200 wend
17210 'エンターキーもしくはバーチャルパッドの右でトップに行く
17220 if (bg = 1  or key$ = chr$(13)) then goto TopScreen:
17230 else
17240 cls 3:buffer_list_count = Loadcount()
17250 color rgb(255,255,255)
17260 if lang_flag = 1 then
17270 Else
17280 talk "登録件数は" + str$(buffer_list_count) + "件です"
17290 select case device_No
17300 Case 1:
17310 gload Gazo$ + "KazutamaList1_Entry.png",0
17320 gload Gazo$ + "downscreen.png",0,0,800
17330 case 2:
17340 gload Gazo$+"KazutamaList1_Entry.png",0,0,0
17350 end select
17360 color rgb(0,0,255)
17370 print chr$(13)
17380 color rgb(255,255,255)
17390 print "登録件数:";buffer_list_count;"件";chr$(13)
17400 color rgb(0,0,0)
17410 print "パッドの右を押してください" + chr$(13)
17420 endif
17430 bg = 0:key$ = "":bg2 = 0
17440 while (key$ <> chr$(13) and bg <> 1)
17450 key$ = inkey$
17460 bg = strig(1)
17470 bg2=strig(0)
17480 pause 2
17490 wend
17500 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
17510 if (key$ = chr$(13) or bg = 1) then pause 2:goto KotodamaList_page:
17520 endif
17530 if (bg2 = 1) then pause 2:goto TopScreen:
17540 func Loadcount()
17550 n = 0
17560 'while eof(1)=-1
17570 open SAVE_DATA1$  for input as #1
17580 while eof(1) <> -1
17590 line input #1,line$
17600 n = n + 1
17610 wend
17620 close #1
17630 count = n
17640 endfunc count
17650 count_line = Loadcount()
17660 func Kotodama$(buf$)
17670 color rgb(255,255,255)
17680 b = len("数霊:")
17690 a$ = Mid$(buf$,b+1,len(buf$))
17700 for i=0 to 118
17710 color rgb(255,255,255)
17720 if bufline3$(2 * i) ="数霊:" + a$  then
17730 moji_$ = bufline3$(2*i + 1)
17740 endif
17750 next i
17760 kotodama$ = moji_$
17770 endfunc kotodama$
17780 KotodamaList_page:
17790 cls 3:font 48:m = 0:
17800 select case device_No
17810 case 1:
17820 gload Gazo$ + "Screen5_Surei_List.png"
17830 gload Gazo$ + "downscreen.png",0,0,800
17840 case 2:
17850 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
17860 end select
17870 if SAVE_DATA1$ = "" then
17880 cls 3:color rgb(255,255,255):print"ファイルがありません"
17890 else
17900 a = Loadcount()
17910 open SAVE_DATA1$  for input as #1
17920 for i=0 to a-1
17930 for n=0 to 1
17940 input #1,line$
17950 bufKaztama$(i,n) = line$
17960 next n
17970 next i
17980 close #1
17990 l = 0:n=0
18000 select case device_No
18010 case 1:
18020 gload Gazo$ + "Screen5_Surei_List.png"
18030 gload Gazo$ + "downscreen.png",0,0,800
18040 case 2:
18050 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
18060 end select
18070 while (buffer_list_count >= l)
18080 cls
18090 color rgb(255,0,0)
18100 print chr$(13)
18110 color rgb(255,255,255)
18120 n=n+1
18130 print chr$(13)
18140 print "番号:";l+1;chr$(13)
18150 print bufKaztama$(l,0) + chr$(13)
18160 print bufKaztama$(l,1) + chr$(13)
18170 Kmoji$ = moji$
18180 print chr$(13) + chr$(13) + chr$(13)
18190 color rgb(0,0,0)
18200 if buffer_list_count=1 then
18210 print " :パッドの左:トップ画面"+chr$(13)
18220 ui_msg "登録件数は1件です。"
18230 else
18240 if buffer_list_count > 1 then
18250 print " :パッドの左:トップ画面" + chr$(13)
18260 print " :パッドの右:次へ行く" + chr$(13)
18270 endif
18280 endif
18290 key$ = "":bg = 0:bg2 = 0
18300 while (key$ <> chr$(13) and bg <> 1 and bg2 <> 1)
18310 key$ = inkey$
18320 bg = strig(1)
18330 bg2 = strig(0)
18340 pause 2
18350 wend
18360 'if n > 1 then
18370 if (key$ = " " OR bg = 1) then
18380 if n > 1 then
18390 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
18400 endif
18410 else
18420 if ((bg2 = 1) or (key$=chr$(13))) then
18430 goto TopScreen:
18440 endif
18450 else
18460 goto KotodamaList_page:
18470 endif
18480 wend
18490 endif
18500 'ndif
18510 '結果表示２ Menu1
18520 Surei_Result4:
18530 cls 3:font 32+16:init"kb:4"
18540 for i=0 to 181 + 3 - 1
18550 if i = count  then
18560 buffer$ = bufline2$(count + 4,0)
18570 endif
18580 next i
18590 if len(buffer$) > 21 and len(buffer$) <= 45 then
18600 buffer2$ = Mid$(buffer$,1,22)
18610 buffer3$ = Mid$(buffer$,23,(len(buffer$) - 22))
18620 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13)
18630 else
18640 if len(buffer$) <= 21 then
18650 buffer2$ = Mid$(buffer$,1,21)
18660 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
18670 else
18680 if len(buffer$) > 45 and len(buffer$) <= 62 then
18690 buffer2$ = Mid$(buffer$,1,22)
18700 buffer3$ = Mid$(buffer$,23,22)
18710 buffer4$ = Mid$(buffer$,44,(len(buffer$)-44))
18720 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13)
18730 else
18740 if len(buffer$) > 64 and len(buffer$) <= 81 then
18750 buffer2$ = Mid$(buffer$,1,22)
18760 buffer3$ = Mid$(buffer$,23,20)
18770 buffer4$ = Mid$(buffer$,44,20)
18780 buffer5$ = Mid$(buffer$,65,(len(buffer$)-65))
18790 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13)
18800 if len(buffer$) > 81 and len(buffer$) <= 110 then
18810 buffer2$ = Mid$(buffer$,1,22)
18820 buffer3$ = Mid$(buffer$,23,20)
18830 buffer4$ = Mid$(buffer$,43,20)
18840 buffer5$ = Mid$(buffer$,63,20)
18850 buffer6$ = Mid$(buffer$,83,(len(buffer$) - 83))
18860 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13)
18870 endif
18880 endif
18890 endif
18900 endif
18910 endif
18920 Surei_Result4_2:
18930 select case device_No
18940 case 1:
18950 gload Gazo$ + "Screen1_Result2.png"
18960 gload Gazo$ + "downscreen.png",0,0,800
18970 case 2:
18980 gload Gazo$ +"Screen1_Result2.png"
18990 end select
19000 Result_Menu_List$(0)="1.トップ画面に行く"
19010 Result_Menu_List$(1)="2.数霊のデーターを保存"
19020 Result_Menu_List$(2)="3.もう一度、数霊を調べる"
19030 cls
19040 print chr$(13)
19050 if lang_flag = 1 then
19060 else
19070 color rgb(127,255,212)
19080 print chr$(13);chr$(13)
19090 print "入力文字:";buffer_moji$;chr$(13)
19100 print "数霊:";count;chr$(13)
19110 color rgb(255,255,255)
19120 print "数霊の説明:"+chr$(13)
19130 print buffer$
19140 color rgb(0,0,0)
19150 locate 0,15
19160 print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
19170 endif
19180 key$ = "":bg = 0:bg2 = 0
19190 while (bg<>1 and bg2<>1)
19200 key$ = inkey$
19210 bg = strig(1)
19220 bg2 = strig(0)
19230 pause 2
19240 wend
19250 if ((bg = 1) or (bg2 = 1)) then
19260 num = ui_select("Result_Menu_List$","番号を選んでください")
19270 endif
19280 if num = 0 then goto TopScreen:
19290 if num = 1 then goto File_save:
19300 if num = 2 then goto Surei_Input:
19310 if num = -1 then goto Surei_Result4
19320 File_save:
19330 'ファイルがない時
19340 if dir$(SAVE_DATA1$) = " " then
19350 open SAVE_DATA1$ for output as #1
19360 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19370 close #1
19380 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19390 'ファイルが有る時
19400 else
19410 open SAVE_DATA1$ for append as #1
19420 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19430 close #1
19440 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19450 endif
19460 func All_clear()
19470 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
19480 endfunc
19490 'ここから
19500 Config_moji1:
19510 cls 3:Font 48
19520 select case device_No
19530 case 1:
19540 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19550 gload Gazo$ + "downscreen.png",0,0,800
19560 case 2:
19570  gload  Gazo$ + "Screen1_Setting_Top.png",0,0,0
19580 end select
19590 play ""
19600 No=1
19610 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19620 color rgb(0,0,255)
19630 print chr$(13)
19640 if lang_flag = 1 then
19650 'lang_flag = 1:英語
19660 else
19670 'lang_flag = 0:日本語
19680 color rgb(255,255,255)
19690 print "番号を選んでください" + chr$(13)
19700 print " :1.文字の項目" + chr$(13)
19710 print " :2.結果表示設定" + chr$(13)
19720 print " :3.トップ画面に行く" + chr$(13)
19730 print " :4.終 了" + chr$(13)
19740 endif
19750 color rgb(0,0,0)
19760 locate 1,12
19770 if No = 1 then print "1.文字の項目"
19780 'y:バーチャルパッドの処理
19790 'key$:カーソルの処理
19800 'bg:バーチャルパッドの右ボタン
19810 Config_moji1_Screen:
19820 y = 0:key$ = "":bg=0
19830 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>1)
19840 y = stick(1)
19850 key$ = inkey$
19860 bg=strig(1)
19870 pause 2
19880 wend
19890 'バーチャルパッド　ここから'
19900 'バーチャルパッド　ここから'
19910 if y = 1 then
19920 select case No
19930 'No の初期値：No=1
19940 case 1:
19950 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
19960 'デバッグライン　ここから
19970 '0のとき
19980 'デバッグライン　ここまで
19990 'デバッグライン　ここから
20000 case 2:
20010 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
20020 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
20030 'if lang_flag = 1 then
20040 'else
20050 locate 1,12:print "3.トップ画面に行くを選択"
20060 'endif
20070 'デバッグライン　ここまで
20080 case 3:
20090 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
20100 'デバッグライン　ここから
20110 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
20120 'デバッグライン　ここまで
20130 case 0:
20140 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20150 'デバッグライン　ここから
20160 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
20170 'デバッグライン　ここまで
20180 end select
20190 endif
20200 'バーチャルパッド　上 ここから
20210 if y = -1 then
20220 select case No
20230 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
20240 case 1:
20250 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
20260 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
20270 case 0:
20280 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
20290 'No:3 3.Help→2.設定 No:2
20300 case 3:
20310 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20320 case 2:
20330 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
20340 end select
20350 endif
20360 if bg=1 then
20370 select case No
20380 '1.数霊チェックを選択  パッドの右キー
20390 case 1:
20400 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
20410 '2.設定を選択    パッドの右キー
20420 case 2:
20430 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
20440 '3.ヘルプを選択 パッドの右
20450 case 3:
20460 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
20470 'プログラムの終了を選択
20480 case 0:
20490 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
20500 'if lang_flag = 1 then
20510 'Else
20520 ui_msg "プログラムを終了します":end
20530 'endif
20540 end select
20550 endif
20560 '4.終了するを選択  パッドの右
20570 'バーチャルパッド　ここまで'
20580 'SettingScreen:
20590 'key$ = input$(1)
20600 'カーソル下'
20610 if key$ = chr$(31) then
20620 select case (No Mod 4)
20630 '登録文字から数霊文字の確認
20640 case 1:
20650 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
20660 '数霊文字の確認からトップ画面に行く
20670 case 2:
20680 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
20690 'トップ画面に行くから終了
20700 case 3:
20710 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
20720 '終了から登録文字
20730 case 0:
20740 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20750 end select
20760 endif
20770 'カーソル　上
20780 if key$ = chr$(30) then
20790 select case (No Mod 4)
20800 case 1:
20810 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
20820 case 2:
20830 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
20840 case 3:
20850 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
20860 case 0:
20870 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
20880 end select
20890 endif
20900 'エンターキーを押したとき
20910 if key$ = chr$(13) then
20920 if No=3 then goto TopScreen:
20930 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
20940 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
20950 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
20960 'lse
20970 'o'o SettingScreen:
20980 endif
20990 'ここまで
21000 Config_moji2:
21010 cls 3:Font 48
21020 select case device_No
21030 case 1:
21040 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
21050 gload Gazo$ + "downscreen.png",0,0,800
21060  case 2:
21070 gload Gazo$ + "Screen1_Setting_Top.png "
21080  end select
21090 play ""
21100 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
21110 No=1
21120 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
21130 color rgb(0,0,255)
21140 'print "●設定項目" + chr$(13)
21150 print chr$(13)
21160 if lang_flag = 1 then
21170 'lang_flag = 1:英語
21180 else
21190 'lang_flag = 0:日本語
21200 color rgb(255,255,255)
21210 print "番号を選んでください" + chr$(13)
21220 'print " :1.文字の項目" + chr$(13)
21230 'print " :2.結果表示設定" + chr$(13)
21240 print " :1.文字の項目" + chr$(13)
21250 print " :2.結果表示設定" + chr$(13)
21260 print " :3.トップ画面に行く" + chr$(13)
21270 print " :4.終 了" + chr$(13)
21280 endif
21290 color rgb(0,0,0)
21300 locate 1,12
21310 if No = 1 then print "1.文字の項目"
21320 'y:バーチャルパッドの処理
21330 'key$:カーソルの処理
21340 'bg:バーチャルパッドの右ボタン
21350 config_moji2:
21360 y = 0:key$ = "":bg=0
21370 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 1)
21380 y = stick(1)
21390 key$ = inkey$
21400 bg = strig(1)
21410 pause 2
21420 wend
21430 'バーチャルパッド　ここから'
21440 'バーチャルパッド　ここから'
21450 if y = 1 then
21460 select case No
21470 'No の初期値：No=1
21480 case 1:
21490 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
21500 'デバッグライン　ここから
21510 '0のとき
21520 'デバッグライン　ここまで
21530 'デバッグライン　ここから
21540 case 2:
21550 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
21560 color rgb(0,0,0)::No=2:goto SettingScreen:
21570 if lang_flag = 1 then
21580 else
21590 locate 0,12:print " 3.トップ画面に行くを選択"
21600 endif
21610 'cls:color rgb(255,255,255):print"ok"
21620 'デバッグライン　ここまで
21630 case 3:
21640 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
21650 'デバッグライン　ここから
21660 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
21670 'デバッグライン　ここまで
21680 case 0:
21690 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21700 'デバッグライン　ここから
21710 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
21720 'デバッグライン　ここまで
21730 end select
21740 endif
21750 'バーチャルパッド　上 ここから
21760 if y = -1 then
21770 select case No
21780 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
21790 case 1:
21800 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
21810 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
21820 case 0:
21830 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
21840 'No:3 3.Help→2.設定 No:2
21850 case 3:
21860 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
21870 case 2:
21880 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
21890 end select
21900 endif
21910 '決定ボタン
21920 if bg=1 then
21930 select case No
21940 '1.数霊チェックを選択  パッドの右キー
21950 case 1:
21960 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
21970 '2.設定を選択    パッドの右キー
21980 case 2:
21990 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
22000 '3.ヘルプを選択 パッドの右
22010 case 3:
22020 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
22030 'プログラムの終了を選択
22040 case 0:
22050 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
22060 'if lang_flag = 1 then
22070 'Else
22080 ui_msg "プログラムを終了します":end
22090 'endif
22100 end select
22110 endif
22120 '4.終了するを選択  パッドの右
22130 'バーチャルパッド　ここまで'
22140 'カーソル下'
22150 if key$ = chr$(31) then
22160 select case (No Mod 4)
22170 '登録文字から数霊文字の確認
22180 case 1:
22190 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22200 '数霊文字の確認からトップ画面に行く
22210 case 2:
22220 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
22230 'トップ画面に行くから終了
22240 case 3:
22250 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
22260 '終了から登録文字
22270 case 0:
22280 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
22290 end select
22300 endif
22310 'カーソル　上
22320 if key$ = chr$(30) then
22330 select case (No Mod 4)
22340 case 1:
22350 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
22360 case 2:
22370 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
22380 case 3:
22390 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
22400 case 0:
22410 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
22420 end select
22430 endif
22440 'エンターキーを押したとき
22450 if key$ = chr$(13) then
22460 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
22470 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
22480 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
22490 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
22500 'lse
22510 'o'o SettingScreen:
22520 endif
22530 '結果表示設定
22540 Result_Setting:
22550 color rgb(255,255,255)
22560 'dim list$(4)
22570 'ファイル読み込み
22580 '1.ファイルが有るか無いかのチェック
22590 if Dir$(System$) = "" then
22600 '1-1.ファイルがないとき
22610 '上のSystemフォルダを作成
22620 mkdir "./data/system/"
22630 list$(0) = "●:出た数字から181を引く"
22640 list$(1) = " :出た数字から180を引き単数変換"
22650 open System$ for output as #1
22660 print #1,"config_r=0"
22670 close #1
22680 ui_msg "ファイルを作成しました"
22690 'ファイル作成
22700 else
22710 '1-2.ファイルが有るとき
22720 'config_r:0 出た数字から181を引く
22730 'config_r:1 出た数字から180を引いて単数変換
22740 'open "./System/config.sys" for input as #1
22750 'ファイルが有るときファイルを読み込み
22760 open System$ for input as #1
22770 line input #1,buf_line$
22780 'buf$にデーターをコピーする
22790 buf$ = buf_line$
22800 close #1
22810 if len(buf$) = 10 then
22820 if left$(buf$,9) = "config_r=" then
22830 buf$ = right$(buf_line$,1)
22840 if buf$ = "1" then
22850 '1.System$ ファイルを削除(config.sys)
22860 '2.1行目をconfig_r=1と書き、保存する
22870 buf_config_r = 1
22880 'list$(0) = "●:1.出た数字から180を引いて単数変換"
22890 'list$(1) = " :2.出た数字から181を引く"
22900 else
22910 if buf$ = "0" then
22920 buf_config_r = 0
22930 ' list$(0) = "●:1.出た数字から181を引く"
22940 'list$(1) = " :2.出た数字から180を引いて単数変換"
22950 endif
22960 endif
22970 endif
22980 endif
22990 endif
23000 '"●:1.出た数字から180を引く"をlist$(0)に代入
23010 if buf_config_r =  0 then
23020 list$(0) = "●:1.出た数字から181を引く"
23030 list$(1) = " :2.出た数字から180を引いて単数変換"
23040 else
23050 list$(0) = "●:1.出た数字から180を引いて単数変換"
23060 list$(1) = " :2.出た数字から181を引く"
23070 endif
23080 list$(2) = " :トップ画面に戻る"
23090 list_num = ui_select("list$","番号を選んでください")
23100 play ""
23110 Select case (list_num)
23120 case 0:
23130 if buf$ = "1" then
23140 buf_config_r = 0:
23150 'データーを変更したのでファイルを削除
23160 kill System$
23170 'ファイルを新しく作成
23180 open System$ for output as #1
23190 print #1,"config_r=0"
23200 close #1
23210 ui_msg "設定を変更しました。"
23220 else
23230 'if buf$ = "0" then
23240 'buf_config_r = 1
23250 'kill System$
23260 'open Syetem$ for output as #1
23270 'print #1,"config_r=1"
23280 'close #1
23290 'ui_msg "設定を変更しました"
23300 'endif
23310 endif
23320 goto config_moji2:
23330 case 1:
23340 if buf$ = "0" then
23350 buf_config_r = 1:
23360 'データーを変更したので、ファイルを削除
23370 kill System$
23380 'ファイルを新しく作成
23390 open System$ for output as #1
23400 print #1,"config_r=1"
23410 close #1
23420 ui_msg "設定を変更しました"
23430 else
23440 kill System$
23450 if buf$ = "1" then
23460 open System$ for output as #1
23470 print #1,"config_r=0"
23480 close #1
23490 ui_msg "設定を変更しました"
23500 endif
23510 endif
23520 goto config_moji2:
23530 case 2:
23540 'トップ画面に飛ぶ
23550 goto TopScreen:
23560 case 3:
23570 'プログラムを終了する
23580 cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
23590 end select
23600 '単数変換
23610 Func Single_Complate(num)
23620 '1.出てきた数字から180を引く
23630 a = num - 180
23640 'a:10〜99
23650 Re1:
23660 if (a > 9 and a < 100) then
23670 b1 = fix(a / 10)
23680 b2 = 10 * a - b1
23690 d1 = b1 + b2
23700 if c > 9 then
23710 goto Re1:
23720 else
23730 c = d1:goto Re2:
23740 endif
23750 endif
23760 Re2:
23770 buffer = c
23780 endfunc buffer
23790 Func Surei_Result_Save_File()
23800 'ファイルがないとき
23810 if dir$(SAVE_DATA1$) = "" then
23820 open SAVE_DATA1$ for output as #1
23830 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
23840 close #1
23850 ui_msg "保存しました":talk "保存しました":goto Surei_Result:
23860 else
23870 open SAVE_DATA1$ for append as #1
23880 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
23890 close #1
23900 ui_msg "保存しました":talk "保存しました":goto Surei_Result
23910 endif
23920 endfunc
23930 '言語設定
23940 Setting_Language:
23950 cls 3:screen 1,1,1,1:No=2
23960 select case device_No
23970 case 1:
23980 gload Gazo$ + "Screen1.png",0,0,0
23990 gload Gazo$ + "downscreen.png",0,0,800
24000 case 2:
24010 gload Gazo$ + "Screen1.png",0,0,0
24020 end select
24030 init "Kb:4"
24040 sp_on 1,1:sp_on 0,0
24050 sp_put 0,(0,300),0,0
24060 sp_put 1,(0,400),1,0
24070 color rgb(0,0,255)
24080 'print "番号を選んでください"+chr$(13)
24090 'if lang_flag=0 then
24100 'print "言語設定:日本語"+chr$(13)
24110 'else
24120 'print "言語設定:英 語"+chr$(13)
24130 Change_Language:
24140 if lang_flag = 1 then
24150 cls
24160 print "It has changed Language"+chr$(13)
24170 color rgb(255,255,255)
24180 print "Select the Number"+chr$(13)
24190 print " :1.English → Japanse"+chr$(13)
24200 print " :2.It goes to TopScreen"+chr$(13)
24210 print "Language:In English" +chr$(13)
24220 else
24230 cls:color rgb(255,255,255)
24240 print "設定変更(言語の変更)" + chr$(13)
24250 color rgb(255,255,255)
24260 print chr$(13)
24270 print "番号を選んでください"+chr$(13)
24280 print " :1.日本語 → 英語に変更" + chr$(13)
24290 print " :2.トップ画面に戻る" + chr$(13)
24300 print chr$(13)
24310 print "設定言語:日本語" + chr$(13)
24320 endif
24330 color rgb(0,0,0)
24340 locate 0,15:print "                                       ":locate 0,15:print "2.トップ画面に戻る　を選択" + chr$(13)
24350 Setting_Language_key:
24360 y=0:key$="":bg=0
24370 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y<> -1 and bg<> 1)
24380 y=stick(1)
24390 key$=inkey$
24400 bg=strig(1)
24410 pause 2
24420 wend
24430 '選択肢変更
24440 if ((y=1) or (y=-1)) then
24450 select case No
24460 case 2:
24470 '実装部分　ここから
24480 pause 200:No=1:sp_on 0,1:sp_on 1,0:locate 0,15:print "                                                         ":locate 0,15:print "1.日本語 → 英語に変更を選択": goto Setting_Language_key:
24490 '実装部分　ここまで
24500 case 1:
24510 pause 200: No=2:sp_on 0,0:sp_on 1,1:locate 0,15:print "                                                       ":locate 0,15:print "2.トップ画面に戻る を選択":goto Setting_Language_key:
24520 end select
24530 endif
24540 'Enter Key  決定ボタン
24550 if ((key$=chr$(13)) or (bg=1)) then
24560 select case No
24570 case 2:
24580 sp_on 0,0:sp_on 1,0:goto TopScreen:
24590 case 1:                                                     'lang_flag=1:sp_on 0,0:sp_on 1,0:goto Change_Language:
24600 '
24610 '未実装　ここから
24620 sp_on 0,1:sp_on 1,0:ui_msg "この機能は未実装です":goto Setting_Language_key:
24630 '
24640 '未実装　ここまで
24650 end select
24660 endif
24670 '配列削除
24680 buffer_clear:
24690 erase bufline$
24700 erase bufcount$
24710 erase bufcount1$
24720 erase bufcount2$
24730 erase bufline2$
24740 erase bufline3$
24750 erase bufKaztama$
24760 erase List$
24770 erase Result_Menu_List$
24780 erase list$
24790 erase moji_List$
24800 'ui_msg "メモリーをクリアしました"
24810 return
24820 '配列削除　ここまで
24830 File_Device_Set:
24840 'Device 選択　書き込み
24850 open Device_type$  for output as #1
24860 print #1,device_No
24870 close #1
24880 ui_msg "ファイルを書き込みました"
24890 return
