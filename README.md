# flask-scaffold

[![Docker Build Status](https://img.shields.io/docker/build/kigawas/flask-scaffold.svg)](https://hub.docker.com/r/kigawas/flask-scaffold/)

A scaffold to speed up launching a flask project, set up with [minimal dependencies](https://github.com/kigawas/flask-scaffold/blob/master/requirements-dev.txt).

You can just remove the LICENSE file as long as you want.

## Prerequisites

Python 3.5+ (Try type hint please!).

Supposing `virtualenv` is installed, if not, run `[sudo] pip3 install -U virtualenv` first.

## Common tasks

### Create virtual environment with dependencies

    ./create_venv.sh

### Specify development config (with debug mode on)

    export FLASK_ENV=development

## Run development flask server

    flask run

### Run development gunicorn server

    gunicorn -b :5000 aioapp:aioapp -k aiohttp.worker.GunicornWebWorker --reload

### Run production gunicorn server

    ./boot.sh

### Build docker image

    docker build .

### Run with docker compose

    docker compose up --build

### Format Python code with black

    black . --exclude venv
