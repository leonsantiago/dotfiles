#!/usr/bin/env bash
set -u

INTERNAL_REGEX='^(eDP|LVDS|DSI)'
INTERNAL=''
EXTERNAL=''

# Salidas conectadas
mapfile -t CONNECTED < <(xrandr --query | awk '/ connected/{print $1}')

for OUT in "${CONNECTED[@]}"; do
  if [[ $OUT =~ $INTERNAL_REGEX ]]; then
    INTERNAL=$OUT
  else
    EXTERNAL=$OUT
  fi
done

# Si no hay panel interno, no seguimos (caso rarísimo)
if [[ -z "${INTERNAL:-}" ]]; then
  notify-send "⚠️ Monitor toggle" "No se detectó salida interna."
  exit 1
fi

# **FALLBACK**: si no hay externo conectado, aseguro el interno y salgo
if [[ -z "${EXTERNAL:-}" ]]; then
  xrandr --output "$INTERNAL" --auto --primary
  notify-send "🖥️ Solo interno" "No hay monitor externo conectado; activando panel interno."
  exit 0
fi

# Detectar qué salidas están activas (tienen resolución)
ACTIVE_OUTPUTS=$(xrandr --query | awk '/ connected [^(]*[0-9]+x[0-9]+/ {print $1}')

INTERNAL_ACTIVE=false
EXTERNAL_ACTIVE=false
for OUT in $ACTIVE_OUTPUTS; do
  [[ "$OUT" == "$INTERNAL" ]] && INTERNAL_ACTIVE=true
  [[ "$OUT" == "$EXTERNAL" ]] && EXTERNAL_ACTIVE=true
done

# Lógica de cambio de estado
if $INTERNAL_ACTIVE && ! $EXTERNAL_ACTIVE; then
  # Solo interno → extender
  xrandr --output "$INTERNAL" --auto --primary \
         --output "$EXTERNAL" --auto --above "$INTERNAL"
  notify-send "🖥️🖥️ Modo extendido" "Monitor interno + externo activos"
elif $INTERNAL_ACTIVE && $EXTERNAL_ACTIVE; then
  # Extendido → solo externo (enciende externo antes, apaga interno después)
  xrandr --output "$EXTERNAL" --auto --primary \
         --output "$INTERNAL" --off
  notify-send "🖥️ Solo externo" "Monitor externo activado"
else
  # Solo externo → solo interno (enciende interno antes, apaga externo después)
  xrandr --output "$INTERNAL" --auto --primary \
         --output "$EXTERNAL" --off
  notify-send "🖥️ Solo interno" "Monitor interno activado"
fi
