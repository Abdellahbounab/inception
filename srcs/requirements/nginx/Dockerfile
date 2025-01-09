FROM debian:12

RUN apt-get update && apt-get install nginx openssl -y

COPY ./conf/nginx.conf /etc/nginx/


RUN mkdir -p /etc/nginx/ssl && \
		openssl req -x509 -nodes -days 365 \
			-newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key \
			-out /etc/nginx/ssl/nginx.crt \
			-subj "/CN=abounab.42.fr"

# COPY ./tools/* /etc/nginx/ssl/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
