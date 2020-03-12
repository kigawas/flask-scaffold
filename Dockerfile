FROM python:3.7-alpine

ARG USER=default
ENV HOME /home/$USER

RUN apk add --update sudo && \
    python -m pip install -U pip --no-cache-dir

RUN adduser -D $USER \
    && echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
    && chmod 0440 /etc/sudoers.d/$USER

USER $USER
WORKDIR $HOME

COPY --chown=$HOME:$HOME app app
COPY --chown=$HOME:$HOME *.py *.toml *.sh ./

RUN apk update && apk add --virtual .build-deps gcc curl libffi-dev musl-dev postgresql-dev && \
    curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python && \
    $HOME/.poetry/bin/poetry install --no-dev && \
    apk --purge del .build-deps

EXPOSE 5000
CMD ["./boot.sh"]
