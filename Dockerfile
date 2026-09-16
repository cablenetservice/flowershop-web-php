FROM php:8.2-apache

WORKDIR /var/www/html

COPY . /var/www/html

RUN chown -R www-data:www-data /var/www/html

RUN sed -i 's/Listen 80/Listen ${PORT:-8080}/g' /etc/apache2/ports.conf && \
    sed -i 's/<VirtualHost \*:80>/<VirtualHost *:${PORT:-8080}>/g' /etc/apache2/sites-available/*.conf

EXPOSE 8080

CMD ["sh", "-c", "sed -i \"s/Listen 8080/Listen ${PORT:-8080}/g\" /etc/apache2/ports.conf && apache2-foreground"]
