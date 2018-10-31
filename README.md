# flask-scaffold

[![Docker Build Status](https://img.shields.io/docker/build/kigawas/flask-scaffold.svg)](https://hub.docker.com/r/kigawas/flask-scaffold/)

[![Circle CI](https://img.shields.io/circleci/project/github/kigawas/flask-scaffold.svg)](https://circleci.com/gh/kigawas/flask-scaffold>)

A scaffold to speed up launching a flask project, set up with [minimal dependencies](https://github.com/kigawas/flask-scaffold/blob/master/requirements-dev.txt).

You can just remove `LICENSE`, `.git/`, and `.vscode/` files whenever it's necessary.

There is no silver bullet, so if you prefer other libraries or practice, you can change anything if you feel there is a better choice.

## Prerequisites

-   Python 3.5+ (Try type hint please!)

-   (Optional) Docker and docker compose (It's okay if you don't want to use docker)

## Main features

-   Use blueprints to organize directory structure

-   Colorful logger in terminals, stolen from [tornado](https://github.com/tornadoweb/tornado/blob/master/tornado/log.py)

-   Gunicorn aiohttp server for production use

-   Integrated with static analysis and lint tools like `mypy`, `black`, `flake8` and git hook tool [`pre-commit`](https://pre-commit.com/#intro)

-   [Circle CI](https://circleci.com/gh/kigawas/flask-scaffold/) and [Heroku](https://scaffold-flask.herokuapp.com/) configuration

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

### Run git pre-commit hooks

    pre-commit run --all-files
