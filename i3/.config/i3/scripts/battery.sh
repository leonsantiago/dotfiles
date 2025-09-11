#!/usr/bin/env bash
# Lee /sys/class/power_supply para obtener un % real, incluso con varias baterías.
# También muestra ⚡ si está cargando.

bats=(/sys/class/power_supply/BAT*)
enow=0
efull=0

for b in "${bats[@]}"; do
  [[ -d "$b" ]] || continue

  if [[ -r "$b/energy_now" && -r "$b/energy_full" ]]; then
    now=$(cat "$b/energy_now")
    full=$(cat "$b/energy_full")
  elif [[ -r "$b/charge_now" && -r "$b/charge_full" ]]; then
    now=$(cat "$b/charge_now")
    full=$(cat "$b/charge_full")
  elif [[ -r "$b/capacity" ]]; then
    # Fallback: si solo hay 'capacity' (0–100), lo tratamos como %
    now=$(cat "$b/capacity")
    full=100
  else
    continue
  fi

  enow=$((enow + now))
  efull=$((efull + full))
done

# Evitar división por cero
if [[ $efull -eq 0 ]]; then
  echo "BAT N/A"
  exit 0
fi

pct=$(( 100 * enow / efull ))

# Detectar si está cargando: cualquier adaptador online = cargando
state="Discharging"
for a in /sys/class/power_supply/AC* /sys/class/power_supply/ADP*; do
  if [[ -r "$a/online" ]] && [[ $(cat "$a/online") -eq 1 ]]; then
    state="Charging"
  fi
done

icon=""
if [[ "$state" == "Charging" ]]; then
  icon="⚡ "
fi

# Salida simple para i3blocks (full_text)
printf "%s%d%%\n" "$icon" "$pct"
