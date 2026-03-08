#!/bin/bash

if [ -f ~/.local/state/wallpaper ]; then
    . ~/.local/state/wallpaper
fi

wallpaper="${1:-$wallpaper}"

if [[ -v $wallpaper || -z $wallpaper ]]; then
    echo "You must provide a wallpaper" >&2
    exit
fi

matugen image "${wallpaper:?You must provide a wallpaper}" -m ${theme:=dark} --source-color-index 0

typeset -p wallpaper theme > ~/.local/state/wallpaper
