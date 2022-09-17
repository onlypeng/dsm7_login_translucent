#!/bin/bash

script_dir=$(cd $(dirname $0);pwd)
echo "该脚本只在第一运行替换时备份原文件，请勿删除当前目录下《 backups 》目录和目录内文件，如果脚本和文件更新请先利用当前脚本还原文件再重新替换。"
echo "该脚本只在第一运行替换时备份原文件，请勿删除当前目录下《 backups 》目录和目录内文件，如果脚本和文件更新请先利用当前脚本还原文件再重新替换。"
echo "该脚本只在第一运行替换时备份原文件，请勿删除当前目录下《 backups 》目录和目录内文件，如果脚本和文件更新请先利用当前脚本还原文件再重新替换。"

while true
do
    read -r -p "1：安装替换补丁 2：还原补丁 q：退出脚本 [1/2/q] " input
    case $input in
        1)
            if [[ ! -d ${script_dir}/backups ]]; then
                mkdir ${script_dir}/backups
                echo "第一次运行，开始备份原文件"
                cp /usr/syno/synoman/webman/login/css/login.css ${script_dir}/backups/login.css
                cp /usr/syno/synoman/webman/login/css/login.css.gz ${script_dir}/backups/login.css.gz
                cp /usr/syno/synoman/webman/login/assets/1bc43875501e55e5e741e427ca50dbdf.png ${script_dir}/backups/1bc43875501e55e5e741e427ca50dbdf.png
                cp /usr/syno/synoman/webman/3rdparty/SecureSignIn/SecureSignInLogin.css ${script_dir}/backups/SecureSignInLogin.css
                cp /usr/syno/synoman/webman/3rdparty/SecureSignIn/SecureSignInLogin.css.gz ${script_dir}/backups/SecureSignInLogin.css.gz
                cp /usr/syno/synoman/webman/3rdparty/SecureSignIn/assets/68b2c5f5747c3085bba5dd628b90ae0f.gif ${script_dir}/backups/68b2c5f5747c3085bba5dd628b90ae0f.gif
                cp /usr/syno/synoman/webman/3rdparty/SecureSignIn/assets/addc28996dad298560fd62666efd5c0b.gif ${script_dir}/backups/addc28996dad298560fd62666efd5c0b.gif
                echo "文件备份完成，请勿删除《 backups 》目录和目录内文件"
            fi
            echo "开始替换文件"
                cp ${script_dir}/patch/login.css /usr/syno/synoman/webman/login/css/login.css
                cp ${script_dir}/patch/login.css.gz /usr/syno/synoman/webman/login/css/login.css.gz
                cp ${script_dir}/patch/1bc43875501e55e5e741e427ca50dbdf.png /usr/syno/synoman/webman/login/assets/1bc43875501e55e5e741e427ca50dbdf.png
                cp ${script_dir}/patch/SecureSignInLogin.css /usr/syno/synoman/webman/3rdparty/SecureSignIn/SecureSignInLogin.css
                cp ${script_dir}/patch/SecureSignInLogin.css.gz /usr/syno/synoman/webman/3rdparty/SecureSignIn/SecureSignInLogin.css.gz
                cp ${script_dir}/patch/68b2c5f5747c3085bba5dd628b90ae0f.gif /usr/syno/synoman/webman/3rdparty/SecureSignIn/assets/68b2c5f5747c3085bba5dd628b90ae0f.gif
                cp ${script_dir}/patch/addc28996dad298560fd62666efd5c0b.gif /usr/syno/synoman/webman/3rdparty/SecureSignIn/assets/addc28996dad298560fd62666efd5c0b.gif
            echo "替换完成，退出脚本"
            exit 1
            ;;
        2)
            echo "开始还原文件"
                cp ${script_dir}/backups/login.css /usr/syno/synoman/webman/login/css/login.css
                cp ${script_dir}/backups/login.css.gz /usr/syno/synoman/webman/login/css/login.css.gz
                cp ${script_dir}/backups/1bc43875501e55e5e741e427ca50dbdf.png /usr/syno/synoman/webman/login/assets/1bc43875501e55e5e741e427ca50dbdf.png
                cp ${script_dir}/backups/SecureSignInLogin.css /usr/syno/synoman/webman/3rdparty/SecureSignIn/SecureSignInLogin.css
                cp ${script_dir}/backups/SecureSignInLogin.css.gz /usr/syno/synoman/webman/3rdparty/SecureSignIn/SecureSignInLogin.css.gz
                cp ${script_dir}/backups/68b2c5f5747c3085bba5dd628b90ae0f.gif /usr/syno/synoman/webman/3rdparty/SecureSignIn/assets/68b2c5f5747c3085bba5dd628b90ae0f.gif
                cp ${script_dir}/backups/addc28996dad298560fd62666efd5c0b.gif /usr/syno/synoman/webman/3rdparty/SecureSignIn/assets/addc28996dad298560fd62666efd5c0b.gif
            rm -rf ${script_dir}/backups
            echo "还原完成，退出脚本"
            exit 1               
            ;;
        [qQ])
            echo "退出脚本"
            exit 1 
            ;;   
        *)
            echo "输入指令错误，重新输入..."
            ;;
    esac
done