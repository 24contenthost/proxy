#!/bin/bash

# Проверка наличия сертификатов
if [ ! -f /etc/letsencrypt/live/gallery.24contenthost.ru/fullchain.pem ]; then
  echo "Сертификаты не найдены. Запускаем Certbot для их получения..."
  certbot certonly --webroot -w /var/www/certbot --email pttp79@yahoo.com --agree-tos --no-eff-email -d gallery.24contenthost.ru --non-interactive
fi

# Проверка, что сертификаты были получены
if [ ! -f /etc/letsencrypt/live/gallery.24contenthost.ru/fullchain.pem ]; then
  echo "Сертификаты не были созданы. Завершаем."
  exit 1
fi

# Запуск Nginx
echo "Запуск Nginx..."
nginx -g "daemon off;"
