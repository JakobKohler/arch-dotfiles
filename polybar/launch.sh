#!/bin/bash

pkill polybar
#polybar main 2>&1 | tee -a /tmp/polybar.log & disown
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload main &
fi
