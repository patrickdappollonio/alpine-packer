FROM alpine
LABEL maintainer "Patrick D'appollonio <patrick@dappollonio.us>"

# Env setup
ENV PACKER_VERSION=0.12.2 \
    PACKER_OSNAME=linux \
    PACKER_OSARCH=amd64 \
    PACKER_DEST=/usr/local/sbin

# Packer path setup
ENV PACKER_ZIPFILE=packer_${PACKER_VERSION}_${PACKER_OSNAME}_${PACKER_OSARCH}.zip \
    PACKER_URL=https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_${PACKER_OSNAME}_${PACKER_OSARCH}.zip

# Install bash
RUN apk add --no-cache bash

# Install packer in path
ADD ${PACKER_URL} ${PACKER_DEST}/
RUN unzip ${PACKER_DEST}/${PACKER_ZIPFILE} -d ${PACKER_DEST}
RUN rm -rf ${PACKER_DEST}/${PACKER_ZIPFILE}

# Test packer and omit the exit code
RUN packer version
