# Magento 2.4.x Docker for AEM project

Using this docker project you can initiate a new project or import the existent one.

## Preparation
1. Open https://www.docker.com/
1. Register new account or login with an existent one
1. Download and install docker app

## What services are inside this docker setup?
1. NGINX
2. PHP
3. MariaDB
4. Varnish
5. ElasticSearch
6. Redis

### PHP Xdebug
Xdebug is installed during docker compose. But, due to heavy performance
implications by default this is kept disabled.
However, to enable Xdebug, in `.env` file set `DISABLE_XDEBUG=false`.

## How to create SSL certificates for local machine?
1. In Mac OS, follow this guide to create local SSL certificates
   https://matthewhoelter.com/2019/10/21/how-to-setup-https-on-your-local-development-environment-localhost-in-minutes.html

OR

2. In `nginx/Dockerfile` uncomment the lines **after** it says:
>Uncomment the following lines if you want to generate SSl certificates during docker compose build

## Install Magento
1. Import "magento2-docker" repository
2. Open "magento2-docker" folder in terminal app
3. Create "magento" folder:
   `mkdir magento`
4. Run `ifconfig` to retrieve host machine's IP address.
5. Update the `magento.local.conf` file's `proxy_pass` directive with the retrieved
   IP address. Optionally, if you intend setting up multistore then you would
   also need to update `magentodede.local.conf` file.
6. Build and run all docker components:
   `docker-compose up --build -d`
7. After configuration is build and running open a new terminal tab and connect to php container:
   `docker exec -it %PHP_CONTAINER_ID% bash`
   You can easily get any container name via:
   `docker ps`
8. Open "magento" folder and verify that the folder is empty:
   `cd /var/www/magento; ls -la`
9. Choose your approach below and install the project

10.1 If you want to install a vanilla Magento instance you need to go to https://devdocs.magento.com/guides/v2.4/install-gde/composer.html
and create a new project to the current directory.

Example:
`composer create-project --repository=https://repo.magento.com/ magento/project-enterprise-edition .`

10.2 If you want to install an existent project you need to clone project repository to the "magento" folder:
`git clone <--project_repository_url--> .`

When prompted, enter your Magento authentication keys.

11. Once composer install is done run Magento install command:
```shell
php bin/magento setup:install \
        --db-host=db \
        --db-name=magento \
        --db-user=magento \
        --db-password=123123q \
        --base-url=https://magento.local:8443/ \
        --backend-frontname=admin \
        --admin-user=admin \
        --admin-password=123123q \
        --admin-email=admin@test.com \
        --admin-firstname=Magento \
        --admin-lastname=User \
        --language=en_US \
        --currency=USD \
        --timezone=America/Chicago \
        --skip-db-validation \
        --elasticsearch-host=elasticsearch 
        --elasticsearch-port=9200
    && chown -R www-data:www-data .
```

12. Update your laptop hosts file: `127.0.0.1 magento.local`

13. Open http://magento.local:8443/

## Using Redis for session and cache
Connect to php container via ssh and run the following commands:
```shell
php bin/magento setup:config:set --session-save=redis --session-save-redis-host="redis" --session-save-redis-port=6379 --session-save-redis-db=1
php bin/magento setup:config:set --cache-backend=redis --cache-backend-redis-server="redis" --cache-backend-redis-port=6379 --cache-backend-redis-db=2
```

For connecting to container via SSH you have to use the command:
`docker exec -it %CONTAINER_ID% bash`

## Reloading services

### Reload ngnix
```
docker exec -it %WEB_CONTAINER_ID% /etc/init.d/nginx reload
```

### Reload php
```
docker-compose restart %PHP_CONTAINER_ID%
```

## Connect to MySQL from your laptop
You're able to connect to MySQL using "0.0.0.0" as host, port should be
"3308", credentials from .env file

## Using MailHog for sending emails
You're able to find all the email you send from Magento instance on http://localhost:8026/

## Switch to PHP 7.x
1. Shutdown your current docker instance.
2. Change PHP version in ./php/Docker file to needed version.

Example:
If you need to change PHP version from 7.3 to 7.4 you need to update
`FROM php:7.3-fpm-buster` to `FROM php:7.4-fpm-buster`

3. Build and run all docker components:
   `docker-compose up --build -d`