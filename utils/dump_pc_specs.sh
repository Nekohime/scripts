#!/usr/bin/env bash

rm specs.tar.gz

lspci > lspci.log
lsusb > lsusb.log
#inxi -F > inxi.log
sudo inxi -FmB -v 7 > inxi.log
sudo chown $USER:$USER inxi.log

tar -cvf specs.tar.gz *.log

rm *.log

