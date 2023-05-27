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
680 '現在のバージョン
690 Version$ = "1.4.7_2023.05.28(正式版)"
700 'csvファイル 1.数霊 ベースファイル
710 FILE_csv$ = "./data/Kazutama.csv"
720 'csvファイル 2.数霊 ベースファイル 2
730 FILE_csv2$ = "./data/Surei_chart_20211207.csv"
740 'Save ファイル
750 SAVE_DATA1$ = "./data/Parsonal_list1.csv"
760 'gazo ファイル
770 Gazo$ = "./data/Gazo/"
780 'System フォルダ:設定ファイルを保存するところ
790 System$ = "./data/System/config.sys"
800 'Device type:デバイスタイプのファイルチェック
810 Device_type$ = "./data/device_type.sys"
820 '設定ファイル名:config.sys
830 'Sound File(Voice)
840 '1.ボイス TopScreen
850 Voice_File_TopScreen$ = "./data/Sound_data/"
860 'Message
870 buf_finish_Message$ = "メモリーを解放してプログラムを終了します"
880 '変数領域
890 'vcount:バーチャルパッド下の変数
900 dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+6,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
910 count2 = 0:N=0:N2=0:m2 = 0:device_No=0:device_type=0
920 dim list$(4),moji_List$(2)
930 'ファイルの有無チェック
940 if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
950 '1.ファイルが無いとき
960 cls :print "依存ファイルが見つかりません":
970 print "エンターキーを押してください" + chr$(13)
980 key$ = input$(1)
990 if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
1000 else
1010 '2.ファイルが有るとき
1020 cls:print "csv:file ok." + chr$(13)
1030 n=0
1040 'FILE_csv$:数霊データー入力
1050 open FILE_csv$ for input as #1
1060 while eof(1) = 0
1070 input #1,line$
1080 bufline$(n) = line$
1090 'Print n;chr$(13)
1100 '登録件数カウント:n
1110 n = n + 1
1120 wend
1130 close #1
1140 N=n
1150 '2つ目のファイル読み込み
1160 'n = 0
1170 open FILE_csv2$ for input as #2
1180 for n=3 to 181+2+2
1190 for i=0 to 1
1200 input #2,line$
1210 bufline2$(n,i) = line$
1220 next i
1230 next n
1240 close #2
1250 N2 = n
1260 endif
1270 '2022.11.23----------------------
1280 '端末言語のチェック
1290 '日本語端末かチェックをして日本語以外なら英語で表示する
1300 'lang flag:0:日本語 1:英語(日本語以外)
1310 '--------------------------------
1320 lang_flag = 0
1330 if ex_info$(1) <> "JP" then
1340 lang_flag = 1
1350 endif
1360 cls 3:font 48:screen 1,1,1,1:int "kb:4":init "crt:0"
1370 play ""
1380 'gload Gazo$ + "TopScreen_20230310.png",0,0,0
1390 '選択ポインター 1 - 4
1400 'スプライトの定義
1410 gload Gazo$ + "Selection.png",1,5,300
1420 gload Gazo$ + "Selection.png",1,5,400
1430 gload Gazo$ + "Selection.png",1,5,500
1440 gload Gazo$ + "Selection.png",1,5,595
1450 sp_def 0,(5,300),32,32
1460 sp_def 1,(5,400),32,32
1470 sp_def 2,(5,500),32,32
1480 sp_def 3,(5,595),32,32
1490 'File check
1500 '初回起動はここから
1510 if (dir$(Device_type$) = "") then
1520 goto Device_Select:
1530 else
1540 '
1550 '2回目以降はファイルチェックをしてトップ画面
1560 '
1570  open Device_type$ for input as #1
1580  line input #1,device_type$
1590  device_No = val(device_type$)
1600  close #1
1610  if (device_No=1 or device_No=2) then
1620  goto TopScreen:
1630  endif
1640 endif
1650 'First_Select_Screen:
1660 'タブレット　or　スマホの選択を起動時にする
1670 Device_Select:
1680 font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
1690 gload Gazo$ + "device_select_20230313.png",0,0,0
1700 init "kb:4"
1710 play ""
1720 play Voice_File_TopScreen$+"Select_device_select.mp3"
1730 'y=0:key$="":bg=0
1740 print chr$(13)+chr$(13)+chr$(13)
1750 color  rgb(255,255,255)
1760 print "番号を選んでください"+chr$(13)
1770 'print chr$(13)
1780 print " :1.スマートフォン"+chr$(13)
1790 print " :2.タブレット端末"+chr$(13)
1800 locate 0,11:No=1
1810 color rgb(0,0,0)
1820 Print " 1.スマートフォンを選択"+chr$(13)
1830 sp_on 0,1:sp_put 0,(5,300),0,0
1840 sp_on 1,0:sp_on 2,0:sp_on 3,0
1850 device_selection:
1860 y=0:key$="":bg=0:
1870 While (key$ <> chr$(30) and key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
1880 y = stick(1)
1890 key$ = inkey$
1900 bg = strig(1)
1910 pause 2
1920 wend
1930 if ((y=1) or (y=-1) or (key$=chr$(30)) or (key$=chr$(31)) ) then
1940 select case No
1950 case 1:
1960       No=2:sp_on 1,1:sp_on 0,0:locate 0,11:pause 300:sp_put 1,(5,400),0,0:print "                                ":locate 0,11:print " 2.タブレット端末を選択":goto device_selection:
1970 case 2:
1980       No=1:sp_on 1,0:sp_on 0,1:pause 300:sp_put 0,(5,300),0,0:locate 0,11:print "                                   ":locate 0,11:print " 1.スマートフォンを選択":goto device_selection:
1990 end select
2000 endif
2010 '決定ボタン
2020 if ((bg=2) or (key$=chr$(13)))  then
2030 select case No
2040 case 1:
2050       sp_on 0,0:sp_on 1,0:device_No=1:gosub File_Device_Set:goto TopScreen:
2060 case 2:
2070       sp_on 0,0:sp_on 1,0:device_No=2:gosub File_Device_Set:goto TopScreen:
2080 end select
2090 endif
2100 'Top画面
2110 TopScreen:
2120 'バーチャルパッドを表示
2130 cls 3:font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
2140 'play ""
2150 play ""
2160 play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
2170 'gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
2180 select case device_No
2190 case 1:
2200 'Top画面の背景画像
2210 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2220 gload Gazo$ + "downscreen.png",0,0,800
2230 case 2:
2240 gload Gazo$ + "TopScreen_20230310.png",0,0,0
2250 end select
2260 'key$=input$(1)
2270 'バーチャルパッドの背景を白にする for smartphone screen
2280 'gload Gazo$ + "downscreen.png",0,0,800
2290 '選択肢 1
2300 gload Gazo$ + "Selection.png",1,5,300
2310 '選択肢 2
2320 gload Gazo$ + "Selection.png",1,5,400
2330 '選択肢 3
2340 gload Gazo$ + "Selection.png",1,5,500
2350 '選択肢 4
2360 'TopScreen:
2370 'select case device_No
2380 'case 1:
2390 gload Gazo$ + "Selection.png",1,5,590
2400 'case 2:
2410 'gload Gazo$ +
2420 'end select
2430 color rgb(0,0,255)
2440 print chr$(13)
2450 if lang_flag = 1 then
2460 color rgb(255,255,255)
2470 print "Select Number" + chr$(13)
2480 print " :1.Kazutama check" + chr$(13)
2490 print " :2.Setting" + chr$(13)
2500 print " :3.Help" + chr$(13)
2510 print " :4.End Program" + chr$(13)
2520 color rgb(255,255,255)
2530 else
2540 color rgb(255,255,255)
2550 print chr$(13)
2560 sp_on 0,1:sp_put 0,(5,300),0,0
2570 print "番号を選んでください" + chr$(13)
2580 print " :1.数霊(かずたま)チェック" + chr$(13)
2590 print " :2.設定" + chr$(13)
2600 print " :3.ヘルプ" + chr$(13)
2610 print " :4.(プログラムを)終　了する" + chr$(13)
2620 color rgb(0,0,0)
2630 'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
2640 'バーチャルパッドを表示
2650 No=1:
2660 'lang_flag:1 外国語,0:日本語
2670 if lang_flag = 1 then
2680 'lang_flag=1 英語
2690 locate 0,15:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
2700 else
2710 'lang_flag=0 日本語
2720 locate 0,15:color rgb(0,0,0):print " 1.数霊(かずたま)チェックを選択";chr$(13)
2730 endif
2740 endif
2750 'TopScreen sprite
2760 'スプライト
2770 '選択肢 1 On
2780 'sp_def 0,(5,300),32,32
2790 'sp_on 0,1
2800 'sp_put 0,(5,300),0,0
2810 '選択肢 2 Off
2820 sp_def 1,(5,400),32,32
2830 sp_on 1,0
2840 sp_put 1,(5,400),0,0
2850 '選択肢 3 Off
2860 sp_def 2,(5,500),32,32
2870 sp_on 2,0
2880 sp_put 2,(5,500),0,0
2890 '選択肢 4 Off
2900 sp_def 3,(5,600),32,32
2910 sp_on 3,0
2920 sp_put 3,(5,600),0,0
2930 color rgb(0,0,0)
2940 Main_Select:
2950 'y:バーチャルパッドの処理
2960 'key$:カーソルの処理
2970 y = 0:key$ = "":bg = 0
2980 while ((key$ <> chr$(31)) and (key$ <> chr$(13)) and (y <> 1) and (y <> -1) and (bg <> 2))
2990 y = stick(1)
3000 key$ = inkey$
3010 bg = strig(1)
3020 pause 2
3030 wend
3040 'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
3050 '1.バーチャルパッドの処理
3060 'バーチャルパッド下を押した時
3070 if y = 1 then
3080 select case No
3090 'No の初期値：No=1
3100 case 1:
3110 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
3120 if lang_flag = 1 then
3130 'lang_flag=1 英語
3140 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3150 else
3160 'lang_flag=0 日本語
3170 locate 0,15:print " 2.設定を選択":goto Main_Select:
3180 endif
3190 'デバッグライン　ここから
3200 '0のとき
3210 'デバッグライン　ここまで
3220 'デバッグライン　ここから
3230 'バーチャルパッド　下
3240 case 2:
3250 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:
3260 print "                                         ":
3270 if lang_flag = 1 then
3280 color rgb(0,0,0):locate 0,15:
3290 print "3.It has selected Help":No=3:goto Main_Select:
3300 else
3310 color rgb(0,0,0):locate 0,15:print "                                                         ":locate 0,15:
3320 print " 3.ヘルプを選択":No=3:goto Main_Select:
3330 endif
3340 'デバッグライン　ここまで
3350 case 3:
3360 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                               "
3370 if lang_flag = 1 then
3380 locate 0,15:print "4.It has selected finish program":No=0:goto Main_Select:
3390 else
3400 locate 0,15:print "                                                         " :locate 0,15:print " 4.(プログラムを)終了するを選択":No=0:goto Main_Select:
3410 endif
3420 'デバッグライン　ここから
3430 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
3440 'デバッグライン　ここまで
3450 case 0:
3460 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1
3470 if lang_flag = 1 then
3480 'lang_flag=1:英語
3490 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
3500 else
3510 'lang_flag=0:日本語
3520 locate 0,15:print "                                      ":locate 0,15:print " 1.数霊(かずたま)チェックを選択":goto Main_Select:
3530 endif
3540 'デバッグライン　ここから
3550 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
3560 'デバッグライン　ここまで
3570 end select
3580 endif
3590 'バーチャルパッド　上 ここから
3600 if (y = -1) then
3610 select case No
3620 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
3630 case 1:
3640 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                                          "
3650 'if lang_flag = 1 then
3660 'lang_flag=1 英語
3670 'locate 0,15:print "4.It has finished program":goto Main_Select:
3680 'else
3690 'lang_flag=0 日本語
3700 locate 0,15:print "                                                          ":
3710 locate 0,15:print " 4.(プログラムを)終了するを選択":goto Main_Select:
3720 'endif
3730 'endif
3740 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
3750 case 0:
3760 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":
3770 if lang_flag = 1 then
3780 '1:英語
3790 locate 0,15:print "3.It has selected Help":goto Main_Select:
3800 else
3810 '0:日本語
3820 locate 0,15:print "                                                                                        "
3830 locate 0,15:print " 3.ヘルプを選択":goto Main_Select:
3840 endif
3850 'No:3 3.Help→2.設定 No:2
3860 case 3:
3870 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      "
3880 if lang_flag = 1 then
3890 '1:英語
3900 locate 0,15:print "2.It has selected Setting":goto Main_Select:
3910 else
3920 '0:日本語
3930 locate 0,15:print" 2.設定を選択":goto Main_Select:
3940 endif
3950 case 2:
3960 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":
3970 if lang_flag = 1 then
3980 'lang_flag 1 英語
3990 locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
4000 else
4010 'lang_flag 0 日本語
4020 locate 0,15:print" 1.数霊(かずたま)チェックを選択":goto Main_Select:
4030 endif
4040 end select
4050 endif
4060 if (bg = 2) then
4070 select case No
4080 '1.数霊チェックを選択  パッドの右キー(決定)
4090 case 1:
4100 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
4110 '2.設定を選択  パッドの右キー(決定)
4120 case 2:
4130 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
4140 '3.ヘルプを選択 パッドの右(決定)
4150 case 3:
4160 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
4170 'プログラムの終了を選択(決定)
4180 case 0:
4190 cls 3:cls 4:gosub buffer_clear:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":ui_msg buf_finish_Message$:pause 4.080*1000:color rgb(255,255,255):end
4200 'if lang_flag = 1 then
4210 'lang_flag = 1 英語
4220 'else
4230 'lang_flag = 0 日本語
4240 'endif
4250 end select
4260 '4.終了するを選択  パッドの右
4270 endif
4280 'バーチャルパッド　上　ここまで
4290 '2.カーソルの処理
4300 'カーソル　下 chr$(31)
4310 if (key$ = chr$(31)) then
4320 select case (No)
4330 '4
4340 '0 選択肢4 => 選択肢1
4350 case 0:
4360 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "              ":color rgb(0,0,0):
4370 if lang_flag = 1 then
4380 'lang flag:1 英語
4390 else
4400 'lang flag:0 日本語
4410 color rgb(0,0,0):locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4420 endif
4430 '1 選択肢1 => 選択肢2
4440 case 1:
4450 c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":
4460 if lang_flag = 1 then
4470 'lang_flag:1 英語
4480 else
4490 'lang_flag:0 日本語
4500 color rgb(0,0,0):locate 0,15:print "2.設定を選択":beep:goto Main_Select:
4510 endif
4520 '2 選択肢2 => 選択肢3
4530 case 2:
4540 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,15:print "               ":
4550 if lang_flag = 1 then
4560 'lang flag:1 英語
4570 else
4580 'lang flang:0 日本語
4590 color rgb(0,0,0):locate 0,15:print "3.ヘルプを選択":goto Main_Select:
4600 endif
4610 '3 選択肢３ => 選択肢4
4620 case 3:
4630 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,595),0,0:locate 0,15:print "               ":color rgb(0,0,0)
4640 if lang_flag = 1 then
4650 'lang_flag = 1 英語
4660 else
4670 'lang_flag = 0 日本語
4680 color rgb(0,0,0):locate 0,15:print "4.終 了を選択":goto Main_Select:
4690 endif
4700 case else:
4710 goto Main_Select:
4720 end select
4730 endif
4740 'カーソル　上
4750 if (key$=chr$(30)) then
4760 select case (No)
4770 '選択肢1 => 選択肢4
4780 case 1:
4790 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:PRINT "                      ":
4800 if lang_flag = 1 then
4810 'lang_flag=1:英語
4820 'print "1.It has selected Kazutama check":goto Main_Select:
4830 else
4840 'lang_flag = 0:日本語
4850 else
4860 print "1.数霊(かずたま)チェックを選択":goto Main_Select:
4870 endif
4880 '選択肢2 => 選択肢1
4890 case 2:
4900 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                 ":locate 1,15:print "2.設 定を選択":goto Main_Select:
4910 '選択肢3　=> 選択肢2
4920 case 3:
4930 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,500),0,0
4940 if lang_flag = 1 then
4950 'lang_flag = 1:英語
4960 locate 0,15:print "It has selected Help":goto Main_Select:
4970 else
4980 'lang_flag = 0:日本語
4990 locate 0,15:print "3.ヘルプを選択":goto Main_Select:
5000 endif
5010 '選択肢4 => 選択肢3
5020 case 0:
5030 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                ":locate 1,15:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
5040 if lang_flag = 1 then
5050 'lang flag=1 英語
5060 else
5070 'lang flag=0 日本語
5080 locate 1,15:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
5090 endif
5100 end select
5110 endif
5120 'Input "番号:",No
5130 'エンターキー入力:決定
5140 if (key$ = chr$(13)) then
5150 select case No
5160 case 1:
5170 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
5180 case 3:
5190 Color rgb(255,255,255):goto Help:
5200 case 0:
5210 cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg buf_finish_Message$:color rgb(255,255,255):pause 4.080 * 1000:end
5220 case 2:
5230 color rgb(255,255,255):sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
5240 end select
5250 endif
5260 '1-1.数霊チェック
5270 Surei_Check:
5280 cls 3:Font 48:
5290 select case device_No
5300  case 1:
5310 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5320 gload Gazo$ + "downscreen.png",0,0,800
5330 case 2:
5340 gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
5350 end select
5360 play ""
5370 play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
5380 color rgb(255,0,0)
5390 'print "●数霊(かずたま)チェックトップ" + chr$(13)
5400 sp_on 0,1:sp_put 0,(5,300),0,0:screen 1,1,1
5410 if lang_flag = 1 then
5420 'lang_flag=1 英語
5430 else
5440 'lang_flag=0 日本語
5450 print chr$(13)+chr$(13)+chr$(13)
5460 color rgb(255,255,255)
5470 print "番号を選んでください" + chr$(13)
5480 print " :1.数霊(かずたま)1人用" + chr$(13)
5490 print " :2.数霊(かずたま)リスト 1人用　" + chr$(13)
5500 print " :3.数霊(かずたま)2人用" + chr$(13)
5510 print " :4.トップ画面に行く" + chr$(13)
5520 color rgb(0,0,0):No = 1
5530 locate 0,15:print "                                       "
5540 locate 0,15
5550 print " 1.数霊(かずたま)1人用を選択"
5560 endif
5570 Kazutama_main:
5580 'y:バーチャルパッドの処理
5590 'key$:カーソルの処理
5600 'bg:バーチャルパッドの右のボタン
5610 y = 0:key$ = "":bg=0
5620 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
5630 y = stick(1)
5640 key$ = inkey$
5650 bg=strig(1)
5660 y=stick(-1)
5670 pause 2
5680 wend
5690 'key$ = input$(1)
5700 if (y = 1) then
5710 select case No
5720 'No の初期値：No=1
5730 case 2:
5740 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                       ":
5750 locate 0,15:print "                                     "
5760 locate 0,15
5770 print" 3.数霊(かずたま)2人用を選択":goto Kazutama_main:
5780 'デバッグライン　ここから
5790 '0のとき
5800 'デバッグライン　ここまで
5810 'デバッグライン　ここから
5820 case 3:
5830 sp_on 2,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_on 0,1:sp_put 0,(5,585),0,0:pause 200:locate 0,15:print "                                               "
5840 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":No=0:goto Kazutama_main:
5850 'デバッグライン　ここまで
5860 'デバッグライン　ここから
5870 'デバッグライン　ここまで
5880 case 0:
5890 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
5900 case 1:
5910 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                                             ":locate 0,15:print " 2.数霊（かずたま）リスト 1人用を選択":goto Kazutama_main:
5920 'デバッグライン　ここから
5930 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
5940 'デバッグライン　ここまで
5950 end select
5960 endif
5970 'バーチャルパッド　上 ここから
5980 if (y = -1) then
5990 select case No
6000 'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
6010 case 1:
6020 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 0,15:print" 4.トップ画面に行くを選択":goto Kazutama_main:
6030 'No:3 3.Help→2.設定 No:2
6040 case 0:
6050 sp_on 1,0:sp_on 0,0:sp_on 3,1:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                     ":locate 0,15:print" 3.数霊（かずたま）2人用を選択":goto Kazutama_main:
6060 case 2:
6070 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
6080 case 3:
6090 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 0,15:print " 2.数霊(かずたま)リスト 1人用を選択":goto Kazutama_main:
6100 end select
6110 endif
6120 if (bg=2) then
6130 select case No
6140 '1.数霊チェックを選択  パッドの右キー
6150 case 1:
6160 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
6170 '2.数霊チェック2人用   パッドの右キー
6180 case 3:
6190 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
6200 '3.トップ画面に行く パッドの右
6210 case 0:
6220 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
6230 '2.数霊リスト1人用 パッドの右キー
6240 case 2:
6250 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_List1:
6260 'プログラムの終了を選択
6270 end select
6280 '4.終了するを選択  パッドの右
6290 endif
6300 'バーチャルパッド　上　ここまで
6310 if (key$ = chr$(31)) then
6320 select case No
6330 case 0:
6340 No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,15:print "                                                          ":
6350 if lang_flag = 1 then
6360 Else
6370 locate 0,15:print "                                      "
6380 No=2:locate 0,15:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
6390 endif
6400 case 1:
6410 No=0:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,585),0,0:locate 0,12:print "                                                          ":
6420 if lang_flag = 1 then
6430 Else
6440 locate 0,15:print"                                      "
6450 locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
6460 endif
6470 case 2:
6480 No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                      ":
6490 if lang_flag = 1 then
6500 Else
6510 No=1:locate 0,15:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
6520 endif
6530 end select
6540 endif
6550 if (key$=chr$(13)) then
6560 select case No
6570 case 1:
6580 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
6590 case 2:
6600 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
6610 case 3:
6620 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
6630 '終了はトップメニューのみにする
6640 end select
6650 endif
6660 '前の画面に戻る
6670 'プログラムの終了
6680 '1人用
6690 '2人用
6700 '数霊(かずたま) 文字入力  1人用
6710 Surei_Input:
6720 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
6730 if mode = 0 then
6740 cls 3:font 32:init"kb:2"
6750 select case device_No
6760 case 1:
6770 gload Gazo$ + "InputKotodama_20230131.png",0,0,0
6780 gload Gazo$ + "CenterScreen_20230401.png",0,0,380
6790 case 2:
6800 gload Gazo$ + "InputKotodama_20230131.png",0,0,0
6810 end select
6820 play""
6830 play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
6840 color rgb(255,0,0)
6850 if lang_flag=1 then
6860 '英語
6870 else
6880 print chr$(13)+chr$(13)+chr$(13)
6890 color rgb(255,255,255)
6900 print "文字を入れてください" + chr$(13)
6910 color rgb(255,255,255)
6920 print "(有効文字:カタカナ、半角アルファベット&大文字のみ)" + chr$(13)
6930 print chr$(13)
6940 color rgb(0,0,0)
6950 Input "入力文字:",buffer_moji$
6960 if buffer_moji$ = "" then
6970 ui_msg "未入力です":goto Surei_Input:
6980 else
6990 goto Surei_Result:
7000 endif
7010 endif
7020 endif
7030 if mode = 1 then
7040 cls 3:Font 32:
7050 gload Gazo$ + "InputKotodama.png"
7060 color rgb(255,0,0)
7070 print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
7080 color rgb(255,255,255)
7090 print "文字を入れてください" + chr$(13)
7100 color rgb(255,0,0)
7110 print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
7120 print "大文字のみ)" + chr$(13)
7130 color rgb(0,0,0)
7140 Input "文字入力:",buffer_moji2$
7150 goto Surei_Result3:
7160 'endif
7170 endif
7180 '数霊(かずたま)文字入力　2人用
7190 Surei_twoParson:
7200 cls 3:Font 32:init"kb:2"
7210 gload Gazo$ + "InputKotodama_20230131.png"
7220 '1人目入力
7230 if lang_flag = 1 then
7240 else
7250 print ""+chr$(13)+chr$(13)+chr$(13)
7260 color rgb(255,255,255)
7270 print "1人目の文字を入れてください" + chr$(13)
7280 color rgb(255,255,255)
7290 print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
7300 color rgb(0,0,0)
7310 print chr$(13)
7320 Input "1人目文字入力:",buf_Parson1$
7330 endif
7340 Surei_twoParson2:
7350 cls 3:Font 32:init"kb:2"
7360 '2人目入力
7370 gload Gazo$ + "InputKotodama_20230131.png"
7380 if lang_falg = 1 then
7390 else
7400 print ""+chr$(13)+chr$(13)+chr$(13)
7410 color rgb(255,255,255)
7420 print "2人目の文字を入れてください" + chr$(13)
7430 color rgb(255,255,255)
7440 print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
7450 color rgb(0,0,0)
7460 Input "2人目の文字入力:",buf_Parson2$
7470 goto Surei_Result2:
7480 endif
7490 '数霊　計算 パート
7500 '文字の計算関数
7510 'moji$:1文字を入れる
7520 func Complate(moji$)
7530 for n = 1 to 116
7540 if moji$ = bufline$(2*n) then
7550 buffcount = val(bufline$(2 * n + 1))
7560 endif
7570 next n
7580 endfunc buffcount
7590 '数霊　結果表示
7600 Surei_Result:
7610 cls 3:Font 32
7620 'ゼロカウント:zcount
7630 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
7640 '例 アカい:"い"の文字は無効な文字なので、はじく
7650 zcount=0
7660 'mojicount:入力文字数
7670 mojicount = len(buffer_moji$)
7680 for n=1 to mojicount
7690 for j=1 to 118
7700 if (bufcount$(n - 1) = bufline$(2 * j)) then
7710 bufcount$(n-1) = Mid$(buffer_moji$,n,1)
7720 endif
7730 next j
7740 next n
7750 ncount=0:count=0
7760 for i = 1 to mojicount
7770 bufcount$(i-1)=Mid$(buffer_moji$,i,1)
7780 'ンのカウント
7790 if (bufcount$(i-1) = "ン") then ncount = ncount + 1
7800 next i
7810 if (ncount > 0) then
7820 'Listを表示する
7830 moji_List$(0) = "この単語は目に見える物です"
7840 moji_List$(1) = "この単語は目に見えない物です"
7850 num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
7860 if (num2 = 0) then
7870 else
7880 if (num2 = 1) then
7890 n1 = 9 * ncount
7900 endif
7910 endif
7920 endif
7930 for j=1 to mojicount
7940 bufcount$(j-1) = Mid$(buffer_moji$,j,1)
7950 count = count + Complate(bufcount$(j - 1))
7960 next j
7970 count = count + n1
7980 if (ncount > 0) then count = count
7990 '182以上のとき,181を引く
8000 if buf_cofig_r = 0 then
8010 if (count > 181) then
8020 count = count - 181
8030 else
8040 if (buf_config_r = 1) then
8050 buf_count = Single_Complate(count)
8060 endif
8070 endif
8080 endif
8090 cls 3:Font 48+16
8100 gload Gazo$ + "Result_Screen3_20230319.png"
8110 if buf_config_r = 1 then
8120 print "入力文字:" + buffer_moji$ + chr$(13)
8130 print "数霊(かずたま):";buf_count;chr$(13)
8140 endif
8150 if lang_flag = 1 then
8160 else
8170 color rgb(255,0,0)
8180 print "入力文字:" + buffer_moji$ + chr$(13)
8190 endif
8200 if lang_flag = 1 then
8210 else
8220 color rgb(0,0,255)
8230 print "数霊(かずたま):";count;chr$(13)
8240 endif
8250 if lang_flag = 1 then
8260 else
8270 color rgb(0,0,0)
8280 print "エンター or スペース" + chr$(13)
8290 print  chr$(13)
8300 'endif
8310 endif
8320 key$ = input$(1)
8330 if ((key$ = chr$(13)) or (key$=" ")) then
8340 List$(0)="1.もう一度数霊を見る"
8350 List$(1)="2.トップ画面に行く"
8360 List$(2)="3.この数霊の説明を見る"
8370 List$(3)="4.数霊データーを保存"
8380 num=ui_select("List$","番号を選んでください")
8390 select case num
8400 case 0:
8410 goto Surei_Input:
8420 case 1:
8430 n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
8440 for i=0 to 9
8450 bufcount$(i)=""
8460 next i
8470 goto TopScreen:
8480 case 2:
8490 goto Surei_Result4:
8500 case 3:
8510 s=Surei_Result_Save_File()
8520 ui_msg "保存しました"
8530 case -1:
8540 'goto Surei_Result:
8550 case else:
8560 goto Surei_Result:
8570 end select
8580 'ファイルを保存する
8590 else
8600 goto Surei_Result:
8610 endif
8620 '3-1 バージョン情報
8630 Version:
8640 cls 3:Font 32
8650 select case device_No
8660 case 1:
8670 gload Gazo$ + "Screen1_Version.png"
8680 gload Gazo$ + "downscreen.png",0,0,800
8690 case 2:
8700 gload Gazo$ + "Screen1_version.png"
8710 end select
8720 play ""
8730 play Voice_File_TopScreen$ + "Voice_Version.mp3"
8740 color rgb(255,0,0)
8750 print chr$(13)
8760 color rgb(255,255,255)
8770 if lang_flag = 1 then
8780 else
8790 print chr$(13)+chr$(13)+chr$(13)
8800 print "Ver:";Version$ + chr$(13)
8810 print "アプリ名:数霊計算機" + chr$(13)
8820 print "Basic for Android Runtime" + chr$(13)
8830 print "Author:licksjp" + chr$(13)
8840 print "制作開始:2021.7.28" + chr$(13)
8850 print chr$(13)
8860 print "(C)Copy right licksjp " + chr$(13)
8870 print "All rights reserved" + chr$(13)
8880 print chr$(13)
8890 color rgb(0,0,0)
8900 print "パッドの右を押してください" + chr$(13)
8910 endif
8920 bg=0:key$=""
8930 while (bg <> 2 and key$ <> chr$(13))
8940 bg = strig(1)
8950 key$ = inkey$
8960 pause 2
8970 wend
8980 if key$ = chr$(13) then
8990 goto TopScreen:
9000 else
9010 if bg=2 then
9020 goto TopScreen:
9030 else
9040 if lang_flag = 1 then
9050 else
9060 talk "無効なキーです":goto Version:
9070 endif
9080 endif
9090 endif
9100 '3-2 参考文献
9110 Reference_Book:
9120 cls 3:Font 48:play""
9130 select case device_No
9140 case 1:
9150 gload Gazo$ + "Screen1_Reference.png"
9160 gload Gazo$ + "downscreen.png",0,0,800
9170 case 2:
9180 gload Gazo$ + "Screen1_Reference.png"
9190 end select
9200 play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
9210 color rgb(255,0,0)
9220 print chr$(13)+chr$(13)
9230 if lang_flag = 1 then
9240 else
9250 color rgb(255,255,255)
9260 print "書名:数霊" + chr$(13)
9270 print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
9280 print "出版社:徳間書店" + chr$(13)
9290 print "ISBN:978-4-19-" + chr$(13)
9300 print "         865309-5" + chr$(13)
9310 print "定価:2300円 + 税" + chr$(13)
9320 color rgb(0,0,0)
9330 print "パッドの右を押してください"
9340 endif
9350 bg = 0:key$ = ""
9360 while (bg <> 2 and key$ <> chr$(13))
9370 bg = strig(1)
9380 key$ = inkey$
9390 pause 2
9400 wend
9410 if key$ = chr$(13) then
9420 goto TopScreen:
9430 else
9440 if bg = 2 then
9450 goto TopScreen:
9460 else
9470 talk "無効なキーです":goto Reference_Book:
9480 endif
9490 endif
9500 'ヘルプ画面　トップ画面
9510 Help:
9520 No=1:c=0
9530 play ""
9540 play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
9550 cls 3:Font 48:
9560 select case device_No
9570 case 1:
9580 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9590 gload Gazo$ + "downscreen.png",0,0,800
9600 case 2:
9610 gload Gazo$ + "Screen1_Help_Top.png",0,0,0
9620 end select
9630 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0
9640 color rgb(255,0,0)
9650 print chr$(13)+chr$(13)+chr$(13)
9660 color rgb(255,255,255)
9670 print "番号を選んでください" + chr$(13)
9680 print " :1.バージョン" + chr$(13)
9690 print " :2.参考文献" + chr$(13)
9700 print " :3.データーの初期化"+chr$(13)
9710 print " :4.トップ画面に行く" + chr$(13)
9720 color rgb(0,0,0)
9730 locate 0,15:print "                                     "
9740 if No = 1 then locate 0,15:print " 1.バージョンを選択"
9750 'y:バーチャルパッドの処理
9760 'key$:カーソルの処理
9770 'bg:バーチャルパッドの右ボタン
9780 Help_key:
9790 y = 0:key$ = "":bg = 0
9800 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
9810 y = stick(1)
9820 key$ = inkey$
9830 bg = strig(1)
9840 pause 2
9850 wend
9860 'バーチャルパッド　ここから'
9870 if (y = 1) then
9880 select case No
9890 'No の初期値：No=1
9900 case 1:
9910 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
9920 if lang_flag = 1 then
9930 else
9940 locate 0,15:print" 2.参考文献を選択":goto Help_key:
9950 endif
9960 'デバッグライン　ここから
9970 '0のとき
9980 'デバッグライン　ここまで
9990 'デバッグライン　ここから
10000 case 3:
10010 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:No=0:pause 200:locate 0,15:print "                                                          "
10020 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":goto Help_key:
10030 'デバッグライン　ここまで
10040 'デバッグライン　ここから
10050 'デバッグライン　ここまで
10060 case 2:
10070 sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 0,15:print "                                                          ":color rgb(0,0,0):locate 0,15:print " 3.データーの初期化を選択":No=3:goto Help_key:
10080 case 0:
10090 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10100 'デバッグライン　ここから
10110 ' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
10120 'デバッグライン　ここまで
10130 end select
10140 endif
10150 'バーチャルパッド　上 ここから
10160 if (y = -1) then
10170 select case No
10180 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
10190 case 1:
10200 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                                           ":locate 0,15:print" 4.トップ画面に行くを選択":goto Help_key
10210 'No:3 3.Help→2.設定 No:2
10220 case 3:
10230 sp_on 1,0:sp_on 0,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                                          ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
10240 case 2:
10250 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                                          ":locate 0,15:print" 1.バージョンを選択":goto Help_key:
10260 case 0:
10270 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                                          ":locate 0,15:print" 3.データーの初期化を選択":goto Help_key:
10280 end select
10290 endif
10300 if (bg = 2) then
10310 select case No
10320 '1.数霊チェックを選択  パッドの右キー
10330 case 1:
10340 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
10350 '2.設定を選択    パッドの右キー
10360 case 2:
10370 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
10380 '3.データーの初期化
10390 case 3:
10400 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto data_initialize:
10410 '4.ヘルプを選択 パッドの右
10420 case 0:
10430 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
10440 'プログラムの終了を選択
10450 'if lang_flag = 1 then
10460 'lang_flag = 1:英語
10470 'Else
10480 'lang_flag = 0:日本語
10490 'endif
10500 end select
10510 '4.終了するを選択  パッドの右
10520 endif
10530 'バーチャルパッド　上　ここまで
10540 'バーチャルパッド　ここまで'
10550 'key$ = input$(1)
10560 'カーソルの下
10570 if key$ = chr$(31) then
10580 select case (No Mod 4)
10590 'バージョンから参考文献
10600 case 0:
10610 c=1:No=c:locate 0,15:Print "             ":locate 0,15:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
10620 '参考文献からトップ画面
10630 case 1:
10640 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "            ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10650 'トップ画面から終了
10660 '終了からバージョン
10670 case 2:
10680 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                     ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10690 case else:
10700 goto Help_key:
10710 end select
10720 endif
10730 'カーソル　上
10740 if (key$ = chr$(30)) then
10750 select case (c Mod 4)
10760 'バージョンから終了
10770 case 0:
10780 c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:locate 0,15:print "                   ":locate 0,15:print " 4.終 了を選択":goto Help_key:
10790 '参考文献からバージョン
10800 case 1:
10810 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                   ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
10820 'トップ画面から参考文献
10830 case 2:
10840 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":locate 0,15:print " 2.参考文献を選択":goto Help_key:
10850 '終了からトップ画面を選択
10860 case 3:
10870 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print"                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
10880 case else:
10890 goto Help_key:
10900 end select
10910 endif
10920 'エンターキー：決定
10930 if (key$ = chr$(13)) then
10940 if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
10950 if No=0 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
10960 if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
10970 else
10980 goto Help_key:
10990 endif
11000 '登録文字の確認
11010 '文字を1文字入れて登録されているか調べるメニュー
11020 '設定項目
11030 Setting:
11040 cls 3:Font 48
11050 select case device_No
11060 case 1:
11070 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
11080 gload Gazo$ + "downscreen.png",0,0,800
11090  case 2:
11100 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
11110 end select
11120 play ""
11130 play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
11140 No=1
11150 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:
11160 color rgb(0,0,255)
11170 print chr$(13)
11180 if lang_flag = 1 then
11190 'lang_flag = 1:英語
11200 else
11210 'lang_flag = 0:日本語
11220 color rgb(255,255,255)
11230 print chr$(13)
11240 print "番号を選んでください" + chr$(13)
11250 '-------コメント----------------
11260 'print " :1.登録文字の確認" + chr$(13)
11270 'print " :2.数霊文字確認" + chr$(13)
11280 '-------コメント----------------
11290 'print chr$(13)
11300 print " :1.文字の項目" + chr$(13)
11310 print " :2.結果表示設定" + chr$(13)
11320 print " :3.言語設定" + chr$(13)
11330 print " :4.トップ画面に行く" + chr$(13)
11340 endif
11350 color rgb(0,0,0)
11360 locate 0,15
11370 if No=1 then locate 0,15:print  "                                     ":locate 0,15:print " 1.文字の項目を選択"
11380 'y:バーチャルパッドの処理
11390 'key$:カーソルの処理
11400 'bg:バーチャルパッドの右ボタン
11410 SettingScreen:
11420 y = 0:key$ = "":bg=0
11430 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
11440 y = stick(1)
11450 key$ = inkey$
11460 bg=strig(1)
11470 pause 2
11480 wend
11490 'バーチャルパッド　ここから'
11500 'バーチャルパッド　ここから'
11510 if (y = 1) then
11520 select case No
11530 'No の初期値：No=1
11540 case 1:
11550 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":color rgb(0,0,0):locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
11560 'デバッグライン　ここから
11570 '0のとき
11580 'デバッグライン　ここまで
11590 'デバッグライン　ここから
11600 case 2:
11610 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                         "
11620 color rgb(0,0,0)::No=3
11630 if lang_flag = 1 then
11640 else
11650 locate 1,15:print "3.言語設定を選択":goto SettingScreen:
11660 endif
11670 'デバッグライン　ここまで
11680 case 3:
11690 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                              ":locate 1,15:print "4.トップ画面に行くを選択":No=0:goto SettingScreen:
11700 'デバッグライン　ここから
11710 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
11720 'デバッグライン　ここまで
11730 case 0:
11740 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
11750 'デバッグライン　ここから
11760 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
11770 'デバッグライン　ここまで
11780 end select
11790 endif
11800 'バーチャルパッド　上 ここから
11810 if (y = -1) then
11820 select case No
11830 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
11840 case 1:
11850 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 1,15:print"4.トップ画面に行くを選択":goto SettingScreen:
11860 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
11870 case 0:
11880 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 1,15:print"3.言語設定を選択":goto SettingScreen:
11890 'No:3 3.Help→2.設定 No:2
11900 case 3:
11910 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.結果表示設定を選択":goto SettingScreen:
11920 case 2:
11930 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 1,15:print"1.文字の項目を選択":goto SettingScreen:
11940 end select
11950 endif
11960 if (bg=2) then
11970 select case No
11980 '1.数霊チェックを選択  パッドの右キー
11990 case 1:
12000 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
12010 '2.設定を選択    パッドの右キー
12020 case 2:
12030 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
12040 '3.ヘルプを選択 パッドの右
12050 case 0:
12060 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
12070 'プログラムの終了を選択
12080 case 3:
12090 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Setting_Language:
12100 end select
12110 endif
12120 '4.終了するを選択  パッドの右
12130 'バーチャルパッド　ここまで'
12140 'カーソル下'
12150 if (key$ = chr$(31)) then
12160 select case (No Mod 4)
12170 '登録文字から数霊文字の確認
12180 case 1:
12190 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                     ":locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
12200 '数霊文字の確認からトップ画面に行く
12210 case 2:
12220 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "                                     ":locate 1,15:print"3.言語設定を選択":goto SettingScreen:
12230 'トップ画面に行くから終了
12240 case 3:
12250 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,590),0,0:locate 0,15:print "                                       ":locate 1,15:print "4.トップ画面に行くを選択":goto SettingScreen:
12260 '終了から登録文字
12270 case 0:
12280 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
12290 end select
12300 endif
12310 'カーソル　上
12320 if (key$ = chr$(30)) then
12330 select case (No Mod 4)
12340 case 1:
12350 c=2:No=c:sp_on 0,1:sp_put 0,(5,300),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
12360 case 2:
12370 c=3:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
12380 case 3:
12390 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:goto SettingScreen:
12400 case 0:
12410 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,590),0,0:sp_on 0,0:goto SettingScreen:
12420 end select
12430 endif
12440 'エンターキーを押したとき
12450 if (key$ = chr$(13)) then
12460 if (No=3) then goto Setting_Language:
12470 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
12480 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
12490 if (No=0) then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
12500 endif
12510 '文字検索項目  ここから
12520 Moji_Search:
12530 cls 4:cls 3:Font 32+16:init"kb:2"
12540 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12550 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12560 play ""
12570 play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
12580 print "" + chr$(13)
12590 color rgb(255,255,255)
12600 if lang_flag = 1 then
12610 Else
12620 print "文字を一文字入れてください" + chr$(13)
12630 endif
12640 color rgb(0,0,0)
12650 if lang_flag=1 then
12660 Else
12670 Input "登録文字:",moji$
12680 endif
12690 moji_count = len(moji$)
12700 if moji_count > 1 then
12710 talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Moji_Search:
12720 else
12730 count=0:
12740 for n = 0 to 116
12750 if bufline$(2*n) = moji$ then
12760 cls 3:font 48:init"kb:4":
12770 select case device_No
12780 case 1:
12790 gload Gazo$ + "downscreen.png",0,0,800
12800 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
12810 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12820 case 2:
12830 gload Gazo$ + "Moji_Search_Result.png",0,0,0
12840 end select
12850 play ""
12860 play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
12870 if lang_flag = 1 then
12880 Else
12890 bg=0:key$=""
12900 print chr$(13)
12910 color rgb(255,255,255)
12920 print moji$;"は、登録されています。" + chr$(13)
12930 color rgb(0,0,0)
12940 print "ジョイパッドの右を押してください"
12950 endif
12960 'bg = 0:key$ = ""
12970 while (bg <> 2 and key$ <> chr$(13))
12980 key$ = inkey$
12990 bg = strig(1)
13000 pause 2
13010 wend
13020 if ((key$ = chr$(13)) or (bg = 2)) then goto TopScreen:
13030 count = count + 1
13040 endif
13050 next n
13060 if count = 0 then
13070 cls 3:font 48:init "kb:4":bg=0:key$=""
13080 select case (device_No)
13090 case 1:
13100 gload Gazo$ + "Moji_check.png",0,0,0
13110 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
13120 gload Gazo$ + "downscreen.png",0,0,800
13130 case 2:
13140 gload Gazo$ + "Moji_check.png",0,0,0
13150 end select
13160 play ""
13170 play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
13180 print chr$(13)
13190 if lang_flag = 1 then
13200 Else
13210 color rgb(255,255,255)
13220 print moji$;"は、登録されていません。" + chr$(13)
13230 color rgb(0,0,0)
13240 print "パッドの右を押してください" + chr$(13)
13250 endif
13260 while (bg <> 2 and key$ <> chr$(13))
13270 key$ = inkey$
13280 bg = strig(1)
13290 pause 2
13300 wend
13310 if ((key$ = chr$(13)) or (bg = 2)) then goto TopScreen:
13320 endif
13330 endif
13340 Surei_Result2:
13350 cls 3:Font 48
13360 zcount1=0:zcount2=0:count1=0:count2=0
13370 '1人目
13380 mojicount1=len(buf_Parson1$)
13390 '2人目
13400 mojicount2 = len(buf_Parson2$)
13410 '1人目
13420 for n = 1 to mojicount1
13430 for j = 1 to 116
13440 bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
13450 if bufcount1$(n-1) = bufline$(2*j) then
13460 zcount1 = zcount1 + 1
13470 endif
13480 next j
13490 next n
13500 '2人目
13510 for n = 1 to mojicount2
13520 for j = 1 to 116
13530 bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
13540 if bufcount2$(n-1) = bufline$(2*j) then
13550 zount2 = zcount2 + 1
13560 endif
13570 next j
13580 next n
13590 '1人目
13600 for i=1 to mojicount1
13610 bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
13620 p1 = Complate(bufcount1$(i-1))
13630 count1 = count1 + p1
13640 next i
13650 '2人目
13660 for i = 1 to mojicount2
13670 bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
13680 p2 = Complate(bufcount2$(i-1))
13690 count2 = count2 + p2
13700 next i
13710 cls 3:
13720 select case device_No
13730 case 1:
13740 gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
13750 gload Gazo$ + "downscreen.png",0,0,800
13760 case 2:
13770 gload Gazo$ + "downscreen.png",0,0,0
13780 end select
13790 color rgb(255,0,0)
13800 print ""+chr$(13)
13810 if lang_flag = 1 then
13820 else
13830 color rgb(255,255,255)
13840 print chr$(13)+chr$(13)
13850 print "1人目:";buf_Parson1$;chr$(13)
13860 print "数霊1:";count1;chr$(13)
13870 print "2人目:";buf_Parson2$;chr$(13)
13880 print "数霊2:";count2;chr$(13)
13890 print "数霊(合計):";count1 + count2;chr$(13)
13900 color rgb(0,0,0)
13910 print "バーチャルパッドの右" + chr$(13)
13920 endif
13930 key$ = "":bg = 0
13940 while (bg <> 2 and key$ <> chr$(13))
13950 bg = strig(1)
13960 key$ = inkey$
13970 pause 2
13980 wend
13990 if (bg = 2 or key$ = chr$(13))  then goto TopScreen:
14000 Surei_Result3:
14010 cls 3:Font 48
14020 zcount2 = 0:count2 = 0
14030 mojicount2 = len(buffer_moji2$)
14040 for n = 1 to mojicount2
14050 for j = 1 to 116
14060 bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
14070 if bufcount2$(n - 1) = bufline$(2 * j) then
14080 zcount2 = zcount2 + 1
14090 endif
14100 next j
14110 next n
14120 for i = 1 to mojicount2
14130 n2 = Complate(bufcount2$(i-1))
14140 count2 = count2 + n2
14150 next i
14160 gload Gazo$ + "Screen5.png"
14170 if lang_flag = 1 then
14180 else
14190 color rgb(255,0,0)
14200 print "数霊の結果表示" + chr$(13)
14210 color rgb(255,255,255)
14220 print "１回目回の文字入力:";buffer_moji$;chr$(13)
14230 print "１回目の数霊(かずたま)";count;chr$(13)
14240 print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
14250 print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
14260 color rgb(0,0,0)
14270 print "エンターキー:トップ画面";chr$(13)
14280 print "c or C キー:数霊の比較";chr$(13)
14290 endif
14300 key$ = "":bg = 0
14310 while (key$ <> chr$(13) and bg <> 2)
14320 bg = strig(1)
14330 key$ = inkey$
14340 pause 2
14350 wend
14360 if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
14370 if key$ = "c" or key$ = "C" then
14380 if count = count2 then
14390 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
14400 else
14410 play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
14420 endif
14430 endif
14440 Moji_Count_Check:
14450 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
14460 cls 3:Font 48
14470 select case device_No
14480 case 1:
14490 gload Gazo$ + "Moji_check.png"
14500 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
14510 gload Gazo$ + "downscreen.png",0,0,800
14520 case 2:
14530 gload Gazo$ + "Moji_check.png",0,0,0
14540 end select
14550 n = 0
14560 open FILE_csv$ for input as #1
14570 while eof(1) = 0
14580 line input #1, line$
14590 n = n + 1
14600 wend
14610 close #1
14620 play ""
14630 if (n = 118) then
14640 play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
14650 if lang_flag = 1 then
14660 else
14670 print "" + chr$(13)
14680 color rgb(255,255,255)
14690 print "文字の登録文字数は";n;"文字" + chr$(13)
14700 color rgb(0,0,0)
14710 print "パッドの右を押してください" + chr$(13)
14720 endif
14730 endif
14740 key$ = "":bg = 0
14750 while ((key$ <> chr$(13)) and (bg <> 2))
14760 key$=inkey$
14770 bg=strig(1)
14780 pause 2
14790 wend
14800 if ((bg = 2) or (key$=chr$(13))) then
14810 goto TopScreen:
14820 else
14830 goto Moji_Count_Check:
14840 endif
14850 'Save 関数
14860 file_kazutama = 0
14870 file_kazutama = Save_File()
14880 func Save_File()
14890 open SAVE_DATA1$  for output as #1
14900 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
14910 close #1
14920 endfunc
14930 Select_moji:
14940 cls 3:font 48:No = 1
14950 select case device_No
14960 case 1:
14970 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
14980 gload Gazo$ + "downscreen.png",0,0,800
14990 case 2:
15000 gload Gazo$ + "Screen1_mojicheck.png",0,0,0
15010 end select
15020 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
15030 color rgb(255,0,0)
15040 if lang_flag = 1 then
15050 else
15060 play ""
15070 play Voice_File_TopScreen$ + "Voice_Select_Moji20230217.mp3"
15080 print chr$(13)+chr$(13)+chr$(13)
15090 color rgb(255,255,255)
15100 print "番号を選んでください" + chr$(13)
15110 print " :1.登録文字検索"+ chr$(13)
15120 print " :2.登録文字数の確認" + chr$(13)
15130 print " :3.数字から数霊の説明"+chr$(13)
15140 print " :4.トップ画面に戻る" + chr$(13)
15150 color rgb(0,0,0)
15160 locate 0,15
15170 if No = 1 then print " 1.登録文字検索を選択"
15180 endif
15190 Entry_check_key:
15200 y = 0:key$ = "":bg=0
15210 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
15220 y = stick(1)
15230 key$ = inkey$
15240 bg=strig(1)
15250 pause 2
15260 wend
15270 'バーチャルパッド　ここから'
15280 'バーチャルパッド　ここから'
15290 if y = 1 then
15300 select case No
15310 'No の初期値：No=1
15320 case 1:
15330 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print "2.登録文字数の確認を選択":goto Entry_check_key:
15340 'デバッグライン　ここから
15350 '0のとき
15360 'デバッグライン　ここまで
15370 'デバッグライン　ここから
15380 case 2:
15390       sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 0,15:print "                                                         ":No=3:locate 0,15:print" 3.数字から数霊の説明を選択":goto Entry_check_key:
15400 case 3:
15410 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:locate 0,15:print "                                       "
15420 :No=0
15430 'if lang_flag = 1 then
15440 'Else
15450 color rgb(0,0,0):locate 0,15:print " 4.トップ画面に戻るを選択":goto Entry_check_key:
15460 'endif
15470 'cls:color rgb(255,255,255):print"ok"
15480 'デバッグライン　ここまで
15490 'デバッグライン　ここから
15500 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
15510 'デバッグライン　ここまで
15520 case 0:
15530 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.登録文字検索を選択":goto Entry_check_key:
15540 'デバッグライン　ここから
15550 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
15560 'デバッグライン　ここまで
15570 end select
15580 endif
15590 'バーチャルパッド　上 ここから
15600 if y = -1 then
15610 select case No
15620 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
15630 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
15640 case 0:
15650       sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print "                                      ":locate 0,15:print " 3.数字から数霊の説明を選択":goto Entry_check_key:
15660 case 1:
15670 sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print"4.トップ画面に戻るを選択":goto Entry_check_key:
15680 'No:3 3.Help→2.設定 No:2
15690 case 3:
15700 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
15710 case 2:
15720 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 1.登録文字検索を選択":goto Entry_check_key:
15730 end select
15740 endif
15750 if bg=2 then
15760 select case No
15770 '1.数霊チェックを選択  パッドの右キー
15780 case 1:
15790 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
15800 '2.設定を選択    パッドの右キー
15810 case 2:
15820 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
15830 '3.ヘルプを選択 パッドの右
15840 case 0:
15850 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
15860 case 3:
15870 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Input_numbertokazutama:
15880 end select
15890 endif
15900 '4.終了するを選択  パッドの右
15910 'バーチャルパッド　ここまで'
15920 'key$ = input$(1)
15930 'カーソルの下
15940 if key$ = chr$(31) then
15950 select case (No Mod 4)
15960 case 0:
15970 c=1:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
15980 case 1:
15990 c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,500),0,0:sp_on 3,0:goto Entry_check_key:
16000 case 2:
16010 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:goto Entry_check_key:
16020 case 3:
16030 c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
16040 end select
16050 endif
16060 'カーソル　上
16070 if key$ = chr$(30) then
16080 select case (No Mod 4)
16090 case 0:
16100 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
16110 case 1:
16120 c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
16130 case 2:
16140 c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
16150 case 3:
16160 c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
16170 end select
16180 endif
16190 'エンターキーを押す
16200 if key$ = chr$(13) then
16210 if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
16220 if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
16230 if No = 0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
16240 endif
16250 '
16260 Kakunin_Surei_count:
16270 cls 3:font 48:No=0
16280 select case device_No
16290 case 1:
16300 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
16310 'gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
16320 gload Gazo$ + "downscreen.png",0,0,800
16330 case 2:
16340 gload Gazo$ + "Kazutama_List_Top.png",0,0,0
16350  end select
16360 sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
16370 color rgb(255,0,0)
16380 print chr$(13)+chr$(13)+chr$(13)
16390 color rgb(255,255,255)
16400 print "番号を選んでください" + chr$(13)
16410 print " :1.数霊リスト 1人用" + chr$(13)
16420 print " :2.結果表示設定" + chr$(13)
16430 print " :3.トップ画面に行く" + chr$(13)
16440 print "" + chr$(13)
16450 color rgb(0,0,0)
16460 locate 0,15:print"                                                         "
16470 if No = 0 then locate 1,15:print "1.数霊リスト　1人用を選択"
16480 Entry_List:
16490 y = 0:key$ = "":bg=0
16500 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
16510 y = stick(1)
16520 key$ = inkey$
16530 bg = strig(1)
16540 pause 2
16550 wend
16560 'バーチャルパッド　ここから'
16570 'バーチャルパッド　ここから'
16580 'バーチャルパッド　下
16590 if y = 1 then
16600 select case No
16610 'No の初期値：No=1
16620 case 0:
16630 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=1:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.結果表示設定を選択":goto Entry_List:
16640 'デバッグライン　ここから
16650 '0のとき
16660 'デバッグライン　ここまで
16670 'デバッグライン　ここから
16680 'color rgb(0,0,0):locate 0,15:print " 4.終了を選択":goto Entry_List:
16690 'cls:color rgb(255,255,255):print"ok"
16700 'デバッグライン　ここまで
16710 case 2:
16720 sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,300),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 1.数霊リスト 1人用を選択":No=0:goto Entry_List:
16730 case 1:
16740 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                      ":No=2:locate 1,15:print "3．トップ画面に行くを選択":goto Entry_List:
16750 'デバッグライン　ここから
16760 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
16770 'デバッグライン　ここまで
16780 'デバッグライン　ここから
16790 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
16800 'デバッグライン　ここまで
16810 end select
16820 endif
16830 'バーチャルパッド　上 ここから
16840 if y = -1 then
16850 select case No
16860 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
16870 case 2:
16880 sp_on 2,0:sp_on 0,0:sp_on 1,1:sp_on 3,0:sp_put 1,(5,400),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 2.結果表示設定を選択":goto Entry_List:
16890 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
16900 case 0:
16910 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 1,15:print"3.トップ画面に行くを選択":goto Entry_List:
16920 'No:3 3.Help→2.設定 No:2
16930 case 1:
16940 sp_on 1,0:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 0,(5,300),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print "1.数霊リスト 1人用を選択":goto Entry_List:
16950 end select
16960 endif
16970 if bg = 2 then
16980 select case No
16990 '1.数霊リスト 一人用を選択を選択  パッドの右キー
17000 case 0:
17010 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
17020 '2.設定を選択  パッドの右キー
17030 case 1:
17040 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
17050 case 2:
17060 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
17070 end select
17080 endif
17090 if key$=chr$(13) then
17100 select case No
17110 case 0:
17120 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
17130 case 1:
17140 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
17150 case 2:
17160 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
17170 end select
17180 endif
17190 '4.終了するを選択  パッドの右
17200 'バーチャルパッド　ここまで'
17210 Surei_List1:
17220 cls 3:font 48
17230 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
17240 file$ = dir$(SAVE_DATA1$,0)
17250 'ファイルが無いときの画面
17260 if file$ = ""  then
17270 '背景画面表示
17280 select case device_No
17290 case 1:
17300 gload Gazo$ + "KazutamaList1.png",0
17310 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
17320 gload Gazo$+"downscreen.png",0,0,800
17330 case 2:
17340 gload Gazo$ + "KazutamaList1.png"
17350 end select
17360 print chr$(13)
17370 color rgb(255,255,255):print "登録ファイルはございません" + chr$(13)
17380 color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
17390 'else
17400 'endif
17410 bg = 0:key$ = ""
17420 while (key$ <> chr$(13) and bg<>2)
17430 key$ = inkey$
17440 bg = strig(1)
17450 pause 2
17460 wend
17470 'エンターキーもしくはバーチャルパッドの右でトップに行く
17480 if (bg = 2  or key$ = chr$(13)) then goto TopScreen:
17490 else
17500 cls 3:buffer_list_count = Loadcount()
17510 color rgb(255,255,255)
17520 if lang_flag = 1 then
17530 Else
17540 talk "登録件数は" + str$(buffer_list_count) + "件です"
17550 select case device_No
17560 Case 1:
17570 gload Gazo$ + "KazutamaList1_Entry.png",0,0,0
17580 gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
17590 gload Gazo$ + "downscreen.png",0,0,800
17600 case 2:
17610 gload Gazo$+"KazutamaList1_Entry.png",0,0,0
17620 end select
17630 color rgb(0,0,255)
17640 print chr$(13)
17650 color rgb(255,255,255)
17660 print "登録件数:";buffer_list_count;"件";chr$(13)
17670 color rgb(0,0,0)
17680 print "パッドの右を押してください" + chr$(13)
17690 endif
17700 bg = 0:key$ = "":bg2 = 0
17710 while (key$ <> chr$(13) and bg <> 2)
17720 key$ = inkey$
17730 bg = strig(1)
17740 bg2=strig(0)
17750 pause 2
17760 wend
17770 'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
17780 if (key$ = chr$(13) or bg = 2) then pause 2:goto KotodamaList_page:
17790 endif
17800 if (bg = 2) then pause 2:goto TopScreen:
17810 func Loadcount()
17820 n = 0
17830 'while eof(1)=-1
17840 open SAVE_DATA1$  for input as #1
17850 while eof(1) <> -1
17860 line input #1,line$
17870 n = n + 1
17880 wend
17890 close #1
17900 count = n
17910 endfunc count
17920 count_line = Loadcount()
17930 func Kotodama$(buf$)
17940 color rgb(255,255,255)
17950 b = len("数霊:")
17960 a$ = Mid$(buf$,b+1,len(buf$))
17970 for i=0 to 118
17980 color rgb(255,255,255)
17990 if bufline3$(2 * i) ="数霊:" + a$  then
18000 moji_$ = bufline3$(2*i + 1)
18010 endif
18020 next i
18030 kotodama$ = moji_$
18040 endfunc kotodama$
18050 KotodamaList_page:
18060 cls 3:font 48:m = 0:
18070 select case device_No
18080 case 1:
18090 gload Gazo$ + "Screen5_Surei_List.png"
18100 gload Gazo$ + "downscreen.png",0,0,800
18110 case 2:
18120 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
18130 end select
18140 if SAVE_DATA1$ = "" then
18150 cls 3:color rgb(255,255,255):print"ファイルがありません"
18160 else
18170 a = Loadcount()
18180 open SAVE_DATA1$  for input as #1
18190 for i=0 to a-1
18200 for n=0 to 1
18210 input #1,line$
18220 bufKaztama$(i,n) = line$
18230 next n
18240 next i
18250 close #1
18260 l = 0:n=0
18270 select case device_No
18280 case 1:
18290 gload Gazo$ + "Screen5_Surei_List.png"
18300 gload Gazo$ + "downscreen.png",0,0,800
18310 case 2:
18320 gload Gazo$ + "Screen5_Surei_List.png",0,0,0
18330 end select
18340 while (buffer_list_count >= l)
18350 cls
18360 color rgb(255,0,0)
18370 print chr$(13)
18380 color rgb(255,255,255)
18390 n=n+1
18400 print chr$(13)
18410 print "番号:";l+1;chr$(13)
18420 print bufKaztama$(l,0) + chr$(13)
18430 print bufKaztama$(l,1) + chr$(13)
18440 Kmoji$ = moji$
18450 print chr$(13) + chr$(13) + chr$(13)
18460 color rgb(0,0,0)
18470 if buffer_list_count=1 then
18480 print " :パッドの左:トップ画面"+chr$(13)
18490 ui_msg "登録件数は1件です。"
18500 else
18510 if buffer_list_count > 1 then
18520 print " :パッドの左:トップ画面" + chr$(13)
18530 print " :パッドの右:次へ行く" + chr$(13)
18540 endif
18550 endif
18560 key$ = "":bg = 0:bg2 = 0
18570 while (key$ <> chr$(13) and bg <> 2 and bg2 <> 1)
18580 key$ = inkey$
18590 bg = strig(1)
18600 bg2 = strig(0)
18610 pause 2
18620 wend
18630 'if n > 1 then
18640 if (key$ = " " OR bg = 2) then
18650 if n > 1 then
18660 l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
18670 endif
18680 else
18690 if ((bg2 = 1) or (key$=chr$(13))) then
18700 goto TopScreen:
18710 endif
18720 else
18730 goto KotodamaList_page:
18740 endif
18750 wend
18760 endif
18770 'ndif
18780 '結果表示２ Menu1
18790 Surei_Result4:
18800 cls 3:font 32+16:init"kb:4"
18810 for i=0 to 181 + 4 - 1
18820 if i = count  then
18830 buffer$ = bufline2$(count + 4,1)
18840 endif
18850 next i
18860 if len(buffer$) > 21 and len(buffer$) <= 45 then
18870 buffer2$ = Mid$(buffer$,1,22)
18880 buffer3$ = Mid$(buffer$,23,(len(buffer$) - 22))
18890 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13)
18900 else
18910 if len(buffer$) <= 21 then
18920 buffer2$ = Mid$(buffer$,1,21)
18930 buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
18940 else
18950 if len(buffer$) > 45 and len(buffer$) <= 62 then
18960 buffer2$ = Mid$(buffer$,1,22)
18970 buffer3$ = Mid$(buffer$,23,22)
18980 buffer4$ = Mid$(buffer$,44,(len(buffer$)-44))
18990 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13)
19000 else
19010 if len(buffer$) > 64 and len(buffer$) <= 81 then
19020 buffer2$ = Mid$(buffer$,1,22)
19030 buffer3$ = Mid$(buffer$,23,20)
19040 buffer4$ = Mid$(buffer$,44,20)
19050 buffer5$ = Mid$(buffer$,65,(len(buffer$)-65))
19060 buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13)
19070 if len(buffer$) > 81 and len(buffer$) <= 110 then
19080 buffer2$ = Mid$(buffer$,1,22)
19090 buffer3$ = Mid$(buffer$,23,20)
19100 buffer4$ = Mid$(buffer$,43,20)
19110 buffer5$ = Mid$(buffer$,63,20)
19120 buffer6$ = Mid$(buffer$,83,(len(buffer$) - 83))
19130 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13)
19140 endif
19150 endif
19160 endif
19170 endif
19180 endif
19190 Surei_Result4_2:
19200 select case device_No
19210 case 1:
19220 gload Gazo$ + "Screen1_Result2.png"
19230 gload Gazo$ + "downscreen.png",0,0,800
19240 case 2:
19250 gload Gazo$ +"Screen1_Result2.png"
19260 end select
19270 Result_Menu_List$(0)="1.トップ画面に行く"
19280 Result_Menu_List$(1)="2.数霊のデーターを保存"
19290 Result_Menu_List$(2)="3.もう一度、数霊を調べる"
19300 cls
19310 print chr$(13)
19320 if lang_flag = 1 then
19330 else
19340 color rgb(127,255,212)
19350 print chr$(13);chr$(13)
19360 print "入力文字:";buffer_moji$;chr$(13)
19370 print "数霊:";count;chr$(13)
19380 color rgb(255,255,255)
19390 print "数霊の説明:"+chr$(13)
19400 print buffer$
19410 color rgb(0,0,0)
19420 locate 0,15
19430 print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
19440 endif
19450 key$ = "":bg = 0:bg2 = 0
19460 while (bg<>2 and bg2<>1)
19470 key$ = inkey$
19480 bg = strig(1)
19490 bg2 = strig(0)
19500 pause 2
19510 wend
19520 if ((bg = 2) or (bg2 = 1)) then
19530 num = ui_select("Result_Menu_List$","番号を選んでください")
19540 endif
19550 if num = 0 then goto TopScreen:
19560 if num = 1 then goto File_save:
19570 if num = 2 then goto Surei_Input:
19580 if num = -1 then goto Surei_Result4
19590 File_save:
19600 'ファイルがない時
19610 if dir$(SAVE_DATA1$) = " " then
19620 open SAVE_DATA1$ for output as #1
19630 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19640 close #1
19650 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19660 'ファイルが有る時
19670 else
19680 open SAVE_DATA1$ for append as #1
19690 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
19700 close #1
19710 ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
19720 endif
19730 func All_clear()
19740 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
19750 endfunc
19760 'ここから
19770 Config_moji1:
19780 cls 3:Font 48
19790 select case device_No
19800 case 1:
19810 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
19820 gload Gazo$ + "downscreen.png",0,0,800
19830 case 2:
19840  gload  Gazo$ + "Screen1_Setting_Top.png",0,0,0
19850 end select
19860 play ""
19870 No=1
19880 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
19890 color rgb(0,0,255)
19900 print chr$(13)
19910 if lang_flag = 1 then
19920 'lang_flag = 1:英語
19930 else
19940 'lang_flag = 0:日本語
19950 color rgb(255,255,255)
19960 print "番号を選んでください" + chr$(13)
19970 print " :1.文字の項目" + chr$(13)
19980 print " :2.結果表示設定" + chr$(13)
19990 print " :3.トップ画面に行く" + chr$(13)
20000 print " :4.終 了" + chr$(13)
20010 endif
20020 color rgb(0,0,0)
20030 locate 1,12
20040 if No = 1 then print "1.文字の項目"
20050 'y:バーチャルパッドの処理
20060 'key$:カーソルの処理
20070 'bg:バーチャルパッドの右ボタン
20080 Config_moji1_Screen:
20090 y = 0:key$ = "":bg=0
20100 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
20110 y = stick(1)
20120 key$ = inkey$
20130 bg=strig(1)
20140 pause 2
20150 wend
20160 'バーチャルパッド　ここから'
20170 'バーチャルパッド　ここから'
20180 if y = 1 then
20190 select case No
20200 'No の初期値：No=1
20210 case 1:
20220 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20230 'デバッグライン　ここから
20240 '0のとき
20250 'デバッグライン　ここまで
20260 'デバッグライン　ここから
20270 case 2:
20280 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
20290 color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
20300 'if lang_flag = 1 then
20310 'else
20320 locate 1,12:print "3.トップ画面に行くを選択"
20330 'endif
20340 'デバッグライン　ここまで
20350 case 3:
20360 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
20370 'デバッグライン　ここから
20380 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
20390 'デバッグライン　ここまで
20400 case 0:
20410 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
20420 'デバッグライン　ここから
20430 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
20440 'デバッグライン　ここまで
20450 end select
20460 endif
20470 'バーチャルパッド　上 ここから
20480 if y = -1 then
20490 select case No
20500 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
20510 case 1:
20520 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
20530 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
20540 case 0:
20550 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
20560 'No:3 3.Help→2.設定 No:2
20570 case 3:
20580 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
20590 case 2:
20600 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
20610 end select
20620 endif
20630 if bg=2 then
20640 select case No
20650 '1.数霊チェックを選択  パッドの右キー
20660 case 1:
20670 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
20680 '2.設定を選択    パッドの右キー
20690 case 2:
20700 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
20710 '3.ヘルプを選択 パッドの右
20720 case 3:
20730 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
20740 'プログラムの終了を選択
20750 case 0:
20760 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
20770 'if lang_flag = 1 then
20780 'Else
20790 ui_msg "プログラムを終了します":end
20800 'endif
20810 end select
20820 endif
20830 '4.終了するを選択  パッドの右
20840 'バーチャルパッド　ここまで'
20850 'SettingScreen:
20860 'key$ = input$(1)
20870 'カーソル下'
20880 if key$ = chr$(31) then
20890 select case (No Mod 4)
20900 '登録文字から数霊文字の確認
20910 case 1:
20920 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
20930 '数霊文字の確認からトップ画面に行く
20940 case 2:
20950 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
20960 'トップ画面に行くから終了
20970 case 3:
20980 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
20990 '終了から登録文字
21000 case 0:
21010 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
21020 end select
21030 endif
21040 'カーソル　上
21050 if key$ = chr$(30) then
21060 select case (No Mod 4)
21070 case 1:
21080 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
21090 case 2:
21100 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
21110 case 3:
21120 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
21130 case 0:
21140 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
21150 end select
21160 endif
21170 'エンターキーを押したとき
21180 if key$ = chr$(13) then
21190 if No=3 then goto TopScreen:
21200 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
21210 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
21220 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
21230 'lse
21240 'o'o SettingScreen:
21250 endif
21260 'ここまで
21270 Config_moji2:
21280 cls 3:Font 48
21290 select case device_No
21300 case 1:
21310 gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
21320 gload Gazo$ + "downscreen.png",0,0,800
21330  case 2:
21340 gload Gazo$ + "Screen1_Setting_Top.png "
21350  end select
21360 play ""
21370 'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
21380 No=1
21390 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
21400 color rgb(0,0,255)
21410 'print "●設定項目" + chr$(13)
21420 print chr$(13)
21430 if lang_flag = 1 then
21440 'lang_flag = 1:英語
21450 else
21460 'lang_flag = 0:日本語
21470 color rgb(255,255,255)
21480 print "番号を選んでください" + chr$(13)
21490 'print " :1.文字の項目" + chr$(13)
21500 'print " :2.結果表示設定" + chr$(13)
21510 print " :1.文字の項目" + chr$(13)
21520 print " :2.結果表示設定" + chr$(13)
21530 print " :3.トップ画面に行く" + chr$(13)
21540 print " :4.終 了" + chr$(13)
21550 endif
21560 color rgb(0,0,0)
21570 locate 1,12
21580 if No = 1 then print "1.文字の項目"
21590 'y:バーチャルパッドの処理
21600 'key$:カーソルの処理
21610 'bg:バーチャルパッドの右ボタン
21620 config_moji2:
21630 y = 0:key$ = "":bg=0
21640 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
21650 y = stick(1)
21660 key$ = inkey$
21670 bg = strig(1)
21680 pause 2
21690 wend
21700 'バーチャルパッド　ここから'
21710 'バーチャルパッド　ここから'
21720 if y = 1 then
21730 select case No
21740 'No の初期値：No=1
21750 case 1:
21760 sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
21770 'デバッグライン　ここから
21780 '0のとき
21790 'デバッグライン　ここまで
21800 'デバッグライン　ここから
21810 case 2:
21820 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
21830 color rgb(0,0,0)::No=2:goto SettingScreen:
21840 if lang_flag = 1 then
21850 else
21860 locate 0,12:print " 3.トップ画面に行くを選択"
21870 endif
21880 'cls:color rgb(255,255,255):print"ok"
21890 'デバッグライン　ここまで
21900 case 3:
21910 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
21920 'デバッグライン　ここから
21930 'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
21940 'デバッグライン　ここまで
21950 case 0:
21960 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
21970 'デバッグライン　ここから
21980 ' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
21990 'デバッグライン　ここまで
22000 end select
22010 endif
22020 'バーチャルパッド　上 ここから
22030 if y = -1 then
22040 select case No
22050 'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
22060 case 1:
22070 sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
22080 'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
22090 case 0:
22100 sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
22110 'No:3 3.Help→2.設定 No:2
22120 case 3:
22130 sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22140 case 2:
22150 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
22160 end select
22170 endif
22180 '決定ボタン
22190 if bg=2 then
22200 select case No
22210 '1.数霊チェックを選択  パッドの右キー
22220 case 1:
22230 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
22240 '2.設定を選択    パッドの右キー
22250 case 2:
22260 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
22270 '3.ヘルプを選択 パッドの右
22280 case 3:
22290 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
22300 'プログラムの終了を選択
22310 case 0:
22320 cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
22330 'if lang_flag = 1 then
22340 'Else
22350 ui_msg "プログラムを終了します":end
22360 'endif
22370 end select
22380 endif
22390 '4.終了するを選択  パッドの右
22400 'バーチャルパッド　ここまで'
22410 'カーソル下'
22420 if key$ = chr$(31) then
22430 select case (No Mod 4)
22440 '登録文字から数霊文字の確認
22450 case 1:
22460 c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
22470 '数霊文字の確認からトップ画面に行く
22480 case 2:
22490 c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
22500 'トップ画面に行くから終了
22510 case 3:
22520 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
22530 '終了から登録文字
22540 case 0:
22550 c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
22560 end select
22570 endif
22580 'カーソル　上
22590 if key$ = chr$(30) then
22600 select case (No Mod 4)
22610 case 1:
22620 c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
22630 case 2:
22640 c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
22650 case 3:
22660 c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
22670 case 0:
22680 c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
22690 end select
22700 endif
22710 'エンターキーを押したとき
22720 if key$ = chr$(13) then
22730 if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
22740 if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
22750 if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
22760 if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
22770 'lse
22780 'o'o SettingScreen:
22790 endif
22800 '結果表示設定
22810 Result_Setting:
22820 color rgb(255,255,255)
22830 'dim list$(4)
22840 'ファイル読み込み
22850 '1.ファイルが有るか無いかのチェック
22860 if Dir$(System$) = "" then
22870 '1-1.ファイルがないとき
22880 '上のSystemフォルダを作成
22890 mkdir "./data/system/"
22900 list$(0) = "●:出た数字から181を引く"
22910 list$(1) = " :出た数字から180を引き単数変換"
22920 open System$ for output as #1
22930 print #1,"config_r=0"
22940 close #1
22950 ui_msg "ファイルを作成しました"
22960 'ファイル作成
22970 else
22980 '1-2.ファイルが有るとき
22990 'config_r:0 出た数字から181を引く
23000 'config_r:1 出た数字から180を引いて単数変換
23010 'open "./System/config.sys" for input as #1
23020 'ファイルが有るときファイルを読み込み
23030 open System$ for input as #1
23040 line input #1,buf_line$
23050 'buf$にデーターをコピーする
23060 buf$ = buf_line$
23070 close #1
23080 if len(buf$) = 10 then
23090 if left$(buf$,9) = "config_r=" then
23100 buf$ = right$(buf_line$,1)
23110 if buf$ = "1" then
23120 '1.System$ ファイルを削除(config.sys)
23130 '2.1行目をconfig_r=1と書き、保存する
23140 buf_config_r = 1
23150 'list$(0) = "●:1.出た数字から180を引いて単数変換"
23160 'list$(1) = " :2.出た数字から181を引く"
23170 else
23180 if buf$ = "0" then
23190 buf_config_r = 0
23200 ' list$(0) = "●:1.出た数字から181を引く"
23210 'list$(1) = " :2.出た数字から180を引いて単数変換"
23220 endif
23230 endif
23240 endif
23250 endif
23260 endif
23270 '"●:1.出た数字から180を引く"をlist$(0)に代入
23280 if buf_config_r =  0 then
23290 list$(0) = "●:1.出た数字から181を引く"
23300 list$(1) = " :2.出た数字から180を引いて単数変換"
23310 else
23320 list$(0) = "●:1.出た数字から180を引いて単数変換"
23330 list$(1) = " :2.出た数字から181を引く"
23340 endif
23350 list$(2) = " :トップ画面に戻る"
23360 list_num = ui_select("list$","番号を選んでください")
23370 play ""
23380 Select case (list_num)
23390 case 0:
23400 if buf$ = "1" then
23410 buf_config_r = 0:
23420 'データーを変更したのでファイルを削除
23430 kill System$
23440 'ファイルを新しく作成
23450 open System$ for output as #1
23460 print #1,"config_r=0"
23470 close #1
23480 ui_msg "設定を変更しました。"
23490 else
23500 'if buf$ = "0" then
23510 'buf_config_r = 1
23520 'kill System$
23530 'open Syetem$ for output as #1
23540 'print #1,"config_r=1"
23550 'close #1
23560 'ui_msg "設定を変更しました"
23570 'endif
23580 endif
23590 goto config_moji2:
23600 case 1:
23610 if buf$ = "0" then
23620 buf_config_r = 1:
23630 'データーを変更したので、ファイルを削除
23640 kill System$
23650 'ファイルを新しく作成
23660 open System$ for output as #1
23670 print #1,"config_r=1"
23680 close #1
23690 ui_msg "設定を変更しました"
23700 else
23710 kill System$
23720 if buf$ = "1" then
23730 open System$ for output as #1
23740 print #1,"config_r=0"
23750 close #1
23760 ui_msg "設定を変更しました"
23770 endif
23780 endif
23790 goto config_moji2:
23800 case 2:
23810 'トップ画面に飛ぶ
23820 goto TopScreen:
23830 case 3:
23840 'プログラムを終了する
23850 cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
23860 end select
23870 '単数変換
23880 Func Single_Complate(num)
23890 '1.出てきた数字から180を引く
23900 a = num - 180
23910 'a:10〜99
23920 Re1:
23930 if (a > 9 and a < 100) then
23940 b1 = fix(a / 10)
23950 b2 = 10 * a - b1
23960 d1 = b1 + b2
23970 if c > 9 then
23980 goto Re1:
23990 else
24000 c = d1:goto Re2:
24010 endif
24020 endif
24030 Re2:
24040 buffer = c
24050 endfunc buffer
24060 Func Surei_Result_Save_File()
24070 'ファイルがないとき
24080 if dir$(SAVE_DATA1$) = "" then
24090 open SAVE_DATA1$ for output as #1
24100 print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
24110 close #1
24120 ui_msg "保存しました":talk "保存しました":goto Surei_Result:
24130 else
24140 open SAVE_DATA1$ for append as #1
24150 print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
24160 close #1
24170 ui_msg "保存しました":talk "保存しました":goto Surei_Result
24180 endif
24190 endfunc
24200 '言語設定
24210 Setting_Language:
24220 cls 3:screen 1,1,1,1:No=2
24230 select case device_No
24240 case 1:
24250 gload Gazo$ + "Screen1.png",0,0,0
24260 gload Gazo$ + "downscreen.png",0,0,800
24270 case 2:
24280 gload Gazo$ + "Screen1.png",0,0,0
24290 end select
24300 init "Kb:4"
24310 sp_on 1,1:sp_on 0,0
24320 sp_put 0,(0,300),0,0
24330 sp_put 1,(0,400),1,0
24340 color rgb(0,0,255)
24350 'print "番号を選んでください"+chr$(13)
24360 'if lang_flag=0 then
24370 'print "言語設定:日本語"+chr$(13)
24380 'else
24390 'print "言語設定:英 語"+chr$(13)
24400 Change_Language:
24410 if lang_flag = 1 then
24420 cls
24430 print "It has changed Language"+chr$(13)
24440 color rgb(255,255,255)
24450 print "Select the Number"+chr$(13)
24460 print " :1.English → Japanse"+chr$(13)
24470 print " :2.It goes to TopScreen"+chr$(13)
24480 print "Language:In English" +chr$(13)
24490 else
24500 cls:color rgb(255,255,255)
24510 print "設定変更(言語の変更)" + chr$(13)
24520 color rgb(255,255,255)
24530 print chr$(13)
24540 print "番号を選んでください"+chr$(13)
24550 print " :1.日本語 → 英語に変更" + chr$(13)
24560 print " :2.トップ画面に戻る" + chr$(13)
24570 print chr$(13)
24580 print "設定言語:日本語" + chr$(13)
24590 endif
24600 color rgb(0,0,0)
24610 locate 0,15:print "                                       ":locate 0,15:print " 2.トップ画面に戻る　を選択" + chr$(13)
24620 Setting_Language_key:
24630 y=0:key$="":bg=0
24640 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y<> -1 and bg<> 2)
24650 y=stick(1)
24660 key$=inkey$
24670 bg=strig(1)
24680 pause 2
24690 wend
24700 '選択肢変更
24710 if ((y=1) or (y=-1)) then
24720 select case No
24730 case 2:
24740 '実装部分　ここから
24750 pause 200:No=1:sp_on 0,1:sp_on 1,0:locate 0,15:print "                                                         ":locate 0,15:print " 1.日本語 → 英語に変更を選択": goto Setting_Language_key:
24760 '実装部分　ここまで
24770 case 1:
24780 pause 200: No=2:sp_on 0,0:sp_on 1,1:locate 0,15:print "                                                       ":locate 0,15:print " 2.トップ画面に戻る を選択":goto Setting_Language_key:
24790 end select
24800 endif
24810 'Enter Key  決定ボタン
24820 if ((key$=chr$(13)) or (bg=2)) then
24830 select case No
24840 case 2:
24850 sp_on 0,0:sp_on 1,0:goto TopScreen:
24860 case 1:                                                     'lang_flag=1:sp_on 0,0:sp_on 1,0:goto Change_Language:
24870 '
24880 '未実装　ここから
24890 sp_on 0,1:sp_on 1,0:ui_msg "この機能は未実装です":goto Setting_Language_key:
24900 '
24910 '未実装　ここまで
24920 end select
24930 endif
24940 '配列削除
24950 buffer_clear:
24960 erase bufline$
24970 erase bufcount$
24980 erase bufcount1$
24990 erase bufcount2$
25000 erase bufline2$
25010 erase bufline3$
25020 erase bufKaztama$
25030 erase List$
25040 erase Result_Menu_List$
25050 erase list$
25060 erase moji_List$
25070 'ui_msg "メモリーをクリアしました"
25080 return
25090 '配列削除　ここまで
25100 File_Device_Set:
25110 'Device 選択　書き込み
25120 open Device_type$  for output as #1
25130 print #1,device_No
25140 close #1
25150 ui_msg "ファイルを書き込みました"
25160 return
25170 Input_numbertokazutama:
25180 cls 3:init "kb:2"
25190 select case (device_No)
25200 case  1:
25210     gload Gazo$ + "Input_numbertokazutama.png",0,0,0
25220     gload Gazo$ + "Input_numbertokazutama2.png",0,0,380
25230 case 2:
25240     gload Gazo$ + "Input_numbertokazutama.png",0,0,0
25250 end select
25260 color rgb(255,255,255):locate 1,4:print "調べたい数霊の番号を入れてください"+chr$(13);"(Max:181)"
25270 color rgb(0,0,0):locate 1,7:Input "番号:",num
25280 if (num > 181) then ui_msg"181までの数字で入れ直してください":goto Input_numbertokazutama:
25290 pause 200
25300 for i=0 to 181+3-1
25310 if i = num then
25320 buffer$ = bufline2$(i+4,1)
25330 talk buffer$
25340 goto Numbertokazutama:
25350 endif
25360 next i
25370 'goto Numbertokazutama:
25380 '
25390 '
25400 Numbertokazutama:
25410 cls 3:init "kb:4":bg=0:key$=""
25420 select case (device_No)
25430 case 1:
25440 gload Gazo$ + "Result_numbertokazutama.png",0,0,0
25450 gload Gazo$ + "downscreen.png",0,0,800
25460 case 2:
25470 gload Gazo$ + "Result_numbertokazutama.png",0,0,0
25480 end select
25490 font 32+16:color rgb(255,255,255)
25500 locate 1,3:print "◎数霊番号:";num;chr$(13)
25510 locate 1,4:print "◎数霊の説明"+chr$(13)
25520 if ((len(buffer$) > 21) and (len(buffer$) <= 45)) then
25530 buffer2$ = Mid$(buffer$,1,20)
25540 buffer3$ = Mid$(buffer$,21,len(buffer$)-20)
25550 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13)
25560 else
25570 if (len(buffer$) < 22) then
25580 buffer2$ = Mid$(buffer$,1,21)
25590 buffer$ = buffer2$ + chr$(13)
25600 else
25610 if ((Len(buffer$) > 45) and (len(buffer$) < 66)) then
25620 buffer2$ = Mid$(buffer$,1,20)
25630 buffer3$ = Mid$(buffer$,20,21)
25640 buffer4$ = Mid$(buffer$,41,len(buffer$)-41)
25650 buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13)
25660 endif
25670 endif
25680 endif
25690 locate 1,5:print buffer$
25700 color rgb(0,0,0)
25710 locate 1,14:print "ジョイパッドの右を押してください"+chr$(13)
25720 while ((bg <> 2) and (key$ <> chr$(13)))
25730 bg=strig(1)
25740 key$=inkey$
25750 pause 2
25760 wend
25770 if ((bg = 2) or (key$ = chr$(13))) then
25780 goto TopScreen:
25790 endif
25800 data_initialize:
25810 cls 3
25820 select case device_No
25830 case 1:
25840 gload Gazo$ + "Data_initializeScreen.png",0,0,0
25850 gload Gazo$ + "downscreen.png",0,0,800
25860 case 2:
25870 gload Gazo$ + "Data_initializeScreen.png",0,0,0
25880 end select
25890 color rgb(255,255,255):font 48:init "kb:4":No=1:sp_on 1,1:sp_put 1,(5,300),0,0
25900 locate 0,4:print "番号を選んでください"+chr$(13)
25910 print " :1.メンバーリストの初期化" + chr$(13)
25920 print " :2.デバイスの初期化" + chr$(13)
25930 print " :3.トップ画面に行く"+chr$(13)
25940 locate 0,15:color rgb(0,0,0):print " 1.メンバーリストの初期化を選択"
25950 data_initialize2:
25960 y = 0:key$ = "":bg = 0
25970 while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
25980 y = stick(1)
25990 key$ = inkey$
26000 bg = strig(1)
26010 pause 2
26020 wend
26030 'y = -1:ジョイパッドの上
26040 'y = 1:ジョイパッド下
26050 'key$ = chr$(13):Enter key
26060 'key$ = chr$(30):カーソル上
26070 'key$ = chr$(31):カーソル下
26080 if ((y = -1) or (key$ = chr$(30))) then
26090 select case No
26100 case 1:
26110  sp_on 1,0:sp_on 2,0:sp_on 0,1:sp_on 3,0:No=0:sp_put 0,(5,500),0,0:locate 0,15:print "                                       ":locate 0,15:print " 3.トップ画面に行くを選択":pause 200:goto data_initialize2:
26120 case 2:
26130 sp_on 1,1:sp_on 2,0:sp_on 0,0:sp_on 3,0:No=1:sp_put 1,(5,300),0,0:locate 0,15:print "                                      ":pause 200:locate 0,15:print " 1.メンバーリストの初期化を選択":goto data_initialize2:
26140 case 0:
26150 sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_on 0,0:sp_put 2,(5,400),0,0:locate 0,15:print "                                      ":pause 200:locate 0,15:print " 2.デバイスの初期化を選択":No=2:goto data_initialize2:
26160 end select
26170 endif
26180 'bg=2:Enter key
26190 if ((bg = 2) or (key$ = chr$(13))) then
26200 select case No
26210 case 0:
26220 sp_on 0,0:sp_on 1,0:sp_on 2,0:pause 200:goto TopScreen:
26230 case 1:
26240 'メンバーリストの初期化トップへ行く
26250 sp_on 0,0:sp_on 1,0:sp_on 2,0:pause 200:goto member_initializeTop:
26260 case 2:
26270 ui_msg "未実装です":goto data_initialize2:
26280 end select
26290 endif
26300 'カーソルの下　または、ジョイパッド下
26310 if ((y = 1) or (key$ = chr$(31))) then
26320 select case No
26330 case 1:
26340 sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                          ":locate 0,15:print " 2.デバイスの初期化を選択":goto data_initialize2:
26350 case 2:
26360 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:No=0:locate 0,15:print "                                                          ":locate 0,15:print " 3.トップ画面に行くを選択":goto data_initialize2:
26370 case 0:
26380 sp_on 0,0:sp_on 1,1:sp_on 2,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                                          ":locate 0,15:print " 1.メンバーリストの初期化を選択":goto data_initialize2:
26390 end select
26400 endif
26410 'メンバーリストの初期化トップ
26420 member_initializeTop:
26430 cls 3
26440 select case (device_No)
26450 case 1:
26460 gload Gazo$ + "member_initializeTop.png",0,0,0
26470 gload Gazo$ + "downscreen.png",0,0,800
26480 case 2:
26490 gload Gazo$ + "member_initializeTop.png",0,0,0
26500 end select
26510 No=0:init "kb:4":color rgb(255,255,255):font 48
26520 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,500),0,0
26530 locate 0,4:print  "番号を選んでください"+chr$(13)
26540 print " :1.メンバーリストを初期化する" + chr$(13)
26550 print " :2.バックアップを取る" + chr$(13)
26560 print " :3.トップ画面に戻る"+chr$(13)
26570 color rgb(0,0,0):locate 0,15:print "                                       ":locate 0,15:print " 3.トップ画面に戻るを選択"
26580 member_list2:
26590 y=0:key$="":bg=0
26600 while ((key$ <> chr$(13)) and (y <> 1) and (y <> -1) and (bg <> 2))
26610 y = stick(1)
26620 key$ = inkey$
26630 bg = strig(1)
26640 pause 2
26650 wend
26660 'bg=2,chr$(13):決定ボタン
26670 if ((bg = 2) or (key$ = chr$(13)))  then
26680 select case No
26690 case 1:
26700 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Member_List_DeleteScreen:
26710 case 2:
26720 ui_msg"未実装です":goto member_list2:
26730 case 0:
26740 '3:トップ画面に戻る
26750 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
26760 end select
26770 endif
26780 'y=1:chr$(31):ジョイパッド　下　又は　カーソルの下
26790 if ((y = 1) or (key$ = chr$(31))) then
26800 select case No
26810 case 0:
26820 sp_on 1,1:sp_on 2,0:sp_on 0,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 1.メンバーリストを初期化するを選択":goto member_list2:
26830 case 1:
26840 sp_on 0,0:sp_on 2,1:sp_on 1,0:No=2:sp_put 2,(5,400),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 2.バックアップを取るを選択":goto member_list2:
26850 case 2:
26860 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:locate 0,15:print "                                       ":locate 0,15:print " 3.トップ画面に行くを選択":goto member_list2:
26870 end select
26880 endif
26890 'Joypad  or カーソル　上
26900 if ((y=-1) or (key$=chr$(30))) then
26910 select case No
26920 case 0:
26930 sp_on 2,1:sp_on 1,0:sp_on 0,0:No=2:sp_put 2,(5,400),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 2.バックアップを取るを選択":goto member_list2:
26940 case 1:
26950 sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto member_list2:
26960 case 2:
26970 sp_on 0,0:sp_on 1,1:sp_on 2,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 1.メンバーリストを初期化をする選択":goto member_list2:
26980 end select
26990 endif
27000 Member_List_DeleteScreen:
27010 cls:key$ = "":bg = 0:y=0:init "kb:4":font 48:count=0
27020 sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
27030 if dir$(SAVE_DATA1$) = "" then
27040 'ファイルがないとき
27050 color rgb(255,255,255)
27060 locate 0,4
27070 print "データーファイルは、存在しません。"
27080 locate 0,15:color rgb(0,0,0):print "ジョイパッドの右を押してください":
27090 'endif
27100 while ((key$ <> chr$(13)) and (bg <> 2) and (y <> 1) and (y <> -1))
27110 key$ = inkey$
27120 bg = strig(1)
27130 y = stick(1)
27140 pause 2
27150 wend
27160 if ((key$ = chr$(13)) or (bg = 2)) then goto TopScreen:
27170 'goto TopScreen:
27180 'endif
27190 else
27200 'ファイルが有るとき
27210 'default
27220 'No=1:ファイルを削除する
27230 'No=2:トップ画面に戻る
27240 No=2
27250 sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0
27260 color rgb(255,255,255)
27270 locate 0,4:print"番号を選んでください"+chr$(13)
27280 print " :1.ファイルを削除する"+chr$(13)
27290 print " :2.トップ画面に戻る"+chr$(13)
27300 color rgb(0,0,0):
27310 locate 0,15:print"                                      ":locate 0,15:print " 2.トップ画面に戻るを選択"
27320 endif
27330 Select_key1:
27340 '初期化
27350 y=0:key$="":bg=0
27360 while ((key$ <> chr$(13)) and (bg <> 2) and (y <> 1) and (y <> -1))
27370 key$ = inkey$
27380 bg = strig(1)
27390 y = stick(1)
27400 pause 2
27410 wend
27420 '1.選択キー
27430 '十字キー 上 y=-1
27440 '十字キー　下 y=1
27450 if ((y = 1) or (y = -1)) then
27460 select case No
27470 case 2:
27480 No=1:sp_on 2,0:sp_on 1,1:sp_put 1,(5,300),0,0:locate 0,15:print "                                                                                ":locate 0,15:print " 1．ファイルを削除":pause 200:goto Select_key1:
27490 case 1:
27500 No=2:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:locate 0,15:print "                                                          ":locate 0,15:print " 2.トップ画面に戻るを選択":pause 200:goto Select_key1:
27510 end select
27520 endif
27530 '2.決定ボタン
27540 'Joypad　右 or Enter key
27550 if ((bg=2) or (key$=chr$(13))) then
27560 Select case No
27570 case 2:
27580 sp_on 1,0:sp_on 2,0:pause 200:goto TopScreen:
27590 case 1:
27600 if (count=0) then
27610 kill SAVE_DATA1$:ui_msg"メンバーリストを削除しました":pause 200:locate 0,15:print "                                       ":locate 0,15:print " ジョイパッドの右を押してください":count=count+1:goto Select_key1:
27620 else
27630 sp_on 1,0:sp_on 2,0:goto TopScreen
27640 endif
27650 end select
27660 endif
