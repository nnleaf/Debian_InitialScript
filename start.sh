#!/bin/bash
#     ////     //  ////     //
#    // //    //  // //    //
#   //  //   //  //  //   //
#  //   //  //  //   //  //
# //    // //  //    // //
#//     ////  //     ////
#Nam - 20210819
#Script to inialize Debian
# 1. Login as initial user
# 2. Transfer start.sh to /home/$user/.
# 3. su root
# 4. bash /home/$user/start.sh

#Add contrib and non-free sources
sed -i '/deb cdrom/d' /etc/apt/sources.list
sed -i '/deb.debian/d' /etc/apt/sources.list
echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list
echo "deb http://deb.debian.org/debian/ bullseye-updates main" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main" >> /etc/apt/sources.list
sed -i '/security.debian/d' /etc/apt/sources.list
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list
apt update -y

#Intel microcode
apt install -y intel-microcode

#Sudo
apt install -y sudo
read -p "Enter the user to allow full SUDO privileges : " input1
sed -i "/User privilege specification/ a ${input1} ALL=(ALL:ALL) ALL" /etc/sudoers

#neofetch
apt install -y neofetch
echo "neofetch" >> /etc/bash.bashrc

#VMWare Tools
echo "deb http://ftp.debian.org/debian/ bullseye main contrib" >> /etc/apt/sources.list
apt update -y
apt install -y open-vm-tools

#Journald max logging size
sed -i '/SystemMaxUse/c\SystemMaxUse=50M' /etc/systemd/journald.conf
sed -i '/SystemKeepFree/c\SystemKeepFree=50' /etc/systemd/journald.conf

#tmux
apt install -y tmux
echo "export TERM=xterm" >> ~/.profile
echo "export TERM=xterm" >> ~/.bashrc

#locate
apt install -y mlocate
updatedb

#Midnight Commander
apt install -y mc

#Securing SSH
sed -i '/default value\./ a PrintLastLog yes' /etc/ssh/sshd_config
sed -i '/default value\./ a PermitRootLogin no' /etc/ssh/sshd_config
sed -i '/default value\./ a PasswordAuthentication yes' /etc/ssh/sshd_config
sed -i '/default value\./ a PermitEmptyPasswords no' /etc/ssh/sshd_config
sed -i '/default value\./ a Protocol 2' /etc/ssh/sshd_config
systemctl restart sshd

#Fail2Ban
apt install -y fail2ban
cp /etc/fail2ban/fail2ban.conf /etc/fail2ban/fail2ban.local
systemctl start fail2ban
systemctl enable fail2ban

#UFW
apt install -y ufw
ufw allow 22
ufw enable
ufw reload

#Auto-updates
apt install -y unattended-upgrades
sudo dpkg-reconfigure -f noninteractive unattended-upgrades
apt -y install apticron
sed -i '/\/\/\ \ \ \ \ \ \"o\=Debian\,a\=stable\"\;/ a "o=Debian,a=stable";' /etc/apt/apt.conf.d/50unattended-upgrades
sed -i '/\/\/\ \ \ \ \ \ \"o\=Debian\,a\=stable\"\;/d' /etc/apt/apt.conf.d/50unattended-upgrades
sed -i '/\/\/\ \ \ \ \ \ \"o\=Debian\,a\=stable\-updates\"\;/ a "o=Debian,a=stable";' /etc/apt/apt.conf.d/50unattended-upgrades
sed -i '/\/\/\ \ \ \ \ \ \"o\=Debian\,a\=stable\-updates\"\;/d' /etc/apt/apt.conf.d/50unattended-upgrades
apt-cache policy

#RKHunter
apt install -y rkhunter
sed -i 's/UPDATE_MIRRORS=0/UPDATE_MIRRORS=1/g' /etc/rkhunter.conf
sed -i 's/MIRRORS_MODE=1/MIRRORS_MODE=0/g' /etc/rkhunter.conf
sed -i 's/WEB_CMD="\/bin\/false"/WEB_CMD=""/g' /etc/rkhunter.conf
sed -i 's/ALLOW_SSH_PROT_V1=2/ALLOW_SSH_PROT_V1=0/g' /etc/rkhunter.conf
sed -i 's/CRON_DAILY_RUN=""/CRON_DAILY_RUN="true"/g' /etc/default/rkhunter
sed -i 's/CRON_DB_UPDATE=""/CRON_DB_UPDATE="true"/g' /etc/default/rkhunter
sed -i 's/APT_AUTOGEN="false"/APT_AUTOGEN="true"/g' /etc/default/rkhunter
rkhunter --config-check
rkhunter --update
rkhunter --check --sk

#reboot
sudo reboot