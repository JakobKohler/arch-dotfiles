#!/bin/bash

targetWorkSpace="$1"
program="$2"

if (pgrep $program > /dev/null)
then
	i3-msg  workspace $targetWorkSpace
else
	i3-msg workspace $targetWorkSpace
	$program & disown $program
fi
