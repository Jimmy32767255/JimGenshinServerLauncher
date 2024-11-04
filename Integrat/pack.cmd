@echo off & chcp 65001 >nul
start "" %cd%\Tools\Bat_To_Exe_Converter.exe
ping localhost -n 10 > nul
start "" %cd%\Tools\fupx.exe
ping localhost -n 8 > nul
set /p mima="请输入密钥："
%cd%\Tools\signtool sign /f "%cd%\Tools\cert.pfx" /p %mima% "%cd%\bin\JimGenshinServerLauncher"
%cd%\Tools\signtool timestamp /t http://github.com/Qianyiaz/JimGenshinServerLauncher "%cd%\bin\JimGenshinServerLauncher"
pause