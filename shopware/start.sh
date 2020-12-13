#!/bin/bash

/usr/bin/php-fpm -D
/usr/bin/caddy run --config /etc/Caddyfile