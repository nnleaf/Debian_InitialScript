# Debian InitialScript

## Introduction

After the [CentOS ThinClient](https://github.com/nnleaf/CentOS_ThinClient) project I worked on at NCRi, I wanted a more efficient process for spinning up my personal VM's. I didn't want to use a template VM due to prior issues such as hostname and ip conflicts. Having a script to run on a fresh system seemed the best way to go about it.

## Instructions

1. Create a VM and install Debian as usual
2. Login as initial user
3. Transfer start.sh to /home/$user/.
4. SSH into VM
5. Run the following commands
`su root`
`bash /home/$user/start.sh`

## Upcoming

Securing VM has a lot more manual configurations needed, so scripting a method to input data might be the way forward with this project