FROM alpine:3.10

ADD entrypoint.sh /entrypoint.sh
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install zip unzip
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]