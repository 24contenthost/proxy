# Используем образ с Nginx
FROM nginx:latest

# Устанавливаем Certbot
RUN apt-get update && \
    apt-get install -y certbot curl && \
    apt-get clean

# Копируем конфигурации Nginx и веб-корень
COPY nginx.conf /etc/nginx/nginx.conf
COPY ./webroot /var/www/certbot

# Копируем скрипт старта
COPY start.sh /start.sh

# Делаем скрипт исполнимым
RUN chmod +x /start.sh

# Устанавливаем точку входа
ENTRYPOINT ["/start.sh"]

# Открываем порты
EXPOSE 80 443
