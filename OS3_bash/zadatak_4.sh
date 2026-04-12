#!/bin/bash
if [ $# -ne 1 ]; then
echo "Potrebno je proslijediti samo jedan argument"
exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$SCRIPT_DIR/$1"

if [ ! -d "$TARGET_DIR" ]; then
echo "Direktorij ne postoji"
exit 1
fi

cd "$TARGET_DIR" || exit 1
powershell -Command "Compress-Archive -Path '*' -DestinationPath 'svi_zapisi.zip' -Force"
echo "Datoteke su komprimirane u svi_zapisi.zip"