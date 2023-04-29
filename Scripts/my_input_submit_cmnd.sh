#!/bin/bash

if [ "$1" == "" ]; then
	echo -e '\e[0;31m#___Argument List is Empty___#\e[m'
	exit 1
fi

# directly dumping in 'in*' file
for (( i = 1 ; i < 6 ; ++i ));
do
	if [ "$1" == "1" ]; then
		xclip -o > in$1
		exit 0
	fi
done

# Cheak if it is a direct file to submit or paste
if ( ([[ "$1" == *.c ]]) || ([[ "$1" == *.cpp ]]) || ([[ "$1" == *.java ]]) ); then
	xclip -selection clipboard < $1
	echo -e '\e[0;32m#___File Copied Successfully___#\e[m'
	exit 0
fi

# copying file to clipboard for paste or share
if [ "$1" != "" ] && [ "$2" == "" ]; then
	if [ -f $1 ]; then
		xclip -selection clipboard < $1
		exit 0
	elif [ -f $1.c ]; then
		xclip -selection clipboard < $1.c
		exit 0
	elif [ -f $1.cpp ]; then
		xclip -selection clipboard < $1.cpp
		exit 0
    elif [ -f $1.py ]; then
		xclip -selection clipboard < $1.py
        exit 0
	elif [ -f $1.java ]; then
		xclip -selection clipboard < $1.java
		exit 0
	else
		echo -e '\e[0;31m#___Unknown file type___#\e[m'
		exit 1
	fi
fi

# do specific file "input in/out *"
boolean=false
if [ "$1" != "" ] && [ "$2" != "" ]; then
	for (( i = 1 ; i < 6 ; ++i ));
	do
		if [ "$2" == "$i" ]; then
			xclip -o > $1in$2
			boolean=true
		fi
	done
	for (( i = -1, j = 1 ; i > -6 ; --i, ++j ));
	do
		if [ "$2" == "$i" ]; then
			xclip -o > $1out$j
			boolean=true
		fi
	done
fi

if [ "$boolean" == "false" ]; then
	exit 2
fi
