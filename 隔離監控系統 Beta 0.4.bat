color 04
 @echo off
 CLS
echo ####################################################   歡迎使用    #####################################################
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                    正在檢查檔案是否擁有系統管理員權限，請稍後...                                     #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                   版本資訊: Beta0.4  #
echo #                                                                                         開發諮詢: owner@chamatw.net  #
echo #                                                                                            chamatwnetwork@gmail.com  #
echo #                                                          Copyright c 2016-2019 ChamaTW Network  All rights reserved  #
echo ########################################################################################################################
 timeout 1
:init
 setlocal DisableDelayedExpansion
 set cmdInvoke=1
 set winSysFolder=System32
 set "batchPath=%~0"
 for %%k in (%0) do set batchName=%%~nk
 set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
 setlocal EnableDelayedExpansion

:checkPrivileges
  NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
  if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
color 40
echo ####################################################   歡迎使用    #####################################################
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                    正在檢查檔案是否擁有系統管理員權限，請稍後...   [  錯誤  ]                        #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                           正在向Windows發送管理員權限要求...                                         #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                   版本資訊: Beta0.4  #
echo #                                                                                         開發諮詢: owner@chamatw.net  #
echo #                                                                                            chamatwnetwork@gmail.com  #
echo #                                                          Copyright c 2016-2019 ChamaTW Network  All rights reserved  #
echo ########################################################################################################################
  timeout 1
  echo Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
  echo args = "ELEV " >> "%vbsGetPrivileges%"
  echo For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
  echo args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
  echo Next >> "%vbsGetPrivileges%"

  if '%cmdInvoke%'=='1' goto InvokeCmd 

  echo UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
  goto ExecElevation

:InvokeCmd
  echo args = "/c """ + "!batchPath!" + """ " + args >> "%vbsGetPrivileges%"
  echo UAC.ShellExecute "%SystemRoot%\%winSysFolder%\cmd.exe", args, "", "runas", 1 >> "%vbsGetPrivileges%"

:ExecElevation
 "%SystemRoot%\%winSysFolder%\WScript.exe" "%vbsGetPrivileges%" %*
 exit /B

:gotPrivileges
 setlocal & cd /d %~dp0
 if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

 ::::::::::::::::::::::::::::
 ::START
 ::::::::::::::::::::::::::::
color 07
cls
@echo off
:Start
echo #################################################   教學監控/廣播阻擋程式   ############################################
echo #                                                                                                                      #
echo # 本程式使用原生Windows指令完成廣播/監控阻擋作業，當程式開始執行時，會將監控/管理程式一律停止服務，                    #
echo #                                                                                                                      #
echo #       請參照程式中指示進行操作                                                                                       #
echo #                                                                                                                      #
echo # 注意事項                                                                                                             #
echo #                                                                                                                      #
echo #   1. 請先確認所使用的程式是否用在對應的訊工廠或電腦教室內                                                            #
echo #                                                                                                                      #
echo #   2. 請先確認監控是否正在執行(可於視窗右下確認是否連上教師機)                                                        #
echo #                                                                                                                      #
echo #   3. 請一定要使用『以系統管理員身分執行』來開啟檔案。(對檔案右鍵 - 以系統管理員身分執行)                             #
echo #                                                                                                                      #
echo #   4. 某些教室廣播螢幕使用硬體類廣播，本程式無法進行阻擋                                                              #
echo #                                                                                                                      #
echo #   5. 請勿任意轉傳此程式給任何人與其他同學，並請低調使用                                                              #
echo #                                                                                                                      #
echo #   6. 若此程式被意外流至教師端，開發者將有權利拒絕承認製作與發行，並不再進行更新與發行，請同學使用務必留意            #
echo #                                                                                                                      #
echo #   7. 請勿任意修改、串接、任意提供，任何更新與提供發行皆由開發者進行                                                  #
echo #                                                                                                                      #
echo #   8. 請勿假冒開發者發行此程式並向對方酌收費用，開源碼與使用規章皆在作者 Github 內，歡迎參照                          #
echo #                                                                                                                      #
echo #                                                                                                   版本資訊: Beta0.4  #
echo #                                                                                         開發諮詢: owner@chamatw.net  #
echo #                                                                                            chamatwnetwork@gmail.com  #
echo #                                                          Copyright c 2016-2019 ChamaTW Network  All rights reserved  #
echo ##############################################   按下任意按鍵開始執行   ################################################
pause

:Menu0
cls
color 03
echo ###################################################   步驟一 - 選擇教室   ##############################################
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #           請輸入所在教室，以便系統決定使用哪種方法阻擋                                                               #
echo #                                                                                                                      #
echo #            1) 訊一場  (測試通過)                                                                                     #
echo #                                                                                                                      #
echo #            2) 訊二場  (測試通過)                                                                                     #
echo #                                                                                                                      #
echo #            3) 訊三場  (尚待新增)                                                                                     #
echo #                                                                                                                      #
echo #            4) 訊三場  (尚未新增)                                                                                     #
echo #                                                                                                                      #
echo #            5) 離開此程式                                                                                             #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                   版本資訊: Beta0.4  #
echo #                                                                                         開發諮詢: owner@chamatw.net  #
echo #                                                                                            chamatwnetwork@gmail.com  #
echo #                                                          Copyright c 2016-2019 ChamaTW Network  All rights reserved  #
echo ########################################   在下面輸入代碼後，程式會繼續執行   ##########################################
set /p number=

if %number% == 1 goto :CR1
if %number% == 2 goto :CR2
if %number% == 3 goto :NotSupport
if %number% == 4 goto :NotSupport
if %number% == 5 goto :Leave
goto :TypeError

:TypeError
cls
color 04
echo ###################################################      錯誤   ########################################################
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                           你手癌嗎? 輸入一個正確的數字                                               #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo ########################################################################################################################
pause
goto Menu0

:CR1
color 02
echo ####################################################   訊一場    #######################################################
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #    此教室配備硬體廣播與軟體監控功能，當使用硬體廣播時，此程式無法阻擋                                                #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #    另外，訊一場的監控程式會自動重啟，執行時請勿把此阻擋程式關閉                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo ########################################################################################################################
pause
goto :Download
: Download
echo;
echo 請稍後，正在取得授權碼...
echo 正在準備從伺服器下載檔案......
timeout 4
cls
color 07
echo    005/100 [                                                   ]   0.05M  200Kb/s in 5 sec. httpd-%random%.tar.gz
echo    010/100 [ ====                                              ]   0.10M  200Kb/s in 5 sec. httpd-%random%.tar.gz
echo    015/100 [ =======                                           ]   0.15M  200Kb/s in 5 sec. httpd-%random%.tar.gz
echo    020/100 [ ===========                                       ]   0.20M  200Kb/s in 5 sec. httpd-%random%.tar.gz
echo    025/100 [ ===============                                   ]   0.25M  200Kb/s in 4 sec. httpd-%random%.tar.gz
cls
echo    030/100 [ ===================                               ]   0.30M  200Kb/s in 4 sec. httpd-%random%.tar.gz
echo    035/100 [ ======================                            ]   0.35M  200Kb/s in 4 sec. httpd-%random%.tar.gz
echo    040/100 [ =========================                         ]   0.40M  200Kb/s in 3 sec. httpd-%random%.tar.gz
echo    045/100 [ ===========================                       ]   0.45M  200Kb/s in 3 sec. httpd-%random%.tar.gz
echo    050/100 [ ============================                      ]   0.50M  200Kb/s in 3 sec. httpd-%random%.tar.gz
cls
echo    055/100 [ ===============================                   ]   0.55M  200Kb/s in 3 sec. httpd-%random%.tar.gz
echo    060/100 [ =================================                 ]   0.60M  200Kb/s in 2 sec. httpd-%random%.tar.gz
echo    065/100 [ ===================================               ]   0.65M  200Kb/s in 2 sec. httpd-%random%.tar.gz
echo    070/100 [ =====================================             ]   0.70M  200Kb/s in 2 sec. httpd-%random%.tar.gz
echo    075/100 [ =======================================           ]   0.75M  200Kb/s in 2 sec. httpd-%random%.tar.gz
cls
echo    080/100 [ =========================================         ]   0.80M  200Kb/s in 2 sec. httpd-%random%.tar.gz
echo    085/100 [ ===========================================       ]   0.85M  200Kb/s in 1 sec. httpd-%random%.tar.gz
echo    090/100 [ =============================================     ]   0.90M  200Kb/s in 1 sec. httpd-%random%.tar.gz
echo    095/100 [ ===============================================   ]   0.95M  200Kb/s in 1 sec. httpd-%random%.tar.gz
echo    100/100 [ ================================================= ]   1.00M  200Kb/s in 1 sec. httpd-%random%.tar.gz
echo    下載完成，程式處理中
timeout 2
goto :CR1-Start
:CR2
color 06
echo ####################################################   訊二場    #######################################################
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #    此教室配備軟體監控 / 廣播功能，若需要從教師機接收檔案、重啟廣播者                                                 #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #    請在桌面上按下『點我重啟廣播服務』                                                                                #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo ########################################################################################################################
pause
goto :Download
: Download
echo;
echo 請稍後，正在取得授權碼...
echo 正在準備從伺服器下載檔案......
timeout 4
cls
color 07
echo    005/100 [                                                   ]   0.05M  200Kb/s in 5 sec. httpd-%random%.tar.gz
echo    010/100 [ ====                                              ]   0.10M  200Kb/s in 5 sec. httpd-%random%.tar.gz
echo    015/100 [ =======                                           ]   0.15M  200Kb/s in 5 sec. httpd-%random%.tar.gz
echo    020/100 [ ===========                                       ]   0.20M  200Kb/s in 5 sec. httpd-%random%.tar.gz
echo    025/100 [ ===============                                   ]   0.25M  200Kb/s in 4 sec. httpd-%random%.tar.gz
cls
echo    030/100 [ ===================                               ]   0.30M  200Kb/s in 4 sec. httpd-%random%.tar.gz
echo    035/100 [ ======================                            ]   0.35M  200Kb/s in 4 sec. httpd-%random%.tar.gz
echo    040/100 [ =========================                         ]   0.40M  200Kb/s in 3 sec. httpd-%random%.tar.gz
echo    045/100 [ ===========================                       ]   0.45M  200Kb/s in 3 sec. httpd-%random%.tar.gz
echo    050/100 [ ============================                      ]   0.50M  200Kb/s in 3 sec. httpd-%random%.tar.gz
cls
echo    055/100 [ ===============================                   ]   0.55M  200Kb/s in 3 sec. httpd-%random%.tar.gz
echo    060/100 [ =================================                 ]   0.60M  200Kb/s in 2 sec. httpd-%random%.tar.gz
echo    065/100 [ ===================================               ]   0.65M  200Kb/s in 2 sec. httpd-%random%.tar.gz
echo    070/100 [ =====================================             ]   0.70M  200Kb/s in 2 sec. httpd-%random%.tar.gz
echo    075/100 [ =======================================           ]   0.75M  200Kb/s in 2 sec. httpd-%random%.tar.gz
cls
echo    080/100 [ =========================================         ]   0.80M  200Kb/s in 2 sec. httpd-%random%.tar.gz
echo    085/100 [ ===========================================       ]   0.85M  200Kb/s in 1 sec. httpd-%random%.tar.gz
echo    090/100 [ =============================================     ]   0.90M  200Kb/s in 1 sec. httpd-%random%.tar.gz
echo    095/100 [ ===============================================   ]   0.95M  200Kb/s in 1 sec. httpd-%random%.tar.gz
echo    100/100 [ ================================================= ]   1.00M  200Kb/s in 1 sec. httpd-%random%.tar.gz
echo    下載完成，程式處理中
timeout 2
goto CR2-Start
:CR1-Start
cls
color 02
echo ###########################################       阻擋程式執行中    ####################################################
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
taskkill /f /im GATESRV.exe
taskkill /f /im Student.exe
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo 顯示『錯誤: 找不到處理程序』 代表隔離成功 ！若需結束或重啟廣播監控服務，請直接關閉此程式即可
echo ########################################################################################################################
timeout /t 1
cls
color 47
echo ###########################################       請勿關閉此視窗    ####################################################
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
taskkill /f /im GATESRV.exe
taskkill /f /im Student.exe
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo 顯示『錯誤: 找不到處理程序』 代表隔離成功 ！若需結束或重啟廣播監控服務，請直接關閉此程式即可
echo ########################################################################################################################
timeout /t 1
goto :CR1-Start
:CR2-Start
color 06
echo ###########################################       阻擋程式執行中    ####################################################
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
taskkill /f /im StudentMain.exe
mklink "%userprofile%\desktop\點我重啟廣播服務" "C:\Program Files (x86)\ITMS\ITBC 11.0\StudentMain.exe"
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo 阻擋完成，若要重新使用廣播，請至桌面上按下『點我重啟廣播服務』
echo ########################################################################################################################
pause
goto :Leave
:NotSupport
color 04
echo ####################################################   尚未支援    #####################################################
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #    尚未支援此教室，敬請見諒 !                                                                                        #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo ########################################################################################################################
pause
goto :Leave
:Leave
color 05
echo ####################################################   感謝使用    #####################################################
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                請勿任意轉傳此程式給任何人與其他同學，謝謝合作                                        #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                   版本資訊: Beta0.4  #
echo #                                                                                         開發諮詢: owner@chamatw.net  #
echo #                                                                                            chamatwnetwork@gmail.com  #
echo #                                                          Copyright c 2016-2019 ChamaTW Network  All rights reserved  #
echo ###########################################           按任意鍵離開          ############################################
pause