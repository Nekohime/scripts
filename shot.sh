#!/usr/bin/env bash
#Creates a screenshot that is named based on the date and time of its creation.
#Screenshot is made from selecting a rectangle on the screen(s)
#Copies it to clipboard once taken.
#Needs Scrot and xclip installed
#Alternative to ./spec.sh (Spectacle is buggy and requires pressing enter)
mkdir -p "$HOME/Documents/Screenshots/"

filename=$HOME/Documents/Screenshots/$(date '+%Y%m%d-%H%M%S').png
scrot -s "$filename" && xclip -selection clipboard -t "$(file -b --mime-type "$filename")" < "$filename"