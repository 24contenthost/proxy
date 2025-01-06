#!/bin/bash

# Проверяем, есть ли сертификаты
if [ ! -f /etc/letsencrypt/live/gallery.24contenthost.ru/fullchain.pem ]; then
    # Если сертификатов нет, получаем их
    echo "Сертификаты не найдены, выполняем запрос Certbot"
    certbot certonly --webroot -w /var/www/webroot --email pttp79@yahoo.com --agree-tos --no-eff-email -d gallery.24contenthost.ru
fi

# Запускаем Nginx
echo "Запускаем Nginx"
nginx -g "daemon off;"
