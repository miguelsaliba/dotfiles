#!/bin/sh
# Toggle caps:swapescape via localectl.
# Requires ability to run localectl (this script calls sudo localectl).

set -eu

# Read fields from localectl status
layout=$(localectl status | sed -n 's/^[[:space:]]*X11 Layout:[[:space:]]*//p')
variant=$(localectl status | sed -n 's/^[[:space:]]*X11 Variant:[[:space:]]*//p')
options=$(localectl status | sed -n 's/^[[:space:]]*X11 Options:[[:space:]]*//p')

# Ensure variables are not empty (localectl may print empty lines)
layout=${layout:-""}
variant=${variant:-""}
options=${options:-""}

# Option to toggle
TOGGLE="caps:swapescape"

if printf '%s\n' "$options" | grep -q -F "$TOGGLE"; then
    # remove the toggle option
    new_options=$(printf '%s' "$options" | sed -E 's/(^|,)'"$TOGGLE"'(,|$)/\1/g' | sed -E 's/^,|,$//g; s/,,/,/g')
else
    if [ -n "$options" ]; then
        new_options="$options,$TOGGLE"
    else
        new_options="$TOGGLE"
    fi
fi

# If variant is empty, pass empty string explicitly
# Use --no-convert to avoid converting to console keymap
sudo localectl set-x11-keymap "$layout" "$variant" "" "$new_options" --no-convert
