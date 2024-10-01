:restart
@echo off
setlocal enabledelayedexpansion
cls
color 27
title 检测中
echo 正在检测运行环境，请稍后...
echo 正在检测游戏主程序...
if not exist "..\genshin impact game\genshinimpact.exe" (
    if not exist .\原神路径配置文件_请勿修改或删除.txt (
        goto :errorgameunfind
    )
)
if exist .\原神路径配置文件_请勿修改或删除.txt (
    set /p game=<.\原神路径配置文件_请勿修改或删除.txt
    goto :cfg
)
set game=..\"genshin impact game"\genshinimpact.exe
:cfg
echo 通过。
echo 系统环境：
ver
echo JGSL运行路径：%~dp0
echo 显示测试：
echo ▁▂▃▄▅▆▇█▉▊▋▌▍▎▏??▓
echo ??
echo ABCDEFGHIJKLMNOPQRSTUVWXYZ
echo ,./;:'"\|[{]}-_=+`~/*!@#$%^&*()
timeout 3 > nul
cls
title 等待启动中
echo ------------------------------
echo                                                                                   ██                
echo                                                                                   ██                
echo                                                                                   ██                
echo                                                                                   ██                
echo                                                                                   ███               
echo                                                                                  ████               
echo                                                                                  ████               
echo            █                                             █                       █████              
echo           ██                                             ██                     ██████              
echo          ████                                           ███                    ████████             
echo        ████████                                       ████████               ████████████           
echo     █████████████████████████████████████████████████████████████         ██████████████████        
echo        █████████             ████                     ███████                  ████████             
echo         ███████            ███████                      ███   ██                 ████               
echo         ███████  ███████     ████     ███████            █████████  ███████      ███      ████████  
echo         ███████  █████████████████████████████  ███████████████████ ████████████████████████████████
echo         ███████  ███████              ███████   ██████ █████████████████████     ████     ████████  
echo         ███████  ███████              ███████   ██████ ██████       ████████    ███████   ████████  
echo         ███████  ████████████████████ ███████   ██████ ██████ ████  ██████████████████████████████  
echo         ███████  ███████              ███████   ██████ ████████████ ██████████████████████████████  
echo         ███████  ███████              ███████   ██████ ██████ █████ ████████   ████████   ████████  
echo        ████████  ████████████████████████████   ██████ ██████ █████ ████████     █████    ████████  
echo        ███████   ██████     ███████   ███████   ██████ ██████ █████ ██████████████████████████████  
echo        ███████   ██         ███████             ██████ ██████ ████  ██████████████████████████████  
echo        ██████      █████    ███████   ██████    █████  ██████ ███   ███████      ████      ███████  
echo       ██████  █████████████ ███████ █████████████████  ██████       ████        ██████        ████  
echo      █████  ██████████████  ██████  ████████████████   ██████                ████████████           
echo     █████   ██████          ███████         ███████    ██████              ████████████████         
echo    ███        ████          ██████          ████       ██████                 ██████████            
echo  █                  ████    ██████     ███             █████                   ████████             
echo                             ████                       ████                     ██████              
echo                             ██                         ██                       ██████              
echo                                                                                  ████               
echo                                                                                  ████               
echo                                                                                  ████               
echo                                                                                   ███               
echo                                                                                   ██                
echo                                                                                   ██                
echo                                                                                   ██                
echo                                                                                   ██                
echo                                                                                   ██                
echo                                                                                   ██                
echo 你好，旅行者。
echo 当前日期：%date%
echo 当前时间：%time%
echo 「欢迎来到世界。」
echo 本一键启动工具由张智杰制作
echo 割草机项目地址：https://github.com/grasscutters/grasscutter
echo 割草机是开源免费软件，严禁倒买！
echo 请按任意键启动服务端！
echo ------------------------------
pause > nul
cls
title 启动中
echo 正在检查数据库端口占用并尝试解决...
for /f "tokens=2,4,5" %%a in ('netstat -ano^|find /i ":27017 "') do (
    if not "%%c"=="" (
        set pid=%%c
    ) else (
        set pid=%%b
    )
)
for /f "tokens=1" %%a in ('tasklist /fi "pid eq %pid%"') do set prog=%%a
echo 占用的端口号：%port%
echo 进程pid：%pid%
echo 进程名称：%prog%
echo 正在自动中止进程...
taskkill /f /fi "pid eq %pid%"
echo 已检测数据库端口占用并尝试解决。
echo ------------------------------
cd 数据库
echo 正在启动数据库...
start /min mongod.exe --dbpath data --port 27017
echo 已尝试启动数据库。
cd ..
cd 指令和代理工具
echo ------------------------------
echo 正在启动指令和代理工具...
start 指令和代理工具.exe
echo 已尝试启动指令和代理工具。
cd ..
echo ------------------------------
echo 正在检查服务端tcp端口占用并尝试解决...
for /f "tokens=2,4,5" %%a in ('netstat -ano^|find /i ":443 "') do (
    if not "%%c"=="" (
        set pid=%%c
    ) else (
        set pid=%%b
    )
)
for /f "tokens=1" %%a in ('tasklist /fi "pid eq %pid%"') do set prog=%%a
echo 占用的端口号：%port%
echo 进程pid：%pid%
echo 进程名称：%prog%
echo 正在自动中止进程...
taskkill /f /fi "pid eq %pid%"
echo 已检测服务端tcp端口占用并尝试解决。
echo ------------------------------
echo 正在检查服务端udp端口占用并尝试解决...
for /f "tokens=2,4,5" %%a in ('netstat -ano^|find /i ":22101 "') do (
    if not "%%c"=="" (
        set pid=%%c
    ) else (
        set pid=%%b
    )
)
for /f "tokens=1" %%a in ('tasklist /fi "pid eq %pid%"') do set prog=%%a
echo 占用的端口号：%port%
echo 进程pid：%pid%
echo 进程名称：%prog%
echo 正在自动中止进程...
taskkill /f /fi "pid eq %pid%"
echo 已检测服务端udp端口占用并尝试解决。
echo ------------------------------
cd 割草机
echo 正在启动割草机服务端...
timeout 3 >nul
start /high ..\运行环境\bin\java.exe -jar 割草机核心.jar
echo 已尝试启动服务端。
echo ------------------------------
cd ..
color 17
title 游玩中
echo 已尝试启动游戏，游戏关闭后将自动退出服务端！
echo ------------------------------
start /high /wait %game%
set select1=y
cls
echo.&set /p select1=检测到游戏已经关闭，是否退出服务端？（请输入y/n，不输入/无效输入则默认为是。）
cls
echo ------------------------------
if \"%select1%\"==\"y\" (
    color 67
    title 关闭中
    echo 正在关闭指令和代理工具...
    taskkill /im 指令和代理工具.exe /t /f
    echo 正在关闭系统代理...
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
    echo 正在关闭java服务端...
    taskkill /im java.exe /t /f
    echo 正在关闭数据库...
    taskkill /im mongod.exe /t /f
if \"%select1%\"==\"n\" (
    color 67
    title 退出中
    echo 已取消退出服务端！
    exit
)
echo 全部完成！将在3秒后退出本工具！
echo ------------------------------
timeout 3 > nul
exit
:errorgameunfind
cls
color 47
title 发生错误：游戏未找到
set select2=1
echo ------------------------------
echo 发生了一个无法自动处理的错误，JGSL无法继续运行。
echo 错误：游戏未找到
echo 错误码：error_game_unfind(0x0001)
echo 如要寻求帮助，请向技术人员提供以上信息。
echo 这可能是由于安装路径错误或游戏主程序被重命名导致的，执行以下操作有可能有助于修复此问题。
echo 1.确保JGSL的主文件夹(jimgenshinserverlauncher)与原神的主文件夹(genshin impact game)在同一目录下。
echo 2.确保原神的主文件夹(genshin impact game)中包含原神的主程序(genshinimpact.exe)。
echo 3.您也可以手动指定原神主程序的位置。
echo ------------------------------
echo.&set /p select2=您现在可以输入“e”/“e”退出JGSL，或者输入原神的主程序的路径，但请注意，带空格的文件夹请加上英文的双引号，比如“d:\program files\"genshin impact game"\genshinimpact.exe”。
echo ------------------------------
if \"%select2%\"==\"e\" exit
if \"%select2%\"==\"e\" exit
echo %select2% > .\原神路径配置文件_请勿修改或删除.txt
color 67
title 重启中
echo 成功将"%select2%"设为原神主程序路径，JGSL将在3秒后自动重启！
timeout 3 >nul
goto restart