#!/usr/bin/env bash
set -ex

chown -R "$APP_USER:$APP_GROUP" /app/www

/app/bin/generate_wp_config.sh

# Resets database options to environment variable, such as:
# siteurl, home, blogname etc
[[ ${WP_SET_OPTIONS_ON_BOOT} = "true" ]] && /app/bin/set_wp_options.sh

if [[ ${WP_REDIS_ENABLED} = "true" ]]
then
  # Install WP-Redis object cache file if exist
  [[ -f /app/www/wp-content/plugins/wp-redis/object-cache.php ]] && wp redis enable
else
  [[ -f /app/www/wp-content/object-cache.php ]] && rm -f /app/www/wp-content/object-cache.php
fi

echo "OK"
exit 0
