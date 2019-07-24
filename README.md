# flask-scaffold

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/81fa5c454ada4729bdbc3c1d8b2722bd)](https://app.codacy.com/app/kigawas/flask-scaffold?utm_source=github.com&utm_medium=referral&utm_content=kigawas/flask-scaffold&utm_campaign=Badge_Grade_Dashboard)
[![Circle CI](https://img.shields.io/circleci/project/github/kigawas/flask-scaffold.svg)](https://circleci.com/gh/kigawas/flask-scaffold)
[![Docker Build Status](https://img.shields.io/docker/build/kigawas/flask-scaffold.svg)](https://hub.docker.com/r/kigawas/flask-scaffold/)
[![License](https://img.shields.io/github/license/kigawas/flask-scaffold.svg)](https://github.com/kigawas/flask-scaffold)

A scaffold to speed up launching a flask project, set up with [minimal dependencies](https://github.com/kigawas/flask-scaffold/blob/master/requirements-dev.txt).

You can just remove `LICENSE`, `.git/`, and `.vscode/` files whenever it's necessary.

There is no silver bullet, so if you prefer other libraries or practice, you can add or change anything as you like.

## Prerequisites

-   Python 3.5+ (To support type hint)

-   (Optional) Docker and docker compose

## Main features

-   Blueprint templates to organize directory structure
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
