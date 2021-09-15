#!/bin/bash

if [ "$1" == "" ]
then
	echo -e '\e[0;31m#___File Name is Empty___#\e[m'
	exit 1
fi

if [ -f $1.c ]
then
	# this is an c file
	echo 'not implemented yet'
elif [ -f $1.cpp ]
then
	# this is an cpp file
	if [ -f $1in1 ]
	then
		rm $1in*
	fi
	
	if [ -f $1.out ]
	then
		rm $1.out
	fi
	
	if [ -f $1out1 ]
	then
		rm $1out*
	fi
	
	if [ -f in1 ]
	then
		rm in*
	fi
elif [ -f $1.java ]
then
	# this is an java file
	rm *.class
else
	# unknown
fi

