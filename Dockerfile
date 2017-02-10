FROM alpine

LABEL maintainer "Patrick D'appollonio <patrick@dappollonio.us>"

# Env setup
ENV PACKER_VERSION=0.12.2
ENV PACKER_OSNAME=linux
ENV PACKER_OSARCH=amd64


# Install curl with SSL support and unzip
RUN apk --update add --no-cache openssl curl unzip

# Set the language to en_US, encoding to UTF-8
ENV LANG en_US.UTF-8

# Install packer in path
ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_${PACKER_OSNAME}_${PACKER_OSARCH}.zip /tmp/packer.zip
RUN unzip /tmp/packer.zip -d /usr/local/sbin && rm -rf /tmp/packer.zip

# Test packer and omit the exit code
RUN packer version
