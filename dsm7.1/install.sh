#!/bin/bash
# 配置路径信息自动替换相关文件

set -e 

# 获取脚本位置
script_dir=$(cd $(dirname $0);pwd)
echo "该脚本只在第一运行替换时备份原文件，请勿删除当前目录下《 backups 》目录和目录内文件，如果脚本和文件更新请先利用当前脚本还原文件再重新替换。"
echo "该脚本只在第一运行替换时备份原文件，请勿删除当前目录下《 backups 》目录和目录内文件，如果脚本和文件更新请先利用当前脚本还原文件再重新替换。"
echo "该脚本只在第一运行替换时备份原文件，请勿删除当前目录下《 backups 》目录和目录内文件，如果脚本和文件更新请先利用当前脚本还原文件再重新替换。"

# 替换配置 [以paths为根，替换文件位置]=被替换的文件位置
declare -A paths
paths["login.css"]="/usr/syno/synoman/webman/login/css/login.css"
paths["login.css.gz"]="/usr/syno/synoman/webman/login/css/login.css.gz"
paths["1bc43875501e55e5e741e427ca50dbdf.png"]="/usr/syno/synoman/webman/login/assets/1bc43875501e55e5e741e427ca50dbdf.png"
paths["SecureSignInLogin.css"]="/usr/syno/synoman/webman/3rdparty/SecureSignIn/SecureSignInLogin.css"
paths["SecureSignInLogin.css.gz"]="/usr/syno/synoman/webman/3rdparty/SecureSignIn/SecureSignInLogin.css.gz"
paths["68b2c5f5747c3085bba5dd628b90ae0f.gif"]="/usr/syno/synoman/webman/3rdparty/SecureSignIn/assets/68b2c5f5747c3085bba5dd628b90ae0f.gif"
paths["addc28996dad298560fd62666efd5c0b.gif"]="/usr/syno/synoman/webman/3rdparty/SecureSignIn/assets/addc28996dad298560fd62666efd5c0b.gif"

# 检查替换相关文件是否都存在
for name in ${!paths[*]}
do
    if [[ ! -f ${script_dir}/patch/${name} ]]; then
        echo "${script_dir}/patch/${name}文件不存在，请检查路径配置或版本是否匹配"
        exis 0
    fi
    if [[ ! -f ${paths[${name}]} ]]; then
        echo "${paths[${name}]}文件不存在，请检查路径配置或版本是否匹配"
        exis 0 
    fi
done


while true
do
    read -r -p "1：安装替换补丁 2：还原补丁 q：退出脚本 [1/2/q] " input
    case $input in
        1)
            if [[ ! -d ${script_dir}/backups ]]; then
                mkdir ${script_dir}/backups
                echo "第一次运行，开始备份原文件"
                for name in ${!paths[*]}
                do
                    cp ${paths[${name}]} ${script_dir}/backups/${name}
                done
                echo "文件备份完成，请勿删除《 backups 》目录和目录内文件"
            fi
            echo "开始替换文件"
            for name in ${!paths[*]}
            do
                cp ${script_dir}/patch/${name} ${paths[${name}]}
            done
            echo "替换完成，退出脚本"
            exit 1
            ;;
        2)
            local isexis=''
            echo "检查备份文件是否完整"
            for name in ${!paths[*]}
            do
                if [[ ! -f ${script_dir}/patch/${name} ]]; then
                    echo "${script_dir}/patch/${name}文件不存在，请检查路径配置或版本是否匹配"
                    isexis='true'
                fi
            done
            if [[ -z ${isexis} ]];then
                echo "备份文件不全，请检查备份文件或版本是否匹配"
            fi
            echo "开始还原文件"
            for name in ${!paths[*]}
            do
                cp ${script_dir}/backups/${name} ${paths[${name}]}
            done
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