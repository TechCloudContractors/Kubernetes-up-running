
# [Choice] Alpine version: 3.14, 3.13, 3.12, 3.11
# https://github.com/GoogleCloudPlatform/cloud-sdk-docker/blob/master/debian_component_based/Dockerfile
ARG VARIANT="3.14"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-alpine-${VARIANT}

ENV CLOUD_SDK_VERSION="360.0.0"
ENV TERRAFORM_VERSION="1.0.8"

RUN apk --no-cache add \
        curl \
        python3 \
        py3-crcmod \
        bash \
        libc6-compat \
        openssh-client \
        git \
        gnupg

# Install gcloud
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz -C /opt/ && \
    rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    ln -s /opt/google-cloud-sdk/bin/gcloud /usr/bin/gcloud && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true

# Install Terraform
RUN curl -O https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
            unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /opt && \
            rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
            ln -s /opt/terraform /usr/bin/terraform