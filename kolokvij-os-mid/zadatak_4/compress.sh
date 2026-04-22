#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Greška: potrebno je proslijediti točno 2 argumenta."
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Greška: direktorij za komprimiranje ne postoji."
    exit 2
fi

if [ -e "$2" ]; then
    echo "Greška: izlazna datoteka već postoji."
    exit 3
fi

zip -j -r "$2" "$1"

if [ $? -eq 0 ]; then
    echo "Arhiva je uspješno stvorena."
else
    echo "Greška pri komprimiranju."
    exit 4
fi
