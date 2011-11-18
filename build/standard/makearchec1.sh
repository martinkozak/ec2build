#!/bin/bash
# 2010 Copyright Yejun Yang (yejunx AT gmail DOT com)
# 2011 Copyright Martin Kozák (martinkozak AT martinkozak DOT net)
# 2011 Copyright Ernie Brodeur (ebrodeur AT ujami DOT net)
# 2011 Copyright Antoine Martin
# Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License.
# http://creativecommons.org/licenses/by-nc-sa/3.0/us/

# Requred packages: 
#   curl

###

set -e    # stop on errors

if [[ `uname -m` == i686 ]]; then
  ARCH=i686
  EC2_ARCH=i386
else
  ARCH=x86_64
  EC2_ARCH=x86_64
fi

ROOT=/root/..
EBSDEVICE=/dev/xvdg
NEWROOT=/mnt/newroot


mkdir -p $ROOT/root/repo
curl -o $ROOT/root/repo/ec2-metadata-0.1-1-any.pkg.tar.xz https://raw.github.com/martinkozak/ec2build/master/kernel/repo/ec2-metadata-0.1-1-any.pkg.tar.xz
curl -o $ROOT/root/repo/ec2arch-1.0-1-any.pkg.tar.xz https://raw.github.com/martinkozak/ec2build/master/kernel/repo/ec2arch-1.0-1-any.pkg.tar.xz
curl -o $ROOT/root/repo/linux-ec2-3.1-4-$ARCH.pkg.tar.xz http://c263555.r55.cf1.rackcdn.com/linux-ec2-3.1-4-$ARCH.pkg.tar.xz
curl -o $ROOT/root/repo/linux-ec2-headers-3.1-4-$ARCH.pkg.tar.xz http://c263555.r55.cf1.rackcdn.com/linux-ec2-headers-3.1-4-$ARCH.pkg.tar.xz
repo-add $ROOT/root/repo/ec2.db.tar.gz $ROOT/root/repo/ec2arch-1.0-1-any.pkg.tar.xz $ROOT/root/repo/ec2-metadata-0.1-1-any.pkg.tar.xz $ROOT/root/repo/linux-ec2-3.1-4-$ARCH.pkg.tar.xz $ROOT/root/repo/linux-ec2-headers-3.1-4-$ARCH.pkg.tar.xz

