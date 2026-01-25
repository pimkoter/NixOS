#!/usr/bin/env bash

# Bottom system monitor
kitty --initial-window-position=100,200 --class=decor-kitty-btm -e btm &

# Audio visualizer
kitty --class=decor-kitty-cava -e cava &

# FastFetch 
kitty --class=decor-kitty-fastfetch -e bash -c "while true; do clear; fastfetch; sleep 1m; done"

disown
