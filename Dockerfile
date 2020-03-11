FROM python:3.7-alpine

COPY app app
COPY *.py *.toml *.sh ./

RUN apk update && apk add --virtual .build-deps gcc curl libffi-dev musl-dev postgresql-dev && \
    python -m pip install -U pip --no-cache-dir && \
    curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python && \
    $HOME/.poetry/bin/poetry install --no-dev && \
    apk --purge del .build-deps

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
