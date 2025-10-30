#!/bin/bash

PRIMARY="DP-1"
SECONDARY="DP-2"

# Read current position of secondary monitor
POSITION=$(hyprctl monitors all | grep "$SECONDARY" -A5 | grep "at" | awk '{print $3}')

# Check if monitors are mirrored (both at 0x0)
if [[ "$POSITION" == "0x0" ]]; then
    echo "Switching to extended mode..."
    hyprctl keyword monitor "$SECONDARY,1920x1080@119.88,1920x0,1" -r
else
    echo "Switching to mirrored mode..."
    hyprctl keyword monitor "$SECONDARY,1920x1080@119.88,0x0,1,mirror,$PRIMARY" -r
fi


