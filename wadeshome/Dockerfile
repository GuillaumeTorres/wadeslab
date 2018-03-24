FROM httpd:2.4

COPY ./src/index.html /app/

COPY ./src/httpd.conf /usr/local/apache2/conf/httpd.conf

CMD ["httpd-foreground"]