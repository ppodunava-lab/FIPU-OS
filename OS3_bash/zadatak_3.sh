#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SCREENSHOTS_DIR="$SCRIPT_DIR/screenshots"

if [ ! -d "$SCREENSHOTS_DIR" ]; then
echo "Direktorij screenshots ne postoji"
exit 1
fi

BROJ=1

for datoteka in "$SCREENSHOTS_DIR"/*; do
if [ -f "$datoteka" ]; then
IME="$(basename "$datoteka")"
NOVO_IME="screenshot_${BROJ}_${IME}"
mv "$datoteka" "$SCREENSHOTS_DIR/$NOVO_IME"
BROJ=$((BROJ + 1))
fi
done

for datoteka in "$SCREENSHOTS_DIR"/*; do
if [ -f "$datoteka" ]; then
echo "$(basename "$datoteka")"
fi
done