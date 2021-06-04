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
sudo echo "@reboot /bin/bash /home/nn/SCRIPT/script.sh" >> /var/spool/cron/crontabs/root
sudo reboot