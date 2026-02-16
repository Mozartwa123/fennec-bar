#!/bin/bash

pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d "%"
pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2 }'
