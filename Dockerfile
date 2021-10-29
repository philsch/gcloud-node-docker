ARG GCLOUD_VERSION="362.0.0"
# variant expects "-" prefix
ARG GCLOUD_VARIANT=""

FROM gcr.io/google.com/cloudsdktool/cloud-sdk:${GCLOUD_VERSION}${GCLOUD_VARIANT}

ARG NODEJS_MAIN_VERSION="16.x"
ARG NODEJS_VERSION="16.13.0"

RUN apt-get update
RUN curl -o nodejs.deb https://deb.nodesource.com/node_${NODEJS_MAIN_VERSION}/pool/main/n/nodejs/nodejs_${NODEJS_VERSION}-1nodesource1_amd64.deb
RUN apt-get install -y ./nodejs.deb
RUN rm nodejs.deb
RUN rm -rf /var/lib/apt/lists/*
