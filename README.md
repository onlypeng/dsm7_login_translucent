# 修改群晖7.x登陆页面登陆框主题为半透明<br>
# 此补丁适用于DS918+，其他版本没测试过，请自行查看测试<br>
# 如果使用过旧版本补丁，需先使用旧版本补丁还原后再使用该脚本<br>
使用:参数 1:安装磨砂玻璃效果补丁，2:安装黑色透明效果补丁,3:卸载效果补丁<br>
上传脚本的路径 可在File Station 右键点击install.sh脚本-属性-位置 获取<br>
此脚本可直接切换效果补丁，不必卸载再替换，更改install.sh脚本中brightness参数可更改登录页面亮度<br>
方法1： <br>
    0、上传脚本到群晖 <br>
    1、开启ssh并进入群晖后台 <br>
    2、sudo -i  切换root用户 <br>
    3、cd 《上传脚本的路径》 进入脚本目录<br>
    4、chmod 755 install.sh 赋予脚本运行权限 <br>
    5、./install.sh 运行脚本替换或还原 <br>
方法2： <br>
    0、上传脚本到群晖 <br>
    1、打开控制面板-任务计划 <br>
    2、新增-计划的任务-用户定义的脚本 <br>
    3、常规：任务名称：随意写，用户账号选root，取消勾选已启动<br>
    4、任务设置：运行命令：上传脚本的路径/install.sh 参数 >> 上传脚本的路径/log.txt 2>&1 <br>
    5、点击确定，右击创建的任务，运行，查看日志是否替换或还原成功 <br>
<br>
不能请反馈值issues<br>

# 显示效果： <br>
![202305071424291 (1)](https://user-images.githubusercontent.com/29589598/236661896-76aca08d-14af-4ebe-a483-35c26a437120.png)
![202305071424291 (2)](https://user-images.githubusercontent.com/29589598/236661803-e4d84860-aec6-4424-aadc-c98167e14f66.png)
![20230507110327](https://user-images.githubusercontent.com/29589598/236655506-a8e60ab3-bc24-45be-a804-814b4b850aac.png)
![202305071103271](https://user-images.githubusercontent.com/29589598/236655511-4a946a1e-096b-4746-adfb-02975fb867db.png)
