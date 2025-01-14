FROM debian:11

RUN apt-get update && apt-get install -y vsftpd

COPY ./tools/vsftpd.conf /etc/vsftpd.conf

RUN mkdir -p /var/run/vsftpd/empty \
	&& chmod a-w /var/run/vsftpd/empty

RUN useradd -d /home/ftp -m abounab && echo "abounab:abounab" | chpasswd

RUN chown -R abounab:abounab /home/ftp && \
	chmod -R 777 /home/ftp

EXPOSE 21

# ENTRYPOINT [ "yes" ]

CMD ["vsftpd", "/etc/vsftpd.conf"]