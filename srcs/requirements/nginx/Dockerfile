FROM debian:12

RUN apt-get update && apt-get install nginx -y

COPY ./conf/nginx.conf /etc/nginx/

COPY ./tools/* /etc/nginx/ssl/

RUN mv /var/www/html/index.nginx-debian.html /var/www/html/index.html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
