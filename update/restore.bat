call set_env.bat
setlocal enableDelayedExpansion
(
	echo -------------------------------Restoring-------------------------------
	for /f "eol=# tokens=1,2,3 delims=:" %%i in (config.properties) do (
		if D neq %%k (
			if exist %backup_dir%%%j%%i (
				del %ruijie_dir%%%j%%i
				if not exist %ruijie_dir%%%j%%i (
					echo %%j%%i %delete% %success%
					copy /Y %backup_dir%%%j%%i %ruijie_dir%%%j
					if exist %ruijie_dir%%%j%%i (
						echo %%j%%i %add% %success% 
					) else (
						echo %%j%%i %add% %fail%
					)
				) else (
					echo %%j%%i %delete% %fail%
				)
			) else (
				echo %%j%%i %backup% %not_exist% %fail%
			)
			echo #####################
		)
	) 
	echo ---------------At the end of %date% %time%-----------------
) > %restore_log%
findstr %fail% %restore_log%
if !errorlevel! == 0 goto fail
echo %restore_success_info%
pause > nul
exit

:fail
echo %restore_error_info%
pause > nul
