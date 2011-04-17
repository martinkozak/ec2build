#!/bin/bash

ec2-register -K pk-NPBVYMWXFTFLXIGH6AD2XRXEUY3Q2XJ3.pem -C cert-NPBVYMWXFTFLXIGH6AD2XRXEUY3Q2XJ3.pem --region us-east-1 -a i386 -b /dev/sdb=ephemeral0 -b /dev/sdc=ephemeral1 -b /dev/sdd=ephemeral2 -b /dev/sde=ephemeral3 --root-device-name /dev/sda --kernel aki-4c7d9525 -n "Arch Linux 32bit EBS 20110415 -- minimal (bash)" -d "Base Arch Linux AMI booted from EBS storage by Martin Kozak (martinkozak@martinkozak.net)." -s snap-991ecaf6
ec2-register -K pk-NPBVYMWXFTFLXIGH6AD2XRXEUY3Q2XJ3.pem -C cert-NPBVYMWXFTFLXIGH6AD2XRXEUY3Q2XJ3.pem --region us-east-1 -a i386 -b /dev/sdb=ephemeral0 -b /dev/sdc=ephemeral1 -b /dev/sdd=ephemeral2 -b /dev/sde=ephemeral3 --root-device-name /dev/sda --kernel aki-4c7d9525 -n "Arch Linux 32bit EBS 20110415 -- standard (zsh)" -d "Base Arch Linux AMI booted from EBS storage by Martin Kozak (martinkozak@martinkozak.net)." -s snap-4d1fcb22

ec2-register -K pk-NPBVYMWXFTFLXIGH6AD2XRXEUY3Q2XJ3.pem -C cert-NPBVYMWXFTFLXIGH6AD2XRXEUY3Q2XJ3.pem --region us-east-1 -a x86_64 -b /dev/sdb=ephemeral0 -b /dev/sdc=ephemeral1 -b /dev/sdd=ephemeral2 -b /dev/sde=ephemeral3 --root-device-name /dev/sda --kernel aki-4e7d9527 -n "Arch Linux 64bit EBS 20110415 -- minimal (bash)" -d "Base Arch Linux AMI booted from EBS storage by Martin Kozak (martinkozak@martinkozak.net)." -s snap-391fcb56
ec2-register -K pk-NPBVYMWXFTFLXIGH6AD2XRXEUY3Q2XJ3.pem -C cert-NPBVYMWXFTFLXIGH6AD2XRXEUY3Q2XJ3.pem --region us-east-1 -a x86_64 -b /dev/sdb=ephemeral0 -b /dev/sdc=ephemeral1 -b /dev/sdd=ephemeral2 -b /dev/sde=ephemeral3 --root-device-name /dev/sda --kernel aki-4e7d9527 -n "Arch Linux 64bit EBS 20110415 -- standard (zsh)" -d "Base Arch Linux AMI booted from EBS storage by Martin Kozak (martinkozak@martinkozak.net)." -s snap-071fcb68
