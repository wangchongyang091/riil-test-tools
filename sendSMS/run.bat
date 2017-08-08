@echo off
title "Send SMS Test"%~dp0
set current_path=%~dp0.
set jdk_path=D:\jdk1.7
set java_cmd="%jdk_path%\bin\java"
::set install_bmc_path=%install_base_path%\RIIL_BMC
::if exist %install_bmc_path% (
     %java_cmd% -jar riil-sms-send-1.0-SNAPSHOT.jar %current_path%\gateway-config.properties >send.log 
     pause
if !errorlevel! NEQ 0 goto failure
::)
echo OK > result.log
:succ
exit
:failure
exit 2
