#!/bin/bash

par=$1
# 校验指令参数
if  [[ -n $par && "$par" != "1" && "$par" != "2" && "$par" != "3" ]]; then
    echo "参数错误"
    exit 1
fi
# 调节亮度，向上调亮，向下暗,步进0.01，
brightness=1
# 是否启用调试
isdebug=false

# 获取待替换图片和动图存放位置
patch_path="$(cd $(dirname $0);pwd)/patch"
version=$(awk -F= -v key="productversion" '$1 == key {gsub(/"/, "", $2); print $2}' '/etc/VERSION')

# 登录页文件页面位置
style=('/usr/syno/synoman/webman/login/css/login.css' \
'/usr/syno/synoman/webman/login/dist/style.css')
#登录页面选择鞥路方式页面位置
style2=('/usr/syno/synoman/webman/login/dist/586.style.css')

# 批准登录方法页面文件位置
ssl=('/usr/syno/synoman/webman/3rdparty/SecureSignIn/SecureSignInLogin.css' \
'/usr/syno/synoman/webman/3rdparty/SecureSignIn/login-dist/3.SecureSignInLogin.css' \
'/usr/syno/synoman/webman/3rdparty/SecureSignIn/login-dist/243.SecureSignInLogin.css')

# 图标文件位置
png1=('/usr/syno/synoman/webman/login/assets/1bc43875501e55e5e741e427ca50dbdf.png' \
'/usr/syno/synoman/webman/login/dist/assets/1bc43875501e55e5e741e427ca50dbdf.png' \
'/usr/syno/synoman/webman/login/dist/assets/44186a343f9925a2e1a5.png')
png2=('/usr/syno/synoman/webman/login/assets/944a992fb1e17b455579f66f923313fb.png' \
'/usr/syno/synoman/webman/login/dist/assets/944a992fb1e17b455579f66f923313fb.png' \
'/usr/syno/synoman/webman/login/dist/assets/29e0c870c4932c96ed18.png')
# 手机动图位置
gif1=('/usr/syno/synoman/webman/3rdparty/SecureSignIn/assets/68b2c5f5747c3085bba5dd628b90ae0f.gif' \
'/usr/syno/synoman/webman/3rdparty/SecureSignIn/login-dist/assets/68b2c5f5747c3085bba5dd628b90ae0f.gif' \
'/usr/syno/synoman/webman/3rdparty/SecureSignIn/login-dist/assets/3a1a4fef7fa3c5c81457.gif')
gif2=('/usr/syno/synoman/webman/3rdparty/SecureSignIn/assets/addc28996dad298560fd62666efd5c0b.gif' \
'/usr/syno/synoman/webman/3rdparty/SecureSignIn/login-dist/assets/addc28996dad298560fd62666efd5c0b.gif' \
'/usr/syno/synoman/webman/3rdparty/SecureSignIn/login-dist/assets/7b5be9126e33a3ef7f06.gif')

# 系统文件与补丁文件对应关系
declare -A corresponding
corresponding['style']=''
corresponding['style2']=''
corresponding['ssl']=''
corresponding['png1']='1bc43875501e55e5e741e427ca50dbdf.png'
corresponding['png2']='944a992fb1e17b455579f66f923313fb.png'
corresponding['gif1']='68b2c5f5747c3085bba5dd628b90ae0f.gif'
corresponding['gif2']='addc28996dad298560fd62666efd5c0b.gif'

declare -A declare_code
declare -A declare_file

# 磨砂玻璃效果相关补丁
frosting(){
    declare_code=()
    declare_file=()
    declare_code['style']=".tab-panel{width:370px;backdrop-filter:blur(10px);background-color:rgba(255,255,255,0.5);box-shadow:0 10px 20px 0 rgba(0,0,0,0.2)}.login-tabs.spinning .login-tabs-content-mask-wrapper:before{background-color:transparent}.login-textfield .input-container input{color:#4a4b57;background-color:transparent}.login-textfield .bottom-border{background:#fff}.login-textfield:hover .bottom-border{background:#fff}.login-tabs .login-tabs-content-wrapper .login-tabs-co .login-textfield .input-container input{color:#172b4d;transition:all .3s cubic-bezier(.68,-.55,.265,1.55);background-color:transparent}.login-textfield .input-container input:-webkit-autofill,textarea:-webkit-autofill,select:-webkit-autofill{-webkit-text-fill-color:#172b4d !important;-webkit-box-shadow:0 0 0px 1000px transparent inset !important;background-color:transparent;background-image:none;transition:background-color 50000s ease-in-out 0s}.login-textfield .input-container input{background-color:transparent}.login-wallpaper{filter:brightness($brightness)}"
    declare_code['ssl']='.syno-securesignin .auth-login-panel .verify-number{background:transparent;color:#414b55}'
    declare_file['style']="$(get_path "${style[@]}")"
    declare_file['ssl']="$(get_path "${ssl[@]}")"
    declare_file['gif1']="$(get_path "${gif1[@]}")"
    declare_file['gif2']="$(get_path "${gif2[@]}")"
}

# 黑色半透明效果相关补丁
transparent(){
    declare_code=()
    declare_file=()
    declare_code['style']=".tab-panel{width:370px;background-color:rgba(30,30,30,0.45);box-shadow:0 10px 20px 0 rgba(30,30,30,.4)}.login-tabs.spinning .login-tabs-content-mask-wrapper:before{background-color:transparent}.login-textfield .input-container input{color:#dedede;background-color:transparent}.login-textfield .bottom-border{background:rgb(255,255,255,.5)}.login-textfield:hover .bottom-border{background:#dedede}.login-title span{color:#00a6ff}.tab-panel-title{color:#dedede}.username-wrapper .back-btn-wrapper .username{color:#f1f1f1}.login-checkbox .label{color:rgb(222 222 222 / 80%)}.tab-panel-title{color:#dedede}#plugin-list>.plugin-cell>.plugin-wrapper>.plugin-desc{color:#ffffff}.tab-footer-link-ct .tab-footer-link{color:rgb(180 180 180 / 70%)}.login-tabs .login-tabs-content-wrapper .login-tabs-co .login-textfield .input-container input{transition:all .3s cubic-bezier(.68,-.55,.265,1.55);background-color:transparent}.login-textfield .input-container input:-webkit-autofill,textarea:-webkit-autofill,select:-webkit-autofill{-webkit-text-fill-color:#dedede !important;-webkit-box-shadow:0 0 0px 1000px transparent inset !important;background-color:transparent;background-image:none;transition:background-color 50000s ease-in-out 0s}.login-textfield .input-container input{background-color:transparent} .login-wallpaper{filter:brightness($brightness)}"
    declare_code['style2']='.footer-link-ct[data-v-7ac5b306]{color:rgb(255 255 255 / 60%);}'
    declare_code['ssl']='.syno-securesignin .auth-login-panel .title{color:#ffffff}.syno-securesignin .auth-login-panel .desc{color:#ffffff}.syno-securesignin .auth-login-panel .verify-number{background:transparent;color:#414b55}.syno-securesignin .v-checkbox-wrapper .v-checkbox-label{color:#ffffff}.syno-securesignin .tab-footer.login-footer .tab-footer-link{color:#fcfcfc}.footer-link-ct span{color:#efefef}.footer-link-ct a{color:#51d2ff}'
    declare_file['style']="$(get_path "${style[@]}")"
    declare_file['style2']="$(get_path "${style2[@]}")"
    declare_file['ssl']="$(get_path "${ssl[@]}")"
    declare_file['png1']="$(get_path "${png1[@]}")"
    declare_file['png2']="$(get_path "${png2[@]}")"
    declare_file['gif1']="$(get_path "${gif1[@]}")"
    declare_file['gif2']="$(get_path "${gif2[@]}")"
}

# 调试
debug(){
    if $isdebug;then
        echo "$*"
    fi
}

# 检测本地文件
check_local_file(){
    isexis=false
    for name in "${!corresponding[@]}";do
        path=${corresponding[$name]}
        if [[ -n "$path" ]] && [[ ! -f "${patch_path}/${path}" ]];then
            echo "【${patch_path}/${corresponding[${name}]}】补丁文件不存在"
            isexis=true
        fi
    done
    if $isexis;then
        echo "文件不全，请检查补丁文件是否齐全"
        exit 1
    fi
}

# 检测系统文件
check_dsm_file(){
    isexis=false
    for name in "${!declare_file[@]}"; do
        path="${declare_file[$name]}"
        debug "检测系统文件：${path}"
        if [ ! -f "$path" ]; then
            cpath=${corresponding[${name}]}
            if [[ -z "$cpath" ]];then
                cpath="${name}"
            fi
            echo "${cpath} 对应的系统文件不存在"
            isexis=true
        fi
    done
    if $isexis;then
        echo "不支持此版本，DSM版本：${version}"
        echo '请把上述信息提交给作者'
        exit 1
    fi
}

# 判断系统文件是否存在，存在则返回路径
get_path(){
    local paths=("$@")
    for path in "${paths[@]}";do
        if [[ -f $path ]];then
            echo $path
            break
        fi
    done
}

# 备份文件
backups(){
    echo "开始备份系统文件"
    for name in "${!declare_file[@]}"; do
        path=${declare_file[$name]}
        debug "备份系统文件:${path}"
        cp -p "$path" "${path}.bak"
        # 如果是css,则同时备份css压缩文件
        if [[ "$path" == *.css ]] && [[ -f "${path}.gz" ]]; then
            debug "备份系统文件:${path}.gz"
            cp -p "${path}.gz" "${path}.gz.bak"
        fi
    done
    echo "系统文件备份成功"
}

# 还原所有的备份文件
uninstall() {
    echo "开始卸载补丁"
    isexis=false
    for name in "${!corresponding[@]}";do
        eval "paths=(\"\${$name[@]}\")"
        for path in "${paths[@]}";do
            if [[ -f "${path}.bak" ]];then
                debug "恢复系统文件:${path}"
                mv "${path}.bak" "$path"
                isexis=true
            fi
            # 如果是css,则同时恢复css压缩文件
            if [[ "$path" == *.css ]] && [[ -f "${path}.gz.bak" ]]; then
                debug "恢复系统文件:${path}.gz"
                mv "${path}.gz.bak" ${path}.gz
            fi
        done
    done
    if $isexis;then
        echo "补丁卸载完成"
    else
        echo "当前未安装补丁"
    fi
}

install() {
    # 检测系统文件
    check_dsm_file
    # 如果已安装补丁则还原文件
    uninstall
    # 备份要修改的文件
    backups
    # 替换和修改文件
    echo "开始安装补丁"
    for name in "${!declare_file[@]}"; do
        copy=${corresponding[$name]}
        paste=${declare_file[$name]}
        if [[ -z "$copy" ]];then
            debug "${name}代码写入${paste}"
            # 向css中写入代码
            echo -n "${declare_code[$name]}" >> $paste
            # 生成压缩css文件
            if [[ -f "${paste}.gz" ]];then
                debug "创建${paste}的压缩文件"
                gzip -c "$paste" > "${paste}.gz"
            fi
        else
            # 替换图片动图等文件
            debug "${patch_path}/${copy}复制${paste}"
            # 获取当前文件的用户和用户组
            current_user=$(stat -c "%U" "$paste")
            current_group=$(stat -c "%G" "$paste")
            # 获取当前文件的权限    
            current_permissions=$(stat -c "%a" "$paste")
            cp -f "${patch_path}/${copy}" "$paste"
            # 设置新文件的用户和用户组
            chown "$current_user:$current_group" "$paste"
            # 设置新文件的权限为当前权限
            chmod "$current_permissions" "$paste"

        fi
    done
    echo "补丁安装完成"
}

# 校验补丁文件是否存在
check_local_file
# 进入选项
while true
do
    if [[ -n $par ]]; then
        input="$par"
    else
        read -r -p "1：安装磨砂补丁 2：安装黑色补丁 3：还原补丁 q：退出脚本 [1/2/3/q] " input
    fi
    case $input in
        1)  
            frosting
            install
            ;;
        2)  
            transparent
            install
            ;;
        3)
            uninstall
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