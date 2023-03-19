#!/bin/sh

MSG="brightnesscontrol"

function send_notification {
  icon="preferences-system-brightness-lock"
  brightness=$(light)
  dunstify -a "Brigthness Control" -u low -i $icon -h string:x-dunst-stack-tag:$MSG -h int:value:"${brightness}" "Brightness: ${brightness}%"
}

case $1 in
  down)
    brightnessctl --min-val=2 -q set 3%-
    send_notification
    ;;
  up)
    brightnessctl -q set 3%+
    send_notification
    ;;
esac