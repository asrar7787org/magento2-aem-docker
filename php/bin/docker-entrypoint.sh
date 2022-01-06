#!/bin/bash

[ "$DEBUG" = "true" ] && set -x

if [[ ! -z "$DISABLE_XDEBUG" && "$DISABLE_XDEBUG" = true && -f $PHP_INI_DIR/conf.d/zz-xdebug.ini ]]; then

mv $PHP_INI_DIR/conf.d/zz-xdebug.ini $PHP_INI_DIR/conf.d/zz-xdebug.ini.back
mv $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini.back

cat >&2 <<EOF
echo "xDebug is disabled"
EOF

elif [[ -z "$DISABLE_XDEBUG" || "$DISABLE_XDEBUG" = false && -f $PHP_INI_DIR/conf.d/zz-xdebug.ini ]]; then
mv $PHP_INI_DIR/conf.d/zz-xdebug.ini.back $PHP_INI_DIR/conf.d/zz-xdebug.ini
mv $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini.back $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini
fi

exec "$@"

