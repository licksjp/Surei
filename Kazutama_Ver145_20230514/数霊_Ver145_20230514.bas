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
660 '現在のバージョン
670 Version$ = "1.4.5_2023.05.14(正式版)"
680 'csvファイル 1.数霊 ベースファイル
690 FILE_csv$ = "./data/Kazutama.csv"
700 'csvファイル 2.数霊 ベースファイル 2
710 FILE_csv2$ = "./data/Surei_chart_20211207.csv"
720 'Save ファイル
730 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
740 'gazo ファイル
750 Gazo$ = "./data/Gazo/"
760 'System フォルダ:設定ファイルを保存するところ
770 System$ = "./data/System/config.sys"
780 'Device type:デバイスタイプのファイルチェック
790 Device_type$ = "./data/device_type.sys"
800 '設定ファイル名:config.sys
810 'Sound File(Voice)
820 '1.ボイス TopScreen
830 Voice_File_TopScreen$ = "./data/Sound_data/"
840 'Message
850 buf_finish_Message$ = "メモリーを解放してプログラムを終了します"
860 '変数領域
870 'vcount:バーチャルパッド下の変数
880 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+6,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
890 count2 = 0:N=0:N2=0:m2 = 0:device_No=0:device_type=0
900 dim list$(4),moji_List$(2)
910 'ファイルの有無チェック
920 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
930 '1.ファイルが無いとき
940 cls :print "依存ファイルが見つかりません":
950 print "エンターキーを押してください" + chr$(13)
960 key$ = input$(1)
970 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
980 else
990 '2.ファイルが有るとき
1000 cls:print "csv:file ok." + chr$(13)
1010 n=0
1020 'FILE_csv$:数霊データー入力
1030 open FILE_csv$ for input as #1
1040 while eof(1) = 0
1050 input #1,line$
1060 bufline$(n) = line$
1070 'Print n;chr$(13)
1080 '登録件数カウント:n
1090 n = n + 1
1100 wend
1110 close #1
1120 N=n
1130 '2つ目のファイル読み込み
1140 'n = 0
1150 open FILE_csv2$ for input as #2
1160 for n=3 to 181+2+2
1170 for i=0 to 1
1180 input #2,line$
1190 bufline2$(n,i) = line$
1200 next i
1210 next n
1220 close #2
1230 N2 = n
1240 endif
1250 '2022.11.23----------------------
1260 '端末言語のチェック
1270 '日本語端末かチェックをして日本語以外なら英語で表示する
1280 'lang flag:0:日本語 1:英語(日本語以外)
1290 '--------------------------------
1300 lang_flag = 0
1310 if ex_info$(1) <> "JP" then
1320 lang_flag = 1
1330 endif
1340 cls 3:font 48:screen 1,1,1,1:int "kb:4":init "crt:0"
1350 play ""
1360 'gload Gazo$ + "TopScreen_20230310.png",0,0,0
1370 '選択ポインター 1 - 4
1380 'スプライトの定義
1390 gload Gazo$ + "Selection.png",1,5,300
1400 gload Gazo$ + "Selection.png",1,5,400
1410 gload Gazo$ + "Selection.png",1,5,500
1420 gload Gazo$ + "Selection.png",1,5,595
1430 sp_def 0,(5,300),32,32
1440 sp_def 1,(5,400),32,32
1450 sp_def 2,(5,500),32,32
1460 sp_def 3,(5,595),32,32
1470 'File check
1480 '初回起動はここから
1490 if (dir$(Device_type$) = "") then
1500 goto Device_Select:
1510 else
1520 '
1530 '2回目以降はファイルチェックをしてトップ画面
1540 '
1550  open Device_type$ for input as #1
1560  line input #1,device_type$
1570  device_No = val(device_type$)
1580  close #1
1590  if (device_No=1 or device_No=2) then
1600  goto TopScreen:
1610  endif
1620 endif
1630 'First_Select_Screen:
1640 'タブレット　or　スマホの選択を起動時にする
1650 Device_Select:
1660 font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
1670 gload Gazo$ + "device_select_20230313.png",0,0,0
1680 init "kb:4"
1690 play ""
1700 play Voice_File_TopScreen$+"Select_device_select.mp3"
1710 'y=0:key$="":bg=0
1720 print chr$(13)+chr$(13)+chr$(13)
1730 color  rgb(255,255,255)
1740 print "番号を選んでください"+chr$(13)
1750 'print chr$(13)
1760 print " :1.スマートフォン"+chr$(13)
1770 print " :2.タブレット端末"+chr$(13)
1780 locate 0,11:No=1
1790 color rgb(0,0,0)
1800 Print " 1.スマートフォンを選択"+chr$(13)
1810 sp_on 0,1:sp_put 0,(5,300),0,0
1820 sp_on 1,0:sp_on 2,0:sp_on 3,0
1830 device_selection:
1840 y=0:key$="":bg=0:
1850 While (key$ <> chr$(30) and key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
1860 y = stick(1)
1870 key$ = inkey$
1880 bg = strig(1)
1890 pause 2
1900 wend
1910 if ((y=1) or (y=-1) or (key$=chr$(30)) or (key$=chr$(31)) ) then
1920 select case No
1930 case 1:
1940       No=2:sp_on 1,1:sp_on 0,0:locate 0,11:pause 300:sp_put 1,(5,400),0,0:print "                                ":locate 0,11:print " 2.タブレット端末を選択":goto device_selection:
1950 case 2:
1960       No=1:sp_on 1,0:sp_on 0,1:pause 300:sp_put 0,(5,300),0,0:locate 0,11:print "                                   ":locate 0,11:print " 1.スマートフォンを選択":goto device_selection:
1970 end select
1980 endif
1990 '決定ボタン
2000 if ((bg=2) or (key$=chr$(13)))  then
2010 select case No
2020 case 1:
2030       sp_on 0,0:sp_on 1,0:device_No=1:gosub File_Device_Set:goto TopScreen:
2040 case 2:
2050       sp_on 0,0:sp_on 1,0:device_No=2:gosub File_Device_Set:goto TopScreen:
2060 end select
2070 endif
2080 'Top画面
2090 TopScreen:
2100 'バーチャルパッドを表示
2110 cls 3:font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
2120 'play ""
2130 play ""
2140 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
2150 'gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
2160 select case device_No
2170 case 1:
2180 'Top画面の背景画像
2190 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2200 gload Gazo$ + "downscreen.png",0,0,800
2210 case 2:
2220 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2230 end select
2240 'key$=input$(1)
2250 'バーチャルパッドの背景を白にする for smartphone screen
2260 'gload Gazo$ + "downscreen.png",0,0,800
2270 '選択肢 1
2280 gload Gazo$ + "Selection.png",1,5,300
2290 '選択肢 2
2300 gload Gazo$ + "Selection.png",1,5,400
2310 '選択肢 3
2320 gload Gazo$ + "Selection.png",1,5,500
2330 '選択肢 4
2340 'TopScreen:
2350 'select case device_No
2360 'case 1:
2370 gload Gazo$ + "Selection.png",1,5,590
2380 'case 2:
2390 'gload Gazo$ +
2400 'end select
2410 color rgb(0,0,255)
2420 print chr$(13)
2430 if lang_flag = 1 then
2440 color rgb(255,255,255)
2450 print "Select Number" + chr$(13)
2460 print " :1.Kazutama check" + chr$(13)
2470 print " :2.Setting" + chr$(13)
2480 print " :3.Help" + chr$(13)
2490 print " :4.End Program" + chr$(13)
2500 color rgb(255,255,255)
2510 else
2520 color rgb(255,255,255)
2530 print chr$(13)
2540 sp_on 0,1:sp_put 0,(5,300),0,0
2550 print "番号を選んでください" + chr$(13)
2560 print " :1.数霊(かずたま)チェック" + chr$(13)
2570 print " :2.設定" + chr$(13)
2580 print " :3.ヘルプ" + chr$(13)
2590 print " :4.(プログラムを)終　了する" + chr$(13)
2600 color rgb(0,0,0)
2610 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
2620 'バーチャルパッドを表示
2630 No=1:
2640 'lang_flag:1 外国語,0:日本語
2650 if lang_flag = 1 then
2660 'lang_flag=1 英語
2670 locate 0,15:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
2680 else
2690 'lang_flag=0 日本語
2700 locate 0,15:color rgb(0,0,0):print " 1.数霊(かずたま)チェックを選択";chr$(13)
2710 endif
2720 endif
2730 'TopScreen sprite
2740 'スプライト
2750 '選択肢 1 On
2760 'sp_def 0,(5,300),32,32
2770 'sp_on 0,1
2780 'sp_put 0,(5,300),0,0
2790 '選択肢 2 Off
2800 sp_def 1,(5,400),32,32
2810 sp_on 1,0
2820 sp_put 1,(5,400),0,0
2830 '選択肢 3 Off
2840 sp_def 2,(5,500),32,32
2850 sp_on 2,0
2860 sp_put 2,(5,500),0,0
2870 '選択肢 4 Off
2880 sp_def 3,(5,600),32,32
2890 sp_on 3,0
2900 sp_put 3,(5,600),0,0
2910 color rgb(0,0,0)
2920 Main_Select:
2930 'y:バーチャルパッドの処理
2940 'key$:カーソルの処理
2950 y = 0:key$ = "":bg = 0
2960 while ((key$ <> chr$(31)) and (key$ <> chr$(13)) and (y <> 1) and (y <> -1) and (bg <> 2))
2970 y = stick(1)
2980 key$ = inkey$
2990 bg = strig(1)
3000 pause 2
3010 wend
3020 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
3030 '1.バーチャルパッドの処理
3040 'バーチャルパッド下を押した時
3050 if y = 1 then
3060 select case No
3070 'No の初期値：No=1
3080 case 1:
3090 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
3100 if lang_flag = 1 then
3110 'lang_flag=1 英語
3120 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3130 else
3140 'lang_flag=0 日本語
3150 locate 0,15:print " 2.設定を選択":goto Main_Select:
3160 endif
3170 'デバッグライン　ここから
3180 '0のとき
3190 'デバッグライン　ここまで
3200 'デバッグライン　ここから
3210 'バーチャルパッド　下
3220 case 2:
3230 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:
3240 print "                                         ":
3250 if lang_flag = 1 then
3260 color rgb(0,0,0):locate 0,15:
3270 print "3.It has selected Help":No=3:goto Main_Select:
3280 else
3290 color rgb(0,0,0):locate 0,15:print "                                                         ":locate 0,15:
3300 print " 3.ヘルプを選択":No=3:goto Main_Select:
3310 endif
3320 'デバッグライン　ここまで
3330 case 3:
3340 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                               "
3350 if lang_flag = 1 then
3360 locate 0,15:print "4.It has selected finish program":No=0:goto Main_Select:
3370 else
3380 locate 0,15:print "                                                         " :locate 0,15:print " 4.(プログラムを)終了するを選択":No=0:goto Main_Select:
3390 endif
3400 'デバッグライン　ここから
3410 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
3420 'デバッグライン　ここまで
3430 case 0:
3440 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1
3450 if lang_flag = 1 then
3460 'lang_flag=1:英語
3470 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3480 else
3490 'lang_flag=0:日本語
3500 locate 0,15:print "                                      ":locate 0,15:print " 1.数霊(かずたま)チェックを選択":goto Main_Select:
3510 endif
3520 'デバッグライン　ここから
3530 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
3540 'デバッグライン　ここまで
3550 end select
3560 endif
3570 'バーチャルパッド　上 ここから
3580 if (y = -1) then
3590 select case No
3600 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
3610 case 1:
3620 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                                          "
3630 'if lang_flag = 1 then
3640 'lang_flag=1 英語
3650 'locate 0,15:print "4.It has finished program":goto Main_Select:
3660 'else
3670 'lang_flag=0 日本語
3680 locate 0,15:print "                                                          ":
3690 locate 0,15:print " 4.(プログラムを)終了するを選択":goto Main_Select:
3700 'endif
3710 'endif
3720 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
3730 case 0:
3740 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":
3750 if lang_flag = 1 then
3760 '1:英語
3770 locate 0,15:print "3.It has selected Help":goto Main_Select:
3780 else
3790 '0:日本語
3800 locate 0,15:print "                                                                                        "
3810 locate 0,15:print " 3.ヘルプを選択":goto Main_Select:
3820 endif
3830 'No:3 3.Help→2.設定 No:2
3840 case 3:
3850 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      "
3860 if lang_flag = 1 then
3870 '1:英語
3880 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3890 else
3900 '0:日本語
3910 locate 0,15:print" 2.設定を選択":goto Main_Select:
3920 endif
3930 case 2:
3940 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":
3950 if lang_flag = 1 then
3960 'lang_flag 1 英語
3970 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3980 else
3990 'lang_flag 0 日本語
4000 locate 0,15:print" 1.数霊(かずたま)チェックを選択":goto Main_Select:
4010 endif
4020 end select
4030 endif
4040 if (bg = 2) then
4050 select case No
4060 '1.数霊チェックを選択  パッドの右キー(決定)
4070 case 1:
4080 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4090 '2.設定を選択  パッドの右キー(決定)
4100 case 2:
4110 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
4120 '3.ヘルプを選択 パッドの右(決定)
4130 case 3:
4140 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
4150 'プログラムの終了を選択(決定)
4160 case 0:
4170 cls 3:cls 4:gosub buffer_clear:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":ui_msg buf_finish_Message$:pause 4.080*1000:color rgb(255,255,255):end
4180 'if lang_flag = 1 then
4190 'lang_flag = 1 英語
4200 'else
4210 'lang_flag = 0 日本語
4220 'endif
4230 end select
4240 '4.終了するを選択  パッドの右
4250 endif
4260 'バーチャルパッド　上　ここまで
4270 '2.カーソルの処理
4280 'カーソル　下 chr$(31)
4290 if (key$ = chr$(31)) then
4300 select case (No)
4310 '4
4320 '0 選択肢4 => 選択肢1
4330 case 0:
4340 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "              ":color rgb(0,0,0):
4350 if lang_flag = 1 then
4360 'lang flag:1 英語
4370 else
4380 'lang flag:0 日本語
4390 color rgb(0,0,0):locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4400 endif
4410 '1 選択肢1 => 選択肢2
4420 case 1:
4430 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":
4440 if lang_flag = 1 then
4450 'lang_flag:1 英語
4460 else
4470 'lang_flag:0 日本語
4480 color rgb(0,0,0):locate 0,15:print "2.設定を選択":beep:goto Main_Select:
4490 endif
4500 '2 選択肢2 => 選択肢3
4510 case 2:
4520 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,15:print "               ":
4530 if lang_flag = 1 then
4540 'lang flag:1 英語
4550 else
4560 'lang flang:0 日本語
4570 color rgb(0,0,0):locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4580 endif
4590 '3 選択肢３ => 選択肢4
4600 case 3:
4610 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,595),0,0:locate 0,15:print "               ":color rgb(0,0,0)
4620 if lang_flag = 1 then
4630 'lang_flag = 1 英語
4640 else
4650 'lang_flag = 0 日本語
4660 color rgb(0,0,0):locate 0,15:print "4.終 了を選択":goto Main_Select:
4670 endif
4680 case else:
4690 goto Main_Select:
4700 end select
4710 endif
4720 'カーソル　上
4730 if (key$=chr$(30)) then
4740 select case (No)
4750 '選択肢1 => 選択肢4
4760 case 1:
4770 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:PRINT "                      ":
4780 if lang_flag = 1 then
4790 'lang_flag=1:英語
4800 'print "1.It has selected Kazutama check":goto Main_Select:
4810 else
4820 'lang_flag = 0:日本語
4830 else
4840 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4850 endif
4860 '選択肢2 => 選択肢1
4870 case 2:
4880 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                 ":locate 1,15:print "2.設 定を選択":goto Main_Select:
4890 '選択肢3　=> 選択肢2
4900 case 3:
4910 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,500),0,0
4920 if lang_flag = 1 then
4930 'lang_flag = 1:英語
4940 locate 0,15:print "It has selected Help":goto Main_Select:
4950 else
4960 'lang_flag = 0:日本語
4970 locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4980 endif
4990 '選択肢4 => 選択肢3
5000 case 0:
5010 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                ":locate 1,15:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
5020 if lang_flag = 1 then
5030 'lang flag=1 英語
5040 else
5050 'lang flag=0 日本語
5060 locate 1,15:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
5070 endif
5080 end select
5090 endif
5100 'Input "番号:",No
5110 'エンターキー入力:決定
5120 if (key$ = chr$(13)) then
5130 select case No
5140 case 1:
5150 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
5160 case 3:
5170 Color rgb(255,255,255):goto Help:
5180 case 0:
5190 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg buf_finish_Message$:color rgb(255,255,255):pause 4.080 * 1000:end
5200 case 2:
5210 color rgb(255,255,255):sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
5220 end select
5230 endif
5240 '1-1.数霊チェック
5250 Surei_Check:
5260 cls 3:Font 48:
5270 select case device_No
5280  case 1:
5290 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5300 gload Gazo$ + "downscreen.png",0,0,800
5310 case 2:
5320 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5330 end select
5340 play ""
5350 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
5360 color rgb(255,0,0)
5370 'print "●数霊(かずたま)チェックトップ" + chr$(13)
5380 sp_on 0,1:sp_put 0,(5,300),0,0:screen 1,1,1
5390 if lang_flag = 1 then
5400 'lang_flag=1 英語
5410 else
5420 'lang_flag=0 日本語
5430 print chr$(13)+chr$(13)+chr$(13)
5440 color rgb(255,255,255)
5450 print "番号を選んでください" + chr$(13)
5460 print " :1.数霊(かずたま)1人用" + chr$(13)
5470 print " :2.数霊(かずたま)リスト 1人用　" + chr$(13)
5480 print " :3.数霊(かずたま)2人用" + chr$(13)
5490 print " :4.トップ画面に行く" + chr$(13)
5500 color rgb(0,0,0):No = 1
5510 locate 0,15:print "                                       "
5520 locate 0,15
5530 print " 1.数霊(かずたま)1人用を選択"
5540 endif
5550 Kazutama_main:
5560 'y:バーチャルパッドの処理
5570 'key$:カーソルの処理
5580 'bg:バーチャルパッドの右のボタン
5590 y = 0:key$ = "":bg=0
5600 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
5610 y = stick(1)
5620 key$ = inkey$
5630 bg=strig(1)
5640 y=stick(-1)
5650 pause 2
5660 wend
5670 'key$ = input$(1)
5680 if (y = 1) then
5690 select case No
5700 'No の初期値：No=1
5710 case 2:
5720 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                       ":
5730 locate 0,15:print "                                     "
5740 locate 0,15
5750 print" 3.数霊(かずたま)2人用を選択":goto Kazutama_main:
5760 'デバッグライン　ここから
5770 '0のとき
5780 'デバッグライン　ここまで
5790 'デバッグライン　ここから
5800 case 3:
5810 sp_on 2,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_on 0,1:sp_put 0,(5,585),0,0:pause 200:locate 0,15:print "                                               "
5820 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":No=0:goto Kazutama_main:
5830 'デバッグライン　ここまで
5840 'デバッグライン　ここから
5850 'デバッグライン　ここまで
5860 case 0:
5870 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5880 case 1:
5890 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                                             ":locate 0,15:print " 2.数霊（かずたま）リスト 1人用を選択":goto Kazutama_main:
5900 'デバッグライン　ここから
5910 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
5920 'デバッグライン　ここまで
5930 end select
5940 endif
5950 'バーチャルパッド　上 ここから
5960 if (y = -1) then
5970 select case No
5980 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
5990 case 1:
6000 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 0,15:print" 4.トップ画面に行くを選択":goto Kazutama_main:
6010 'No:3 3.Help→2.設定 No:2
6020 case 0:
6030 sp_on 1,0:sp_on 0,0:sp_on 3,1:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                     ":locate 0,15:print" 3.数霊（かずたま）2人用を選択":goto Kazutama_main:
6040 case 2:
6050 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
6060 case 3:
6070 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 0,15:print " 2.数霊(かずたま)リスト 1人用を選択":goto Kazutama_main:
6080 end select
6090 endif
6100 if (bg=2) then
6110 select case No
6120 '1.数霊チェックを選択  パッドの右キー
6130 case 1:
6140 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
6150 '2.数霊チェック2人用   パッドの右キー
6160 case 3:
6170 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
6180 '3.トップ画面に行く パッドの右
6190 case 0:
6200 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
6210 '2.数霊リスト1人用 パッドの右キー
6220 case 2:
6230 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_List1:
6240 'プログラムの終了を選択
6250 end select
6260 '4.終了するを選択  パッドの右
6270 endif
6280 'バーチャルパッド　上　ここまで
6290 if (key$ = chr$(31)) then
6300 select case No
6310 case 0:
6320 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,15:print "                                                          ":
6330 if lang_flag = 1 then
6340 Else
6350 locate 0,15:print "                                      "
6360 No=2:locate 0,15:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
6370 endif
6380 case 1:
6390 No=0:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,585),0,0:locate 0,12:print "                                                          ":
6400 if lang_flag = 1 then
6410 Else
6420 locate 0,15:print"                                      "
6430 locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
6440 endif
6450 case 2:
6460 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                      ":
6470 if lang_flag = 1 then
6480 Else
6490 No=1:locate 0,15:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
6500 endif
6510 end select
6520 endif
6530 if (key$=chr$(13)) then
6540 select case No
6550 case 1:
6560 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
6570 case 2:
6580 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
6590 case 3:
6600 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
6610 '終了はトップメニューのみにする
6620 end select
6630 endif
6640 '前の画面に戻る
6650 'プログラムの終了
6660 '1人用
6670 '2人用
6680 '数霊(かずたま) 文字入力  1人用
6690 Surei_Input:
6700 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
6710 if mode = 0 then
6720 cls 3:font 32:init"kb:2"
6730 select case device_No
6740 case 1:
6750 gload Gazo$ + "InputKotodama_20230131.png",0,0,0
6760 gload Gazo$ + "CenterScreen_20230401.png",0,0,380
6770 case 2:
6780 gload Gazo$ + "InputKotodama_20230131.png",0,0,0
6790 end select
6800 play""
6810 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
6820 color rgb(255,0,0)
6830 if lang_flag=1 then
6840 '英語
6850 else
6860 print chr$(13)+chr$(13)+chr$(13)
6870 color rgb(255,255,255)
6880 print "文字を入れてください" + chr$(13)
6890 color rgb(255,255,255)
6900 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
6910 print chr$(13)
6920 color rgb(0,0,0)
6930 Input "入力文字:",buffer_moji$
6940 if buffer_moji$ = "" then
6950 ui_msg "未入力です":goto Surei_Input:
6960 else
6970 goto Surei_Result:
6980 endif
6990 endif
7000 endif
7010 if mode = 1 then
7020 cls 3:Font 32:
7030 gload Gazo$ + "InputKotodama.png"
7040 color rgb(255,0,0)
7050 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
7060 color rgb(255,255,255)
7070 print "文字を入れてください" + chr$(13)
7080 color rgb(255,0,0)
7090 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
7100 print "大文字のみ)" + chr$(13)
7110 color rgb(0,0,0)
7120 Input "文字入力:",buffer_moji2$
7130 goto Surei_Result3:
7140 'endif
7150 endif
7160 '数霊(かずたま)文字入力　2人用
7170 Surei_twoParson:
7180 cls 3:Font 32:init"kb:2"
7190 gload Gazo$ + "InputKotodama_20230131.png"
7200 '1人目入力
7210 if lang_flag = 1 then
7220 else
7230 print ""+chr$(13)+chr$(13)+chr$(13)
7240 color rgb(255,255,255)
7250 print "1人目の文字を入れてください" + chr$(13)
7260 color rgb(255,255,255)
7270 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
7280 color rgb(0,0,0)
7290 print chr$(13)
7300 Input "1人目文字入力:",buf_Parson1$
7310 endif
7320 Surei_twoParson2:
7330 cls 3:Font 32:init"kb:2"
7340 '2人目入力
7350 gload Gazo$ + "InputKotodama_20230131.png"
7360 if lang_falg = 1 then
7370 else
7380 print ""+chr$(13)+chr$(13)+chr$(13)
7390 color rgb(255,255,255)
7400 print "2人目の文字を入れてください" + chr$(13)
7410 color rgb(255,255,255)
7420 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
7430 color rgb(0,0,0)
7440 Input "2人目の文字入力:",buf_Parson2$
7450 goto Surei_Result2:
7460 endif
7470 '数霊　計算 パート
7480 '文字の計算関数
7490 'moji$:1文字を入れる
7500 func Complate(moji$)
7510 for n = 1 to 116
7520 if moji$ = bufline$(2*n) then
7530 buffcount = val(bufline$(2 * n + 1))
7540 endif
7550 next n
7560 endfunc buffcount
7570 '数霊　結果表示
7580 Surei_Result:
7590 cls 3:Font 32
7600 'ゼロカウント:zcount
7610 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
7620 '例 アカい:"い"の文字は無効な文字なので、はじく
7630 zcount=0
7640 'mojicount:入力文字数
7650 mojicount = len(buffer_moji$)
7660 for n=1 to mojicount
7670 for j=1 to 118
7680 if (bufcount$(n - 1) = bufline$(2 * j)) then
7690 bufcount$(n-1) = Mid$(buffer_moji$,n,1)
7700 endif
7710 next j
7720 next n
7730 ncount=0:count=0
7740 for i = 1 to mojicount
7750 bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7760 'ンのカウント
7770 if (bufcount$(i-1) = "ン") then ncount = ncount + 1
7780 next i
7790 if (ncount > 0) then
7800 'Listを表示する
7810 moji_List$(0) = "この単語は目に見える物です"
7820 moji_List$(1) = "この単語は目に見えない物です"
7830 num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
7840 if (num2 = 0) then
7850 else
7860 if (num2 = 1) then
7870 n1 = 9 * ncount
7880 endif
7890 endif
7900 endif
7910 for j=1 to mojicount
7920 bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7930 count = count + Complate(bufcount$(j - 1))
7940 next j
7950 count = count + n1
7960 if (ncount > 0) then count = count
7970 '182以上のとき,181を引く
7980 if buf_cofig_r = 0 then
7990 if (count > 181) then
8000 count = count - 181
8010 else
8020 if (buf_config_r = 1) then
8030 buf_count = Single_Complate(count)
8040 endif
8050 endif
8060 endif
8070 cls 3:Font 48+16
8080 gload Gazo$ + "Result_Screen3_20230319.png"
8090 if buf_config_r = 1 then
8100 print "入力文字:" + buffer_moji$ + chr$(13)
8110 print "数霊(かずたま):";buf_count;chr$(13)
8120 endif
8130 if lang_flag = 1 then
8140 else
8150 color rgb(255,0,0)
8160 print "入力文字:" + buffer_moji$ + chr$(13)
8170 endif
8180 if lang_flag = 1 then
8190 else
8200 color rgb(0,0,255)
8210 print "数霊(かずたま):";count;chr$(13)
8220 endif
8230 if lang_flag = 1 then
8240 else
8250 color rgb(0,0,0)
8260 print "エンター or スペース" + chr$(13)
8270 print  chr$(13)
8280 'endif
8290 endif
8300 key$ = input$(1)
8310 if ((key$ = chr$(13)) or (key$=" ")) then
8320 List$(0)="1.もう一度数霊を見る"
8330 List$(1)="2.トップ画面に行く"
8340 List$(2)="3.この数霊の説明を見る"
8350 List$(3)="4.数霊データーを保存"
8360 num=ui_select("List$","番号を選んでください")
8370 select case num
8380 case 0:
8390 goto Surei_Input:
8400 case 1:
8410 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
8420 for i=0 to 9
8430 bufcount$(i)=""
8440 next i
8450 goto TopScreen:
8460 case 2:
8470 goto Surei_Result4:
8480 case 3:
8490 s=Surei_Result_Save_File()
8500 ui_msg "保存しました"
8510 case -1:
8520 'goto Surei_Result:
8530 case else:
8540 goto Surei_Result:
8550 end select
8560 'ファイルを保存する
8570 else
8580 goto Surei_Result:
8590 endif
8600 '3-1 バージョン情報
8610 Version:
8620 cls 3:Font 32
8630 select case device_No
8640 case 1:
8650 gload Gazo$ + "Screen1_Version.png"
8660 gload Gazo$ + "downscreen.png",0,0,800
8670 case 2:
8680 gload Gazo$ + "Screen1_version.png"
8690 end select
8700 play ""
8710 play Voice_File_TopScreen$ + "Voice_Version.mp3"
8720 color rgb(255,0,0)
8730 print chr$(13)
8740 color rgb(255,255,255)
8750 if lang_flag = 1 then
8760 else
8770 print chr$(13)+chr$(13)+chr$(13)
8780 print "Ver:";Version$ + chr$(13)
8790 print "アプリ名:数霊計算機" + chr$(13)
8800 print "Basic for Android Runtime" + chr$(13)
8810 print "Author:licksjp" + chr$(13)
8820 print "制作開始:2021.7.28" + chr$(13)
8830 print chr$(13)
8840 print "(C)Copy right licksjp " + chr$(13)
8850 print "All rights reserved" + chr$(13)
8860 print chr$(13)
8870 color rgb(0,0,0)
8880 print "パッドの右を押してください" + chr$(13)
8890 endif
8900 bg=0:key$=""
8910 while (bg <> 2 and key$ <> chr$(13))
8920 bg = strig(1)
8930 key$ = inkey$
8940 pause 2
8950 wend
8960 if key$ = chr$(13) then
8970 goto TopScreen:
8980 else
8990 if bg=2 then
9000 goto TopScreen:
9010 else
9020 if lang_flag = 1 then
9030 else
9040 talk "無効なキーです":goto Version:
9050 endif
9060 endif
9070 endif
9080 '3-2 参考文献
9090 Reference_Book:
9100 cls 3:Font 48:play""
9110 select case device_No
9120 case 1:
9130 gload Gazo$ + "Screen1_Reference.png"
9140 gload Gazo$ + "downscreen.png",0,0,800
9150 case 2:
9160 gload Gazo$ + "Screen1_Reference.png"
9170 end select
9180 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
9190 color rgb(255,0,0)
9200 print chr$(13)+chr$(13)
9210 if lang_flag = 1 then
9220 else
9230 color rgb(255,255,255)
9240 print "書名:数霊" + chr$(13)
9250 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
9260 print "出版社:徳間書店" + chr$(13)
9270 print "ISBN:978-4-19-" + chr$(13)
9280 print "         865309-5" + chr$(13)
9290 print "定価:2300円 + 税" + chr$(13)
9300 color rgb(0,0,0)
9310 print "パッドの右を押してください"
9320 endif
9330 bg = 0:key$ = ""
9340 while (bg <> 2 and key$ <> chr$(13))
9350 bg = strig(1)
9360 key$ = inkey$
9370 pause 2
9380 wend
9390 if key$ = chr$(13) then
9400 goto TopScreen:
9410 else
9420 if bg = 2 then
9430 goto TopScreen:
9440 else
9450 talk "無効なキーです":goto Reference_Book:
9460 endif
9470 endif
9480 'ヘルプ画面　トップ画面
9490 Help:
9500 No=1:c=0
9510 play ""
9520 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
9530 cls 3:Font 48:
9540 select case device_No
9550 case 1:
9560 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9570 gload Gazo$ + "downscreen.png",0,0,800
9580 case 2:
9590 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9600 end select
9610 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0
9620 color rgb(255,0,0)
9630 print chr$(13)+chr$(13)+chr$(13)
9640 color rgb(255,255,255)
9650 print "番号を選んでください" + chr$(13)
9660 print " :1.バージョン" + chr$(13)
9670 print " :2.参考文献" + chr$(13)
9680 print " :3.データーの初期化"+chr$(13)
9690 print " :4.トップ画面に行く" + chr$(13)
9700 color rgb(0,0,0)
9710 locate 0,15:print "                                     "
9720 if No = 1 then locate 0,15:print " 1.バージョンを選択"
9730 'y:バーチャルパッドの処理
9740 'key$:カーソルの処理
9750 'bg:バーチャルパッドの右ボタン
9760 Help_key:
9770 y = 0:key$ = "":bg = 0
9780 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
9790 y = stick(1)
9800 key$ = inkey$
9810 bg = strig(1)
9820 pause 2
9830 wend
9840 'バーチャルパッド　ここから'
9850 if (y = 1) then
9860 select case No
9870 'No の初期値：No=1
9880 case 1:
9890 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
9900 if lang_flag = 1 then
9910 else
9920 locate 0,15:print" 2.参考文献を選択":goto Help_key:
9930 endif
9940 'デバッグライン　ここから
9950 '0のとき
9960 'デバッグライン　ここまで
9970 'デバッグライン　ここから
9980 case 3:
9990 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:No=0:pause 200:locate 0,15:print "                                                          "
10000 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":goto Help_key:
10010 'デバッグライン　ここまで
10020 'デバッグライン　ここから
10030 'デバッグライン　ここまで
10040 case 2:
10050 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 0,15:print "                                                          ":color rgb(0,0,0):locate 0,15:print " 3.データーの初期化を選択":No=3:goto Help_key:
10060 case 0:
10070 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10080 'デバッグライン　ここから
10090 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
10100 'デバッグライン　ここまで
10110 end select
10120 endif
10130 'バーチャルパッド　上 ここから
10140 if (y = -1) then
10150 select case No
10160 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
10170 case 1:
10180 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                                           ":locate 0,15:print" 4.トップ画面に行くを選択":goto Help_key
10190 'No:3 3.Help→2.設定 No:2
10200 case 3:
10210 sp_on 1,0:sp_on 0,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                                          ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
10220 case 2:
10230 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                                          ":locate 0,15:print" 1.バージョンを選択":goto Help_key:
10240 case 0:
10250 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                                          ":locate 0,15:print" 3.データーの初期化を選択":goto Help_key:
10260 end select
10270 endif
10280 if (bg = 2) then
10290 select case No
10300 '1.数霊チェックを選択  パッドの右キー
10310 case 1:
10320 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
10330 '2.設定を選択    パッドの右キー
10340 case 2:
10350 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
10360 '3.データーの初期化
10370 case 3:
10380 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto data_initialize:
10390 '4.ヘルプを選択 パッドの右
10400 case 0:
10410 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
10420 'プログラムの終了を選択
10430 'if lang_flag = 1 then
10440 'lang_flag = 1:英語
10450 'Else
10460 'lang_flag = 0:日本語
10470 'endif
10480 end select
10490 '4.終了するを選択  パッドの右
10500 endif
10510 'バーチャルパッド　上　ここまで
10520 'バーチャルパッド　ここまで'
10530 'key$ = input$(1)
10540 'カーソルの下
10550 if key$ = chr$(31) then
10560 select case (No Mod 4)
10570 'バージョンから参考文献
10580 case 0:
10590 c=1:No=c:locate 0,15:Print "             ":locate 0,15:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
10600 '参考文献からトップ画面
10610 case 1:
10620 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "            ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10630 'トップ画面から終了
10640 '終了からバージョン
10650 case 2:
10660 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                     ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10670 case else:
10680 goto Help_key:
10690 end select
10700 endif
10710 'カーソル　上
10720 if (key$ = chr$(30)) then
10730 select case (c Mod 4)
10740 'バージョンから終了
10750 case 0:
10760 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:locate 0,15:print "                   ":locate 0,15:print " 4.終 了を選択":goto Help_key:
10770 '参考文献からバージョン
10780 case 1:
10790 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                   ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10800 'トップ画面から参考文献
10810 case 2:
10820 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":locate 0,15:print " 2.参考文献を選択":goto Help_key:
10830 '終了からトップ画面を選択
10840 case 3:
10850 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print"                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10860 case else:
10870 goto Help_key:
10880 end select
10890 endif
10900 'エンターキー：決定
10910 if (key$ = chr$(13)) then
10920 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10930 if No=0 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10940 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10950 else
10960 goto Help_key:
10970 endif
10980 '登録文字の確認
10990 '文字を1文字入れて登録されているか調べるメニュー
11000 '設定項目
11010 Setting:
11020 cls 3:Font 48
11030 select case device_No
11040 case 1:
11050 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
11060 gload Gazo$ + "downscreen.png",0,0,800
11070  case 2:
11080 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
11090 end select
11100 play ""
11110 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
11120 No=1
11130 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:
11140 color rgb(0,0,255)
11150 print chr$(13)
11160 if lang_flag = 1 then
11170 'lang_flag = 1:英語
11180 else
11190 'lang_flag = 0:日本語
11200 color rgb(255,255,255)
11210 print chr$(13)
11220 print "番号を選んでください" + chr$(13)
11230 '-------コメント----------------
11240 'print " :1.登録文字の確認" + chr$(13)
11250 'print " :2.数霊文字確認" + chr$(13)
11260 '-------コメント----------------
11270 'print chr$(13)
11280 print " :1.文字の項目" + chr$(13)
11290 print " :2.結果表示設定" + chr$(13)
11300 print " :3.言語設定" + chr$(13)
11310 print " :4.トップ画面に行く" + chr$(13)
11320 endif
11330 color rgb(0,0,0)
11340 locate 0,15
11350 if No=1 then locate 0,15:print  "                                     ":locate 0,15:print " 1.文字の項目を選択"
11360 'y:バーチャルパッドの処理
11370 'key$:カーソルの処理
11380 'bg:バーチャルパッドの右ボタン
11390 SettingScreen:
11400 y = 0:key$ = "":bg=0
11410 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
11420 y = stick(1)
11430 key$ = inkey$
11440 bg=strig(1)
11450 pause 2
11460 wend
11470 'バーチャルパッド　ここから'
11480 'バーチャルパッド　ここから'
11490 if (y = 1) then
11500 select case No
11510 'No の初期値：No=1
11520 case 1:
11530 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":color rgb(0,0,0):locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11540 'デバッグライン　ここから
11550 '0のとき
11560 'デバッグライン　ここまで
11570 'デバッグライン　ここから
11580 case 2:
11590 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                         "
11600 color rgb(0,0,0)::No=3
11610 if lang_flag = 1 then
11620 else
11630 locate 1,15:print "3.言語設定を選択":goto SettingScreen:
11640 endif
11650 'デバッグライン　ここまで
11660 case 3:
11670 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                              ":locate 1,15:print "4.トップ画面に行くを選択":No=0:goto SettingScreen:
11680 'デバッグライン　ここから
11690 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11700 'デバッグライン　ここまで
11710 case 0:
11720 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
11730 'デバッグライン　ここから
11740 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11750 'デバッグライン　ここまで
11760 end select
11770 endif
11780 'バーチャルパッド　上 ここから
11790 if (y = -1) then
11800 select case No
11810 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11820 case 1:
11830 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 1,15:print"4.トップ画面に行くを選択":goto SettingScreen:
11840 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11850 case 0:
11860 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 1,15:print"3.言語設定を選択":goto SettingScreen:
11870 'No:3 3.Help→2.設定 No:2
11880 case 3:
11890 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.結果表示設定を選択":goto SettingScreen:
11900 case 2:
11910 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 1,15:print"1.文字の項目を選択":goto SettingScreen:
11920 end select
11930 endif
11940 if (bg=2) then
11950 select case No
11960 '1.数霊チェックを選択  パッドの右キー
11970 case 1:
11980 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
11990 '2.設定を選択    パッドの右キー
12000 case 2:
12010 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
12020 '3.ヘルプを選択 パッドの右
12030 case 0:
12040 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
12050 'プログラムの終了を選択
12060 case 3:
12070 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Setting_Language:
12080 end select
12090 endif
12100 '4.終了するを選択  パッドの右
12110 'バーチャルパッド　ここまで'
12120 'カーソル下'
12130 if (key$ = chr$(31)) then
12140 select case (No Mod 4)
12150 '登録文字から数霊文字の確認
12160 case 1:
12170 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                     ":locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
12180 '数霊文字の確認からトップ画面に行く
12190 case 2:
12200 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "                                     ":locate 1,15:print"3.言語設定を選択":goto SettingScreen:
12210 'トップ画面に行くから終了
12220 case 3:
12230 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,590),0,0:locate 0,15:print "                                       ":locate 1,15:print "4.トップ画面に行くを選択":goto SettingScreen:
12240 '終了から登録文字
12250 case 0:
12260 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
12270 end select
12280 endif
12290 'カーソル　上
12300 if (key$ = chr$(30)) then
12310 select case (No Mod 4)
12320 case 1:
12330 c=2:No=c:sp_on 0,1:sp_put 0,(5,300),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
12340 case 2:
12350 c=3:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
12360 case 3:
12370 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:goto SettingScreen:
12380 case 0:
12390 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,590),0,0:sp_on 0,0:goto SettingScreen:
12400 end select
12410 endif
12420 'エンターキーを押したとき
12430 if (key$ = chr$(13)) then
12440 if (No=3) then goto Setting_Language:
12450 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
12460 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
12470 if (No=0) then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
12480 endif
12490 '文字検索項目  ここから
12500 Moji_Search:
12510 cls 4:cls 3:Font 32+16:init"kb:2"
12520 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12530 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12540 play ""
12550 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
12560 print "" + chr$(13)
12570 color rgb(255,255,255)
12580 if lang_flag = 1 then
12590 Else
12600 print "文字を一文字入れてください" + chr$(13)
12610 endif
12620 color rgb(0,0,0)
12630 if lang_flag=1 then
12640 Else
12650 Input "登録文字:",moji$
12660 endif
12670 moji_count = len(moji$)
12680 if moji_count > 1 then
12690 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Moji_Search:
12700 else
12710 count=0
12720 for n = 0 to 116
12730 if bufline$(2*n) = moji$ then
12740 cls 3:font 48:init"kb:4"
12750 select case device_No
12760 case 1:
12770 gload Gazo$ + "downscreen.png",0,0,800
12780 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12790 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12800 case 2:
12810 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12820 end select
12830 play ""
12840 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12850 if lang_flag = 1 then
12860 Else
12870 print chr$(13)
12880 color rgb(255,255,255)
12890 print moji$;"は、登録されています。" + chr$(13)
12900 color rgb(0,0,0)
12910 print "ジョイパッドの右を押してください"
12920 endif
12930 bg = 0:key$ = ""
12940 while (bg <> 1 and key$ <> chr$(13))
12950 key$ = inkey$
12960 bg = strig(1)
12970 pause 2
12980 wend
12990 if key$ = chr$(13) then goto TopScreen:
13000 if bg=1 then goto TopScreen:
13010 count = count + 1
13020 endif
13030 next n
13040 if count = 0 then
13050 cls 3:font 48:init "kb:4"
13060 gload Gazo$ + "Moji_check.png"
13070 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
13080 play ""
13090 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
13100 print chr$(13)
13110 if lang_flag = 1 then
13120 Else
13130 color rgb(255,255,255)
13140 print moji$;"は、登録されていません。" + chr$(13)
13150 color rgb(0,0,0)
13160 print "パッドの右を押してください" + chr$(13)
13170 endif
13180 bg = 0:key$ = ""
13190 while (kg <> 1 and key$ <> chr$(13))
13200 key$ = inkey$
13210 bg = strig(1)
13220 pause 2
13230 wend
13240 if ((key$ = chr$(13)) or (bg=2)) then goto TopScreen:
13250 endif
13260 endif
13270 Surei_Result2:
13280 cls 3:Font 48
13290 zcount1=0:zcount2=0:count1=0:count2=0
13300 '1人目
13310 mojicount1=len(buf_Parson1$)
13320 '2人目
13330 mojicount2 = len(buf_Parson2$)
13340 '1人目
13350 for n = 1 to mojicount1
13360 for j = 1 to 116
13370 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
13380 if bufcount1$(n-1) = bufline$(2*j) then
13390 zcount1 = zcount1 + 1
13400 endif
13410 next j
13420 next n
13430 '2人目
13440 for n = 1 to mojicount2
13450 for j = 1 to 116
13460 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
13470 if bufcount2$(n-1) = bufline$(2*j) then
13480 zount2 = zcount2 + 1
13490 endif
13500 next j
13510 next n
13520 '1人目
13530 for i=1 to mojicount1
13540 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
13550 p1 = Complate(bufcount1$(i-1))
13560 count1 = count1 + p1
13570 next i
13580 '2人目
13590 for i = 1 to mojicount2
13600 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
13610 p2 = Complate(bufcount2$(i-1))
13620 count2 = count2 + p2
13630 next i
13640 cls 3:
13650 select case device_No
13660 case 1:
13670 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
13680 gload Gazo$ + "downscreen.png",0,0,800
13690 case 2:
13700 gload Gazo$ + "downscreen.png",0,0,0
13710 end select
13720 color rgb(255,0,0)
13730 print ""+chr$(13)
13740 if lang_flag = 1 then
13750 else
13760 color rgb(255,255,255)
13770 print chr$(13)+chr$(13)
13780 print "1人目:";buf_Parson1$;chr$(13)
13790 print "数霊1:";count1;chr$(13)
13800 print "2人目:";buf_Parson2$;chr$(13)
13810 print "数霊2:";count2;chr$(13)
13820 print "数霊(合計):";count1 + count2;chr$(13)
13830 color rgb(0,0,0)
13840 print "バーチャルパッドの右" + chr$(13)
13850 endif
13860 key$ = "":bg = 0
13870 while (bg <> 2 and key$ <> chr$(13))
13880 bg = strig(1)
13890 key$ = inkey$
13900 pause 2
13910 wend
13920 if (bg = 2 or key$ = chr$(13))  then goto TopScreen:
13930 Surei_Result3:
13940 cls 3:Font 48
13950 zcount2 = 0:count2 = 0
13960 mojicount2 = len(buffer_moji2$)
13970 for n = 1 to mojicount2
13980 for j = 1 to 116
13990 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
14000 if bufcount2$(n - 1) = bufline$(2 * j) then
14010 zcount2 = zcount2 + 1
14020 endif
14030 next j
14040 next n
14050 for i = 1 to mojicount2
14060 n2 = Complate(bufcount2$(i-1))
14070 count2 = count2 + n2
14080 next i
14090 gload Gazo$ + "Screen5.png"
14100 if lang_flag = 1 then
14110 else
14120 color rgb(255,0,0)
14130 print "数霊の結果表示" + chr$(13)
14140 color rgb(255,255,255)
14150 print "１回目回の文字入力:";buffer_moji$;chr$(13)
14160 print "１回目の数霊(かずたま)";count;chr$(13)
14170 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
14180 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
14190 color rgb(0,0,0)
14200 print "エンターキー:トップ画面";chr$(13)
14210 print "c or C キー:数霊の比較";chr$(13)
14220 endif
14230 key$ = "":bg = 0
14240 while (key$ <> chr$(13) and bg <> 2)
14250 bg = strig(1)
14260 key$ = inkey$
14270 pause 2
14280 wend
14290 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
14300 if key$ = "c" or key$ = "C" then
14310 if count = count2 then
14320 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
14330 else
14340 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
14350 endif
14360 endif
14370 Moji_Count_Check:
14380 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
14390 cls 3:Font 48
14400 select case device_No
14410 case 1:
14420 gload Gazo$ + "Moji_check.png"
14430 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
14440 gload Gazo$ + "downscreen.png",0,0,800
14450 case 2:
14460 gload Gazo$ + "Moji_check.png",0,0,0
14470 end select
14480 n = 0
14490 open FILE_csv$ for input as #1
14500 while eof(1) = 0
14510 line input #1, line$
14520 n = n + 1
14530 wend
14540 close #1
14550 play ""
14560 if (n = 118) then
14570 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
14580 if lang_flag = 1 then
14590 else
14600 print "" + chr$(13)
14610 color rgb(255,255,255)
14620 print "文字の登録文字数は";n;"文字" + chr$(13)
14630 color rgb(0,0,0)
14640 print "パッドの右を押してください" + chr$(13)
14650 endif
14660 endif
14670 key$ = "":bg = 0
14680 while ((key$ <> chr$(13)) and (bg <> 2))
14690 key$=inkey$
14700 bg=strig(1)
14710 pause 2
14720 wend
14730 if ((bg = 2) or (key$=chr$(13))) then
14740 goto TopScreen:
14750 else
14760 goto Moji_Count_Check:
14770 endif
14780 'Save 関数
14790 file_kazutama = 0
14800 file_kazutama = Save_File()
14810 func Save_File()
14820 open SAVE_DATA1$  for output as #1
14830 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
14840 close #1
14850 endfunc
14860 Select_moji:
14870 cls 3:font 48:No = 1
14880 select case device_No
14890 case 1:
14900 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
14910 gload Gazo$ + "downscreen.png",0,0,800
14920 case 2:
14930 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
14940 end select
14950 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
14960 color rgb(255,0,0)
14970 if lang_flag = 1 then
14980 else
14990 play ""
15000 play Voice_File_TopScreen$ + "Voice_Select_Moji20230217.mp3"
15010 print chr$(13)+chr$(13)+chr$(13)
15020 color rgb(255,255,255)
15030 print "番号を選んでください" + chr$(13)
15040 print " :1.登録文字検索"+ chr$(13)
15050 print " :2.登録文字数の確認" + chr$(13)
15060 print " :3.数字から数霊の説明"+chr$(13)
15070 print " :4.トップ画面に戻る" + chr$(13)
15080 color rgb(0,0,0)
15090 locate 0,15
15100 if No = 1 then print " 1.登録文字検索を選択"
15110 endif
15120 Entry_check_key:
15130 y = 0:key$ = "":bg=0
15140 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
15150 y = stick(1)
15160 key$ = inkey$
15170 bg=strig(1)
15180 pause 2
15190 wend
15200 'バーチャルパッド　ここから'
15210 'バーチャルパッド　ここから'
15220 if y = 1 then
15230 select case No
15240 'No の初期値：No=1
15250 case 1:
15260 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print "2.登録文字数の確認を選択":goto Entry_check_key:
15270 'デバッグライン　ここから
15280 '0のとき
15290 'デバッグライン　ここまで
15300 'デバッグライン　ここから
15310 case 2:
15320       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 0,15:print "                                                         ":No=3:locate 0,15:print" 3.数字から数霊の説明を選択":goto Entry_check_key:
15330 case 3:
15340 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:locate 0,15:print "                                       "
15350 :No=0
15360 'if lang_flag = 1 then
15370 'Else
15380 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に戻るを選択":goto Entry_check_key:
15390 'endif
15400 'cls:color rgb(255,255,255):print"ok"
15410 'デバッグライン　ここまで
15420 'デバッグライン　ここから
15430 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
15440 'デバッグライン　ここまで
15450 case 0:
15460 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.登録文字検索を選択":goto Entry_check_key:
15470 'デバッグライン　ここから
15480 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
15490 'デバッグライン　ここまで
15500 end select
15510 endif
15520 'バーチャルパッド　上 ここから
15530 if y = -1 then
15540 select case No
15550 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15560 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15570 case 0:
15580       sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print "                                      ":locate 0,15:print " 3.数字から数霊の説明を選択":goto Entry_check_key:
15590 case 1:
15600 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print"4.トップ画面に戻るを選択":goto Entry_check_key:
15610 'No:3 3.Help→2.設定 No:2
15620 case 3:
15630 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
15640 case 2:
15650 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 1.登録文字検索を選択":goto Entry_check_key:
15660 end select
15670 endif
15680 if bg=2 then
15690 select case No
15700 '1.数霊チェックを選択  パッドの右キー
15710 case 1:
15720 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15730 '2.設定を選択    パッドの右キー
15740 case 2:
15750 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15760 '3.ヘルプを選択 パッドの右
15770 case 0:
15780 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15790 case 3:
15800 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Input_numbertokazutama:
15810 end select
15820 endif
15830 '4.終了するを選択  パッドの右
15840 'バーチャルパッド　ここまで'
15850 'key$ = input$(1)
15860 'カーソルの下
15870 if key$ = chr$(31) then
15880 select case (No Mod 4)
15890 case 0:
15900 c=1:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
15910 case 1:
15920 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,500),0,0:sp_on 3,0:goto Entry_check_key:
15930 case 2:
15940 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:goto Entry_check_key:
15950 case 3:
15960 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
15970 end select
15980 endif
15990 'カーソル　上
16000 if key$ = chr$(30) then
16010 select case (No Mod 4)
16020 case 0:
16030 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
16040 case 1:
16050 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
16060 case 2:
16070 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
16080 case 3:
16090 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
16100 end select
16110 endif
16120 'エンターキーを押す
16130 if key$ = chr$(13) then
16140 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
16150 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
16160 if No = 0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16170 endif
16180 '
16190 Kakunin_Surei_count:
16200 cls 3:font 48:No=0
16210 select case device_No
16220 case 1:
16230 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
16240 'gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
16250 gload Gazo$ + "downscreen.png",0,0,800
16260 case 2:
16270 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
16280  end select
16290 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
16300 color rgb(255,0,0)
16310 print chr$(13)+chr$(13)+chr$(13)
16320 color rgb(255,255,255)
16330 print "番号を選んでください" + chr$(13)
16340 print " :1.数霊リスト 1人用" + chr$(13)
16350 print " :2.結果表示設定" + chr$(13)
16360 print " :3.トップ画面に行く" + chr$(13)
16370 print "" + chr$(13)
16380 color rgb(0,0,0)
16390 locate 0,15:print"                                                         "
16400 if No = 0 then locate 1,15:print "1.数霊リスト　1人用を選択"
16410 Entry_List:
16420 y = 0:key$ = "":bg=0
16430 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
16440 y = stick(1)
16450 key$ = inkey$
16460 bg = strig(1)
16470 pause 2
16480 wend
16490 'バーチャルパッド　ここから'
16500 'バーチャルパッド　ここから'
16510 'バーチャルパッド　下
16520 if y = 1 then
16530 select case No
16540 'No の初期値：No=1
16550 case 0:
16560 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=1:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.結果表示設定を選択":goto Entry_List:
16570 'デバッグライン　ここから
16580 '0のとき
16590 'デバッグライン　ここまで
16600 'デバッグライン　ここから
16610 'color rgb(0,0,0):locate 0,15:print " 4.終了を選択":goto Entry_List:
16620 'cls:color rgb(255,255,255):print"ok"
16630 'デバッグライン　ここまで
16640 case 2:
16650 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,300),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 1.数霊リスト 1人用を選択":No=0:goto Entry_List:
16660 case 1:
16670 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                      ":No=2:locate 1,15:print "3．トップ画面に行くを選択":goto Entry_List:
16680 'デバッグライン　ここから
16690 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
16700 'デバッグライン　ここまで
16710 'デバッグライン　ここから
16720 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
16730 'デバッグライン　ここまで
16740 end select
16750 endif
16760 'バーチャルパッド　上 ここから
16770 if y = -1 then
16780 select case No
16790 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
16800 case 2:
16810 sp_on 2,0:sp_on 0,0:sp_on 1,1:sp_on 3,0:sp_put 1,(5,400),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 2.結果表示設定を選択":goto Entry_List:
16820 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
16830 case 0:
16840 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 1,15:print"3.トップ画面に行くを選択":goto Entry_List:
16850 'No:3 3.Help→2.設定 No:2
16860 case 1:
16870 sp_on 1,0:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 0,(5,300),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print "1.数霊リスト 1人用を選択":goto Entry_List:
16880 end select
16890 endif
16900 if bg = 2 then
16910 select case No
16920 '1.数霊リスト 一人用を選択を選択  パッドの右キー
16930 case 0:
16940 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
16950 '2.設定を選択  パッドの右キー
16960 case 1:
16970 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
16980 case 2:
16990 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
17000 end select
17010 endif
17020 if key$=chr$(13) then
17030 select case No
17040 case 0:
17050 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
17060 case 1:
17070 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
17080 case 2:
17090 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
17100 end select
17110 endif
17120 '4.終了するを選択  パッドの右
17130 'バーチャルパッド　ここまで'
17140 Surei_List1:
17150 cls 3:font 48
17160 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
17170 file$ = dir$(SAVE_DATA1$,0)
17180 'ファイルが無いときの画面
17190 if file$ = ""  then
17200 '背景画面表示
17210 select case device_No
17220 case 1:
17230 gload Gazo$ + "KazutamaList1.png",0
17240 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
17250 gload Gazo$+"downscreen.png",0,0,800
17260 case 2:
17270 gload Gazo$ + "KazutamaList1.png"
17280 end select
17290 print chr$(13)
17300 color rgb(255,255,255):print "登録ファイルはございません" + chr$(13)
17310 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
17320 'else
17330 'endif
17340 bg = 0:key$ = ""
17350 while (key$ <> chr$(13) and bg<>2)
17360 key$ = inkey$
17370 bg = strig(1)
17380 pause 2
17390 wend
17400 'エンターキーもしくはバーチャルパッドの右でトップに行く
17410 if (bg = 2  or key$ = chr$(13)) then goto TopScreen:
17420 else
17430 cls 3:buffer_list_count = Loadcount()
17440 color rgb(255,255,255)
17450 if lang_flag = 1 then
17460 Else
17470 talk "登録件数は" + str$(buffer_list_count) + "件です"
17480 select case device_No
17490 Case 1:
17500 gload Gazo$ + "KazutamaList1_Entry.png",0,0,0
17510 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
17520 gload Gazo$ + "downscreen.png",0,0,800
17530 case 2:
17540 gload Gazo$+"KazutamaList1_Entry.png",0,0,0
17550 end select
17560 color rgb(0,0,255)
17570 print chr$(13)
17580 color rgb(255,255,255)
17590 print "登録件数:";buffer_list_count;"件";chr$(13)
17600 color rgb(0,0,0)
17610 print "パッドの右を押してください" + chr$(13)
17620 endif
17630 bg = 0:key$ = "":bg2 = 0
17640 while (key$ <> chr$(13) and bg <> 2)
17650 key$ = inkey$
17660 bg = strig(1)
17670 bg2=strig(0)
17680 pause 2
17690 wend
17700 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
17710 if (key$ = chr$(13) or bg = 2) then pause 2:goto KotodamaList_page:
17720 endif
17730 if (bg = 2) then pause 2:goto TopScreen:
17740 func Loadcount()
17750 n = 0
17760 'while eof(1)=-1
17770 open SAVE_DATA1$  for input as #1
17780 while eof(1) <> -1
17790 line input #1,line$
17800 n = n + 1
17810 wend
17820 close #1
17830 count = n
17840 endfunc count
17850 count_line = Loadcount()
17860 func Kotodama$(buf$)
17870 color rgb(255,255,255)
17880 b = len("数霊:")
17890 a$ = Mid$(buf$,b+1,len(buf$))
17900 for i=0 to 118
17910 color rgb(255,255,255)
17920 if bufline3$(2 * i) ="数霊:" + a$  then
17930 moji_$ = bufline3$(2*i + 1)
17940 endif
17950 next i
17960 kotodama$ = moji_$
17970 endfunc kotodama$
17980 KotodamaList_page:
17990 cls 3:font 48:m = 0:
18000 select case device_No
18010 case 1:
18020 gload Gazo$ + "Screen5_Surei_List.png"
18030 gload Gazo$ + "downscreen.png",0,0,800
18040 case 2:
18050 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
18060 end select
18070 if SAVE_DATA1$ = "" then
18080 cls 3:color rgb(255,255,255):print"ファイルがありません"
18090 else
18100 a = Loadcount()
18110 open SAVE_DATA1$  for input as #1
18120 for i=0 to a-1
18130 for n=0 to 1
18140 input #1,line$
18150 bufKaztama$(i,n) = line$
18160 next n
18170 next i
18180 close #1
18190 l = 0:n=0
18200 select case device_No
18210 case 1:
18220 gload Gazo$ + "Screen5_Surei_List.png"
18230 gload Gazo$ + "downscreen.png",0,0,800
18240 case 2:
18250 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
18260 end select
18270 while (buffer_list_count >= l)
18280 cls
18290 color rgb(255,0,0)
18300 print chr$(13)
18310 color rgb(255,255,255)
18320 n=n+1
18330 print chr$(13)
18340 print "番号:";l+1;chr$(13)
18350 print bufKaztama$(l,0) + chr$(13)
18360 print bufKaztama$(l,1) + chr$(13)
18370 Kmoji$ = moji$
18380 print chr$(13) + chr$(13) + chr$(13)
18390 color rgb(0,0,0)
18400 if buffer_list_count=1 then
18410 print " :パッドの左:トップ画面"+chr$(13)
18420 ui_msg "登録件数は1件です。"
18430 else
18440 if buffer_list_count > 1 then
18450 print " :パッドの左:トップ画面" + chr$(13)
18460 print " :パッドの右:次へ行く" + chr$(13)
18470 endif
18480 endif
18490 key$ = "":bg = 0:bg2 = 0
18500 while (key$ <> chr$(13) and bg <> 2 and bg2 <> 1)
18510 key$ = inkey$
18520 bg = strig(1)
18530 bg2 = strig(0)
18540 pause 2
18550 wend
18560 'if n > 1 then
18570 if (key$ = " " OR bg = 2) then
18580 if n > 1 then
18590 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
18600 endif
18610 else
18620 if ((bg2 = 1) or (key$=chr$(13))) then
18630 goto TopScreen:
18640 endif
18650 else
18660 goto KotodamaList_page:
18670 endif
18680 wend
18690 endif
18700 'ndif
18710 '結果表示２ Menu1
18720 Surei_Result4:
18730 cls 3:font 32+16:init"kb:4"
18740 for i=0 to 181 + 4 - 1
18750 if i = count  then
18760 buffer$ = bufline2$(count + 4,1)
18770 endif
18780 next i
18790 if len(buffer$) > 21 and len(buffer$) <= 45 then
18800 buffer2$ = Mid$(buffer$,1,22)
18810 buffer3$ = Mid$(buffer$,23,(len(buffer$) - 22))
18820 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13)
18830 else
18840 if len(buffer$) <= 21 then
18850 buffer2$ = Mid$(buffer$,1,21)
18860 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
18870 else
18880 if len(buffer$) > 45 and len(buffer$) <= 62 then
18890 buffer2$ = Mid$(buffer$,1,22)
18900 buffer3$ = Mid$(buffer$,23,22)
18910 buffer4$ = Mid$(buffer$,44,(len(buffer$)-44))
18920 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13)
18930 else
18940 if len(buffer$) > 64 and len(buffer$) <= 81 then
18950 buffer2$ = Mid$(buffer$,1,22)
18960 buffer3$ = Mid$(buffer$,23,20)
18970 buffer4$ = Mid$(buffer$,44,20)
18980 buffer5$ = Mid$(buffer$,65,(len(buffer$)-65))
18990 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13)
19000 if len(buffer$) > 81 and len(buffer$) <= 110 then
19010 buffer2$ = Mid$(buffer$,1,22)
19020 buffer3$ = Mid$(buffer$,23,20)
19030 buffer4$ = Mid$(buffer$,43,20)
19040 buffer5$ = Mid$(buffer$,63,20)
19050 buffer6$ = Mid$(buffer$,83,(len(buffer$) - 83))
19060 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13)
19070 endif
19080 endif
19090 endif
19100 endif
19110 endif
19120 Surei_Result4_2:
19130 select case device_No
19140 case 1:
19150 gload Gazo$ + "Screen1_Result2.png"
19160 gload Gazo$ + "downscreen.png",0,0,800
19170 case 2:
19180 gload Gazo$ +"Screen1_Result2.png"
19190 end select
19200 Result_Menu_List$(0)="1.トップ画面に行く"
19210 Result_Menu_List$(1)="2.数霊のデーターを保存"
19220 Result_Menu_List$(2)="3.もう一度、数霊を調べる"
19230 cls
19240 print chr$(13)
19250 if lang_flag = 1 then
19260 else
19270 color rgb(127,255,212)
19280 print chr$(13);chr$(13)
19290 print "入力文字:";buffer_moji$;chr$(13)
19300 print "数霊:";count;chr$(13)
19310 color rgb(255,255,255)
19320 print "数霊の説明:"+chr$(13)
19330 print buffer$
19340 color rgb(0,0,0)
19350 locate 0,15
19360 print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
19370 endif
19380 key$ = "":bg = 0:bg2 = 0
19390 while (bg<>2 and bg2<>1)
19400 key$ = inkey$
19410 bg = strig(1)
19420 bg2 = strig(0)
19430 pause 2
19440 wend
19450 if ((bg = 2) or (bg2 = 1)) then
19460 num = ui_select("Result_Menu_List$","番号を選んでください")
19470 endif
19480 if num = 0 then goto TopScreen:
19490 if num = 1 then goto File_save:
19500 if num = 2 then goto Surei_Input:
19510 if num = -1 then goto Surei_Result4
19520 File_save:
19530 'ファイルがない時
19540 if dir$(SAVE_DATA1$) = " " then
19550 open SAVE_DATA1$ for output as #1
19560 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19570 close #1
19580 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19590 'ファイルが有る時
19600 else
19610 open SAVE_DATA1$ for append as #1
19620 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19630 close #1
19640 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19650 endif
19660 func All_clear()
19670 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
19680 endfunc
19690 'ここから
19700 Config_moji1:
19710 cls 3:Font 48
19720 select case device_No
19730 case 1:
19740 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19750 gload Gazo$ + "downscreen.png",0,0,800
19760 case 2:
19770  gload  Gazo$ + "Screen1_Setting_Top.png",0,0,0
19780 end select
19790 play ""
19800 No=1
19810 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19820 color rgb(0,0,255)
19830 print chr$(13)
19840 if lang_flag = 1 then
19850 'lang_flag = 1:英語
19860 else
19870 'lang_flag = 0:日本語
19880 color rgb(255,255,255)
19890 print "番号を選んでください" + chr$(13)
19900 print " :1.文字の項目" + chr$(13)
19910 print " :2.結果表示設定" + chr$(13)
19920 print " :3.トップ画面に行く" + chr$(13)
19930 print " :4.終 了" + chr$(13)
19940 endif
19950 color rgb(0,0,0)
19960 locate 1,12
19970 if No = 1 then print "1.文字の項目"
19980 'y:バーチャルパッドの処理
19990 'key$:カーソルの処理
20000 'bg:バーチャルパッドの右ボタン
20010 Config_moji1_Screen:
20020 y = 0:key$ = "":bg=0
20030 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
20040 y = stick(1)
20050 key$ = inkey$
20060 bg=strig(1)
20070 pause 2
20080 wend
20090 'バーチャルパッド　ここから'
20100 'バーチャルパッド　ここから'
20110 if y = 1 then
20120 select case No
20130 'No の初期値：No=1
20140 case 1:
20150 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20160 'デバッグライン　ここから
20170 '0のとき
20180 'デバッグライン　ここまで
20190 'デバッグライン　ここから
20200 case 2:
20210 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
20220 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
20230 'if lang_flag = 1 then
20240 'else
20250 locate 1,12:print "3.トップ画面に行くを選択"
20260 'endif
20270 'デバッグライン　ここまで
20280 case 3:
20290 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
20300 'デバッグライン　ここから
20310 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
20320 'デバッグライン　ここまで
20330 case 0:
20340 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20350 'デバッグライン　ここから
20360 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
20370 'デバッグライン　ここまで
20380 end select
20390 endif
20400 'バーチャルパッド　上 ここから
20410 if y = -1 then
20420 select case No
20430 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
20440 case 1:
20450 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
20460 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
20470 case 0:
20480 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
20490 'No:3 3.Help→2.設定 No:2
20500 case 3:
20510 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20520 case 2:
20530 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
20540 end select
20550 endif
20560 if bg=2 then
20570 select case No
20580 '1.数霊チェックを選択  パッドの右キー
20590 case 1:
20600 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
20610 '2.設定を選択    パッドの右キー
20620 case 2:
20630 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
20640 '3.ヘルプを選択 パッドの右
20650 case 3:
20660 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
20670 'プログラムの終了を選択
20680 case 0:
20690 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
20700 'if lang_flag = 1 then
20710 'Else
20720 ui_msg "プログラムを終了します":end
20730 'endif
20740 end select
20750 endif
20760 '4.終了するを選択  パッドの右
20770 'バーチャルパッド　ここまで'
20780 'SettingScreen:
20790 'key$ = input$(1)
20800 'カーソル下'
20810 if key$ = chr$(31) then
20820 select case (No Mod 4)
20830 '登録文字から数霊文字の確認
20840 case 1:
20850 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
20860 '数霊文字の確認からトップ画面に行く
20870 case 2:
20880 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
20890 'トップ画面に行くから終了
20900 case 3:
20910 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
20920 '終了から登録文字
20930 case 0:
20940 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20950 end select
20960 endif
20970 'カーソル　上
20980 if key$ = chr$(30) then
20990 select case (No Mod 4)
21000 case 1:
21010 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
21020 case 2:
21030 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
21040 case 3:
21050 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
21060 case 0:
21070 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
21080 end select
21090 endif
21100 'エンターキーを押したとき
21110 if key$ = chr$(13) then
21120 if No=3 then goto TopScreen:
21130 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
21140 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
21150 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
21160 'lse
21170 'o'o SettingScreen:
21180 endif
21190 'ここまで
21200 Config_moji2:
21210 cls 3:Font 48
21220 select case device_No
21230 case 1:
21240 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
21250 gload Gazo$ + "downscreen.png",0,0,800
21260  case 2:
21270 gload Gazo$ + "Screen1_Setting_Top.png "
21280  end select
21290 play ""
21300 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
21310 No=1
21320 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
21330 color rgb(0,0,255)
21340 'print "●設定項目" + chr$(13)
21350 print chr$(13)
21360 if lang_flag = 1 then
21370 'lang_flag = 1:英語
21380 else
21390 'lang_flag = 0:日本語
21400 color rgb(255,255,255)
21410 print "番号を選んでください" + chr$(13)
21420 'print " :1.文字の項目" + chr$(13)
21430 'print " :2.結果表示設定" + chr$(13)
21440 print " :1.文字の項目" + chr$(13)
21450 print " :2.結果表示設定" + chr$(13)
21460 print " :3.トップ画面に行く" + chr$(13)
21470 print " :4.終 了" + chr$(13)
21480 endif
21490 color rgb(0,0,0)
21500 locate 1,12
21510 if No = 1 then print "1.文字の項目"
21520 'y:バーチャルパッドの処理
21530 'key$:カーソルの処理
21540 'bg:バーチャルパッドの右ボタン
21550 config_moji2:
21560 y = 0:key$ = "":bg=0
21570 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
21580 y = stick(1)
21590 key$ = inkey$
21600 bg = strig(1)
21610 pause 2
21620 wend
21630 'バーチャルパッド　ここから'
21640 'バーチャルパッド　ここから'
21650 if y = 1 then
21660 select case No
21670 'No の初期値：No=1
21680 case 1:
21690 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
21700 'デバッグライン　ここから
21710 '0のとき
21720 'デバッグライン　ここまで
21730 'デバッグライン　ここから
21740 case 2:
21750 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
21760 color rgb(0,0,0)::No=2:goto SettingScreen:
21770 if lang_flag = 1 then
21780 else
21790 locate 0,12:print " 3.トップ画面に行くを選択"
21800 endif
21810 'cls:color rgb(255,255,255):print"ok"
21820 'デバッグライン　ここまで
21830 case 3:
21840 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
21850 'デバッグライン　ここから
21860 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
21870 'デバッグライン　ここまで
21880 case 0:
21890 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21900 'デバッグライン　ここから
21910 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
21920 'デバッグライン　ここまで
21930 end select
21940 endif
21950 'バーチャルパッド　上 ここから
21960 if y = -1 then
21970 select case No
21980 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
21990 case 1:
22000 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
22010 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
22020 case 0:
22030 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
22040 'No:3 3.Help→2.設定 No:2
22050 case 3:
22060 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22070 case 2:
22080 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
22090 end select
22100 endif
22110 '決定ボタン
22120 if bg=2 then
22130 select case No
22140 '1.数霊チェックを選択  パッドの右キー
22150 case 1:
22160 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
22170 '2.設定を選択    パッドの右キー
22180 case 2:
22190 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
22200 '3.ヘルプを選択 パッドの右
22210 case 3:
22220 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
22230 'プログラムの終了を選択
22240 case 0:
22250 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
22260 'if lang_flag = 1 then
22270 'Else
22280 ui_msg "プログラムを終了します":end
22290 'endif
22300 end select
22310 endif
22320 '4.終了するを選択  パッドの右
22330 'バーチャルパッド　ここまで'
22340 'カーソル下'
22350 if key$ = chr$(31) then
22360 select case (No Mod 4)
22370 '登録文字から数霊文字の確認
22380 case 1:
22390 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22400 '数霊文字の確認からトップ画面に行く
22410 case 2:
22420 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
22430 'トップ画面に行くから終了
22440 case 3:
22450 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
22460 '終了から登録文字
22470 case 0:
22480 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
22490 end select
22500 endif
22510 'カーソル　上
22520 if key$ = chr$(30) then
22530 select case (No Mod 4)
22540 case 1:
22550 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
22560 case 2:
22570 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
22580 case 3:
22590 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
22600 case 0:
22610 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
22620 end select
22630 endif
22640 'エンターキーを押したとき
22650 if key$ = chr$(13) then
22660 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
22670 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
22680 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
22690 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
22700 'lse
22710 'o'o SettingScreen:
22720 endif
22730 '結果表示設定
22740 Result_Setting:
22750 color rgb(255,255,255)
22760 'dim list$(4)
22770 'ファイル読み込み
22780 '1.ファイルが有るか無いかのチェック
22790 if Dir$(System$) = "" then
22800 '1-1.ファイルがないとき
22810 '上のSystemフォルダを作成
22820 mkdir "./data/system/"
22830 list$(0) = "●:出た数字から181を引く"
22840 list$(1) = " :出た数字から180を引き単数変換"
22850 open System$ for output as #1
22860 print #1,"config_r=0"
22870 close #1
22880 ui_msg "ファイルを作成しました"
22890 'ファイル作成
22900 else
22910 '1-2.ファイルが有るとき
22920 'config_r:0 出た数字から181を引く
22930 'config_r:1 出た数字から180を引いて単数変換
22940 'open "./System/config.sys" for input as #1
22950 'ファイルが有るときファイルを読み込み
22960 open System$ for input as #1
22970 line input #1,buf_line$
22980 'buf$にデーターをコピーする
22990 buf$ = buf_line$
23000 close #1
23010 if len(buf$) = 10 then
23020 if left$(buf$,9) = "config_r=" then
23030 buf$ = right$(buf_line$,1)
23040 if buf$ = "1" then
23050 '1.System$ ファイルを削除(config.sys)
23060 '2.1行目をconfig_r=1と書き、保存する
23070 buf_config_r = 1
23080 'list$(0) = "●:1.出た数字から180を引いて単数変換"
23090 'list$(1) = " :2.出た数字から181を引く"
23100 else
23110 if buf$ = "0" then
23120 buf_config_r = 0
23130 ' list$(0) = "●:1.出た数字から181を引く"
23140 'list$(1) = " :2.出た数字から180を引いて単数変換"
23150 endif
23160 endif
23170 endif
23180 endif
23190 endif
23200 '"●:1.出た数字から180を引く"をlist$(0)に代入
23210 if buf_config_r =  0 then
23220 list$(0) = "●:1.出た数字から181を引く"
23230 list$(1) = " :2.出た数字から180を引いて単数変換"
23240 else
23250 list$(0) = "●:1.出た数字から180を引いて単数変換"
23260 list$(1) = " :2.出た数字から181を引く"
23270 endif
23280 list$(2) = " :トップ画面に戻る"
23290 list_num = ui_select("list$","番号を選んでください")
23300 play ""
23310 Select case (list_num)
23320 case 0:
23330 if buf$ = "1" then
23340 buf_config_r = 0:
23350 'データーを変更したのでファイルを削除
23360 kill System$
23370 'ファイルを新しく作成
23380 open System$ for output as #1
23390 print #1,"config_r=0"
23400 close #1
23410 ui_msg "設定を変更しました。"
23420 else
23430 'if buf$ = "0" then
23440 'buf_config_r = 1
23450 'kill System$
23460 'open Syetem$ for output as #1
23470 'print #1,"config_r=1"
23480 'close #1
23490 'ui_msg "設定を変更しました"
23500 'endif
23510 endif
23520 goto config_moji2:
23530 case 1:
23540 if buf$ = "0" then
23550 buf_config_r = 1:
23560 'データーを変更したので、ファイルを削除
23570 kill System$
23580 'ファイルを新しく作成
23590 open System$ for output as #1
23600 print #1,"config_r=1"
23610 close #1
23620 ui_msg "設定を変更しました"
23630 else
23640 kill System$
23650 if buf$ = "1" then
23660 open System$ for output as #1
23670 print #1,"config_r=0"
23680 close #1
23690 ui_msg "設定を変更しました"
23700 endif
23710 endif
23720 goto config_moji2:
23730 case 2:
23740 'トップ画面に飛ぶ
23750 goto TopScreen:
23760 case 3:
23770 'プログラムを終了する
23780 cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
23790 end select
23800 '単数変換
23810 Func Single_Complate(num)
23820 '1.出てきた数字から180を引く
23830 a = num - 180
23840 'a:10〜99
23850 Re1:
23860 if (a > 9 and a < 100) then
23870 b1 = fix(a / 10)
23880 b2 = 10 * a - b1
23890 d1 = b1 + b2
23900 if c > 9 then
23910 goto Re1:
23920 else
23930 c = d1:goto Re2:
23940 endif
23950 endif
23960 Re2:
23970 buffer = c
23980 endfunc buffer
23990 Func Surei_Result_Save_File()
24000 'ファイルがないとき
24010 if dir$(SAVE_DATA1$) = "" then
24020 open SAVE_DATA1$ for output as #1
24030 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
24040 close #1
24050 ui_msg "保存しました":talk "保存しました":goto Surei_Result:
24060 else
24070 open SAVE_DATA1$ for append as #1
24080 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
24090 close #1
24100 ui_msg "保存しました":talk "保存しました":goto Surei_Result
24110 endif
24120 endfunc
24130 '言語設定
24140 Setting_Language:
24150 cls 3:screen 1,1,1,1:No=2
24160 select case device_No
24170 case 1:
24180 gload Gazo$ + "Screen1.png",0,0,0
24190 gload Gazo$ + "downscreen.png",0,0,800
24200 case 2:
24210 gload Gazo$ + "Screen1.png",0,0,0
24220 end select
24230 init "Kb:4"
24240 sp_on 1,1:sp_on 0,0
24250 sp_put 0,(0,300),0,0
24260 sp_put 1,(0,400),1,0
24270 color rgb(0,0,255)
24280 'print "番号を選んでください"+chr$(13)
24290 'if lang_flag=0 then
24300 'print "言語設定:日本語"+chr$(13)
24310 'else
24320 'print "言語設定:英 語"+chr$(13)
24330 Change_Language:
24340 if lang_flag = 1 then
24350 cls
24360 print "It has changed Language"+chr$(13)
24370 color rgb(255,255,255)
24380 print "Select the Number"+chr$(13)
24390 print " :1.English → Japanse"+chr$(13)
24400 print " :2.It goes to TopScreen"+chr$(13)
24410 print "Language:In English" +chr$(13)
24420 else
24430 cls:color rgb(255,255,255)
24440 print "設定変更(言語の変更)" + chr$(13)
24450 color rgb(255,255,255)
24460 print chr$(13)
24470 print "番号を選んでください"+chr$(13)
24480 print " :1.日本語 → 英語に変更" + chr$(13)
24490 print " :2.トップ画面に戻る" + chr$(13)
24500 print chr$(13)
24510 print "設定言語:日本語" + chr$(13)
24520 endif
24530 color rgb(0,0,0)
24540 locate 0,15:print "                                       ":locate 0,15:print " 2.トップ画面に戻る　を選択" + chr$(13)
24550 Setting_Language_key:
24560 y=0:key$="":bg=0
24570 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y<> -1 and bg<> 2)
24580 y=stick(1)
24590 key$=inkey$
24600 bg=strig(1)
24610 pause 2
24620 wend
24630 '選択肢変更
24640 if ((y=1) or (y=-1)) then
24650 select case No
24660 case 2:
24670 '実装部分　ここから
24680 pause 200:No=1:sp_on 0,1:sp_on 1,0:locate 0,15:print "                                                         ":locate 0,15:print " 1.日本語 → 英語に変更を選択": goto Setting_Language_key:
24690 '実装部分　ここまで
24700 case 1:
24710 pause 200: No=2:sp_on 0,0:sp_on 1,1:locate 0,15:print "                                                       ":locate 0,15:print " 2.トップ画面に戻る を選択":goto Setting_Language_key:
24720 end select
24730 endif
24740 'Enter Key  決定ボタン
24750 if ((key$=chr$(13)) or (bg=2)) then
24760 select case No
24770 case 2:
24780 sp_on 0,0:sp_on 1,0:goto TopScreen:
24790 case 1:                                                     'lang_flag=1:sp_on 0,0:sp_on 1,0:goto Change_Language:
24800 '
24810 '未実装　ここから
24820 sp_on 0,1:sp_on 1,0:ui_msg "この機能は未実装です":goto Setting_Language_key:
24830 '
24840 '未実装　ここまで
24850 end select
24860 endif
24870 '配列削除
24880 buffer_clear:
24890 erase bufline$
24900 erase bufcount$
24910 erase bufcount1$
24920 erase bufcount2$
24930 erase bufline2$
24940 erase bufline3$
24950 erase bufKaztama$
24960 erase List$
24970 erase Result_Menu_List$
24980 erase list$
24990 erase moji_List$
25000 'ui_msg "メモリーをクリアしました"
25010 return
25020 '配列削除　ここまで
25030 File_Device_Set:
25040 'Device 選択　書き込み
25050 open Device_type$  for output as #1
25060 print #1,device_No
25070 close #1
25080 ui_msg "ファイルを書き込みました"
25090 return
25100 Input_numbertokazutama:
25110 cls 3:gload Gazo$ + "Input_numbertokazutama.png",0,0,0:init "kb:2"
25120 color rgb(255,255,255):locate 1,4:print "調べたい数霊の番号を入れてください"+chr$(13);"(Max:181)"
25130 color rgb(0,0,0):locate 1,7:Input "番号:",num
25140 if (num > 181) then ui_msg"181までの数字で入れ直してください":goto Input_numbertokazutama:
25150 for i=0 to 181+3-1
25160 if i = num then
25170 buffer$ = bufline2$(i+4,1)
25180 goto Numbertokazutama:
25190 endif
25200 next i
25210 'goto Numbertokazutama:
25220 '
25230 '
25240 Numbertokazutama:
25250 cls 3:init "kb:4":bg=0:key$=""
25260 select case (device_No)
25270 case 1:
25280 gload Gazo$ + "Result_numbertokazutama.png",0,0,0
25290 gload Gazo$ + "downscreen.png",0,0,800
25300 case 2:
25310 gload Gazo$ + "Result_numbertokazutama.png",0,0,0
25320 end select
25330 font 32+16:color rgb(255,255,255)
25340 locate 1,3:print "◎数霊番号:";num;chr$(13)
25350 locate 1,4:print "◎数霊の説明"+chr$(13)
25360 if ((len(buffer$) > 21) and (len(buffer$) <= 45)) then
25370 buffer2$ = Mid$(buffer$,1,20)
25380 buffer3$ = Mid$(buffer$,21,len(buffer$)-20)
25390 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13)
25400 else
25410 if (len(buffer$) < 22) then
25420 buffer2$ = Mid$(buffer$,1,21)
25430 buffer$ = buffer2$ + chr$(13)
25440 else
25450 if ((Len(buffer$) > 45) and (len(buffer$) < 66)) then
25460 buffer2$ = Mid$(buffer$,1,20)
25470 buffer3$ = Mid$(buffer$,20,21)
25480 buffer4$ = Mid$(buffer$,41,len(buffer$)-41)
25490 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13)
25500 endif
25510 endif
25520 endif
25530 locate 1,5:print buffer$
25540 color rgb(0,0,0)
25550 locate 1,14:print "ジョイパッドの右を押してください"+chr$(13)
25560 while ((bg <> 2) and (key$ <> chr$(13)))
25570 bg=strig(1)
25580 key$=inkey$
25590 pause 2
25600 wend
25610 if ((bg = 2) or (key$ = chr$(13))) then
25620 goto TopScreen:
25630 endif
25640 data_initialize:
25650 cls 3
25660 select case device_No
25670 case 1:
25680 gload Gazo$ + "Data_initializeScreen.png",0,0,0
25690 gload Gazo$ + "downscreen.png",0,0,800
25700 case 2:
25710 gload Gazo$ + "Data_initializeScreen.png",0,0,0
25720 end select
25730 color rgb(255,255,255):font 48:init "kb:4":No=1:sp_on 1,1:sp_put 1,(5,300),0,0
25740 locate 0,4:print "番号を選んでください"+chr$(13)
25750 print " :1.メンバーリストの初期化" + chr$(13)
25760 print " :2.デバイスの初期化" + chr$(13)
25770 print " :3.トップ画面に行く"+chr$(13)
25780 locate 0,15:color rgb(0,0,0):print " 1.メンバーリストの初期化を選択"
25790 data_initialize2:
25800 y = 0:key$ = "":bg = 0
25810 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
25820 y = stick(1)
25830 key$ = inkey$
25840 bg = strig(1)
25850 pause 2
25860 wend
25870 'y = -1:ジョイパッドの上
25880 'y = 1:ジョイパッド下
25890 'key$ = chr$(13):Enter key
25900 'key$ = chr$(30):カーソル上
25910 'key$ = chr$(31):カーソル下
25920 if ((y = -1) or (key$ = chr$(30))) then
25930 select case No
25940 case 1:
25950  sp_on 1,0:sp_on 2,0:sp_on 0,1:sp_on 3,0:No=0:sp_put 0,(5,500),0,0:locate 0,15:print "                                       ":locate 0,15:print " 3.トップ画面に行くを選択":pause 200:goto data_initialize2:
25960 case 2:
25970 sp_on 1,1:sp_on 2,0:sp_on 0,0:sp_on 3,0:No=1:sp_put 1,(5,300),0,0:locate 0,15:print "                                      ":pause 200:locate 0,15:print " 1.メンバーリストの初期化を選択":goto data_initialize2:
25980 case 0:
25990 sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_on 0,0:sp_put 2,(5,400),0,0:locate 0,15:print "                                      ":pause 200:locate 0,15:print " 2.デバイスの初期化を選択":No=2:goto data_initialize2:
26000 end select
26010 endif
26020 'bg=2:Enter key
26030 if ((bg = 2) or (key$ = chr$(13))) then
26040 select case No
26050 case 0:
26060 sp_on 0,0:sp_on 1,0:sp_on 2,0:pause 200:goto TopScreen:
26070 case 1:
26080 'メンバーリストの初期化トップへ行く
26090 sp_on 0,0:sp_on 1,0:sp_on 2,0:pause 200:goto member_initializeTop:
26100 case 2:
26110 ui_msg "未実装です":goto data_initialize2:
26120 end select
26130 endif
26140 'カーソルの下　または、ジョイパッド下
26150 if ((y = 1) or (key$ = chr$(31))) then
26160 select case No
26170 case 1:
26180 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                          ":locate 0,15:print " 2.デバイスの初期化を選択":goto data_initialize2:
26190 case 2:
26200 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:No=0:locate 0,15:print "                                                          ":locate 0,15:print " 3.トップ画面に行くを選択":goto data_initialize2:
26210 case 0:
26220 sp_on 0,0:sp_on 1,1:sp_on 2,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                                          ":locate 0,15:print " 1.メンバーリストの初期化を選択":goto data_initialize2:
26230 end select
26240 endif
26250 'メンバーリストの初期化トップ
26260 member_initializeTop:
26270 cls 3
26280 select case (device_No)
26290 case 1:
26300 gload Gazo$ + "member_initializeTop.png",0,0,0
26310 gload Gazo$ + "downscreen.png",0,0,800
26320 case 2:
26330 gload Gazo$ + "member_initializeTop.png",0,0,0
26340 end select
26350 No=0:init "kb:4":color rgb(255,255,255):font 48
26360 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,500),0,0
26370 locate 0,4:print  "番号を選んでください"+chr$(13)
26380 print " :1.メンバーリストを初期化する" + chr$(13)
26390 print " :2.バックアップを取る" + chr$(13)
26400 print " :3.トップ画面に戻る"+chr$(13)
26410 color rgb(0,0,0):locate 0,15:print "                                       ":locate 0,15:print " 3.トップ画面に戻るを選択"
26420 member_list2:
26430 y=0:key$="":bg=0
26440 while ((key$ <> chr$(13)) and (y <> 1) and (y <> -1) and (bg <> 2))
26450 y = stick(1)
26460 key$ = inkey$
26470 bg = strig(1)
26480 pause 2
26490 wend
26500 'bg=2,chr$(13):決定ボタン
26510 if ((bg = 2) or (key$ = chr$(13)))  then
26520 select case No
26530 case 1:
26540 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Member_List_DeleteScreen:
26550 case 2:
26560 ui_msg"未実装です":goto member_list2:
26570 case 0:
26580 '3:トップ画面に戻る
26590 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
26600 end select
26610 endif
26620 'y=1:chr$(31):ジョイパッド　下　又は　カーソルの下
26630 if ((y = 1) or (key$ = chr$(31))) then
26640 select case No
26650 case 0:
26660 sp_on 1,1:sp_on 2,0:sp_on 0,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 1.メンバーリストを初期化するを選択":goto member_list2:
26670 case 1:
26680 sp_on 0,0:sp_on 2,1:sp_on 1,0:No=2:sp_put 2,(5,400),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 2.バックアップを取るを選択":goto member_list2:
26690 case 2:
26700 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:locate 0,15:print "                                       ":locate 0,15:print " 3.トップ画面に行くを選択":goto member_list2:
26710 end select
26720 endif
26730 'Joypad  or カーソル　上
26740 if ((y=-1) or (key$=chr$(30))) then
26750 select case No
26760 case 0:
26770 sp_on 2,1:sp_on 1,0:sp_on 0,0:No=2:sp_put 2,(5,400),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 2.バックアップを取るを選択":goto member_list2:
26780 case 1:
26790 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto member_list2:
26800 case 2:
26810 sp_on 0,0:sp_on 1,1:sp_on 2,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 1.メンバーリストを初期化をする選択":goto member_list2:
26820 end select
26830 endif
26840 Member_List_DeleteScreen:
26850 cls:key$ = "":bg = 0:y=0:init "kb:4":font 48:count=0
26860 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
26870 if dir$(SAVE_DATA1$) = "" then
26880 'ファイルがないとき
26890 color rgb(255,255,255)
26900 locate 0,4
26910 print "データーファイルは、存在しません。"
26920 locate 0,15:color rgb(0,0,0):print "ジョイパッドの右を押してください":
26930 'endif
26940 while ((key$ <> chr$(13)) and (bg <> 2) and (y <> 1) and (y <> -1))
26950 key$ = inkey$
26960 bg = strig(1)
26970 y = stick(1)
26980 pause 2
26990 wend
27000 if ((key$ = chr$(13)) or (bg = 2)) then goto TopScreen:
27010 'goto TopScreen:
27020 'endif
27030 else
27040 'ファイルが有るとき
27050 'default
27060 'No=1:ファイルを削除する
27070 'No=2:トップ画面に戻る
27080 No=2
27090 sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0
27100 color rgb(255,255,255)
27110 locate 0,4:print"番号を選んでください"+chr$(13)
27120 print " :1.ファイルを削除する"+chr$(13)
27130 print " :2.トップ画面に戻る"+chr$(13)
27140 color rgb(0,0,0):
27150 locate 0,15:print"                                      ":locate 0,15:print " 2.トップ画面に戻るを選択"
27160 endif
27170 Select_key1:
27180 '初期化
27190 y=0:key$="":bg=0
27200 while ((key$ <> chr$(13)) and (bg <> 2) and (y <> 1) and (y <> -1))
27210 key$ = inkey$
27220 bg = strig(1)
27230 y = stick(1)
27240 pause 2
27250 wend
27260 '1.選択キー
27270 '十字キー 上 y=-1
27280 '十字キー　下 y=1
27290 if ((y = 1) or (y = -1)) then
27300 select case No
27310 case 2:
27320 No=1:sp_on 2,0:sp_on 1,1:sp_put 1,(5,300),0,0:locate 0,15:print "                                                                                ":locate 0,15:print " 1．ファイルを削除":pause 200:goto Select_key1:
27330 case 1:
27340 No=2:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:locate 0,15:print "                                                          ":locate 0,15:print " 2.トップ画面に戻るを選択":pause 200:goto Select_key1:
27350 end select
27360 endif
27370 '2.決定ボタン
27380 'Joypad　右 or Enter key
27390 if ((bg=2) or (key$=chr$(13))) then
27400 Select case No
27410 case 2:
27420 sp_on 1,0:sp_on 2,0:pause 200:goto TopScreen:
27430 case 1:
27440 if (count=0) then
27450 kill SAVE_DATA1$:ui_msg"メンバーリストを削除しました":pause 200:locate 0,15:print "                                       ":locate 0,15:print " ジョイパッドの右を押してください":count=count+1:goto Select_key1:
27460 else
27470 sp_on 1,0:sp_on 2,0:goto TopScreen
27480 endif
27490 end select
27500 endif
