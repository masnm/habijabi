#!/bin/bash

while (( "$#" ));
do
	tname=$1
	shift
	vname=$1
	shift
	echo "	public " $tname " get"$vname " () {"
	echo "		return this."$vname " }"
	echo "	public void set"$vname " ( " $tname "_"$vname" ) {"
	echo "		this."$vname " = _"$vname " }"
	echo ""
done
