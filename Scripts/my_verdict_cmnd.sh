#!/bin/bash

# TODO: need refactor for variables

if [ "$1" == "" ]; then
	printf '\e[0;31m#___File Name is Empty___#\e[m\n'
	exit 1
fi

if [[ "$1" == *.c ]]; then
	filename=$1
	gcc -std=c11 -Wshadow -Wall -Wextra -pedantic -o ${filename::-2}.out $1 -fsanitize=address -fsanitize=undefined     -D_GLIBCXX_DEBUG -g -DLOCAL
	if [ $? != 0 ]; then
		exit 1
	fi
	
	if [ "$2" == "" ]; then
		for (( i = 1 ; i < 6 ; ++i ));
		do
			if [ -f ${filename::-2}in$i ]; then
				printf '\e[0;33m Output '$i'\e[m\n'
				./${filename::-2}.out < ${filename::-2}in$i
			fi
		done
	else
		echo 'Output '$2
		./${filename::-2}.out < $2
	fi

	rm ${filename::-2}.out

elif [[ "$1" == *.cpp ]]; then
	filename=$1
	g++ -std=c++17 -Wshadow -Wall -Wextra -pedantic -o ${filename::-4}.out $1 -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -g -DLOCAL
	if [ $? != 0 ]; then
		exit 1
	fi

	if [ "$2" == "" ]; then
		for (( i = 1 ; i < 6 ; ++i ));
		do
			if [ -f ${filename::-4}in$i ]; then
				printf '\e[0;33m Output '$i'\e[m\n'
				./${filename::-4}.out < ${filename::-4}in$i
			fi
		done
	else
		echo 'Output '$2
		./${filename::-4}.out < $2
	fi

	rm ${filename::-4}.out

elif [[ "$1" == *.java ]]; then
	filename=$1
	javac $1
	if [ $? != 0 ]; then
		exit 1
	fi

	if [ "$2" == "" ]; then
		for (( i = 1 ; i < 6 ; ++i ));
		do
			if [ -f ${filename::-5}in$i ]; then
				printf '\e[0;33m Output '$i'\e[m\n'
				java ${filename::-5} < ${filename::-5}in$i
			fi
		done
	else
		echo 'Output '$2
		java $1 < $2
	fi

	rm ${filename::-5}.class

else
	printf '\e[0;31m#___Cant Handle FileType___#\e[m\n'
fi
