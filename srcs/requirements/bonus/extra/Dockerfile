FROM debian:11

# Install necessary dependencies
RUN apt-get update && apt-get install -y wget

RUN apt-get update && apt-get install -y\
    tar \
    ca-certificates

# Download and install Portainer
RUN wget https://github.com/portainer/portainer/releases/download/2.17.0/portainer-2.17.0-linux-amd64.tar.gz -O /tmp/portainer.tar.gz && \
    tar -xzvf /tmp/portainer.tar.gz -C /tmp  && \
    rm /tmp/portainer.tar.gz

RUN chmod +x /tmp/portainer/portainer

EXPOSE 9000

CMD ["/tmp/portainer/portainer"]
