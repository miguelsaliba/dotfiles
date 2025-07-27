#!/usr/bin/env bash

light_theme="Graphite-light"
dark_theme="Graphite"

## Toggles between light and dark GTK themes, or reports current theme.
## Usage:
##   toggle_dark.sh             # toggle and echo new theme
##   toggle_dark.sh light       # set light
##   toggle_dark.sh dark        # set dark
##   toggle_dark.sh info        # just report current
##   Add -j/--json for JSON output

set -euo pipefail

json=false
info=false
requested=""

# Read current GNOME color-scheme and return "light" or "dark"
detect_state() {
  local color_scheme
  color_scheme=$(gsettings get org.gnome.desktop.interface color-scheme)
  if [[ "$color_scheme" == "'prefer-dark'" ]]; then
    echo "dark"
  else
    echo "light"
  fi
}

# Apply GTK theme based on $1 ("light" or "dark")
apply_theme() {
  if [[ "$1" == "light" ]]; then
    gsettings set org.gnome.desktop.interface gtk-theme "$light_theme"
    gsettings set org.gnome.desktop.interface color-scheme "prefer-light"
  else
    gsettings set org.gnome.desktop.interface gtk-theme "$dark_theme"
    gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
  fi
}

# Output a state string or JSON depending on $json
output_state() {
  if $json; then
    printf '{"alt":"%s"}\n' "$1"
  else
    echo "$1"
  fi
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -j|--json) json=true ;;
    info)      info=true ;;
    light|dark) requested="$1" ;;
    toggle)    requested="" ;;
    *)         requested="$1" ;;
  esac
  shift
done

if $info; then
  output_state "$(detect_state)"
  exit
fi

if [[ -z "$requested" ]]; then
  # Toggle
  target=$(detect_state)
  target=$([[ "$target" == "dark" ]] && echo light || echo dark)
else
  # explicit, only "light" accepted
  target=$([[ "$requested" == "light" ]] && echo light || echo dark)
fi

apply_theme "$target"
output_state "$target"
