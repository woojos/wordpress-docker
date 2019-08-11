#!/bin/bash
sleep 10
wp core install --url=127.0.0.1 --title=GetResponseShop --admin_user=$WP_LOGIN --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL
wp plugin install woocommerce
wp plugin install amazon-s3-and-cloudfront --activate
wp plugin install getresponse-integration --activate
echo update wp-config data
sed -i "20i define( 'AS3CF_SETTINGS', serialize(array('provider' => 'aws', 'access-key-id' => '${S3_ACCESS_KEY}', 'secret-access-key' => '${S3_SECRET_KEY}')));" wp-config.php
mysql -uroot -proot -hdb wordpress < init.sql