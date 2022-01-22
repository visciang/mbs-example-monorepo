FROM node:17.2.0-alpine3.14
ARG PRETTIER_VERSION=2.5.1
RUN wget -qO- https://get.pnpm.io/v6.16.js | node - add --global pnpm@6
RUN pnpm install --global prettier@${PRETTIER_VERSION}
ADD toolchain.sh /toolchain.sh
ENTRYPOINT [ "/toolchain.sh" ]
