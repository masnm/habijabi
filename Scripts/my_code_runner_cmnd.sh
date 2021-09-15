#!/bin/bash

if [ "$1" == "" ]
then
	echo -e '\e[0;31m#___File Name is Empty___#\e[m'
	exit 1
fi

if [ -f $1.c ]
then
	# this is an c file
	if [ "$2" == "-f" ]
	then
		gcc -std=c11 -Wshadow -Wall -o $1.out $1.c -O2 -Wno-unused-result
	else
		gcc -std=c11 -Wshadow -Wall -o $1.out $1.c -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -g -DLOCAL
	fi

	if [ $? == 0 ]
	then
		time ./$1.out
		rm $1.out
	fi
	# done running c file

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
		rm *.class
	fi
	# done running java file
elif [ -d $1 ]
then
	# doing for java package runn # no auto input
	if [ -f $1/$2.java ]
	then
		javac $1/*.java
		if [ $? == 0 ]
		then
			java $1/$2
			rm $1/*.class
			exit 0
		else
			echo 'Compilation falied'
			exit 1
		fi
	else
		echo 'file ' $1'/'$2'.java not found'
		exit 1
	fi
else
	echo -e '\e[0;31m#___Cant handle this FileType___#\e[m'
	exit 1
fi
