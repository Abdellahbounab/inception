FROM debian:11

RUN apt-get update && apt-get install nginx openssl -y

COPY tamghart /var/www/html

EXPOSE 80

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
