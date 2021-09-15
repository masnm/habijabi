#!/bin/bash

if [ "$1" == "" ]
then
	echo -e '\e[0;31m#___File Name is Empty___#\e[m'
	exit 1
fi

if [ -f $1.c ]
then
	if [ "$2" == "-1" ]
	then
		gcc -std=c11 -Wshadow -Wall -o $1.out $1.c -O2 -Wno-unused-result -Wfatal-errors
	elif [ "$2" == "-f" ]
	then
		gcc -std=c11 -Wshadow -Wall -o $1.out $1.c -O2 -Wno-unused-result
	elif [ "$2" == "" ]
	then
		gcc -std=c11 -Wshadow -Wall -o $1.out $1.cpp -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -g -DLOCAL
	else
		echo -e '\e[0;31m#___Undefined flag' ' $2 ' '___#\e[m'
		exit 1
	fi
elif [ -f $1.cpp ]
then
	if [ "$2" == "-1" ]
	then
		g++ -std=c++17 -Wshadow -Wall -o $1.out $1.cpp -O2 -Wno-unused-result -Wfatal-errors
	elif [ "$2" == "-f" ]
	then
		g++ -std=c++17 -Wshadow -Wall -o $1.out $1.cpp -O2 -Wno-unused-result
	elif [ "$2" == "" ]
	then
		g++ -std=c++17 -Wshadow -Wall -o $1.out $1.cpp -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -g -DLOCAL
	else
		echo -e '\e[0;31m#___Undefined flag' ' $2 ' '___#\e[m'
		exit 1
	fi

elif [ -f $1.java ]
then
else
	echo -e '\e[0;31m#___Cna't Handle FileType___#\e[m'
	exit 1
fi
