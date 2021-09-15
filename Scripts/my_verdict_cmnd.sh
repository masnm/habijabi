#!/bin/bash
if [ "$1" == "" ]
then
	echo -e '\e[0;31m#___File Name is Empty___#\e[m'
	exit 1
fi

if [ "$2" == "-1" ]
then
	g++ -std=c++17 -Wshadow -Wall -o $1.out $1.cpp -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -g -DLOCAL -Wfatal-errors
	exit 1
fi

g++ -std=c++17 -Wshadow -Wall -o $1.out $1.cpp -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -g -DLOCAL
if [ $? != 0 ]
then
	exit 1
fi

if [ "$2" == "" ]
then
	for (( i = 1 ; i < 6 ; ++i ));
	do
		if [ -f $1in$i ]
		then
			echo 'Output '$i
			./$1.out < $1in$i
		fi
	done
else
	echo 'Output '$2
	./$1.out < $2
fi

rm $1.out
