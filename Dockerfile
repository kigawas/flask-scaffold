FROM python:3.7-alpine

WORKDIR /home/scaffold
COPY app app
COPY *.py *.txt boot.sh ./

RUN apk update && apk add --no-cache gcc musl-dev gmp-dev libffi-dev make
RUN python -m venv venv && venv/bin/pip install -U pip && venv/bin/pip install -r requirements.txt && venv/bin/pip install gunicorn
RUN adduser -D scaffold && chmod +x boot.sh && chown -R scaffold:scaffold ./

USER scaffold
EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
