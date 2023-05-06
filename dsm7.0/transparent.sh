#!/bin/bash
# 配置路径信息自动替换相关文件

set -e 

par=$1
if  [[ -n $par && "$par" != "1" && "$par" != "2" ]]; then
    echo "参数错误"
    exit 1
fi

# 获取脚本位置
script_dir=$(cd $(dirname $0);pwd)
echo $script_dir
echo "请勿删除当前目录下《 backups 》目录和目录内文件，如果脚本和文件更新请先利用当前脚本还原文件再重新替换。"
echo "请勿删除当前目录下《 backups 》目录和目录内文件，如果脚本和文件更新请先利用当前脚本还原文件再重新替换。"
echo "请勿删除当前目录下《 backups 》目录和目录内文件，如果脚本和文件更新请先利用当前脚本还原文件再重新替换。"

patch_name="transparent"

# 替换配置 [以patch为根，替换文件位置]=被替换的文件位置
declare -A patch
paths["login.css"]="/usr/syno/synoman/webman/login/css/login.css"
paths["login.css.gz"]="/usr/syno/synoman/webman/login/css/login.css.gz"
paths["1bc43875501e55e5e741e427ca50dbdf.png"]="/usr/syno/synoman/webman/login/assets/1bc43875501e55e5e741e427ca50dbdf.png"
paths["944a992fb1e17b455579f66f923313fb.png"]="/usr/syno/synoman/webman/login/assets/944a992fb1e17b455579f66f923313fb.png"
paths["SecureSignInLogin.css"]="/usr/syno/synoman/webman/3rdparty/SecureSignIn/SecureSignInLogin.css"
paths["SecureSignInLogin.css.gz"]="/usr/syno/synoman/webman/3rdparty/SecureSignIn/SecureSignInLogin.css.gz"
paths["68b2c5f5747c3085bba5dd628b90ae0f.gif"]="/usr/syno/synoman/webman/3rdparty/SecureSignIn/assets/68b2c5f5747c3085bba5dd628b90ae0f.gif"
paths["addc28996dad298560fd62666efd5c0b.gif"]="/usr/syno/synoman/webman/3rdparty/SecureSignIn/assets/addc28996dad298560fd62666efd5c0b.gif"

patch_path="${script_dir}/patch/${patch_name}"
backups_path="${script_dir}/backups"

# 检查替换相关文件是否都存在
isexis=''
for name in ${!patch[*]}
do
    if [[ ! -f ${patch_path}/${name} ]]; then
        echo "【${patch_path}/${name}】补丁文件不存在"
        isexis='true'
    fi
    if [[ ! -f ${patch[${name}]} ]]; then
        echo "【${patch[${name}]}】系统文件不存在"
        isexis='true'
    fi
done

if [[ -n ${isexis} ]];then
    echo "文件不全，请检查文件或系统版本是否匹配"
    exit 1
fi

function backups() {
    mkdir ${backups_path}
    echo "开始备份文件"
    for name in ${!patch[*]}
    do
        cp ${patch[${name}]} ${backups_path}/${name}
    done
    mkdir ${backups_path}/${patch_name}
    echo "文件备份完成，请勿删除《 backups 》目录和目录内文件"
}

function install() {
     # 检查是否存在备份文件
    if [[ -d ${backups_path} ]]; then
        # 检查是否为当前脚本备份文进
        if [[ -d ${backups_path}/${patch_name} ]]; then
            echo "开始替换文件"
            for name in ${!patch[*]}
            do
                cp ${patch_path}/${name} ${patch[${name}]}
            done
            echo "替换完成"
        else
            echo "已安装不同版本补丁，还原后重新安装"
        fi
    else
        backups
        echo "开始替换文件"
        for name in ${!patch[*]}
        do
            cp ${patch_path}/${name} ${patch[${name}]}
        done
        echo "替换完成"
    fi
        
}


function reduction() {
    # 检查是否存在备份文件
    if [[ -d ${backups_path} ]]; then
        # 检查是否为当前脚本备份文进
        if [[ -d ${backups_path}/${patch_name} ]]; then
            echo "检查备份文件是否完整"
            for name in ${!patch[*]}
            do
                if [[ ! -f ${backups_path}/${name} ]]; then
                    echo "${backups_path}/${name}文件不存在"
                    isexis='true'
                fi
            done
            if [[ -z ${isexis} ]];then
                echo "开始还原文件"
                for name in ${!patch[*]}
                do
                    cp ${backups_path}/${name} ${patch[${name}]}
                done
                # 删除备份
                rm -rf ${backups_path}  
                echo "还原完成"
            else
                echo "备份文件不全，请检查备份文件或版本是否匹配"
            fi
        else
            echo "当前备份文件不是该脚本生成,请还原后重新安装补丁"
        fi
    else
        echo "不存在备份文件"
    fi
}
while true
do
    if [[ -n $par ]]; then
        input="$par"
    else
        read -r -p "1：安装替换补丁 2：还原补丁 q：退出脚本 [1/2/q] " input
    fi
    case $input in
        1)  
            install
            ;;
        2)
            reduction
            ;;
        [qQ])
            echo "退出脚本"
            exit 0
            ;;  
        *)
            echo "输入指令错误，重新输入..."
            ;;
    esac
    if [[ -n $par ]]; then
        exit 0
    fi
done