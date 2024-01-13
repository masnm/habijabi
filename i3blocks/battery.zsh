#!/bin/zsh

STATUS=$(cat /sys/class/power_supply/BAT1/status)
CAPACITY=$(cat /sys/class/power_supply/BAT1/capacity)

ICON_CHARGE=(󰢟 󰢜 󰂆 󰂇 󰂈 󰢝 󰂉 󰢞 󰂊 󰂋 󰂅)
ICON_NORMAL=(󰂃 󰁺 󰁻 󰁼 󰁽 󰁾 󰁿 󰂀 󰂁 󰂂 󰁹)

OUTPUT=""
for (( i = 100 ; i > -1 ; i -= 10 )) do
    if [[ $CAPACITY -ge $i ]]; then
        (( index = 1 + ( i / 10 ) ))
        if [[ $STATUS == "Charging" ]]; then
            OUTPUT=$ICON_CHARGE[$index]
        else
            OUTPUT=$ICON_NORMAL[$index]
        fi
        break
    fi
done

OUTPUT="${OUTPUT} ${CAPACITY}"
printf "%s\n" $OUTPUT
