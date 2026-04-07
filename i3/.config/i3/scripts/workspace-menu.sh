#!/bin/sh

ws=$(i3-msg -t get_workspaces | jq -r '.[].name' | rofi -dmenu -p "Workspace")

[ -n "$ws" ] && i3-msg workspace "$ws"
