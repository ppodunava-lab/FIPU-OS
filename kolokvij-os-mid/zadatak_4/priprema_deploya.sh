#!/bin/bash
if [ "$#" - ne 2 ]; then
echo "Neispravan broj argumenata! Očekuju se 2 argumenta."
exit 1
fi
if [ ! -d "$1" ]; then
echo "Putanja $1 ne postoji!"
exit 1
fi
if [ ! -d "$2" ]; then
echo "Putanja $2 ne postoji!"
exit 1
fi
izvor=$1
odredište=$2
pripremi_deploy() {
mkdir "$odrediste/deploy_paket"
mkdir "$odrediste/deploy_paket/app"
mkdir "$odrediste/deploy_paket/public"
cp "$izvor"/app/*.js "$odrediste/deploy_paket/app"
cp "$izvor"/static/*.css "$odrediste/deploy_paket/app"
cp "$izvor"/uploads/* "$odrediste/deploy_paket/public"
echo "SECRET_KEY=<secret_key>" > "$odrediste/deploy_paket/.deploy.env.template"
echo "DATABASE_URL=<db_url>" >> "$odrediste/deploy_paket/.depoly.env.template"
}
pripremi_deploy
if [ "$?" -eq 0 ]; then
echo "Deploy paket uspješno je pripremljen u $odrediste/deploy_paket."
else
echo "Greška pri pripremi deploy paketa."
fi

