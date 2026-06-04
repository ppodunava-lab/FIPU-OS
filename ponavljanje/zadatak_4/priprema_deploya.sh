#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Neispravan broj argumenata! Očekuju se 2 argumenta."
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Putanja $1 ne postoji!"
    exit 2
fi

if [ ! -d "$2" ]; then
    echo "Putanja $2 ne postoji!"
    exit 3
fi

pripremi_deploy() {
    mkdir "$2/deploy_paket"
    mkdir "$2/deploy_paket/app"
    mkdir "$2/deploy_paket/public"

    cp "$1"/app/*.js "$2/deploy_paket/app/"
    cp "$1"/static/*.css "$2/deploy_paket/app/"
    cp "$1"/uploads/* "$2/deploy_paket/public/"

    echo "SECRET_KEY=<secret_key>" > "$2/deploy_paket/.deploy.env.template"
    echo "DATABASE_URL=<db_url>" >> "$2/deploy_paket/.deploy.env.template"
}

pripremi_deploy

if [ $? -eq 0 ]; then
    echo "Deploy paket uspješno je pripremljen u $2/deploy_paket."
else
    echo "Greška pri pripremi deploy paketa."
fi
