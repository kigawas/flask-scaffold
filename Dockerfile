FROM python:3.7-alpine

WORKDIR /home/scaffold
COPY app app
COPY *.py *.txt boot.sh ./

RUN apk update && apk add --virtual .build-deps gcc musl-dev postgresql-dev && \
    python -m pip install -U pip gunicorn --no-cache-dir && \
    python -m pip install -r requirements.txt --no-cache-dir && \
    apk --purge del .build-deps && adduser -D scaffold && chmod +x boot.sh && \
    chown -R scaffold:scaffold ./

USER scaffold
EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
