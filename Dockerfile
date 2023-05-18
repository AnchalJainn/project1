FROM devopsedu/webapp

RUN rm -rf /var/www/html/*
COPY website /var/www/html

EXPOSE 8080

CMD apachectl -D FOREGROUND