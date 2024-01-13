#!/bin/zsh

case $BLOCK_BUTTON in
  1) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
  4) pactl set-sink-volume @DEFAULT_SINK@ +5% ;;
  5) pactl set-sink-volume @DEFAULT_SINK@ -5% ;;
esac

LEFT_VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | awk '{print $5}')
RIGHT_VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | awk '{print $12}')

LEFT_VOLUME=${LEFT_VOLUME::-1}
RIGHT_VOLUME=${RIGHT_VOLUME::-1}

VOLUME=""

if [[ $LEFT_VOLUME == $RIGHT_VOLUME ]]; then
    VOLUME="$LEFT_VOLUME"
else
    VOLUME="$LEFT_VOLUME $RIGHT_VOLUME"
fi

ICON=
MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
if [[ $MUTED == "yes" ]]; then
    ICON=󰝟
fi

printf "%s  %s\n" $ICON $VOLUME
printf "%s\n" $VOLUME
