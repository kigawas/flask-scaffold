# flask-scaffold

A scaffold to speed up launching a flask project.

You can remove LISENCE if you want.

## Create virtual environment with dependencies

    ./create_venv.sh

## Use development config (with debug mode on)

    export FLASK_ENV=development

## Run flask server

    flask run

## Run gunicorn server

    ./boot.sh

## Build docker image

    docker build .

## Run in docker

    docker compose up --build
