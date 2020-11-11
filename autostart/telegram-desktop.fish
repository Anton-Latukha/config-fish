#!/usr/bin/env fish
telegram-desktop &
sleep 2
wmctrl -r 'telegram' -t 2
