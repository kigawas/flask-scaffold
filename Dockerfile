FROM python:3.7-alpine

WORKDIR /home/scaffold
COPY app app
COPY *.py *.toml boot.sh ./

RUN apk update && apk add --virtual .build-deps gcc libffi-dev musl-dev postgresql-dev && \
    python -m pip install -U pip poetry --no-cache-dir && \
    poetry install --no-dev && \
    apk --purge del .build-deps && adduser -D scaffold && chmod +x boot.sh && \
    chown -R scaffold:scaffold ./

USER scaffold
EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
