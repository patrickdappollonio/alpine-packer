# Pull base image.
FROM alpine
MAINTAINER Patrick D'appollonio <patrick@dappollonio.us>

# ENV http_proxy http://web-proxy.corp.hpecorp.net:8080
# ENV https_proxy http://web-proxy.corp.hpecorp.net:8080

RUN apk --update add --no-cache openssl curl
ENV LANG en_US.UTF-8
