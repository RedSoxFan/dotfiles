#!/bin/bash

state=$(playerctl status 2>/dev/null | grep -E "(Playing|Paused)" | sed "s/Playing//" | sed "s/Paused//")

artist=$(playerctl metadata 'xesam:artist' 2> /dev/null)
title=$(playerctl metadata 'xesam:title' 2> /dev/null)
ad=$(playerctl metadata 'mpris:trackid' 2> /dev/null | grep -E '^spotify:ad:')

if [ -z $ad ]; then
	echo $state" "$artist" - "$title | sed -r 's/^  - $//'
else
	echo $state" Advertisement"
fi
