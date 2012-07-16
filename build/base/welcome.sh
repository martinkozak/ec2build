#!/bin/bash

echo "
######################################################################

WELCOME to Arch Linux on Amazon EC2! It's a standard (base) 
system with very reduced patched standard kernel suitable for EC2.

For the latest EC2 enabled kernel or other EC2 related tools updates, 
you can perform standard \"pacman -Syu\" because it's connected to 
the binary precompiled archlinux-ec2 repository.

General support for this images and home of this project are at: 
    https://github.com/martinkozak/ec2build
    https://github.com/martinkozak/linux-ec2

You probably should initialize the archlinux-keyring now by:
    pacman-key --init; pacman-key --populate archlinux
    
You can disable this message by removing the file:
    /etc/ec2/welcome.sh
    
######################################################################
"

uname -a
echo
echo "Version 20120716."
echo
echo
