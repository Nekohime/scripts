#!/usr/bin/env bash
#Creates a screenshot that is named based on the date and time of its creation.
#Screenshot is made from selecting a rectangle on the screen(s)
#Copies it to clipboard once taken.
#Needs Spectacle and xclip installed
#Folder needs to exist (mkdir -p?)

filename=$HOME/Documents/Screenshots/$(date '+%Y%m%d-%H%M%S').png
spectacle -nrbo $filename ; xclip -selection clipboard -t $(file -b --mime-type $filename) < $filename

