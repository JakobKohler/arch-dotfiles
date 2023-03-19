#!/bin/sh

MSG="volumecontrol"

function get_volume {
    amixer get Master | tail -1 | awk '{print $5}' | sed 's/[^0-9]*//g'
}

function get_toggle {
    amixer get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g'
}

function send_notification {
    volume=$(get_volume)
    toggle_state=$(get_toggle)

    #icon_muted="audio-speaker-mono"
    icon_audio="audio-speaker-mono"
    icon_muted="audio-speaker-mono"
  
    if [[ $volume == 0 || "$toggle_state" == "off" ]]; then
        dunstify -a "Volume Control" -u low -i $icon_muted -h string:x-dunst-stack-tag:$MSG "Audio muted" 
    else
        dunstify -a "Volume Control" -u low -i $icon_audio -h string:x-dunst-stack-tag:$MSG -h int:value:"${volume}" "Volume: ${volume}%"
    fi

}

case $1 in
  down)
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    send_notification
    ;;
  up)
    pactl set-sink-volume @DEFAULT_SINK@ +5%
    send_notification
    ;;
  mute)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    send_notification
    ;;
esac
