FROM debian:12

RUN apt update && apt upgrade \
	apt install --no-cache nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
