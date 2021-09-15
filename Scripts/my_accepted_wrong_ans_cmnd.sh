#!/bin/bash

if [ "$1" == "" ]
then
	echo -e '\e[0;31m#___File Name is Empty___#\e[m'
	exit 1
fi

# compiling the code
g++ -std=c++17 -Wshadow -Wall -o $1.out $1.cpp -O2 -Wno-unused-result

# loopint all the input and testing
for (( i = 1 ; i < 6 ; ++i ));
do
	if [ -f $1in$i ]
	then
		./$1.out < $1in$i > script_output
		DIFF=$(diff -wB script_output $1out$i)
		if [ "$DIFF" == "" ]
		then
			echo -e '\e[0;32m#________Accepted________#\e[m'
		else
			echo -e '\e[0;31m#________Wrong Answer________#\e[m'
			echo -e '\e[0;32m# On test ' $i ' #\e[m'
			echo -e '\e[0;32mAnswer : \e[m'
			cat $1out$i
			echo -e '\e[0;31mOutput : \e[m'
			./$1.out < $1in$i
			exit 1
		fi
	fi
done
