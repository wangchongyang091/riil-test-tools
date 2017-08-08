@echo off
title %~dp0
chcp 65001 > nul

set ruijie_dir=%~dp0..
set backup_dir=%~dp0backup
set replace_dir=%ruijie_dir%\update\replace\
set logs_dir=%~dp0logs
set update_log=%logs_dir%\update.log
set restore_log=%logs_dir%\restore.log

set ccs=CCS
set bmc=BMC

set backup=备份
set delete=删除
set add=添加
set success=success
set fail=fail
set create=创建
set restore=还原
set not_exist=不存在

set restore_success_info=文件还原执行成功，请按任意键退出...
set restore_error_info=文件还原执行失败，请查看logs\result.log ...
set replace_error_info=文件替换执行失败，请查看logs\result.log ...
set replace_success_info=文件替换执行成功，请按任意键退出 ...
if not exist %logs_dir% (
	md %logs_dir%
)