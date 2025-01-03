FROM debian:12

RUN apt-get update && apt-get install nginx -y

EXPOSE 443

CMD ["nginx", "-g", "daemon off"]
