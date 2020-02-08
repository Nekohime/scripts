#!/usr/bin/env bash
# Released under public domain. Made by Nekohime (https://nekohime.net)
# I hope it will be useful!
# Fun fact: Written in about an hour

# You should put some exports in your .bashrc, but this will handle defaults as well.
#export TODO_FILE=~/todo/todo.txt

TODO_FOLDER=~/todo
TODO_FILE=$TODO_FOLDER/list.txt
mkdir -p $TODO_FOLDER
touch $TODO_FILE
# Didn't use a switch case to make the code more readable for myself.
# Sorry, not sorry :)

if [ "$1" == "list" ] || [ "$1" == "l" ]; then
	grep -rn '' $TODO_FILE --color=always
elif [ "$1" == "search" ] || [ "$1" == "s" ]; then
	grep -rni "$2" $TODO_FILE --color=always
elif [ "$1" == "add" ] || [ "$1" == "a" ]; then
	echo "$2" >> $TODO_FILE
elif [ "$1" == "remove" ] || [ "$1" == "r" ]; then
	sed -i "$2"d $TODO_FILE #grep -rn '' $TODO_FILE --color=always
elif [ "$1" == "edit" ] || [ "$1" == "e" ]; then
	echo "NYI!"
else
	grep -rn '' $TODO_FILE --color=always # Default to list
fi