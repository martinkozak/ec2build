#!/bin/bash

ec2-register -K pk-NPBVYMWXFTFLXIGH6AD2XRXEUY3Q2XJ3.pem -C cert-NPBVYMWXFTFLXIGH6AD2XRXEUY3Q2XJ3.pem --region eu-west-1 -a x86_64 -b /dev/sdb=ephemeral0 -b /dev/sdc=ephemeral1 -b /dev/sdd=ephemeral2 -b /dev/sde=ephemeral3 --root-device-name /dev/sda --kernel aki-41eec435 -n "MyArchTestExt" -d "Test." -s snap-f274359b
