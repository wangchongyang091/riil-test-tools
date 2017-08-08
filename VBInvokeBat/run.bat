@echo off
chcp 65001
set java_command_path=D:\jdk1.7\bin
::set /p filePath =input VBScript filePath:

%java_command_path%\java VBInvoke F:\
if %errorlevel% NEQ 0 goto failure
echo Success
pause
exit
:failure
echo Fail
pause