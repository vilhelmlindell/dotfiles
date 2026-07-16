#!/bin/sh

# Path to the "available preferences" file
EPP_AVAILABLE="/sys/devices/system/cpu/cpu0/cpufreq/energy_performance_available_preferences"
EPP_TARGET_GLOB="/sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference"
CACHE_PATH="${XDG_CACHE_HOME:-$HOME/.cache}/energy_performance_preference"

# Read available modes
if [ ! -r "$EPP_AVAILABLE" ]; then
    echo "Cannot read available EPP preferences."
    exit 1
fi

# Load available options as an array-like string
available="$(cat "$EPP_AVAILABLE")"

# Present options through fuzzel
choice="$(printf "%s\n" $available | fuzzel --dmenu --prompt='EPP: ' --cache="$CACHE_PATH")"

# Abort if empty selection
if [ -z "$choice" ]; then
    exit 0
fi

# Validate choice – must match one of the available values
found=0
for opt in $available; do
    if [ "$opt" = "$choice" ]; then
        found=1
        break
    fi
done

if [ "$found" -ne 1 ]; then
    echo "Invalid EPP selection: '$choice'"
    echo "Valid options: $available"
    exit 1
fi

# Apply choice to all CPUs
for f in $EPP_TARGET_GLOB; do
    echo "$choice" > "$f"
done

echo "Set energy_performance_preference to: $choice"
