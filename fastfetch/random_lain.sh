#!/bin/bash

DIR="$HOME/.config/fastfetch/lain"
QUEUE="$HOME/.cache/lain_queue"

mkdir -p "$HOME/.cache"

if [ ! -s "$QUEUE" ]; then
    find "$DIR" -maxdepth 1 -type f \
        \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) \
        | shuf > "$QUEUE"
fi

IMG=$(head -n1 "$QUEUE")
tail -n +2 "$QUEUE" > "$QUEUE.tmp"
mv "$QUEUE.tmp" "$QUEUE"

echo "$IMG"