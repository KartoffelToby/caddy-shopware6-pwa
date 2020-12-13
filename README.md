# caddy-shopware6-pwa
A Docker Compose Template for Shopware 6 With PWA Storefront in a Caddy-PHP Server setup with LetsEncrypted, HTTP/3 TLS 1.3 Support

**Setup shopware.local point to 127.0.0.1**

## RUN DEV
```
$ docker-compose up -d
$ docker-compose exec shopware bash
$ composer install
$ bin/console system:install --create-database --basic-setup
$ bin/console plugin:refresh
$ bin/console plugin:install --activate SwagShopwarePwa
$ bin/console cache:clear
$ bin/console dal:refresh:index
$ exit
```
Goto https://shopware.local/admin -> Copy the API access Token from Sales Channel Storefront to data/storefront/shopware-pwa.config.js
```$ docker-compose restart```

Wait for Nuxt JS warmup, Enjoy Storefront PWA on shopware.local -> shopware.local/admin points to Shopware backend.

## RUN PROD

Edit the Caddyfile or ENV in docker-compose.yml to your prod Domain, change "tls internal" to "tls your@le-emal.de" in Caddyfile. Rebuild the Image.
