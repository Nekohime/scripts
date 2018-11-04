#!/usr/bin/env bash
#Makes your focused window hidden
#Only use I found for this (which was also a suggested solution) was to hide the RuneScape NXT splash screen (NXT 2.2.4 at the time of writing this has a bug where
#the splash screen never goes away. It's been almost a year...)
sleep 2
xdotool windowunmap "$(xdotool getactivewindow)"