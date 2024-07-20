#! /bin/bash
printf "Installing RDP Be Patience... " >&2
#{
#添加用户
sudo useradd -m N3LK
sudo adduser N3LK sudo
echo 'N3LK:0789' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
#安装谷歌远程桌面
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
#设置环境变量，非用户输入交互方式
sudo DEBIAN_FRONTEND=noninteractive \

#安装xfce4桌面
apt install --assume-yes xfce4 desktop-base
apt install xfce4-terminal
apt remove gnome-terminal
bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
apt install --assume-yes xscreensaver
systemctl disable lightdm.service

#安装x window:
#sudo apt-get install xorg
#安装lxde:
#sudo apt-get install lxde-core
#sudo apt install --assume-yes xscreensaver
#sudo systemctl disable lightdm.service
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo dpkg --install google-chrome-stable_current_amd64.deb
#sudo apt install --assume-yes --fix-broken

#安装谷歌浏览器
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg --install google-chrome-stable_current_amd64.deb
apt install --assume-yes --fix-broken
#安装文件管理器和文件编辑器
apt install nautilus nano -y 
#添加用户到远程桌面用户组
adduser N3LK chrome-remote-desktop
#安装网络命令支持
apt install net-tools # ifconfig
apt install iputils-ping # ping

#安装中文字体
#sudo /usr/share/locales/install-language-pack zh_CN
#sudo apt-get install language-pack-zh-hans
#sudo apt-get install ttf-wqy-zenhei
#sudo apt-get install ttf-wqy-*
#sudo apt-get install xfonts-wqy
#sudo apt-get install fonts-wqy-*
#sudo apt install $(check-language-support)
#中文界面安装
#sudo apt-get install ubuntu-desktop
#sudo apt-get install libx11*
#sudo apt-get install libx11-dev

#修改配置文件
#sudo bash -c 'echo LANG=\"zh_CN.UTF-8\" > /etc/default/locale'
#sudo bash -c 'echo LANGUAGE=\"zh_CN:zh\" >> /etc/default/locale'
#sudo bash -c 'echo LC_NUMERIC=\"zh_CN\" >> /etc/default/locale'
#sudo bash -c 'echo LC_TIME=\"zh_CN\" >> /etc/default/locale'
#sudo bash -c 'echo LC_MONETARY=\"zh_CN\" >> /etc/default/locale'
#sudo bash -c 'echo LC_PAPER=\"zh_CN\" >> /etc/default/locale'
#sudo bash -c 'echo LC_NAME=\"zh_CN\" >> /etc/default/locale'
#sudo bash -c 'echo LC_ADDRESS=\"zh_CN\" >> /etc/default/locale'
#sudo bash -c 'echo LC_TELEPHONE=\"zh_CN\" >> /etc/default/locale'
#sudo bash -c 'echo LC_MEASUREMENT=\"zh_CN\" >> /etc/default/locale'
#sudo bash -c 'echo LC_IDENTIFICATION=\"zh_CN\" >> /etc/default/locale'
#sudo bash -c 'echo LC_ALL=\"zh_CN.UTF-8\" >> /etc/default/locale'
#修改环境文件(环境变量(当前用户))
#sudo bash -c 'echo LANG=\"zh_CN.UTF-8\" >> /etc/environment'
#sudo bash -c 'echo LANGUAGE=\"zh_CN:zh\" >> /etc/environment'
#sudo bash -c 'echo LC_NUMERIC=\"zh_CN\" >> /etc/environment'
#sudo bash -c 'echo LC_TIME=\"zh_CN\" >> /etc/environment'
#sudo bash -c 'echo LC_MONETARY=\"zh_CN\" >> /etc/environment'
#sudo bash -c 'echo LC_PAPER=\"zh_CN\" >> /etc/environment'
#sudo bash -c 'echo LC_NAME=\"zh_CN\" >> /etc/environment'
#sudo bash -c 'echo LC_ADDRESS=\"zh_CN\" >> /etc/environment'
#sudo bash -c 'echo LC_TELEPHONE=\"zh_CN\" >> /etc/environment'
#sudo bash -c 'echo LC_MEASUREMENT=\"zh_CN\" >> /etc/environment'
#sudo bash -c 'echo LC_IDENTIFICATION=\"zh_CN\" >> /etc/environment'
#sudo bash -c 'echo LC_ALL=\"zh_CN.UTF-8\" >> /etc/environment'
#修改环境文件(环境变量(所有用户))
#sudo bash -c 'echo LANG=\"zh_CN.UTF-8\" >> /etc/profile'

#} &> /dev/null &&
printf "\nSetup Complete " >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
read -p "Paste Here: " CRP
su - N3LK -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n\n'
if sudo apt-get upgrade &> /dev/null
then
    printf "\n\nUpgrade Completed " >&2
else
    printf "\n\nError Occured " >&2
fi
