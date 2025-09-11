
#!/usr/bin/env bash
# ~/.config/fix_resolution.sh  — versión autodetect

# Detecta la salida HDMI conectada (la primera coincidente)
HDMI=$(xrandr | awk '/ connected/ && /HDMI/ {print $1; exit}')

# Si encontró algo, cambia modo/frecuencia
if [ -n "$HDMI" ]; then
  xrandr --output "$HDMI" --mode 1920x1080 --rate 60
else
  notify-send "fix_resolution" "⚠️  No hay salida HDMI conectada"
fi
