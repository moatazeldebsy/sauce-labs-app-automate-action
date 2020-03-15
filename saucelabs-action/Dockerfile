FROM alpine:3.10
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN echo $1

ENTRYPOINT ["/entrypoint.sh"]