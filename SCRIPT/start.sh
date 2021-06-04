#!/bin/bash
#     ////     //  ////     //
#    // //    //  // //    //
#   //  //   //  //  //   //
#  //   //  //  //   //  //
# //    // //  //    // //
#//     ////  //     ////
#Nam - 20210604
#Adds cronjob and reboots

#Variables
home="/home/nn"

#Set cronjob, permissions, and reboot
sudo echo "@reboot /bin/sh $home/SCRIPT/script.sh" >> /var/spool/cron/crontabs/root
sudo chown root:crontab /var/spool/cron/crontabs/root
sudo chmod 600 /var/spool/cron/crontabs/root
sudo chmod +x $home/SCRIPT/script.sh
sudo reboot