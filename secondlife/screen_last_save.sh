#!/usr/bin/env bash
#copies the screen_last.png file, appends the date and time to the file name,
# and then saves it in a separate directory.

#Has to be your username, all lowercase, underscore instead of space or dot.
#Display names will not work!

#Personal preference variables
username="username_resident"
save_folder="$HOME/Documents/Pictures/SecondLife/screen_last" #Folder to save your file to - Doesn't have to exist, will be created if it doesn't

now=$(date +"%d-%m-%Y_%H-%M-%S")
save_file="$save_folder/screen_last_$now.png"

#Only change if your setup is different
fs_launcherscript="$HOME/firestorm/firestorm" # Location of the bash script used to launch Firestorm - Only change if necessary
fs_dir="$HOME/.firestorm_x64" #Only change if necessary


mkdir -p "$save_folder"
echo "$save_file"
cp "$fs_dir/$username/screen_last.png" $save_file

bash $fs_launcherscript &