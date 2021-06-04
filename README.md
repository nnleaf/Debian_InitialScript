# Debian InitialScript

## Introduction

After the [CentOS ThinClient](https://github.com/nnleaf/CentOS_ThinClient) project I worked on at NCRi, I wanted a more efficient process for spinning up my personal VM's. I didn't want to use a template VM due to prior issues such as hostname and ip conflicts. Having a script to run on a fresh system seemed the best way to go about it.

## Instructions

1. Create a VM and install Debian as usual.
2. Ensure VM is set to static IP on Firewall
3. SFTP in and transfer over SCRIPT folder to $HOME
4. SSH into VM and run the following command

`sudo sh $HOME/SCRIPT/start.sh`

5. Proceed with securing VM in documentation

## Upcoming

Securing VM has a lot more manual configurations needed, so scripting a method to input data might be the way forward with this project