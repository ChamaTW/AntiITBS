color 04
 @echo off
 CLS
echo ####################################################   �w��ϥ�    #####################################################
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                    ���b�ˬd�ɮ׬O�_�֦��t�κ޲z���v���A�еy��...                                     #
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
echo #                                                                                                   ������T: Beta0.4  #
echo #                                                                                         �}�o�Ը�: owner@chamatw.net  #
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
echo ####################################################   �w��ϥ�    #####################################################
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                    ���b�ˬd�ɮ׬O�_�֦��t�κ޲z���v���A�еy��...   [  ���~  ]                        #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                           ���b�VWindows�o�e�޲z���v���n�D...                                         #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                   ������T: Beta0.4  #
echo #                                                                                         �}�o�Ը�: owner@chamatw.net  #
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
echo #################################################   �оǺʱ�/�s�����׵{��   ############################################
echo #                                                                                                                      #
echo # ���{���ϥέ��Windows���O�����s��/�ʱ����ק@�~�A��{���}�l����ɡA�|�N�ʱ�/�޲z�{���@�߰���A�ȡA                    #
echo #                                                                                                                      #
echo #       �аѷӵ{�������ܶi��ާ@                                                                                       #
echo #                                                                                                                      #
echo # �`�N�ƶ�                                                                                                             #
echo #                                                                                                                      #
echo #   1. �Х��T�{�ҨϥΪ��{���O�_�Φb�������T�u�t�ιq���ЫǤ�                                                            #
echo #                                                                                                                      #
echo #   2. �Х��T�{�ʱ��O�_���b����(�i������k�U�T�{�O�_�s�W�Юv��)                                                        #
echo #                                                                                                                      #
echo #   3. �Ф@�w�n�ϥΡy�H�t�κ޲z����������z�Ӷ}���ɮסC(���ɮץk�� - �H�t�κ޲z����������)                             #
echo #                                                                                                                      #
echo #   4. �Y�ǱЫǼs���ù��ϥεw�����s���A���{���L�k�i�����                                                              #
echo #                                                                                                                      #
echo #   5. �Фť��N��Ǧ��{��������H�P��L�P�ǡA�ýЧC�ըϥ�                                                              #
echo #                                                                                                                      #
echo #   6. �Y���{���Q�N�~�y�ܱЮv�ݡA�}�o�̱N���v�Q�ڵ��ӻ{�s�@�P�o��A�ä��A�i���s�P�o��A�ЦP�Ǩϥΰȥ��d�N            #
echo #                                                                                                                      #
echo #   7. �Фť��N�ק�B�걵�B���N���ѡA�����s�P���ѵo��ҥѶ}�o�̶i��                                                  #
echo #                                                                                                                      #
echo #   8. �ФŰ��_�}�o�̵o�榹�{���æV���u���O�ΡA�}���X�P�ϥγW���Ҧb�@�� Github ���A�w��ѷ�                          #
echo #                                                                                                                      #
echo #                                                                                                   ������T: Beta0.4  #
echo #                                                                                         �}�o�Ը�: owner@chamatw.net  #
echo #                                                                                            chamatwnetwork@gmail.com  #
echo #                                                          Copyright c 2016-2019 ChamaTW Network  All rights reserved  #
echo ##############################################   ���U���N����}�l����   ################################################
pause

:Menu0
cls
color 03
echo ###################################################   �B�J�@ - ��ܱЫ�   ##############################################
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #           �п�J�Ҧb�ЫǡA�H�K�t�ΨM�w�ϥέ��ؤ�k����                                                               #
echo #                                                                                                                      #
echo #            1) �T�@��  (���ճq�L)                                                                                     #
echo #                                                                                                                      #
echo #            2) �T�G��  (���ճq�L)                                                                                     #
echo #                                                                                                                      #
echo #            3) �T�T��  (�|�ݷs�W)                                                                                     #
echo #                                                                                                                      #
echo #            4) �T�T��  (�|���s�W)                                                                                     #
echo #                                                                                                                      #
echo #            5) ���}���{��                                                                                             #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                   ������T: Beta0.4  #
echo #                                                                                         �}�o�Ը�: owner@chamatw.net  #
echo #                                                                                            chamatwnetwork@gmail.com  #
echo #                                                          Copyright c 2016-2019 ChamaTW Network  All rights reserved  #
echo ########################################   �b�U����J�N�X��A�{���|�~�����   ##########################################
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
echo ###################################################      ���~   ########################################################
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
echo #                                           �A������? ��J�@�ӥ��T���Ʀr                                               #
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
echo ####################################################   �T�@��    #######################################################
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #    ���Ыǰt�Ƶw��s���P�n��ʱ��\��A��ϥεw��s���ɡA���{���L�k����                                                #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #    �t�~�A�T�@�����ʱ��{���|�۰ʭ��ҡA����ɽФŧ⦹���׵{������                                                      #
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
echo �еy��A���b���o���v�X...
echo ���b�ǳƱq���A���U���ɮ�......
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
echo    �U�������A�{���B�z��
timeout 2
goto :CR1-Start
:CR2
color 06
echo ####################################################   �T�G��    #######################################################
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #    ���Ыǰt�Ƴn��ʱ� / �s���\��A�Y�ݭn�q�Юv�������ɮסB���Ҽs����                                                 #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #    �Цb�ୱ�W���U�y�I�ڭ��Ҽs���A�ȡz                                                                                #
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
echo �еy��A���b���o���v�X...
echo ���b�ǳƱq���A���U���ɮ�......
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
echo    �U�������A�{���B�z��
timeout 2
goto CR2-Start
:CR1-Start
cls
color 02
echo ###########################################       ���׵{�����椤    ####################################################
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
echo ��ܡy���~: �䤣��B�z�{�ǡz �N��j�����\ �I�Y�ݵ����έ��Ҽs���ʱ��A�ȡA�Ъ����������{���Y�i
echo ########################################################################################################################
timeout /t 1
cls
color 47
echo ###########################################       �Ф�����������    ####################################################
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
echo ��ܡy���~: �䤣��B�z�{�ǡz �N��j�����\ �I�Y�ݵ����έ��Ҽs���ʱ��A�ȡA�Ъ����������{���Y�i
echo ########################################################################################################################
timeout /t 1
goto :CR1-Start
:CR2-Start
color 06
echo ###########################################       ���׵{�����椤    ####################################################
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
mklink "%userprofile%\desktop\�I�ڭ��Ҽs���A��" "C:\Program Files (x86)\ITMS\ITBC 11.0\StudentMain.exe"
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
echo ���ק����A�Y�n���s�ϥμs���A�Цܮୱ�W���U�y�I�ڭ��Ҽs���A�ȡz
echo ########################################################################################################################
pause
goto :Leave
:NotSupport
color 04
echo ####################################################   �|���䴩    #####################################################
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #    �|���䴩���ЫǡA�q�Ш��� !                                                                                        #
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
echo ####################################################   �P�¨ϥ�    #####################################################
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                                                                                                      #
echo #                                �Фť��N��Ǧ��{��������H�P��L�P�ǡA���¦X�@                                        #
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
echo #                                                                                                   ������T: Beta0.4  #
echo #                                                                                         �}�o�Ը�: owner@chamatw.net  #
echo #                                                                                            chamatwnetwork@gmail.com  #
echo #                                                          Copyright c 2016-2019 ChamaTW Network  All rights reserved  #
echo ###########################################           �����N�����}          ############################################
pause