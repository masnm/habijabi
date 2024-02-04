#!/bin/zsh

case $BLOCK_BUTTON in
  4) brightnessctl set +5% > /dev/null;;
  5) brightnessctl set 5%- > /dev/null;;
esac

VALUE=$(brightnessctl g)

printf "%s\n" $VALUE
