#!/bin/bash
#     ////     //  ////     //
#    // //    //  // //    //
#   //  //   //  //  //   //
#  //   //  //  //   //  //
# //    // //  //    // //
#//     ////  //     ////
#Nam - 20210604
#Debian basic scripted install

#Variables
home="/home/nn"

#Add contrib and non-free sources
sed -i '/security.debian/d' >> /etc/apt/sources.list
echo "deb http://security.debian.org/ buster/updates main contrib non-free" >> /etc/apt/sources.list
echo "deb-src http://security.debian.org/ buster/updates main contrib non-free" >> /etc/apt/sources.list
sed -i '/deb.debian/d' >> /etc/apt/sources.list
echo "deb  http://deb.debian.org/debian buster main contrib non-free" >> /etc/apt/sources.list
echo "deb-src  http://deb.debian.org/debian buster main contrib non-free" >> /etc/apt/sources.list
#Add VMWareTool source
echo "deb http://ftp.debian.org/debian/ buster main contrib" >> /etc/apt/sources.list

#Update Debian
apt update -y

#Install Packages
apt install -y intel-microcode neofetch open-vm-tools tmux mlocate mc

#Configure Neofetch
echo "neofetch" >> /etc/bash.bashrc
cp -r $home/SCRIPT/neofetch/ $home/.config/.

#Update mlocate database
updatedb