#!/bin/sh
# Lock screen when laptop lid is closed
DISPLAY=:0
XAUTHORITY=/home/$USER/.Xauthority

pgrep i3lock >/dev/null || i3lock
