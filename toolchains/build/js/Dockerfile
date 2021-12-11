FROM node:17.2.0-alpine3.14
ARG PRETTIER_VERSION=2.5.1
RUN npm install -g prettier@${PRETTIER_VERSION}
ADD toolchain.sh /toolchain.sh
ENTRYPOINT [ "/toolchain.sh" ]
