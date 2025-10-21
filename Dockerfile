FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
        nginx \
        ca-certificates \
        curl \
    && apt clean && rm -rf /var/lib/apt/lists/*
ENV LANG=en_US.utf8
RUN useradd -r -u 1001 -g www-data  -d /var/www -s /usr/sbin/nologin appuser \
    && mkdir -p /var/www/html  /var/log/nginx /var/run/nginx \
    && chown -R appuser:www-data /var/www /var/log/nginx /var/run/nginx

RUN mkdir -p /tmp/nginx && chown -R appuser:www-data /tmp/nginx

USER appuser
COPY nginx.conf /etc/nginx/nginx.conf
COPY site.conf /etc/nginx/conf.d/site.conf
COPY index.html /var/www/html/

EXPOSE 8080

HEALTHCHECK CMD curl -fsS http://localhost:8080/ || exit 1
CMD [ "nginx", "-g", "daemon off;" ]
