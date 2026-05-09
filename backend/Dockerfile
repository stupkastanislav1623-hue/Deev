FROM php:8.2-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql mysqli

COPY . /var/www/html/

RUN chown -R www-data:www-data /var/www/html

EXPOSE 9000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD php -r "exit(0);"

CMD ["php-fpm"]
