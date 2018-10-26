# flask-scaffold

[![Docker Build Status](https://img.shields.io/docker/build/kigawas/flask-scaffold.svg)](https://hub.docker.com/r/kigawas/flask-scaffold/)

A scaffold to speed up launching a flask project.

You can just remove the LICENSE file if you want.

Supposing `virtualenv` is installed, if not, run `[sudo] pip3 install -U virtualenv` first.

## Create virtual environment with dependencies

    ./create_venv.sh

## Specify development config (with debug mode on)

    export FLASK_ENV=development

## Run flask server

    flask run

## Run gunicorn server

    ./boot.sh

## Build docker image

    docker build .

## Run in docker

    docker compose up --build
