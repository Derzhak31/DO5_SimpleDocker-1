#!/bin/bash

service nginx start
gcc server.c -o serv -lfcgi
spawn-fcgi -p 8080 ./serv
while true; do
    sleep 1
done