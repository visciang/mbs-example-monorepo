FROM node:17.2.0-alpine3.14
ARG PRETTIER_VERSION=2.5.1
ARG ESBUILD_VERSION=0.14.13
ARG PNPM_VERSION=6.28.0
RUN wget -qO- https://get.pnpm.io/v6.16.js | node - add --global pnpm@${PNPM_VERSION}
RUN pnpm install --global prettier@${PRETTIER_VERSION}
RUN pnpm install --global esbuild@${ESBUILD_VERSION}
ADD toolchain.sh /toolchain.sh
ENTRYPOINT [ "/toolchain.sh" ]
