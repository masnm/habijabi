#!/bin/bash

if [ "$1" == "-h" ]
then
	echo 'currently only support java project'
	echo 'java project : <cmnd> <project name>'
	exit 0
fi

if [ "$2" == "" ]
then
	echo -e '\e[0;31m#___Language Name is Empty___#\e[m'
	exit 1
fi

if [ "$1" == "c" ]
then
	echo -e '\e[0;31m#___Dont support C yet___#\e[m'
	exit 1
elif [ "$1" == "cpp" ]
then
	echo -e '\e[0;31m#___Dont support C++ yet___#\e[m'
	exit 1
elif [ "$1" == "java" ]
then
	mkdir $2
	cp -r $HOME/codes/habijabi/Snippets/java/*.java $2/
	#NAME='1i package ${2}; '
	#echo $NAME
	#sed -i $NAME $2/Main.java
	(echo "package ${2};" && cat $2/Main.java) > $2/filename1 && mv $2/filename1 $2/Main.java
	(echo "package ${2};" && cat $2/FastScanner.java) > $2/filename1 && mv $2/filename1 $2/FastScanner.java
	echo "Project ${2} is created Successfully"
else
	echo -e '\e[0;31m#___Cnat Handle This___#\e[m'
	exit 1
fi
