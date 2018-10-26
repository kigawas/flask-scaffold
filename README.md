# flask-scaffold

[![Docker Build Status](https://img.shields.io/docker/build/kigawas/flask-scaffold.svg)](https://hub.docker.com/r/kigawas/flask-scaffold/)

A scaffold to speed up launching a flask project, set up with [minimal dependencies](https://github.com/kigawas/flask-scaffold/blob/master/requirements-dev.txt).

You can just remove `LICENSE` and `.vscode/` files as long as you want. There is no silver bullet, so if you prefer other libraries or practice, you can change anything if it'll fit your requirements better.

## Prerequisites

-   Python 3.5+ (Try type hint please!).

-   Supposing `virtualenv` is installed, if not, run `[sudo] pip3 install -U virtualenv` first.

-   (Optional) Docker and docker compose (It's okay if you don't want to use docker.)

## Main features

-   Use blueprints to organize directory structure

-   Colorful logger in terminals, stolen from [tornado](https://github.com/tornadoweb/tornado/blob/master/tornado/log.py)

-   Gunicorn aiohttp server for production use

-   Integrated with static analysis and lint tools like `mypy`, `black`, and `flake8`

## Common tasks

### Create virtual environment with dependencies

    ./create_venv.sh

### Specify development config (with debug mode on)

    export FLASK_ENV=development

### Run development flask server

    flask run

### Run development gunicorn server with aiohttp worker

    gunicorn -b :5000 aioapp:aioapp -k aiohttp.worker.GunicornWebWorker --reload

### Run production gunicorn server (almost same as above)

    ./boot.sh

### Build docker image

    docker build .

### Run with docker compose

    docker-compose up --build

### Format Python code with black

    black . --exclude venv
