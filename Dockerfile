FROM ghcr.io/biodiversity-cz/php-fpm-noroot-socket:main@sha256:5f6b5d89f58aa062263cfe8acb4c2dd0044fa4a0a6d84fb6243b0e247ca59e0e
LABEL org.opencontainers.image.source=https://github.com/biodiversity-cz/landing-page
LABEL org.opencontainers.image.description="Landing page for biodiversity.cz"
ARG GIT_TAG
ENV GIT_TAG=$GIT_TAG

# devoted for Kubernetes, where the app has to be copied into final destination (/app) after the container starts
COPY  --chown=www:www htdocs /app
RUN chmod -R 777 /app/temp

## use in case you want to run in docker on local machine
#COPY htdocs /var/www/html
