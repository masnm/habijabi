#!/bin/bash

if [ "$1" == "" ]
then
	echo -e '\e[0;31m#___File Name is Empty___#\e[m'
	exit 1
fi

if [ -f $1.c ]
then
	# this is an c file
	echo 'c file'
elif [ -f $1.cpp ]
then
	# this is an cpp file
	if [ "$2" == "-f" ]
	then
		g++ -std=c++17 -Wshadow -Wall -o $1.out $1.cpp -O2 -Wno-unused-result
	else
		g++ -std=c++17 -Wshadow -Wall -o $1.out $1.cpp -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -g -DLOCAL
	fi

	if [ $? == 0 ]
	then
		time ./$1.out
		rm $1.out
	fi
	# done running cpp file

elif [ -f $1.java ]
then
	# this is an java file
	# TODO: need to work on multiple java files
	javac $1.java
	if [ $? == 0 ]
	then
		time java $1
		rm $1
	fi
	echo 'java file'
else
	echo -e '\e[0;31m#___Cant handle this FileType___#\e[m'
	exit 1
fi
