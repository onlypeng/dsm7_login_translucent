# 修改群晖7.x登陆页面登陆框主题<br>
# 此补丁适用于DS918+，其他版本没测试过，请自行查看测试<br>
# 根据自己群辉版本安装对应补丁<br>
# css文件没有删除注释和压缩，有需求自行修改
frosting.sh 为磨砂玻璃效果<br>
transparent.sh 为黑色透明效果<br>
参数 1为替换，2为还原<br>
例如磨砂效果安装：<br>
    上传脚本的路径 可在File Station 右键点击frosting.sh脚本-属性-位置 获取
    方法1： <br>
        0、上传脚本到群晖 <br>
        1、开启ssh并进入群晖后台 <br>
        2、sudo -i  切换root用户 <br>
        3、cd 《上传脚本的路径》 <br>
        4、chmod 755 frosting.sh 赋予脚本运行权限 <br>
        5、./frosting.sh 1 运行脚本替换 <br>
        6、./frosting.sh 2 运行脚本还原 <br>
    方法2： <br>
        0、上传脚本到群晖 <br>
        1、打开控制面板-任务计划 <br>
        2、新增-计划的任务-用户定义的脚本 <br>
        3、常规：任务名称：随意写，用户账号选root，取消勾选已启动<br>
        4、任务设置：运行命令：上传脚本的路径/frosting.sh 1 >> 上传脚本的路径/log.txt 2>&1 <br>
        5、点击确定，右击创建的任务，运行，查看日志是否替换成功 <br>
        6、还原补丁更改运行命令为：上传脚本的路径/frosting.sh 2 >> 上传脚本的路径/log.txt 2>&1 <br>
<br>

文件路径：<br>
    gif: 批准登录动图原文件
    patch：文件补丁
    backups： 第一次替换后生成的目录，里面存放替换文件的备份
    backups(未修改文件)： 给替换过文件，但没保存原文件的用，使用方法安装一次补丁，然后把backups(未修改文件)中文件复制并覆盖到backups文件夹中。
<br>

备注：本人ps菜的扣脚，gif动图存在瑕疵，会ps的大神可自己在在gif目录下载动图修改后替换patch文件中动图
# 显示效果： <br>
![202305071424291 (1)](https://user-images.githubusercontent.com/29589598/236661896-76aca08d-14af-4ebe-a483-35c26a437120.png)
![202305071424291 (2)](https://user-images.githubusercontent.com/29589598/236661803-e4d84860-aec6-4424-aadc-c98167e14f66.png)
![20230507110327](https://user-images.githubusercontent.com/29589598/236655506-a8e60ab3-bc24-45be-a804-814b4b850aac.png)
![202305071103271](https://user-images.githubusercontent.com/29589598/236655511-4a946a1e-096b-4746-adfb-02975fb867db.png)
