#!/bin/sh
python3 -m venv venv && venv/bin/pip install -U pip && poetry install && venv/bin/pre-commit install
