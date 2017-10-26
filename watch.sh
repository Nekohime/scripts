#!/usr/bin/env bash
#Based off https://gist.github.com/mpapi/4656389
#Looks for changes in ANY file ending with $PATTERN, if found, executes $COMMAND
set -e -u

PATTERN="\.md$"
COMMAND="make"

inotifywait -q --format '%f' -m -r -e close_write . \
    | grep --line-buffered $PATTERN \
    | xargs -I{} -r sh -c "echo [\$(date -Is)] $COMMAND && $COMMAND"
