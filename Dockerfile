FROM alpine
LABEL maintainer "Patrick D'appollonio <patrick@dappollonio.us>"

# Env setup
ENV PACKER_VERSION=0.12.2
ENV PACKER_OSNAME=linux
ENV PACKER_OSARCH=amd64
ENV PACKER_DEST=/usr/local/sbin

# Install bash
RUN apk add --no-cache bash

# Install packer in path
ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_${PACKER_OSNAME}_${PACKER_OSARCH}.zip ${PACKER_DEST}/
RUN unzip ${PACKER_DEST}/packer_${PACKER_VERSION}_${PACKER_OSNAME}_${PACKER_OSARCH}.zip -d ${PACKER_DEST}
RUN rm -rf ${PACKER_DEST}/packer_${PACKER_VERSION}_${PACKER_OSNAME}_${PACKER_OSARCH}.zip

# Test packer and omit the exit code
RUN packer version
