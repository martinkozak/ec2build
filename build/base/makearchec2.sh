#!/bin/bash
# 2010 Copyright Yejun Yang (yejunx AT gmail DOT com)
# 2011 Copyright Martin Kozák (martinkozak AT martinkozak DOT net)
# 2011 Copyright Ernie Brodeur (ebrodeur AT ujami DOT net)
# 2011 Copyright Antoine Martin
# Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License.
# http://creativecommons.org/licenses/by-nc-sa/3.0/us/

# Requred packages: 
#   devtools, cpio, curl

###

set -e    # stop on errors

ARCH=x86_64
EC2_ARCH=x86_64

ROOT=/tmp/arch_$ARCH
EBSDEVICE=/dev/xvdg
NEWROOT=/mnt/newroot

if [ ! -b ${EBSDEVICE}1 ]; then
    fdisk ${EBSDEVICE} <<EOF
n
p


+100M
n
p



w
EOF
fi

mkfs.ext4 -j ${EBSDEVICE}1 || exit 1
mkfs.ext4 -j ${EBSDEVICE}2 || exit 1

if [ ! -e ${NEWROOT} ]; then
  mkdir ${NEWROOT}
fi

mount ${EBSDEVICE}2 ${NEWROOT}
chmod 755 ${NEWROOT}
mkdir ${NEWROOT}/boot
mount ${EBSDEVICE}1 ${NEWROOT}/boot

PACKS="base zsh linux-ec2 ec2-metadata ec2arch"

cat <<EOF > pacman.conf
[options]
HoldPkg     = pacman glibc
SyncFirst   = pacman
Architecture = $ARCH
IgnorePkg   = linux

[ec2]
Server = http://downloads.sourceforge.net/project/archlinux-ec2/repo/x86_64

[core]
Include = /etc/pacman.d/mirrorlist

[extra]
Include = /etc/pacman.d/mirrorlist

[community]
Include = /etc/pacman.d/mirrorlist

EOF

LC_ALL=C mkarchroot -f -C pacman.conf $ROOT $PACKS

cp /etc/pacman.d/mirrorlist $ROOT/etc/pacman.d/mirrorlist

mkdir -p -m 755 $ROOT/dev/pts
mkdir -p -m 1777 $ROOT/dev/shm

mv $ROOT/etc/rc.conf $ROOT/etc/rc.conf.pacorig
cat <<EOF >$ROOT/etc/rc.conf
LOCALE="en_US.UTF-8"
TIMEZONE="UTC"
MOD_AUTOLOAD="no"
USECOLOR="yes"
USELVM="no"
DAEMONS=(syslog-ng sshd crond ec2)
EOF

mv $ROOT/etc/inittab $ROOT/etc/inittab.pacorig
cat <<EOF >$ROOT/etc/inittab
id:3:initdefault:
rc::sysinit:/etc/rc.sysinit
rs:S1:wait:/etc/rc.single
rm:2345:wait:/etc/rc.multi
rh:06:wait:/etc/rc.shutdown
su:S:wait:/sbin/sulogin -p
ca::ctrlaltdel:/sbin/shutdown -t3 -r now

# This will enable the system log.
c0:12345:respawn:/sbin/agetty 38400 hvc0 linux

EOF

mkdir -p $ROOT/boot/boot/grub
cat <<EOF >$ROOT/boot/boot/grub/menu.lst
default 0
timeout 1

title  Arch Linux EC2
	root   (hd0,0)
	kernel /vmlinuz-linux-ec2 console=hvc0 root=/dev/xvda2 ip=dhcp spinlock=tickless elevator=noop ro
	initrd /initramfs-linux-ec2.img
EOF

cd $ROOT/boot
ln -s boot/grub .
cd ../..

cp $ROOT/etc/ssh/sshd_config $ROOT/etc/ssh/sshd_config.pacorig
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/'  $ROOT/etc/ssh/sshd_config
sed -i 's/#UseDNS yes/UseDNS no/' $ROOT/etc/ssh/sshd_config

cp $ROOT/etc/skel/.bash* $ROOT/root
mv $ROOT/etc/fstab $ROOT/etc/fstab.pacorig

cat <<EOF >$ROOT/etc/fstab
$(blkid -c /dev/null -s UUID -o export ${EBSDEVICE}2) /     ext4    defaults,relatime 0 1
$(blkid -c /dev/null -s UUID -o export ${EBSDEVICE}1) /boot ext4    defaults,relatime 0 0
/dev/xvdb /tmp  auto    defaults,relatime 0 0
/dev/xvda3 swap  swap   defaults 0 0
none      /proc proc    nodev,noexec,nosuid 0 0
none /dev/pts devpts defaults 0 0
none /dev/shm ramfs nodev,nosuid 0 0
EOF

mv $ROOT/etc/makepkg.conf $ROOT/etc/makepkg.conf.pacorig
cp /etc/makepkg.conf $ROOT/etc/

mkdir $ROOT/opt/{sources,packages,srcpackages}
chmod 1777 $ROOT/opt/{sources,packages,srcpackages}

echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> $ROOT/etc/sudoers

mv $ROOT/etc/resolv.conf $ROOT/etc/resolv.conf.pacorig
echo "nameserver 172.16.0.23" > $ROOT/etc/resolv.conf

touch $ROOT/root/firstboot

cd $ROOT
find . -depth -print | cpio -pdmv --sparse $NEWROOT
umount ${NEWROOT}/boot
umount ${NEWROOT}