#!/bin/bash

# converting JPEG images
find $1 -type f -and \( -iname "*.jpg" -o -iname "*.jpeg" \) \
-exec bash -c '
webp_path=$(sed 's/\.[^.]*$/.webp/' <<< "$0");
if [ ! -f "$webp_path" ]; then 
  echo "$webp_path image ok";
  cwebp -quiet -q 85 "$0" -o "$webp_path";
fi;' {} \;

# converting PNG images
find $1 -type f -and -iname "*.png" \
-exec bash -c '
webp_path=$(sed 's/\.[^.]*$/.webp/' <<< "$0");
if [ ! -f "$webp_path" ]; then 
  echo "$webp_path image ok";
  cwebp -quiet -alpha_q 90 -q 85 "$0" -o "$webp_path";
fi;' {} \;
