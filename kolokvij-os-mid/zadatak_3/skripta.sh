#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Greška: potrebno je proslijediti točno 1 argument."
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Greška: direktorij ne postoji."
    exit 2
fi

broj=$(find "$1" -maxdepth 1 -type f | wc -l)

echo "$broj"
echo "$broj" > broj_datoteka.txt
