# Qucik & Dirty hack for Veeam ZFS support

## Unfortunately, I can’t guarantee your use of this solution will be free from error. I take no responsibility or liability, so far as legally possible, for any damages.

Background: Veeam support for ZFS(on LINUX) is broken in newest version (in older version too).

VeemFLR doesn't support newer ZFS verions. Backup restoration works OK. But File Level Resotre does not.


ENV: Veeam Backup & Replication 9.5 Update 4 and Hyper-V (Tested only with Veeam version 9.5.4.2866)

This is only for Hyper-V integration (do you need this for VMware? contact me please ;)

With standard VeemVLR (helper vm appliance):

![img1](https://raw.githubusercontent.com/rjsocha/veeam-flr-zfs-hack/master/img/flr1.png)

No support for newer ZFS:

![img1](https://raw.githubusercontent.com/rjsocha/veeam-flr-zfs-hack/master/img/helper_vm1.png)

With patched ISO:

![img1](https://raw.githubusercontent.com/rjsocha/veeam-flr-zfs-hack/master/img/flr2.png)

ZFS in now supported:

![img1](https://raw.githubusercontent.com/rjsocha/veeam-flr-zfs-hack/master/img/helper_vm2.png)

How this works?

This a hack (and very dirty one - but it's took 1h to prepare&test).
This create new ISO for FLR with current kernel & ZFS toolchain from Ubuntu. It's replace VeemFLR kernel and adds newer ZFS tools).
No other parts were changed.

Do you need to know more? Message me.


This is only tested and supported on Ubuntu 18.04. (you need this system to prperare new ISO).


You will need *hvproxy.iso* from: c:\Program Files\Veeam\Backup and Replication\Backup\LiveCD. Backup this file to other location.

SHA of hvproxy.iso
```
sha256sum hvproxy.iso
4fcecbb22c3279bd53212dd735bc8dc06bd840d20ac1771a643ad230314518bc  hvproxy.iso
```

Make sure you are running newst Ubuntu kernel (tested with 4.15.0-76-generic)

```
apt-get update 
apt-get dist-upgrade -y
# reboot to make sure you are running new kernel
reboot 
```

You need to run below command as *root*
```
# Check ISO
./check_iso.sh

# Install tools
./install_xorrio.sh

# Extract ISO
./extract_iso.sh

# Extract FS
./extract_fs.sh

# Patch ISO
./create_zfs_patch.sh

# Create new initrd
./create_fs.sh

# Create new ISO
./create_iso.sh
```

After that you will have new file *hvproxy_zfs.iso*. Copy this file to Veem server to c:\Program Files\Veeam\Backup and Replication\Backup\LiveCD as hvproxy.iso.

