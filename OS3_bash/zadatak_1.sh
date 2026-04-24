#!/bin/bash
if [ $# -ne 2 ]; then
echo "Potrebno je proslijediti točno 2 argumenta"
exit 1
fi

DIR_PATH="$1"
EXT="$2"
FOUND=0

if [ ! -d "$DIR_PATH" ]; then
echo "Direktorij ne postoji"
exit 1
fi

for datoteka in "$DIR_PATH"/*; do
if [ -f "$datoteka" ] && [[ "$datoteka" == *"$EXT" ]]; then
echo "$(basename "$datoteka")"
FOUND=1
fi
done

if [ $FOUND -eq 0 ]; then
echo "Nema datoteka s nastavkom $EXT"
fi