#!/bin/bash

# Mengecek apakah path folder diberikan
if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/folder"
  exit 1
fi

FOLDER="$1"
COUNTER=1

# Masuk ke folder target
cd "$FOLDER" || { echo "Folder not found: $FOLDER"; exit 1; }

# Loop untuk semua file reguler (tidak termasuk folder), disortir
for FILE in $(ls -p | grep -v / | sort); do
  EXT="${FILE##*.}"
  NEWNAME="Stylosa_${COUNTER}.$EXT"
  mv "$FILE" "$NEWNAME"
  ((COUNTER++))
done

echo "Rename selesai. Total file: $((COUNTER - 1))"
