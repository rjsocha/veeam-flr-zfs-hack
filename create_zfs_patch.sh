#!/bin/bash
# this is really dirrty :)
mkdir -p zfs/{deb,root}
cd zfs
apt-get update -qq
for p in kmod libzpool2linux libnvpair1linux zfsutils-linux zfs-zed libuutil1linux libzfs2linux
do
	(cd deb; apt-get download $p)
	dpkg-deb -R deb/$p*.deb root
	rm -rf root/DEBIAN
done
cp -f /boot/vmlinuz-$(uname -r) ../iso/VELINUX
rsync -aq /lib/modules/$(uname -r) root/lib/modules
rsync -av root/ ../initrd/
cd ../initrd/etc/init.d
patch <../../../rcS.patch
cd ../..
for n in libnvpair libzfs_core libzpool libzfs libuutil
do
	rm lib/x86_64-linux-gnu/${n}*
done
