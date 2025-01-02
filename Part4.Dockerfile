FROM nginx:latest

LABEL maintainer=sharellc

WORKDIR /home

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./server/server.c .
COPY ./server/entrypoint.sh .

RUN apt-get update && apt-get install -y gcc spawn-fcgi curl libfcgi-dev && chmod +x entrypoint.sh