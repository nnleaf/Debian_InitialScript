#!/bin/bash
#     ////     //  ////     //
#    // //    //  // //    //
#   //  //   //  //  //   //
#  //   //  //  //   //  //
# //    // //  //    // //
#//     ////  //     ////
#Nam - 20210604
#Adds cronjob and reboots
#
sudo echo "@reboot /tmp/SCRIPT/script.sh" >> /var/spool/cron/root
sudo reboot