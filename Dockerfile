FROM ghcr.io/krkabol/php-fpm-noroot-socket:main@sha256:08706b27cc6adce77c2d82eaf740872c705fd14a4b31ef86955c1cdf35cb20a4
LABEL org.opencontainers.image.source=https://github.com/biodiversity-cz/landing-page
LABEL org.opencontainers.image.description="Landing page for biodiversity.cz"
ARG GIT_TAG
ENV GIT_TAG=$GIT_TAG

RUN docker-php-ext-install intl

# devoted for Kubernetes, where the app has to be copied into final destination (/app) after the container starts
COPY  --chown=www:www htdocs /app
RUN chmod -R 777 /app/temp

## use in case you want to run in docker on local machine
#COPY htdocs /var/www/html
