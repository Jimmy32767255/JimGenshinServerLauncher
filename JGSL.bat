::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcBODMmy2A7wgzO3o5P6IsnE6XfY3bY3n8L2DB+Ud+U3te6UoxGxfiucNGRVbdhe5UiUTmkJ+umWLMPuZvTD0WQaF50U3ew==
::fBE1pAF6MU+EWHreyHcjLQlHcBODMmy2A7wgzO3o5P6IsnE6XfY3bY3n8L2DB+Ud+U3te6UoxGxfiucNGRVbdhe5UiUTmkJ+umWLMPuGuzDiRAaF50U3ew==
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFAxVQgOOOWKGIrAP4/z0/9agq1kVQeADUobW/bGAM+ga5HbhZ4AoxFZbjcUPBB5KQjulegozu29Wik2GOPuashnoSUeHqEIzFAU=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSTk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbAs=
::ZQ05rAF9IAHYFVzEqQIaIRZzSQqRNGK0NbAO/u3pw+uSrE4VUfBf
::eg0/rx1wNQPfEVWB+kM9LVsJDC6LMUy/CKYU4ebI6viRp18xVfcxe4feyNQ=
::fBEirQZwNQPfEVWB+kM9LVsJDC6LMUy/CKYU4ebI6viRp18xVfcxe4feyNQ=
::cRolqwZ3JBvQF1fEqQIaIRZzSQqRNGK0NbAO/u3pw+uSrE4VUfBf
::dhA7uBVwLU+EWPtNxVsqaEkEHlDi
::YQ03rBFzNR3SWATEVosBMQEUHlTQaAs=
::dhAmsQZ3MwfNWATEVosBMQEUHlTQaAs=
::ZQ0/vhVqMQ3MEVWAtB9witJlVR7CbjvoUtU=
::Zg8zqx1/OA3MEVWAtB9witJlVR7CbjvoUtU=
::dhA7pRFwIByZRRkCA4JQ
::Zh4grVQjdCyDJGyX8VAjFAxVQgOOOWKGIrAP4/z0/9agq1kVQeADUobW/bGAM+ga5HbhZ4AoxFZbjcUPBB5KQjulegozu29WikaMOfu2ugLGT0aa7kI+KGBmkWbCoCoubtBgn9FN1ji7nA==
::YB416Ek+Zm8=
::
::
::978f952a14a936cc963da21a135fa983
:restart
@echo off & setlocal enabledelayedexpansion
cls & color 27 & chcp 65001 >nul

set JGSL=%cd%\JGSL
set config=%JGSL%\.config
set lang_folder=%JGSL%\lang
set Api.Github=https://api.github.com/repos/Qianyiaz/JimGenshinServerLauncher/releases/latest
set tempfile=%JGSL%\github.json

move "zh_cn.lang" "%lang_folder%"
move "en_us.lang" "%lang_folder%"

Title %ys-44%
curl -s -o "%tempfile%" %Api.Github%
if %errorlevel% neq 0 (
    goto lang
)

for /f "tokens=2 delims=:, " %%B in ('type "%tempfile%" ^| findstr /i "tag_name"') do (
    set l=%%B
    set l=!l:"=!
)

for /f "tokens=2* delims=: " %%C in ('findstr /i "browser_download_url" "%tempfile%"') do (
set "download_url=%%D"
set "download_url=!download_url:"=!"
)

del %tempfile%

for /f "tokens=1,2,3 delims=." %%a in ("%Version%") do (
    set /a C_M=%%a
    set /a C_M=%%b
    set /a C_P=%%c
)

for /f "tokens=1,2,3 delims=." %%a in ("%l%") do (
    set /a L_M=%%a
    set /a L_M=%%b
    set /a L_P=%%c
)

if !L_M! gtr !C_M! (
    goto Download
) else if !L_M! equ !C_M! (
    if !L_M! gtr !C_M! (
        goto Download
    ) else if !L_M! equ !C_M! (
        if !L_P! gtr !C_P! (
            goto Download
        )
    )
)
:lang
set "content="
for /f "usebackq delims=" %%A in ("%config%") do ( set "content=!content!%%A")
echo !content! | find /i "lang" > nul
if errorlevel 1 (
    :cl
    cls
    (
    mkdir "%JGSL%"
    mkdir "%lang_folder%"
    move "zh_cn.lang" "%lang_folder%"
    move "en_us.lang" "%lang_folder%"
    ) >>nul 2>&1
    Color 08
    type nul > %config%
    (
    echo Version=1.0.0
    echo Count=0
    ) >> %config%
    echo.
    echo            Please choose your language:
    echo                     [1] Chinese-s           
    echo                     [2] English
    echo.
    set /p langn="Enter your choice: "
    
    if "%langn%"=="1" (
        set "selected_lang=zh_cn"
        echo Lang=zh_cn>> "%config%"
    ) else if "%langn%"=="2" (
        set "selected_lang=en_us"
        echo Lang=en_us>> "%config%"
    ) else (
        echo Invalid choice. Please try again. 
        timeout /t 2 > nul
        goto cl
    )
)

for /f "tokens=1,* delims==" %%a in (%config%) do ( set "%%a=%%b")
for /f "tokens=1,* delims==" %%a in (%lang_folder%\%Lang%.lang) do ( set "%%a=%%b")

title %ys-1%
echo %ys-2%
echo %ys-3%
if not exist "..\genshin impact game\genshinimpact.exe" (
    if not exist .\原神路径配置文件_请勿修改或删�?txt (
        goto :errorgameunfind
    )
)
if exist .\原神路径配置文件_请勿修改或删�?txt (
    set /p game=<.\原神路径配置文件_请勿修改或删�?txt
    goto :cfg
)
set game=..\"genshin impact game"\genshinimpact.exe

:cfg
echo %ys-4%
echo %ys-5%
ver
echo %ys-6%~dp0
echo %ys-7%
echo ▁▂▃▄▅▆▇█▉▊▋▌▍▎�??�?
echo ??
echo ABCDEFGHIJKLMNOPQRSTUVWXYZ
echo ,./;:'"\|[{]}-_=+`~/*!@#$%^&*()
timeout 3 > nul
cls
title %ys-8%
echo ------------------------------
echo                                                                                   ██                
echo                                                                                   ██                
echo                                                                                   ██                
echo                                                                                   ██                
echo                                                                                   ██�?              
echo                                                                                  ████               
echo                                                                                  ████               
echo            �?                                            �?                      ████�?             
echo           ██                                             ██                     ██████              
echo          ████                                           ██�?                   ████████             
echo        ████████                                       ████████               ████████████           
echo     ████████████████████████████████████████████████████████████�?        ██████████████████        
echo        ████████�?            ████                     ██████�?                 ████████             
echo         ██████�?           ██████�?                     ██�?  ██                 ████               
echo         ██████�? ██████�?    ████     ██████�?           ████████�? ██████�?     ██�?     ████████  
echo         ██████�? ████████████████████████████�? ██████████████████�?████████████████████████████████
echo         ██████�? ██████�?             ██████�?  ██████ ████████████████████�?    ████     ████████  
echo         ██████�? ██████�?             ██████�?  ██████ ██████       ████████    ██████�?  ████████  
echo         ██████�? ████████████████████ ██████�?  ██████ ██████ ████  ██████████████████████████████  
echo         ██████�? ██████�?             ██████�?  ██████ ████████████ ██████████████████████████████  
echo         ██████�? ██████�?             ██████�?  ██████ ██████ ████�?████████   ████████   ████████  
echo        ████████  ████████████████████████████   ██████ ██████ ████�?████████     ████�?   ████████  
echo        ██████�?  ██████     ██████�?  ██████�?  ██████ ██████ ████�?██████████████████████████████  
echo        ██████�?  ██         ██████�?            ██████ ██████ ████  ██████████████████████████████  
echo        ██████      ████�?   ██████�?  ██████    ████�? ██████ ██�?  ██████�?     ████      ██████�? 
echo       ██████  ████████████�?██████�?████████████████�? ██████       ████        ██████        ████  
echo      ████�? ██████████████  ██████  ████████████████   ██████                ████████████           
echo     ████�?  ██████          ██████�?        ██████�?   ██████              ████████████████         
echo    ██�?       ████          ██████          ████       ██████                 ██████████            
echo  �?                 ████    ██████     ██�?            ████�?                  ████████             
echo                             ████                       ████                     ██████              
echo                             ██                         ██                       ██████              
echo                                                                                  ████               
echo                                                                                  ████               
echo                                                                                  ████               
echo                                                                                   ██�?              
echo                                                                                   ██                
echo                                                                                   ██                
echo                                                                                   ██                
echo                                                                                   ██                
echo                                                                                   ██                
echo                                                                                   ██                
echo %ys-9%
echo %ys-10%%date%
echo %ys-11%%time%
echo %ys-12%
echo %ys-13%
echo %ys-14%
echo %ys-15%
echo %ys-16%
pause > nul
cls
title %ys-17%
echo %ys-18%
for /f "tokens=2,4,5" %%a in ('netstat -ano^|find /i ":27017 "') do (
    if not "%%c"=="" (
        set pid=%%c
    ) else (
        set pid=%%b
    )
)
for /f "tokens=1" %%a in ('tasklist /fi "pid eq %pid%"') do set prog=%%a
echo %ys-19%%port%
echo %ys-20%%pid%
echo %ys-21%%prog%
echo %ys-22%
taskkill /f /fi "pid eq %pid%"
echo %ys-23%
echo %ys-16%
cd 数据�?
echo %ys-24%
start /min mongod.exe --dbpath data --port 27017
echo %ys-25%
cd ..
cd %ys-26%
echo %ys-16%
echo %ys-27%
start 指令和代理工�?exe
echo %ys-28%
cd ..
echo %ys-16%
echo %ys-29%
for /f "tokens=2,4,5" %%a in ('netstat -ano^|find /i ":443 "') do (
    if not "%%c"=="" (
        set pid=%%c
    ) else (
        set pid=%%b
    )
)
for /f "tokens=1" %%a in ('tasklist /fi "pid eq %pid%"') do set prog=%%a
echo %ys-19%%port%
echo %ys-20%%pid%
echo %ys-21%%prog%
echo %ys-22%
taskkill /f /fi "pid eq %pid%"
echo %ys-29%
echo %ys-16%
echo %ys-30%
for /f "tokens=2,4,5" %%a in ('netstat -ano^|find /i ":22101 "') do (
    if not "%%c"=="" (
        set pid=%%c
    ) else (
        set pid=%%b
    )
)
for /f "tokens=1" %%a in ('tasklist /fi "pid eq %pid%"') do set prog=%%a
echo %ys-19%%port%
echo %ys-20%%pid%
echo %ys-21%%prog%
echo %ys-22%
taskkill /f /fi "pid eq %pid%"
echo %ys-30%
echo %ys-16%
cd 割草�?
echo %ys-31%
timeout 3 >nul
start /high ..\运行环境\bin\java.exe -jar 割草机核�?jar
echo %ys-32%
echo %ys-16%
cd ..
color 17
title %ys-33%
echo %ys-34%
echo %ys-16%
start /high /wait %game%
set select1=y
cls
echo. & set /p select1="%ys-35%"
cls
echo %ys-16%
if \"%select1%\"==\"y\" (
    color 67
    title %ys-36%
    echo %ys-37%
    taskkill /im 指令和代理工�?exe /t /f
    echo %ys-38%
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
    echo %ys-39%
    taskkill /im java.exe /t /f
    echo %ys-40%
    taskkill /im mongod.exe /t /f
if \"%select1%\"==\"n\" (
    color 67
    title %ys-41%
    echo %ys-42%
    exit
)
echo %ys-43%
echo %ys-16%
timeout 3 > nul
exit

:errorgameunfind
cls
color 47
title Error Occurred: Game Not Found
set select2=1
echo %ys-16%
echo An error occurred that cannot be processed automatically, JGSL cannot continue running.
echo Error: Game Not Found
echo Error Code: error_game_unfind(0x0001)
echo If you seek assistance, please provide the above information to the technician.
echo This may be due to an incorrect installation path or the game executable being renamed. The following actions may help resolve this issue:
echo 1. Ensure that JGSL's main folder (jimgenshinserverlauncher) and the main folder of Genshin Impact (genshin impact game) are in the same directory.
echo 2. Ensure that the main folder of Genshin Impact (genshin impact game) contains the game's executable (genshinimpact.exe).
echo 3. You can also manually specify the location of the game's executable.
echo ------------------------------
echo.&set /p select2=You can now enter “e�?to exit JGSL or input the path to the game's executable. Please note that folders with spaces should be enclosed in double quotes, for example, “d:\program files\genshin impact game\genshinimpact.exe�?
echo ------------------------------
if "%select2%"=="e" exit
if "%select2%"=="e" exit
echo %select2% > .\原神路径配置文件_请勿修改或删�?txt
color 67
title Restarting
echo Successfully set "%select2%" as the path to the game's executable, JGSL will automatically restart in 3 seconds!
timeout 3 >nul
goto restart

:Download
powershell Invoke-WebRequest -Uri "https:%download_url%" -OutFile "%JGSL%/JimGenshinServerLauncher.exe"
if %errorlevel% neq 0 (
    echo !ys-46!
    goto Download
) else (
    echo !ys-45!
)
pause
rmdir /s /q "%CF%"
start "" cmd /c "@echo off & del %JGSL% &  move "%JGSL%/JimGenshinServerLauncher.exe" "%cd%" & start %cd%/JimGenshinServerLauncher.exe"
exit
