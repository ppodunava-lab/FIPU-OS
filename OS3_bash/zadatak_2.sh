#!/bin/bash
if [ $# -ne 1 ]; then
echo "Potrebno je proslijediti točno 1 argument"
exit 1
fi

BROJ="$1"

if ! [[ "$BROJ" =~ ^[0-9]+$ ]]; then
echo "Argument mora biti broj od 1 do 10"
exit 1
fi

if [ "$BROJ" -lt 1 ] || [ "$BROJ" -gt 10 ]; then
echo "Broj mora biti u rasponu od 1 do 10"
exit 1
fi

niz=()
for (( i=1; i<=BROJ; i++ )); do
niz+=("$i")
done

echo "${niz[@]}" > brojevi.txt
echo "Datoteka brojevi.txt je izrađena"