## JimGenshinServerLauncher

### 这是一个简单的bat批处理程序，其目的为快速简单的启动Grasscutter服务端及其依赖服务，并能在客户端关闭后自动关闭服务端。

## 现支持以下功能：

 - 1.自动启动数据库

 - 2.自动启动服务端

 - 3.自动启动代理&指令生成工具

 - 4.自动启动游戏客户端

 - 5.检测游戏客户端关闭，并在这之后询问是否需要自动关闭服务端及其依赖服务

 - 6.*可配置的游戏客户端路径(实验性)*

 - 7.自动检测端口占用并解决(默认检测以下端口：27017,22101,443)

## 关于如何配置它：

 - 1.从[项目releases](https://github.com/Jimmy32767255/JimGenshinServerLauncher/releases)下载最新的”JimGenshinServerLauncher.zip“

 - 2.下载一个满足要求的Java，将其放置在“运行环境”文件夹中

 - 3.从[割草机指令生成器项目仓库](https://github.com/jie65535/GrasscutterCommandGenerator)下载指令和代理工具，将其重命名为“指令和代理工具.exe”并放置在“指令和代理工具”文件夹中

 - 4.从[mongodb官方网站](https://www.mongodb.com/)下载数据库并将其放置在“数据库”文件夹中

 - 5.从[割草机仓库](https://github.com/Grasscutters/Grasscutter)下载割草机项目并将其放置在“割草机”文件夹中

 - \\_5.1.这里指的是构建完成后的完整项目，请遵循割草机仓库的[README文件](https://github.com/Grasscutters/Grasscutter/blob/development/docs/README_zh-CN.md)自行构建

 - 6.目录应与游戏客户端目录(Genshin Impact game)在同一目录下，否则请在程序中手动指定

## 运行要求：

 - 1.**正常**的Microsoft Windows环境

 - 2.以当前用户身份运行，**不要以管理员身份运行**

## 项目未来【可能】会添加的功能:

 - 1.更多语言的版本(*若您要帮助翻译，请提交issued)

 - 2.自动备份/还原数据库

 - 3.生成配置文件

 - 4.可配置的服务端/数据库/调度端口

##### 若您要请求一个新功能，请提交issued

##### 这些功能只是有计划添加，他们在未来并非一定会被加入项目之中，请勿催更这里的功能，谢谢

## 资源使用与鸣谢：

 - 1.本启动器中的字符画由https://symbol.bqrdh.com/ascii-art/generator 生成

### 最后，编程语言没有高低贵贱之分，请不要说“脚本小子写个破批处理也敢发github”这种话，谢谢。
