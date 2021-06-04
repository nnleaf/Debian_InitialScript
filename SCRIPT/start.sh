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

sudo echo "@reboot /bin/sh $home/SCRIPT/script.sh" >> /var/spool/cron/crontabs/root
sudo reboot