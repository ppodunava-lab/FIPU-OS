#!/bin/bash
if [ $# -ne 1 ]; then
echo "Potrebno je proslijediti točno jedan argument"
exit 1
fi

REPO_PATH="$1"

if [ ! -d "$REPO_PATH" ]; then
echo "Direktorij na zadanoj putanji ne postoji"
exit 1
fi

if [ ! -d "$REPO_PATH/.git" ]; then
echo "Direktorij nije Git repozitorij"
exit 1
fi

INFO_FILE="$REPO_PATH/repozitorij_info.txt"

echo "Putanja repozitorija: $REPO_PATH" > "$INFO_FILE"
echo "Naziv direktorija: $(basename "$REPO_PATH")" >> "$INFO_FILE"
echo "Datum: $(date)" >> "$INFO_FILE"

git -C "$REPO_PATH" add repozitorij_info.txt
git -C "$REPO_PATH" commit -m "Dodana datoteka repozitorij_info.txt"
git -C "$REPO_PATH" log --oneline