#!/bin/bash

# sensible cache path
cache="$XDG_CACHE_HOME/fuzzel-commands"

# ensure cache file exists
mkdir -p "$(dirname "$cache")"
touch "$cache"

# run fuzzel with cache if non-empty
if [ -s "$cache" ]; then
    # extract command part before '|'
    input=$(awk -F'|' '{print $1}' "$cache")
    cmd=$(printf "%s\n" "$input" | fuzzel --dmenu --cache="$cache" --prompt="Run: ")
else
    # cache empty → just run fuzzel normally
    cmd=$(fuzzel --dmenu --cache="$cache" --prompt="Run: ")
fi

# exit if nothing typed
[ -z "$cmd" ] && exit 0

# run the command
bash -c "$cmd"

# update cache: either increment if exists, or add new entry
if grep -q "^$cmd|" "$cache"; then
    # increment the counter
    awk -F'|' -v c="$cmd" 'BEGIN{OFS="|"} $1==c{$2=$2+1}1' "$cache" > "${cache}.tmp" && mv "${cache}.tmp" "$cache"
else
    # add new entry with count 1
    echo "$cmd|1" >> "$cache"
fi
