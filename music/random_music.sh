#!/usr/bin/env bash

remember=$(pwd)
cd ~/Music/
find . -type f -iname *.ogg | shuf -n10 > songs.txt

audtool playlist-clear

while read p; do
  audacious -e "$HOME/Music/$p"
done <songs.txt

audacious --play
rm songs.txt

cd "$remember"
