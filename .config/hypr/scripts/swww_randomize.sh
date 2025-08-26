#!/bin/sh

# Selects wallpaper randomly from the wallpaper directory

# Path to wallpapepr directory
WALLPAPER_DIRECTORY=$1

if [ -z "$WALLPAPER_DIRECTORY" ]; then
    echo "Please, specify the path to the directory with wallapeprs."
    exit 1
fi

echo "$WALLPAPER_DIRECTORY"
echo $(ls "$WALLPAPER_DIRECTORY")