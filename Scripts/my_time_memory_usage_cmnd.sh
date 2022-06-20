#!/bin/bash

if [ "$1" == "" ]; then
	echo -e '\e[0;31m#___File Name is Empty___#\e[m'
	exit 1
fi

filename=$1

if [[ "$1" == *.cpp ]]; then
	g++ -std=c++17 -Wshadow -Wall -o ${filename::-4}.out $1 -O2 -Wno-unused-result

	if [ $? == 0 ]; then
		command time -f "%Mkb %Us" ./${filename::-4}.out < intm > outtm
		rm ${filename::-4}.out
	fi

elif [[ "$1" == *.c ]]; then
	gcc -std=c11 -Wshadow -Wall -o ${filename::-2}.out $1 -O2 -Wno-unused-result

	if [ $? == 0 ]; then
		command time -f "%Mkb %Us" ./${filename::-2}.out < intm > outtm
		rm ${filename::-2}.out
	fi

else
	echo -e '\e[0;31m#___Not Inplementd Yet___#\e[m'
	exit 1

fi
