#! /bin/bash

if [ "$#" -ne 2 ]; then
    echo "Error: illegal number of parameters."
    echo "Usage: ./resize-image.sh the/path/to/the/image.png 800"
    exit 1
fi

FILES=$1
MAX_SIZE=$2
WEBP_QUALITY=100

for file in $FILES; do

    # extract file basename and extension
    filename="${file%.*}"
    ext="${file##*.}"

    # resize image to fit max size
    echo "Resizing '${file}' (max size: ${MAX_SIZE})..."
    convert ${file} -resize "${MAX_SIZE}x${MAX_SIZE}" ${file}

    # convert resized image to webp format
    echo "Converting '${file}' to webp format (quality: ${WEBP_QUALITY})"
    webp="${filename}.webp"
    cwebp -q $WEBP_QUALITY ${file} -o $webp

    # delete the initial image file
    rm ${file}

done
