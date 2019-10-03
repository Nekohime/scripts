#!/usr/bin/env bash
max=255
for((i=0;i<=max;i++))
  do
	redhex=$(printf '%02x'0000 "$(($i))")
	echo $redhex
	sleep 0.1
	sudo liquidctl set logo color fixed $redhex
done