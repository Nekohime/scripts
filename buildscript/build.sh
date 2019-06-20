#!/usr/bin/env bash

rm -r obj/
rm binary_name

threads=$(awk '/^processor/{print $3}' /proc/cpuinfo | wc -l)
threads=$((threads+1))
make -j$threads