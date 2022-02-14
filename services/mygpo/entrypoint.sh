#!/bin/bash -e

cd /app || exit 1
mkdir -p env/dev
echo django.core.mail.backends.console.EmailBackend > envs/dev/EMAIL_BACKEND
echo secret > envs/dev/SECRET_KEY
echo postgres://mygpo:mygpo@localhost/mygpo > envs/dev/DATABASE_URL
echo True > envs/dev/DEBUG
echo "127.0.0.1" > envs/dev/INTERNAL_IPS
mkdir -p /tmp/mygpo-test-media
echo /tmp/mygpo-test-media > envs/dev/MEDIA_ROOT
envdir env/dev python manage.py migrate
envdir envs/dev python manage.py runserver

envdir envs/dev python manage.py runserver