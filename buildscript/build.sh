#!/usr/bin/env bash

rm -r obj/
rm binary_name

cores=$(cat /proc/cpuinfo | awk '/^processor/{print $3}' | wc -l)
cores=$((cores+1))
make -j$cores
