#!/bin/bash

if [ "$1" == "" ]; then
	echo -e '\e[0;31m#___File Name is Empty___#\e[m'
	exit 1
fi

filename=$1

if [[ "$1" == *.c ]]; then
	if [ "$2" == "-f" ]; then
		gcc -std=c11 -Wshadow -Wall -o ${filename::-2}.out $1 -O2 -Wno-unused-result
	elif [ "$2" == "" ]; then
		gcc -std=c11 -Wshadow -Wall -o ${filename::-2}.out $1 -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -g -DLOCAL
	else
		echo -e '\e[0;31m#___Undefined flag' ' $2 ' '___#\e[m'
		exit 1
	fi

	if [ $? == 0 ]; then
		time ./${filename::-2}.out
		rm ${filename::-2}.out
	fi

elif [[ "$1" == *.cpp ]]; then
	if [ "$2" == "-f" ]; then
		g++ -std=c++17 -Wshadow -Wall -o ${filename::-4}.out $1 -O2 -Wno-unused-result
	elif [ "$2" == "" ]; then
		g++ -std=c++17 -Wshadow -Wall -o ${filename::-4}.out $1 -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -g -DLOCAL
	else
		echo -e '\e[0;31m#___Undefined flag' ' $2 ' '___#\e[m'
		exit 1
	fi

	if [ $? == 0 ]; then
		time ./${filename::-4}.out
		rm ${filename::-4}.out
	fi

elif [[ "$1" == *.java ]]; then
	# TODO: need to work on multiple java files
	javac $1
	if [ $? == 0 ]; then
		time java ${filename::-5}
		rm *.class
	fi

else
	echo -e '\e[0;31m#___Provided File ' '$filename' '__#\e[m'
	echo -e '\e[0;31m#___Cant handle this FileType___#\e[m'
	exit 1
fi
