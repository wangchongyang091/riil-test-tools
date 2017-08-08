@echo off
set java_command=D:\jdk1.7\bin\java
echo Running...
echo .
echo Five minutes to perform once, please check the result.log
(
	echo -----------------start-%date% %time%---------------------
	%java_command% -jar script-moni-direct-1.0-SNAPSHOT.jar
) >> result.log
