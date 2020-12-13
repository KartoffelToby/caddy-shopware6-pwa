FROM alpine:edge
MAINTAINER Tobias Haber <kontakt@t-haber.de>

# Packages
RUN apk --update --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing add \
    git \
    tar \
    bash \
    libressl3.1-libssl \
    php7-fpm \
    php7-cgi \
    curl \
    wget \
    openssh-client \
    ca-certificates \
    shadow \
    unzip \
    php7-curl \
    php7-dom \
    php7-gd \
    php7-ctype \
    php7-zip \
    php7-simplexml \
    php7-xml \
    php7-iconv \
    php7-sqlite3 \
    php7-pdo_sqlite \
    php7-mysqli \
    php7-pgsql \
    php7-json \
    php7-phar \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-session \
    php7-fileinfo \
    php7-ftp \
    php7-xmlwriter \
    php7-intl \
    php7-mbstring \
    php7-bcmath \
    php7-zlib \
    php7-tokenizer \
    && rm -rf /var/cache/apk/* \
    && { \
            echo 'opcache.memory_consumption=512'; \
            echo 'opcache.interned_strings_buffer=8'; \
            echo 'opcache.max_accelerated_files=4000'; \
            echo 'opcache.revalidate_freq=2'; \
            echo 'opcache.fast_shutdown=1'; \
            echo 'memory_limit=2048m'; \
            echo 'max_execution_time=600'; \
        } > /etc/php7/conf.d/opcache-recommended.ini

# Util
RUN ln -sf /usr/bin/php7 /usr/bin/php
RUN ln -sf /usr/sbin/php-fpm7 /usr/bin/php-fpm

# composer
RUN curl --silent --show-error --fail --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" \
      "https://getcomposer.org/installer" \
    | php -- --install-dir=/usr/bin --filename=composer

# allow environment variable access.
RUN echo "clear_env = no" >> /etc/php7/php-fpm.conf
RUN mkdir -p /var/www

EXPOSE 80 443 8080
VOLUME /root/.caddy /var/www
WORKDIR /var/www

ADD php-fpm.conf /etc/php7/php-fpm.conf
COPY Caddyfile /etc/Caddyfile
COPY caddy /usr/bin/caddy
COPY start.sh /usr/bin/start
RUN chmod +x /usr/bin/caddy /usr/bin/start


CMD ["/usr/bin/start"]