FROM alpine

MAINTAINER Patrick D'appollonio <patrick@dappollonio.us>

RUN apk --update add --no-cache openssl curl
ENV LANG en_US.UTF-8
