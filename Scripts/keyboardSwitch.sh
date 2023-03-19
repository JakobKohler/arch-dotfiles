#!/bin/sh
CURRENT_LAYOUT_STR=$(setxkbmap -query | grep layout)

arr=($CURRENT_LAYOUT_STR)

CURRENT_LAYOUT=${arr[N-1]}

if [ "$CURRENT_LAYOUT" == "us" ];then
	setxkbmap -layout de
	dunstify -a "Keyboard Layout" -i input-keyboard -t 1500 "German (QWERTZ)"
else
	setxkbmap -layout us
	dunstify -a "Keyboard Layout" -i input-keyboard -t 1500 "United States (QWERTY)"
fi
