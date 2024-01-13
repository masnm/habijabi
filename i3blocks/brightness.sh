#!/bin/zsh

case $BLOCK_BUTTON in
  4) xbacklight -inc 5 ;;
  5) xbacklight -dec 5 ;;
esac

PERCENT=$(xbacklight -get)

printf "%s\n" $PERCENT
