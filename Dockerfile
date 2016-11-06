FROM alpine:3.4

MAINTAINER zweizeichen@element-43.com

#
# This is the basic build container for Element43's Elixir-based projects
#

ENV ELIXIR_VERSION=1.3.4
COPY . /root/build

RUN printf "http://mirror.leaseweb.com/alpine/v3.4/main\nhttp://mirror.leaseweb.com/alpine/v3.4/community" > etc/apk/repositories && \
    apk update && \
    apk upgrade && \
    apk add bzip2-dev libstdc++ erlang erlang-crypto erlang-syntax-tools erlang-parsetools \
      erlang-inets erlang-ssl erlang-public-key erlang-eunit erlang-asn1 erlang-sasl \
      erlang-erl-interface && \
    apk add --virtual build-deps erlang-dev curl wget git gcc g++ make libc-dev libgcc \
      ca-certificates && \
    wget --no-check-certificate https://github.com/elixir-lang/elixir/releases/download/v${ELIXIR_VERSION}/Precompiled.zip && \
    mkdir -p /usr/local && \
    unzip Precompiled.zip -d /usr/local && \
    rm Precompiled.zip && \
    mix local.hex --force && \
    mix local.rebar --force

WORKDIR /root/build
