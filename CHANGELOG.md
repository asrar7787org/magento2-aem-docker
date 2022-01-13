# Changelog

## [3.0.0] - 2022-01-06
- Added Varnish container.
- Updated Dockerfiles for nginx, php containers.
- Updated docker-compose.yml with relevant services.
- Updated nginx, db, varnish, mailhog service containers' host port address 
  allocation to mitigate conflicts with existing services.
- Added nginx vhost configuration files to support Dockerfile 
generated SSL certificates. 

## [2.0.5] - 2020-02-06
### Added
- Added SSL configuration to nginx config
- Added n98-magerun2
- Added https://github.com/hirak/prestissimo
- Added msmtp instead of outdated ssmtp 

###  Updated
- Replaced mariadb by mysql due to crash issues

## [2.0.4] - 2019-03-06
### Added
- .env file

## [2.0.3] - 2019-03-05
### Added
- Cache for volumes

## [2.0.2] - 2019-03-05
### Added
- Documentation for Redis configuration

## [2.0.1] - 2019-03-05
### Updated
- Documentation

## [2.0.0] - 2019-03-05
### Added
- MailHog container
- Redis container
- Container names
- Certificate generation for web container
- healthcheck for db container

### Updated
- Documentation
- Renamed hostname

## [1.0.0] - 2018-08-15
### Added
- CHANGELOG.md file to keep changes between versions.
- README.md file for repository description.
- docker-compose.yml file with directives to run required containers.
- php/Dockerfile with instructions to raise php-fpm with required extensions and scripts to install Magento2 instance.
- nginx/Dockerfile to raise latest nginx image and copy configuration file from host to container.
- nginx/conf/test.com.conf file with required nginx configuration to run Magento2 instance.
