#!/usr/bin/env bash

rm specs.tar.gz

lspci > lspci.log
lsusb > lsusb.log
inxi -F > inxi.log

tar -cvf specs.tar.gz *.log

rm *.log
