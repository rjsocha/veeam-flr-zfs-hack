#!/bin/bash

mkdir initrd
cd initrd
zcat ../iso/INITRD.IMG | cpio -imdv
