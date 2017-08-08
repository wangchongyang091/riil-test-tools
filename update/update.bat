call set_env.bat
setlocal enableDelayedExpansion
(
	echo -------------------------------Beginning-------------------------------
	for /f "eol=# tokens=1,2,3 delims=:" %%i in (config.properties) do (
			::%%i is file
			  if D neq %%k (
				if not exist %backup_dir%%%j (
					md %backup_dir%%%j && echo %backup_dir%%%j %create% %success%|| echo %backup_dir%%%j %create% %fail%
				)
				copy /Y %ruijie_dir%%%j%%i %backup_dir%%%j
				if exist %backup_dir%%%j%%i (
					echo %%j%%i %backup% %success%
					if exist %replace_dir%%%i (
						del %ruijie_dir%%%j%%i
						if not exist %ruijie_dir%%%j%%i (
							echo %%j%%i %delete% %success%
							copy /Y %replace_dir%%%i %ruijie_dir%%%j
							if exist %ruijie_dir%%%j%%i (
								echo %%j%%i %add% %success% 
							) else (
								echo %%j%%i %add% %fail%
							)
						) else (
							echo %%j%%i %delete% %fail%
						)
					) else (
						echo %replace_dir%%%i %not_exist% %fail%
					)
				) else (
					echo %%j%%i %backup% %fail%
				)
			) else (
				dir %ruijie_dir%%%j /a:d /b | findstr "^%%i"> temp.log
				if !errorlevel! == 0 (
					set /p delDir=< temp.log
					del /f temp.log
					rd /s /q %ruijie_dir%%%j!delDir!
					if not exist %ruijie_dir%%%j!delDir! (
						echo %%j!delDir! %delete% %success%
					) else (
						echo %%j!delDir! %delete% %fail%
					)
				)else (
					echo %%j%%i %not_exist% %fail%
				)
			)
		echo #####################
	) 
	echo ---------------At the end of %date% %time%-----------------
)> %update_log% 2> nul
findstr %fail% %update_log%
if !errorlevel! == 0 goto fail

echo %replace_success_info%
pause > nul
exit

:fail
echo %replace_error_info%
pause > nul
