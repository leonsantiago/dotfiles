#!/usr/bin/env bash
set -euo pipefail

current="$(pactl info | awk -F': ' '/Default Sink/{print $2}')"
mapfile -t sinks < <(pactl list short sinks | awk '{print $2}')
# encontrar el índice del current
idx=0
for i in "${!sinks[@]}"; do
  [[ "${sinks[$i]}" == "$current" ]] && idx=$i && break
done
# siguiente
next="${sinks[$(( (idx+1) % ${#sinks[@]} ))]}"

pactl set-default-sink "$next"

# mover todo lo que suena al nuevo sink
for input in $(pactl list short sink-inputs | awk '{print $1}'); do
  pactl move-sink-input "$input" "$next"
done

notify-send "Audio" "Salida: $next"
