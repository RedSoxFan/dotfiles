#!/usr/bin/env sh

# Terminate any instances of polybar and wait for them to close
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bars
polybar top &
polybar bottom &
