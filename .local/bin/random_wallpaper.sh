#! /usr/bin/bash

image=$(find ~/Pictures/wallpapers -type f | shuf -n 1)

matugen image "$image"
