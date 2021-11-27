100 '数霊(かずたま) 製作開始日:2021.07.28
110 'version 0.0.1_2021.07.28 テスト版１
120 'version 0.0.2_2021.11.27 テスト版２
130 Version$ = "0.0.2.2021.11.27(テスト２)"
140 'csvファイル 1.数霊 ベースファイル
150 FILE_csv$ = "data/Kazutama.csv"
160 '変数領域
170 dim bufline$(116 * 2),bufcount$(10):count = 0
180 'ファイルの有無チェック
190 if dir$(FILE_csv$) = "" then
200 '1.ファイルが無いとき
210 cls :print "依存ファイルが見つかりません"
220 else
230 '2.ファイルが有るとき
240 cls:print "csv:file ok." + chr$(13)
250 n=0
260 open FILE_csv$ for input as #1
270 while eof(1)=0
280 input #1,line$
290 bufline$(n)=line$
300 n = n + 1
310 wend
320 close #1
330 endif
340 'Top画面
350 TopScreen:
360 cls 3
370 print "●Top画面" + chr$(13)
380 print "1.数霊(かずたま)チェック" + chr$(13)
390 print "2.設定" + chr$(13)
400 print "3.ヘルプ" + chr$(13)
410 print "4.終　了" + chr$(13)
420 print "番号を選んで入力ボタンを入れてください" + chr$(13)
430 Input "番号:",No
440 if No=1 then goto Surei_Check:
450 if No=3 then goto Help:
460 if No=4 then cls 3:talk "終了します":ui_msg "終了します":end
470 '1-1.数霊チェック
480 Surei_Check:
490 cls 3
500 print "●数霊(かずたま)チェックトップ" + chr$(13)
510 print "1.数霊(かずたま)チェック" + chr$(13)
520 print "2.前の画面に戻る" + chr$(13)
530 print "3.終 了" + chr$(13)
540 print "番号を選んでエンターキーを押してください" + chr$(13)
550 Input "番号:",No
560 if No = 2 then goto TopScreen:
570 if No = 3 then cls 3:talk"終了いたします.":end
580 if No = 1 then goto Surei_Input:
590 if No > 3 then ui_msg"もう一度入れてください":goto Surei_Check:
600 '数霊(かずたま) 文字入力
610 Surei_Input:
620 cls 3
630 print "●数霊(かずたま)文字入力" + chr$(13)
640 print "文字を入れてください" + chr$(13)
650 color rgb(255,0,0)
660 print "(有効文字:カタカナ、半角アルファベット 大文字のみ)" + chr$(13)
670 color rgb(255,255,255)
680 Input "入力文字:",buffer_moji$
690 '数霊　計算 パート
700 '文字の計算関数
710 'moji$:1文字を入れる
720 func Complate(moji$)
730 for n = 1 to 114
740 if moji$ = bufline$(2*n) then
750 buffcount = val(bufline$(2 * n + 1))
760 endif
770 next n
780 endfunc buffcount
790 '数霊　結果表示
800 Surei_Result:
810 cls 3
820 'ゼロカウント:zcount
830 'ゼロカウント:無効な文字が入ってるとき表示させないようにする
840 '例 アカい:"い"の文字は無効な文字なので、はじく
850 zcount=0
860 'mojicount:入力文字数
870 mojicount = len(buffer_moji$)
880 for n=1 to mojicount
890 for j=1 to 116
900 bufcount$(n - 1) = Mid$(buffer_moji$,n,1)
910 if bufcount$(n - 1) = bufline$(2 * j) then
920   zcount = zcount + 1
930 endif
940 next j
950 next n
960 if mojicount > zcount then
970 cls 3:ui_msg "無効な文字です":talk"無効な文字があります。":zcount = 0:goto Surei_Input:
980 endif
990 for i = 1 to mojicount
1000 bufcount$(i-1) = Mid$(buffer_moji$,i,1)
1010 n1 = Complate(bufcount$(i - 1))
1020 count = count + n1
1030 next i
1040 '182以上のとき,181を引く
1050 if count > 181 then count = count - 181
1060 cls 3
1070 print "入力文字:";buffer_moji$;chr$(13)
1080 print "数霊(かずたま):";count;chr$(13)
1090 print "エンターキーを押してください";chr$(13)
1100 key$ = input$(1)
1110 if key$ = chr$(13) then
1120 n = 0:count = 0:n1 = 0:buffer_moji$ = "":mojicount=0: zcount = 0
1130 for i=0 to 9
1140 bufcount$(i) = ""
1150 next i
1160 goto TopScreen:
1170 endif
1180 '3-1 バージョン情報
1190 Version:
1200 cls 3
1210 print"●バージョン情報"+chr$(13)
1220 print "Ver:";Version$ + chr$(13)
1230 print "アプリ名:数霊　for Basic for Android" + chr$(13)
1240 print "Author:licksjp"+chr$(13)
1250 print "制作開始:2021.7.28" + chr$(13)
1260 print "(C)Copy right licksjp All right reserved" + chr$(13)
1270 print "エンターキーを押してください" + chr$(13)
1280 key$ = input$(1)
1290 if key$ = chr$(13) then goto TopScreen:
1300 '3-2 参考文献
1310 Reference_Book:
1320 cls 3
1330 print"●参考文献" + chr$(13)
1340 print "書名:数霊" + chr$(13)
1350 print "出版社:徳間書店" + chr$(13)
1360 print "ISBN:978-4-19-865309-5" + chr$(13)
1370 print "定価:2300円 + 税" + chr$(13)
1380 print "エンターキーを押してください"
1390 key$=input$(1)
1400 if key$=chr$(13) then goto TopScreen:
1410 'ヘルプ画面　トップ画面
1420 Help:
1430 cls 3
1440 print "●3.ヘルプ　トップ画面" + chr$(13)
1450 print "番号を選んでください" + chr$(13)
1460 print "1.バージョン" + chr$(13)
1470 print "2.参考文献" + chr$(13)
1480 print "3.トップ画面" + chr$(13)
1490 Input "番号:",No
1500 if No=1 then goto Version:
1510 if No=3 then goto TopScreen:
1520 if No=2 then goto Reference_Book:
1530 if (No=0 or No > 3) then ui_msg"もう一度入れてください":talk "もう一度、入れてください":goto Help:
