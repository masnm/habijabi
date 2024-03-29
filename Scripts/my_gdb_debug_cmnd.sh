#!/bin/bash

if [ "$1" == "" ]
then
	echo -e '\e[0;31m#___File Name is Empty___#\e[m'
	exit 1
fi

if [ -f $1.c ]
then
	gcc -std=c11 -Wshadow -Wall -o $1.out $1.c -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -g -DLOCAL
	if [ $? == 0 ]
	then
		gdb $1.out
		rm $1.out
	else
		exit 1
	fi
elif [ -f $1.py ]; then
	echo -e '\e[0;32m#Wrong tool for wrong language#\e[m'

elif [ -f $1.cpp ]
then
	g++ -std=c++17 -Wshadow -Wall -o $1.out $1.cpp -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -g -DLOCAL
	if [ $? == 0 ]
	then
		gdb $1.out
		rm $1.out
	else
		exit 1
	fi
elif [ -f $1.java ]
then
	# TODO learn about gdb java
	echo 'Not implemented yet'
else
	echo -e '\e[0;31m#___Cant Handle this FileType___#\e[m'
	exit 1
fi
