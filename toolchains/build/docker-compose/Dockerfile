FROM docker:20.10.7
RUN apk add --no-cache docker-compose
ADD toolchain.sh /toolchain.sh
ENTRYPOINT [ "/toolchain.sh" ]
