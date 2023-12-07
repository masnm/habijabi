#!/bin/zsh

VALUE=$(mpstat 1 1 | tail -n 1 | awk '{print $NF}')
USAGE=$((100.00 - $VALUE))

printf "%.2f\n" $USAGE
printf "%.1f\n" $USAGE

if [[ $USAGE -ge 75.00 ]]; then
    print "#FF0000"
elif [[ $USAGE -ge 55.00 ]]; then
    print "#FFFC00"
elif [[ $USAGE -ge 25.00 ]]; then
    print "#EBDBB2"
fi
