#!/usr/bin/env bash

until cd src
do
    echo "Waiting for django volume..."
done

until python manage.py migrate --settings=minvoice.settings.dev_docker
do
    echo "Waiting for postgres ready..."
    sleep 2
done

python manage.py loaddata fixtures.json --settings=minvoice.settings.dev_docker
python manage.py runserver 0.0.0.0:8001 --settings=minvoice.settings.dev_docker
