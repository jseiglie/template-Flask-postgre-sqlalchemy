rm -R -f ./migrations &&
pipenv run init &&
psql -h localhost -U postgres -c 'DROP DATABASE example;' || true &&
psql -h localhost -U postgres -c 'CREATE DATABASE example;' &&
psql -h localhost -U example -c 'CREATE EXTENSION unaccent;' -d example &&
pipenv run migrate &&
pipenv run upgrade