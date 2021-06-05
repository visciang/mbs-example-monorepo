FROM elixir:1.12.1-alpine

RUN mix local.rebar --force && mix local.hex --force
ADD toolchain.sh /toolchain.sh

ENTRYPOINT [ "/toolchain.sh" ]