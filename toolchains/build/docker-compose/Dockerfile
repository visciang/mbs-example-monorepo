FROM docker:20.10.11
RUN mkdir -p /usr/local/lib/docker/cli-plugins/ \
    && wget -q -O /usr/local/lib/docker/cli-plugins/docker-compose \
       "https://github.com/docker/compose/releases/download/v2.2.2/docker-compose-linux-x86_64" \
    && chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
ADD toolchain.sh /toolchain.sh
ENTRYPOINT [ "/toolchain.sh" ]
