FROM rust:1.57.0-alpine3.14
RUN rustup component add rustfmt
ADD toolchain.sh /toolchain.sh
ENTRYPOINT [ "/toolchain.sh" ]