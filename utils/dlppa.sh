#!/usr/bin/env bash

echo $* | awk -F/ '{
    sub(".*ppa:","",$0)
    print "https://launchpad.net/~"$1"/+archive/ubuntu/"$2"/+packages"
    }'
