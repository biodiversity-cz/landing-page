FROM ghcr.io/biodiversity-cz/php-fpm-noroot-socket:main@sha256:fb841c0a11d204046b7d4ac0ae2bc4799836942dfb2b8cdce1efb6deda6c8da3
LABEL org.opencontainers.image.source=https://github.com/biodiversity-cz/landing-page
LABEL org.opencontainers.image.description="Landing page for biodiversity.cz"
ARG GIT_TAG
ENV GIT_TAG=$GIT_TAG

# devoted for Kubernetes, where the app has to be copied into final destination (/app) after the container starts
COPY  --chown=www:www htdocs /app
RUN chmod -R 777 /app/temp

## use in case you want to run in docker on local machine
#COPY htdocs /var/www/html
