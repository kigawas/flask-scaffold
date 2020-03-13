FROM python:3.7-alpine

ENV USER scaffold
ENV HOME /home/$USER
ENV DATABASE_URL
ENV REDIS_URL

RUN apk update && apk add --update sudo curl && \
    python -m pip install -U pip --no-cache-dir

RUN adduser -D $USER \
    && echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
    && chmod 0440 /etc/sudoers.d/$USER

USER $USER
WORKDIR $HOME

COPY --chown=scaffold:scaffold app app
COPY --chown=scaffold:scaffold *.py *.toml *.sh ./

RUN sudo apk add --virtual .build-deps gcc libffi-dev musl-dev postgresql-dev && \
    curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python && \
    $HOME/.poetry/bin/poetry install --no-dev && \
    sudo apk --purge del .build-deps

EXPOSE 5000
CMD ["./boot.sh"]
