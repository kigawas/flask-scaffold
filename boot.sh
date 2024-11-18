#!/bin/sh
exec $HOME/.local/bin/poetry run gunicorn -b :5000 --access-logfile - --error-logfile - asgi:app -k uvicorn.workers.UvicornWorker
