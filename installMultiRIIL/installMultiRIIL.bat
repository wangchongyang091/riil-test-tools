@echo off
title %~dp0

set riil_version=_686
set ruijie_dir=%~dp0.
set jdk_dir= %ruijie_dir%\RIIL\jdk
set neo4j_dir=%ruijie_dir%\RIIL\neo4j
set Neo4jInstaller_full_name=Neo4jInstaller.bat
set Neo4jInstaller_file_path=%neo4j_dir%\bin\%Neo4jInstaller_full_name%

set mysql_dir=%ruijie_dir%\RIIL\MySQL
set InstallDBService_full_name=InstallDBService.bat
set InstallDBService_file_path=%mysql_dir%\bin\%InstallDBService_full_name%

reg query HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\RuiJie 2> nul 1>nul
if %errorlevel% equ 0 (
	reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\RuiJie /f
)
sc query RIIL_GDB_SERVER 2> nul 1>nul
if %errorlevel% equ 0 (
	sc delete RIIL_GDB_SERVER	
)
sc query RIIL_DB_SERVER 2> nul 1>nul
if %errorlevel% equ 0 (
	sc delete RIIL_DB_SERVER
)
sc query RIIL_BMC 2> nul 1>nul
if %errorlevel% equ 0 (
	sc delete RIIL_BMC
)
sc query RIIL_CCS 2> nul 1>nul
if %errorlevel% equ 0 (
	sc delete RIIL_CCS
)
sc query RIIL_Log_Server 2> nul 1>nul
if %errorlevel% equ 0 (
	sc delete RIIL_Log_Server
)
sc query RIIL_NTA_Server 2> nul 1>nul
if %errorlevel% equ 0 (
	sc delete RIIL_NTA_Server
)
::set /p riil_version=< riil_version.properties
setlocal enableDelayedExpansion
set RIIL_GDB_SERVER_NAME=RIIL_GDB_SERVER
for /f "delims=" %%i in (%Neo4jInstaller_file_path%) do (
	echo %%i | findstr %RIIL_GDB_SERVER_NAME% >nul
	if !errorlevel! equ 0 (
		set modify_row=%%i
		echo !modify_row:%RIIL_GDB_SERVER_NAME%=%RIIL_GDB_SERVER_NAME%%riil_version%!>> temp.txt
	)else (
		echo %%i>> temp.txt
	)
)
type temp.txt> %Neo4jInstaller_file_path%
del /f temp.txt
echo modify %Neo4jInstaller_file_path% success!
call %Neo4jInstaller_file_path% install %jdk_dir%

set RIIL_DB_SERVER_NAME=RIIL_DB_SERVER
for /f "delims=" %%i in (%InstallDBService_file_path%) do (
	echo %%i | findstr %RIIL_DB_SERVER_NAME% >nul
	if !errorlevel! equ 0 (
		set modify_row=%%i
		echo !modify_row:%RIIL_DB_SERVER_NAME%=%RIIL_DB_SERVER_NAME%%riil_version%!>> temp.txt
	)else (
		echo %%i>> temp.txt
	)
)
type temp.txt> %InstallDBService_file_path%
del /f temp.txt
echo modify %InstallDBService_file_path% success!
call %InstallDBService_file_path%