#!/bin/bash
if [ "$1" == "" ]
then
	echo -e '\e[0;31m#___File Name is Empty___#\e[m'
	exit 1
fi

if [ -f $1.c ]
then
	gcc -std=c11 -Wshadow -Wall -o $1.out $1.c -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -g -DLOCAL
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
elif [ -f $1.cpp ]
then
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
elif [ -f $1.java ]
then
	javac $1.java
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
				java $1 < $1in$i
			fi
		done
	else
		echo 'Output '$2
		java $1 < $2
	fi

	rm *.class
else
	echo -e '\e[0;31m#___Cant Handle FileType___#\e[m'
fi
