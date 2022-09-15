# dsm7_login_translucent
群晖7.x设置自动切换壁纸后白色输入框显示和突兀，所以改为半透明化很有必要

使用教程：
  # ssh登录群晖
  # 切换root权限
  sudo -i
  # 备份原配置文件
  cp /usr/syno/synoman/webman/login/dist/style.css <<备份目录，可从群晖File Station-选择目录-属性-位置查看>>/style.css.bf
  cp /usr/syno/synoman/webman/login/dist/style.css.gz <<备份目录，可从群晖File Station-选择目录-属性-位置查看>>/style.css.gz.bf
  # 复制新文件替换旧文件
  cp <<下载解压的目录，可从群晖File Station-选择目录-属性-位置查看>>/style.css /usr/syno/synoman/webman/login/dist/style.css
  cp <<下载解压的目录，可从群晖File Station-选择目录-属性-位置查看>>/style.css.gz /usr/syno/synoman/webman/login/dist/style.css.gz
