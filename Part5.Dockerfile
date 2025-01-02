FROM nginx:latest

LABEL maintainer=sharellc

WORKDIR /home

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./server/server.c .
COPY ./server/entrypoint.sh .

RUN apt-get update; \
    apt-get install -y gcc spawn-fcgi curl libfcgi-dev; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /home; \
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid; \
    chmod 0755 entrypoint.sh; \
    chmod u-s /bin/su; \
    chmod u-s /usr/bin/newgrp; \
    chmod u-s /usr/bin/passwd; \
    chmod u-s /usr/bin/gpasswd; \
    chmod u-s /bin/umount; \
    chmod u-s /usr/bin/chfn; \
    chmod u-s /usr/bin/chsh; \
    chmod u-s /bin/mount; \
    chmod g-s /usr/bin/expiry; \
    chmod g-s /usr/bin/chage; \
    chmod g-s /sbin/unix_chkpwd; \
    apt-get clear; \
    rm -rf /var/lib/apt/lists

USER nginx

HEALTHCHECK --interval=5m --timeout=3s CMD curl -f http://localhost/ || exit 1

ENTRYPOINT ["sh", "entrypoint.sh"]