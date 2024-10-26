# Jim Genshin Server Launcher
### 这是一个简单的bat批处理程序，被我打包成exe文件，其目的为快速简单的启动Grasscutter服务端及其依赖服务，并能在客户端关闭后自动关闭服务端。
## 现支持以下功能：
 - 1.自动启动数据库
 - 2.自动启动服务端
 - 3.自动启动代理&指令生成工具
 - 4.自动启动游戏客户端
 - 5.检测游戏客户端关闭，并在这之后询问是否需要自动关闭服务端及其依赖服务
 - 6.*可配置的游戏客户端路径(实验性)*
 - 7.自动检测端口占用并解决(默认检测以下端口：27017,22101,443)
 - 8.自动检测更新
 - 9.支持中文和英文
## 关于如何配置它： [视频演示](https://www.bilibili.com/video/BV1o4xfeSEq3)
 - 1.从[本项目Releases](https://github.com/Jimmy32767255/JimGenshinServerLauncher/releases)下载最新的”JimGenshinServerLauncher.zip“并解压缩
 - \\_1.1.目录应与游戏客户端目录(Genshin Impact game)在同一目录下，否则请在程序中手动指定
 - 2.下载一个满足割草机要求的Java，将其放置在“运行环境”文件夹中
 - \\_2.1.推荐使用[Azul优化版java17](https://www.azul.com/downloads/?version=java-17-lts&package=jdk#zulu)
 - \\__2.2.或者，使用割草机官方推荐的[Oracle原版java17](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html)
 - 3.从[割草机指令生成器项目仓库的Releases](https://github.com/jie65535/GrasscutterCommandGenerator/releases)下载指令和代理工具，将其重命名为“指令和代理工具.exe”并放置在“指令和代理工具”文件夹中
 - 4.从[MongoDB官方网站](https://www.mongodb.com/try/download/community)下载MongoDB社区版并将其放置在“数据库”文件夹中
 - 5.从[割草机仓库](https://github.com/Grasscutters/Grasscutter)下载割草机项目并将其放置在“割草机”文件夹中
 - \\_5.1.这里指的是构建完成后的完整项目，请遵照[割草机仓库的自述文件](https://github.com/Grasscutters/Grasscutter/blob/development/docs/README_zh-CN.md)自行构建
## 运行要求：
 - 1.**正常**的Microsoft Windows环境
 - \\_1.1.*未在wine上测试*
 - 2.以当前用户身份运行，**不要以管理员身份运行**
## 项目未来【可能】会添加的功能:
- [ ] 1.自动备份/还原数据库
- [ ] 2.生成割草机配置文件(复杂且无用，优先级低)
- [ ] 3.可配置的服务端/数据库/调度端口
- [ ] 4.本项目的GNU/Linux(.sh)版本(By:bilibili_UID_471254821) 这个一定不可能bat可从来没跨平台
- [ ] 5.自动设置正确的运行权限
- [ ] 6.自动识别配置文件中的端口
- [ ] 7.更多运行模式(比如仅启动服务端)
- [ ] 8.自动安装动态链接库(DLL)补丁(bypass插件)
- [ ] 9.为代码添加注释(虽然大部分人能在没有注释的情况下看懂，但为了代码规范还是加上吧){不可能一定不可能}
- [ ] 10.使用call语句让项目变得更模块化，更易于拓展
- [ ] 11.添加更多配置文件，增强可配置性
- [ ] 12.一键重置(清空)数据库


- [ ] 13.告诉你我只实现其他部分的功能，在启动方面的功能，要么不改，要么重写。
##### 若您要请求一个新功能，请提交issued
##### 这些功能只是有计划添加，但是我不一样，我必须完成，快催更吧！！！！！
## 资源使用与鸣谢：
 - 1.本启动器中的字符画由https://symbol.bqrdh.com/ascii-art/generator 生成
###### 最后，编程语言没有高低贵贱之分，请不要说“脚本小子写个破批处理也敢发github”这种话，谢谢



### 吐槽
作者写个这还内向，那我岂不是...
