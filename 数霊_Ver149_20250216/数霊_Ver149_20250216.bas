'数霊(かずたま) 製作開始日:2021.07.28
'Version 0.0.1_2021.07.28 テスト版１
'Version 0.0.2_2021.11.27 テスト版２
'Version 0.0.3_2021.11.29 テスト版3
'Version 0.0.4_2021.11.30 - 12.01 α1
'Version 0.0.5_2021.12.02 - 12.03 α2
'Version 0.0.6_2021.12.10 (α3)
'Version 0.0.7_2021.12.11 (α4)
'Version 0.0.8_2021.12.13 (α5)
'Version 0.0.9_2021.12.16 -2021.12.18 (α6)
'Version 0.1.0_2021.12.19 -2021.12.23 (β1)
'Version 0.1.1_2021.12.24 -2021.12.27 (β2)
'Version 0.1.2_2021.12.27 -2021.12.31 (β3)
'2022年度
'Version 0.1.3_2021.12.31 -2022.01.03 (β4)
'Version 0.1.4_2022.01.09 -2022.01.15 (β5)
'Version 0.1.5_2022.01.26 -2022.01.30 (Release1):R1
'Version 1.0.1_2022.02.12(Release2):R3
'Version 1.0.2_2022.02.20(Release):正式版
'Version 1.0.3_2022.03.27(Release):正式版
'Version 1.0.9_2022.10.20(Release):正式版
'Version 1.1.1_2022.11.04(Release):正式版
'Version 1.1.2_2022.11.05(Release):正式版
'Version 1.1.3_2022.11.06(Release):正式版
'Version 1.1.4_2022.11.09(Release):正式版
'Version 1.1.6_2022.11.12(Release):正式版
'Version 1.1.7_2022.11.16(Release):正式版
'Version 1.1.8_2022.11.23(Release):正式版
'Version 1.2.0_2022.11.30-2022.11.02(Release):正式版
'Version 1.2.1_2022.12.06-2022.12.10(Release):正式版
'Version 1.2.2_2022.12.17-2022.12.20(Release):正式版
'2023年度
'Jan(2023)
'Version 1.2.7_2023.01.03-2023.01.06(Release):正式版
'version 1.2.8_2023.01.07-2023.01.14(Release):正式版
'Version 1.2.9_2023.01.15-2023.01.22(Release):正式版
'Version 1.3.0_2023.01.23-2023.01.29(Release):正式版
'Feb(2023)
'Version 1.3.1_2023.01.29-2023.02.05(Release):正式版
'Version 1.3.2_2023.02.06-2023.02.12(Release):正式版
'Version 1.3.3_2023.02.12-2023.02.19(Release):正式版
'Version 1.3.4_2023.02.19-2023.02.26(Release):正式版
'March(2023)
'Version 1.3.5_2023.02.27-2023.03.05(Release):正式版
'Version 1.3.6_2023.03.05-2023.03.12(Release):正式版
'Version 1.3.7_2023.03.12-2023.03.19(Release):正式版
'Version 1.3.8_2023.03.19-2023.03.26(Release):正式版
'April(2023)
'Version 1.3.9_2023.03.26-2023.04.02(Release):正式版
'Version 1.4.0_2023.04.02-2023.04.09(Release):正式版
'Version 1.4.1_2023.04.09-2023.04.16(Release):正式版
'Version 1.4.2_2023.04.16-2023.04.23(Release):正式版
'Version 1.4.3_2023.04.23-2023.04.30(Release):正式版
'Version 1.4.4_2023.04.30-2023.05.07(Release):正式版
'May (2023)
'Version 1.4.5_2023.05.07-2023.05.14(Release):正式版
'Version 1.4.6_2023.05.14-2023.05.21(Release):正式版
'Version 1.4.7_2023.05.22-2023.05.28(Release):正式版
'Feb(2025)
'Version 1.4.8_2025.02.02:正式版
'Version 1.4.9_2025.02.16:正式版
'現在のバージョン
Version$ = "1.4.9_2025.02.16(正式版)"
'csvファイル 1.数霊 ベースファイル
FILE_csv$ = "data/Kazutama.csv"
'csvファイル 2.数霊 ベースファイル 2
FILE_csv2$ = "data/Surei_chart_20211207.csv"
'Save ファイル
SAVE_DATA1$ = "data/Parsonal_list1.csv"
'gazo ファイル
Gazo$ = "data/Gazo/"
'System フォルダ:設定ファイルを保存するところ
System$ = "data/System/config.sys"
'Device type:デバイスタイプのファイルチェック
Device_type$ = "data/device_type.sys"
'設定ファイル名:config.sys
'Sound File(Voice)
'1.ボイス TopScreen
'フォルダの変数
Voice_File_TopScreen$ = "data/Sound_data/"
Voice_File_CheckSave_File$ = "Voice_Save_Data_20250207.mp3"
'ファイルの有無チェック　ボイスの保存メッセージファイルの有無確認　ここから
if (dir$(Voice_File_TopScreen$ + Voice_File_CheckSave_File$) = "") then
cls 3:print "ファイルが見つかりません":end
endif
'ファイルの有無チェック　ボイスの保存メッセージファイルの有無確認　ここまで
'Message
buf_finish_Message$ = "メモリーを解放してプログラムを終了します"
'変数領域
'vcount:バーチャルパッド下の変数
dim bufline$(181 * 2+3),bufcount$(20):count = 0:dim bufcount1$(20):dim bufcount2$(20):mode = 0:dim bufline2$(181+6,2):dim bufline3$(181*2+3):dim bufKaztama$(50,2):c=1:vcount=0:timer=0:dim List$(4):dim Result_Menu_List$(3)
count2 = 0:N=0:N2=0:m2 = 0:device_No=0:device_type=0
dim list$(4),moji_List$(2)
'ファイルの有無チェック
if (dir$(FILE_csv$) = "" or dir$(FILE_csv2$) = "" ) then
'1.ファイルが無いとき
cls :print "依存ファイルが見つかりません":
print "エンターキーを押してください" + chr$(13)
key$ = input$(1)
if key$ = chr$(13) then cls 3:color rgb(255,255,255):end
else
'2.ファイルが有るとき
cls:print "csv:file ok." + chr$(13)
n=0
'FILE_csv$:数霊データー入力
open FILE_csv$ for input as #1
while eof(1) = 0
input #1,line$
bufline$(n) = line$
'Print n;chr$(13)
'登録件数カウント:n
n = n + 1
wend
close #1
N=n
'2つ目のファイル読み込み
'n = 0
open FILE_csv2$ for input as #2
for n=3 to 181+2+2
for i=0 to 1
input #2,line$
bufline2$(n,i) = line$
next i
next n
close #2
N2 = n
endif
'2022.11.23----------------------
'端末言語のチェック
'日本語端末かチェックをして日本語以外なら英語で表示する
'lang flag:0:日本語 1:英語(日本語以外)
'--------------------------------
lang_flag = 0
if ex_info$(1) <> "JP" then
lang_flag = 1
endif
cls 3:font 48:screen 1,1,1,1:int "kb:4":init "crt:0"
play ""
'gload Gazo$ + "TopScreen_20230310.png",0,0,0
'選択ポインター 1 - 4
'スプライトの定義
gload Gazo$ + "Selection.png",1,5,300
gload Gazo$ + "Selection.png",1,5,400
gload Gazo$ + "Selection.png",1,5,500
gload Gazo$ + "Selection.png",1,5,595
gload Gazo$ + "Selection.png",1,10,350
gload Gazo$ + "Selection.png",1,10,420
sp_def 0,(5,300),32,32
sp_def 1,(5,400),32,32
sp_def 2,(5,500),32,32
sp_def 3,(5,595),32,32
sp_def 4,(5,350),32,32
sp_def 5,(5,420),32,32
'File check
'初回起動はここから
if (dir$(Device_type$) = "") then
goto Device_Select:
else
'
'2回目以降はファイルチェックをしてトップ画面
'
open Device_type$ for input as #1
line input #1,device_type$
device_No = val(device_type$)
close #1
if (device_No=1 or device_No=2) then
goto TopScreen:
endif
endif
'First_Select_Screen:
'タブレット　or　スマホの選択を起動時にする
Device_Select:
font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
gload Gazo$ + "device_select_20230313.png",0,0,0
init "kb:4"
play ""
play Voice_File_TopScreen$+"Select_device_select.mp3"
'y=0:key$="":bg=0
print chr$(13)+chr$(13)+chr$(13)
color  rgb(255,255,255)
print "番号を選んでください"+chr$(13)
'print chr$(13)
print " :1.スマートフォン"+chr$(13)
print " :2.タブレット端末"+chr$(13)
locate 0,11:No=1
color rgb(0,0,0)
Print " 1.スマートフォンを選択"+chr$(13)
sp_on 0,1:sp_put 0,(5,300),0,0
sp_on 1,0:sp_on 2,0:sp_on 3,0
device_selection:
y=0:key$="":bg=0:
While (key$ <> chr$(30) and key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
y = stick(1)
key$ = inkey$
bg = strig(1)
pause 2
wend
if ((y=1) or (y=-1) or (key$=chr$(30)) or (key$=chr$(31)) ) then
select case No
case 1:
No=2:sp_on 1,1:sp_on 0,0:locate 0,11:pause 300:sp_put 1,(5,400),0,0:print "                                ":locate 0,11:print " 2.タブレット端末を選択":goto device_selection:
case 2:
No=1:sp_on 1,0:sp_on 0,1:pause 300:sp_put 0,(5,300),0,0:locate 0,11:print "                                   ":locate 0,11:print " 1.スマートフォンを選択":goto device_selection:
end select
endif
'決定ボタン
if ((bg=2) or (key$=chr$(13)))  then
select case No
case 1:
sp_on 0,0:sp_on 1,0:device_No=1:gosub File_Device_Set:goto TopScreen:
case 2:
sp_on 0,0:sp_on 1,0:device_No=2:gosub File_Device_Set:goto TopScreen:
end select
endif
'Top画面
TopScreen:
'バーチャルパッドを表示
cls 3:font 48:screen 1,1,1,1:init "kb:4":init "crt:0"
'play ""
play ""
play Voice_File_TopScreen$ + "Voice_TopScreen.mp3"
'gload Gazo$ + "Screen1_Top_20211226.png",0,0,0
select case device_No
case 1:
'Top画面の背景画像
gload Gazo$ + "TopScreen_20230310.png",0,0,0
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$ + "TopScreen_20230310.png",0,0,0
end select
'key$=input$(1)
'バーチャルパッドの背景を白にする for smartphone screen
'gload Gazo$ + "downscreen.png",0,0,800
'選択肢 1
gload Gazo$ + "Selection.png",1,5,300
'選択肢 2
gload Gazo$ + "Selection.png",1,5,400
'選択肢 3
gload Gazo$ + "Selection.png",1,5,500
'選択肢 4
'TopScreen:
'select case device_No
'case 1:
gload Gazo$ + "Selection.png",1,5,590
'case 2:
'gload Gazo$ +
'end select
color rgb(0,0,255)
print chr$(13)
if lang_flag = 1 then
color rgb(255,255,255)
print "Select Number" + chr$(13)
print " :1.Kazutama check" + chr$(13)
print " :2.Setting" + chr$(13)
print " :3.Help" + chr$(13)
print " :4.End Program" + chr$(13)
color rgb(255,255,255)
else
color rgb(255,255,255)
print chr$(13)
sp_on 0,1:sp_put 0,(5,300),0,0
print "番号を選んでください" + chr$(13)
print " :1.数霊(かずたま)チェック" + chr$(13)
print " :2.設定" + chr$(13)
print " :3.ヘルプ" + chr$(13)
print " :4.(プログラムを)終　了する" + chr$(13)
color rgb(0,0,0)
'No=1:locate 1,12:color rgb(255,255,255):print "数霊（かずたま）チェックを選択"
'バーチャルパッドを表示
No=1:
'lang_flag:1 外国語,0:日本語
if lang_flag = 1 then
'lang_flag=1 英語
locate 0,15:color rgb(0,0,0):print "1.It has selected Kazutama check";chr$(13)
else
'lang_flag=0 日本語
locate 0,15:color rgb(0,0,0):print " 1.数霊(かずたま)チェックを選択";chr$(13)
endif
endif
'TopScreen sprite
'スプライト
'選択肢 1 On
'sp_def 0,(5,300),32,32
'sp_on 0,1
'sp_put 0,(5,300),0,0
'選択肢 2 Off
sp_def 1,(5,400),32,32
sp_on 1,0
sp_put 1,(5,400),0,0
'選択肢 3 Off
sp_def 2,(5,500),32,32
sp_on 2,0
sp_put 2,(5,500),0,0
'選択肢 4 Off
sp_def 3,(5,600),32,32
sp_on 3,0
sp_put 3,(5,600),0,0
color rgb(0,0,0)
Main_Select:
'y:バーチャルパッドの処理
'key$:カーソルの処理
y = 0:key$ = "":bg = 0
while ((key$ <> chr$(31)) and (key$ <> chr$(13)) and (y <> 1) and (y <> -1) and (bg <> 2))
y = stick(1)
key$ = inkey$
bg = strig(1)
pause 2
wend
'バーチャルパッドを押したときの処理とカーソルを押したときの処理を書く
'1.バーチャルパッドの処理
'バーチャルパッド下を押した時
if y = 1 then
select case No
'No の初期値：No=1
case 1:
sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":
if lang_flag = 1 then
'lang_flag=1 英語
locate 0,15:print "2.It has selected Setting":goto Main_Select:
else
'lang_flag=0 日本語
locate 0,15:print " 2.設定を選択":goto Main_Select:
endif
'デバッグライン　ここから
'0のとき
'デバッグライン　ここまで
'デバッグライン　ここから
'バーチャルパッド　下
case 2:
sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:
print "                                         ":
if lang_flag = 1 then
color rgb(0,0,0):locate 0,15:
print "3.It has selected Help":No=3:goto Main_Select:
else
color rgb(0,0,0):locate 0,15:print "                                                         ":locate 0,15:
print " 3.ヘルプを選択":No=3:goto Main_Select:
endif
'デバッグライン　ここまで
case 3:
sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                               "
if lang_flag = 1 then
locate 0,15:print "4.It has selected finish program":No=0:goto Main_Select:
else
locate 0,15:print "                                                         " :locate 0,15:print " 4.(プログラムを)終了するを選択":No=0:goto Main_Select:
endif
'デバッグライン　ここから
'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
'デバッグライン　ここまで
case 0:
sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1
if lang_flag = 1 then
'lang_flag=1:英語
locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
else
'lang_flag=0:日本語
locate 0,15:print "                                      ":locate 0,15:print " 1.数霊(かずたま)チェックを選択":goto Main_Select:
endif
'デバッグライン　ここから
' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
'デバッグライン　ここまで
end select
endif
'バーチャルパッド　上 ここから
if (y = -1) then
select case No
'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
case 1:
sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                                          "
'if lang_flag = 1 then
'lang_flag=1 英語
'locate 0,15:print "4.It has finished program":goto Main_Select:
'else
'lang_flag=0 日本語
locate 0,15:print "                                                          ":
locate 0,15:print " 4.(プログラムを)終了するを選択":goto Main_Select:
'endif
'endif
'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
case 0:
sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":
if lang_flag = 1 then
'1:英語
locate 0,15:print "3.It has selected Help":goto Main_Select:
else
'0:日本語
locate 0,15:print "                                                                                        "
locate 0,15:print " 3.ヘルプを選択":goto Main_Select:
endif
'No:3 3.Help→2.設定 No:2
case 3:
sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      "
if lang_flag = 1 then
'1:英語
locate 0,15:print "2.It has selected Setting":goto Main_Select:
else
'0:日本語
locate 0,15:print" 2.設定を選択":goto Main_Select:
endif
case 2:
sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":
if lang_flag = 1 then
'lang_flag 1 英語
locate 0,15:print "1.It has selected Kazutama check":goto Main_Select:
else
'lang_flag 0 日本語
locate 0,15:print" 1.数霊(かずたま)チェックを選択":goto Main_Select:
endif
end select
endif
if (bg = 2) then
select case No
'1.数霊チェックを選択  パッドの右キー(決定)
case 1:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
'2.設定を選択  パッドの右キー(決定)
case 2:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
'3.ヘルプを選択 パッドの右(決定)
case 3:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Help:
'プログラムの終了を選択(決定)
case 0:
cls 3:cls 4:gosub buffer_clear:play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":ui_msg buf_finish_Message$:pause 4.080*1000:color rgb(255,255,255):end
'if lang_flag = 1 then
'lang_flag = 1 英語
'else
'lang_flag = 0 日本語
'endif
end select
'4.終了するを選択  パッドの右
endif
'バーチャルパッド　上　ここまで
'2.カーソルの処理
'カーソル　下 chr$(31)
if (key$ = chr$(31)) then
select case (No)
'4
'0 選択肢4 => 選択肢1
case 0:
c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "              ":color rgb(0,0,0):
if lang_flag = 1 then
'lang flag:1 英語
else
'lang flag:0 日本語
color rgb(0,0,0):locate 0,15:print "1.数霊(かずたま)チェックを選択":goto Main_Select:
endif
'1 選択肢1 => 選択肢2
case 1:
c=2:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":
if lang_flag = 1 then
'lang_flag:1 英語
else
'lang_flag:0 日本語
color rgb(0,0,0):locate 0,15:print "2.設定を選択":beep:goto Main_Select:
endif
'2 選択肢2 => 選択肢3
case 2:
c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,15:print "               ":
if lang_flag = 1 then
'lang flag:1 英語
else
'lang flang:0 日本語
color rgb(0,0,0):locate 0,15:print "3.ヘルプを選択":goto Main_Select:
endif
'3 選択肢３ => 選択肢4
case 3:
c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,595),0,0:locate 0,15:print "               ":color rgb(0,0,0)
if lang_flag = 1 then
'lang_flag = 1 英語
else
'lang_flag = 0 日本語
color rgb(0,0,0):locate 0,15:print "4.終 了を選択":goto Main_Select:
endif
case else:
goto Main_Select:
end select
endif
'カーソル　上
if (key$=chr$(30)) then
select case (No)
'選択肢1 => 選択肢4
case 1:
c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:PRINT "                      ":
if lang_flag = 1 then
'lang_flag=1:英語
'print "1.It has selected Kazutama check":goto Main_Select:
else
'lang_flag = 0:日本語
else
print "1.数霊(かずたま)チェックを選択":goto Main_Select:
endif
'選択肢2 => 選択肢1
case 2:
c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                 ":locate 1,15:print "2.設 定を選択":goto Main_Select:
'選択肢3　=> 選択肢2
case 3:
c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,500),0,0
if lang_flag = 1 then
'lang_flag = 1:英語
locate 0,15:print "It has selected Help":goto Main_Select:
else
'lang_flag = 0:日本語
locate 0,15:print "3.ヘルプを選択":goto Main_Select:
endif
'選択肢4 => 選択肢3
case 0:
c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:locate 0,15:print "                ":locate 1,15:print "4.終 了を選択":talk"プログラムを終了します":ui_msg"プログラムを終了します":goto Main_Select:
if lang_flag = 1 then
'lang flag=1 英語
else
'lang flag=0 日本語
locate 1,15:print "4.終了を選択":talk"プログラムを終了します":ui_msg "プログラムを終了します":goto Main_Select:
endif
end select
endif
'Input "番号:",No
'エンターキー入力:決定
if (key$ = chr$(13)) then
select case No
case 1:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_Check:
case 3:
Color rgb(255,255,255):goto Help:
case 0:
cls 4:cls 3:play"":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":gosub buffer_clear:ui_msg buf_finish_Message$:color rgb(255,255,255):pause 4.080 * 1000:end
case 2:
color rgb(255,255,255):sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Setting:
end select
endif
'1-1.数霊チェック
Surei_Check:
cls 3:Font 48:
select case device_No
case 1:
gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$ + "Screen1_Sureicheck_Top_20230130.png",0,0,0
end select
play ""
play Voice_File_TopScreen$ + "Voice_Kazutama.mp3"
color rgb(255,0,0)
'print "●数霊(かずたま)チェックトップ" + chr$(13)
sp_on 0,1:sp_put 0,(5,300),0,0:screen 1,1,1
if lang_flag = 1 then
'lang_flag=1 英語
else
'lang_flag=0 日本語
print chr$(13)+chr$(13)+chr$(13)
color rgb(255,255,255)
print "番号を選んでください" + chr$(13)
print " :1.数霊(かずたま)1人用" + chr$(13)
print " :2.数霊(かずたま)リスト 1人用　" + chr$(13)
print " :3.数霊(かずたま)2人用" + chr$(13)
print " :4.トップ画面に行く" + chr$(13)
color rgb(0,0,0):No = 1
locate 0,15:print "                                       "
locate 0,15
print " 1.数霊(かずたま)1人用を選択"
endif
Kazutama_main:
'y:バーチャルパッドの処理
'key$:カーソルの処理
'bg:バーチャルパッドの右のボタン
y = 0:key$ = "":bg=0
while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
y = stick(1)
key$ = inkey$
bg=strig(1)
y=stick(-1)
pause 2
wend
'key$ = input$(1)
if (y = 1) then
select case No
'No の初期値：No=1
case 2:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                       ":
locate 0,15:print "                                     "
locate 0,15
print" 3.数霊(かずたま)2人用を選択":goto Kazutama_main:
'デバッグライン　ここから
'0のとき
'デバッグライン　ここまで
'デバッグライン　ここから
case 3:
sp_on 2,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_on 0,1:sp_put 0,(5,585),0,0:pause 200:locate 0,15:print "                                               "
color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":No=0:goto Kazutama_main:
'デバッグライン　ここまで
'デバッグライン　ここから
'デバッグライン　ここまで
case 0:
sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
case 1:
sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                                             ":locate 0,15:print " 2.数霊（かずたま）リスト 1人用を選択":goto Kazutama_main:
'デバッグライン　ここから
' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
'デバッグライン　ここまで
end select
endif
'バーチャルパッド　上 ここから
if (y = -1) then
select case No
'No:0  4.終了  :1数霊チェック No:1 →　4.終了 No:0
case 1:
sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 0,15:print" 4.トップ画面に行くを選択":goto Kazutama_main:
'No:3 3.Help→2.設定 No:2
case 0:
sp_on 1,0:sp_on 0,0:sp_on 3,1:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                     ":locate 0,15:print" 3.数霊（かずたま）2人用を選択":goto Kazutama_main:
case 2:
sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print" 1.数霊(かずたま)1人用を選択":goto Kazutama_main:
case 3:
sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 0,15:print " 2.数霊(かずたま)リスト 1人用を選択":goto Kazutama_main:
end select
endif
if (bg=2) then
select case No
'1.数霊チェックを選択  パッドの右キー
case 1:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_Input:
'2.数霊チェック2人用   パッドの右キー
case 3:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_twoParson:
'3.トップ画面に行く パッドの右
case 0:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
'2.数霊リスト1人用 パッドの右キー
case 2:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Surei_List1:
'プログラムの終了を選択
end select
'4.終了するを選択  パッドの右
endif
'バーチャルパッド　上　ここまで
if (key$ = chr$(31)) then
select case No
case 0:
No=1:sp_on 0,1:sp_on 1,0:sp_put 0,(5,300),0,0:locate 1,15:print "                                                          ":
if lang_flag = 1 then
Else
locate 0,15:print "                                      "
No=2:locate 0,15:print " 2.数霊(かずたま)2人用を選択":goto Kazutama_main:
endif
case 1:
No=0:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,585),0,0:locate 0,12:print "                                                          ":
if lang_flag = 1 then
Else
locate 0,15:print"                                      "
locate 0,15:print" 3.トップ画面に行くを選択":goto Kazutama_main:
endif
case 2:
No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0 :sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                      ":
if lang_flag = 1 then
Else
No=1:locate 0,15:print" 1.数霊（かずたま)1人用を選択":goto Kazutama_main:
endif
end select
endif
if (key$=chr$(13)) then
select case No
case 1:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:mode=0:goto Surei_Input:
case 2:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto Surei_twoParson:
case 3:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:cls 3:goto TopScreen:
'終了はトップメニューのみにする
end select
endif
'前の画面に戻る
'プログラムの終了
'1人用
'2人用
'数霊(かずたま) 文字入力  1人用
Surei_Input:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
if mode = 0 then
cls 3:font 32:init"kb:2"
select case device_No
case 1:
gload Gazo$ + "InputKotodama_20230131.png",0,0,0
gload Gazo$ + "CenterScreen_20230401.png",0,0,380
case 2:
gload Gazo$ + "InputKotodama_20230131.png",0,0,0
end select
play""
play Voice_File_TopScreen$ + "Voice_Input_Kazutama.mp3"
color rgb(255,0,0)
if lang_flag=1 then
'英語
else
print chr$(13)+chr$(13)+chr$(13)
color rgb(255,255,255)
print "文字を入れてください" + chr$(13)
color rgb(255,255,255)
print "(有効文字:カタカナ、半角アルファベット & 大文字のみ)" + chr$(13)
print "(※:アルファベットの小文字入力も大文字に変換されます。)" + chr$(13)
color rgb(0,0,0)
Input "入力文字:",buffer_moji$
if buffer_moji$ = "" then
ui_msg "未入力です":goto Surei_Input:
else
'************************************************
'Date: 2025.02
'追加項目:　Alphabetの文字入力チェック　
'追加処理: 入力した文字がAlphabetの大文字か確認
'ここから
'************************************************
'
'
'************************************************
'Date:  2025.02
'追加処理 Alphabet の文字入力チェック
'追加処理:入力した文字がAlphabetの文字か確認
'ここまで
'************************************************
goto Surei_Result:
endif
endif
endif
if mode = 1 then
cls 3:Font 32:
gload Gazo$ + "InputKotodama.png"
color rgb(255,0,0)
print "●数霊(かずたま)文字入力(2回目)" + chr$(13)
color rgb(255,255,255)
print "文字を入れてください" + chr$(13)
color rgb(255,0,0)
print "(有効文字:カタカナ,半角アルファベット" + chr$(13)
print "大文字のみ)" + chr$(13)
print "半角のアルファベットの小文字は大文字に変換されます"+chr$(13)
color rgb(0,0,0)
Input "文字入力:",buffer_moji2$
goto Surei_Result3:
'endif
endif
'数霊(かずたま)文字入力　2人用
Surei_twoParson:
cls 3:Font 32:init"kb:2"
gload Gazo$ + "InputKotodama_20230131.png"
'1人目入力
if lang_flag = 1 then
else
print ""+chr$(13)+chr$(13)+chr$(13)
color rgb(255,255,255)
print "1人目の文字を入れてください" + chr$(13)
color rgb(255,255,255)
print "(有効文字:カタカナ,半角アルファベット　大文字のみ)" + chr$(13)
color rgb(0,0,0)
print chr$(13)
Input "1人目文字入力:",buf_Parson1$
endif
Surei_twoParson2:
cls 3:Font 32:init"kb:2"
'2人目入力
gload Gazo$ + "InputKotodama_20230131.png"
if lang_falg = 1 then
else
print ""+chr$(13)+chr$(13)+chr$(13)
color rgb(255,255,255)
print "2人目の文字を入れてください" + chr$(13)
color rgb(255,255,255)
print "(有効文字:カタカナ,半角アルファベット 大文字のみ)" + chr$(13) + chr$(13) + chr$(13)
color rgb(0,0,0)
Input "2人目の文字入力:",buf_Parson2$
goto Surei_Result2:
endif
'数霊　計算 パート
'文字の計算関数
'moji$:1文字を入れる
func Complate(moji$)
for n = 1 to 116
if moji$ = bufline$(2*n) then
buffcount = val(bufline$(2 * n + 1))
endif
next n
endfunc buffcount
'数霊　結果表示
Surei_Result:
cls 3:init "kb:4":No=0:Button_count=0
'ゼロカウント:zcount
'ゼロカウント:無効な文字が入ってるとき表示させないようにする
'例 アカい:"い"の文字は無効な文字なので、はじく
zcount=0
'mojicount:入力文字数
mojicount = len(buffer_moji$)
for n=1 to mojicount
for j=1 to 118
if (bufcount$(n - 1) = bufline$(2 * j)) then
bufcount$(n-1) = Mid$(buffer_moji$,n,1)
endif
next j
next n
ncount=0:count=0
for i = 1 to mojicount
bufcount$(i-1)=Mid$(buffer_moji$,i,1)
'ンのカウント
if (bufcount$(i-1) = "ン") then ncount = ncount + 1
next i
if (ncount > 0) then
'Listを表示する
moji_List$(0) = "この単語は目に見える物です"
moji_List$(1) = "この単語は目に見えない物です"
num2 = ui_select("moji_List$","この単語は目に見える物ですか?")
if (num2 = 0) then
else
if (num2 = 1) then
n1 = 9 * ncount
endif
endif
endif
for j=1 to mojicount
bufcount$(j-1) = Mid$(buffer_moji$,j,1)
count = count + Complate(bufcount$(j - 1))
next j
count = count + n1
if (ncount > 0) then count = count
'182以上のとき,181を引く
if buf_cofig_r = 0 then
if (count > 181) then
count = count - 181
else
if (buf_config_r = 1) then
buf_count = Single_Complate(count)
endif
endif
endif
cls 3:Font 48:Button_count=0
gload Gazo$ + "Result_Screen3_20250205.png"
play "":play Voice_File_TopScreen$ + "Voice_Result_Kazutama_20250207.mp3"
if buf_config_r = 1 then
locate 0,1
print "入力文字:" + buffer_moji$
locate 0,3
print "数霊(かずたま):";count;chr$(13)
endif
if lang_flag = 1 then
else
color rgb(255,0,0)
locate 0,1
print "入力文字:" + buffer_moji$ + chr$(13)
endif
if lang_flag = 1 then
else
play ""
color rgb(0,0,255)
locate 0,3
print "数霊(かずたま):";count
endif
if lang_flag = 1 then
else
play ""
color rgb(0,0,0)
locate 0,5
print "◎.データーを保存しますか?"
locate 0,7
print  " :1.保存する"
locate  0,9
print  " :2.保存しない"
'play Voice_File_TopScreen$ + "Voice_Save_Check_20250207.mp3"
endif
'------------------------------------------------------------------------
'JoyPad ここから
'No=0
sp_on 4,1:sp_put 4,(5,350),0,0
Select_Joypad_Kazutama_Save:
y=0:key$="":bg=0:
while (key$ <> chr$(13) and key$ <> chr$(13) and y <> 1 and  y <> -1 and bg <> 2)
y=stick(1)
key$=inkey$
bg=strig(1)
pause 100
wend
'---------------------------------------------------------------------------------------------------------
'1.ジョイスティック　を　下に下げる または、上に上げる。
if ((y=1) or (key$ = chr$(31)) or ((y = -1)  or (key$ = chr$(30)))) then
select case No
case 0:
No=1:sp_on 4,0:sp_on 5,1:sp_put 5,(5,450),0,0:pause 200:goto Select_Joypad_Kazutama_Save:
case 1:
No=0:sp_on 5,0:sp_on 4,1:sp_put 4,(5,350),0,0:pause 200:goto Select_Joypad_Kazutama_Save:
end select
endif
'１．上と下のカーソル　ここまで
'-----------------------------------------------------------------------------------------------------------
'2.決定ボタン　ここから
if (bg = 2 or key$ = chr$(13)) then
if (Button_count = 0) then
select case No
case 0:
No=0:sp_on 4,0:sp_on 5,0:pause 100:gosub Save_Kazutama_data:pause 5:sp_on 5,0:sp_on 4,1:locate 0,5:print "                             ":locate 0,5:print "どうしますか？":locate 0,7:print "                             ":locate 0,7:print " :1.終了してトップに戻る":locate 0,9:print "                             ":locate 0,9:print " :2.もう一度数霊をやる":goto Select_Joypad_Kazutama_Save:
case 1:
No = 0:sp_on 5,0:sp_on 4,0:pause 100:sp_on 4,0:sp_on 5,1:locate 0,5:print "                    ":locate 0,5:print "どうしますか？":locate 0,7:print " :1.終了してトップに戻る":locate 0,9:print " :2.もう一度数霊をやる":Button_count=1:goto Select_Joypad_Kazutama_Save:
end select
endif
if (Button_count = 1) then
select case No
case 0:
sp_on 4,0:sp_on 5,0:goto TopScreen:
case 1:
sp_on 4,0:sp_on 5,0:goto Surei_Input:
end Select
endif
endif
'2.決定ボタン　ここまで
'------------------------------------------------------------------------------------------------------------
'JoyPad ここまで
'-------------------------------------------------------------------------
key$ = input$(1)
if ((key$ = chr$(13)) or (key$=" ")) then
List$(0)="1.もう一度数霊を見る"
List$(1)="2.トップ画面に行く"
List$(2)="3.この数霊の説明を見る"
List$(3)="4.数霊データーを保存"
num=ui_select("List$","番号を選んでください")
select case num
case 0:
goto Surei_Input:
case 1:
n=0:count=0:count2=0:mode=0:mojicount=0:n1=0:zcount=0:buffer_moji$=""
for i=0 to 9
bufcount$(i)=""
next i
goto TopScreen:
case 2:
goto Surei_Result4:
case 3:
s=Surei_Result_Save_File()
ui_msg "保存しました"
case -1:
'goto Surei_Result:
case else:
goto Surei_Result:
end select
'ファイルを保存する
else
goto Surei_Result:
endif
'3-1 バージョン情報
Version:
cls 3:Font 32
select case device_No
case 1:
gload Gazo$ + "Screen1_Version.png"
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$ + "Screen1_version.png"
end select
play ""
play Voice_File_TopScreen$ + "Voice_Version.mp3"
color rgb(255,0,0)
print chr$(13)
color rgb(255,255,255)
if lang_flag = 1 then
else
print chr$(13)+chr$(13)+chr$(13)
print "Ver:";Version$ + chr$(13)
print "アプリ名:数霊計算機" + chr$(13)
print "Basic for Android Runtime" + chr$(13)
print "Author:licksjp" + chr$(13)
print "制作開始:2021.7.28" + chr$(13)
print chr$(13)
print "(C)Copy right licksjp " + chr$(13)
print "All rights reserved" + chr$(13)
print chr$(13)
color rgb(0,0,0)
print "パッドの右を押してください" + chr$(13)
endif
bg=0:key$=""
while (bg <> 2 and key$ <> chr$(13))
bg = strig(1)
key$ = inkey$
pause 2
wend
if key$ = chr$(13) then
goto TopScreen:
else
if bg=2 then
goto TopScreen:
else
if lang_flag = 1 then
else
talk "無効なキーです":goto Version:
endif
endif
endif
'3-2 参考文献
Reference_Book:
cls 3:Font 48:play""
select case device_No
case 1:
gload Gazo$ + "Screen1_Reference.png"
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$ + "Screen1_Reference.png"
end select
play Voice_File_TopScreen$+"Voice_referenceBook.mp3"
color rgb(255,0,0)
print chr$(13)+chr$(13)
if lang_flag = 1 then
else
color rgb(255,255,255)
print "書名:数霊" + chr$(13)
print "著者:深田　剛史・はせくら　みゆき"+chr$(13)
print "出版社:徳間書店" + chr$(13)
print "ISBN:978-4-19-" + chr$(13)
print "         865309-5" + chr$(13)
print "定価:2300円 + 税" + chr$(13)
color rgb(0,0,0)
print "パッドの右を押してください"
endif
bg = 0:key$ = ""
while (bg <> 2 and key$ <> chr$(13))
bg = strig(1)
key$ = inkey$
pause 2
wend
if key$ = chr$(13) then
goto TopScreen:
else
if bg = 2 then
goto TopScreen:
else
talk "無効なキーです":goto Reference_Book:
endif
endif
'ヘルプ画面　トップ画面
Help:
No=1:c=0
play ""
play Voice_File_TopScreen$ + "Voice_Help_Screen.mp3"
cls 3:Font 48:
select case device_No
case 1:
gload Gazo$ + "Screen1_Help_Top.png",0,0,0
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$ + "Screen1_Help_Top.png",0,0,0
end select
sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0
color rgb(255,0,0)
print chr$(13)+chr$(13)+chr$(13)
color rgb(255,255,255)
print "番号を選んでください" + chr$(13)
print " :1.バージョン" + chr$(13)
print " :2.参考文献" + chr$(13)
print " :3.データーの初期化"+chr$(13)
print " :4.トップ画面に行く" + chr$(13)
color rgb(0,0,0)
locate 0,15:print "                                     "
if No = 1 then locate 0,15:print " 1.バージョンを選択"
'y:バーチャルパッドの処理
'key$:カーソルの処理
'bg:バーチャルパッドの右ボタン
Help_key:
y = 0:key$ = "":bg = 0
while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
y = stick(1)
key$ = inkey$
bg = strig(1)
pause 2
wend
'バーチャルパッド　ここから'
if (y = 1) then
select case No
'No の初期値：No=1
case 1:
sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
if lang_flag = 1 then
else
locate 0,15:print" 2.参考文献を選択":goto Help_key:
endif
'デバッグライン　ここから
'0のとき
'デバッグライン　ここまで
'デバッグライン　ここから
case 3:
sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:No=0:pause 200:locate 0,15:print "                                                          "
color rgb(0,0,0):locate 0,15:print " 4.トップ画面に行くを選択":goto Help_key:
'デバッグライン　ここまで
'デバッグライン　ここから
'デバッグライン　ここまで
case 2:
sp_on 2,0:sp_on 0,0:sp_on 1,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 0,15:print "                                                          ":color rgb(0,0,0):locate 0,15:print " 3.データーの初期化を選択":No=3:goto Help_key:
case 0:
sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
'デバッグライン　ここから
' locate 1,12:print "b=";b;chr$(13):count = count + 1:goto Main_Select:
'デバッグライン　ここまで
end select
endif
'バーチャルパッド　上 ここから
if (y = -1) then
select case No
'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
case 1:
sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                                           ":locate 0,15:print" 4.トップ画面に行くを選択":goto Help_key
'No:3 3.Help→2.設定 No:2
case 3:
sp_on 1,0:sp_on 0,0:sp_on 3,0:sp_on 2,1:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                                          ":locate 0,15:print" 2.参考文献を選択":goto Help_key:
case 2:
sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                                          ":locate 0,15:print" 1.バージョンを選択":goto Help_key:
case 0:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:No=3:pause 200:locate 0,15:print "                                                          ":locate 0,15:print" 3.データーの初期化を選択":goto Help_key:
end select
endif
if (bg = 2) then
select case No
'1.数霊チェックを選択  パッドの右キー
case 1:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Version:
'2.設定を選択    パッドの右キー
case 2:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Reference_Book:
'3.データーの初期化
case 3:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto data_initialize:
'4.ヘルプを選択 パッドの右
case 0:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
'プログラムの終了を選択
'if lang_flag = 1 then
'lang_flag = 1:英語
'Else
'lang_flag = 0:日本語
'endif
end select
'4.終了するを選択  パッドの右
endif
'バーチャルパッド　上　ここまで
'バーチャルパッド　ここまで'
'key$ = input$(1)
'カーソルの下
if key$ = chr$(31) then
select case (No Mod 4)
'バージョンから参考文献
case 0:
c=1:No=c:locate 0,15:Print "             ":locate 0,15:print " 2.参考文献を選択":sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Help_key:
'参考文献からトップ画面
case 1:
c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "            ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
'トップ画面から終了
'終了からバージョン
case 2:
c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                     ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
case else:
goto Help_key:
end select
endif
'カーソル　上
if (key$ = chr$(30)) then
select case (c Mod 4)
'バージョンから終了
case 0:
c=3:No=c:sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,600),0,0:locate 0,15:print "                   ":locate 0,15:print " 4.終 了を選択":goto Help_key:
'参考文献からバージョン
case 1:
c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                   ":locate 0,15:print " 1.バージョンを選択":goto Help_key:
'トップ画面から参考文献
case 2:
c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:locate 0,15:print "                    ":locate 0,15:print " 2.参考文献を選択":goto Help_key:
'終了からトップ画面を選択
case 3:
c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print"                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto Help_key:
case else:
goto Help_key:
end select
endif
'エンターキー：決定
if (key$ = chr$(13)) then
if No=1 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Version:
if No=0 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
if No=2 then :sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Reference_Book:
else
goto Help_key:
endif
'登録文字の確認
'文字を1文字入れて登録されているか調べるメニュー
'設定項目
Setting:
cls 3:Font 48
select case device_No
case 1:
gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
end select
play ""
play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
No=1
sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:
color rgb(0,0,255)
print chr$(13)
if lang_flag = 1 then
'lang_flag = 1:英語
else
'lang_flag = 0:日本語
color rgb(255,255,255)
print chr$(13)
print "番号を選んでください" + chr$(13)
'-------コメント----------------
'print " :1.登録文字の確認" + chr$(13)
'print " :2.数霊文字確認" + chr$(13)
'-------コメント----------------
'print chr$(13)
print " :1.文字の項目" + chr$(13)
print " :2.結果表示設定" + chr$(13)
print " :3.言語設定" + chr$(13)
print " :4.トップ画面に行く" + chr$(13)
endif
color rgb(0,0,0)
locate 0,15
if No=1 then locate 0,15:print  "                                     ":locate 0,15:print " 1.文字の項目を選択"
'y:バーチャルパッドの処理
'key$:カーソルの処理
'bg:バーチャルパッドの右ボタン
SettingScreen:
y = 0:key$ = "":bg=0
while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
y = stick(1)
key$ = inkey$
bg=strig(1)
pause 2
wend
'バーチャルパッド　ここから'
'バーチャルパッド　ここから'
if (y = 1) then
select case No
'No の初期値：No=1
case 1:
sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":color rgb(0,0,0):locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
'デバッグライン　ここから
'0のとき
'デバッグライン　ここまで
'デバッグライン　ここから
case 2:
sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                         "
color rgb(0,0,0)::No=3
if lang_flag = 1 then
else
locate 1,15:print "3.言語設定を選択":goto SettingScreen:
endif
'デバッグライン　ここまで
case 3:
sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:locate 0,15:print"                                              ":locate 1,15:print "4.トップ画面に行くを選択":No=0:goto SettingScreen:
'デバッグライン　ここから
'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
'デバッグライン　ここまで
case 0:
sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
'デバッグライン　ここから
' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
'デバッグライン　ここまで
end select
endif
'バーチャルパッド　上 ここから
if (y = -1) then
select case No
'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
case 1:
sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,590),0,0:pause 200:No=0:locate 0,15:print "                                       ":locate 1,15:print"4.トップ画面に行くを選択":goto SettingScreen:
'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
case 0:
sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=3:locate 0,15:print"                                       ":locate 1,15:print"3.言語設定を選択":goto SettingScreen:
'No:3 3.Help→2.設定 No:2
case 3:
sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.結果表示設定を選択":goto SettingScreen:
case 2:
sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 1,15:print"1.文字の項目を選択":goto SettingScreen:
end select
endif
if (bg=2) then
select case No
'1.数霊チェックを選択  パッドの右キー
case 1:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
'2.設定を選択    パッドの右キー
case 2:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
'3.ヘルプを選択 パッドの右
case 0:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
'プログラムの終了を選択
case 3:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Setting_Language:
end select
endif
'4.終了するを選択  パッドの右
'バーチャルパッド　ここまで'
'カーソル下'
if (key$ = chr$(31)) then
select case (No Mod 4)
'登録文字から数霊文字の確認
case 1:
c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                     ":locate 1,15:print "2.結果表示設定を選択":goto SettingScreen:
'数霊文字の確認からトップ画面に行く
case 2:
c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:locate 0,15:print "                                     ":locate 1,15:print"3.言語設定を選択":goto SettingScreen:
'トップ画面に行くから終了
case 3:
c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,590),0,0:locate 0,15:print "                                       ":locate 1,15:print "4.トップ画面に行くを選択":goto SettingScreen:
'終了から登録文字
case 0:
c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,15:print "                                      ":locate 1,15:print "1.文字の項目を選択":goto SettingScreen:
end select
endif
'カーソル　上
if (key$ = chr$(30)) then
select case (No Mod 4)
case 1:
c=2:No=c:sp_on 0,1:sp_put 0,(5,300),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
case 2:
c=3:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
case 3:
c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:goto SettingScreen:
case 0:
c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,590),0,0:sp_on 0,0:goto SettingScreen:
end select
endif
'エンターキーを押したとき
if (key$ = chr$(13)) then
if (No=3) then goto Setting_Language:
if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto config_moji2:
if (No=0) then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
endif
'文字検索項目  ここから
Moji_Search:
cls 4:cls 3:Font 32+16:init"kb:2"
gload Gazo$ + "Moji_Search_Result.png",0,0,0
gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
play ""
play Voice_File_TopScreen$ + "Voice_Entry_mojicheck.mp3"
print "" + chr$(13)
color rgb(255,255,255)
if lang_flag = 1 then
Else
print "文字を一文字入れてください" + chr$(13)
endif
color rgb(0,0,0)
if lang_flag=1 then
Else
Input "登録文字:",moji$
endif
moji_count = len(moji$)
if moji_count > 1 then
talk"文字は一文字で入れてください":ui_msg "文字は一文字入れてください":goto Moji_Search:
else
count=0:
for n = 0 to 116
if bufline$(2*n) = moji$ then
cls 3:font 48:init"kb:4":
select case device_No
case 1:
gload Gazo$ + "downscreen.png",0,0,800
gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
gload Gazo$ + "Moji_Search_Result.png",0,0,0
case 2:
gload Gazo$ + "Moji_Search_Result.png",0,0,0
end select
play ""
play Voice_File_TopScreen$ + "Voice_Entry_OK.mp3"
if lang_flag = 1 then
Else
bg=0:key$=""
print chr$(13)
color rgb(255,255,255)
print moji$;"は、登録されています。" + chr$(13)
color rgb(0,0,0)
print "ジョイパッドの右を押してください"
endif
'bg = 0:key$ = ""
while (bg <> 2 and key$ <> chr$(13))
key$ = inkey$
bg = strig(1)
pause 2
wend
if ((key$ = chr$(13)) or (bg = 2)) then goto TopScreen:
count = count + 1
endif
next n
if count = 0 then
cls 3:font 48:init "kb:4":bg=0:key$=""
select case (device_No)
case 1:
gload Gazo$ + "Moji_check.png",0,0,0
gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$ + "Moji_check.png",0,0,0
end select
play ""
play Voice_File_TopScreen$ + "Voice_Entry_NG.mp3"
print chr$(13)
if lang_flag = 1 then
Else
color rgb(255,255,255)
print moji$;"は、登録されていません。" + chr$(13)
color rgb(0,0,0)
print "パッドの右を押してください" + chr$(13)
endif
while (bg <> 2 and key$ <> chr$(13))
key$ = inkey$
bg = strig(1)
pause 2
wend
if ((key$ = chr$(13)) or (bg = 2)) then goto TopScreen:
endif
endif
Surei_Result2:
cls 3:Font 48
zcount1=0:zcount2=0:count1=0:count2=0
'1人目
mojicount1=len(buf_Parson1$)
'2人目
mojicount2 = len(buf_Parson2$)
'1人目
for n = 1 to mojicount1
for j = 1 to 116
bufcount1$(n-1)=Mid$(buf_Parson1$,n,1)
if bufcount1$(n-1) = bufline$(2*j) then
zcount1 = zcount1 + 1
endif
next j
next n
'2人目
for n = 1 to mojicount2
for j = 1 to 116
bufcount2$(n-1)=Mid$(buf_Parson2$,n,1)
if bufcount2$(n-1) = bufline$(2*j) then
zount2 = zcount2 + 1
endif
next j
next n
'1人目
for i=1 to mojicount1
bufcount1$(i-1) = Mid$(buf_Parson1$,i,1)
p1 = Complate(bufcount1$(i-1))
count1 = count1 + p1
next i
'2人目
for i = 1 to mojicount2
bufcount2$(i - 1) = Mid$(buf_Parson2$,i,1)
p2 = Complate(bufcount2$(i-1))
count2 = count2 + p2
next i
cls 3:
select case device_No
case 1:
gload Gazo$ + "Screen1_2Parson_Result.png":init "kb:4"
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$ + "downscreen.png",0,0,0
end select
color rgb(255,0,0)
print ""+chr$(13)
if lang_flag = 1 then
else
color rgb(255,255,255)
print chr$(13)+chr$(13)
print "1人目:";buf_Parson1$;chr$(13)
print "数霊1:";count1;chr$(13)
print "2人目:";buf_Parson2$;chr$(13)
print "数霊2:";count2;chr$(13)
print "数霊(合計):";count1 + count2;chr$(13)
color rgb(0,0,0)
print "バーチャルパッドの右" + chr$(13)
endif
key$ = "":bg = 0
while (bg <> 2 and key$ <> chr$(13))
bg = strig(1)
key$ = inkey$
pause 2
wend
if (bg = 2 or key$ = chr$(13))  then goto TopScreen:
Surei_Result3:
cls 3:Font 48
zcount2 = 0:count2 = 0
mojicount2 = len(buffer_moji2$)
for n = 1 to mojicount2
for j = 1 to 116
bufcount2$(n - 1) = Mid$(buffer_moji2$,n,1)
if bufcount2$(n - 1) = bufline$(2 * j) then
zcount2 = zcount2 + 1
endif
next j
next n
for i = 1 to mojicount2
n2 = Complate(bufcount2$(i-1))
count2 = count2 + n2
next i
gload Gazo$ + "Screen5.png"
if lang_flag = 1 then
else
color rgb(255,0,0)
print "数霊の結果表示" + chr$(13)
color rgb(255,255,255)
print "１回目回の文字入力:";buffer_moji$;chr$(13)
print "１回目の数霊(かずたま)";count;chr$(13)
print "今回(2回目)の文字:";buffer_moji2$;chr$(13)
print "今回(2回目)の数霊(かずたま)";count2;chr$(13);chr$(13)
color rgb(0,0,0)
print "エンターキー:トップ画面";chr$(13)
print "c or C キー:数霊の比較";chr$(13)
endif
key$ = "":bg = 0
while (key$ <> chr$(13) and bg <> 2)
bg = strig(1)
key$ = inkey$
pause 2
wend
if key$ = chr$(13) then mode = 0:count = 0:count2 = 0:goto TopScreen:
if key$ = "c" or key$ = "C" then
if count = count2 then
play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckOK.mp3":goto Surei_Result3
else
play Voice_File_TopScreen$ + "Voice_Result_KazutamacheckNG.mp3":goto Surei_Result3:
endif
endif
Moji_Count_Check:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
cls 3:Font 48
select case device_No
case 1:
gload Gazo$ + "Moji_check.png"
gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$ + "Moji_check.png",0,0,0
end select
n = 0
open FILE_csv$ for input as #1
while eof(1) = 0
line input #1, line$
n = n + 1
wend
close #1
play ""
if (n = 118) then
play Voice_File_TopScreen$ + "Voice_Entry_moji_count118.mp3"
if lang_flag = 1 then
else
print "" + chr$(13)
color rgb(255,255,255)
print "文字の登録文字数は";n;"文字" + chr$(13)
color rgb(0,0,0)
print "パッドの右を押してください" + chr$(13)
endif
endif
key$ = "":bg = 0
while ((key$ <> chr$(13)) and (bg <> 2))
key$=inkey$
bg=strig(1)
pause 2
wend
if ((bg = 2) or (key$=chr$(13))) then
goto TopScreen:
else
goto Moji_Count_Check:
endif
'Save 関数
file_kazutama = 0
file_kazutama = Save_File()
func Save_File()
open SAVE_DATA1$  for output as #1
print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
close #1
endfunc
Select_moji:
cls 3:font 48:No = 1
select case device_No
case 1:
gload Gazo$ + "Screen1_mojicheck.png",0,0,0
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$ + "Screen1_mojicheck.png",0,0,0
end select
sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
color rgb(255,0,0)
if lang_flag = 1 then
else
play ""
play Voice_File_TopScreen$ + "Voice_Select_Moji20230217.mp3"
print chr$(13)+chr$(13)+chr$(13)
color rgb(255,255,255)
print "番号を選んでください" + chr$(13)
print " :1.登録文字検索"+ chr$(13)
print " :2.登録文字数の確認" + chr$(13)
print " :3.数字から数霊の説明"+chr$(13)
print " :4.トップ画面に戻る" + chr$(13)
color rgb(0,0,0)
locate 0,15
if No = 1 then print " 1.登録文字検索を選択"
endif
Entry_check_key:
y = 0:key$ = "":bg=0
while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
y = stick(1)
key$ = inkey$
bg=strig(1)
pause 2
wend
'バーチャルパッド　ここから'
'バーチャルパッド　ここから'
if y = 1 then
select case No
'No の初期値：No=1
case 1:
sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:No=2:pause 200:locate 0,15:print "                                       ":locate 1,15:print "2.登録文字数の確認を選択":goto Entry_check_key:
'デバッグライン　ここから
'0のとき
'デバッグライン　ここまで
'デバッグライン　ここから
case 2:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:pause 200:locate 0,15:print "                                                         ":No=3:locate 0,15:print" 3.数字から数霊の説明を選択":goto Entry_check_key:
case 3:
sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:locate 0,15:print "                                       "
:No=0
'if lang_flag = 1 then
'Else
color rgb(0,0,0):locate 0,15:print " 4.トップ画面に戻るを選択":goto Entry_check_key:
'endif
'cls:color rgb(255,255,255):print"ok"
'デバッグライン　ここまで
'デバッグライン　ここから
'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
'デバッグライン　ここまで
case 0:
sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:pause 200:No=1:locate 0,15:print"                                      ":locate 0,15:print " 1.登録文字検索を選択":goto Entry_check_key:
'デバッグライン　ここから
' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
'デバッグライン　ここまで
end select
endif
'バーチャルパッド　上 ここから
if y = -1 then
select case No
'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
case 0:
sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=3:locate 0,15:print "                                      ":locate 0,15:print " 3.数字から数霊の説明を選択":goto Entry_check_key:
case 1:
sp_on 2,0:sp_on 0,1:sp_on 1,0:sp_on 3,0:sp_put 0,(5,600),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print"4.トップ画面に戻るを選択":goto Entry_check_key:
'No:3 3.Help→2.設定 No:2
case 3:
sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,400),0,0:pause 200:No=2:locate 0,15:print"                                      ":locate 1,15:print"2.登録文字数の確認を選択":goto Entry_check_key:
case 2:
sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 1.登録文字検索を選択":goto Entry_check_key:
end select
endif
if bg=2 then
select case No
'1.数霊チェックを選択  パッドの右キー
case 1:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
'2.設定を選択    パッドの右キー
case 2:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
'3.ヘルプを選択 パッドの右
case 0:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
case 3:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Input_numbertokazutama:
end select
endif
'4.終了するを選択  パッドの右
'バーチャルパッド　ここまで'
'key$ = input$(1)
'カーソルの下
if key$ = chr$(31) then
select case (No Mod 4)
case 0:
c=1:No=c:sp_on 1,1:sp_put 1,(5,400),0,0:sp_on 0,0:sp_on 2,0:sp_on 0,0:goto Entry_check_key:
case 1:
c=2:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,1:sp_put 2,(5,500),0,0:sp_on 3,0:goto Entry_check_key:
case 2:
c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,600),0,0:goto Entry_check_key:
case 3:
c=0:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:goto Entry_check_key:
end select
endif
'カーソル　上
if key$ = chr$(30) then
select case (No Mod 4)
case 0:
c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,300),0,0:goto Entry_check_key:
case 1:
c=0:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Entry_check_key:
case 2:
c=1:No=c:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:goto Entry_check_key:
case 3:
c=2:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Entry_check_key:
end select
endif
'エンターキーを押す
if key$ = chr$(13) then
if No = 1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Search:
if No = 2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Moji_Count_Check:
if No = 0 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
endif
'
Kakunin_Surei_count:
cls 3:font 48:No=0
select case device_No
case 1:
gload Gazo$ + "Kazutama_List_Top.png",0,0,0
'gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$ + "Kazutama_List_Top.png",0,0,0
end select
sp_on 3,0:sp_on 2,0:sp_on 1,0:sp_on 0,1:sp_put 0,(5,300),0,0
color rgb(255,0,0)
print chr$(13)+chr$(13)+chr$(13)
color rgb(255,255,255)
print "番号を選んでください" + chr$(13)
print " :1.数霊リスト 1人用" + chr$(13)
print " :2.結果表示設定" + chr$(13)
print " :3.トップ画面に行く" + chr$(13)
print "" + chr$(13)
color rgb(0,0,0)
locate 0,15:print"                                                         "
if No = 0 then locate 1,15:print "1.数霊リスト　1人用を選択"
Entry_List:
y = 0:key$ = "":bg=0
while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
y = stick(1)
key$ = inkey$
bg = strig(1)
pause 2
wend
'バーチャルパッド　ここから'
'バーチャルパッド　ここから'
'バーチャルパッド　下
if y = 1 then
select case No
'No の初期値：No=1
case 0:
sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,400),0,0:No=1:pause 200:locate 0,15:print "                                       ":locate 1,15:print"2.結果表示設定を選択":goto Entry_List:
'デバッグライン　ここから
'0のとき
'デバッグライン　ここまで
'デバッグライン　ここから
'color rgb(0,0,0):locate 0,15:print " 4.終了を選択":goto Entry_List:
'cls:color rgb(255,255,255):print"ok"
'デバッグライン　ここまで
case 2:
sp_on 3,0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(5,300),0,0:pause 200:locate 0,15:print"                                       ":locate 0,15:print " 1.数霊リスト 1人用を選択":No=0:goto Entry_List:
case 1:
sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:locate 0,15:print "                                      ":No=2:locate 1,15:print "3．トップ画面に行くを選択":goto Entry_List:
'デバッグライン　ここから
'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Entry_List:
'デバッグライン　ここまで
'デバッグライン　ここから
' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Entry_List:
'デバッグライン　ここまで
end select
endif
'バーチャルパッド　上 ここから
if y = -1 then
select case No
'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
case 2:
sp_on 2,0:sp_on 0,0:sp_on 1,1:sp_on 3,0:sp_put 1,(5,400),0,0:pause 200:No=1:locate 0,15:print "                                      ":locate 0,15:print " 2.結果表示設定を選択":goto Entry_List:
'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
case 0:
sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,500),0,0:pause 200:No=2:locate 0,15:print "                                      ":locate 1,15:print"3.トップ画面に行くを選択":goto Entry_List:
'No:3 3.Help→2.設定 No:2
case 1:
sp_on 1,0:sp_on 0,1:sp_on 3,0:sp_on 2,0:sp_put 0,(5,300),0,0:pause 200:No=0:locate 0,15:print"                                      ":locate 1,15:print "1.数霊リスト 1人用を選択":goto Entry_List:
end select
endif
if bg = 2 then
select case No
'1.数霊リスト 一人用を選択を選択  パッドの右キー
case 0:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
'2.設定を選択  パッドの右キー
case 1:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
case 2:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
end select
endif
if key$=chr$(13) then
select case No
case 0:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Surei_List1:
case 1:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Result_Setting:
case 2:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
end select
endif
'4.終了するを選択  パッドの右
'バーチャルパッド　ここまで'
Surei_List1:
cls 3:font 48
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 4,0:sp_on 3,0
file$ = dir$(SAVE_DATA1$,0)
'ファイルが無いときの画面
if file$ = ""  then
'背景画面表示
select case device_No
case 1:
gload Gazo$ + "KazutamaList1.png",0
gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
gload Gazo$+"downscreen.png",0,0,800
case 2:
gload Gazo$ + "KazutamaList1.png"
end select
print chr$(13)
color rgb(255,255,255):print "登録ファイルはございません" + chr$(13)
color rgb(0,0,0):print "パッドの右を押してください" + chr$(13)
'else
'endif
bg = 0:key$ = ""
while (key$ <> chr$(13) and bg<>2)
key$ = inkey$
bg = strig(1)
pause 2
wend
'エンターキーもしくはバーチャルパッドの右でトップに行く
if (bg = 2  or key$ = chr$(13)) then goto TopScreen:
else
cls 3:buffer_list_count = Loadcount()
color rgb(255,255,255)
if lang_flag = 1 then
Else
talk "登録件数は" + str$(buffer_list_count) + "件です"
select case device_No
Case 1:
gload Gazo$ + "KazutamaList1_Entry.png",0,0,0
gload Gazo$ + "MiddleScreen_20230401.png",0,0,240
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$+"KazutamaList1_Entry.png",0,0,0
end select
color rgb(0,0,255)
print chr$(13)
color rgb(255,255,255)
print "登録件数:";buffer_list_count;"件";chr$(13)
color rgb(0,0,0)
print "パッドの右を押してください" + chr$(13)
endif
bg = 0:key$ = "":bg2 = 0
while (key$ <> chr$(13) and bg <> 2)
key$ = inkey$
bg = strig(1)
bg2=strig(0)
pause 2
wend
'エンターキーまたはバーチャルパッドの右でリストに飛ぶ
if (key$ = chr$(13) or bg = 2) then pause 2:goto KotodamaList_page:
endif
if (bg = 2) then pause 2:goto TopScreen:
func Loadcount()
n = 0
'while eof(1)=-1
open SAVE_DATA1$  for input as #1
while eof(1) <> -1
line input #1,line$
n = n + 1
wend
close #1
count = n
endfunc count
count_line = Loadcount()
func Kotodama$(buf$)
color rgb(255,255,255)
b = len("数霊:")
a$ = Mid$(buf$,b+1,len(buf$))
for i=0 to 118
color rgb(255,255,255)
if bufline3$(2 * i) ="数霊:" + a$  then
moji_$ = bufline3$(2*i + 1)
endif
next i
kotodama$ = moji_$
endfunc kotodama$
KotodamaList_page:
cls 3:font 48:m = 0:
select case device_No
case 1:
gload Gazo$ + "Screen5_Surei_List.png"
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$ + "Screen5_Surei_List.png",0,0,0
end select
if SAVE_DATA1$ = "" then
cls 3:color rgb(255,255,255):print"ファイルがありません"
else
a = Loadcount()
open SAVE_DATA1$  for input as #1
for i=0 to a-1
for n=0 to 1
input #1,line$
bufKaztama$(i,n) = line$
next n
next i
close #1
l = 0:n=0
select case device_No
case 1:
gload Gazo$ + "Screen5_Surei_List.png"
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$ + "Screen5_Surei_List.png",0,0,0
end select
while (buffer_list_count >= l)
cls
color rgb(255,0,0)
print chr$(13)
color rgb(255,255,255)
n=n+1
print chr$(13)
print "番号:";l+1;chr$(13)
print bufKaztama$(l,0) + chr$(13)
print bufKaztama$(l,1) + chr$(13)
Kmoji$ = moji$
print chr$(13) + chr$(13) + chr$(13)
color rgb(0,0,0)
if buffer_list_count=1 then
print " :パッドの左:トップ画面"+chr$(13)
ui_msg "登録件数は1件です。"
else
if buffer_list_count > 1 then
print " :パッドの左:トップ画面" + chr$(13)
print " :パッドの右:次へ行く" + chr$(13)
endif
endif
key$ = "":bg = 0:bg2 = 0
while (key$ <> chr$(13) and bg <> 2 and bg2 <> 1)
key$ = inkey$
bg = strig(1)
bg2 = strig(0)
pause 2
wend
'if n > 1 then
if (key$ = " " OR bg = 2) then
if n > 1 then
l = ((l+1) Mod buffer_list_count):pause 1.583 * 1000
endif
else
if ((bg2 = 1) or (key$=chr$(13))) then
goto TopScreen:
endif
else
goto KotodamaList_page:
endif
wend
endif
'ndif
'結果表示２ Menu1
Surei_Result4:
cls 3:font 32+16:init"kb:4"
for i=0 to 181 + 4 - 1
if i = count  then
buffer$ = bufline2$(count + 4,1)
endif
next i
if len(buffer$) > 21 and len(buffer$) <= 45 then
buffer2$ = Mid$(buffer$,1,22)
buffer3$ = Mid$(buffer$,23,(len(buffer$) - 22))
buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + chr$(13)
else
if len(buffer$) <= 21 then
buffer2$ = Mid$(buffer$,1,21)
buffer$ = buffer2$ + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13) + chr$(13)+chr$(13)
else
if len(buffer$) > 45 and len(buffer$) <= 62 then
buffer2$ = Mid$(buffer$,1,22)
buffer3$ = Mid$(buffer$,23,22)
buffer4$ = Mid$(buffer$,44,(len(buffer$)-44))
buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + chr$(13)
else
if len(buffer$) > 64 and len(buffer$) <= 81 then
buffer2$ = Mid$(buffer$,1,22)
buffer3$ = Mid$(buffer$,23,20)
buffer4$ = Mid$(buffer$,44,20)
buffer5$ = Mid$(buffer$,65,(len(buffer$)-65))
buffer$ = buffer2$ + chr$(13) + buffer3$  + chr$(13) + buffer4$  + chr$(13) + buffer5$ + chr$(13)
if len(buffer$) > 81 and len(buffer$) <= 110 then
buffer2$ = Mid$(buffer$,1,22)
buffer3$ = Mid$(buffer$,23,20)
buffer4$ = Mid$(buffer$,43,20)
buffer5$ = Mid$(buffer$,63,20)
buffer6$ = Mid$(buffer$,83,(len(buffer$) - 83))
buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13) + buffer5$ + chr$(13) + buffer6$ + chr$(13)
endif
endif
endif
endif
endif
Surei_Result4_2:
select case device_No
case 1:
gload Gazo$ + "Screen1_Result2.png"
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$ +"Screen1_Result2.png"
end select
Result_Menu_List$(0)="1.トップ画面に行く"
Result_Menu_List$(1)="2.数霊のデーターを保存"
Result_Menu_List$(2)="3.もう一度、数霊を調べる"
cls
print chr$(13)
if lang_flag = 1 then
else
color rgb(127,255,212)
print chr$(13);chr$(13)
print "入力文字:";buffer_moji$;chr$(13)
print "数霊:";count;chr$(13)
color rgb(255,255,255)
print "数霊の説明:"+chr$(13)
print buffer$
color rgb(0,0,0)
locate 0,15
print "(パッド 右 or 左 ):Menuを開く" + chr$(13)
endif
key$ = "":bg = 0:bg2 = 0
while (bg<>2 and bg2<>1)
key$ = inkey$
bg = strig(1)
bg2 = strig(0)
pause 2
wend
if ((bg = 2) or (bg2 = 1)) then
num = ui_select("Result_Menu_List$","番号を選んでください")
endif
if num = 0 then goto TopScreen:
if num = 1 then goto File_save:
if num = 2 then goto Surei_Input:
if num = -1 then goto Surei_Result4
File_save:
'ファイルがない時
if dir$(SAVE_DATA1$) = " " then
open SAVE_DATA1$ for output as #1
print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
close #1
ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
'ファイルが有る時
else
open SAVE_DATA1$ for append as #1
print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
close #1
ui_msg "保存しました":talk"保存しました":goto Surei_Result4_2:
endif
func All_clear()
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
endfunc
'ここから
Config_moji1:
cls 3:Font 48
select case device_No
case 1:
gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload  Gazo$ + "Screen1_Setting_Top.png",0,0,0
end select
play ""
No=1
sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
color rgb(0,0,255)
print chr$(13)
if lang_flag = 1 then
'lang_flag = 1:英語
else
'lang_flag = 0:日本語
color rgb(255,255,255)
print "番号を選んでください" + chr$(13)
print " :1.文字の項目" + chr$(13)
print " :2.結果表示設定" + chr$(13)
print " :3.トップ画面に行く" + chr$(13)
print " :4.終 了" + chr$(13)
endif
color rgb(0,0,0)
locate 1,12
if No = 1 then print "1.文字の項目"
'y:バーチャルパッドの処理
'key$:カーソルの処理
'bg:バーチャルパッドの右ボタン
Config_moji1_Screen:
y = 0:key$ = "":bg=0
while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<>2)
y = stick(1)
key$ = inkey$
bg=strig(1)
pause 2
wend
'バーチャルパッド　ここから'
'バーチャルパッド　ここから'
if y = 1 then
select case No
'No の初期値：No=1
case 1:
sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=2:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
'デバッグライン　ここから
'0のとき
'デバッグライン　ここまで
'デバッグライン　ここから
case 2:
sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
color rgb(0,0,0)::No=3:goto Config_moji1_Screen:
'if lang_flag = 1 then
'else
locate 1,12:print "3.トップ画面に行くを選択"
'endif
'デバッグライン　ここまで
case 3:
sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto Config_moji1_Screen:
'デバッグライン　ここから
'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
'デバッグライン　ここまで
case 0:
sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
'デバッグライン　ここから
' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
'デバッグライン　ここまで
end select
endif
'バーチャルパッド　上 ここから
if y = -1 then
select case No
'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
case 1:
sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto Config_moji1_Screen:
'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
case 0:
sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto Config_moji1_Screen:
'No:3 3.Help→2.設定 No:2
case 3:
sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                      ":locate 1,12:print"2.数霊文字確認を選択":goto Config_moji1_Screen:
case 2:
sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                      ":locate 1,12:print"1.登録文字の確認を選択":goto Config_moji1_Screen:
end select
endif
if bg=2 then
select case No
'1.数霊チェックを選択  パッドの右キー
case 1:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
'2.設定を選択    パッドの右キー
case 2:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
'3.ヘルプを選択 パッドの右
case 3:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
'プログラムの終了を選択
case 0:
cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000
'if lang_flag = 1 then
'Else
ui_msg "プログラムを終了します":end
'endif
end select
endif
'4.終了するを選択  パッドの右
'バーチャルパッド　ここまで'
'SettingScreen:
'key$ = input$(1)
'カーソル下'
if key$ = chr$(31) then
select case (No Mod 4)
'登録文字から数霊文字の確認
case 1:
c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto Config_moji1_Screen:
'数霊文字の確認からトップ画面に行く
case 2:
c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto Config_moji1_Screen:
'トップ画面に行くから終了
case 3:
c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto Config_moji1_Screen:
'終了から登録文字
case 0:
c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto Config_moji1_Screen:
end select
endif
'カーソル　上
if key$ = chr$(30) then
select case (No Mod 4)
case 1:
c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto Config_moji1_Screen:
case 2:
c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto Config_moji1_Screen:
case 3:
c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto Config_moji1_Screen:
case 0:
c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto Config_moji1_Screen:
end select
endif
'エンターキーを押したとき
if key$ = chr$(13) then
if No=3 then goto TopScreen:
if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052*1000:ui_msg"プログラムを終了します":cls 3:cls 4:end
'lse
'o'o SettingScreen:
endif
'ここまで
Config_moji2:
cls 3:Font 48
select case device_No
case 1:
gload Gazo$ + "Screen1_Setting_Top.png",0,0,0
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$ + "Screen1_Setting_Top.png "
end select
play ""
'play Voice_File_TopScreen$ + "Voice_Setting_Top.mp3"
No=1
sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:
color rgb(0,0,255)
'print "●設定項目" + chr$(13)
print chr$(13)
if lang_flag = 1 then
'lang_flag = 1:英語
else
'lang_flag = 0:日本語
color rgb(255,255,255)
print "番号を選んでください" + chr$(13)
'print " :1.文字の項目" + chr$(13)
'print " :2.結果表示設定" + chr$(13)
print " :1.文字の項目" + chr$(13)
print " :2.結果表示設定" + chr$(13)
print " :3.トップ画面に行く" + chr$(13)
print " :4.終 了" + chr$(13)
endif
color rgb(0,0,0)
locate 1,12
if No = 1 then print "1.文字の項目"
'y:バーチャルパッドの処理
'key$:カーソルの処理
'bg:バーチャルパッドの右ボタン
config_moji2:
y = 0:key$ = "":bg=0
while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg<> 2)
y = stick(1)
key$ = inkey$
bg = strig(1)
pause 2
wend
'バーチャルパッド　ここから'
'バーチャルパッド　ここから'
if y = 1 then
select case No
'No の初期値：No=1
case 1:
sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(5,300),0,0:No=1:pause 200:locate 0,12:print "                                       ":locate 1,12:print"2.数霊文字確認を選択":goto SettingScreen:
'デバッグライン　ここから
'0のとき
'デバッグライン　ここまで
'デバッグライン　ここから
case 2:
sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:locate 0,12:print "                      "
color rgb(0,0,0)::No=2:goto SettingScreen:
if lang_flag = 1 then
else
locate 0,12:print " 3.トップ画面に行くを選択"
endif
'cls:color rgb(255,255,255):print"ok"
'デバッグライン　ここまで
case 3:
sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:locate 0,12:print"                                       ":locate 1,12:print "4.終 了を選択":No=0:goto SettingScreen:
'デバッグライン　ここから
'locate 1,12:print"count=";count;chr$(13):count = count + 1:goto Main_Select:
'デバッグライン　ここまで
case 0:
sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=0:locate 0,12:print"                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
'デバッグライン　ここから
' locate 1,12:print "b=";b;chr$(13):count=count+1:goto Main_Select:
'デバッグライン　ここまで
end select
endif
'バーチャルパッド　上 ここから
if y = -1 then
select case No
'No:0  4.終了  :1数霊チェック No:1　→　4.終了 No:0
case 1:
sp_on 3,1:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_put 3,(5,500),0,0:pause 200:No=0:locate 0,12:print "                                       ":locate 1,12:print"4.終了を選択"::goto SettingScreen:
'No:3 3.Help :4.終了:NO:0 → 3.Help No:3
case 0:
sp_on 2,1:sp_on 0,0:sp_on 1,0:sp_on 3,0:sp_put 2,(5,400),0,0:pause 200:No=3:locate 0,12:print"                                       ":locate 1,12:print"3.トップ画面を選択":goto SettingScreen:
'No:3 3.Help→2.設定 No:2
case 3:
sp_on 1,1:sp_on 0,0:sp_on 3,0:sp_on 2,0:sp_put 1,(5,300),0,0:pause 200:No=2:locate 0,12:print"                                       ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
case 2:
sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:pause 200:No=1:locate 0,12:print "                                       ":locate 1,12:print"1.登録文字の確認を選択":goto SettingScreen:
end select
endif
'決定ボタン
if bg=2 then
select case No
'1.数霊チェックを選択  パッドの右キー
case 1:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Select_moji:
'2.設定を選択    パッドの右キー
case 2:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Kakunin_Surei_count:
'3.ヘルプを選択 パッドの右
case 3:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
'プログラムの終了を選択
case 0:
cls 3:cls 4:play "":play Voice_File_TopScreen$+"Voice_Finish_Message.mp3":color rgb(255,255,255):pause 2.052*1000:
'if lang_flag = 1 then
'Else
ui_msg "プログラムを終了します":end
'endif
end select
endif
'4.終了するを選択  パッドの右
'バーチャルパッド　ここまで'
'カーソル下'
if key$ = chr$(31) then
select case (No Mod 4)
'登録文字から数霊文字の確認
case 1:
c=2:No=c:sp_on 0,1:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 0,(5,300),0,0:locate 0,12:print "                                     ":locate 1,12:print "2.数霊文字確認を選択":goto SettingScreen:
'数霊文字の確認からトップ画面に行く
case 2:
c=3:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:locate 0,12:print "                                     ":locate 1,12:print"3.トップ画面に行くを選択":goto SettingScreen:
'トップ画面に行くから終了
case 3:
c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(5,500),0,0:locate 0,12:print "                                       ":locate 1,12:print "4.終了するを選択":goto SettingScreen:
'終了から登録文字
case 0:
c=1:No=c:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,200),0,0:locate 0,12:print "                                      ":locate 1,12:print "1.登録文字の確認を選択":goto SettingScreen:
end select
endif
'カーソル　上
if key$ = chr$(30) then
select case (No Mod 4)
case 1:
c=2:No=c:sp_on 0,1:sp_put 0,(5,200),0,0:sp_on 3,0:sp_on 1,0:sp_on 2,0:goto SettingScreen:
case 2:
c=3:No=c:sp_on 1,1:sp_put 1,(5,300),0,0:sp_on 0,0:sp_on 2,0:sp_on 3,0:goto SettingScreen:
case 3:
c=0:No=c:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(5,400),0,0:goto SettingScreen:
case 0:
c=1:No=c:sp_on 3,1:sp_on 1,0:sp_on 2,1:sp_put 3,(5,500),0,0:sp_on 0,0:goto SettingScreen:
end select
endif
'エンターキーを押したとき
if key$ = chr$(13) then
if No=3 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto TopScreen:
if No=1 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Select_moji:
if No=2 then sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:goto Kakunin_Surei_count:
if No=0 then color rgb(255,255,255):play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":pause 2.052 * 1000:ui_msg"プログラムを終了します":cls 3:cls 4::end
'lse
'o'o SettingScreen:
endif
'結果表示設定
Result_Setting:
color rgb(255,255,255)
'dim list$(4)
'ファイル読み込み
'1.ファイルが有るか無いかのチェック
if Dir$(System$) = "" then
'1-1.ファイルがないとき
'上のSystemフォルダを作成
mkdir "./data/system/"
list$(0) = "●:出た数字から181を引く"
list$(1) = " :出た数字から180を引き単数変換"
open System$ for output as #1
print #1,"config_r=0"
close #1
ui_msg "ファイルを作成しました"
'ファイル作成
else
'1-2.ファイルが有るとき
'config_r:0 出た数字から181を引く
'config_r:1 出た数字から180を引いて単数変換
'open "./System/config.sys" for input as #1
'ファイルが有るときファイルを読み込み
open System$ for input as #1
line input #1,buf_line$
'buf$にデーターをコピーする
buf$ = buf_line$
close #1
if len(buf$) = 10 then
if left$(buf$,9) = "config_r=" then
buf$ = right$(buf_line$,1)
if buf$ = "1" then
'1.System$ ファイルを削除(config.sys)
'2.1行目をconfig_r=1と書き、保存する
buf_config_r = 1
'list$(0) = "●:1.出た数字から180を引いて単数変換"
'list$(1) = " :2.出た数字から181を引く"
else
if buf$ = "0" then
buf_config_r = 0
' list$(0) = "●:1.出た数字から181を引く"
'list$(1) = " :2.出た数字から180を引いて単数変換"
endif
endif
endif
endif
endif
'"●:1.出た数字から180を引く"をlist$(0)に代入
if buf_config_r =  0 then
list$(0) = "●:1.出た数字から181を引く"
list$(1) = " :2.出た数字から180を引いて単数変換"
else
list$(0) = "●:1.出た数字から180を引いて単数変換"
list$(1) = " :2.出た数字から181を引く"
endif
list$(2) = " :トップ画面に戻る"
list_num = ui_select("list$","番号を選んでください")
play ""
Select case (list_num)
case 0:
if buf$ = "1" then
buf_config_r = 0:
'データーを変更したのでファイルを削除
kill System$
'ファイルを新しく作成
open System$ for output as #1
print #1,"config_r=0"
close #1
ui_msg "設定を変更しました。"
else
'if buf$ = "0" then
'buf_config_r = 1
'kill System$
'open Syetem$ for output as #1
'print #1,"config_r=1"
'close #1
'ui_msg "設定を変更しました"
'endif
endif
goto config_moji2:
case 1:
if buf$ = "0" then
buf_config_r = 1:
'データーを変更したので、ファイルを削除
kill System$
'ファイルを新しく作成
open System$ for output as #1
print #1,"config_r=1"
close #1
ui_msg "設定を変更しました"
else
kill System$
if buf$ = "1" then
open System$ for output as #1
print #1,"config_r=0"
close #1
ui_msg "設定を変更しました"
endif
endif
goto config_moji2:
case 2:
'トップ画面に飛ぶ
goto TopScreen:
case 3:
'プログラムを終了する
cls 3:color rgb(255,255,255):ui_msg "プログラムを終了します":play "":play Voice_File_TopScreen$ + "Voice_Finish_Message.mp3":end
end select
'単数変換
Func Single_Complate(num)
'1.出てきた数字から180を引く
a = num - 180
'a:10〜99
Re1:
if (a > 9 and a < 100) then
b1 = fix(a / 10)
b2 = 10 * a - b1
d1 = b1 + b2
if c > 9 then
goto Re1:
else
c = d1:goto Re2:
endif
endif
Re2:
buffer = c
endfunc buffer
Func Surei_Result_Save_File()
'ファイルがないとき
if dir$(SAVE_DATA1$) = "" then
open SAVE_DATA1$ for output as #1
print #1,"入力文字:"+buffer_moji$+",数霊:"+str$(count)
close #1
ui_msg "保存しました":talk "保存しました":goto Surei_Result:
else
open SAVE_DATA1$ for append as #1
print #1,"入力文字:" + buffer_moji$ + ",数霊:" + str$(count)
close #1
ui_msg "保存しました":talk "保存しました":goto Surei_Result
endif
endfunc
'言語設定
Setting_Language:
cls 3:screen 1,1,1,1:No=2
select case device_No
case 1:
gload Gazo$ + "Screen1.png",0,0,0
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$ + "Screen1.png",0,0,0
end select
init "Kb:4"
sp_on 1,1:sp_on 0,0
sp_put 0,(0,300),0,0
sp_put 1,(0,400),1,0
color rgb(0,0,255)
'print "番号を選んでください"+chr$(13)
'if lang_flag=0 then
'print "言語設定:日本語"+chr$(13)
'else
'print "言語設定:英 語"+chr$(13)
Change_Language:
if lang_flag = 1 then
cls
print "It has changed Language"+chr$(13)
color rgb(255,255,255)
print "Select the Number"+chr$(13)
print " :1.English → Japanse"+chr$(13)
print " :2.It goes to TopScreen"+chr$(13)
print "Language:In English" +chr$(13)
else
cls:color rgb(255,255,255)
print "設定変更(言語の変更)" + chr$(13)
color rgb(255,255,255)
print chr$(13)
print "番号を選んでください"+chr$(13)
print " :1.日本語 → 英語に変更" + chr$(13)
print " :2.トップ画面に戻る" + chr$(13)
print chr$(13)
print "設定言語:日本語" + chr$(13)
endif
color rgb(0,0,0)
locate 0,15:print "                                       ":locate 0,15:print " 2.トップ画面に戻る　を選択" + chr$(13)
Setting_Language_key:
y=0:key$="":bg=0
while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y<> -1 and bg<> 2)
y=stick(1)
key$=inkey$
bg=strig(1)
pause 2
wend
'選択肢変更
if ((y=1) or (y=-1)) then
select case No
case 2:
'実装部分　ここから
pause 200:No=1:sp_on 0,1:sp_on 1,0:locate 0,15:print "                                                         ":locate 0,15:print " 1.日本語 → 英語に変更を選択": goto Setting_Language_key:
'実装部分　ここまで
case 1:
pause 200: No=2:sp_on 0,0:sp_on 1,1:locate 0,15:print "                                                       ":locate 0,15:print " 2.トップ画面に戻る を選択":goto Setting_Language_key:
end select
endif
'Enter Key  決定ボタン
if ((key$=chr$(13)) or (bg=2)) then
select case No
case 2:
sp_on 0,0:sp_on 1,0:goto TopScreen:
case 1:                                                     'lang_flag=1:sp_on 0,0:sp_on 1,0:goto Change_Language:
'
'未実装　ここから
sp_on 0,1:sp_on 1,0:ui_msg "この機能は未実装です":goto Setting_Language_key:
'
'未実装　ここまで
end select
endif
'配列削除
buffer_clear:
erase bufline$
erase bufcount$
erase bufcount1$
erase bufcount2$
erase bufline2$
erase bufline3$
erase bufKaztama$
erase List$
erase Result_Menu_List$
erase list$
erase moji_List$
'ui_msg "メモリーをクリアしました"
return
'配列削除　ここまで
File_Device_Set:
'Device 選択　書き込み
open Device_type$  for output as #1
print #1,device_No
close #1
ui_msg "ファイルを書き込みました"
return
Input_numbertokazutama:
cls 3:init "kb:2"
select case (device_No)
case  1:
gload Gazo$ + "Input_numbertokazutama.png",0,0,0
gload Gazo$ + "Input_numbertokazutama2.png",0,0,380
case 2:
gload Gazo$ + "Input_numbertokazutama.png",0,0,0
end select
color rgb(255,255,255):locate 1,4:print "調べたい数霊の番号を入れてください"+chr$(13);"(Max:181)"
color rgb(0,0,0):locate 1,7:Input "番号:",num
if (num > 181) then ui_msg"181までの数字で入れ直してください":goto Input_numbertokazutama:
pause 200
for i=0 to 181+3-1
if i = num then
buffer$ = bufline2$(i+4,1)
talk buffer$
goto Numbertokazutama:
endif
next i
'goto Numbertokazutama:
'
'
Numbertokazutama:
cls 3:init "kb:4":bg=0:key$=""
select case (device_No)
case 1:
gload Gazo$ + "Result_numbertokazutama.png",0,0,0
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$ + "Result_numbertokazutama.png",0,0,0
end select
font 32+16:color rgb(255,255,255)
locate 1,3:print "◎数霊番号:";num;chr$(13)
locate 1,4:print "◎数霊の説明"+chr$(13)
if ((len(buffer$) > 21) and (len(buffer$) <= 45)) then
buffer2$ = Mid$(buffer$,1,20)
buffer3$ = Mid$(buffer$,21,len(buffer$)-20)
buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13)
else
if (len(buffer$) < 22) then
buffer2$ = Mid$(buffer$,1,21)
buffer$ = buffer2$ + chr$(13)
else
if ((Len(buffer$) > 45) and (len(buffer$) < 66)) then
buffer2$ = Mid$(buffer$,1,20)
buffer3$ = Mid$(buffer$,20,21)
buffer4$ = Mid$(buffer$,41,len(buffer$)-41)
buffer$ = buffer2$ + chr$(13) + buffer3$ + chr$(13) + buffer4$ + chr$(13)
endif
endif
endif
locate 1,5:print buffer$
color rgb(0,0,0)
locate 1,14:print "ジョイパッドの右を押してください"+chr$(13)
while ((bg <> 2) and (key$ <> chr$(13)))
bg=strig(1)
key$=inkey$
pause 2
wend
if ((bg = 2) or (key$ = chr$(13))) then
goto TopScreen:
endif
data_initialize:
cls 3
select case device_No
case 1:
gload Gazo$ + "Data_initializeScreen.png",0,0,0
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$ + "Data_initializeScreen.png",0,0,0
end select
color rgb(255,255,255):font 48:init "kb:4":No=1:sp_on 1,1:sp_put 1,(5,300),0,0
locate 0,4:print "番号を選んでください"+chr$(13)
print " :1.メンバーリストの初期化" + chr$(13)
print " :2.デバイスの初期化" + chr$(13)
print " :3.トップ画面に行く"+chr$(13)
locate 0,15:color rgb(0,0,0):print " 1.メンバーリストの初期化を選択"
data_initialize2:
y = 0:key$ = "":bg = 0
while (key$ <> chr$(31) and key$ <> chr$(13) and y <> 1 and y <> -1 and bg <> 2)
y = stick(1)
key$ = inkey$
bg = strig(1)
pause 2
wend
'y = -1:ジョイパッドの上
'y = 1:ジョイパッド下
'key$ = chr$(13):Enter key
'key$ = chr$(30):カーソル上
'key$ = chr$(31):カーソル下
if ((y = -1) or (key$ = chr$(30))) then
select case No
case 1:
sp_on 1,0:sp_on 2,0:sp_on 0,1:sp_on 3,0:No=0:sp_put 0,(5,500),0,0:locate 0,15:print "                                       ":locate 0,15:print " 3.トップ画面に行くを選択":pause 200:goto data_initialize2:
case 2:
sp_on 1,1:sp_on 2,0:sp_on 0,0:sp_on 3,0:No=1:sp_put 1,(5,300),0,0:locate 0,15:print "                                      ":pause 200:locate 0,15:print " 1.メンバーリストの初期化を選択":goto data_initialize2:
case 0:
sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_on 0,0:sp_put 2,(5,400),0,0:locate 0,15:print "                                      ":pause 200:locate 0,15:print " 2.デバイスの初期化を選択":No=2:goto data_initialize2:
end select
endif
'bg=2:Enter key
if ((bg = 2) or (key$ = chr$(13))) then
select case No
case 0:
sp_on 0,0:sp_on 1,0:sp_on 2,0:pause 200:goto TopScreen:
case 1:
'メンバーリストの初期化トップへ行く
sp_on 0,0:sp_on 1,0:sp_on 2,0:pause 200:goto member_initializeTop:
case 2:
ui_msg "未実装です":goto data_initialize2:
end select
endif
'カーソルの下　または、ジョイパッド下
if ((y = 1) or (key$ = chr$(31))) then
select case No
case 1:
sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:pause 200:No=2:locate 0,15:print "                                                          ":locate 0,15:print " 2.デバイスの初期化を選択":goto data_initialize2:
case 2:
sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:No=0:locate 0,15:print "                                                          ":locate 0,15:print " 3.トップ画面に行くを選択":goto data_initialize2:
case 0:
sp_on 0,0:sp_on 1,1:sp_on 2,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                                          ":locate 0,15:print " 1.メンバーリストの初期化を選択":goto data_initialize2:
end select
endif
'メンバーリストの初期化トップ
member_initializeTop:
cls 3
select case (device_No)
case 1:
gload Gazo$ + "member_initializeTop.png",0,0,0
gload Gazo$ + "downscreen.png",0,0,800
case 2:
gload Gazo$ + "member_initializeTop.png",0,0,0
end select
No=0:init "kb:4":color rgb(255,255,255):font 48
sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(5,500),0,0
locate 0,4:print  "番号を選んでください"+chr$(13)
print " :1.メンバーリストを初期化する" + chr$(13)
print " :2.バックアップを取る" + chr$(13)
print " :3.トップ画面に戻る"+chr$(13)
color rgb(0,0,0):locate 0,15:print "                                       ":locate 0,15:print " 3.トップ画面に戻るを選択"
member_list2:
y=0:key$="":bg=0
while ((key$ <> chr$(13)) and (y <> 1) and (y <> -1) and (bg <> 2))
y = stick(1)
key$ = inkey$
bg = strig(1)
pause 2
wend
'bg=2,chr$(13):決定ボタン
if ((bg = 2) or (key$ = chr$(13)))  then
select case No
case 1:
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto Member_List_DeleteScreen:
case 2:
ui_msg"未実装です":goto member_list2:
case 0:
'3:トップ画面に戻る
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:pause 200:goto TopScreen:
end select
endif
'y=1:chr$(31):ジョイパッド　下　又は　カーソルの下
if ((y = 1) or (key$ = chr$(31))) then
select case No
case 0:
sp_on 1,1:sp_on 2,0:sp_on 0,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 1.メンバーリストを初期化するを選択":goto member_list2:
case 1:
sp_on 0,0:sp_on 2,1:sp_on 1,0:No=2:sp_put 2,(5,400),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 2.バックアップを取るを選択":goto member_list2:
case 2:
sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:locate 0,15:print "                                       ":locate 0,15:print " 3.トップ画面に行くを選択":goto member_list2:
end select
endif
'Joypad  or カーソル　上
if ((y=-1) or (key$=chr$(30))) then
select case No
case 0:
sp_on 2,1:sp_on 1,0:sp_on 0,0:No=2:sp_put 2,(5,400),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 2.バックアップを取るを選択":goto member_list2:
case 1:
sp_on 0,1:sp_on 1,0:sp_on 2,0:No=0:sp_put 0,(5,500),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 3.トップ画面に行くを選択":goto member_list2:
case 2:
sp_on 0,0:sp_on 1,1:sp_on 2,0:No=1:sp_put 1,(5,300),0,0:pause 200:locate 0,15:print "                                      ":locate 0,15:print " 1.メンバーリストを初期化をする選択":goto member_list2:
end select
endif
Member_List_DeleteScreen:
cls:key$ = "":bg = 0:y=0:init "kb:4":font 48:count=0
sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0
if dir$(SAVE_DATA1$) = "" then
'ファイルがないとき
color rgb(255,255,255)
locate 0,4
print "データーファイルは、存在しません。"
locate 0,15:color rgb(0,0,0):print "ジョイパッドの右を押してください":
'endif
while ((key$ <> chr$(13)) and (bg <> 2) and (y <> 1) and (y <> -1))
key$ = inkey$
bg = strig(1)
y = stick(1)
pause 2
wend
if ((key$ = chr$(13)) or (bg = 2)) then goto TopScreen:
'goto TopScreen:
'endif
else
'ファイルが有るとき
'default
'No=1:ファイルを削除する
'No=2:トップ画面に戻る
No=2
sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0
color rgb(255,255,255)
locate 0,4:print"番号を選んでください"+chr$(13)
print " :1.ファイルを削除する"+chr$(13)
print " :2.トップ画面に戻る"+chr$(13)
color rgb(0,0,0):
locate 0,15:print"                                      ":locate 0,15:print " 2.トップ画面に戻るを選択"
endif
Select_key1:
'初期化
y=0:key$="":bg=0
while ((key$ <> chr$(13)) and (bg <> 2) and (y <> 1) and (y <> -1))
key$ = inkey$
bg = strig(1)
y = stick(1)
pause 2
wend
'1.選択キー
'十字キー 上 y=-1
'十字キー　下 y=1
if ((y = 1) or (y = -1)) then
select case No
case 2:
No=1:sp_on 2,0:sp_on 1,1:sp_put 1,(5,300),0,0:locate 0,15:print "                                                                                ":locate 0,15:print " 1．ファイルを削除":pause 200:goto Select_key1:
case 1:
No=2:sp_on 1,0:sp_on 2,1:sp_put 2,(5,400),0,0:locate 0,15:print "                                                          ":locate 0,15:print " 2.トップ画面に戻るを選択":pause 200:goto Select_key1:
end select
endif
'2.決定ボタン
'Joypad　右 or Enter key
if ((bg=2) or (key$=chr$(13))) then
Select case No
case 2:
sp_on 1,0:sp_on 2,0:pause 200:goto TopScreen:
case 1:
if (count=0) then
kill SAVE_DATA1$:ui_msg"メンバーリストを削除しました":pause 200:locate 0,15:print "                                       ":locate 0,15:print " ジョイパッドの右を押してください":count=count+1:goto Select_key1:
else
sp_on 1,0:sp_on 2,0:goto TopScreen
endif
end select
endif
'***********************************************************************
'数霊 データー保存部分　追加　ここから　Date:2025.01.27
'****************************************************
'ラベル：数霊の保存データーラベル
'****************************************************
Save_Kazutama_data:
'****************************************************
'Save_Kazutama_data: (Label1) -> ファイルを保 存 ー＞ Toastでmessageを表示,---> (Label2)After_Save_Kazutama_data2:
'作成日 Date:2025.01.26
'数霊データー保存処理
'保存ファイル:my_Kazutama.date
'全体的な処理
'0.ファイル変数
'1.フォルダの作成確認処理
'2.フォルダの作成処理
'3.ファイルの有無の確認
'4.ファイルの書き込み
'*********************************************************************************
'変数パート　ここから
'*********************************************************************************
'0.ファイル変数
'*********************************************************************************
'0-1.フォルダ:my_Kazutama_Folder$
my_Kazutama_Folder$ = "data/my_Kazutama/"
'*********************************************************************************
'0-2.ファイル：my_Kazutama_data_File$
my_Kazutama_data_File$ = my_Kazutama_Folder$ + "my_Kazutama.dat"
'*********************************************************************************
'フォルダを作る変数
Folder$ = (my_Kazutama_Folder$)
'*********************************************************************************
'書き込むデーター
'buffer_moji$:数霊の入力文字
'buf_count:入力文字の数霊
'変数パート　ここまで
'*********************************************************************************
'*********************************************************************************
'1.フォルダの有無の確認
' "data/my_Kazutama/"　の有無の確認。
'*********************************************************************************
'◎.コードパート
'*********************************************************************************
'処理1 フォルダがない時フォルダ作成
if dir$(Folder$) = ""  then
mkdir my_Kazutama_Folder$
endif
'*********************************************************************************
'ファイルがない時ファイルを作成する処理
'処理2 ファイル作成
'*********************************************************************************
if (dir$(my_Kazutama_data_File$) = "") then
'ファイルがない時ファイルを作成して初回(1回目)の書き込み
'mkdir (myKazutamadata_File$)
'初回目の書き込み処理
open my_Kazutama_data_File$ for output as #1
'************************************************************************
'数霊の文字入力 ,入力文字の数霊　 ここから
'buffer_moji$ ,val(buf_count)
'***********************************************************************
print #1,"数霊の入力文字" + "," + "入力文字の数霊"
print #1, buffer_moji$ + "," + str$(count)
'***********************************************************************
'数霊の文字入力 ,入力文字の数霊 　ここまで
'buffer_moji$ ,val(buf_count)
'***********************************************************************
close #1
'***********************************************************************
'保存完了と表示する
ui_msg "保存しました"
'***********************************************************************
'Sound play
else
'***********************************************************************
play Voice_File_TopScreen$ + "Voice_Save_Data_20250207.mp3"
'2回目以降の書き込み
'***********************************************************************
'それ以外は、ファイルをオープンして、数霊と文字を書き込む
'取得するデーター
'buffer_moji$: 数霊の入力文字
'count: 入力文字の数霊
'***********************************************************************
'ファイルを開く 末尾にデーターを追加していく
open my_Kazutama_data_File$ for append as #1
'***********************************************************************
'データーの末尾にデーターを追加:
'数霊の文字入力 ,入力文字の数霊　 ここから
'buffer_moji$ ,str$(count)
'***********************************************************************
print #1, buffer_moji$ + "," + str$(count)
'***********************************************************************
'数霊の文字入力 ,入力文字の数霊　 ここまで
'buffer_moji$ ,str$(buf_count)
'***********************************************************************
'ファイルを閉じる
close #1
'***********************************************************************
'保存完了と表示する
ui_msg "保存しました"
'play Voice_File_TopScreen$ + "data/Sound_data/Voice_Save_data.mp3"
'***********************************************************************
endif
Button_count=1
return
'数霊 データー保存部分　追加　ここまで　Date:2025.01.27
'***********************************************************************
After_Save_Kazutama_data2:
if (Button_count = 0) then
Button_count = 1
endif
'***********************************************************************
'自作関数　Alphabet Check
'Date:2025.02.16
'文字にアルファベットが入ってるかを調べる関数
'************************************************************************
'文字入力の確認　ユーザー関数
'文字の入力チェック　文字にAlphabetが入ってるか調べる関数
'作成日 :Date:2025.02.15
'使用例1
'1."カメラ" → Alphabet (A〜Z)がないので 戻り値:0
'2."Back み" → Alphabet (A〜Z）があるので　戻り値:1
'入力した文字に対してAlphabetが混じってるか調べる処理
'func Alphabet_Check(buf$)
'1.変数の定義
Dim buf_Alphabet$(25):moji_count=0
buf_Alphabet$={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","U","V","W","X","Y","Z"}
'end func
'****************************************************
'2.自作関数
'2-1.Alphabet Check(buf$)
'*****************************************************
func Alphabet_Check(buf$)
'*****************************************************
'自作関数作成日                                     *
'Date:2025.02.16                                    *
'buf$:調べたい文字                                  *
'buf$にAlphabetが混じってるかを調べる関数            *
'文字にAlphabetがあれば、あれば1 を返す。            *
'文字にAlphabetがなければ0を返す。                   *
'*****************************************************
for i=0 to 24
 if (buf$=buf_Alphabet$(i)) then
       Alphabet_moji_count = Alphabet_moji_count + 1
 endif
next i
     Alphabet_count = Alphabet_moji_count
endfunc Alphabet_count
'*****************************************************
