FROM debian:11

RUN apt-get update && apt-get install nginx openssl -y

COPY ./conf/nginx.conf /etc/nginx/

RUN mkdir -p /etc/nginx/ssl && \
		openssl req -x509 -nodes -days 365 \
			-newkey rsa:2048 -keyout /etc/nginx/ssl/abounab.42.fr.key \
			-out /etc/nginx/ssl/abounab.42.fr.crt \
			-subj "/CN=abounab.42.fr"

EXPOSE 443

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
