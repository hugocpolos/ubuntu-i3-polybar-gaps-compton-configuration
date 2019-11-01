#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Set variables
size_border=1
size_gap=5

padding_top=0
padding_bottom=0
padding_left=0
padding_right=0

color_normal_border="#666666"
color_active_border="#666666"
color_focused_border="#cccccc"
color_presel_feedback="#888888"

setting_borderless_monocle='false'

polybar_config="$CURRENT_THEME/polybar"
polybar_bars=(top bottom)

# Launch example
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload top &
  done
else
  polybar --reload top &
fi

echo "Bars launched..."
