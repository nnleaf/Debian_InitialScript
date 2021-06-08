#!/bin/bash
#     ////     //  ////     //
#    // //    //  // //    //
#   //  //   //  //  //   //
#  //   //  //  //   //  //
# //    // //  //    // //
#//     ////  //     ////
#Nam - 20210605
#Securing Debian

#Variables
home="/home/nn"

#Install Packages
apt install -y fail2ban ufw unattended-upgrades apticron rkhunter

#Securing OpenSSH
echo "Protocol 2" >> /etc/ssh/sshd_config
echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config
echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
echo "PermitRootLogin no" >> /etc/ssh/sshd_config
echo "PrintLastLog yes" >> /etc/ssh/sshd_config
#Add host Login [NEEDS WORK]
mkdir $home/.ssh/
#sudo nano ~/.ssh/authorized_keys

#Fail2Ban
cp /etc/fail2ban/fail2ban.conf /etc/fail2ban/fail2ban.local
systemctl start fail2ban
systemctl enable fail2ban

#UFW
ufw allow 22
ufw enable
ufw reload

#Debian Auto-Updates [NEEDS WORK]
#sudo dpkg-reconfigure unattended-upgrades
#sed -i '/o=Debian,a=stable-updates/c\"o=Debian,a=stable-updates";' /etc/apt/apt.conf.d/50unattended-upgrades
#sed -i '/'//      "o=Debian,a=stable";'/c\'"o=Debian,a=stable";'' /etc/apt/apt.conf.d/50unattended-upgrades
#//      "o=Debian,a=stable";
#//      "o=Debian,a=stable-updates";
#apt-cache policy

#Configure RKHunter
cp $home/SCRIPT/rkhunter/rkhunter.conf /etc/rkhunter.conf
cp $home/SCRIPT/rkhunter/rkhunter /etc/default/rkhunter
rkhunter --config-check
rkhunter --update
rkhunter --check --sk