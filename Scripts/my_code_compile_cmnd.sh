#!/bin/bash

if [ "$1" == "" ]
then
	echo -e '\e[0;31m#___File Name is Empty___#\e[m'
	exit 1
fi

if [ "$2" == "-f" ]
then
	g++ -std=c++17 -Wshadow -Wall -o $1.out $1.cpp -O2 -Wno-unused-result
elif [ "$2" == "" ]
then
	g++ -std=c++17 -Wshadow -Wall -o $1.out $1.cpp -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -g -DLOCAL
else
	echo -e '\e[0;31m#___File Name is Empty___#\e[m'
	exit 1
fi
exit 1
