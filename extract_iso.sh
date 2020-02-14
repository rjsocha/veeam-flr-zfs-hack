#!/bin/bash
mkdir iso
cd iso
xorriso -osirrox on -indev ../hvproxy.iso -extract  / .
