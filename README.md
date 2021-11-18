# flask-scaffold

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/81fa5c454ada4729bdbc3c1d8b2722bd)](https://app.codacy.com/app/kigawas/flask-scaffold)
[![Github Actions](https://img.shields.io/github/checks-status/kigawas/flask-scaffold/master)](https://github.com/kigawas/flask-scaffold/actions)
[![Docker Build Status](https://img.shields.io/docker/cloud/build/kigawas/flask-scaffold.svg)](https://hub.docker.com/r/kigawas/flask-scaffold/)
[![License](https://img.shields.io/github/license/kigawas/flask-scaffold.svg)](https://github.com/kigawas/flask-scaffold)

A scaffold to speed up launching a flask project, set up with [minimal dependencies](https://github.com/kigawas/flask-scaffold/blob/master/pyproject.toml).

You can just remove `LICENSE`, `.git/`, and `.vscode/` files if you don't need them.

There is no silver bullet, so if other libraries or practice are preferred, you can add or change anything as you like.

## Prerequisites

- Python 3.7+

- Poetry

- (Optional) Docker and docker compose

## Main features

- [APIFlask](https://apiflask.com/)
- Blueprint templates to organize directory structure
- Colorful logger in terminals, stolen from [tornado](https://github.com/tornadoweb/tornado/blob/master/tornado/log.py)
- Gunicorn aiohttp server for production use
- Integrated with static analysis and lint tools like `mypy`, `black`, `flake8` and git hook tool [`pre-commit`](https://pre-commit.com/#intro)
- Default [Github Actions](https://github.com/kigawas/flask-scaffold/actions) and [Heroku](https://scaffold-flask.herokuapp.com/) configuration

## Common tasks

### Create virtual environment with dependencies

    python3 -m venv venv && source venv/bin/activate && poetry install

### Specify development config (with debug mode on)

    export FLASK_ENV=development

### Run development flask server

    flask run

### Run development gunicorn server with aiohttp worker

    gunicorn -b :5000 aioapp:aioapp -k aiohttp.worker.GunicornWebWorker --reload

### Run production gunicorn server

    ./boot.sh

### Build docker image

    docker build .

### Run with docker compose

    docker-compose up --build

### Format Python code with black

    black . --exclude venv

### Run git pre-commit hooks

    pre-commit run --all-files
