#!/bin/bash
STARTTIME=$(date +%s.%3N)                                                                           
echo "End timing with ctrl-c."
while true; do
    DUR=$(printf "%.3f" $(bc <<< $(date +%s.%3N)-$STARTTIME))
    printf "\r%s " $(date +%T.%3N -u -d "@${DUR}")
done
