FROM python:3.9-alpine

ENV USER scaffold
ENV HOME /home/$USER

RUN apk update && apk add --update sudo curl postgresql-dev && \
    python -m pip install -U pip --no-cache-dir

RUN adduser -D $USER \
    && echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
    && chmod 0440 /etc/sudoers.d/$USER

USER $USER
WORKDIR $HOME

COPY --chown=scaffold:scaffold app app
COPY --chown=scaffold:scaffold migrations migrations
COPY --chown=scaffold:scaffold *.py *.toml *.sh ./

RUN sudo apk add --virtual .build-deps gcc g++ libffi-dev musl-dev && \
    curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python && \
    $HOME/.poetry/bin/poetry install --no-dev && \
    sudo apk --purge del .build-deps

EXPOSE 5000
CMD ["./boot.sh"]
