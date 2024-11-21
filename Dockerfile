ARG NGINX_UNPRIVILEGED_VERSION=1.24.0
FROM nginxinc/nginx-unprivileged:${NGINX_UNPRIVILEGED_VERSION}
LABEL org.opencontainers.image.authors="ottomatic"

## nginx IDs according to unprivileged image
## see : https://github.com/nginxinc/docker-nginx-unprivileged/blob/main/Dockerfile-debian.template#L10C1-L11C12
ARG UID=101
ARG GID=101

## install modules with apt
USER root
RUN apt-get install -y \
    nginx-module-njs \
    && rm -rf /var/lib/apt/lists/*

## forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

USER $UID

