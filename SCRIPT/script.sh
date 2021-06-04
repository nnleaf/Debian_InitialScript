#!/bin/bash
#     ////     //  ////     //
#    // //    //  // //    //
#   //  //   //  //  //   //
#  //   //  //  //   //  //
# //    // //  //    // //
#//     ////  //     ////
#Nam - 20210604
#Debian basic scripted install
#
#Add contrib and non-free sources
sed -i '/security.debian/d' >> /etc/apt/sources.list
echo "deb http://security.debian.org/ buster/updates main contrib non-free" >> /etc/apt/sources.list
echo "deb-src http://security.debian.org/ buster/updates main contrib non-free" >> /etc/apt/sources.list
sed -i '/deb.debian/d' >> /etc/apt/sources.list
echo "deb  http://deb.debian.org/debian buster main contrib non-free" >> /etc/apt/sources.list
echo "deb-src  http://deb.debian.org/debian buster main contrib non-free" >> /etc/apt/sources.list

#Update Debian
apt update -y

#Install Packages
apt install -y intel-microcode neofetch

#Configure Neofetch
echo "neofetch" >> /etc/bash.bashrc