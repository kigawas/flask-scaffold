#!/bin/sh
python3 -m venv venv && venv/bin/pip install -U pip && source venv/bin/activate && poetry install && venv/bin/pre-commit install
