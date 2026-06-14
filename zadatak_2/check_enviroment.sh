#!/bin/bash

racunalo=$(hostname)
if [ "$racunalo" = "DESKTOP-PGJ98K8" ]; then
echo "Nalazim se na domaćinu." 
elif [ "$racunalo" = "ubuntuserver" ]; then
echo "Nalazim se u virtualnom stroju."
else
echo "Nalaziim se u nepoznatom sustavu."
fi
