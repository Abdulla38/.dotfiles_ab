#!/bin/sh

# Selects wallpaper randomly from the wallpaper directory

# Path to wallpapepr directory
WALLPAPER_DIRECTORY=$1

# Image formats supported by swww
IMAGE_FORMATS=(".avif" "jpeg" "jpg" "png" "gif" "pnm" "tga" "tiff" "tif" "webp" "bmp" "ff" "svg")

# Checking that the argument is passed
if [ -z "$WALLPAPER_DIRECTORY" ]; then
    echo "Please, specify the path to the directory with wallapeprs. You made a pointless argument."
    exit 1
fi

echo "$WALLPAPER_DIRECTORY"
echo $(ls "$WALLPAPER_DIRECTORY")