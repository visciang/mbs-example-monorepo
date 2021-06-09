FROM alpine:3.13

RUN apk add --no-cache "cmake>3.18" make gcc g++ libc-dev

ADD toolchain.sh /toolchain.sh

ENV PATH="/usr/bin/cmake/bin:${PATH}"

ENTRYPOINT [ "/toolchain.sh" ]
