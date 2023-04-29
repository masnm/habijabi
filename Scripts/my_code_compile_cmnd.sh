#!/bin/bash

if [ "$1" == "" ]; then
	echo -e '\e[0;31m#___File Name is Empty___#\e[m'
	exit 1
fi

if [[ "$1" == *.c ]]; then
	filename=$1
	if [ "$2" == "-1" ]; then
		gcc -std=c11 -Wshadow -Wall -Wextra -pedantic -o ${filename::-2}.out $1 -O2 -Wno-unused-result -Wfatal-errors
	elif [ "$2" == "-f" ]; then
		gcc -std=c11 -Wshadow -Wall -Wextra -pedantic -o ${filename::-2}.out $1 -O2 -Wno-unused-result
	elif [ "$2" == "" ]; then
		gcc -std=c11 -Wshadow -Wall -Wextra -pedantic -o ${filename::-2}.out $1 -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -g -DLOCAL
	else
		echo -e '\e[0;31m#___Undefined flag' ' $2 ' '___#\e[m'
		exit 1
	fi

elif [[ "$1" == *.cpp ]]; then
	filename=$1
	if [ "$2" == "-1" ]; then
		g++ -std=c++20 -Wshadow -Wall -Wextra -pedantic -o ${filename::-4}.out $1 -O2 -Wno-unused-result -Wfatal-errors
	elif [ "$2" == "-f" ]; then
		g++ -std=c++20 -Wshadow -Wall -Wextra -pedantic -o ${filename::-4}.out $1 -O2 -Wno-unused-result
	elif [ "$2" == "" ]; then
		g++ -std=c++20 -Wshadow -Wall -Wextra -pedantic -o ${filename::-4}.out $1 -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -g -DLOCAL
	else
		echo -e '\e[0;31m#___Undefined flag' ' $2 ' '___#\e[m'
		exit 1
	fi

elif [[ "$1" == *.py ]]; then
	echo -e '\e[0;32m#This is a Script.#\e[m'

elif [[ "$1" == *.java ]]; then
	#TODO: Learn about 'Java' compilation flag
	javac $1
	if [ $? != 0 ]; then
		echo -e '\e[0;31m#___Compilation_Failed___#\e[m'
		exit 1
	fi

else
	echo -e '\e[0;31m#___Cnat Handle FileType___#\e[m'
	exit 1
fi
