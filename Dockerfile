FROM resin/raspberry-pi2-alpine:latest
MAINTAINER Jason Wilder <mail@jasonwilder.com>

RUN [ "cross-build-start"]

RUN apk -U add openssl

ENV VERSION 0.7.3
ENV DOWNLOAD_URL https://github.com/jwilder/docker-gen/releases/download/$VERSION/docker-gen-linux-armhf-$VERSION.tar.gz
ENV DOCKER_HOST unix:///tmp/docker.sock

RUN wget -qO- $DOWNLOAD_URL | tar xvz -C /usr/local/bin

ENTRYPOINT ["/usr/local/bin/docker-gen"]

RUN [ "cross-build-end"]
