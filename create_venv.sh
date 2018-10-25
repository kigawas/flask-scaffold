#!/bin/sh
virtualenv venv -p python3 && source venv/bin/activate && pip install -r requirements-dev.txt
