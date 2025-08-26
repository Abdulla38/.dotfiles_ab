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

# Checking that the directory is exist
if [ ! -d "$WALLPAPER_DIRECTORY" ]; then
    echo "Error: $WALLPAPER_DIRECTORY is not a directory."
    exit 1
fi

# Searching for files in the required formats
found_image=false
for format in "${IMAGE_FORMATS[@]}"; do
    if ls -1 "$WALLPAPER_DIRECTORY"/*"$format" 1>/dev/null 2>&1; then
        found_image=true
        break
    fi
done

if [ "$found_image" = false ]; then
    echo "No suppourted image files found in $WALLPAPER_DIRECTORY"
    exit 1
fi

echo "$WALLPAPER_DIRECTORY"
echo $(ls "$WALLPAPER_DIRECTORY")