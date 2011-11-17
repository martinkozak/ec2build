#!/bin/bash

# 32-bit kernels aren't further supported
#ec2-register -K pk-NPBVYMWXFTFLXIGH6AD2XRXEUY3Q2XJ3.pem -C cert-NPBVYMWXFTFLXIGH6AD2XRXEUY3Q2XJ3.pem --region ap-southeast-1 -a i386 -b /dev/sdb=ephemeral0 -b /dev/sdc=ephemeral1 -b /dev/sdd=ephemeral2 -b /dev/sde=ephemeral3 --root-device-name /dev/sda --kernel aki-6fd5aa3d -n "Arch Linux 32bit EBS 20110415 -- minimal (bash)" -d "Base Arch Linux AMI booted from EBS storage by Martin Kozak (martinkozak@martinkozak.net)." -s snap-df65cab4
#ec2-register -K pk-NPBVYMWXFTFLXIGH6AD2XRXEUY3Q2XJ3.pem -C cert-NPBVYMWXFTFLXIGH6AD2XRXEUY3Q2XJ3.pem --region ap-southeast-1 -a i386 -b /dev/sdb=ephemeral0 -b /dev/sdc=ephemeral1 -b /dev/sdd=ephemeral2 -b /dev/sde=ephemeral3 --root-device-name /dev/sda --kernel aki-6fd5aa3d -n "Arch Linux 32bit EBS 20110415 -- standard (zsh)" -d "Base Arch Linux AMI booted from EBS storage by Martin Kozak (martinkozak@martinkozak.net)." -s snap-a365cac8

ec2-register -K pk-NPBVYMWXFTFLXIGH6AD2XRXEUY3Q2XJ3.pem -C cert-NPBVYMWXFTFLXIGH6AD2XRXEUY3Q2XJ3.pem --region ap-southeast-1 -a x86_64 -b /dev/sdb=ephemeral0 -b /dev/sdc=ephemeral1 -b /dev/sdd=ephemeral2 -b /dev/sde=ephemeral3 --root-device-name /dev/sda --kernel aki-a6225af4 -n "Arch Linux 64bit EBS 20111113 -- minimal (bash)" -d "Base Arch Linux AMI booted from EBS storage by Martin Kozak (martinkozak@martinkozak.net)." -s snap-865014ec
ec2-register -K pk-NPBVYMWXFTFLXIGH6AD2XRXEUY3Q2XJ3.pem -C cert-NPBVYMWXFTFLXIGH6AD2XRXEUY3Q2XJ3.pem --region ap-southeast-1 -a x86_64 -b /dev/sdb=ephemeral0 -b /dev/sdc=ephemeral1 -b /dev/sdd=ephemeral2 -b /dev/sde=ephemeral3 --root-device-name /dev/sda --kernel aki-a6225af4 -n "Arch Linux 64bit EBS 20111113 -- standard (zsh)" -d "Base Arch Linux AMI booted from EBS storage by Martin Kozak (martinkozak@martinkozak.net)." -s snap-da5014b0
