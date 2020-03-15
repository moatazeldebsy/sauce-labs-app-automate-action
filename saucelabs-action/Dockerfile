FROM ubuntu:latest

ADD entrypoint.sh /entrypoint.sh
RUN apt-get update
RUN apt-get install wget
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]