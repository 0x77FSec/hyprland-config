#!/bin/bash

# Start the daemon if it isn't already running
pgrep -x awww-daemon >/dev/null || awww-daemon &

sleep 0.5

# Set wallpaper
awww img \
    --outputs eDP-1 \
# add your path to picture
    ~/home/path-to-picture \
    --transition-type simple \
    --transition-duration 1
