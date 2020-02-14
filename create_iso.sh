#!/bin/bash
cd iso
xorrisofs -o ../hvproxy_zfs.iso -b ISOLINUX.BIN -c BOOT.CAT -no-emul-boot -boot-load-size 4 -boot-info-table .
