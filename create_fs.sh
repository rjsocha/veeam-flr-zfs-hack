#!/bin/bash
cd initrd
find . | cpio -o --format=newc | gzip -9 >../iso/INITRD.IMG
