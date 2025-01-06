# Используем образ с Nginx
FROM nginx:latest

# Устанавливаем Certbot
RUN apt-get update && \
    apt-get install -y certbot curl && \
    apt-get clean

# Копируем конфигурации Nginx и веб-корень
COPY nginx.conf /etc/nginx/nginx.conf


RUN mkdir -p /etc/letsencrypt/live /etc/letsencrypt/archive /etc/letsencrypt/renewal

RUN mkdir -p /var/www/webroot

RUN chown -R www-data:www-data /etc/letsencrypt /var/www/webroot && \
    chmod -R 755 /etc/letsencrypt /var/www/webroot

# Копируем скрипт старта
COPY start.sh /start.sh

# Делаем скрипт исполнимым
RUN chmod +x /start.sh

# Устанавливаем точку входа
ENTRYPOINT ["/start.sh"]

# Открываем порты
EXPOSE 80 443
