FROM ubuntu:focal-20230412

EXPOSE 80

COPY nw.conf /etc/nginx/sites-available/

RUN set -eux \
    && apt update \
    && apt -y install nginx=1.18.0-0ubuntu1.4 \
    && rm -rf /var/lib/apt/lists/* \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && ln -s /etc/nginx/sites-available/nw.conf /etc/nginx/sites-enabled/nw.conf \
    && unlink /etc/nginx/sites-enabled/default

STOPSIGNAL SIGTERM
CMD ["nginx","-g","daemon off;"]
