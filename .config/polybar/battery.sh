#!/bin/bash
BAT=$(acpi -b | grep -Po "\d+(?=%)")
AC=$(acpi -a | grep -o on | sed 's/on//')

if [ ! -z $AC ]; then
	echo "%{B$2 F$1} $AC $BAT% "
elif [ $BAT -lt 20 ]; then
	echo "%{B$2 F$3}%{B$3 F$1} $BAT%%{B$2 F$3}"
else
	SYM=""
	if [ $BAT -ge 60 ]; then
		SYM=""
	elif [ $BAT -ge 40 ]; then
		SYM=""
	elif [ $BAT -ge 20 ]; then
		SYM=""
	fi;
	echo "%{B$2 F$1} $SYM $BAT% "
fi;
